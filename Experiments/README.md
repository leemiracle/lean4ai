# Lean4 实验室 - 62个特性实验

本项目包含 **62个独立的 Lean4 实验文件**，全面覆盖 Lean4 的各种功能和特性。

## 项目结构

```
lean4ai/
├── lakefile.toml          # 项目配置
├── lean-toolchain         # Lean版本: v4.14.0
├── Experiments/           # 实验文件目录
│   ├── 01Basics.lean
│   ├── 02InductiveTypes.lean
│   ├── ...
│   ├── 60Reflection.lean
│   ├── README.lean        # 详细索引
│   ├── samples.md         # 示例说明
│   └── AllExperiments.lean # 导入所有模块
└── README.md              # 本文件
```

## 快速开始

### 1. 检查环境
```bash
lake env lean --version
```

### 2. 构建项目
```bash
lake build
```

### 3. 运行单个实验
```bash
lake env lean Experiments/01Basics.lean
```

## 实验分类

### 基础特性 (01-10)
- **01Basics** - 基础类型和函数
- **02InductiveTypes** - 归纳类型定义
- **03Structures** - 结构体
- **04TypeClasses** - 类型类
- **05Monads** - Monad 和 Do 记法
- **06Functions** - 高阶函数
- **07PatternMatching** - 模式匹配
- **08Proofs** - 基础证明
- **09Decidable** - Decidable 类型类
- **10Polymorphism** - 多态和泛型

### 递归和数据结构 (11-20)
- **11Recursion** - 递归和尾递归
- **12Collections** - 数组和列表操作
- **13Strings** - 字符串处理
- **14IO** - IO 操作
- **15MetaProgramming** - 元编程和宏
- **16Tactics** - 自定义策略
- **17ComputationalProofs** - 计算证明
- **18DependentTypes** - 依赖类型
- **19FinTypes** - Fin 和向量
- **20OptionResult** - Option 和 Result

### 函数式编程 (21-30)
- **21Numerical** - 数值计算 (GCD, LCM, 素数)
- **22Algebraic** - 代数数据类型和表达式求值
- **23JSON** - JSON 表示和操作
- **24State** - 状态单子
- **25Writer** - Writer 单子
- **26Reader** - Reader 单子
- **27BinaryTree** - 二叉树操作
- **28Lazy** - Lazy 和延迟计算
- **29ArrayOps** - 数组切片和高级操作
- **30Parser** - 简单解析器组合子

### 高级类型系统 (31-40)
- **31TypeLevel** - 类型级编程
- **32Subtypes** - 子类型和约束
- **33Deriving** - 类型类派生
- **34Precedence** - 运算符优先级和结合性
- **35IntRat** - 整数和有理数
- **36Float** - 浮点数计算
- **37Sets** - 集合操作
- **38Maps** - Map 和字典操作
- **39Sorting** - 排序算法 (冒泡/插入/归并/快速)
- **40Search** - 搜索算法

### 数据结构和算法 (41-50)
- **41Graphs** - 图数据结构
- **42Streams** - 无限流和惰性序列
- **43Concurrency** - 并发原语
- **44Exceptions** - 异常处理
- **45Memoization** - 记忆化和缓存
- **46Benchmark** - 性能测试
- **47Regex** - 正则表达式
- **48Encoding** - 编码和解码
- **49Hashing** - 哈希函数
- **50Random** - 随机数生成

### 理论和范畴论 (51-60)
- **51Linear** - 仿射类型
- **52Corecursion** - 余递归和余代数
- **53FreeMonad** - Free Monad
- **54Cofree** - Cofree Comonad
- **55Transformers** - 单子变换器
- **56GADTs** - 广义代数数据类型
- **57Instances** - 实例优先级和重叠
- **58Partial** - 部分函数
- **59PropertyTesting** - 属性测试框架
- **60Reflection** - 反射和元数据

## 使用示例

### 示例1：基础类型和函数 (01Basics.lean)
```lean
#eval add 3 5           -- 8
#eval factorial 5       -- 120
#eval fibonacci 10      -- 55
#eval isEven 4          -- true
```

### 示例2：排序算法 (39Sorting.lean)
```lean
#eval bubbleSort [5, 3, 8, 1, 9, 2]    -- [1, 2, 3, 5, 8, 9]
#eval mergeSort [5, 3, 8, 1, 9, 2]     -- [1, 2, 3, 5, 8, 9]
#eval quickSort [5, 3, 8, 1, 9, 2]     -- [1, 2, 3, 5, 8, 9]
```

### 示例3：解析器 (30Parser.lean)
```lean
#eval Parser.run natParser "12345"     -- some 12345
```

## 特性亮点

✅ **代码规模小** - 每个文件精简，聚焦单一主题
✅ **无错误可执行** - 所有代码经过验证，可直接运行
✅ **覆盖全面** - 62个实验覆盖Lean4绝大部分特性
✅ **独立模块** - 每个文件独立，可单独学习和测试
✅ **实用示例** - 包含大量实际应用场景
✅ **类型安全** - 充分利用Lean4的类型系统
✅ **函数式编程** - 展示纯函数式编程范式

## 进阶主题

- **依赖类型** (18, 19, 56) - 类型依赖值
- **元编程** (15, 60) - 编译时代码生成
- **证明** (08, 17) - 形式化验证
- **范畴论** (53, 54, 55) - Free/Cofree/Transformers
- **并发** (43) - 并发编程模式

## 贡献指南

欢迎添加更多实验！请遵循：
1. 文件命名：`编号主题.lean`
2. 保持代码精简
3. 添加 #eval 示例
4. 确保可编译运行

## 许可证

MIT License

## 联系方式

- 项目位置: `/data/usershare/ai/lean4ai/Experiments/`
- 文档: `Experiments/README.lean`
