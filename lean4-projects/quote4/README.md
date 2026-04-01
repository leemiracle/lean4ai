# Quote4 - 类型安全表达式引用

> **版本**: Master  
> **Stars**: 102  
> **许可证**: Apache-2.0  
> **GitHub**: https://github.com/leanprover-community/quote4

---

## 简介

**Quote4** 为 Lean4 提供直观、类型安全的表达式引用机制,结合了模态逻辑的直观性和 Lean4 元编程的强大功能。

## 快速开始

### 安装

在 `lakefile.toml` 中添加:

```toml
[[require]]
name = "quote4"
scope = "leanprover-community"
rev = "master"
```

### 基础用法

```lean
import Qq
open Qq

-- 构造表达式
def a : Expr := q(42 + 1)

-- 构造类型化表达式
def b : Q(List Nat) := q([1, 2, 3])

-- 反引用
def c (n : Q(Nat)) : Q(Nat) := q($n + 1)
```

## 核心概念

### Q(·) 模态

```lean
-- Q(α) 表示类型为 α 的表达式
def myExpr : Q(Nat) := q(42)

-- 类型的引用
def myType : Q(Type) := Q(Nat)

-- 依赖类型
def myDepType (n : Q(Nat)) : Q(Fin $n) := ...
```

### q(·) 构造器

```lean
-- 基础表达式
def num : Q(Nat) := q(42)

-- 函数应用
def app : Q(Nat) := q(Nat.add 1 2)

-- 反引用变量
def addOne (n : Q(Nat)) : Q(Nat) := q($n + 1)

-- 复杂表达式
def complex (xs : Q(List Nat)) : Q(Nat) := q($xs.length)
```

### 类型规则

#### 引入规则

```
$a₁ : α₁,  ...,  $aₙ : αₙ  ⊢  t : Type
---------------------------------------
a₁ : Q(α₁), ..., aₙ : Q(αₙ)  ⊢  Q(t) : Type
```

#### 消除规则

```
$a₁ : α₁,  ...,  $aₙ : αₙ  ⊢  t : β
------------------------------------
a₁ : Q(α₁), ..., aₙ : Q(αₙ)  ⊢  q(t) : Q(β)
```

## 使用示例

### 1. 类型安全的 mkApp

```lean
import Qq
open Qq

def betterApp {α : Q(Sort u)} {β : Q($α → Sort v)}
  (f : Q((a : α) → $β a)) (a : Q($α)) : Q($β $a) :=
  q($f $a)

-- 使用
#eval betterApp q(Int.toNat) q(42)
```

**优势**:
- 编译为单个 `betaRev` 调用
- 不需要 `MetaM` monad
- 类型安全
- 隐式参数自动填充

### 2. 依赖类型反引用

```lean
import Qq

def d (u : Level) (n : Q(Nat)) 
  (x : Q(Type u × Fin ($n + 1))) : Q(Fin ($n + 3)) :=
  q(⟨$x.2, Nat.lt_of_lt_of_le $x.2.2 (Nat.le_add_right _ 2)⟩)
```

### 3. 元编程

```lean
import Qq

-- 生成大型项
def add_self_37 {α : Type u} [Add α] (a : α) : α :=
  by_elab q return (List.range 36).foldr (init := q($a)) 
    fun _ acc => q($acc + $a)

-- 循环展开
def powerOfTwo (n : Nat) : Nat :=
  (List.range n).foldl (init := 1) fun acc _ => q($acc * 2)
```

### 4. 模式匹配

```lean
import Qq

def analyzeExpr : Q(Expr) → Option Q(Nat)
  | ~q($n + $m) => some q($m + $n)  -- 交换加法
  | ~q($n * 0) => some q(0)
  | ~q(0 * $n) => some q(0)
  | _ => none
```

### 5. 证明生成

```lean
import Qq

-- 尝试证明
def tryProve (n : Q(Nat)) (i : Q(Fin $n)) : Option Q($i > 0) := 
  -- 在非一致上下文中工作
  if h : i.val > 0 then
    some q(⟨i.val, h⟩)
  else
    none
```

## 实现细节

### QQ 类型族

```lean
-- QQ 是底层类型族
def QQ (α : Expr) := Expr

-- e : QQ t 意味着 e 是类型为 t 的表达式
-- (这个不变式不被强制执行,但可以用 QQ.check 检查)
```

### 与 Expr 的关系

```lean
-- Q(α) 定义等于 Expr
example : Q(Nat) = Expr := rfl

-- 但类型系统确保类型安全
def safeAdd (n m : Q(Nat)) : Q(Nat) := q($n + $m)
```

## 高级应用

### 1. 元程序转换

```lean
import Qq

-- 转换存在量化
def turnExistsIntoForall : Q(Prop) → MetaM Q(Prop)
  | ~q(∃ x, $p x) => do
     -- 创建新的反引用函数
     q(∀ x, $(x => turnExistsIntoForall q($p $x)))
  | e => pure e
```

### 2. 策略编写

```lean
import Qq

-- 类型安全的策略
def myTactic (goal : Q(Prop)) : TacticM Q(Prop) := do
  match goal with
  | ~q($p ∧ $q) => q($q ∧ $p)  -- 交换合取
  | ~q($p ∨ $q) => q($q ∨ $p)  -- 交换析取
  | _ => pure goal
```

### 3. 自动证明器

```lean
import Qq

-- 简单的自动证明器
def autoProve : Q(Prop) → MetaM (Option Q(True))
  | ~q(True) => some q(⟨⟩)
  | ~q($p ∧ $q) => do
    match ← autoProve q($p), ← autoProve q($q) with
    | some hp, some hq => some q(⟨$hp, $hq⟩)
    | _, _ => none
  | _ => pure none
```

## 与 Template Haskell 的比较

| 特性 | Quote4 | Template Haskell |
|------|--------|-----------------|
| **类型构造器** | `QQ : Expr → Type` | `Q : Type → Type` |
| **宇宙多态** | ✅ 支持 | ❌ 受限 |
| **依赖类型** | ✅ 完全支持 | ❌ 不支持 |
| **运行时类型** | ✅ 支持 | ❌ 编译时固定 |
| **表达式类型** | `Q(α)` | `Q α` |
| **类型安全** | ✅ 强 | ✅ 弱 |

## 关键优势

1. **类型安全**: 编译时捕获类型错误
2. **宇宙多态**: 支持任意宇宙级别
3. **依赖类型**: 完全支持依赖类型
4. **运行时灵活**: 类型可在运行时确定
5. **高效**: 编译为高效的元程序
6. **直观**: 模态逻辑风格的自然语法

## 常见模式

### 模式匹配

```lean
-- 使用 ~q 进行模式匹配
def simplify : Q(Nat) → Q(Nat)
  | ~q(0 + $n) => n
  | ~q($n + 0) => n
  | e => e
```

### 高阶反引用

```lean
-- 反引用函数
def mapQuote (f : Q(Nat) → Q(Nat)) (n : Q(Nat)) : Q(Nat) :=
  f n

-- 使用
#eval mapQuote (fun n => q($n * 2)) q(21)
```

### 类型类

```lean
-- 在引用中使用类型类
def addGeneric {α : Q(Type u)} [h : Q(Add $α)] 
  (a b : Q($α)) : Q($α) :=
  q($a + $b)
```

## 调试技巧

### 类型检查

```lean
-- 检查引用的类型
#check q(42)  -- Q(Nat)

-- 检查反引用
#check fun (n : Q(Nat)) => q($n + 1)  -- Q(Nat) → Q(Nat)
```

### 追踪

```lean
-- 启用追踪
set_option trace.qq true

-- 查看生成的代码
set_option trace.compiler.ir.result true
```

## 相关资源

- **GitHub**: https://github.com/leanprover-community/quote4
- **论文**: 相关的模态逻辑和引用理论
- **示例**: `QqTest/` 目录中的测试用例
- **社区**: https://leanprover.zulipchat.com

## 常见问题

### Q: 类型推断失败?

**A**: 添加显式类型注解:

```lean
-- 错误
def x := q(42)  -- 不知道类型

-- 正确
def x : Q(Nat) := q(42)
```

### Q: 宇宙级别不匹配?

**A**: 使用宇宙参数:

```lean
def myQuote {u : Level} (α : Q(Sort u)) : Q(Sort u) := α
```

### Q: 如何处理依赖类型?

**A**: 使用反引用:

```lean
def dependent (n : Q(Nat)) : Q(Fin ($n + 1)) := 
  q(⟨0, Nat.zero_lt_succ $n⟩)
```

---

**最后更新**: 2026-04-01
