# 统计学核心公式

## 一、描述性统计

### 1.1 集中趋势

**算术平均值**
$$\bar{x} = \frac{1}{n}\sum_{i=1}^{n}x_i$$
所有观测值的总和除以观测数量。

**加权平均值**
$$\bar{x}_w = \frac{\sum_{i=1}^{n}w_i x_i}{\sum_{i=1}^{n}w_i}$$
考虑各观测值权重的平均值。

**几何平均值**
$$G = \sqrt[n]{\prod_{i=1}^{n}x_i} = \left(\prod_{i=1}^{n}x_i\right)^{1/n}$$
适用于比率和增长率的平均。

**调和平均值**
$$H = \frac{n}{\sum_{i=1}^{n}\frac{1}{x_i}}$$
适用于速度、效率等场景的平均。

**中位数**
$$M_e = \begin{cases} x_{(n+1)/2} & n\text{为奇数} \\ \frac{x_{n/2}+x_{n/2+1}}{2} & n\text{为偶数} \end{cases}$$
将数据排序后位于中间位置的值。

**众数**
$$M_o = \arg\max_{x} f(x)$$
数据中出现频率最高的值。

### 1.2 离散程度

**方差（总体）**
$$\sigma^2 = \frac{1}{N}\sum_{i=1}^{N}(x_i - \mu)^2$$
总体数据偏离均值的平方和的平均。

**方差（样本）**
$$s^2 = \frac{1}{n-1}\sum_{i=1}^{n}(x_i - \bar{x})^2$$
样本数据偏离均值的平方和的无偏估计。

**标准差**
$$\sigma = \sqrt{\frac{1}{N}\sum_{i=1}^{N}(x_i - \mu)^2}$$
方差的平方根，与原数据同单位。

**极差**
$$R = x_{\max} - x_{\min}$$
最大值与最小值之差。

**四分位距**
$$IQR = Q_3 - Q_1$$
第75百分位数与第25百分位数之差。

**变异系数**
$$CV = \frac{\sigma}{\mu} \times 100\%$$
标准差与均值的比值，无量纲。

**平均差**
$$MD = \frac{1}{n}\sum_{i=1}^{n}|x_i - \bar{x}|$$
数据与均值偏差绝对值的平均。

### 1.3 分布形态

**偏度**
$$\gamma_1 = \frac{\sum_{i=1}^{n}(x_i - \bar{x})^3}{(n-1)s^3}$$
衡量分布的不对称程度。正偏度表示右偏，负偏度表示左偏。

**峰度**
$$\gamma_2 = \frac{\sum_{i=1}^{n}(x_i - \bar{x})^4}{(n-1)s^4} - 3$$
衡量分布的尖峭程度。正峰度表示比正态分布更尖峭。

**矩**
$$m_k = \frac{1}{n}\sum_{i=1}^{n}(x_i - \bar{x})^k$$
k阶中心矩，用于描述分布特征。

### 1.4 相关系数

**皮尔逊相关系数**
$$r = \frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum_{i=1}^{n}(x_i-\bar{x})^2}\sqrt{\sum_{i=1}^{n}(y_i-\bar{y})^2}}$$
衡量两个连续变量的线性相关程度。

**斯皮尔曼相关系数**
$$\rho = 1 - \frac{6\sum_{i=1}^{n}d_i^2}{n(n^2-1)}$$
基于秩次的非参数相关系数，其中$d_i$为秩次差。

**肯德尔相关系数**
$$\tau = \frac{n_c - n_d}{n(n-1)/2}$$
基于一致对和不一致对的相关系数。

**协方差**
$$\text{Cov}(X,Y) = \frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})$$
衡量两个变量的协同变化程度。

**决定系数**
$$R^2 = 1 - \frac{SS_{res}}{SS_{tot}} = 1 - \frac{\sum(y_i-\hat{y}_i)^2}{\sum(y_i-\bar{y})^2}$$
模型解释的变异占总变异的比例。

---

## 二、概率分布

### 2.1 离散分布

**伯努利分布**
$$P(X=x) = p^x(1-p)^{1-x}, \quad x \in \{0,1\}$$
单次试验成功概率为p的二值分布。$E[X]=p$，$Var(X)=p(1-p)$。

**二项分布**
$$P(X=k) = \binom{n}{k}p^k(1-p)^{n-k}$$
n次独立伯努利试验中成功k次的概率。$E[X]=np$，$Var(X)=np(1-p)$。

**泊松分布**
$$P(X=k) = \frac{\lambda^k e^{-\lambda}}{k!}$$
单位时间/空间内稀有事件发生次数。$E[X]=Var(X)=\lambda$。

**几何分布**
$$P(X=k) = (1-p)^{k-1}p$$
首次成功所需的试验次数。$E[X]=1/p$，$Var(X)=(1-p)/p^2$。

**负二项分布**
$$P(X=k) = \binom{k-1}{r-1}p^r(1-p)^{k-r}$$
达到r次成功所需的试验次数。$E[X]=r/p$。

**超几何分布**
$$P(X=k) = \frac{\binom{K}{k}\binom{N-K}{n-k}}{\binom{N}{n}}$$
无放回抽样中成功次数的分布。

**均匀分布（离散）**
$$P(X=x) = \frac{1}{b-a+1}, \quad x \in \{a,a+1,\ldots,b\}$$
有限整数集合上的等概率分布。

### 2.2 连续分布

**均匀分布（连续）**
$$f(x) = \frac{1}{b-a}, \quad a \leq x \leq b$$
区间[a,b]上的等概率密度分布。$E[X]=(a+b)/2$。

**正态分布（高斯分布）**
$$f(x) = \frac{1}{\sigma\sqrt{2\pi}}e^{-\frac{(x-\mu)^2}{2\sigma^2}}$$
最重要连续分布，均值μ，标准差σ。$E[X]=\mu$，$Var(X)=\sigma^2$。

**标准正态分布**
$$\phi(z) = \frac{1}{\sqrt{2\pi}}e^{-\frac{z^2}{2}}$$
μ=0，σ=1的正态分布，z为标准分数。

**t分布**
$$f(t) = \frac{\Gamma(\frac{\nu+1}{2})}{\sqrt{\nu\pi}\Gamma(\frac{\nu}{2})}\left(1+\frac{t^2}{\nu}\right)^{-\frac{\nu+1}{2}}$$
小样本条件下均值检验的基础，ν为自由度。

**卡方分布**
$$f(x) = \frac{1}{2^{\nu/2}\Gamma(\nu/2)}x^{\nu/2-1}e^{-x/2}$$
ν个独立标准正态变量的平方和。$E[X]=\nu$，$Var(X)=2\nu$。

**F分布**
$$f(x) = \frac{\sqrt{\frac{d_1 x^{d_1}d_2^{d_2}}{(d_1 x + d_2)^{d_1+d_2}}}}{xB\left(\frac{d_1}{2},\frac{d_2}{2}\right)}$$
两个卡方分布比值，用于方差比较。

**指数分布**
$$f(x) = \lambda e^{-\lambda x}, \quad x \geq 0$$
泊松过程的等待时间分布。$E[X]=1/\lambda$，$Var(X)=1/\lambda^2$。

**伽马分布**
$$f(x) = \frac{\beta^\alpha}{\Gamma(\alpha)}x^{\alpha-1}e^{-\beta x}, \quad x > 0$$
指数分布的推广。$E[X]=\alpha/\beta$，$Var(X)=\alpha/\beta^2$。

**贝塔分布**
$$f(x) = \frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha,\beta)}, \quad 0 \leq x \leq 1$$
[0,1]区间上的灵活分布。$E[X]=\alpha/(\alpha+\beta)$。

**对数正态分布**
$$f(x) = \frac{1}{x\sigma\sqrt{2\pi}}e^{-\frac{(\ln x-\mu)^2}{2\sigma^2}}$$
取对数后服从正态分布的变量。

**威布尔分布**
$$f(x) = \frac{k}{\lambda}\left(\frac{x}{\lambda}\right)^{k-1}e^{-(x/\lambda)^k}$$
可靠性分析和生存分析中常用。

**柯西分布**
$$f(x) = \frac{1}{\pi\gamma\left[1+\left(\frac{x-x_0}{\gamma}\right)^2\right]}$$
无有限均值和方差的对称分布。

**拉普拉斯分布**
$$f(x) = \frac{1}{2b}e^{-\frac{|x-\mu|}{b}}$$
双指数分布，尖峰厚尾特征。

### 2.3 分布函数与特征

**累积分布函数**
$$F(x) = P(X \leq x) = \int_{-\infty}^{x}f(t)dt$$
随机变量小于等于某值的概率。

**概率密度函数**
$$f(x) = \frac{dF(x)}{dx}$$
分布函数的导数，概率的"密度"。

**矩生成函数**
$$M_X(t) = E[e^{tX}] = \int_{-\infty}^{\infty}e^{tx}f(x)dx$$
生成各阶矩的工具函数。

**特征函数**
$$\phi_X(t) = E[e^{itX}]$$
概率分布的唯一标识，傅里叶变换的期望。

**期望值（连续）**
$$E[X] = \int_{-\infty}^{\infty}xf(x)dx$$
随机变量的长期平均值。

**期望值（离散）**
$$E[X] = \sum_{x}x \cdot P(X=x)$$
离散随机变量的平均值。

**方差**
$$Var(X) = E[(X-E[X])^2] = E[X^2] - (E[X])^2$$
随机变量的离散程度。

**标准分数（Z分数）**
$$z = \frac{x - \mu}{\sigma}$$
将原始分数标准化为标准正态分布。

**切比雪夫不等式**
$$P(|X-\mu| \geq k\sigma) \leq \frac{1}{k^2}$$
任意分布的集中程度下界。

---

## 三、统计推断

### 3.1 点估计

**样本均值估计**
$$\hat{\mu} = \bar{x} = \frac{1}{n}\sum_{i=1}^{n}x_i$$
总体均值的无偏估计量。

**样本方差估计**
$$\hat{\sigma}^2 = s^2 = \frac{1}{n-1}\sum_{i=1}^{n}(x_i-\bar{x})^2$$
总体方差的无偏估计量（n-1为贝塞尔校正）。

**极大似然估计**
$$\hat{\theta}_{MLE} = \arg\max_{\theta} L(\theta) = \arg\max_{\theta} \prod_{i=1}^{n}f(x_i|\theta)$$
使似然函数最大的参数估计。

**对数似然函数**
$$\ell(\theta) = \ln L(\theta) = \sum_{i=1}^{n}\ln f(x_i|\theta)$$
似然函数取对数，简化优化计算。

**矩估计**
$$\hat{\theta}_{MM}:\quad E_\theta[X^k] = \frac{1}{n}\sum_{i=1}^{n}X_i^k$$
用样本矩等于总体矩来估计参数。

**标准误**
$$SE = \frac{s}{\sqrt{n}}$$
样本均值的标准差估计。

**比例估计**
$$\hat{p} = \frac{x}{n}$$
样本中成功的比例作为总体比例估计。

**比例标准误**
$$SE_p = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$
比例估计的标准误。

### 3.2 区间估计

**置信区间（均值，已知方差）**
$$\bar{x} \pm z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$$
总体均值的z置信区间。

**置信区间（均值，未知方差）**
$$\bar{x} \pm t_{\alpha/2,n-1} \frac{s}{\sqrt{n}}$$
总体均值的t置信区间。

**置信区间（比例）**
$$\hat{p} \pm z_{\alpha/2}\sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$
总体比例的大样本置信区间。

**置信区间（方差）**
$$\left[\frac{(n-1)s^2}{\chi^2_{\alpha/2,n-1}}, \frac{(n-1)s^2}{\chi^2_{1-\alpha/2,n-1}}\right]$$
总体方差的卡方置信区间。

**两均值之差置信区间**
$$(\bar{x}_1 - \bar{x}_2) \pm t_{\alpha/2,df} \sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}$$
两总体均值差异的置信区间。

**两比例之差置信区间**
$$(\hat{p}_1 - \hat{p}_2) \pm z_{\alpha/2}\sqrt{\frac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \frac{\hat{p}_2(1-\hat{p}_2)}{n_2}}$$
两总体比例差异的置信区间。

**样本量确定（均值）**
$$n = \left(\frac{z_{\alpha/2}\sigma}{E}\right)^2$$
给定误差E和置信水平确定样本量。

**样本量确定（比例）**
$$n = \frac{z_{\alpha/2}^2 \cdot p(1-p)}{E^2}$$
估计比例所需样本量。

### 3.3 假设检验

**检验统计量（Z检验）**
$$z = \frac{\bar{x} - \mu_0}{\sigma/\sqrt{n}}$$
检验总体均值（大样本或已知方差）。

**检验统计量（t检验，单样本）**
$$t = \frac{\bar{x} - \mu_0}{s/\sqrt{n}}$$
检验总体均值（小样本，未知方差）。

**检验统计量（t检验，双样本）**
$$t = \frac{\bar{x}_1 - \bar{x}_2}{\sqrt{s_p^2\left(\frac{1}{n_1}+\frac{1}{n_2}\right)}}$$
两独立样本均值比较，$s_p^2$为合并方差。

**合并方差**
$$s_p^2 = \frac{(n_1-1)s_1^2 + (n_2-1)s_2^2}{n_1+n_2-2}$$
两样本方差的加权平均。

**配对t检验**
$$t = \frac{\bar{d}}{s_d/\sqrt{n}}$$
配对样本差值的均值检验。

**检验统计量（比例检验）**
$$z = \frac{\hat{p} - p_0}{\sqrt{p_0(1-p_0)/n}}$$
检验总体比例。

**检验统计量（两比例）**
$$z = \frac{\hat{p}_1 - \hat{p}_2}{\sqrt{\hat{p}(1-\hat{p})\left(\frac{1}{n_1}+\frac{1}{n_2}\right)}}$$
两总体比例比较，$\hat{p}$为合并比例。

**卡方拟合优度检验**
$$\chi^2 = \sum_{i=1}^{k}\frac{(O_i - E_i)^2}{E_i}$$
检验观测频数与期望频数差异。

**卡方独立性检验**
$$\chi^2 = \sum_{i=1}^{r}\sum_{j=1}^{c}\frac{(O_{ij} - E_{ij})^2}{E_{ij}}$$
检验两分类变量的独立性。

**期望频数**
$$E_{ij} = \frac{n_{i\cdot} \times n_{\cdot j}}{n}$$
独立性检验中的期望频数计算。

**p值**
$$p = P(T \geq t_{obs} | H_0)$$
在原假设下观测到当前或更极端结果的概率。

**第一类错误率（显著性水平）**
$$\alpha = P(\text{拒绝}H_0 | H_0\text{为真})$$
错误拒绝真实原假设的概率。

**第二类错误率**
$$\beta = P(\text{不拒绝}H_0 | H_0\text{为假})$$
错误接受错误原假设的概率。

**统计功效**
$$1 - \beta = P(\text{拒绝}H_0 | H_0\text{为假})$$
正确拒绝错误原假设的概率。

---

## 四、方差分析（ANOVA）

### 4.1 单因素方差分析

**总平方和**
$$SS_T = \sum_{i=1}^{k}\sum_{j=1}^{n_i}(x_{ij} - \bar{x}_{\cdot\cdot})^2$$
所有观测与总均值偏差的平方和。

**组间平方和**
$$SS_B = \sum_{i=1}^{k}n_i(\bar{x}_{i\cdot} - \bar{x}_{\cdot\cdot})^2$$
各组均值与总均值偏差的加权和。

**组内平方和**
$$SS_W = \sum_{i=1}^{k}\sum_{j=1}^{n_i}(x_{ij} - \bar{x}_{i\cdot})^2$$
各组内观测与组均值偏差的平方和。

**平方和分解**
$$SS_T = SS_B + SS_W$$
总变异分解为组间和组内变异。

**组间均方**
$$MS_B = \frac{SS_B}{k-1}$$
组间平方和除以自由度（k-1）。

**组内均方**
$$MS_W = \frac{SS_W}{N-k}$$
组内平方和除以自由度（N-k）。

**F统计量**
$$F = \frac{MS_B}{MS_W} = \frac{SS_B/(k-1)}{SS_W/(N-k)}$$
检验各组均值是否相等的F检验统计量。

### 4.2 双因素方差分析

**双因素总平方和**
$$SS_T = SS_A + SS_B + SS_{AB} + SS_E$$
分解为因素A、因素B、交互作用和误差。

**因素A主效应**
$$SS_A = bn\sum_{i=1}^{a}(\bar{x}_{i\cdot\cdot} - \bar{x}_{\cdot\cdot\cdot})^2$$
因素A各水平均值与总均值的差异。

**因素B主效应**
$$SS_B = an\sum_{j=1}^{b}(\bar{x}_{\cdot j\cdot} - \bar{x}_{\cdot\cdot\cdot})^2$$
因素B各水平均值与总均值的差异。

**交互作用效应**
$$SS_{AB} = n\sum_{i=1}^{a}\sum_{j=1}^{b}(\bar{x}_{ij\cdot} - \bar{x}_{i\cdot\cdot} - \bar{x}_{\cdot j\cdot} + \bar{x}_{\cdot\cdot\cdot})^2$$
两因素交互造成的变异。

**误差平方和**
$$SS_E = \sum_{i=1}^{a}\sum_{j=1}^{b}\sum_{l=1}^{n}(x_{ijl} - \bar{x}_{ij\cdot})^2$$
不能由模型解释的变异。

### 4.3 事后检验

**Tukey HSD**
$$HSD = q_{\alpha,k,df_E}\sqrt{\frac{MS_E}{n}}$$
Tukey诚实显著性差异检验。

**Bonferroni校正**
$$\alpha_{adjusted} = \frac{\alpha}{m}$$
多重比较的p值校正，m为比较次数。

**效应量（η²）**
$$\eta^2 = \frac{SS_B}{SS_T}$$
因素解释的方差比例。

**偏效应量（偏η²）**
$$\eta_p^2 = \frac{SS_{effect}}{SS_{effect} + SS_{error}}$$
排除其他因素后的效应量。

**Cohen's f**
$$f = \sqrt{\frac{\eta^2}{1-\eta^2}}$$
ANOVA效应量的标准化度量。

---

## 五、回归分析

### 5.1 简单线性回归

**回归模型**
$$y_i = \beta_0 + \beta_1 x_i + \varepsilon_i$$
因变量与自变量的线性关系模型。

**斜率估计**
$$\hat{\beta}_1 = \frac{\sum_{i=1}^{n}(x_i-\bar{x})(y_i-\bar{y})}{\sum_{i=1}^{n}(x_i-\bar{x})^2} = \frac{S_{xy}}{S_{xx}}$$
回归线斜率的最小二乘估计。

**截距估计**
$$\hat{\beta}_0 = \bar{y} - \hat{\beta}_1\bar{x}$$
回归线截距的最小二乘估计。

**残差**
$$e_i = y_i - \hat{y}_i = y_i - (\hat{\beta}_0 + \hat{\beta}_1 x_i)$$
观测值与预测值之差。

**残差平方和**
$$RSS = SSE = \sum_{i=1}^{n}e_i^2 = \sum_{i=1}^{n}(y_i - \hat{y}_i)^2$$
最小二乘法的优化目标。

**回归平方和**
$$SSR = \sum_{i=1}^{n}(\hat{y}_i - \bar{y})^2$$
回归模型解释的变异。

**总平方和**
$$SST = \sum_{i=1}^{n}(y_i - \bar{y})^2 = SSR + SSE$$
因变量的总变异。

**决定系数**
$$R^2 = \frac{SSR}{SST} = 1 - \frac{SSE}{SST}$$
模型拟合优度，解释变异比例。

**斜率标准误**
$$SE(\hat{\beta}_1) = \sqrt{\frac{MSE}{\sum(x_i-\bar{x})^2}}$$
斜率估计的标准误。

**斜率t检验**
$$t = \frac{\hat{\beta}_1}{SE(\hat{\beta}_1)}$$
检验斜率是否显著不为零。

**斜率置信区间**
$$\hat{\beta}_1 \pm t_{\alpha/2,n-2} \cdot SE(\hat{\beta}_1)$$
斜率的置信区间估计。

**判定系数（调整后）**
$$R^2_{adj} = 1 - \frac{SSE/(n-p)}{SST/(n-1)} = 1 - (1-R^2)\frac{n-1}{n-p}$$
考虑自变量数量的惩罚。

### 5.2 多元线性回归

**多元回归模型**
$$y_i = \beta_0 + \beta_1 x_{i1} + \beta_2 x_{i2} + \cdots + \beta_p x_{ip} + \varepsilon_i$$
多个自变量的线性回归。

**矩阵形式**
$$\mathbf{y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}$$
回归模型的矩阵表示。

**最小二乘估计（矩阵）**
$$\hat{\boldsymbol{\beta}} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y}$$
回归系数的矩阵求解公式。

**预测值**
$$\hat{\mathbf{y}} = \mathbf{X}\hat{\boldsymbol{\beta}} = \mathbf{H}\mathbf{y}$$
H为帽子矩阵（投影矩阵）。

**帽子矩阵**
$$\mathbf{H} = \mathbf{X}(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T$$
将观测值投影到预测空间的矩阵。

**残差向量**
$$\mathbf{e} = \mathbf{y} - \hat{\mathbf{y}} = (\mathbf{I} - \mathbf{H})\mathbf{y}$$
观测值与预测值之差向量。

**方差估计**
$$\hat{\sigma}^2 = MSE = \frac{SSE}{n-p}$$
误差方差的估计，p为参数个数。

**系数协方差矩阵**
$$Var(\hat{\boldsymbol{\beta}}) = \sigma^2(\mathbf{X}^T\mathbf{X})^{-1}$$
回归系数估计的方差-协方差矩阵。

**整体F检验**
$$F = \frac{MSR}{MSE} = \frac{SSR/p-1}{SSE/n-p}$$
检验整个模型是否显著。

**多重决定系数**
$$R^2 = \frac{SSR}{SST} = \frac{\boldsymbol{\beta}^T\mathbf{X}^T\mathbf{y} - n\bar{y}^2}{\mathbf{y}^T\mathbf{y} - n\bar{y}^2}$$
多元回归的拟合优度。

### 5.3 模型诊断

**标准化残差**
$$r_i = \frac{e_i}{s\sqrt{1-h_{ii}}}$$
调整杠杆后的残差标准化。

**学生化残差**
$$t_i = \frac{e_i}{s_{(i)}\sqrt{1-h_{ii}}}$$
使用删除第i点后方差的残差。

**杠杆值**
$$h_{ii} = \mathbf{x}_i^T(\mathbf{X}^T\mathbf{X})^{-1}\mathbf{x}_i$$
第i个观测的杠杆值，对拟合的影响程度。

**Cook距离**
$$D_i = \frac{\sum_{j=1}^{n}(\hat{y}_j - \hat{y}_{j(i)})^2}{p \cdot MSE} = \frac{e_i^2}{p \cdot MSE}\cdot\frac{h_{ii}}{(1-h_{ii})^2}$$
第i个观测对整体拟合的影响度量。

**DFFITS**
$$DFFITS_i = \frac{\hat{y}_i - \hat{y}_{i(i)}}{s_{(i)}\sqrt{h_{ii}}}$$
删除第i点后预测值的变化。

**DFBETAS**
$$DFBETAS_{ij} = \frac{\hat{\beta}_j - \hat{\beta}_{j(i)}}{s_{(i)}\sqrt{(\mathbf{X}^T\mathbf{X})^{-1}_{jj}}}$$
删除第i点后系数j的变化。

**VIF（方差膨胀因子）**
$$VIF_j = \frac{1}{1-R_j^2}$$
多重共线性诊断，$R_j^2$为x_j对其他x回归的决定系数。

**容忍度**
$$Tolerance_j = 1 - R_j^2 = \frac{1}{VIF_j}$$
VIF的倒数，多重共线性指标。

**AIC准则**
$$AIC = n\ln(SSE/n) + 2p$$
模型选择准则，平衡拟合与复杂度。

**BIC准则**
$$BIC = n\ln(SSE/n) + p\ln(n)$$
贝叶斯信息准则，对复杂度惩罚更重。

### 5.4 其他回归方法

**岭回归**
$$\hat{\boldsymbol{\beta}}_{ridge} = (\mathbf{X}^T\mathbf{X} + \lambda\mathbf{I})^{-1}\mathbf{X}^T\mathbf{y}$$
L2正则化，解决多重共线性。

**LASSO回归**
$$\hat{\boldsymbol{\beta}}_{lasso} = \arg\min\left\{\sum(y_i-\hat{y}_i)^2 + \lambda\sum|\beta_j|\right\}$$
L1正则化，产生稀疏解。

**弹性网络**
$$\hat{\boldsymbol{\beta}} = \arg\min\left\{\sum(y_i-\hat{y}_i)^2 + \lambda_1\sum|\beta_j| + \lambda_2\sum\beta_j^2\right\}$$
结合L1和L2正则化。

**多项式回归**
$$y = \beta_0 + \beta_1 x + \beta_2 x^2 + \cdots + \beta_d x^d + \varepsilon$$
高阶多项式拟合非线性关系。

---

## 六、贝叶斯统计

### 6.1 贝叶斯定理

**贝叶斯公式**
$$P(A|B) = \frac{P(B|A)P(A)}{P(B)}$$
基于新证据更新先验概率。

**全概率公式**
$$P(B) = \sum_{i=1}^{n}P(B|A_i)P(A_i)$$
贝叶斯公式的分母。

**后验概率**
$$P(\theta|data) = \frac{P(data|\theta)P(\theta)}{P(data)}$$
参数θ在观测到数据后的概率分布。

**贝叶斯推断框架**
$$后验 \propto 似然 \times 先验$$
$$Posterior \propto Likelihood \times Prior$$

**连续形式**
$$\pi(\theta|x) = \frac{f(x|\theta)\pi(\theta)}{\int f(x|\theta)\pi(\theta)d\theta}$$
参数为连续时的贝叶斯更新。

### 6.2 共轭先验

**Beta-二项共轭**
$$\pi(p) \sim Beta(\alpha,\beta), \quad P(data|p) \sim Binomial(n,p)$$
$$\pi(p|data) \sim Beta(\alpha+x, \beta+n-x)$$
二项分布参数p的贝叶斯估计。

**Gamma-泊松共轭**
$$\pi(\lambda) \sim Gamma(\alpha,\beta), \quad P(data|\lambda) \sim Poisson(\lambda)$$
$$\pi(\lambda|data) \sim Gamma(\alpha+\sum x_i, \beta+n)$$
泊松分布参数λ的贝叶斯估计。

**正态-正态共轭（均值）**
$$\pi(\mu) \sim N(\mu_0,\sigma_0^2), \quad P(data|\mu) \sim N(\mu,\sigma^2)$$
$$\pi(\mu|data) \sim N\left(\frac{\frac{\mu_0}{\sigma_0^2}+\frac{n\bar{x}}{\sigma^2}}{\frac{1}{\sigma_0^2}+\frac{n}{\sigma^2}}, \frac{1}{\frac{1}{\sigma_0^2}+\frac{n}{\sigma^2}}\right)$$
正态分布均值的贝叶斯估计。

**逆Gamma-正态共轭（方差）**
$$\pi(\sigma^2) \sim IG(\alpha,\beta), \quad P(data|\sigma^2) \sim N(\mu,\sigma^2)$$
正态分布方差的贝叶斯估计。

### 6.3 贝叶斯点估计

**后验均值**
$$\hat{\theta}_{Bayes} = E[\theta|data] = \int \theta \cdot \pi(\theta|data)d\theta$$
后验分布的均值作为参数估计。

**后验中位数**
$$\hat{\theta}_{median} = \text{中位数}(\pi(\theta|data))$$
后验分布的中位数作为参数估计。

**后验众数（MAP）**
$$\hat{\theta}_{MAP} = \arg\max_\theta \pi(\theta|data)$$
后验分布的众数（最大后验估计）。

**后验方差**
$$Var(\theta|data) = E[\theta^2|data] - (E[\theta|data])^2$$
后验分布的不确定性度量。

### 6.4 贝叶斯区间估计

**可信区间**
$$P(a \leq \theta \leq b|data) = 1-\alpha$$
参数落入区间的后验概率为1-α。

**等尾可信区间**
$$P(\theta < a|data) = P(\theta > b|data) = \alpha/2$$
两端尾部概率相等的可信区间。

**最高后验密度区间（HPD）**
$$HPD = \{\theta: \pi(\theta|data) \geq k\}$$
具有最短长度的可信区间。

### 6.5 贝叶斯假设检验

**贝叶斯因子**
$$BF_{10} = \frac{P(data|H_1)}{P(data|H_0)} = \frac{\int f(x|\theta,H_1)\pi(\theta|H_1)d\theta}{\int f(x|\theta,H_0)\pi(\theta|H_0)d\theta}$$
比较两个假设的证据强度。

**后验优势比**
$$\frac{P(H_1|data)}{P(H_0|data)} = BF_{10} \times \frac{P(H_1)}{P(H_0)}$$
结合先验优势比和贝叶斯因子。

---

## 七、非参数统计

### 7.1 秩次检验

**Wilcoxon符号秩检验**
$$W = \sum_{i=1}^{n}R_i^+$$
配对样本的非参数检验，$R_i^+$为正差值的秩。

**Mann-Whitney U检验**
$$U_1 = n_1 n_2 + \frac{n_1(n_1+1)}{2} - R_1$$
两独立样本的非参数检验，$R_1$为组1的秩和。

**Kruskal-Wallis检验**
$$H = \frac{12}{N(N+1)}\sum_{i=1}^{k}\frac{R_i^2}{n_i} - 3(N+1)$$
多组比较的非参数ANOVA。

**Friedman检验**
$$\chi^2_r = \frac{12n}{k(k+1)}\sum_{j=1}^{k}R_j^2 - 3n(k+1)$$
配伍组设计的非参数检验。

**符号检验**
$$S = \#\{d_i > 0\}$$
配对样本差值符号的检验。

### 7.2 其他非参数方法

**Kolmogorov-Smirnov检验**
$$D = \max_x |F_n(x) - F_0(x)|$$
单样本或两样本分布比较。

**Shapiro-Wilk检验**
$$W = \frac{\left(\sum_{i=1}^{n}a_i x_{(i)}\right)^2}{\sum_{i=1}^{n}(x_i-\bar{x})^2}$$
正态性检验。

**游程检验**
$$Z = \frac{R - \bar{R}}{\sigma_R}$$
随机性检验，R为游程数。

---

## 八、相关与关联分析

### 8.1 相关性度量

**协方差矩阵**
$$\mathbf{\Sigma} = E[(\mathbf{X}-\boldsymbol{\mu})(\mathbf{X}-\boldsymbol{\mu})^T]$$
多元变量的协方差结构。

**相关矩阵**
$$\mathbf{R} = \mathbf{D}^{-1/2}\mathbf{\Sigma}\mathbf{D}^{-1/2}$$
标准化的协方差矩阵，D为方差对角矩阵。

**偏相关系数**
$$r_{xy\cdot z} = \frac{r_{xy} - r_{xz}r_{yz}}{\sqrt{(1-r_{xz}^2)(1-r_{yz}^2)}}$$
控制z后x与y的相关性。

**点二列相关**
$$r_{pb} = \frac{\bar{x}_1 - \bar{x}_0}{s_x}\sqrt{\frac{n_1 n_0}{n^2}}$$
二分类变量与连续变量的相关。

**phi系数**
$$\phi = \frac{ad-bc}{\sqrt{(a+b)(c+d)(a+c)(b+d)}}$$
两个二分类变量的关联强度。

**Cramer's V**
$$V = \sqrt{\frac{\chi^2}{n(k-1)}}$$
列联表关联强度，k为min(行数,列数)。

### 8.2 一致性度量

**Cohen's Kappa**
$$\kappa = \frac{p_o - p_e}{1 - p_e}$$
分类一致性的机会校正度量。

**加权Kappa**
$$\kappa_w = \frac{\sum w_{ij}p_{oij} - \sum w_{ij}p_{eij}}{1 - \sum w_{ij}p_{eij}}$$
考虑分类等级的Kappa。

**组内相关系数（ICC）**
$$ICC = \frac{\sigma^2_b}{\sigma^2_b + \sigma^2_w}$$
评价者间或测量的一致性。

---

## 九、时间序列

### 9.1 基本概念

**自协方差**
$$\gamma_k = Cov(X_t, X_{t-k}) = E[(X_t - \mu)(X_{t-k} - \mu)]$$
时间序列滞后k期的协方差。

**自相关函数（ACF）**
$$\rho_k = \frac{\gamma_k}{\gamma_0} = \frac{Cov(X_t, X_{t-k})}{Var(X_t)}$$
时间序列的自相关性。

**偏自相关函数（PACF）**
$$\phi_{kk} = Corr(X_t, X_{t-k} | X_{t-1}, \ldots, X_{t-k+1})$$
去除中间项影响后的自相关。

### 9.2 时间序列模型

**自回归模型 AR(p)**
$$X_t = \phi_1 X_{t-1} + \phi_2 X_{t-2} + \cdots + \phi_p X_{t-p} + \varepsilon_t$$
当前值由过去p期值线性组合。

**移动平均模型 MA(q)**
$$X_t = \varepsilon_t + \theta_1\varepsilon_{t-1} + \theta_2\varepsilon_{t-2} + \cdots + \theta_q\varepsilon_{t-q}$$
当前值由过去q期误差线性组合。

**ARMA模型**
$$X_t = \sum_{i=1}^{p}\phi_i X_{t-i} + \varepsilon_t + \sum_{j=1}^{q}\theta_j\varepsilon_{t-j}$$
结合AR和MA的混合模型。

**ARIMA模型**
$$(1-B)^d X_t = \phi(B)^{-1}\theta(B)\varepsilon_t$$
差分d次后为ARMA过程。

**指数平滑**
$$\hat{X}_{t+1} = \alpha X_t + (1-\alpha)\hat{X}_t$$
加权平均的历史值预测。

---

## 十、抽样理论

### 10.1 抽样方法

**简单随机抽样**
$$P(\text{选中}) = \frac{n}{N}$$
每个个体被抽中的概率相等。

**分层抽样均值**
$$\bar{y}_{st} = \sum_{h=1}^{L}W_h\bar{y}_h = \sum_{h=1}^{L}\frac{N_h}{N}\bar{y}_h$$
各层样本均值的加权平均。

**分层抽样方差**
$$Var(\bar{y}_{st}) = \sum_{h=1}^{L}W_h^2\frac{S_h^2}{n_h}(1-f_h)$$
分层抽样均值的估计方差。

**抽样比**
$$f = \frac{n}{N}$$
样本量与总体量的比值。

**有限总体校正**
$$VIF = 1 - f = 1 - \frac{n}{N}$$
有限总体抽样的方差缩减因子。

---

## 十一、其他重要公式

### 11.1 似然与信息

**似然比检验**
$$\Lambda = \frac{L(\hat{\theta}_0)}{L(\hat{\theta})} = \frac{\max_{\theta \in \Theta_0}L(\theta)}{\max_{\theta \in \Theta}L(\theta)}$$
比较约束与无约束模型的似然比。

**似然比统计量**
$$G^2 = -2\ln\Lambda = 2[\ln L(\hat{\theta}) - \ln L(\hat{\theta}_0)]$$
大样本下近似服从卡方分布。

**Wald检验**
$$W = \frac{(\hat{\theta} - \theta_0)^2}{Var(\hat{\theta})}$$
基于估计量渐近正态性的检验。

**得分检验**
$$S = U(\theta_0)^T I(\theta_0)^{-1} U(\theta_0)$$
基于得分函数的检验。

**Fisher信息**
$$I(\theta) = -E\left[\frac{\partial^2 \ln f(X|\theta)}{\partial\theta^2}\right]$$
似然函数曲率的期望，参数估计精度的下界。

**Cramér-Rao下界**
$$Var(\hat{\theta}) \geq \frac{1}{I(\theta)}$$
无偏估计量方差的理论下界。

**Kullback-Leibler散度**
$$D_{KL}(P||Q) = \sum_x P(x)\ln\frac{P(x)}{Q(x)}$$
两概率分布的差异度量。

### 11.2 效应量

**Cohen's d**
$$d = \frac{\bar{x}_1 - \bar{x}_2}{s_{pooled}}$$
两组均值差异的标准化效应量。

**Hedges' g**
$$g = \frac{\bar{x}_1 - \bar{x}_2}{s_{pooled}} \times \left(1 - \frac{3}{4(n_1+n_2)-9}\right)$$
小样本校正的Cohen's d。

**Glass's Δ**
$$\Delta = \frac{\bar{x}_1 - \bar{x}_2}{s_{control}}$$
使用对照组标准差的效应量。

**优势比**
$$OR = \frac{a/c}{b/d} = \frac{ad}{bc}$$
病例对照研究中的关联度量。

**相对风险**
$$RR = \frac{a/(a+b)}{c/(c+d)}$$
队列研究中的风险比较。

### 11.3 功效分析

**样本量（两均值比较）**
$$n = \frac{2(z_{\alpha/2} + z_\beta)^2\sigma^2}{\delta^2}$$
δ为期望检测的差异。

**样本量（两比例比较）**
$$n = \frac{(z_{\alpha/2} + z_\beta)^2[p_1(1-p_1)+p_2(1-p_2)]}{(p_1-p_2)^2}$$
比较两比例所需样本量。

**功效计算**
$$1-\beta = \Phi\left(\frac{\delta\sqrt{n}}{\sigma} - z_{\alpha/2}\right)$$
给定样本量计算统计功效。

---

## 常用临界值表参考

| 分布 | 90% | 95% | 99% |
|------|-----|-----|-----|
| $z_{\alpha/2}$ | 1.645 | 1.96 | 2.576 |
| 自由度=1 $\chi^2$ | 2.71 | 3.84 | 6.63 |
| 自由度=10 $\chi^2$ | 15.99 | 18.31 | 23.21 |
| 自由度=10 $t_{\alpha/2}$ | 1.812 | 2.228 | 3.169 |
| 自由度=∞ $t_{\alpha/2}$ | 1.645 | 1.96 | 2.576 |

---

*本公式集涵盖统计学主要领域的核心公式，共约140个。建议结合具体应用场景查阅相关教材深入理解。*
