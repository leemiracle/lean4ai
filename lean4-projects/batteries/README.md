# Batteries - 扩展标准库

> **版本**: Main  
> **Stars**: 369  
> **许可证**: Apache-2.0  
> **GitHub**: https://github.com/leanprover-community/batteries

---

## 简介

**Batteries** 是 Lean4 的"电池已包含"扩展库,提供额外的数据结构和策略,适用于计算机科学和数学应用。

## 快速开始

### 安装

在 `lakefile.toml` 中添加:

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

### 基础用法

```lean
import Batteries.Data.List.Basic
import Batteries.Tactic

-- 列表操作
#eval [1, 2, 3].get? 1  -- some 2

-- 数值证明
example : 2 + 2 = 4 := by norm_num

-- 线性算术
example (n : Nat) : n < n + 1 := by omega
```

## 核心模块

### 数据结构

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
```

### 策略

```lean
import Batteries.Tactic

-- norm_num: 规范化数值表达式
example : 123 * 456 = 56088 := by norm_num

-- omega: 线性算术求解器
example (x y : Int) : x < y → x + 1 ≤ y := by omega
```

## 使用示例

### 数据结构操作

```lean
import Batteries.Data.List.Basic
import Batteries.Data.Array.Basic

-- 列表推导式
def squares (n : Nat) : List Nat :=
  (List.range n).map (fun x => x * x)

-- 数组高效操作
def sumArray (arr : Array Nat) : Nat :=
  arr.foldl (· + ·) 0

-- 字符串处理
import Batteries.Data.String.Basic
#eval "hello".toUpperCase  -- "HELLO"
```

### 证明工具

```lean
import Batteries.Tactic

-- 自动数值证明
example : 1000 - 1 = 999 := by norm_num

-- 线性算术
example (a b : Int) (h : a ≤ b) : a + 1 ≤ b + 1 := by omega

-- 决策过程
example : Decidable (5 < 10) := inferInstance
```

### 元编程

```lean
import Batteries.Lean.Expr

-- 表达式操作
def myMetaFunction : MetaM Expr := do
  let e ← `(Nat.add 1 2)
  return e
```

## 与 Mathlib4 的关系

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
    └── 依赖 Batteries 或 Mathlib4
```

**关键点**:
- Batteries 是 Mathlib4 的依赖
- 包含 Mathlib4 需要的基础工具
- 可以独立使用(不需要 Mathlib4)

## 主要模块

| 模块 | 功能 | 示例用途 |
|------|------|----------|
| **Batteries.Data.List** | 列表扩展操作 | 高阶函数、证明 |
| **Batteries.Data.Array** | 数组高效操作 | 性能关键代码 |
| **Batteries.Data.String** | 字符串工具 | 文本处理 |
| **Batteries.Tactic** | 额外策略 | 自动证明 |
| **Batteries.Lean** | 元编程工具 | 编写宏和策略 |

## 构建和测试

```bash
# 构建
lake build

# 运行测试
lake test

# 运行代码检查
lake lint

# 如果添加了新文件
scripts/updateBatteries.sh
```

## 贡献指南

1. Fork 仓库
2. 创建功能分支
3. 添加代码和测试
4. 提交 PR

**注意**: Batteries 的 PR 通常会影响 Mathlib4,需要进行适配测试。

## 文档生成

```bash
cd docs
lake build Batteries:docs

# 文档位置
# docs/doc/index.html

# 启动 HTTP 服务器查看
python3 -m http.server
```

## 与标准库的区别

| 特性 | Lean4 Init | Batteries | Mathlib4 |
|------|-----------|-----------|----------|
| **范围** | 核心基础 | 通用扩展 | 数学专业 |
| **依赖** | 无 | Lean4 | Batteries |
| **大小** | 小 | 中 | 大 |
| **编译时间** | 快 | 中 | 慢 |
| **适用场景** | 所有项目 | 通用开发 | 数学研究 |

## 常见问题

### Q: 如何选择 Batteries 还是 Mathlib4?

**A**: 
- 如果只需要通用工具,使用 Batteries
- 如果需要高级数学内容,使用 Mathlib4
- Mathlib4 已经包含 Batteries

### Q: 版本不匹配怎么办?

**A**:
1. 确保使用相同的 `lean-toolchain`
2. 运行 `lake update`
3. 清理并重新构建: `lake clean && lake build`

## 相关资源

- **GitHub**: https://github.com/leanprover-community/batteries
- **Mathlib4 文档**: https://leanprover-community.github.io/mathlib4_docs/Batteries.html
- **社区**: https://leanprover.zulipchat.com

---

**最后更新**: 2026-04-01
