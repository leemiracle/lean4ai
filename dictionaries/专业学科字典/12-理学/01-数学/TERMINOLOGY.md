# 数学术语对照表

> Mathematics Terminology (Chinese-English)

---

## 目录

1. [基础数学 (Foundations)](#1-基础数学-foundations)
2. [代数学 (Algebra)](#2-代数学-algebra)
3. [几何学 (Geometry)](#3-几何学-geometry)
4. [分析学 (Analysis)](#4-分析学-analysis)
5. [微分方程 (Differential Equations)](#5-微分方程-differential-equations)
6. [概率论 (Probability Theory)](#6-概率论-probability-theory)
7. [数理统计 (Mathematical Statistics)](#7-数理统计-mathematical-statistics)
8. [数论 (Number Theory)](#8-数论-number-theory)
9. [拓扑学 (Topology)](#9-拓扑学-topology)
10. [数值分析 (Numerical Analysis)](#10-数值分析-numerical-analysis)
11. [离散数学 (Discrete Mathematics)](#11-离散数学-discrete-mathematics)
12. [复变函数 (Complex Analysis)](#12-复变函数-complex-analysis)
13. [泛函分析 (Functional Analysis)](#13-泛函分析-functional-analysis)
14. [微分几何 (Differential Geometry)](#14-微分几何-differential-geometry)

---

## 1. 基础数学 (Foundations)

| 中文 | English | 定义 |
|------|---------|------|
| 集合 | Set | 具有某种特定性质的对象的全体 |
| 子集 | Subset | 包含于另一集合的集合 |
| 并集 | Union | 属于两个集合中至少一个的所有元素组成的集合 |
| 交集 | Intersection | 同时属于两个集合的所有元素组成的集合 |
| 补集 | Complement | 全集中不属于某集合的所有元素 |
| 空集 | Empty Set | 不含任何元素的集合 |
| 映射 | Mapping / Function | 从一个集合到另一个集合的对应关系 |
| 单射 | Injection / One-to-one | 不同元素对应不同像的映射 |
| 满射 | Surjection / Onto | 像充满整个值域的映射 |
| 双射 | Bijection | 既是单射又是满射的映射 |
| 逆映射 | Inverse Mapping | 将原映射的对应关系反转得到的映射 |
| 等价关系 | Equivalence Relation | 满足自反性、对称性、传递性的二元关系 |
| 序关系 | Order Relation | 满足自反性、反对称性、传递性的二元关系 |
| 基数 | Cardinality | 集合中元素的个数或"大小" |
| 可数集 | Countable Set | 与自然数集一一对应的集合 |
| 不可数集 | Uncountable Set | 不能与自然数集一一对应的无限集 |
| 笛卡尔积 | Cartesian Product | 两个集合所有有序对组成的集合 |
| 关系 | Relation | 集合元素之间的联系 |
| 等价类 | Equivalence Class | 在等价关系下彼此等价的元素组成的集合 |
| 划分 | Partition | 将集合分成互不相交的非空子集 |
| 逻辑命题 | Logical Proposition | 能判断真假的陈述句 |

---

## 2. 代数学 (Algebra)

### 2.1 线性代数 (Linear Algebra)

| 中文 | English | 定义 |
|------|---------|------|
| 向量 | Vector | 具有大小和方向的量，或有序数组 |
| 向量空间 | Vector Space | 对加法和数乘封闭的集合 |
| 线性组合 | Linear Combination | 向量的加权和 |
| 线性相关 | Linearly Dependent | 存在非零系数使线性组合为零 |
| 线性无关 | Linearly Independent | 只有零系数能使线性组合为零 |
| 基 | Basis | 线性无关且生成整个空间的向量组 |
| 维数 | Dimension | 基中向量的个数 |
| 矩阵 | Matrix | 按矩形排列的数表 |
| 行列式 | Determinant | 方阵对应的一个标量值 |
| 秩 | Rank | 线性无关的行或列的最大数目 |
| 迹 | Trace | 方阵对角线元素之和 |
| 转置 | Transpose | 行列互换得到的矩阵 |
| 逆矩阵 | Inverse Matrix | 与原矩阵相乘得单位矩阵的矩阵 |
| 正交矩阵 | Orthogonal Matrix | 转置等于逆的实矩阵 |
| 对称矩阵 | Symmetric Matrix | 等于其转置的方阵 |
| 特征值 | Eigenvalue | 使存在非零向量满足Ax=λx的标量λ |
| 特征向量 | Eigenvector | 对应特征值的非零向量x |
| 对角化 | Diagonalization | 将矩阵化为对角形的过程 |
| 二次型 | Quadratic Form | 关于变量的二次齐次多项式 |
| 正定 | Positive Definite | 对所有非零向量，二次型都大于零 |
| 半正定 | Positive Semidefinite | 对所有向量，二次型都大于等于零 |
| 线性变换 | Linear Transformation | 保持线性运算的映射 |
| 核 | Kernel / Null Space | 映射到零的所有向量组成的子空间 |
| 像 | Image / Range | 映射所有输出值组成的集合 |
| 内积 | Inner Product | 向量空间上满足特定条件的二元函数 |
| 正交 | Orthogonal | 内积为零的两个向量 |
| 正交补 | Orthogonal Complement | 与给定子空间正交的所有向量 |
| 投影 | Projection | 将向量分解到子空间及其正交补上 |
| 格拉姆-施密特正交化 | Gram-Schmidt Orthogonalization | 将线性无关组化为正交组的算法 |
| 奇异值分解 | Singular Value Decomposition (SVD) | 将矩阵分解为UΣV^T的形式 |
| 最小二乘法 | Least Squares | 使误差平方和最小的拟合方法 |
| 线性方程组 | System of Linear Equations | 多个线性方程的联立 |
| 高斯消元法 | Gaussian Elimination | 通过行变换求解线性方程组的方法 |
| 范数 | Norm | 衡量向量"大小"的函数 |

### 2.2 抽象代数 (Abstract Algebra)

| 中文 | English | 定义 |
|------|---------|------|
| 群 | Group | 具有一个满足结合律的运算、单位元和逆元的集合 |
| 阿贝尔群 | Abelian Group | 运算满足交换律的群 |
| 子群 | Subgroup | 在群运算下封闭的子集 |
| 正规子群 | Normal Subgroup | 对所有群元素共轭不变的子群 |
| 商群 | Quotient Group | 正规子群的陪集构成的群 |
| 同态 | Homomorphism | 保持运算结构的映射 |
| 同构 | Isomorphism | 可逆的同态映射 |
| 循环群 | Cyclic Group | 由单个元素生成的群 |
| 置换群 | Permutation Group | 置换组成的群 |
| 对称群 | Symmetric Group | 所有置换构成的群 |
| 环 | Ring | 具有加法和乘法两种运算的代数结构 |
| 域 | Field | 非零元素都可逆的交换环 |
| 理想 | Ideal | 环中满足特定吸收性质的加法子群 |
| 商环 | Quotient Ring | 环模理想得到的环 |
| 多项式环 | Polynomial Ring | 多项式构成的环 |
| 域扩张 | Field Extension | 包含原域的更大的域 |
| 伽罗瓦群 | Galois Group | 域扩张的自同构群 |
| 伽罗瓦理论 | Galois Theory | 研究域扩张与群的关系的理论 |
| 模 | Module | 环上的"向量空间" |
| 李群 | Lie Group | 具有光滑流形结构的群 |
| 李代数 | Lie Algebra | 与李群相关联的代数结构 |

---

## 3. 几何学 (Geometry)

### 3.1 欧几里得几何 (Euclidean Geometry)

| 中文 | English | 定义 |
|------|---------|------|
| 点 | Point | 只有位置没有大小的几何对象 |
| 线 | Line | 无限延伸的一维几何对象 |
| 面 | Plane | 无限延伸的二维平面 |
| 角 | Angle | 两条射线公共端点处形成的夹角 |
| 三角形 | Triangle | 三条线段围成的封闭图形 |
| 四边形 | Quadrilateral | 四条线段围成的封闭图形 |
| 圆 | Circle | 到定点距离相等的所有点的轨迹 |
| 椭圆 | Ellipse | 到两焦点距离之和为常数的点的轨迹 |
| 双曲线 | Hyperbola | 到两焦点距离之差为常数的点的轨迹 |
| 抛物线 | Parabola | 到焦点和准线距离相等的点的轨迹 |
| 相似 | Similar | 形状相同但大小可能不同的图形 |
| 全等 | Congruent | 形状和大小完全相同的图形 |
| 平行 | Parallel | 在同一平面内永不相交的直线 |
| 垂直 | Perpendicular | 相交成直角的两条直线 |
| 勾股定理 | Pythagorean Theorem | 直角三角形两直角边平方和等于斜边平方 |

### 3.2 解析几何 (Analytic Geometry)

| 中文 | English | 定义 |
|------|---------|------|
| 坐标系 | Coordinate System | 用数确定点位置的系统 |
| 笛卡尔坐标 | Cartesian Coordinates | 用有序数组表示点位置的坐标系统 |
| 极坐标 | Polar Coordinates | 用距离和角度表示点位置的坐标系统 |
| 曲线方程 | Equation of a Curve | 曲线上所有点满足的方程 |
| 参数方程 | Parametric Equation | 用参数表示曲线上点的方程 |
| 距离公式 | Distance Formula | 两点间距离的计算公式 |
| 斜率 | Slope | 直线倾斜程度的度量 |
| 截距 | Intercept | 曲线与坐标轴的交点坐标 |
| 圆锥曲线 | Conic Section | 平面与圆锥面的交线 |
| 二次曲面 | Quadric Surface | 三维空间中的二次方程所表示的曲面 |
| 向量方程 | Vector Equation | 用向量表示的曲线或曲面方程 |

### 3.3 非欧几何 (Non-Euclidean Geometry)

| 中文 | English | 定义 |
|------|---------|------|
| 双曲几何 | Hyperbolic Geometry | 平行公理不成立的几何 |
| 椭圆几何 | Elliptic Geometry | 不存在平行线的几何 |
| 曲率 | Curvature | 描述曲线或曲面弯曲程度的量 |
| 测地线 | Geodesic | 曲面上两点间最短路径 |
| 黎曼几何 | Riemannian Geometry | 研究黎曼流形的几何学 |

---

## 4. 分析学 (Analysis)

### 4.1 微积分 (Calculus)

| 中文 | English | 定义 |
|------|---------|------|
| 极限 | Limit | 函数值或序列无限接近的值 |
| 连续 | Continuous | 极限值等于函数值的性质 |
| 导数 | Derivative | 函数瞬时变化率 |
| 微分 | Differential | 函数的线性主部 |
| 积分 | Integral | 函数曲线下面积的推广概念 |
| 不定积分 | Indefinite Integral | 导数的逆运算 |
| 定积分 | Definite Integral | 区间上函数的累积效应 |
| 微积分基本定理 | Fundamental Theorem of Calculus | 连接微分和积分的定理 |
| 链式法则 | Chain Rule | 复合函数求导法则 |
| 乘积法则 | Product Rule | 乘积函数求导法则 |
| 商法则 | Quotient Rule | 商函数求导法则 |
| 隐函数求导 | Implicit Differentiation | 对隐式定义的函数求导 |
| 泰勒级数 | Taylor Series | 用某点导数信息表示函数的幂级数 |
| 麦克劳林级数 | Maclaurin Series | 在零点展开的泰勒级数 |
| 高阶导数 | Higher-order Derivative | 导数的导数 |
| 偏导数 | Partial Derivative | 多元函数对单一变量的导数 |
| 全微分 | Total Differential | 多元函数增量的线性主部 |
| 方向导数 | Directional Derivative | 沿特定方向的变化率 |
| 梯度 | Gradient | 偏导数组成的向量 |
| 散度 | Divergence | 向量场的源强度 |
| 旋度 | Curl | 向量场的旋转程度 |
| 拉普拉斯算子 | Laplacian | 梯度的散度 |
| 多重积分 | Multiple Integral | 多元函数在多维区域上的积分 |
| 线积分 | Line Integral | 沿曲线的积分 |
| 面积分 | Surface Integral | 在曲面上的积分 |
| 格林公式 | Green's Theorem | 平面区域边界与内部的关系 |
| 斯托克斯公式 | Stokes' Theorem | 曲面边界与曲面上旋度的关系 |
| 高斯散度定理 | Divergence Theorem | 封闭曲面与其包围体积的关系 |
| 变量代换 | Change of Variables | 用新变量替换积分变量 |
| 分部积分 | Integration by Parts | 乘积的积分公式 |

### 4.2 实分析 (Real Analysis)

| 中文 | English | 定义 |
|------|---------|------|
| 实数 | Real Number | 有理数和无理数的统称 |
| 完备性 | Completeness | 柯西序列都收敛的性质 |
| 上确界 | Supremum | 最小上界 |
| 下确界 | Infimum | 最大下界 |
| 开集 | Open Set | 每个点都有包含在内的邻域 |
| 闭集 | Closed Set | 补集是开集的集合 |
| 紧集 | Compact Set | 每个开覆盖都有有限子覆盖 |
| 连通集 | Connected Set | 不能分成两个不相交的开集 |
| 序列 | Sequence | 按顺序排列的一列数 |
| 级数 | Series | 序列各项之和 |
| 收敛 | Convergent | 极限存在 |
| 发散 | Divergent | 极限不存在 |
| 绝对收敛 | Absolutely Convergent | 绝对值级数收敛 |
| 条件收敛 | Conditionally Convergent | 收敛但非绝对收敛 |
| 一致收敛 | Uniform Convergence | 函数序列的收敛与自变量无关 |
| 黎曼积分 | Riemann Integral | 用分割和逼近定义的积分 |
| 勒贝格积分 | Lebesgue Integral | 用测度定义的更一般的积分 |
| 可测集 | Measurable Set | 可定义"大小"的集合 |
| 可测函数 | Measurable Function | 原像是可测集的函数 |
| 几乎处处 | Almost Everywhere | 除去测度为零的集合后成立 |
| 控制收敛定理 | Dominated Convergence Theorem | 关于极限与积分交换的定理 |
| 单调收敛定理 | Monotone Convergence Theorem | 单调递增函数列极限与积分交换的定理 |
| 法图引理 | Fatou's Lemma | 关于函数列下极限积分的不等式 |

### 4.3 函数论 (Function Theory)

| 中文 | English | 定义 |
|------|---------|------|
| 函数 | Function | 从定义域到值域的映射 |
| 定义域 | Domain | 函数输入值的集合 |
| 值域 | Range / Codomain | 函数输出值的集合 |
| 反函数 | Inverse Function | 将原函数对应关系反转的函数 |
| 复合函数 | Composite Function | 一个函数的输出作为另一个的输入 |
| 单调函数 | Monotonic Function | 保持或反转序关系的函数 |
| 奇函数 | Odd Function | 满足f(-x)=-f(x)的函数 |
| 偶函数 | Even Function | 满足f(-x)=f(x)的函数 |
| 周期函数 | Periodic Function | 满足f(x+T)=f(x)的函数 |
| 有界函数 | Bounded Function | 值域有界的函数 |
| 初等函数 | Elementary Function | 由基本函数经有限次运算得到的函数 |
| 指数函数 | Exponential Function | 形如a^x的函数 |
| 对数函数 | Logarithmic Function | 指数函数的反函数 |
| 三角函数 | Trigonometric Function | 描述角度与边长关系的函数 |
| 双曲函数 | Hyperbolic Function | 与双曲线相关的函数 |

---

## 5. 微分方程 (Differential Equations)

### 5.1 常微分方程 (Ordinary Differential Equations)

| 中文 | English | 定义 |
|------|---------|------|
| 常微分方程 | Ordinary Differential Equation (ODE) | 含有单变量函数及其导数的方程 |
| 阶 | Order | 方程中最高阶导数的阶数 |
| 通解 | General Solution | 包含任意常数的解 |
| 特解 | Particular Solution | 满足特定条件的解 |
| 初值问题 | Initial Value Problem | 带初始条件的微分方程问题 |
| 边值问题 | Boundary Value Problem | 带边界条件的微分方程问题 |
| 可分离变量方程 | Separable Equation | 可将变量分离的微分方程 |
| 齐次方程 | Homogeneous Equation | 右端为零的线性微分方程 |
| 非齐次方程 | Non-homogeneous Equation | 右端非零的线性微分方程 |
| 线性微分方程 | Linear Differential Equation | 关于未知函数及其导数为线性的方程 |
| 特征方程 | Characteristic Equation | 用于求解常系数线性方程的代数方程 |
| 变分常数法 | Variation of Parameters | 求解非齐次方程的方法 |
| 欧拉方法 | Euler's Method | 一阶数值求解方法 |
| 龙格-库塔方法 | Runge-Kutta Method | 高阶数值求解方法 |
| 存在唯一性定理 | Existence and Uniqueness Theorem | 保证解存在且唯一的定理 |
| 稳定性 | Stability | 解对初始条件扰动的敏感性 |
| 相平面 | Phase Plane | 显示解的定性行为的平面 |
| 奇点 | Singular Point | 相平面上的特殊点 |
| 极限环 | Limit Cycle | 相平面上孤立的闭轨 |
| 吸引子 | Attractor | 系统长期行为趋向的集合 |

### 5.2 偏微分方程 (Partial Differential Equations)

| 中文 | English | 定义 |
|------|---------|------|
| 偏微分方程 | Partial Differential Equation (PDE) | 含有多元函数及其偏导数的方程 |
| 椭圆型方程 | Elliptic Equation | 如拉普拉斯方程的偏微分方程类型 |
| 抛物型方程 | Parabolic Equation | 如热传导方程的偏微分方程类型 |
| 双曲型方程 | Hyperbolic Equation | 如波动方程的偏微分方程类型 |
| 拉普拉斯方程 | Laplace's Equation | ∇²u=0 |
| 泊松方程 | Poisson's Equation | ∇²u=f |
| 热传导方程 | Heat Equation | 描述热传导过程的方程 |
| 波动方程 | Wave Equation | 描述波动传播的方程 |
| 边界条件 | Boundary Condition | 在区域边界上给定的条件 |
| 初始条件 | Initial Condition | 在初始时刻给定的条件 |
| 分离变量法 | Separation of Variables | 将偏微分方程化为常微分方程的方法 |
| 傅里叶级数法 | Fourier Series Method | 利用傅里叶级数求解的方法 |
| 格林函数 | Green's Function | 用于求解非齐次边值问题的函数 |
| 特征函数 | Eigenfunction | 对应特征值的函数 |
| 弱解 | Weak Solution | 在分布意义下满足方程的解 |

---

## 6. 概率论 (Probability Theory)

| 中文 | English | 定义 |
|------|---------|------|
| 样本空间 | Sample Space | 所有可能结果的集合 |
| 事件 | Event | 样本空间的子集 |
| 概率 | Probability | 衡量事件发生可能性的数值 |
| 条件概率 | Conditional Probability | 在某事件已发生条件下另一事件的概率 |
| 独立性 | Independence | 事件互不影响的关系 |
| 乘法公式 | Multiplication Rule | 交事件概率的计算公式 |
| 全概率公式 | Law of Total Probability | 将复杂事件分解计算的方法 |
| 贝叶斯公式 | Bayes' Theorem | 计算后验概率的公式 |
| 随机变量 | Random Variable | 从样本空间到实数的函数 |
| 离散型随机变量 | Discrete Random Variable | 取值为有限或可数个的随机变量 |
| 连续型随机变量 | Continuous Random Variable | 取值为连续区间的随机变量 |
| 概率质量函数 | Probability Mass Function (PMF) | 离散随机变量的概率分布 |
| 概率密度函数 | Probability Density Function (PDF) | 连续随机变量的概率分布描述 |
| 累积分布函数 | Cumulative Distribution Function (CDF) | 分布函数 |
| 期望 | Expectation / Mean | 随机变量的平均值 |
| 方差 | Variance | 衡量随机变量离散程度的量 |
| 标准差 | Standard Deviation | 方差的平方根 |
| 协方差 | Covariance | 两随机变量线性相关性的度量 |
| 相关系数 | Correlation Coefficient | 标准化的协方差 |
| 矩 | Moment | 随机变量幂次的期望 |
| 矩母函数 | Moment Generating Function | 用于计算矩的函数 |
| 特征函数 | Characteristic Function | 傅里叶变换得到的函数 |
| 伯努利分布 | Bernoulli Distribution | 0-1分布 |
| 二项分布 | Binomial Distribution | n次独立伯努利试验的分布 |
| 泊松分布 | Poisson Distribution | 描述稀有事件发生次数的分布 |
| 均匀分布 | Uniform Distribution | 等概率分布 |
| 正态分布 | Normal Distribution | 高斯分布，钟形曲线 |
| 指数分布 | Exponential Distribution | 描述等待时间的分布 |
| 伽马分布 | Gamma Distribution | 指数分布的推广 |
| 贝塔分布 | Beta Distribution | (0,1)区间上的连续分布 |
| 卡方分布 | Chi-squared Distribution | 独立标准正态变量平方和的分布 |
| t分布 | Student's t-Distribution | 小样本情况下使用的分布 |
| F分布 | F-Distribution | 两个卡方分布比值的分布 |
| 大数定律 | Law of Large Numbers | 样本均值收敛到期望的定理 |
| 中心极限定理 | Central Limit Theorem | 独立同分布变量和趋近正态分布的定理 |
| 联合分布 | Joint Distribution | 多个随机变量的整体分布 |
| 边缘分布 | Marginal Distribution | 从联合分布得到的单个变量分布 |
| 条件分布 | Conditional Distribution | 给定条件下随机变量的分布 |
| 独立同分布 | Independent and Identically Distributed (i.i.d.) | 相互独立且同分布的随机变量 |

---

## 7. 数理统计 (Mathematical Statistics)

| 中文 | English | 定义 |
|------|---------|------|
| 总体 | Population | 研究对象的全体 |
| 样本 | Sample | 从总体中抽取的部分个体 |
| 统计量 | Statistic | 样本的函数 |
| 估计量 | Estimator | 用于估计参数的统计量 |
| 点估计 | Point Estimation | 用单个值估计参数 |
| 区间估计 | Interval Estimation | 用区间估计参数 |
| 置信区间 | Confidence Interval | 包含参数的概率为某值的区间 |
| 无偏估计 | Unbiased Estimator | 期望等于真值的估计量 |
| 有效估计 | Efficient Estimator | 方差最小的无偏估计 |
| 一致估计 | Consistent Estimator | 样本量增大时收敛到真值的估计 |
| 最大似然估计 | Maximum Likelihood Estimation (MLE) | 使似然函数最大的估计方法 |
| 矩估计 | Method of Moments | 用样本矩估计总体矩的方法 |
| 贝叶斯估计 | Bayesian Estimation | 结合先验分布的估计方法 |
| 先验分布 | Prior Distribution | 参数的初始分布 |
| 后验分布 | Posterior Distribution | 结合观测后的参数分布 |
| 假设检验 | Hypothesis Testing | 判断假设是否成立的统计方法 |
| 原假设 | Null Hypothesis | 待检验的初始假设 |
| 备择假设 | Alternative Hypothesis | 与原假设对立的假设 |
| 显著性水平 | Significance Level | 犯第一类错误的概率上限 |
| p值 | p-value | 在原假设下观测到更极端结果的概率 |
| 第一类错误 | Type I Error | 拒真错误 |
| 第二类错误 | Type II Error | 取伪错误 |
| 功效 | Power | 正确拒绝错误假设的概率 |
| 似然比检验 | Likelihood Ratio Test | 基于似然函数比的检验方法 |
| 卡方检验 | Chi-squared Test | 基于卡方分布的检验方法 |
| t检验 | t-test | 基于t分布的检验方法 |
| F检验 | F-test | 基于F分布的检验方法 |
| 回归分析 | Regression Analysis | 研究变量间关系的统计方法 |
| 线性回归 | Linear Regression | 线性模型的回归分析 |
| 最小二乘法 | Least Squares | 使残差平方和最小的估计方法 |
| 残差 | Residual | 观测值与预测值之差 |
| 决定系数 | Coefficient of Determination (R²) | 模型解释变异的比例 |
| 方差分析 | Analysis of Variance (ANOVA) | 比较多组均值的方法 |
| 主成分分析 | Principal Component Analysis (PCA) | 降维技术 |
| 因子分析 | Factor Analysis | 寻找潜在因子的方法 |
| 聚类分析 | Cluster Analysis | 将数据分组的方法 |

---

## 8. 数论 (Number Theory)

| 中文 | English | 定义 |
|------|---------|------|
| 整除 | Divisibility | 一个数是另一个数的倍数 |
| 素数 | Prime Number | 大于1且只有1和自身两个正因子的数 |
| 合数 | Composite Number | 大于1且非素数的正整数 |
| 最大公约数 | Greatest Common Divisor (GCD) | 能同时整除多个数的最大正整数 |
| 最小公倍数 | Least Common Multiple (LCM) | 同时是多个数倍数的最小正整数 |
| 互素 | Coprime | 最大公约数为1的两个数 |
| 欧几里得算法 | Euclidean Algorithm | 求最大公约数的算法 |
| 算术基本定理 | Fundamental Theorem of Arithmetic | 整数唯一分解定理 |
| 同余 | Congruence | 模某数相等的整数关系 |
| 模运算 | Modular Arithmetic | 在模数下的运算 |
| 中国剩余定理 | Chinese Remainder Theorem | 同余方程组的求解定理 |
| 费马小定理 | Fermat's Little Theorem | 关于素数模的性质 |
| 欧拉定理 | Euler's Theorem | 费马小定理的推广 |
| 欧拉函数 | Euler's Totient Function | 小于n且与n互素的正整数个数 |
| 威尔逊定理 | Wilson's Theorem | 关于素数的判定定理 |
| 二次剩余 | Quadratic Residue | 模某素数的平方剩余 |
| 勒让德符号 | Legendre Symbol | 表示二次剩余的符号 |
| 丢番图方程 | Diophantine Equation | 只求整数解的方程 |
| 佩尔方程 | Pell's Equation | 形如x²-Dy²=1的方程 |
| 黎曼ζ函数 | Riemann Zeta Function | 与素数分布密切相关的函数 |
| 黎曼猜想 | Riemann Hypothesis | 关于ζ函数零点的著名猜想 |
| 数论函数 | Arithmetic Function | 定义在正整数上的函数 |
| 莫比乌斯函数 | Möbius Function | 用于反演的数论函数 |
| 莫比乌斯反演 | Möbius Inversion | 求和函数的反演公式 |
| 素数定理 | Prime Number Theorem | 描述素数分布渐近行为的定理 |
| 连分数 | Continued Fraction | 分式的嵌套表示 |
| 丢番图逼近 | Diophantine Approximation | 用有理数逼近实数的理论 |

---

## 9. 拓扑学 (Topology)

| 中文 | English | 定义 |
|------|---------|------|
| 拓扑空间 | Topological Space | 定义了开集结构的集合 |
| 拓扑 | Topology | 满足特定条件的开集族 |
| 开集 | Open Set | 拓扑的基本元素 |
| 闭集 | Closed Set | 开集的补集 |
| 邻域 | Neighborhood | 包含某点的开集 |
| 内部 | Interior | 包含在某集合内的最大开集 |
| 闭包 | Closure | 包含某集合的最小闭集 |
| 边界 | Boundary | 闭包减去内部 |
| 连续映射 | Continuous Map | 开集的原像是开集的映射 |
| 同胚 | Homeomorphism | 双向连续可逆的映射 |
| 拓扑不变量 | Topological Invariant | 同胚映射下保持不变的性质 |
| 紧空间 | Compact Space | 每个开覆盖有有限子覆盖 |
| 连通空间 | Connected Space | 不能分成两个不相交开集 |
| 道路连通 | Path-connected | 任意两点可用道路连接 |
| 分离公理 | Separation Axioms | 区分点与集合的公理 |
| 豪斯多夫空间 | Hausdorff Space | 任意两点有不相交邻域 |
| 度量空间 | Metric Space | 定义了距离的空间 |
| 完备度量空间 | Complete Metric Space | 柯西序列都收敛的度量空间 |
| 紧化 | Compactification | 将空间嵌入紧空间的过程 |
| 商拓扑 | Quotient Topology | 等价类上的自然拓扑 |
| 积拓扑 | Product Topology | 乘积空间上的自然拓扑 |
| 诱导拓扑 | Subspace Topology | 子集上的自然拓扑 |
| 基本群 | Fundamental Group | 刻画空间"洞"的代数不变量 |
| 同伦 | Homotopy | 映射间的连续变形 |
| 同调群 | Homology Group | 刻画空间拓扑特征的群 |
| 上同调 | Cohomology | 同调的对偶理论 |
| 流形 | Manifold | 局部同胚于欧氏空间的空间 |
| 可定向性 | Orientability | 流形能否一致定向的性质 |
| 欧拉示性数 | Euler Characteristic | 拓扑不变量，V-E+F |
| 贝蒂数 | Betti Number | 刻画连通分支和"洞"数量的数 |
| 覆盖空间 | Covering Space | 局部同胚于基空间的空间 |
| 纤维丛 | Fiber Bundle | 局部为乘积结构的几何对象 |

---

## 10. 数值分析 (Numerical Analysis)

| 中文 | English | 定义 |
|------|---------|------|
| 数值稳定性 | Numerical Stability | 算法对误差的敏感程度 |
| 舍入误差 | Round-off Error | 有限精度计算产生的误差 |
| 截断误差 | Truncation Error | 近似方法产生的误差 |
| 插值 | Interpolation | 通过已知点构造近似函数 |
| 拉格朗日插值 | Lagrange Interpolation | 用拉格朗日多项式插值 |
| 牛顿插值 | Newton Interpolation | 用差商构造插值多项式 |
| 样条插值 | Spline Interpolation | 用分段多项式插值 |
| 数值积分 | Numerical Integration | 用数值方法计算积分 |
| 梯形法则 | Trapezoidal Rule | 用梯形面积近似积分 |
| 辛普森法则 | Simpson's Rule | 用抛物线面积近似积分 |
| 高斯求积 | Gaussian Quadrature | 最优节点和权重的积分方法 |
| 数值微分 | Numerical Differentiation | 用数值方法计算导数 |
| 方程求根 | Root Finding | 求方程零点的数值方法 |
| 二分法 | Bisection Method | 区间折半求根方法 |
| 牛顿法 | Newton's Method | 用切线逼近求根的方法 |
| 割线法 | Secant Method | 用割线逼近求根的方法 |
| 不动点迭代 | Fixed-point Iteration | 求函数不动点的方法 |
| 线性方程组数值解 | Numerical Solution of Linear Systems | 用数值方法解线性方程组 |
| LU分解 | LU Decomposition | 将矩阵分解为下三角和上三角 |
| QR分解 | QR Decomposition | 将矩阵分解为正交和上三角矩阵 |
| 迭代法 | Iterative Method | 通过迭代逼近解的方法 |
| 雅可比方法 | Jacobi Method | 线性方程组的迭代解法 |
| 高斯-赛德尔方法 | Gauss-Seidel Method | 改进的迭代解法 |
| 共轭梯度法 | Conjugate Gradient Method | 对称正定方程组的高效解法 |
| 特征值数值计算 | Numerical Eigenvalue Computation | 计算特征值的数值方法 |
| 幂法 | Power Method | 计算主特征值的迭代方法 |
| QR算法 | QR Algorithm | 计算所有特征值的方法 |
| 常微分方程数值解 | Numerical ODE Solution | 用数值方法解常微分方程 |
| 有限差分法 | Finite Difference Method | 用差商近似导数的方法 |
| 有限元法 | Finite Element Method | 基于变分原理的数值方法 |
| 边界元法 | Boundary Element Method | 在边界上离散的数值方法 |
| 谱方法 | Spectral Method | 用全局基函数的方法 |
| 多重网格法 | Multigrid Method | 利用多尺度加速收敛的方法 |
| 快速傅里叶变换 | Fast Fourier Transform (FFT) | 高效计算离散傅里叶变换的算法 |
| 条件数 | Condition Number | 问题对输入误差敏感性的度量 |

---

## 11. 离散数学 (Discrete Mathematics)

| 中文 | English | 定义 |
|------|---------|------|
| 命题逻辑 | Propositional Logic | 研究命题及其推理的逻辑 |
| 谓词逻辑 | Predicate Logic | 包含量词的逻辑系统 |
| 逻辑连接词 | Logical Connective | 连接命题的符号 |
| 合取 | Conjunction | 逻辑"与" |
| 析取 | Disjunction | 逻辑"或" |
| 否定 | Negation | 逻辑"非" |
| 蕴涵 | Implication | 逻辑"如果...则..." |
| 等价 | Equivalence | 逻辑"当且仅当" |
| 量词 | Quantifier | 表示数量的逻辑符号 |
| 全称量词 | Universal Quantifier | "对于所有" |
| 存在量词 | Existential Quantifier | "存在" |
| 推理规则 | Inference Rule | 从前提到结论的推导规则 |
| 图 | Graph | 顶点和边的集合 |
| 有向图 | Directed Graph / Digraph | 边有方向的图 |
| 无向图 | Undirected Graph | 边无方向的图 |
| 顶点 | Vertex | 图中的点 |
| 边 | Edge | 连接顶点的线 |
| 度 | Degree | 与顶点相连的边数 |
| 入度 | In-degree | 指向顶点的有向边数 |
| 出度 | Out-degree | 从顶点出发的有向边数 |
| 路径 | Path | 依次经过的顶点和边序列 |
| 回路 | Cycle | 起点等于终点的路径 |
| 连通图 | Connected Graph | 任意两点都有路径的图 |
| 树 | Tree | 无回路的连通图 |
| 生成树 | Spanning Tree | 包含所有顶点的树 |
| 二叉树 | Binary Tree | 每个节点最多两个子节点的树 |
| 完全图 | Complete Graph | 每对顶点都有边的图 |
| 二部图 | Bipartite Graph | 顶点分成两部分，边只连接不同部分 |
| 平面图 | Planar Graph | 可在平面上画出且边不相交的图 |
| 欧拉路径 | Eulerian Path | 经过每条边恰好一次的路径 |
| 哈密顿路径 | Hamiltonian Path | 经过每个顶点恰好一次的路径 |
| 图着色 | Graph Coloring | 给顶点或边分配颜色 |
| 色数 | Chromatic Number | 图着色所需的最少颜色数 |
| 组合 | Combination | 从集合中选取元素的方式数 |
| 排列 | Permutation | 集合元素的所有可能排序 |
| 二项式系数 | Binomial Coefficient | 组合数的另一种表示 |
| 杨辉三角 | Pascal's Triangle | 二项式系数的三角形排列 |
| 鸽巢原理 | Pigeonhole Principle | n+1个物品放入n个盒子必有盒子有多个物品 |
| 容斥原理 | Inclusion-Exclusion Principle | 计算并集元素个数的方法 |
| 生成函数 | Generating Function | 用幂级数编码序列的函数 |
| 递推关系 | Recurrence Relation | 序列项之间的关系 |
| 母函数 | Generating Function | 同生成函数 |
| 自动机 | Automaton | 抽象计算模型 |
| 有限状态自动机 | Finite Automaton | 有限状态的自动机 |
| 正则语言 | Regular Language | 有限自动机能识别的语言 |
| 上下文无关文法 | Context-free Grammar | 递归定义的语言结构 |
| 图灵机 | Turing Machine | 通用计算模型 |
| 可计算性 | Computability | 问题能否被算法解决 |
| 计算复杂度 | Computational Complexity | 问题求解所需的资源 |
| P类问题 | P Class | 多项式时间可解的问题 |
| NP类问题 | NP Class | 多项式时间可验证的问题 |
| NP完全 | NP-complete | NP中最难的问题 |
| 布尔代数 | Boolean Algebra | 0和1上的代数结构 |

---

## 12. 复变函数 (Complex Analysis)

| 中文 | English | 定义 |
|------|---------|------|
| 复数 | Complex Number | a+bi形式的数 |
| 实部 | Real Part | 复数中的a |
| 虚部 | Imaginary Part | 复数中的b |
| 模 | Modulus / Absolute Value | 复数到原点的距离 |
| 辐角 | Argument | 复数在复平面上的角度 |
| 共轭复数 | Complex Conjugate | 虚部取反的复数 |
| 复平面 | Complex Plane | 复数的几何表示 |
| 欧拉公式 | Euler's Formula | e^(iθ)=cosθ+isinθ |
| 解析函数 | Analytic Function | 在区域内可导的复函数 |
| 全纯函数 | Holomorphic Function | 同解析函数 |
| 柯西-黎曼方程 | Cauchy-Riemann Equations | 解析的必要条件 |
| 柯西积分定理 | Cauchy's Integral Theorem | 沿闭路积分为零的定理 |
| 柯西积分公式 | Cauchy's Integral Formula | 用边界值表示内部值的公式 |
| 泰勒级数 | Taylor Series | 解析函数的幂级数展开 |
| 洛朗级数 | Laurent Series | 包含负幂项的级数展开 |
| 孤立奇点 | Isolated Singularity | 函数在某点不解析但在邻域内解析 |
| 极点 | Pole | 洛朗级数有有限个负幂项 |
| 本性奇点 | Essential Singularity | 洛朗级数有无穷多负幂项 |
| 可去奇点 | Removable Singularity | 可通过重新定义函数值消除的奇点 |
| 留数 | Residue | 洛朗级数-1次幂项的系数 |
| 留数定理 | Residue Theorem | 用留数计算围道积分的定理 |
| 辐角原理 | Argument Principle | 关于零点和极点个数的定理 |
| 路西定理 | Rouché's Theorem | 比较两函数零点个数的定理 |
| 保角映射 | Conformal Mapping | 保持角度的复映射 |
| 黎曼映射定理 | Riemann Mapping Theorem | 单连通区域与单位圆盘的保角对应 |
| 支割线 | Branch Cut | 多值函数的割线 |
| 黎曼面 | Riemann Surface | 多值函数的单值化曲面 |
| 解析延拓 | Analytic Continuation | 扩大解析函数定义域的方法 |
| 伽马函数 | Gamma Function | 阶乘的推广 |
| ζ函数 | Zeta Function | 复平面上的特殊函数 |

---

## 13. 泛函分析 (Functional Analysis)

| 中文 | English | 定义 |
|------|---------|------|
| 赋范空间 | Normed Space | 定义了范数的向量空间 |
| 巴拿赫空间 | Banach Space | 完备的赋范空间 |
| 希尔伯特空间 | Hilbert Space | 完备的内积空间 |
| 内积空间 | Inner Product Space | 定义了内积的向量空间 |
| 对偶空间 | Dual Space | 连续线性泛函组成的空间 |
| 线性泛函 | Linear Functional | 到标量域的线性映射 |
| 算子 | Operator | 空间之间的线性映射 |
| 有界算子 | Bounded Operator | 将有界集映射为有界集的算子 |
| 算子范数 | Operator Norm | 有界算子的范数 |
| 紧算子 | Compact Operator | 将有界集映射为相对紧集的算子 |
| 自伴算子 | Self-adjoint Operator | 等于其伴随的算子 |
| 酉算子 | Unitary Operator | 保持内积的算子 |
| 正规算子 | Normal Operator | 与其伴随可交换的算子 |
| 谱 | Spectrum | 算子不可逆的标量集合 |
| 谱定理 | Spectral Theorem | 自伴算子的对角化定理 |
| 弱收敛 | Weak Convergence | 对所有泛函都收敛的收敛方式 |
| 强收敛 | Strong Convergence | 依范数收敛 |
| 哈恩-巴拿赫定理 | Hahn-Banach Theorem | 泛函延拓定理 |
| 开映射定理 | Open Mapping Theorem | 有界算子将开集映为开集的定理 |
| 闭图像定理 | Closed Graph Theorem | 闭图像与连续性等价的定理 |
| 一致有界原理 | Uniform Boundedness Principle | 逐点有界蕴含一致有界的定理 |
| 里兹表示定理 | Riesz Representation Theorem | 希尔伯特空间泛函的表示 |
| 施瓦茨不等式 | Schwarz Inequality | 内积与范数的不等式 |
| 三角不等式 | Triangle Inequality | 范数的不等式 |
| 正交投影 | Orthogonal Projection | 到闭子空间的投影 |
| 里斯引理 | Riesz's Lemma | 关于单位球面紧性的引理 |
| 弱*拓扑 | Weak-* Topology | 对偶空间上的弱拓扑 |
| 自反空间 | Reflexive Space | 典范嵌入为满射的空间 |
| 可分空间 | Separable Space | 有可数稠密子集的空间 |
| 索伯列夫空间 | Sobolev Space | 弱导数属于L^p的函数空间 |
| 分布 | Distribution | 广义函数 |

---

## 14. 微分几何 (Differential Geometry)

| 中文 | English | 定义 |
|------|---------|------|
| 流形 | Manifold | 局部同胚于欧氏空间的拓扑空间 |
| 切空间 | Tangent Space | 流形某点处的线性近似空间 |
| 切丛 | Tangent Bundle | 所有切空间的并集 |
| 余切空间 | Cotangent Space | 切空间的对偶空间 |
| 余切丛 | Cotangent Bundle | 所有余切空间的并集 |
| 向量场 | Vector Field | 流形上每点指定一个切向量 |
| 张量场 | Tensor Field | 流形上每点指定一个张量 |
| 微分形式 | Differential Form | 反对称协变张量场 |
| 外微分 | Exterior Derivative | 微分形式上的微分算子 |
| 楔积 | Wedge Product | 微分形式的外积 |
| 李导数 | Lie Derivative | 沿向量场的导数 |
| 联络 | Connection | 比较不同点切空间的工具 |
| 协变导数 | Covariant Derivative | 用联络定义的导数 |
| 平行移动 | Parallel Transport | 沿曲线保持切向量"平行"的移动 |
| 测地线 | Geodesic | 局部最短曲线 |
| 曲率张量 | Curvature Tensor | 度量弯曲程度的张量 |
| 黎曼曲率张量 | Riemann Curvature Tensor | 黎曼流形的曲率度量 |
| 里奇曲率 | Ricci Curvature | 曲率张量的迹 |
| 标量曲率 | Scalar Curvature | 里奇曲率的迹 |
| 截面曲率 | Sectional Curvature | 二维平面方向的曲率 |
| 度量张量 | Metric Tensor | 定义流形上长度和角度的张量 |
| 黎曼流形 | Riemannian Manifold | 定义了黎曼度量的流形 |
| 伪黎曼流形 | Pseudo-Riemannian Manifold | 度量不一定正定的流形 |
| 体积形式 | Volume Form | 用于计算体积的微分形式 |
| 霍奇星算子 | Hodge Star Operator | 微分形式之间的线性映射 |
| 霍奇对偶 | Hodge Dual | 霍奇星算子的像 |
| 德拉姆上同调 | de Rham Cohomology | 用闭形式模恰当形式定义的上同调 |
| 示性类 | Characteristic Class | 向量丛的拓扑不变量 |
| 陈类 | Chern Class | 复向量丛的示性类 |
| 庞特里亚金类 | Pontryagin Class | 实向量丛的示性类 |
| 欧拉类 | Euler Class | 定向向量丛的示性类 |
| 指标定理 | Index Theorem | 联系分析与拓扑的定理 |
| 陈-西蒙斯形式 | Chern-Simons Form | 与陈类相关的微分形式 |
| 仿射联络 | Affine Connection | 无挠的联络 |
| 挠率 | Torsion | 联络的非对称性度量 |
| 和乐群 | Holonomy Group | 沿闭曲线平行移动的变换群 |
| 子流形 | Submanifold | 嵌入另一流形中的流形 |
| 诱导度量 | Induced Metric | 子流形从外围流形继承的度量 |
| 第一基本形式 | First Fundamental Form | 子流形的度量 |
| 第二基本形式 | Second Fundamental Form | 描述子流形弯曲程度的张量 |
| 平均曲率 | Mean Curvature | 第二基本形式的迹 |
| 高斯曲率 | Gauss Curvature | 曲面两个主曲率的乘积 |
| 主曲率 | Principal Curvature | 曲面某点曲率的极值 |
| 高斯-博内定理 | Gauss-Bonnet Theorem | 联系曲率与欧拉示性数的定理 |
| 极小子流形 | Minimal Submanifold | 平均曲率为零的子流形 |

---

## 参考文献

1. 同济大学数学系. 高等数学. 高等教育出版社.
2. 北京大学数学系. 数学分析. 高等教育出版社.
3. 丘维声. 简明线性代数. 北京大学出版社.
4. 华东师范大学数学系. 数学分析. 高等教育出版社.
5. Wikipedia - List of mathematical topics
6. Springer - Encyclopedia of Mathematics

---

*最后更新: 2026年3月*
