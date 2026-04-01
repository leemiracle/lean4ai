# Aesop - 自动证明策略

> **版本**: Master  
> **Stars**: 347  
> **许可证**: Apache-2.0  
> **GitHub**: https://github.com/leanprover-community/aesop

---

## 简介

**Aesop** (Automated Extensible Search for Obvious Proofs) 是 Lean4 的白盒自动化证明搜索策略,类似于 Isabelle 的 `auto` 策略。

## 快速开始

### 安装

在 `lakefile.toml` 中添加:

```toml
[[require]]
name = "aesop"
scope = "leanprover-community"
rev = "master"
```

### 基础用法

```lean
import Aesop

-- 最简单的用法
example : α → α := by aesop

-- 查看证明过程
set_option trace.aesop true

-- 生成证明脚本
example : P ∧ Q → Q ∧ P := by
  aesop?
```

## 核心概念

### 规则类型

1. **规范化规则 (norm)**: 简化目标
2. **安全规则 (safe)**: 不回溯的规则
3. **不安全规则 (unsafe)**: 可回溯的规则

### 规则构建器

```lean
-- apply: 应用定理
@[aesop apply]
theorem my_theorem : P → Q := ...

-- forward: 前向推理
@[aesop forward]
theorem even_or_odd : ∀ (n : Nat), Even n ∨ Odd n := ...

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

-- tactic: 自定义策略
@[aesop tactic]
def my_tactic : TacticM Unit := ...
```

## 使用示例

### 定义自定义规则

```lean
-- 定义归纳类型并添加规则
@[aesop safe [constructors, cases]]
inductive NonEmpty : MyList α → Prop
  | cons : NonEmpty (cons x xs)

-- 添加应用规则
@[aesop unsafe 50% apply]
theorem nonEmpty_append {xs : MyList α} ys :
    NonEmpty xs → NonEmpty (xs ++ ys) := by
  aesop
```

### 规则集管理

```lean
-- 声明规则集
declare_aesop_rule_sets [my_rules] (default := false)

-- 使用特定规则集
example : ... := by
  aesop (rule_sets := [my_rules])

-- 临时添加规则
example : ... := by
  aesop (add 10% cases Or, safe cases Empty)
```

## 性能优化

### 生成证明脚本

```lean
-- 使用 aesop? 查看生成的脚本
example : ... := by
  aesop?
  -- 输出: Try this: intro h, cases h, ...

-- 使用生成的脚本避免运行时开销
example : ... := by
  intro h
  cases h
  · exact ...
  · exact ...
```

### 调试选项

```lean
-- 启用追踪
set_option trace.aesop true          -- 基本追踪
set_option trace.aesop.tree true     -- 搜索树
set_option trace.aesop.proof true    -- 生成的证明
set_option trace.aesop.stats true    -- 统计信息
```

## 最佳实践

1. **优先使用 `aesop?`** 生成证明脚本,避免运行时开销
2. **合理设置成功概率** 高概率规则优先,避免搜索爆炸
3. **标记安全规则** 对确定性的规则使用 `safe`
4. **利用 `simp` 引理** Aesop 会自动使用 `@[simp]` 引理
5. **分层规则集** 为不同领域创建专用规则集

## 相关资源

- **GitHub**: https://github.com/leanprover-community/aesop
- **论文**: https://zenodo.org/record/7430233
- **文档**: README.md 包含完整文档
- **社区**: https://leanprover.zulipchat.com

## 常见问题

### Q: Aesop 搜索时间过长?

**A**:
1. 使用 `aesop?` 生成证明脚本
2. 降低规则的成功概率
3. 使用更具体的规则集
4. 检查是否有循环规则

### Q: 如何添加自定义规则?

**A**: 使用 `@[aesop]` 属性标记定义,并指定规则类型和构建器。

---

**最后更新**: 2026-04-01
