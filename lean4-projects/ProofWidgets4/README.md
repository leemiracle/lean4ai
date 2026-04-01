# ProofWidgets4 - UI 组件库

> **版本**: v0.0.95  
> **Stars**: 195  
> **许可证**: Apache-2.0  
> **GitHub**: https://github.com/leanprover-community/ProofWidgets4  
> **作者**: Wojciech Nawrocki, E.W. Ayers

---

## 简介

**ProofWidgets4** 是 Lean4 的用户界面组件库,用于创建交互式可视化和证明辅助工具。

## 快速开始

### 安装

在 `lakefile.lean` 中添加:

```lean
-- 使用特定版本(推荐)
require "leanprover-community" / "proofwidgets" @ git "v0.0.95"
```

**注意**: 使用发布标签而不是 `main` 分支,以确保稳定性。

### 基础用法

```lean
import ProofWidgets.Component.HtmlDisplay
open scoped ProofWidgets.Jsx

-- HTML 可视化
#html <b>Hello Lean4!</b>

-- 带变量的 HTML
#html <div>1 + 3 = {1 + 3}</div>
```

## 核心功能

### 1. JSX 风格语法

```lean
import ProofWidgets.Component.HtmlDisplay
open scoped ProofWidgets.Jsx

-- 基础 HTML
#html <b>粗体文本</b>

-- 嵌套元素
#html 
  <div>
    <h1>标题</h1>
    <p>段落内容</p>
  </div>

-- Lean 表达式嵌入
def x := 42
#html <p>x = {x}</p>
```

### 2. 数据结构可视化

```lean
import ProofWidgets

-- 红黑树可视化
def myTree : RBTree Nat := ...
#html visualize_rbtree myTree

-- 列表可视化
def myList : List Nat := [1, 2, 3, 4, 5]
#html visualize_list myList
```

### 3. 数学对象可视化

```lean
import ProofWidgets

-- Venn 图
#html venn_diagram A B C

-- 几何图形
#html geometry_figure triangle
```

### 4. Penrose 图表

```lean
import ProofWidgets

-- 创建 Penrose 图表
#html penrose_diagram {
  Set A, B, C
  Intersect A B
  Subset B C
}
```

### 5. Recharts 绘图

```lean
import ProofWidgets

-- 函数绘图
#html plot_function (fun x => x^2) 0 10

-- 数据可视化
def data := [(1, 2), (3, 4), (5, 6)]
#html plot_data data
```

## 使用场景

### 1. 证明状态显示

```lean
import ProofWidgets

-- 自定义目标显示
@[widget]
def customGoalDisplay : UserWidgetDefinition where
  name := "Custom Goal Display"
  javascript := ..."
```

### 2. 交互式证明编辑

```lean
import ProofWidgets

-- Conv 模式可视化
-- 显示当前聚焦的表达式部分
```

### 3. 自定义表达式显示

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

### 4. 多阶段交互

```lean
import ProofWidgets

-- 交互式证明循环
@[widget]
def interactiveProof : UserWidgetDefinition where
  name := "Interactive Proof"
  javascript := ..."
  
-- 用户点击 → 运行策略 → 更新显示
```

## 开发 Widgets

### 前置要求

- Node.js 和 NPM
- TypeScript 编译器

### 构建流程

```bash
# 克隆仓库
git clone https://github.com/leanprover-community/ProofWidgets4 --depth 1
cd ProofWidgets4

# 构建(包含 TypeScript 编译)
lake build

# 仅构建 TypeScript
lake build widgetJsAll

# 开发模式
lake build widgetJsAllDev
```

### 项目结构

```
ProofWidgets4/
├── ProofWidgets/      # Lean 模块
│   ├── Component/
│   ├── Data/
│   └── ...
├── widget/            # TypeScript 组件
│   ├── src/
│   └── js/            # 编译输出
├── test/              # 测试用例
└── doc/               # 文档和示例
```

## 特性列表

| 特性 | 描述 | 示例 |
|------|------|------|
| **JSX 语法** | HTML 风格的标记 | `<b>文本</b>` |
| **Penrose 集成** | 数学图表 | Venn 图、几何图形 |
| **Recharts 支持** | 数据可视化 | 函数绘图、统计图 |
| **自定义显示** | Expr 可视化 | 类型、证明状态 |
| **动画支持** | 动态 HTML | 动画演示 |
| **交互组件** | 用户交互 | 点击、拖拽 |

## 查看示例

```bash
# 克隆并构建
git clone https://github.com/leanprover-community/ProofWidgets4 --depth 1
cd ProofWidgets4
lake build

# 打开 VS Code 查看 demo
code .
# 导航到 ProofWidgets/Demos/
```

## 与 User Widgets 的关系

ProofWidgets 建立在 Lean4 的 **user widgets** 机制之上:
- **User widgets**: Lean4 内置的最小功能
- **ProofWidgets**: 高级组件库和抽象

## 在其他项目中使用 JS 组件

⚠️ **[实验性]** 要在其他 Lean 包中使用 ProofWidgets4 JS 组件:

```bash
npm install @leanprover-community/proofwidgets4
```

## 架构

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

## 引用

如果 ProofWidgets 对您的研究有帮助:

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

## 相关资源

- **GitHub**: https://github.com/leanprover-community/ProofWidgets4
- **论文**: https://drops.dagstuhl.de/opus/volltexte/2023/18399
- **Penrose**: https://penrose.cs.cmu.edu/
- **Recharts**: https://recharts.org/

## 常见问题

### Q: Widget 不显示?

**A**:
1. 检查 VS Code 扩展是否正确安装
2. 确保使用正确的版本标签
3. 重启 Lean 服务器

### Q: 如何调试 Widget?

**A**: 
1. 使用开发模式构建: `lake build widgetJsAllDev`
2. 在浏览器开发者工具中检查

### Q: 如何创建自定义 Widget?

**A**: 参考 `ProofWidgets/Demos/` 中的示例代码。

---

**最后更新**: 2026-04-01
