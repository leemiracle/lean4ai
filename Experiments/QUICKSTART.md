# 快速开始指南

## 1. 环境准备

确保已安装 Lean4 v4.14.0:
```bash
elan toolchain install leanprover/lean4:v4.14.0
```

## 2. 构建项目

```bash
cd /data/usershare/ai/lean4ai
lake update
lake build
```

## 3. 运行实验

### 方式1: 交互式 (推荐)
```bash
lake env lean --repl
```
然后输入:
```lean
import Experiments.01Basics
#eval add 3 5
```

### 方式2: 直接运行
```bash
lake env lean Experiments/01Basics.lean
```

### 方式3: 检查类型
```bash
lake env lean --check Experiments/08Proofs.lean
```

## 4. 推荐学习路径

### 初学者路径
1. **01-10**: 基础语法
2. **11-20**: 数据结构
3. **21-30**: 实用工具

### 进阶路径
1. **31-40**: 高级类型系统
2. **41-50**: 算法和数据结构
3. **51-60**: 理论和范畴论

## 5. 常见问题

**Q: 如何只运行特定函数?**
```bash
lake env lean --run -c "import Experiments.01Basics; #eval factorial 5"
```

**Q: 如何查看类型签名?**
```lean
#check add
```

**Q: 如何导入多个模块?**
```lean
import Experiments.01Basics
import Experiments.05Monads
```

## 6. 实验分类索引

| 编号范围 | 主题 | 难度 |
|---------|------|------|
| 01-10 | 基础特性 | ⭐ |
| 11-20 | 递归和数据结构 | ⭐⭐ |
| 21-30 | 数学和算法 | ⭐⭐ |
| 31-40 | 高级类型系统 | ⭐⭐⭐ |
| 41-50 | 数据结构和算法 | ⭐⭐⭐ |
| 51-60 | 理论和范畴论 | ⭐⭐⭐⭐ |

## 7. 性能提示

- 使用 `lake build` 一次性编译所有文件
- 修改后只需重新构建: `lake build Experiments.01Basics`
- 清理构建: `lake clean`

## 8. 调试技巧

```lean
-- 打印中间结果
#eval factorial 5

-- 检查证明
#check @add_comm

-- 查看定义
#print List.foldl
```
