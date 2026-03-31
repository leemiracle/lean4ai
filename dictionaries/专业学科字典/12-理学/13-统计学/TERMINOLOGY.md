# 统计学术语表 (Statistics Terminology)

---

## 一、概率论基础 (Probability Theory Fundamentals)

| 中文 | 英文 | 定义 |
|------|------|------|
| 随机试验 | Random Experiment | 可以在相同条件下重复进行，且结果不可预先确定的试验 |
| 样本空间 | Sample Space | 随机试验所有可能结果的集合 |
| 样本点 | Sample Point | 样本空间中的单个元素，即一个基本结果 |
| 事件 | Event | 样本空间的子集，即若干样本点的集合 |
| 基本事件 | Elementary Event | 由单个样本点组成的事件 |
| 必然事件 | Certain Event | 在每次试验中必定发生的事件，即样本空间本身 |
| 不可能事件 | Impossible Event | 在任何试验中都不会发生的事件，即空集 |
| 互斥事件 | Mutually Exclusive Events | 两个事件不能同时发生，即交集为空 |
| 独立事件 | Independent Events | 一个事件的发生不影响另一个事件发生的概率 |
| 对立事件 | Complementary Events | 事件A不发生的事件，记作Aᶜ或Ā |
| 条件概率 | Conditional Probability | 在事件B已发生的条件下事件A发生的概率，记作P(A\|B) |
| 概率 | Probability | 描述随机事件发生可能性大小的数值，取值范围[0,1] |
| 古典概型 | Classical Probability | 有限个等可能结果的概率模型 |
| 几何概型 | Geometric Probability | 样本点有无限多个且均匀分布的概率模型 |
| 全概率公式 | Law of Total Probability | 将复杂事件分解为简单事件之和的概率计算公式 |
| 贝叶斯公式 | Bayes' Theorem | 根据新信息修正先验概率的公式 |
| 先验概率 | Prior Probability | 在考虑新证据之前对事件发生概率的初始估计 |
| 后验概率 | Posterior Probability | 考虑新证据后修正的概率 |
| 乘法公式 | Multiplication Rule | 计算多个事件同时发生概率的公式 |
| 加法公式 | Addition Rule | 计算事件并集概率的公式 |
| 排列 | Permutation | 从n个不同元素中取出m个元素进行有序排列的方式数 |
| 组合 | Combination | 从n个不同元素中取出m个元素进行无序选择的方式数 |

---

## 二、随机变量与分布 (Random Variables and Distributions)

| 中文 | 英文 | 定义 |
|------|------|------|
| 随机变量 | Random Variable | 定义在样本空间上的实值函数，将每个结果映射为实数 |
| 离散型随机变量 | Discrete Random Variable | 取值为有限个或可数无限个的随机变量 |
| 连续型随机变量 | Continuous Random Variable | 取值充满某个区间的随机变量 |
| 概率质量函数 | Probability Mass Function (PMF) | 离散随机变量取各个值的概率 |
| 概率密度函数 | Probability Density Function (PDF) | 描述连续随机变量概率分布的函数 |
| 累积分布函数 | Cumulative Distribution Function (CDF) | 随机变量小于等于某值的概率 |
| 期望 | Expectation / Expected Value | 随机变量取值的加权平均，反映集中趋势 |
| 方差 | Variance | 随机变量与其期望之差的平方的期望，反映离散程度 |
| 标准差 | Standard Deviation | 方差的平方根，与原变量同量纲的离散度量 |
| 协方差 | Covariance | 衡量两个随机变量线性相关程度的量 |
| 相关系数 | Correlation Coefficient | 标准化后的协方差，取值范围[-1,1] |
| 矩 | Moment | 随机变量幂次的期望，分为原点矩和中心矩 |
| 偏度 | Skewness | 描述分布不对称程度的统计量 |
| 峰度 | Kurtosis | 描述分布尾部厚薄程度的统计量 |
| 伯努利分布 | Bernoulli Distribution | 只有两个可能结果的单次随机试验的分布 |
| 二项分布 | Binomial Distribution | n次独立伯努利试验中成功次数的分布 |
| 泊松分布 | Poisson Distribution | 描述单位时间/空间内稀有事件发生次数的分布 |
| 几何分布 | Geometric Distribution | 首次成功所需试验次数的分布 |
| 超几何分布 | Hypergeometric Distribution | 无放回抽样中成功次数的分布 |
| 负二项分布 | Negative Binomial Distribution | 达到指定成功次数所需试验次数的分布 |
| 均匀分布 | Uniform Distribution | 在区间内取值概率相等的连续分布 |
| 正态分布 | Normal Distribution | 最重要的连续分布，呈钟形曲线 |
| 标准正态分布 | Standard Normal Distribution | 均值为0、标准差为1的正态分布 |
| 指数分布 | Exponential Distribution | 描述独立随机事件间隔时间的分布 |
| 伽马分布 | Gamma Distribution | 指数分布的推广，形状参数和尺度参数控制 |
| 贝塔分布 | Beta Distribution | 定义在[0,1]区间上的灵活连续分布 |
| 卡方分布 | Chi-Square Distribution | 独立标准正态变量平方和的分布 |
| t分布 | Student's t-Distribution | 小样本情况下总体均值推断的重要分布 |
| F分布 | F-Distribution | 两个独立卡方变量之比的分布 |
| 对数正态分布 | Log-Normal Distribution | 对数服从正态分布的随机变量的分布 |
| 威布尔分布 | Weibull Distribution | 常用于可靠性分析和寿命测试的分布 |
| 联合分布 | Joint Distribution | 多个随机变量同时取值的概率分布 |
| 边缘分布 | Marginal Distribution | 从联合分布中对某些变量积分得到的分布 |
| 条件分布 | Conditional Distribution | 在给定条件下随机变量的概率分布 |
| 独立同分布 | Independent and Identically Distributed (i.i.d.) | 多个随机变量相互独立且服从相同分布 |
| 大数定律 | Law of Large Numbers | 样本均值依概率收敛于总体均值的定理 |
| 中心极限定理 | Central Limit Theorem (CLT) | 独立随机变量和的分布趋于正态分布的定理 |

---

## 三、数理统计基础 (Foundations of Mathematical Statistics)

| 中文 | 英文 | 定义 |
|------|------|------|
| 总体 | Population | 研究对象的全体 |
| 样本 | Sample | 从总体中抽取的部分个体 |
| 样本容量 | Sample Size | 样本中个体的数量 |
| 统计量 | Statistic | 由样本数据计算得到的量 |
| 参数 | Parameter | 描述总体特征的数值 |
| 点估计 | Point Estimation | 用单个数值估计总体参数 |
| 区间估计 | Interval Estimation | 用区间估计总体参数的可能范围 |
| 估计量 | Estimator | 用于估计参数的统计量 |
| 估计值 | Estimate | 估计量的具体实现值 |
| 无偏性 | Unbiasedness | 估计量的期望等于被估参数的性质 |
| 有效性 | Efficiency | 在无偏估计量中方差最小的性质 |
| 一致性 | Consistency | 样本量增大时估计量收敛于真值的性质 |
| 均方误差 | Mean Squared Error (MSE) | 估计量与参数之差的平方的期望 |
| 充分统计量 | Sufficient Statistic | 包含样本中关于参数全部信息的统计量 |
| 极大似然估计 | Maximum Likelihood Estimation (MLE) | 使似然函数最大化的参数估计方法 |
| 矩估计 | Method of Moments | 用样本矩估计总体矩的方法 |
| 最小二乘估计 | Least Squares Estimation | 使残差平方和最小的参数估计方法 |
| 似然函数 | Likelihood Function | 参数取不同值时观测到样本的概率 |
| 对数似然函数 | Log-Likelihood Function | 似然函数的对数，便于计算和求导 |
| 置信区间 | Confidence Interval | 以一定置信水平包含参数真值的区间 |
| 置信水平 | Confidence Level | 置信区间包含参数真值的概率 |
| 显著性水平 | Significance Level | 犯第一类错误的最大允许概率，通常记作α |

---

## 四、假设检验 (Hypothesis Testing)

| 中文 | 英文 | 定义 |
|------|------|------|
| 假设检验 | Hypothesis Testing | 根据样本推断总体假设是否成立的统计方法 |
| 原假设 | Null Hypothesis | 待检验的初始假设，通常表示无效应或无差异 |
| 备择假设 | Alternative Hypothesis | 与原假设对立的假设，表示有效应或有差异 |
| 检验统计量 | Test Statistic | 用于决策是否拒绝原假设的统计量 |
| 拒绝域 | Rejection Region | 检验统计量取值导致拒绝原假设的区域 |
| 接受域 | Acceptance Region | 检验统计量取值不拒绝原假设的区域 |
| 临界值 | Critical Value | 拒绝域与接受域的分界值 |
| p值 | p-value | 在原假设成立下观测到当前或更极端结果的概率 |
| 第一类错误 | Type I Error | 原假设为真时错误拒绝的概率 |
| 第二类错误 | Type II Error | 原假设为假时错误接受的概率 |
| 检验功效 | Power of Test | 原假设为假时正确拒绝的概率，等于1-β |
| 单侧检验 | One-Tailed Test | 备择假设为单方向的假设检验 |
| 双侧检验 | Two-Tailed Test | 备择假设为双方向的假设检验 |
| z检验 | z-Test | 使用标准正态分布的假设检验 |
| t检验 | t-Test | 使用t分布的假设检验，适用于小样本 |
| 卡方检验 | Chi-Square Test | 使用卡方分布的假设检验 |
| F检验 | F-Test | 使用F分布的假设检验 |
| 拟合优度检验 | Goodness-of-Fit Test | 检验数据是否服从某分布的检验 |
| 独立性检验 | Test of Independence | 检验两个分类变量是否独立的卡方检验 |
| 列联表 | Contingency Table | 展示两个分类变量频数的表格 |
| 符号检验 | Sign Test | 基于符号的非参数检验方法 |
| 秩和检验 | Rank Sum Test | 基于秩次的非参数检验方法 |
| 正态性检验 | Normality Test | 检验数据是否服从正态分布的检验 |
| 多重比较 | Multiple Comparison | 同时进行多个假设检验的校正方法 |
| Bonferroni校正 | Bonferroni Correction | 控制多重比较整体错误率的校正方法 |
| 似然比检验 | Likelihood Ratio Test | 基于似然函数比的假设检验 |
| Wald检验 | Wald Test | 基于参数估计渐近正态性的检验 |

---

## 五、回归分析 (Regression Analysis)

| 中文 | 英文 | 定义 |
|------|------|------|
| 回归分析 | Regression Analysis | 研究变量间依赖关系的统计方法 |
| 简单线性回归 | Simple Linear Regression | 一个自变量和一个因变量的线性回归 |
| 多元线性回归 | Multiple Linear Regression | 多个自变量的线性回归 |
| 因变量 | Dependent Variable | 被解释的变量，通常记作Y |
| 自变量 | Independent Variable | 解释变量，通常记作X |
| 回归系数 | Regression Coefficient | 回归方程中自变量的系数 |
| 截距 | Intercept | 回归线与Y轴的交点 |
| 斜率 | Slope | 回归线的倾斜程度 |
| 残差 | Residual | 观测值与预测值之差 |
| 残差平方和 | Residual Sum of Squares (RSS) | 所有残差平方的总和 |
| 决定系数 | Coefficient of Determination (R²) | 模型解释的变异占总变异的比例 |
| 调整R² | Adjusted R² | 考虑自变量数量的修正决定系数 |
| 最小二乘法 | Ordinary Least Squares (OLS) | 使残差平方和最小的参数估计方法 |
| 多重共线性 | Multicollinearity | 自变量之间存在高度相关性的问题 |
| 方差膨胀因子 | Variance Inflation Factor (VIF) | 衡量多重共线性严重程度的指标 |
| 残差分析 | Residual Analysis | 检验回归假设是否成立的诊断方法 |
| 异方差性 | Heteroscedasticity | 误差项方差不相等的情况 |
| 自相关 | Autocorrelation | 误差项之间存在相关性的情况 |
| Durbin-Watson检验 | Durbin-Watson Test | 检验误差项自相关的统计检验 |
| 杠杆值 | Leverage | 衡量观测点对回归拟合影响程度的指标 |
| 影响点 | Influential Point | 对回归结果有重大影响的观测点 |
| Cook距离 | Cook's Distance | 衡量观测点影响力的综合指标 |
| 逐步回归 | Stepwise Regression | 自动选择变量的回归方法 |
| 岭回归 | Ridge Regression | 处理多重共线性的正则化回归方法 |
| Lasso回归 | Lasso Regression | 具有变量选择功能的正则化回归方法 |
| 弹性网络 | Elastic Net | 结合岭回归和Lasso的正则化方法 |
| 逻辑回归 | Logistic Regression | 因变量为二分类的回归分析方法 |
| 几率 | Odds | 事件发生与不发生概率之比 |
| 对数几率 | Log-Odds / Logit | 几率的自然对数 |
| Probit回归 | Probit Regression | 使用正态累积分布函数的二元响应模型 |
| 多项式回归 | Polynomial Regression | 包含自变量高次项的回归模型 |
| 交互效应 | Interaction Effect | 一个自变量的效应依赖于另一个自变量的水平 |
| 广义线性模型 | Generalized Linear Model (GLM) | 线性模型的推广，允许非正态分布响应变量 |
| 链接函数 | Link Function | 连接线性预测器与响应变量均值的函数 |

---

## 六、方差分析 (Analysis of Variance)

| 中文 | 英文 | 定义 |
|------|------|------|
| 方差分析 | Analysis of Variance (ANOVA) | 比较多个总体均值是否相等的统计方法 |
| 单因素方差分析 | One-Way ANOVA | 只有一个因素影响的方差分析 |
| 双因素方差分析 | Two-Way ANOVA | 两个因素影响的方差分析 |
| 因素 | Factor | 影响因变量的分类自变量 |
| 水平 | Level | 因素的具体取值 |
| 处理 | Treatment | 因素水平的特定组合 |
| 组间变异 | Between-Group Variation | 不同组均值之间的变异 |
| 组内变异 | Within-Group Variation | 同一组内观测值之间的变异 |
| 总变异 | Total Variation | 所有观测值与总均值之差的平方和 |
| F统计量 | F-Statistic | 组间均方与组内均方之比 |
| 均方 | Mean Square | 平方和除以自由度 |
| 重复测量方差分析 | Repeated Measures ANOVA | 同一受试者多次测量的方差分析 |
| 协方差分析 | Analysis of Covariance (ANCOVA) | 结合方差分析和回归分析的方法 |
| 多元方差分析 | Multivariate ANOVA (MANOVA) | 多个因变量的方差分析 |
| 事后检验 | Post Hoc Test | 方差分析显著后进行的多重比较 |
| Tukey检验 | Tukey's HSD Test | 常用的事后多重比较方法 |
| Scheffé检验 | Scheffé's Test | 保守的事后比较方法 |
| 随机效应 | Random Effect | 因素水平从总体中随机抽取 |
| 固定效应 | Fixed Effect | 因素水平为研究者所关心的特定值 |
| 混合效应模型 | Mixed Effects Model | 同时包含固定效应和随机效应的模型 |

---

## 七、多元统计分析 (Multivariate Statistical Analysis)

| 中文 | 英文 | 定义 |
|------|------|------|
| 多元统计分析 | Multivariate Analysis | 分析多个变量间关系的统计方法 |
| 协方差矩阵 | Covariance Matrix | 描述多个变量间协方差的矩阵 |
| 相关矩阵 | Correlation Matrix | 描述多个变量间相关系数的矩阵 |
| 主成分分析 | Principal Component Analysis (PCA) | 降维技术，将相关变量转换为不相关主成分 |
| 主成分 | Principal Component | 原始变量的线性组合，按方差大小排序 |
| 因子分析 | Factor Analysis | 用少数潜在因子解释观测变量间相关的技术 |
| 公因子 | Common Factor | 影响多个观测变量的潜在变量 |
| 因子载荷 | Factor Loading | 变量与因子之间的相关系数 |
| 因子旋转 | Factor Rotation | 使因子结构更易解释的变换 |
| 方差最大旋转 | Varimax Rotation | 使因子载荷方差最大化的正交旋转 |
| 聚类分析 | Cluster Analysis | 将相似对象分组的无监督学习方法 |
| 系统聚类 | Hierarchical Clustering | 逐步合并或分割的聚类方法 |
| K均值聚类 | K-Means Clustering | 基于中心的迭代聚类算法 |
| 距离度量 | Distance Metric | 衡量对象间相似性或差异性的方法 |
| 欧氏距离 | Euclidean Distance | 两点间的直线距离 |
| 马氏距离 | Mahalanobis Distance | 考虑变量相关性的广义距离 |
| 判别分析 | Discriminant Analysis | 根据特征将对象分类的方法 |
| 线性判别分析 | Linear Discriminant Analysis (LDA) | 寻找最佳线性分类边界的方法 |
| 典型相关分析 | Canonical Correlation Analysis | 分析两组变量间相关关系的方法 |
| 典型变量 | Canonical Variable | 原始变量的线性组合，使两组间相关最大 |
| 多维标度分析 | Multidimensional Scaling (MDS) | 在低维空间中表示对象间相似性的方法 |
| 对应分析 | Correspondence Analysis | 分析分类变量间关系的图示方法 |
| 结构方程模型 | Structural Equation Modeling (SEM) | 分析变量间因果关系的统计方法 |
| 验证性因子分析 | Confirmatory Factor Analysis (CFA) | 验证预设因子结构的因子分析方法 |
| 拟合指数 | Fit Index | 评价模型与数据拟合程度的指标 |

---

## 八、时间序列分析 (Time Series Analysis)

| 中文 | 英文 | 定义 |
|------|------|------|
| 时间序列 | Time Series | 按时间顺序排列的观测值序列 |
| 趋势 | Trend | 时间序列的长期变化方向 |
| 季节性 | Seasonality | 固定周期的规律性波动 |
| 周期性 | Cyclicity | 非固定周期的波动 |
| 平稳性 | Stationarity | 统计特性不随时间变化的性质 |
| 严平稳 | Strict Stationarity | 联合分布不随时间平移变化的性质 |
| 弱平稳 | Weak Stationarity | 均值、方差不随时间变化，协方差只与时间间隔有关 |
| 白噪声 | White Noise | 均值为零、方差恒定、无自相关的随机序列 |
| 自相关函数 | Autocorrelation Function (ACF) | 序列与其滞后值之间的相关系数 |
| 偏自相关函数 | Partial Autocorrelation Function (PACF) | 控制中间滞后项后的自相关 |
| 差分 | Differencing | 相邻观测值之差，用于使序列平稳 |
| 移动平均 | Moving Average | 对观测值进行平滑处理的方法 |
| 指数平滑 | Exponential Smoothing | 赋予近期观测更大权重的平滑方法 |
| AR模型 | Autoregressive Model | 用过去值预测当前值的模型 |
| MA模型 | Moving Average Model | 用过去误差预测当前值的模型 |
| ARMA模型 | ARMA Model | 结合AR和MA的混合模型 |
| ARIMA模型 | ARIMA Model | 包含差分的ARMA模型，用于非平稳序列 |
| SARIMA模型 | Seasonal ARIMA | 包含季节成分的ARIMA模型 |
| 自回归条件异方差 | ARCH | 描述波动率聚集的模型 |
| GARCH模型 | GARCH Model | ARCH的推广，更灵活的波动率模型 |
| 单位根检验 | Unit Root Test | 检验时间序列平稳性的统计检验 |
| ADF检验 | Augmented Dickey-Fuller Test | 常用的单位根检验方法 |
| 协整 | Cointegration | 非平稳序列间存在长期均衡关系 |
| 误差修正模型 | Error Correction Model (ECM) | 结合短期波动和长期均衡的模型 |
| 格兰杰因果检验 | Granger Causality Test | 检验一个序列是否有助于预测另一个序列 |
| 谱分析 | Spectral Analysis | 从频域角度分析时间序列的方法 |
| 功率谱 | Power Spectrum | 序列在不同频率上的方差分布 |

---

## 九、非参数统计 (Nonparametric Statistics)

| 中文 | 英文 | 定义 |
|------|------|------|
| 非参数统计 | Nonparametric Statistics | 不依赖于特定分布假设的统计方法 |
| 秩 | Rank | 观测值按大小排序后的位置 |
| 符号检验 | Sign Test | 仅考虑差值符号的非参数检验 |
| Wilcoxon符号秩检验 | Wilcoxon Signed-Rank Test | 考虑符号和秩次的配对样本检验 |
| Mann-Whitney U检验 | Mann-Whitney U Test | 比较两组独立样本的非参数检验 |
| Kruskal-Wallis检验 | Kruskal-Wallis Test | 非参数的单因素方差分析 |
| Friedman检验 | Friedman Test | 非参数的重复测量方差分析 |
| Spearman相关 | Spearman's Correlation | 基于秩次的相关系数 |
| Kendall相关 | Kendall's Correlation | 基于一致对的相关系数 |
| 游程检验 | Runs Test | 检验序列随机性的非参数方法 |
| 核密度估计 | Kernel Density Estimation | 估计概率密度的非参数方法 |
| 核函数 | Kernel Function | 用于平滑的对称加权函数 |
| 带宽 | Bandwidth | 核密度估计中的平滑参数 |
| 局部回归 | Local Regression (LOESS) | 局部加权的非参数回归方法 |
| 自助法 | Bootstrap | 通过重抽样进行统计推断的方法 |
| 置换检验 | Permutation Test | 通过重新排列数据进行假设检验 |
| 蒙特卡洛方法 | Monte Carlo Method | 使用随机抽样进行数值计算的方法 |

---

## 十、贝叶斯统计 (Bayesian Statistics)

| 中文 | 英文 | 定义 |
|------|------|------|
| 贝叶斯统计 | Bayesian Statistics | 基于贝叶斯定理的统计推断框架 |
| 先验分布 | Prior Distribution | 在观测数据前对参数的概率分布 |
| 后验分布 | Posterior Distribution | 结合数据和先验后的参数概率分布 |
| 似然函数 | Likelihood Function | 数据给定参数时出现的概率 |
| 共轭先验 | Conjugate Prior | 使后验分布与先验分布同族的先验 |
| 贝叶斯估计 | Bayesian Estimation | 基于后验分布的参数估计 |
| 最大后验估计 | Maximum A Posteriori (MAP) | 后验分布的众数作为参数估计 |
| 贝叶斯因子 | Bayes Factor | 比较两个模型相对证据的指标 |
| 可信区间 | Credible Interval | 贝叶斯框架下的参数区间估计 |
| 后验预测分布 | Posterior Predictive Distribution | 基于后验的未来观测分布 |
| 马尔可夫链蒙特卡洛 | Markov Chain Monte Carlo (MCMC) | 从复杂分布抽样的计算方法 |
| Metropolis-Hastings算法 | Metropolis-Hastings Algorithm | 通用的MCMC抽样算法 |
| Gibbs抽样 | Gibbs Sampling | 逐维度抽样的MCMC方法 |
| 贝叶斯网络 | Bayesian Network | 表示变量间条件依赖关系的图形模型 |

---

## 十一、抽样与实验设计 (Sampling and Experimental Design)

| 中文 | 英文 | 定义 |
|------|------|------|
| 抽样 | Sampling | 从总体中选取部分个体的过程 |
| 简单随机抽样 | Simple Random Sampling | 每个个体被抽中概率相等的抽样方法 |
| 分层抽样 | Stratified Sampling | 按特征将总体分层后各层分别抽样 |
| 整群抽样 | Cluster Sampling | 随机抽取群体而非个体的抽样方法 |
| 系统抽样 | Systematic Sampling | 按固定间隔抽取样本的方法 |
| 方便抽样 | Convenience Sampling | 选取容易获得的样本的非概率抽样 |
| 抽样误差 | Sampling Error | 样本统计量与总体参数之差 |
| 非抽样误差 | Non-Sampling Error | 除抽样外的其他误差来源 |
| 样本量确定 | Sample Size Determination | 确定研究所需样本量的方法 |
| 实验设计 | Experimental Design | 规划实验以有效检验假设的方法 |
| 实验单位 | Experimental Unit | 接受处理的单个实体 |
| 对照组 | Control Group | 不接受处理或接受标准处理的组 |
| 处理组 | Treatment Group | 接受实验处理的组 |
| 随机化 | Randomization | 随机分配实验单位到各组 |
| 区组化 | Blocking | 将相似实验单位分组以减少变异 |
| 完全随机设计 | Completely Randomized Design | 实验单位完全随机分配的设计 |
| 随机区组设计 | Randomized Block Design | 在每个区组内随机分配的设计 |
| 拉丁方设计 | Latin Square Design | 控制两个区组因素的设计 |
| 析因设计 | Factorial Design | 同时研究多个因素所有水平组合的设计 |
| 正交设计 | Orthogonal Design | 使用正交表的高效实验设计 |
| 重复 | Replication | 同一处理作用于多个实验单位 |
| 交互作用 | Interaction | 一个因素的效应依赖于另一个因素的水平 |
| 混杂 | Confounding | 两个或多个效应无法区分的情况 |
| 双盲实验 | Double-Blind Experiment | 受试者和研究者都不知道处理分配的实验 |
| 安慰剂效应 | Placebo Effect | 由于心理预期而非实际处理产生的效应 |

---

## 十二、统计计算与软件 (Statistical Computing)

| 中文 | 英文 | 定义 |
|------|------|------|
| 统计软件 | Statistical Software | 用于数据分析的计算机程序 |
| 数据清洗 | Data Cleaning | 检测和修正数据中错误的过程 |
| 缺失值 | Missing Value | 数据集中未观测到的值 |
| 插补 | Imputation | 用估计值填充缺失数据的方法 |
| 异常值 | Outlier | 与其他观测值显著不同的极端值 |
| 数据变换 | Data Transformation | 改变数据尺度或分布的方法 |
| 对数变换 | Log Transformation | 取对数使数据更接近正态分布 |
| 标准化 | Standardization | 将数据转换为均值为0、标准差为1的形式 |
| 归一化 | Normalization | 将数据缩放到特定区间（如[0,1]） |
| 交叉验证 | Cross-Validation | 评估模型泛化能力的数据分割方法 |
| K折交叉验证 | K-Fold Cross-Validation | 将数据分为K份的交叉验证方法 |
| 自助法 | Bootstrap | 通过重抽样估计统计量分布的方法 |
| 蒙特卡洛模拟 | Monte Carlo Simulation | 使用随机数进行数值模拟的方法 |
| 统计可视化 | Statistical Visualization | 图形化展示数据特征的方法 |
| 直方图 | Histogram | 展示数值变量分布的条形图 |
| 箱线图 | Box Plot | 展示数据分布特征的图形 |
| 散点图 | Scatter Plot | 展示两个变量关系的图形 |
| Q-Q图 | Q-Q Plot | 比较数据分布与理论分布的图形 |
| 热图 | Heatmap | 用颜色展示矩阵数据的图形 |
| 累积分布函数图 | CDF Plot | 展示累积分布函数的图形 |

---

## 附录：常用符号表

| 符号 | 含义 |
|------|------|
| μ | 总体均值 |
| σ | 总体标准差 |
| σ² | 总体方差 |
| x̄ | 样本均值 |
| s | 样本标准差 |
| s² | 样本方差 |
| n | 样本量 |
| N | 总体大小 |
| p | 总体比例 |
| p̂ | 样本比例 |
| α | 显著性水平 |
| β | 第二类错误概率 |
| H₀ | 原假设 |
| H₁ | 备择假设 |
| θ | 总体参数 |
| θ̂ | 参数估计值 |
| E(X) | 期望 |
| Var(X) | 方差 |
| Cov(X,Y) | 协方差 |
| ρ | 总体相关系数 |
| r | 样本相关系数 |
| Σ | 求和 |
| ∏ | 求积 |
| ∫ | 积分 |
| ∞ | 无穷大 |
| ∈ | 属于 |
| ⊂ | 包含于 |
| ∩ | 交集 |
| ∪ | 并集 |
| P(A) | 事件A的概率 |
| P(A\|B) | 条件概率 |
| f(x) | 概率密度函数 |
| F(x) | 累积分布函数 |
| ~ | 服从分布 |

---

*本术语表收录统计学核心术语约200个，涵盖概率论、数理统计、回归分析、多元分析、时间序列等主要领域。*
