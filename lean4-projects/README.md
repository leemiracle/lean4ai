# Lean4 核心生态系统项目

> **版本**: 1.0  
> **更新**: 2026-04-01  
> **状态**: 核心组件

---

## 项目概览

本文档详细介绍 Lean4 生态系统中最重要的核心项目，这些项目是构建 Lean4 应用的基础组件。

| 项目 | Stars | 用途 | 必要性 |
|------|-------|------|--------|
| **lean4** | 7.6k | 核心语言和编译器 | ⭐⭐⭐⭐⭐ |
| **aesop** | 347 | 自动证明策略 | ⭐⭐⭐⭐⭐ |
| **batteries** | 369 | 扩展标准库 | ⭐⭐⭐⭐⭐ |
| **ProofWidgets4** | 195 | UI组件库 | ⭐⭐⭐⭐ |
| **quote4** | 102 | 类型安全引用 | ⭐⭐⭐⭐ |
| **repl** | - | 交互式环境 | ⭐⭐⭐ |

---

## 1. Aesop - 自动证明策略

### 简介

**Aesop** (Automated Extensible Search for Obvious Proofs) 是 Lean4 的白盒自动化证明搜索策略,类似于 Isabelle 的 `auto` 策略。

**GitHub**: https://github.com/leanprover-community/aesop  
**Stars**: 347  
**许可证**: Apache-2.0

### 核心特性

#### 1. 规则注册系统

```lean
-- 使用 @[aesop] 属性标记定义作为 Aesop 规则
@[aesop safe [constructors, cases]]
inductive NonEmpty : MyList α → Prop
  | cons : NonEmpty (cons x xs)

@[aesop unsafe 50% apply]
theorem nonEmpty_append {xs : MyList α} ys :
    NonEmpty xs → NonEmpty (xs ++ ys) := by
  aesop
```

#### 2. 规则类型

| 类型 | 关键字 | 特性 | 用途 |
|------|--------|------|------|
| **规范化规则** | `norm` | 生成0或1个子目标 | 简化目标 |
| **安全规则** | `safe` | 不回溯 | 构造性证明 |
| **不安全规则** | `unsafe` | 可回溯 | 搜索性证明 |

#### 3. 规则构建器

```lean
-- apply: 应用定理
@[aesop apply]
theorem my_theorem : P → Q := ...

-- forward: 前向推理
@[aesop forward]
theorem even_or_odd : ∀ (n : Nat), Even n ∨ Odd n := ...

-- destruct: 消除假设
@[aesop norm destruct]
theorem and_elim_right : α ∧ β → α := ...

-- constructors: 应用构造器
@[aesop constructors]
inductive Or (a b : Prop) : Prop where
  | inl : a → Or a b
  | inr : b → Or a b

-- cases: 情况分析
@[aesop cases]
inductive MyList (α : Type) where
  | nil : MyList α
  | cons : α → MyList α → MyList α

-- simp: 简化引理
@[aesop simp]
theorem append_nil : xs ++ [] = xs := ...

-- unfold: 展开 definition
@[aesop unfold]
def my_function := ...

-- tactic: 自定义策略
@[aesop tactic]
def my_tactic : TacticM Unit := ...
```

### 搜索策略

#### 最佳优先搜索

Aesop 使用优先级系统来指导搜索:

```lean
-- 成功概率越高,优先级越高
@[aesop unsafe 90% apply]  -- 高优先级
theorem high_priority_rule : ...

@[aesop unsafe 10% apply]  -- 低优先级
theorem low_priority_rule : ...
```

#### 规范化阶段

在应用任何规则之前,Aesop 会规范化目标:

1. 运行负惩罚的规范化规则
2. 运行 `simp_all` (包含 `@[simp]` 引理)
3. 运行正惩罚的规范化规则
4. 重复直到稳定

### 使用示例

#### 基础用法

```lean
import Aesop

-- 最简单的用法
example : α → α := by aesop

-- 查看证明过程
set_option trace.aesop true

-- 生成证明脚本
example : P ∧ Q → Q ∧ P := by
  aesop?  -- 会生成具体的策略脚本
```

#### 自定义规则集

```lean
-- 声明规则集
declare_aesop_rule_sets [my_rules] (default := false)

-- 添加规则到特定规则集
@[aesop (rule_sets := [my_rules])]
theorem my_rule : ...

-- 使用特定规则集
example : ... := by
  aesop (rule_sets := [my_rules])
```

#### 临时添加规则

```lean
example : ... := by
  aesop (add 10% cases Or, safe cases Empty)
```

### 性能优化

#### 证明脚本生成

避免每次都运行 Aesop:

```lean
-- 使用 aesop? 生成脚本
example : ... := by
  aesop?  -- 会显示: "Try this: ..."

-- 然后使用生成的脚本
example : ... := by
  -- 生成的具体策略
  intro h
  cases h
  · exact ...
  · exact ...
```

#### 性能分析

```lean
-- 启用统计信息
set_option trace.aesop.stats true

-- 启用性能分析
set_option profiler true
```

### 高级特性

#### 元变量处理

Aesop 能够正确处理元变量:

```lean
-- 传递性规则
example (n k : Nat) : n < k := by
  aesop  -- 会自动找到中间值 ?m
```

#### 追踪和调试

```lean
-- 详细追踪
set_option trace.aesop true          -- 基本追踪
set_option trace.aesop.tree true     -- 搜索树
set_option trace.aesop.proof true    -- 生成的证明
set_option trace.aesop.ruleSet true  -- 使用的规则集
```

### 添加到项目

在 `lakefile.toml` 中:

```toml
[[require]]
name = "aesop"
scope = "leanprover-community"
rev = "master"
```

### 应用场景

| 场景 | 描述 |
|------|------|
| **通用自动化** | 处理"显然"的目标 |
| **专用自动化** | 为特定类型的目标构建规则集 |
| **快速原型** | 快速证明简单定理 |
| **清理证明** | 简化复杂的证明脚本 |

### 最佳实践

1. **优先使用 `aesop?`** 生成证明脚本,避免运行时开销
2. **合理设置成功概率** 高概率规则优先,避免搜索爆炸
3. **标记安全规则** 对确定性的规则使用 `safe`
4. **利用 `simp` 引理** Aesop 会自动使用 `@[simp]` 引理
5. **分层规则集** 为不同领域创建专用规则集

---

## 2. Batteries - 扩展标准库

### 简介

**Batteries** 是 Lean4 的"电池已包含"扩展库,提供额外的数据结构和策略,适用于计算机科学和数学应用。

**GitHub**: https://github.com/leanprover-community/batteries  
**Stars**: 369  
**许可证**: Apache-2.0

### 核心内容

#### 1. 数据结构扩展

```
Batteries/
├── Data/
│   ├── Array/         # 数组操作
│   ├── List/          # 列表扩展
│   ├── Option/        # Option 类型
│   ├── String/        # 字符串处理
│   ├── Nat/           # 自然数
│   ├── Int/           # 整数
│   ├── Fin/           # 有限自然数
│   └── ...
├── Tactic/
│   ├── NormNum/       # 数值规范化
│   ├── Omega/         # 线性算术
│   └── ...
└── Util/
    ├── Debug/         # 调试工具
    └── ...
```

#### 2. 主要模块

| 模块 | 功能 | 示例用途 |
|------|------|----------|
| **Batteries.Data.List** | 列表扩展操作 | 高阶函数、证明 |
| **Batteries.Data.Array** | 数组高效操作 | 性能关键代码 |
| **Batteries.Data.String** | 字符串工具 | 文本处理 |
| **Batteries.Tactic** | 额外策略 | 自动证明 |
| **Batteries.Lean** | 元编程工具 | 编写宏和策略 |

### 重要特性

#### 扩展的类型类实例

```lean
import Batteries

-- 更多的 Decidable 实例
#eval 5 < 10  -- 自动推导

-- 扩展的数学运算
#eval 2 ^ 10  -- 幂运算
```

#### 额外的策略

```lean
import Batteries.Tactic

-- norm_num: 规范化数值表达式
example : 2 + 2 = 4 := by norm_num

-- omega: 线性算术求解器
example (n : Nat) : n < n + 1 := by omega
```

#### 实用函数

```lean
import Batteries.Data.List.Basic

-- 列表操作扩展
#eval [1, 2, 3].get? 1  -- some 2
#eval [1, 2, 3].indexOf 2  -- 1
```

### 与 Mathlib4 的关系

```
Lean4 生态结构:
├── Lean4 (核心语言)
│   └── Init (基础库)
├── Batteries (扩展标准库)
│   └── 通用工具和数据结构
├── Mathlib4 (数学库)
│   ├── 依赖 Batteries
│   └── 高级数学内容
└── 其他项目
    ├── 依赖 Batteries 或 Mathlib4
    └── 特定领域应用
```

**关键点**:
- Batteries 是 Mathlib4 的依赖
- 包含 Mathlib4 需要的基础工具
- 可以独立使用(不需要 Mathlib4)

### 使用示例

#### 数据结构

```lean
import Batteries.Data.List.Basic
import Batteries.Data.Array.Basic

-- 列表推导式
def squares (n : Nat) : List Nat :=
  (List.range n).map (fun x => x * x)

-- 数组高效操作
def sumArray (arr : Array Nat) : Nat :=
  arr.foldl (· + ·) 0
```

#### 证明工具

```lean
import Batteries.Tactic

-- 自动数值证明
example : 123 * 456 = 56088 := by norm_num

-- 线性算术
example (x y : Int) : x < y → x + 1 ≤ y := by omega
```

#### 元编程

```lean
import Batteries.Lean.Expr

-- 表达式操作
def myMetaFunction : MetaM Expr := do
  let e ← `(Nat.add 1 2)
  return e
```

### 添加到项目

在 `lakefile.toml` 中:

```toml
[[require]]
name = "batteries"
scope = "leanprover-community"
rev = "main"
```

或使用 `lakefile.lean`:

```lean
require "leanprover-community" / "batteries" @ git "main"
```

**重要**: 复制 `lean-toolchain` 文件以确保版本匹配。

### 构建和测试

```bash
# 构建
lake build

# 运行测试
lake test

# 运行代码检查
lake lint
```

### 贡献指南

1. Fork 仓库
2. 创建功能分支
3. 添加代码和测试
4. 提交 PR

**注意**: Batteries 的 PR 通常会影响 Mathlib4,需要进行适配。

### 与标准库的区别

| 特性 | Lean4 Init | Batteries | Mathlib4 |
|------|-----------|-----------|----------|
| **范围** | 核心基础 | 通用扩展 | 数学专业 |
| **依赖** | 无 | Lean4 | Batteries |
| **大小** | 小 | 中 | 大 |
| **编译时间** | 快 | 中 | 慢 |
| **适用场景** | 所有项目 | 通用开发 | 数学研究 |

---

## 3. ProofWidgets4 - UI 组件库

### 简介

**ProofWidgets4** 是 Lean4 的用户界面组件库,用于创建交互式可视化和证明辅助工具。

**GitHub**: https://github.com/leanprover-community/ProofWidgets4  
**Stars**: 195  
**许可证**: Apache-2.0  
**作者**: Wojciech Nawrocki, E.W. Ayers

### 核心功能

#### 1. 符号可视化

```lean
import ProofWidgets.Component.HtmlDisplay
open scoped ProofWidgets.Jsx

-- HTML 可视化
#html <b>数学对象可视化</b>

-- 红黑树可视化
-- 显示数据结构
```

#### 2. JSX 风格语法

```lean
import ProofWidgets.Component.HtmlDisplay
open scoped ProofWidgets.Jsx

-- 在 Lean 中使用 HTML
#html 
  <div>
    <h1>证明助手</h1>
    <p>当前目标: {goal}</p>
  </div>
```

#### 3. 交互式组件

```lean
import ProofWidgets

-- 自定义表达式显示
@[widget]
def myWidget : UserWidgetDefinition where
  name := "My Widget"
  javascript := ..."
```

### 特性列表

| 特性 | 描述 | 示例 |
|------|------|------|
| **JSX 语法** | HTML 风格的标记 | `<b>文本</b>` |
| **Penrose 集成** | 数学图表 | Venn 图、几何图形 |
| **Recharts 支持** | 数据可视化 | 函数绘图、统计图 |
| **自定义显示** | Expr 可视化 | 类型、证明状态 |
| **动画支持** | 动态 HTML | 动画演示 |

### 使用场景

#### 1. 数据结构可视化

```lean
import ProofWidgets

-- 可视化树结构
#html visualize_tree myTree

-- 可视化图结构
#html visualize_graph myGraph
```

#### 2. 数学对象可视化

```lean
import ProofWidgets

-- Venn 图
#html venn_diagram A B C

-- 几何图形
#html geometry_figure triangle
```

#### 3. 证明状态显示

```lean
import ProofWidgets

-- 自定义目标显示
@[widget]
def customGoalDisplay : UserWidgetDefinition where
  name := "Custom Goal Display"
  javascript := ..."
```

#### 4. 交互式证明编辑

```lean
import ProofWidgets

-- Conv 模式可视化
-- 显示当前聚焦的表达式部分
```

### 添加到项目

在 `lakefile.lean` 中:

```lean
-- 使用特定版本(推荐)
require "leanprover-community" / "proofwidgets" @ git "v0.0.95"
```

**注意**: 使用发布标签而不是 `main` 分支,以确保稳定性。

### 开发 Widgets

#### 前置要求

- Node.js 和 NPM
- TypeScript 编译器

#### 构建流程

```bash
# 克隆仓库
git clone https://github.com/leanprover-community/ProofWidgets4
cd ProofWidgets4

# 构建(包含 TypeScript 编译)
lake build

# 仅构建 TypeScript
lake build widgetJsAll

# 开发模式
lake build widgetJsAllDev
```

### 组件库

#### Penrose 图表

```lean
import ProofWidgets

-- 创建 Penrose 图表
#html penrose_diagram {
  -- 定义集合
  Set A, B, C
  -- 定义关系
  Intersect A B
  Subset B C
}
```

#### Recharts 绘图

```lean
import ProofWidgets

-- 函数绘图
#html plot_function (fun x => x^2) 0 10

-- 数据可视化
#html plot_data [(1, 2), (3, 4), (5, 6)]
```

### 高级示例

#### 自定义表达式显示

```lean
import ProofWidgets

-- 为特定类型定义可视化
@[expr_presenter]
def myTypePresenter : ExprPresenter where
  name := "My Type Display"
  present := fun e => do
    -- 生成 HTML
    pure <| Html.element "div" #[] #[...]
```

#### 多阶段交互

```lean
import ProofWidgets

-- 交互式证明循环
@[widget]
def interactiveProof : UserWidgetDefinition where
  name := "Interactive Proof"
  javascript := ..."
  
-- 用户点击 → 运行策略 → 更新显示
```

### 架构

```
ProofWidgets 架构:
├── Lean 端
│   ├── Widget 定义
│   ├── 数据序列化
│   └── 策略接口
├── TypeScript 端
│   ├── React 组件
│   ├── 可视化库
│   └── 事件处理
└── VS Code 集成
    ├── Infoview 显示
    ├── 交互事件
    └── 状态管理
```

### 相关论文

如果 ProofWidgets 对您的研究有帮助,请引用:

```bibtex
@InProceedings{nawrocki_et_al:LIPIcs.ITP.2023.24,
  author = {Nawrocki, Wojciech and Ayers, Edward W. and Ebner, Gabriel},
  title = {{An Extensible User Interface for Lean 4}},
  booktitle = {14th International Conference on Interactive Theorem Proving (ITP 2023)},
  year = {2023},
  pages = {24:1--24:20},
  doi = {10.4230/LIPIcs.ITP.2023.24}
}
```

---

## 4. Quote4 - 类型安全表达式引用

### 简介

**Quote4** 为 Lean4 提供直观、类型安全的表达式引用机制,结合了模态逻辑的直观性和 Lean4 元编程的强大功能。

**GitHub**: https://github.com/leanprover-community/quote4  
**Stars**: 102  
**许可证**: Apache-2.0

### 核心概念

#### Q(·) 模态

```lean
import Qq
open Qq

-- Q(α) 表示类型为 α 的表达式
def myExpr : Q(Nat) := q(42)

-- 类型的引用
def myType : Q(Type) := Q(Nat)
```

#### q(·) 构造器

```lean
import Qq

-- 构造表达式
def a : Expr := q(42 + 1)

-- 构造类型化表达式
def b : Q(List Nat) := q([1, 2, 3])

-- 反引用
def c (n : Q(Nat)) : Q(Nat) := q($n + 1)
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

### 使用示例

#### 1. 类型安全的 mkApp

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

#### 2. 依赖类型反引用

```lean
import Qq

def d (u : Level) (n : Q(Nat)) 
  (x : Q(Type u × Fin ($n + 1))) : Q(Fin ($n + 3)) :=
  q(⟨$x.2, Nat.lt_of_lt_of_le $x.2.2 (Nat.le_add_right _ 2)⟩)
```

#### 3. 元编程

```lean
import Qq

-- 生成大型项
def add_self_37 {α : Type u} [Add α] (a : α) : α :=
  by_elab q return (List.range 36).foldr (init := q($a)) 
    fun _ acc => q($acc + $a)
```

### 高级应用

#### 模式匹配

```lean
import Qq

def analyzeExpr : Q(Expr) → Option Q(Nat)
  | ~q($n + $m) => some q($m + $n)  -- 交换加法
  | ~q($n * 0) => some q(0)
  | _ => none
```

#### 类型族

```lean
import Qq

-- QQ 是底层类型族
def QQ (α : Expr) := Expr

-- e : QQ t 意味着 e 是类型为 t 的表达式
```

### 与 Template Haskell 的比较

| 特性 | Quote4 | Template Haskell |
|------|--------|-----------------|
| **类型构造器** | `QQ : Expr → Type` | `Q : Type → Type` |
| **宇宙多态** | ✅ 支持 | ❌ 受限 |
| **依赖类型** | ✅ 完全支持 | ❌ 不支持 |
| **运行时类型** | ✅ 支持 | ❌ 编译时固定 |
| **表达式类型** | `Q(α)` | `Q α` |

### 使用场景

#### 1. 元程序转换

```lean
import Qq

-- 转换存在量化
def turnExistsIntoForall : Q(Prop) → MetaM Q(Prop)
  | ~q(∃ x, $p x) => do
     q(∀ x, $(x => turnExistsIntoForall q($p $x)))
  | e => pure e
```

#### 2. 策略编写

```lean
import Qq

-- 类型安全的策略
def myTactic (goal : Q(Prop)) : TacticM Q(Prop) := do
  match goal with
  | ~q($p ∧ $q) => q($q ∧ $p)  -- 交换合取
  | ~q($p ∨ $q) => q($q ∨ $p)  -- 交换析取
  | _ => pure goal
```

#### 3. 证明生成

```lean
import Qq

-- 生成证明项
def tryProve (n : Q(Nat)) (i : Q(Fin $n)) : Option Q($i > 0) := 
  -- 在非一致上下文中工作
  ...
```

### 添加到项目

在 `lakefile.toml` 中:

```toml
[[require]]
name = "quote4"
scope = "leanprover-community"
rev = "master"
```

### 关键优势

1. **类型安全**: 编译时捕获类型错误
2. **宇宙多态**: 支持任意宇宙级别
3. **依赖类型**: 完全支持依赖类型
4. **运行时灵活**: 类型可在运行时确定
5. **高效**: 编译为高效的元程序

---

## 5. REPL - 交互式执行环境

### 简介

**REPL** (Read-Eval-Print Loop) 为 Lean4 提供机器到机器的交互式执行环境,常用于 AI/ML 应用和外部工具集成。

**GitHub**: https://github.com/leanprover-community/repl  
**许可证**: Apache-2.0

### 目录结构

```
repl/
├── REPL/
│   ├── Frontend.lean      # 前端接口
│   ├── JSON.lean          # JSON 序列化
│   ├── Main.lean          # 主程序
│   ├── Snapshots.lean     # 快照管理
│   ├── Lean/
│   │   ├── ContextInfo.lean
│   │   ├── Environment.lean
│   │   └── InfoTree.lean
│   └── Util/
│       ├── Path.lean
│       └── Pickle.lean
└── test/                   # 测试用例
```

### 核心功能

#### 1. 环境交互

```bash
# 启动 REPL
lake repl

# 输入命令
{"cmd": "def x := 42"}
# 输出
{"message": "x : Nat := 42"}

# 执行证明
{"cmd": "example : 1 + 1 = 2 := by rfl"}
```

#### 2. 环境序列化

```bash
# 序列化环境
{"cmd": "pickle environment", "path": "env.pickle"}

# 反序列化环境
{"cmd": "unpickle environment", "path": "env.pickle"}
```

#### 3. 证明状态管理

```bash
# 开始证明
{"cmd": "theorem test : True := by"}

# 应用策略
{"tactic": "trivial"}

# 查看目标
{"cmd": "print goals"}
```

### 主要 API

#### 命令接口

| 命令 | 参数 | 描述 |
|------|------|------|
| `cmd` | 代码字符串 | 执行 Lean 代码 |
| `tactic` | 策略字符串 | 在当前目标应用策略 |
| `pickle` | 路径 | 序列化状态 |
| `unpickle` | 路径 | 反序列化状态 |
| `print` | 选项 | 打印信息 |

#### JSON 输出

```json
{
  "messages": [...],
  "goals": [...],
  "environment": {...},
  "infotree": {...}
}
```

### 使用场景

#### 1. AI/ML 集成

```python
# Python 客户端示例
import json
import subprocess

proc = subprocess.Popen(['lake', 'repl'], 
                       stdin=subprocess.PIPE,
                       stdout=subprocess.PIPE)

def send_command(cmd):
    proc.stdin.write((json.dumps(cmd) + '\n').encode())
    proc.stdin.flush()
    return json.loads(proc.stdout.readline())

# 执行代码
result = send_command({"cmd": "def x := 42"})
print(result)
```

#### 2. 外部工具集成

- IDE 集成
- 证明自动化工具
- 文档生成器
- 测试框架

#### 3. LeanDojo 集成

REPL 是 LeanDojo 的基础组件,用于:
- 机器学习训练数据提取
- 证明搜索算法
- 定理证明器

### 测试用例

项目包含丰富的测试用例:

```
test/
├── all_tactics.in         # 策略测试
├── proof_step.in          # 证明步骤测试
├── pickle_environment.in  # 序列化测试
├── infotree.in            # 信息树测试
└── ...
```

### 添加到项目

在 `lakefile.toml` 中:

```toml
[[require]]
name = "repl"
scope = "leanprover-community"
rev = "master"
```

### 运行测试

```bash
# 运行所有测试
./test.sh

# 运行单个测试
lake repl < test/proof_step.in
```

---

## 项目依赖关系

```
依赖图:
                    
               Lean4 (核心) ⭐
                   ↓
              Batteries
              ↓    ↓    ↓
         Aesop  Quote4  REPL
              ↓    ↓
         ProofWidgets4
              ↓
            Mathlib4
```

**关键依赖**:
- **Lean4**: 核心语言和编译器,所有项目的基础
- **Batteries**: 大多数项目的基础
- **Aesop**: 依赖 Batteries
- **ProofWidgets4**: 依赖 Batteries
- **Quote4**: 可独立使用
- **REPL**: 可独立使用

---

## 快速开始指南

### 1. 安装基础环境

```bash
# 安装 elan
curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh

# 验证安装
lean --version
lake --version
```

### 2. 下载 Lean4 核心

```bash
# 克隆 Lean4 核心仓库(可选)
cd lean4-projects
git clone --depth 1 https://github.com/leanprover/lean4 lean4

# 或直接使用 elan 安装的版本
lean --version
```

### 2. 创建项目

```bash
# 创建新项目
lake new my_project math

# 进入项目目录
cd my_project
```

### 3. 添加依赖

编辑 `lakefile.toml`:

```toml
[[require]]
name = "batteries"
scope = "leanprover-community"
rev = "main"

[[require]]
name = "aesop"
scope = "leanprover-community"
rev = "master"

[[require]]
name = "proofwidgets"
scope = "leanprover-community"
rev = "v0.0.95"

[[require]]
name = "quote4"
scope = "leanprover-community"
rev = "master"
```

### 4. 更新依赖

```bash
# 更新并生成 manifest
lake update

# 构建项目
lake build
```

### 5. 开始编码

创建 `MyProject/Basic.lean`:

```lean
import Aesop
import Batteries.Data.List.Basic
import ProofWidgets.Component.HtmlDisplay

-- 使用 Aesop
example : α → α := by aesop

-- 使用 Batteries
#eval [1, 2, 3].length

-- 使用 ProofWidgets
open scoped ProofWidgets.Jsx
#html <b>Hello Lean4!</b>
```

---

## 最佳实践

### 1. 版本管理

```bash
# 使用 lean-toolchain 锁定版本
echo "leanprover/lean4:v4.28.0" > lean-toolchain

# 定期更新
lake update
```

### 2. 依赖选择

| 项目类型 | 推荐依赖 |
|---------|---------|
| **最小化项目** | 无(Bare Lean4) |
| **通用开发** | Batteries |
| **数学证明** | Batteries + Mathlib4 |
| **自动化证明** | Batteries + Aesop |
| **元编程** | Batteries + Quote4 |
| **AI/ML** | Batteries + REPL |

### 3. 性能优化

- 使用 `aesop?` 生成证明脚本
- 避免过度依赖 Mathlib4(如果不需要)
- 使用缓存(如可用)
- 分模块构建

### 4. 代码组织

```
my_project/
├── lakefile.toml
├── lean-toolchain
├── MyProject/
│   ├── Basic.lean
│   ├── Tactics.lean      # 自定义策略
│   ├── Lemmas.lean       # 引理
│   └── Main.lean         # 主定理
└── MyProject.lean
```

---

## 常见问题

### Q1: Aesop 搜索时间过长?

**A**: 
1. 使用 `aesop?` 生成证明脚本
2. 降低规则的成功概率
3. 使用更具体的规则集
4. 检查是否有循环规则

### Q2: Batteries 与 Mathlib4 冲突?

**A**:
1. 确保使用相同的 `lean-toolchain`
2. 检查版本兼容性
3. 清理并重新构建: `lake clean && lake build`

### Q3: ProofWidgets 不显示?

**A**:
1. 检查 VS Code 扩展是否正确安装
2. 确保使用正确的版本标签
3. 重启 Lean 服务器

### Q4: Quote4 类型错误?

**A**:
1. 检查宇宙级别是否匹配
2. 确保反引用变量类型正确
3. 使用类型注解辅助类型推断

---

## 学习资源

### 官方文档

- **Aesop**: https://github.com/leanprover-community/aesop#readme
- **Batteries**: https://github.com/leanprover-community/batteries#readme
- **ProofWidgets4**: https://github.com/leanprover-community/ProofWidgets4#readme
- **Quote4**: https://github.com/leanprover-community/quote4#readme
- **REPL**: https://github.com/leanprover-community/repl

### 社区资源

- **Zulip**: https://leanprover.zulipchat.com
- **GitHub Issues**: 各项目的 Issues 页面
- **Mathlib4 文档**: https://leanprover-community.github.io/mathlib4_docs

---

## 总结

这五个项目构成了 Lean4 生态系统的核心:

1. **Aesop** - 强大的自动化证明
2. **Batteries** - 必备的标准库扩展
3. **ProofWidgets4** - 交互式可视化
4. **Quote4** - 类型安全的元编程
5. **REPL** - 外部工具集成

它们相互配合,为 Lean4 开发提供了完整的工具链。

---

**最后更新**: 2026-04-01  
**维护者**: Lean4 Community  
**反馈**: https://github.com/leanprover-community/
