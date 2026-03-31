# 数学公式速查手册

本文档整理了数学各领域的核心公式，使用 LaTeX 格式书写。

---

## 目录

- [一、代数公式](#一代数公式)
- [二、微积分公式](#二微积分公式)
- [三、概率统计公式](#三概率统计公式)
- [四、几何公式](#四几何公式)
- [五、常用不等式](#五常用不等式)
- [六、级数与极限](#六级数与极限)
- [七、复变函数](#七复变函数)
- [八、常微分方程](#八常微分方程)

---

## 一、代数公式

### 1.1 二次方程与多项式

**二次方程求根公式**

$$x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}$$

求解一元二次方程 $ax^2 + bx + c = 0$ 的根。

**韦达定理**

$$x_1 + x_2 = -\frac{b}{a}, \quad x_1 x_2 = \frac{c}{a}$$

描述二次方程两根与系数的关系。

**多项式除法（余式定理）**

$$f(x) = (x-a)Q(x) + f(a)$$

多项式 $f(x)$ 除以 $(x-a)$ 的余数为 $f(a)$。

**二项式定理**

$$(a+b)^n = \sum_{k=0}^{n} \binom{n}{k} a^{n-k} b^k$$

展开二项式，其中 $\binom{n}{k} = \frac{n!}{k!(n-k)!}$ 是组合数。

**牛顿二项式（广义）**

$$(1+x)^\alpha = \sum_{k=0}^{\infty} \binom{\alpha}{k} x^k, \quad |x| < 1$$

适用于任意实数指数 $\alpha$。

### 1.2 行列式

**二阶行列式**

$$\begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad - bc$$

2×2 矩阵的行列式。

**三阶行列式（沙路氏法则）**

$$\begin{vmatrix} a & b & c \\ d & e & f \\ g & h & i \end{vmatrix} = aei + bfg + cdh - ceg - bdi - afh$$

3×3 矩阵的行列式展开。

**行列式性质**

$$\det(AB) = \det(A) \cdot \det(B)$$

$$\det(A^T) = \det(A)$$

$$\det(A^{-1}) = \frac{1}{\det(A)}$$

行列式的乘法性质和转置性质。

**行列式按行（列）展开**

$$\det(A) = \sum_{j=1}^{n} a_{ij} C_{ij}$$

其中 $C_{ij} = (-1)^{i+j} M_{ij}$ 是代数余子式。

**范德蒙德行列式**

$$\begin{vmatrix} 1 & 1 & \cdots & 1 \\ x_1 & x_2 & \cdots & x_n \\ x_1^2 & x_2^2 & \cdots & x_n^2 \\ \vdots & \vdots & \ddots & \vdots \\ x_1^{n-1} & x_2^{n-1} & \cdots & x_n^{n-1} \end{vmatrix} = \prod_{1 \leq i < j \leq n} (x_j - x_i)$$

在插值和数值分析中有重要应用。

### 1.3 矩阵

**矩阵乘法**

$$(AB)_{ij} = \sum_{k=1}^{n} a_{ik} b_{kj}$$

矩阵乘法的定义。

**转置矩阵**

$$(A^T)_{ij} = a_{ji}$$

$$ (AB)^T = B^T A^T $$

**逆矩阵**

$$A^{-1} = \frac{1}{\det(A)} \text{adj}(A)$$

其中 $\text{adj}(A)$ 是伴随矩阵。

**2×2 逆矩阵**

$$\begin{pmatrix} a & b \\ c & d \end{pmatrix}^{-1} = \frac{1}{ad-bc} \begin{pmatrix} d & -b \\ -c & a \end{pmatrix}$$

**正交矩阵**

$$Q^T Q = Q Q^T = I$$

正交矩阵满足 $Q^{-1} = Q^T$。

**特征值与特征向量**

$$A\mathbf{v} = \lambda \mathbf{v}$$

特征多项式：$\det(A - \lambda I) = 0$。

**迹（Trace）**

$$\text{tr}(A) = \sum_{i=1}^{n} a_{ii} = \sum_{i=1}^{n} \lambda_i$$

矩阵迹等于对角元素之和，也等于特征值之和。

**迹的性质**

$$\text{tr}(A+B) = \text{tr}(A) + \text{tr}(B)$$

$$\text{tr}(AB) = \text{tr}(BA)$$

$$\text{tr}(A^T) = \text{tr}(A)$$

**矩阵的秩**

$$\text{rank}(AB) \leq \min\{\text{rank}(A), \text{rank}(B)\}$$

### 1.4 向量代数

**向量点积**

$$\mathbf{a} \cdot \mathbf{b} = |\mathbf{a}| |\mathbf{b}| \cos\theta = \sum_{i=1}^{n} a_i b_i$$

**向量叉积（三维）**

$$\mathbf{a} \times \mathbf{b} = \begin{vmatrix} \mathbf{i} & \mathbf{j} & \mathbf{k} \\ a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \end{vmatrix}$$

叉积向量垂直于 $\mathbf{a}$ 和 $\mathbf{b}$ 所在平面。

**叉积模长**

$$|\mathbf{a} \times \mathbf{b}| = |\mathbf{a}| |\mathbf{b}| \sin\theta$$

等于以 $\mathbf{a}$、$\mathbf{b}$ 为邻边的平行四边形面积。

**混合积**

$$[\mathbf{a}, \mathbf{b}, \mathbf{c}] = \mathbf{a} \cdot (\mathbf{b} \times \mathbf{c}) = \begin{vmatrix} a_1 & a_2 & a_3 \\ b_1 & b_2 & b_3 \\ c_1 & c_2 & c_3 \end{vmatrix}$$

几何意义为平行六面体的有向体积。

**向量三重积**

$$\mathbf{a} \times (\mathbf{b} \times \mathbf{c}) = \mathbf{b}(\mathbf{a} \cdot \mathbf{c}) - \mathbf{c}(\mathbf{a} \cdot \mathbf{b})$$

也称 BAC-CAB 公式。

### 1.5 复数

**复数表示**

$$z = a + bi = r(\cos\theta + i\sin\theta) = re^{i\theta}$$

其中 $r = |z| = \sqrt{a^2+b^2}$，$\theta = \arg(z) = \arctan(b/a)$。

**欧拉公式**

$$e^{i\theta} = \cos\theta + i\sin\theta$$

**棣莫弗定理**

$$(\cos\theta + i\sin\theta)^n = \cos(n\theta) + i\sin(n\theta)$$

用于计算复数的幂。

**复数运算**

$$z_1 z_2 = r_1 r_2 e^{i(\theta_1 + \theta_2)}$$

$$\frac{z_1}{z_2} = \frac{r_1}{r_2} e^{i(\theta_1 - \theta_2)}$$

**共轭复数**

$$\overline{a+bi} = a - bi$$

$$z \cdot \overline{z} = |z|^2$$

### 1.6 对数与指数

**对数基本性质**

$$\log_a(xy) = \log_a x + \log_a y$$

$$\log_a\left(\frac{x}{y}\right) = \log_a x - \log_a y$$

$$\log_a(x^n) = n\log_a x$$

**换底公式**

$$\log_a b = \frac{\ln b}{\ln a} = \frac{\log_c b}{\log_c a}$$

**自然对数与指数**

$$\ln(e^x) = x, \quad e^{\ln x} = x$$

**指数运算法则**

$$a^m \cdot a^n = a^{m+n}$$

$$(a^m)^n = a^{mn}$$

$$(ab)^n = a^n b^n$$

---

## 二、微积分公式

### 2.1 极限

**基本极限**

$$\lim_{x \to 0} \frac{\sin x}{x} = 1$$

$$\lim_{x \to 0} \frac{e^x - 1}{x} = 1$$

$$\lim_{x \to 0} \frac{\ln(1+x)}{x} = 1$$

$$\lim_{x \to 0} \frac{(1+x)^\alpha - 1}{x} = \alpha$$

**自然常数定义**

$$e = \lim_{n \to \infty} \left(1 + \frac{1}{n}\right)^n = \lim_{x \to 0} (1+x)^{1/x}$$

**洛必达法则**

$$\lim_{x \to a} \frac{f(x)}{g(x)} = \lim_{x \to a} \frac{f'(x)}{g'(x)}$$

适用于 $\frac{0}{0}$ 或 $\frac{\infty}{\infty}$ 型未定式。

**重要极限**

$$\lim_{x \to 0} \frac{1-\cos x}{x^2} = \frac{1}{2}$$

$$\lim_{x \to 0} \frac{\tan x}{x} = 1$$

$$\lim_{x \to 0} \frac{\arcsin x}{x} = 1$$

### 2.2 导数公式

**基本导数**

$$(x^n)' = nx^{n-1}$$

$$(e^x)' = e^x$$

$$(a^x)' = a^x \ln a$$

$$(\ln x)' = \frac{1}{x}$$

$$(\log_a x)' = \frac{1}{x \ln a}$$

**三角函数导数**

$$(\sin x)' = \cos x$$

$$(\cos x)' = -\sin x$$

$$(\tan x)' = \sec^2 x$$

$$(\cot x)' = -\csc^2 x$$

$$(\sec x)' = \sec x \tan x$$

$$(\csc x)' = -\csc x \cot x$$

**反三角函数导数**

$$(\arcsin x)' = \frac{1}{\sqrt{1-x^2}}$$

$$(\arccos x)' = -\frac{1}{\sqrt{1-x^2}}$$

$$(\arctan x)' = \frac{1}{1+x^2}$$

$$(\text{arccot } x)' = -\frac{1}{1+x^2}$$

$$(\text{arcsec } x)' = \frac{1}{|x|\sqrt{x^2-1}}$$

$$(\text{arccsc } x)' = -\frac{1}{|x|\sqrt{x^2-1}}$$

**双曲函数导数**

$$(\sinh x)' = \cosh x$$

$$(\cosh x)' = \sinh x$$

$$(\tanh x)' = \text{sech}^2 x$$

### 2.3 导数运算法则

**四则运算**

$$(f \pm g)' = f' \pm g'$$

$$(fg)' = f'g + fg'$$

$$\left(\frac{f}{g}\right)' = \frac{f'g - fg'}{g^2}$$

**链式法则**

$$\frac{d}{dx}f(g(x)) = f'(g(x)) \cdot g'(x)$$

复合函数求导的核心法则。

**反函数求导**

$$(f^{-1})'(y) = \frac{1}{f'(x)}, \quad y = f(x)$$

**参数方程求导**

$$\frac{dy}{dx} = \frac{dy/dt}{dx/dt}$$

**隐函数求导**

对于 $F(x,y) = 0$，$\frac{dy}{dx} = -\frac{F_x}{F_y}$

**对数求导法**

$$\frac{d}{dx}\ln f(x) = \frac{f'(x)}{f(x)}$$

适用于幂指函数 $f(x)^{g(x)}$。

### 2.4 高阶导数

**莱布尼茨公式**

$$(fg)^{(n)} = \sum_{k=0}^{n} \binom{n}{k} f^{(n-k)} g^{(k)}$$

**常见高阶导数**

$$(x^n)^{(n)} = n!$$

$$(e^x)^{(n)} = e^x$$

$$(\sin x)^{(n)} = \sin\left(x + \frac{n\pi}{2}\right)$$

$$(\cos x)^{(n)} = \cos\left(x + \frac{n\pi}{2}\right)$$

### 2.5 偏导数与梯度

**梯度**

$$\nabla f = \left(\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z}\right)$$

**方向导数**

$$D_{\mathbf{u}} f = \nabla f \cdot \mathbf{u} = |\nabla f| \cos\theta$$

**拉普拉斯算子**

$$\nabla^2 f = \frac{\partial^2 f}{\partial x^2} + \frac{\partial^2 f}{\partial y^2} + \frac{\partial^2 f}{\partial z^2}$$

**海森矩阵**

$$H = \begin{pmatrix} \frac{\partial^2 f}{\partial x_1^2} & \cdots & \frac{\partial^2 f}{\partial x_1 \partial x_n} \\ \vdots & \ddots & \vdots \\ \frac{\partial^2 f}{\partial x_n \partial x_1} & \cdots & \frac{\partial^2 f}{\partial x_n^2} \end{pmatrix}$$

### 2.6 不定积分

**基本积分**

$$\int x^n dx = \frac{x^{n+1}}{n+1} + C, \quad n \neq -1$$

$$\int \frac{1}{x} dx = \ln|x| + C$$

$$\int e^x dx = e^x + C$$

$$\int a^x dx = \frac{a^x}{\ln a} + C$$

**三角函数积分**

$$\int \sin x dx = -\cos x + C$$

$$\int \cos x dx = \sin x + C$$

$$\int \tan x dx = -\ln|\cos x| + C$$

$$\int \sec x dx = \ln|\sec x + \tan x| + C$$

$$\int \csc x dx = -\ln|\csc x + \cot x| + C$$

$$\int \sec^2 x dx = \tan x + C$$

$$\int \csc^2 x dx = -\cot x + C$$

**反三角函数积分**

$$\int \frac{1}{\sqrt{1-x^2}} dx = \arcsin x + C$$

$$\int \frac{1}{1+x^2} dx = \arctan x + C$$

$$\int \frac{1}{x\sqrt{x^2-1}} dx = \text{arcsec}|x| + C$$

**双曲函数积分**

$$\int \sinh x dx = \cosh x + C$$

$$\int \cosh x dx = \sinh x + C$$

### 2.7 定积分

**牛顿-莱布尼茨公式**

$$\int_a^b f(x) dx = F(b) - F(a)$$

其中 $F$ 是 $f$ 的原函数。

**定积分性质**

$$\int_a^b f(x) dx = -\int_b^a f(x) dx$$

$$\int_a^b f(x) dx + \int_b^c f(x) dx = \int_a^c f(x) dx$$

**换元积分法**

$$\int_a^b f(g(x))g'(x) dx = \int_{g(a)}^{g(b)} f(u) du$$

**分部积分**

$$\int_a^b u dv = uv\big|_a^b - \int_a^b v du$$

### 2.8 重要积分

**高斯积分**

$$\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}$$

概率论和统计学的基础。

**正态分布归一化**

$$\int_{-\infty}^{\infty} e^{-x^2/2} dx = \sqrt{2\pi}$$

**Beta 函数**

$$B(p,q) = \int_0^1 t^{p-1}(1-t)^{q-1} dt = \frac{\Gamma(p)\Gamma(q)}{\Gamma(p+q)}$$

**Gamma 函数**

$$\Gamma(z) = \int_0^{\infty} t^{z-1} e^{-t} dt$$

$$\Gamma(n+1) = n!$$

**三角函数定积分**

$$\int_0^{\pi/2} \sin^n x dx = \int_0^{\pi/2} \cos^n x dx = \frac{\sqrt{\pi} \Gamma\left(\frac{n+1}{2}\right)}{2\Gamma\left(\frac{n}{2}+1\right)}$$

$$\int_0^{\pi} \sin^2 x dx = \int_0^{\pi} \cos^2 x dx = \frac{\pi}{2}$$

**Wallis 积分**

$$\int_0^{\pi/2} \sin^n x dx = \begin{cases} \frac{(n-1)!!}{n!!} \cdot \frac{\pi}{2} & n \text{ 偶数} \\ \frac{(n-1)!!}{n!!} & n \text{ 奇数} \end{cases}$$

### 2.9 泰勒展开与麦克劳林级数

**泰勒公式**

$$f(x) = \sum_{n=0}^{\infty} \frac{f^{(n)}(a)}{n!}(x-a)^n$$

**麦克劳林级数（$a=0$）**

$$e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \cdots$$

$$\sin x = \sum_{n=0}^{\infty} \frac{(-1)^n x^{2n+1}}{(2n+1)!} = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \cdots$$

$$\cos x = \sum_{n=0}^{\infty} \frac{(-1)^n x^{2n}}{(2n)!} = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \cdots$$

$$\ln(1+x) = \sum_{n=1}^{\infty} \frac{(-1)^{n-1} x^n}{n} = x - \frac{x^2}{2} + \frac{x^3}{3} - \cdots, \quad |x| < 1$$

$$(1+x)^\alpha = \sum_{n=0}^{\infty} \binom{\alpha}{n} x^n, \quad |x| < 1$$

$$\arctan x = \sum_{n=0}^{\infty} \frac{(-1)^n x^{2n+1}}{2n+1} = x - \frac{x^3}{3} + \frac{x^5}{5} - \cdots, \quad |x| \leq 1$$

$$\arcsin x = \sum_{n=0}^{\infty} \frac{(2n)!}{4^n (n!)^2 (2n+1)} x^{2n+1}, \quad |x| < 1$$

**双曲函数展开**

$$\sinh x = \sum_{n=0}^{\infty} \frac{x^{2n+1}}{(2n+1)!}$$

$$\cosh x = \sum_{n=0}^{\infty} \frac{x^{2n}}{(2n)!}$$

### 2.10 多重积分

**二重积分（极坐标）**

$$\iint_D f(x,y) dxdy = \iint_D f(r\cos\theta, r\sin\theta) r dr d\theta$$

**三重积分（球坐标）**

$$\iiint_V f(x,y,z) dxdydz = \iiint_V f(r\sin\phi\cos\theta, r\sin\phi\sin\theta, r\cos\phi) r^2 \sin\phi dr d\phi d\theta$$

**雅可比行列式**

极坐标：$J = r$

球坐标：$J = r^2 \sin\phi$

---

## 三、概率统计公式

### 3.1 概率基础

**概率公理**

$$0 \leq P(A) \leq 1$$

$$P(\Omega) = 1$$

$$P\left(\bigcup_{i=1}^{\infty} A_i\right) = \sum_{i=1}^{\infty} P(A_i), \quad A_i \cap A_j = \emptyset$$

**加法公式**

$$P(A \cup B) = P(A) + P(B) - P(A \cap B)$$

**对立事件**

$$P(\bar{A}) = 1 - P(A)$$

**条件概率**

$$P(A|B) = \frac{P(A \cap B)}{P(B)}, \quad P(B) > 0$$

**乘法公式**

$$P(A \cap B) = P(A) \cdot P(B|A) = P(B) \cdot P(A|B)$$

**全概率公式**

$$P(A) = \sum_{i=1}^{n} P(B_i) P(A|B_i)$$

其中 $\{B_i\}$ 是样本空间的分割。

**贝叶斯公式**

$$P(B_i|A) = \frac{P(B_i) P(A|B_i)}{\sum_{j=1}^{n} P(B_j) P(A|B_j)}$$

**独立性**

$$P(A \cap B) = P(A) \cdot P(B)$$

### 3.2 离散分布

**二项分布**

$$P(X=k) = \binom{n}{k} p^k (1-p)^{n-k}, \quad k = 0,1,\ldots,n$$

$$E(X) = np, \quad \text{Var}(X) = np(1-p)$$

n 次独立伯努利试验中成功的次数。

**泊松分布**

$$P(X=k) = \frac{\lambda^k e^{-\lambda}}{k!}, \quad k = 0,1,2,\ldots$$

$$E(X) = \text{Var}(X) = \lambda$$

描述单位时间/空间内稀有事件发生的次数。

**几何分布**

$$P(X=k) = (1-p)^{k-1} p, \quad k = 1,2,3,\ldots$$

$$E(X) = \frac{1}{p}, \quad \text{Var}(X) = \frac{1-p}{p^2}$$

首次成功所需的试验次数。

**超几何分布**

$$P(X=k) = \frac{\binom{K}{k}\binom{N-K}{n-k}}{\binom{N}{n}}$$

不放回抽样中的成功次数。

**负二项分布**

$$P(X=k) = \binom{k-1}{r-1} p^r (1-p)^{k-r}, \quad k = r, r+1, \ldots$$

$$E(X) = \frac{r}{p}, \quad \text{Var}(X) = \frac{r(1-p)}{p^2}$$

达到 r 次成功所需的试验次数。

### 3.3 连续分布

**均匀分布**

$$f(x) = \frac{1}{b-a}, \quad a \leq x \leq b$$

$$E(X) = \frac{a+b}{2}, \quad \text{Var}(X) = \frac{(b-a)^2}{12}$$

**正态分布（高斯分布）**

$$f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{(x-\mu)^2}{2\sigma^2}}$$

$$E(X) = \mu, \quad \text{Var}(X) = \sigma^2$$

**标准正态分布**

$$\phi(z) = \frac{1}{\sqrt{2\pi}} e^{-z^2/2}$$

$$Z = \frac{X - \mu}{\sigma} \sim N(0,1)$$

**指数分布**

$$f(x) = \lambda e^{-\lambda x}, \quad x \geq 0$$

$$E(X) = \frac{1}{\lambda}, \quad \text{Var}(X) = \frac{1}{\lambda^2}$$

描述等待时间，具有无记忆性。

**Gamma 分布**

$$f(x) = \frac{\beta^\alpha}{\Gamma(\alpha)} x^{\alpha-1} e^{-\beta x}, \quad x > 0$$

$$E(X) = \frac{\alpha}{\beta}, \quad \text{Var}(X) = \frac{\alpha}{\beta^2}$$

**Beta 分布**

$$f(x) = \frac{x^{\alpha-1}(1-x)^{\beta-1}}{B(\alpha, \beta)}, \quad 0 < x < 1$$

$$E(X) = \frac{\alpha}{\alpha+\beta}, \quad \text{Var}(X) = \frac{\alpha\beta}{(\alpha+\beta)^2(\alpha+\beta+1)}$$

**卡方分布**

若 $Z_1, \ldots, Z_k \sim N(0,1)$ 独立，则

$$\sum_{i=1}^{k} Z_i^2 \sim \chi^2(k)$$

$$E(\chi^2(k)) = k, \quad \text{Var}(\chi^2(k)) = 2k$$

**t 分布**

$$t = \frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t(n-1)$$

**F 分布**

$$F = \frac{S_1^2/\sigma_1^2}{S_2^2/\sigma_2^2} \sim F(n_1-1, n_2-1)$$

### 3.4 数字特征

**期望**

离散：$E(X) = \sum_{i} x_i P(X=x_i)$

连续：$E(X) = \int_{-\infty}^{\infty} x f(x) dx$

**方差**

$$\text{Var}(X) = E[(X-E(X))^2] = E(X^2) - [E(X)]^2$$

**标准差**

$$\sigma = \sqrt{\text{Var}(X)}$$

**协方差**

$$\text{Cov}(X,Y) = E[(X-E(X))(Y-E(Y))] = E(XY) - E(X)E(Y)$$

**相关系数**

$$\rho_{XY} = \frac{\text{Cov}(X,Y)}{\sqrt{\text{Var}(X)\text{Var}(Y)}}$$

**期望的性质**

$$E(aX + bY) = aE(X) + bE(Y)$$

$$E(XY) = E(X)E(Y), \quad \text{若 } X,Y \text{ 独立}$$

**方差的性质**

$$\text{Var}(aX + b) = a^2 \text{Var}(X)$$

$$\text{Var}(X+Y) = \text{Var}(X) + \text{Var}(Y) + 2\text{Cov}(X,Y)$$

$$\text{Var}(X+Y) = \text{Var}(X) + \text{Var}(Y), \quad \text{若 } X,Y \text{ 独立}$$

**矩**

k 阶原点矩：$E(X^k)$

k 阶中心矩：$E[(X-E(X))^k]$

### 3.5 统计推断

**样本均值**

$$\bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i$$

**样本方差**

$$S^2 = \frac{1}{n-1}\sum_{i=1}^{n}(X_i - \bar{X})^2$$

**标准误**

$$SE(\bar{X}) = \frac{\sigma}{\sqrt{n}}$$

**矩估计**

用样本矩估计总体矩。

**极大似然估计**

$$\hat{\theta} = \arg\max_{\theta} L(\theta) = \arg\max_{\theta} \prod_{i=1}^{n} f(x_i|\theta)$$

**置信区间（均值，已知方差）**

$$\bar{X} \pm z_{\alpha/2} \frac{\sigma}{\sqrt{n}}$$

**置信区间（均值，未知方差）**

$$\bar{X} \pm t_{\alpha/2, n-1} \frac{S}{\sqrt{n}}$$

### 3.6 假设检验

**Z 检验统计量**

$$Z = \frac{\bar{X} - \mu_0}{\sigma/\sqrt{n}}$$

**t 检验统计量**

$$t = \frac{\bar{X} - \mu_0}{S/\sqrt{n}}$$

**卡方检验**

$$\chi^2 = \sum_{i=1}^{k} \frac{(O_i - E_i)^2}{E_i}$$

用于拟合优度检验和独立性检验。

**F 检验**

$$F = \frac{S_1^2}{S_2^2}$$

用于比较两个方差。

### 3.7 回归分析

**简单线性回归**

$$Y_i = \beta_0 + \beta_1 X_i + \epsilon_i$$

**最小二乘估计**

$$\hat{\beta}_1 = \frac{\sum_{i=1}^{n}(X_i - \bar{X})(Y_i - \bar{Y})}{\sum_{i=1}^{n}(X_i - \bar{X})^2}$$

$$\hat{\beta}_0 = \bar{Y} - \hat{\beta}_1 \bar{X}$$

**决定系数**

$$R^2 = 1 - \frac{SS_{res}}{SS_{tot}} = \frac{\text{SSR}}{\text{SST}}$$

**相关系数的估计**

$$r = \frac{\sum_{i=1}^{n}(X_i - \bar{X})(Y_i - \bar{Y})}{\sqrt{\sum_{i=1}^{n}(X_i - \bar{X})^2 \sum_{i=1}^{n}(Y_i - \bar{Y})^2}}$$

---

## 四、几何公式

### 4.1 平面几何

**三角形面积**

$$S = \frac{1}{2} \times \text{底} \times \text{高}$$

**海伦公式**

$$S = \sqrt{p(p-a)(p-b)(p-c)}$$

其中 $p = \frac{a+b+c}{2}$ 是半周长。

**圆的面积与周长**

$$S = \pi r^2, \quad C = 2\pi r$$

**椭圆面积**

$$S = \pi ab$$

其中 $a, b$ 是半长轴和半短轴。

**扇形面积**

$$S = \frac{1}{2} r^2 \theta = \frac{1}{2} r l$$

其中 $\theta$ 是圆心角（弧度），$l$ 是弧长。

**正多边形内角**

$$\alpha = \frac{(n-2) \times 180°}{n}$$

### 4.2 解析几何

**两点间距离**

$$d = \sqrt{(x_2-x_1)^2 + (y_2-y_1)^2}$$

**直线方程**

点斜式：$y - y_0 = k(x - x_0)$

一般式：$Ax + By + C = 0$

斜截式：$y = kx + b$

**点到直线距离**

$$d = \frac{|Ax_0 + By_0 + C|}{\sqrt{A^2 + B^2}}$$

**圆的方程**

$$(x-a)^2 + (y-b)^2 = r^2$$

**椭圆方程**

$$\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1$$

**双曲线方程**

$$\frac{x^2}{a^2} - \frac{y^2}{b^2} = 1$$

渐近线：$y = \pm \frac{b}{a} x$

**抛物线方程**

标准形式：$y^2 = 4px$ 或 $y = ax^2 + bx + c$

**极坐标**

$$x = r\cos\theta, \quad y = r\sin\theta$$

$$r = \sqrt{x^2 + y^2}, \quad \theta = \arctan\frac{y}{x}$$

### 4.3 立体几何

**长方体体积与表面积**

$$V = abc, \quad S = 2(ab + bc + ca)$$

**球体**

$$V = \frac{4}{3}\pi r^3, \quad S = 4\pi r^2$$

**圆柱体**

$$V = \pi r^2 h, \quad S_{侧} = 2\pi rh, \quad S_{全} = 2\pi r(r+h)$$

**圆锥体**

$$V = \frac{1}{3}\pi r^2 h, \quad S_{侧} = \pi rl$$

其中 $l = \sqrt{r^2 + h^2}$ 是母线长。

**棱锥体积**

$$V = \frac{1}{3} \times \text{底面积} \times \text{高}$$

**空间两点距离**

$$d = \sqrt{(x_2-x_1)^2 + (y_2-y_1)^2 + (z_2-z_1)^2}$$

**平面方程**

一般式：$Ax + By + Cz + D = 0$

法向量：$\mathbf{n} = (A, B, C)$

**点到平面距离**

$$d = \frac{|Ax_0 + By_0 + Cz_0 + D|}{\sqrt{A^2 + B^2 + C^2}}$$

### 4.4 三角公式

**基本恒等式**

$$\sin^2\theta + \cos^2\theta = 1$$

$$1 + \tan^2\theta = \sec^2\theta$$

$$1 + \cot^2\theta = \csc^2\theta$$

**和角公式**

$$\sin(\alpha \pm \beta) = \sin\alpha\cos\beta \pm \cos\alpha\sin\beta$$

$$\cos(\alpha \pm \beta) = \cos\alpha\cos\beta \mp \sin\alpha\sin\beta$$

$$\tan(\alpha \pm \beta) = \frac{\tan\alpha \pm \tan\beta}{1 \mp \tan\alpha\tan\beta}$$

**倍角公式**

$$\sin 2\theta = 2\sin\theta\cos\theta$$

$$\cos 2\theta = \cos^2\theta - \sin^2\theta = 2\cos^2\theta - 1 = 1 - 2\sin^2\theta$$

$$\tan 2\theta = \frac{2\tan\theta}{1-\tan^2\theta}$$

**半角公式**

$$\sin\frac{\theta}{2} = \pm\sqrt{\frac{1-\cos\theta}{2}}$$

$$\cos\frac{\theta}{2} = \pm\sqrt{\frac{1+\cos\theta}{2}}$$

$$\tan\frac{\theta}{2} = \frac{1-\cos\theta}{\sin\theta} = \frac{\sin\theta}{1+\cos\theta}$$

**积化和差**

$$\sin\alpha\cos\beta = \frac{1}{2}[\sin(\alpha+\beta) + \sin(\alpha-\beta)]$$

$$\cos\alpha\cos\beta = \frac{1}{2}[\cos(\alpha+\beta) + \cos(\alpha-\beta)]$$

$$\sin\alpha\sin\beta = \frac{1}{2}[\cos(\alpha-\beta) - \cos(\alpha+\beta)]$$

**和差化积**

$$\sin\alpha + \sin\beta = 2\sin\frac{\alpha+\beta}{2}\cos\frac{\alpha-\beta}{2}$$

$$\sin\alpha - \sin\beta = 2\cos\frac{\alpha+\beta}{2}\sin\frac{\alpha-\beta}{2}$$

$$\cos\alpha + \cos\beta = 2\cos\frac{\alpha+\beta}{2}\cos\frac{\alpha-\beta}{2}$$

$$\cos\alpha - \cos\beta = -2\sin\frac{\alpha+\beta}{2}\sin\frac{\alpha-\beta}{2}$$

**正弦定理**

$$\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C} = 2R$$

其中 $R$ 是外接圆半径。

**余弦定理**

$$c^2 = a^2 + b^2 - 2ab\cos C$$

**投影定理**

$$a = b\cos C + c\cos B$$

**三角形面积公式**

$$S = \frac{1}{2}ab\sin C = \frac{1}{2}bc\sin A = \frac{1}{2}ca\sin B$$

---

## 五、常用不等式

### 5.1 基本不等式

**AM-GM 不等式（算术-几何平均）**

$$\frac{a_1 + a_2 + \cdots + a_n}{n} \geq \sqrt[n]{a_1 a_2 \cdots a_n}$$

等号当且仅当 $a_1 = a_2 = \cdots = a_n$ 时成立。

**两数形式**

$$\frac{a+b}{2} \geq \sqrt{ab}, \quad a, b > 0$$

**加权 AM-GM**

$$\sum_{i=1}^{n} w_i a_i \geq \prod_{i=1}^{n} a_i^{w_i}$$

其中 $w_i > 0$ 且 $\sum w_i = 1$。

**柯西-施瓦茨不等式**

$$\left(\sum_{i=1}^{n} a_i b_i\right)^2 \leq \left(\sum_{i=1}^{n} a_i^2\right)\left(\sum_{i=1}^{n} b_i^2\right)$$

积分形式：$\left(\int fg\right)^2 \leq \left(\int f^2\right)\left(\int g^2\right)$

**闵可夫斯基不等式**

$$\left(\sum_{i=1}^{n} |a_i + b_i|^p\right)^{1/p} \leq \left(\sum_{i=1}^{n} |a_i|^p\right)^{1/p} + \left(\sum_{i=1}^{n} |b_i|^p\right)^{1/p}$$

$p \geq 1$ 时成立。

**三角不等式**

$$|a + b| \leq |a| + |b|$$

$$||a| - |b|| \leq |a - b|$$

### 5.2 高级不等式

**琴生不等式（Jensen）**

对于凸函数 $f$：

$$f\left(\sum_{i=1}^{n} w_i x_i\right) \leq \sum_{i=1}^{n} w_i f(x_i)$$

**赫尔德不等式（Hölder）**

$$\sum_{i=1}^{n} |a_i b_i| \leq \left(\sum_{i=1}^{n} |a_i|^p\right)^{1/p} \left(\sum_{i=1}^{n} |b_i|^q\right)^{1/q}$$

其中 $\frac{1}{p} + \frac{1}{q} = 1$，$p, q > 1$。

**杨氏不等式（Young）**

$$ab \leq \frac{a^p}{p} + \frac{b^q}{q}$$

其中 $\frac{1}{p} + \frac{1}{q} = 1$，$a, b > 0$。

**切比雪夫不等式**

若 $a_1 \leq a_2 \leq \cdots \leq a_n$ 且 $b_1 \leq b_2 \leq \cdots \leq b_n$：

$$\frac{1}{n}\sum_{i=1}^{n} a_i b_i \geq \left(\frac{1}{n}\sum_{i=1}^{n} a_i\right)\left(\frac{1}{n}\sum_{i=1}^{n} b_i\right)$$

**排序不等式**

$$a_1 b_n + a_2 b_{n-1} + \cdots + a_n b_1 \leq a_1 b_{j_1} + a_2 b_{j_2} + \cdots + a_n b_{j_n} \leq a_1 b_1 + a_2 b_2 + \cdots + a_n b_n$$

**伯努利不等式**

$$(1+x)^n \geq 1 + nx, \quad x \geq -1, n \geq 1$$

**幂平均不等式**

对于 $r < s$：

$$\left(\frac{1}{n}\sum_{i=1}^{n} a_i^r\right)^{1/r} \leq \left(\frac{1}{n}\sum_{i=1}^{n} a_i^s\right)^{1/s}$$

### 5.3 积分不等式

**积分形式的柯西-施瓦茨**

$$\left(\int_a^b f(x)g(x) dx\right)^2 \leq \int_a^b f^2(x) dx \cdot \int_a^b g^2(x) dx$$

**赫尔德积分不等式**

$$\int_a^b |f(x)g(x)| dx \leq \left(\int_a^b |f(x)|^p dx\right)^{1/p} \left(\int_a^b |g(x)|^q dx\right)^{1/q}$$

**闵可夫斯基积分不等式**

$$\left(\int_a^b |f+g|^p dx\right)^{1/p} \leq \left(\int_a^b |f|^p dx\right)^{1/p} + \left(\int_a^b |g|^p dx\right)^{1/p}$$

---

## 六、级数与极限

### 6.1 数列极限

**收敛定义**

$$\lim_{n \to \infty} a_n = L \Leftrightarrow \forall \epsilon > 0, \exists N, n > N \Rightarrow |a_n - L| < \epsilon$$

**重要极限**

$$\lim_{n \to \infty} \left(1 + \frac{1}{n}\right)^n = e$$

$$\lim_{n \to \infty} \sqrt[n]{n} = 1$$

$$\lim_{n \to \infty} \frac{n!}{n^n} = 0$$

### 6.2 级数收敛

**等比级数**

$$\sum_{n=0}^{\infty} ar^n = \frac{a}{1-r}, \quad |r| < 1$$

**调和级数**

$$\sum_{n=1}^{\infty} \frac{1}{n} = \infty \quad \text{（发散）}$$

**p-级数**

$$\sum_{n=1}^{\infty} \frac{1}{n^p} \begin{cases} \text{收敛} & p > 1 \\ \text{发散} & p \leq 1 \end{cases}$$

**交错级数（莱布尼茨判别法）**

若 $a_n$ 单调递减且 $\lim a_n = 0$，则 $\sum (-1)^n a_n$ 收敛。

**比值判别法**

$$\lim_{n \to \infty} \left|\frac{a_{n+1}}{a_n}\right| = r \begin{cases} < 1 & \text{收敛} \\ > 1 & \text{发散} \end{cases}$$

**根值判别法**

$$\lim_{n \to \infty} \sqrt[n]{|a_n|} = r \begin{cases} < 1 & \text{收敛} \\ > 1 & \text{发散} \end{cases}$$

### 6.3 幂级数

**收敛半径**

$$R = \frac{1}{\limsup_{n \to \infty} \sqrt[n]{|a_n|}}$$

或 $R = \lim_{n \to \infty} \left|\frac{a_n}{a_{n+1}}\right|$（若极限存在）

**常见函数的幂级数**

$$\frac{1}{1-x} = \sum_{n=0}^{\infty} x^n, \quad |x| < 1$$

$$\frac{1}{1+x} = \sum_{n=0}^{\infty} (-1)^n x^n, \quad |x| < 1$$

### 6.4 傅里叶级数

**傅里叶系数**

$$a_0 = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x) dx$$

$$a_n = \frac{1}{\pi}\int_{-\pi}^{\pi} f(x)\cos(nx) dx$$

$$b_n = \frac{1}{\pi}\int_{-\pi}^{\pi} f(x)\sin(nx) dx$$

**傅里叶级数**

$$f(x) = \frac{a_0}{2} + \sum_{n=1}^{\infty} [a_n\cos(nx) + b_n\sin(nx)]$$

**复数形式**

$$f(x) = \sum_{n=-\infty}^{\infty} c_n e^{inx}$$

$$c_n = \frac{1}{2\pi}\int_{-\pi}^{\pi} f(x) e^{-inx} dx$$

**帕塞瓦尔等式**

$$\frac{1}{\pi}\int_{-\pi}^{\pi} |f(x)|^2 dx = \frac{a_0^2}{2} + \sum_{n=1}^{\infty}(a_n^2 + b_n^2)$$

---

## 七、复变函数

### 7.1 基本概念

**柯西-黎曼方程**

$$\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \quad \frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x}$$

$f(z) = u(x,y) + iv(x,y)$ 解析的必要条件。

### 7.2 积分定理

**柯西积分定理**

$$\oint_C f(z) dz = 0$$

若 $f$ 在单连通区域内解析。

**柯西积分公式**

$$f(a) = \frac{1}{2\pi i}\oint_C \frac{f(z)}{z-a} dz$$

**高阶导数公式**

$$f^{(n)}(a) = \frac{n!}{2\pi i}\oint_C \frac{f(z)}{(z-a)^{n+1}} dz$$

### 7.3 留数定理

**留数**

$$\text{Res}(f, a) = \frac{1}{2\pi i}\oint_C f(z) dz$$

**一阶极点留数**

$$\text{Res}(f, a) = \lim_{z \to a} (z-a)f(z)$$

**留数定理**

$$\oint_C f(z) dz = 2\pi i \sum_k \text{Res}(f, z_k)$$

### 7.4 洛朗级数

$$f(z) = \sum_{n=-\infty}^{\infty} c_n (z-a)^n$$

其中 $c_n = \frac{1}{2\pi i}\oint_C \frac{f(z)}{(z-a)^{n+1}} dz$

---

## 八、常微分方程

### 8.1 一阶方程

**可分离变量**

$$\frac{dy}{dx} = g(x)h(y) \Rightarrow \int \frac{dy}{h(y)} = \int g(x) dx$$

**一阶线性方程**

$$\frac{dy}{dx} + P(x)y = Q(x)$$

通解：$y = e^{-\int P dx}\left(\int Q e^{\int P dx} dx + C\right)$

**齐次方程**

$$\frac{dy}{dx} = f\left(\frac{y}{x}\right)$$

令 $u = y/x$ 转化为可分离变量。

**伯努利方程**

$$\frac{dy}{dx} + P(x)y = Q(x)y^n$$

令 $u = y^{1-n}$ 转化为线性方程。

### 8.2 二阶方程

**常系数齐次方程**

$$y'' + ay' + by = 0$$

特征方程 $r^2 + ar + b = 0$：

- 两不等实根 $r_1, r_2$：$y = C_1 e^{r_1 x} + C_2 e^{r_2 x}$
- 重根 $r$：$y = (C_1 + C_2 x)e^{rx}$
- 共轭复根 $\alpha \pm i\beta$：$y = e^{\alpha x}(C_1\cos\beta x + C_2\sin\beta x)$

**二阶常系数非齐次方程**

$$y'' + ay' + by = f(x)$$

通解 = 齐次通解 + 特解

### 8.3 拉普拉斯变换

**定义**

$$\mathcal{L}\{f(t)\} = F(s) = \int_0^{\infty} f(t) e^{-st} dt$$

**常见变换**

$$\mathcal{L}\{1\} = \frac{1}{s}$$

$$\mathcal{L}\{t^n\} = \frac{n!}{s^{n+1}}$$

$$\mathcal{L}\{e^{at}\} = \frac{1}{s-a}$$

$$\mathcal{L}\{\sin(at)\} = \frac{a}{s^2+a^2}$$

$$\mathcal{L}\{\cos(at)\} = \frac{s}{s^2+a^2}$$

**导数变换**

$$\mathcal{L}\{f'(t)\} = sF(s) - f(0)$$

$$\mathcal{L}\{f''(t)\} = s^2F(s) - sf(0) - f'(0)$$

**卷积定理**

$$\mathcal{L}\{f * g\} = F(s) \cdot G(s)$$

其中 $(f*g)(t) = \int_0^t f(\tau)g(t-\tau) d\tau$

---

## 附录：希腊字母

| 大写 | 小写 | 名称 | 常用含义 |
|------|------|------|----------|
| $\Alpha$ | $\alpha$ | alpha | 角度、系数 |
| $\Beta$ | $\beta$ | beta | 角度、系数 |
| $\Gamma$ | $\gamma$ | gamma | Gamma 函数 |
| $\Delta$ | $\delta$ | delta | 变量、判别式 |
| $\Epsilon$ | $\epsilon$ | epsilon | 小量 |
| $\Zeta$ | $\zeta$ | zeta | Riemann zeta |
| $\Eta$ | $\eta$ | eta | 效率 |
| $\Theta$ | $\theta$ | theta | 角度 |
| $\Iota$ | $\iota$ | iota | - |
| $\Kappa$ | $\kappa$ | kappa | 曲率 |
| $\Lambda$ | $\lambda$ | lambda | 特征值、参数 |
| $\Mu$ | $\mu$ | mu | 均值 |
| $\Nu$ | $\nu$ | nu | 频率 |
| $\Xi$ | $\xi$ | xi | 随机变量 |
| $\Omicron$ | $\omicron$ | omicron | - |
| $\Pi$ | $\pi$ | pi | 圆周率 |
| $\Rho$ | $\rho$ | rho | 相关系数 |
| $\Sigma$ | $\sigma$ | sigma | 标准差、求和 |
| $\Tau$ | $\tau$ | tau | 时间常数 |
| $\Upsilon$ | $\upsilon$ | upsilon | - |
| $\Phi$ | $\phi$ | phi | 相位角 |
| $\Chi$ | $\chi$ | chi | 卡方 |
| $\Psi$ | $\psi$ | psi | 波函数 |
| $\Omega$ | $\omega$ | omega | 角速度 |

---

*本文档收录约 180 个核心数学公式，涵盖代数、微积分、概率统计、几何、不等式等主要领域。*
