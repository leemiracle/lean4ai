# 化学公式与方程汇编

## 1. 化学平衡公式

### 1.1 平衡常数

**标准平衡常数**
$$K^\ominus = \prod_i (a_i)^{\nu_i}$$
其中 $a_i$ 为组分 $i$ 的活度，$\nu_i$ 为化学计量数。

**浓度平衡常数**
$$K_c = \prod_i [c_i]^{\nu_i}$$
适用于稀溶液中的反应。

**压力平衡常数**
$$K_p = \prod_i (p_i/p^\ominus)^{\nu_i}$$
适用于气相反应。

**$K_p$ 与 $K_c$ 的关系**
$$K_p = K_c(RT)^{\Delta n}$$
$\Delta n$ 为气体产物与反应物计量数之差。

**经验平衡常数**
$$K = \frac{[产物]}{[反应物]}$$
浓度以 mol·L⁻¹ 表示。

**活度与浓度关系**
$$a = \gamma \cdot \frac{c}{c^\ominus}$$
$\gamma$ 为活度系数。

**活度与压力关系**
$$a = \gamma \cdot \frac{p}{p^\ominus}$$
适用于实际气体。

### 1.2 反应商

**反应商定义**
$$Q = \prod_i (a_i)^{\nu_i}$$
反应商用于判断反应方向。

**平衡判据**
- $Q < K$：反应正向进行
- $Q = K$：反应达到平衡
- $Q > K$：反应逆向进行

### 1.3 范特霍夫方程

**微分形式**
$$\frac{d\ln K}{dT} = \frac{\Delta_r H_m^\ominus}{RT^2}$$

**积分形式（$\Delta H$ 为常数）**
$$\ln\frac{K_2}{K_1} = \frac{\Delta_r H_m^\ominus}{R}\left(\frac{1}{T_1}-\frac{1}{T_2}\right)$$

**不定积分形式**
$$\ln K = -\frac{\Delta_r H_m^\ominus}{RT} + \frac{\Delta_r S_m^\ominus}{R}$$

### 1.4 勒夏特列原理

**浓度效应**
$$\left(\frac{\partial \ln K}{\partial \ln a_i}\right)_T = \nu_i$$

**压力效应**
$$\left(\frac{\partial \ln K_x}{\partial P}\right)_T = -\frac{\Delta V^\ominus}{RT}$$

**温度效应**
$$\left(\frac{\partial \ln K}{\partial T}\right)_P = \frac{\Delta_r H_m^\ominus}{RT^2}$$

### 1.5 多重平衡

**耦合反应平衡常数**
$$K_{总} = K_1 \times K_2$$
多个反应相加时，平衡常数相乘。

**竞争反应**
$$\frac{K_1}{K_2} = \frac{[产物_1]}{[产物_2]}$$

### 1.6 相平衡

**克拉佩龙方程**
$$\frac{dP}{dT} = \frac{\Delta S}{\Delta V} = \frac{\Delta H}{T\Delta V}$$

**克劳修斯-克拉佩龙方程**
$$\ln P = -\frac{\Delta_{vap}H_m}{RT} + C$$

**积分形式**
$$\ln\frac{P_2}{P_1} = \frac{\Delta_{vap}H_m}{R}\left(\frac{1}{T_1}-\frac{1}{T_2}\right)$$

**拉乌尔定律**
$$P_A = x_A P_A^*$$
理想溶液中溶剂的蒸气压。

**亨利定律**
$$P_B = k_H \cdot x_B$$
稀溶液中溶质的蒸气压。

**凝固点降低**
$$\Delta T_f = K_f \cdot m$$
$K_f$ 为凝固点降低常数。

**沸点升高**
$$\Delta T_b = K_b \cdot m$$
$K_b$ 为沸点升高常数。

**渗透压**
$$\Pi = cRT$$
范特霍夫渗透压公式。

## 2. 电化学公式

### 2.1 法拉第定律

**法拉第第一定律**
$$m = \frac{Q \cdot M}{z \cdot F} = \frac{I \cdot t \cdot M}{z \cdot F}$$
$m$ 为电极上析出物质的质量。

**法拉第第二定律**
$$\frac{m_1}{m_2} = \frac{M_1/z_1}{M_2/z_2}$$

**法拉第常数**
$$F = N_A \cdot e = 96485 \text{ C·mol}^{-1}$$

### 2.2 能斯特方程

**电池电动势**
$$E = E^\ominus - \frac{RT}{zF}\ln Q$$

**25°C 时的能斯特方程**
$$E = E^\ominus - \frac{0.05916}{z}\lg Q$$

**电极电势**
$$E = E^\ominus + \frac{RT}{zF}\ln\frac{a_{ox}}{a_{red}}$$

**25°C 时的电极电势**
$$E = E^\ominus + \frac{0.05916}{z}\lg\frac{[氧化态]}{[还原态]}$$

### 2.3 电池热力学

**吉布斯自由能与电动势**
$$\Delta_r G_m = -zFE$$

**标准吉布斯自由能**
$$\Delta_r G_m^\ominus = -zFE^\ominus$$

**标准电动势与平衡常数**
$$E^\ominus = \frac{RT}{zF}\ln K^\ominus$$

**25°C 时**
$$E^\ominus = \frac{0.05916}{z}\lg K^\ominus$$

**熵变与电动势**
$$\Delta_r S_m = zF\left(\frac{\partial E}{\partial T}\right)_P$$

**焓变与电动势**
$$\Delta_r H_m = -zFE + zFT\left(\frac{\partial E}{\partial T}\right)_P$$

### 2.4 电解与超电势

**分解电压**
$$E_{分解} = E_{可逆} + \eta_a + \eta_c + IR$$
$\eta$ 为超电势。

**塔菲尔方程**
$$\eta = a + b\lg j$$
$j$ 为电流密度。

**阴极超电势**
$$\eta_c = E_{eq} - E_{实际}$$

**阳极超电势**
$$\eta_a = E_{实际} - E_{eq}$$

**巴特勒-沃尔默方程**
$$j = j_0\left[\exp\left(\frac{\alpha zF\eta}{RT}\right) - \exp\left(-\frac{(1-\alpha)zF\eta}{RT}\right)\right]$$
$j_0$ 为交换电流密度。

### 2.5 电导与电导率

**电导**
$$G = \frac{1}{R} = \kappa \cdot \frac{A}{l}$$
$\kappa$ 为电导率。

**电导率**
$$\kappa = G \cdot \frac{l}{A}$$

**摩尔电导率**
$$\Lambda_m = \frac{\kappa}{c}$$

**科尔劳施定律**
$$\Lambda_m = \Lambda_m^\infty - K\sqrt{c}$$
强电解质稀溶液。

**离子独立移动定律**
$$\Lambda_m^\infty = \nu_+\lambda_+^\infty + \nu_-\lambda_-^\infty$$

**离子电导率**
$$\lambda_i^\infty = |z_i|F u_i^\infty$$
$u_i$ 为离子迁移率。

**德拜-休克尔-昂萨格方程**
$$\Lambda_m = \Lambda_m^\infty - (A + B\Lambda_m^\infty)\sqrt{c}$$

### 2.6 离子强度与活度系数

**离子强度**
$$I = \frac{1}{2}\sum_i c_i z_i^2$$

**德拜-休克尔极限定律**
$$\lg\gamma_\pm = -A|z_+z_-|\sqrt{I}$$

**德拜-休克尔扩展方程**
$$\lg\gamma_\pm = \frac{-A|z_+z_-|\sqrt{I}}{1 + Ba\sqrt{I}}$$

**平均活度系数**
$$\gamma_\pm = (\gamma_+^{\nu_+}\gamma_-^{\nu_-})^{1/\nu}$$

## 3. 热力学公式

### 3.1 热力学第一定律

**内能变化**
$$\Delta U = Q + W$$

**封闭系统**
$$dU = \delta Q + \delta W$$

**体积功**
$$W = -\int_{V_1}^{V_2} P_{ext} dV$$

**可逆过程体积功**
$$W = -nRT\ln\frac{V_2}{V_1}$$

**恒容热**
$$Q_V = \Delta U = nC_{V,m}\Delta T$$

**恒压热**
$$Q_P = \Delta H = nC_{P,m}\Delta T$$

### 3.2 焓

**焓的定义**
$$H = U + PV$$

**焓变**
$$\Delta H = \Delta U + \Delta(PV)$$

**理想气体焓变**
$$\Delta H = nC_{P,m}\Delta T$$

**标准生成焓**
$$\Delta_f H_m^\ominus$$
标准状态下由最稳定单质生成1mol化合物的焓变。

**反应焓**
$$\Delta_r H_m^\ominus = \sum\nu_B\Delta_f H_m^\ominus(B)$$

**赫斯定律**
$$\Delta_r H = \Delta H_1 + \Delta H_2 + \cdots$$

**基尔霍夫定律**
$$\Delta_r H_m(T_2) = \Delta_r H_m(T_1) + \int_{T_1}^{T_2}\Delta_r C_p dT$$

### 3.3 热容

**恒容热容**
$$C_V = \left(\frac{\partial U}{\partial T}\right)_V$$

**恒压热容**
$$C_P = \left(\frac{\partial H}{\partial T}\right)_P$$

**热容差**
$$C_P - C_V = nR$$
理想气体。

**热容比**
$$\gamma = \frac{C_{P,m}}{C_{V,m}}$$

**能量均分定理**
$$C_{V,m} = \frac{f}{2}R$$
$f$ 为自由度。

### 3.4 热力学第二定律与熵

**熵的定义**
$$dS = \frac{\delta Q_{rev}}{T}$$

**熵变计算**
$$\Delta S = \int\frac{\delta Q_{rev}}{T}$$

**等温过程熵变**
$$\Delta S = \frac{Q_{rev}}{T}$$

**等温膨胀**
$$\Delta S = nR\ln\frac{V_2}{V_1}$$

**等压变温**
$$\Delta S = nC_{P,m}\ln\frac{T_2}{T_1}$$

**等容变温**
$$\Delta S = nC_{V,m}\ln\frac{T_2}{T_1}$$

**相变熵**
$$\Delta_{trs}S = \frac{\Delta_{trs}H}{T_{trs}}$$

**标准摩尔熵**
$$S_m^\ominus$$

**反应熵**
$$\Delta_r S_m^\ominus = \sum\nu_B S_m^\ominus(B)$$

**熵增加原理**
$$\Delta S_{孤立} \geq 0$$

**克劳修斯不等式**
$$dS \geq \frac{\delta Q}{T}$$

### 3.5 吉布斯自由能

**吉布斯自由能定义**
$$G = H - TS$$

**吉布斯自由能变**
$$dG = -SdT + VdP$$

**恒温恒压过程**
$$\Delta G = \Delta H - T\Delta S$$

**标准生成吉布斯自由能**
$$\Delta_f G_m^\ominus$$

**反应吉布斯自由能**
$$\Delta_r G_m^\ominus = \sum\nu_B\Delta_f G_m^\ominus(B)$$

**吉布斯-赫姆霍兹方程**
$$\left(\frac{\partial(G/T)}{\partial T}\right)_P = -\frac{H}{T^2}$$

**吉布斯自由能与平衡常数**
$$\Delta_r G_m = \Delta_r G_m^\ominus + RT\ln Q$$

**平衡时**
$$\Delta_r G_m^\ominus = -RT\ln K^\ominus$$

**吉布斯自由能判据**
- $\Delta G < 0$：自发过程
- $\Delta G = 0$：平衡态
- $\Delta G > 0$：非自发过程

### 3.6 亥姆霍兹自由能

**亥姆霍兹自由能定义**
$$A = U - TS$$

**亥姆霍兹自由能变**
$$dA = -SdT - PdV$$

**亥姆霍兹自由能判据**
恒温恒容条件下：$\Delta A \leq 0$

**吉布斯自由能与亥姆霍兹自由能关系**
$$G = A + PV$$

### 3.7 化学势

**化学势定义**
$$\mu_i = \left(\frac{\partial G}{\partial n_i}\right)_{T,P,n_{j\neq i}}$$

**理想气体化学势**
$$\mu = \mu^\ominus + RT\ln\frac{p}{p^\ominus}$$

**理想溶液化学势**
$$\mu_i = \mu_i^\ominus + RT\ln x_i$$

**实际溶液化学势**
$$\mu_i = \mu_i^\ominus + RT\ln a_i$$

**化学平衡条件**
$$\sum_i \nu_i\mu_i = 0$$

**吉布斯-杜亥姆方程**
$$\sum_i n_i d\mu_i = 0$$

### 3.8 麦克斯韦关系式

**内能**
$$\left(\frac{\partial T}{\partial V}\right)_S = -\left(\frac{\partial P}{\partial S}\right)_V$$

**焓**
$$\left(\frac{\partial T}{\partial P}\right)_S = \left(\frac{\partial V}{\partial S}\right)_P$$

**亥姆霍兹自由能**
$$\left(\frac{\partial S}{\partial V}\right)_T = \left(\frac{\partial P}{\partial T}\right)_V$$

**吉布斯自由能**
$$\left(\frac{\partial S}{\partial P}\right)_T = -\left(\frac{\partial V}{\partial T}\right)_P$$

## 4. 化学动力学公式

### 4.1 速率方程

**反应速率定义**
$$r = -\frac{1}{a}\frac{d[A]}{dt} = -\frac{1}{b}\frac{d[B]}{dt} = \frac{1}{c}\frac{d[C]}{dt}$$

**速率方程一般形式**
$$r = k[A]^\alpha[B]^\beta$$

**速率常数单位**
- 零级：mol·L⁻¹·s⁻¹
- 一级：s⁻¹
- 二级：L·mol⁻¹·s⁻¹

### 4.2 零级反应

**速率方程**
$$-\frac{d[A]}{dt} = k$$

**积分形式**
$$[A] = [A]_0 - kt$$

**半衰期**
$$t_{1/2} = \frac{[A]_0}{2k}$$

**完成时间**
$$t = \frac{[A]_0}{k}$$

### 4.3 一级反应

**速率方程**
$$-\frac{d[A]}{dt} = k[A]$$

**积分形式**
$$\ln[A] = \ln[A]_0 - kt$$

**浓度形式**
$$[A] = [A]_0 e^{-kt}$$

**半衰期**
$$t_{1/2} = \frac{\ln 2}{k} = \frac{0.693}{k}$$

**平均寿命**
$$\tau = \frac{1}{k}$$

### 4.4 二级反应

**速率方程（一种反应物）**
$$-\frac{d[A]}{dt} = k[A]^2$$

**积分形式**
$$\frac{1}{[A]} = \frac{1}{[A]_0} + kt$$

**半衰期**
$$t_{1/2} = \frac{1}{k[A]_0}$$

**两种反应物**
$$\frac{1}{[A]_0 - [B]_0}\ln\frac{[B]_0[A]}{[A]_0[B]} = kt$$

### 4.5 n级反应

**速率方程**
$$-\frac{d[A]}{dt} = k[A]^n$$

**积分形式（n≠1）**
$$\frac{1}{[A]^{n-1}} - \frac{1}{[A]_0^{n-1}} = (n-1)kt$$

**半衰期**
$$t_{1/2} = \frac{2^{n-1}-1}{(n-1)k[A]_0^{n-1}}$$

### 4.6 阿伦尼乌斯方程

**指数形式**
$$k = A e^{-E_a/RT}$$

**对数形式**
$$\ln k = \ln A - \frac{E_a}{RT}$$

**微分形式**
$$\frac{d\ln k}{dT} = \frac{E_a}{RT^2}$$

**积分形式**
$$\ln\frac{k_2}{k_1} = \frac{E_a}{R}\left(\frac{1}{T_1}-\frac{1}{T_2}\right)$$

**指前因子**
$$A$$
频率因子或碰撞因子。

**活化能**
$$E_a$$
反应的能垒。

### 4.7 复杂反应

**连续反应**
$$[B] = \frac{k_1[A]_0}{k_2-k_1}(e^{-k_1t}-e^{-k_2t})$$

**平行反应**
$$\frac{[B]}{[C]} = \frac{k_1}{k_2}$$

**对峙反应**
$$K_{eq} = \frac{k_f}{k_r}$$

**平衡浓度**
$$[A]_{eq} = \frac{k_r[A]_0}{k_f+k_r}$$

### 4.8 稳态近似

**稳态假设**
$$\frac{d[中间体]}{dt} \approx 0$$

**中间体浓度**
$$[中间体] = \frac{k_1[反应物]}{k_{-1}+k_2}$$

### 4.9 链反应

**链引发速率**
$$r_i$$

**链传递速率**
$$r_p$$

**链终止速率**
$$r_t$$

**稳态条件**
$$r_i = r_t$$

**聚合度**
$$\bar{n} = \frac{r_p}{r_t}$$

### 4.10 催化反应

**米氏方程**
$$v = \frac{V_{max}[S]}{K_m + [S]}$$

**米氏常数**
$$K_m = \frac{k_{-1}+k_2}{k_1}$$

**最大速率**
$$V_{max} = k_2[E]_0$$

**双倒数形式（Lineweaver-Burk）**
$$\frac{1}{v} = \frac{K_m}{V_{max}}\frac{1}{[S]} + \frac{1}{V_{max}}$$

**催化效率**
$$\frac{k_{cat}}{K_m}$$

### 4.11 过渡态理论

**速率常数**
$$k = \frac{k_B T}{h}K^\ddagger$$

**艾林方程**
$$k = \frac{k_B T}{h}e^{\Delta S^\ddagger/R}e^{-\Delta H^\ddagger/RT}$$

**活化吉布斯自由能**
$$\Delta G^\ddagger = \Delta H^\ddagger - T\Delta S^\ddagger$$

**速率常数与活化自由能**
$$k = \frac{k_B T}{h}e^{-\Delta G^\ddagger/RT}$$

## 5. 量子化学基础公式

### 5.1 波函数

**波函数定义**
$$\Psi(\vec{r}, t)$$
描述粒子状态的函数。

**概率密度**
$$|\Psi|^2 = \Psi^*\Psi$$

**归一化条件**
$$\int_{-\infty}^{+\infty}|\Psi|^2 d\tau = 1$$

**波函数叠加**
$$\Psi = c_1\Psi_1 + c_2\Psi_2$$

### 5.2 薛定谔方程

**含时薛定谔方程**
$$i\hbar\frac{\partial\Psi}{\partial t} = \hat{H}\Psi$$

**定态薛定谔方程**
$$\hat{H}\Psi = E\Psi$$

**哈密顿算符**
$$\hat{H} = -\frac{\hbar^2}{2m}\nabla^2 + V(\vec{r})$$

**拉普拉斯算符（三维）**
$$\nabla^2 = \frac{\partial^2}{\partial x^2} + \frac{\partial^2}{\partial y^2} + \frac{\partial^2}{\partial z^2}$$

### 5.3 算符

**动量算符**
$$\hat{p} = -i\hbar\nabla$$

**一维动量算符**
$$\hat{p}_x = -i\hbar\frac{\partial}{\partial x}$$

**位置算符**
$$\hat{x} = x$$

**动能算符**
$$\hat{T} = -\frac{\hbar^2}{2m}\nabla^2$$

**角动量算符**
$$\hat{L}^2 = -\hbar^2\left[\frac{1}{\sin\theta}\frac{\partial}{\partial\theta}\left(\sin\theta\frac{\partial}{\partial\theta}\right) + \frac{1}{\sin^2\theta}\frac{\partial^2}{\partial\phi^2}\right]$$

**角动量z分量算符**
$$\hat{L}_z = -i\hbar\frac{\partial}{\partial\phi}$$

**对易子**
$$[\hat{A},\hat{B}] = \hat{A}\hat{B} - \hat{B}\hat{A}$$

**对易关系**
$$[\hat{x},\hat{p}_x] = i\hbar$$

### 5.4 期望值

**期望值**
$$\langle A \rangle = \int\Psi^*\hat{A}\Psi d\tau$$

**位置期望值**
$$\langle x \rangle = \int\Psi^* x\Psi dx$$

**动量期望值**
$$\langle p \rangle = \int\Psi^*(-i\hbar\frac{\partial}{\partial x})\Psi dx$$

**不确定性**
$$\Delta A = \sqrt{\langle A^2 \rangle - \langle A \rangle^2}$$

### 5.5 海森堡不确定性原理

**位置-动量不确定性**
$$\Delta x \cdot \Delta p_x \geq \frac{\hbar}{2}$$

**能量-时间不确定性**
$$\Delta E \cdot \Delta t \geq \frac{\hbar}{2}$$

**一般形式**
$$\Delta A \cdot \Delta B \geq \frac{1}{2}|\langle[\hat{A},\hat{B}]\rangle|$$

### 5.6 一维势箱

**能量本征值**
$$E_n = \frac{n^2 h^2}{8mL^2} = \frac{n^2\pi^2\hbar^2}{2mL^2}$$

**波函数**
$$\Psi_n(x) = \sqrt{\frac{2}{L}}\sin\frac{n\pi x}{L}$$

**零点能**
$$E_1 = \frac{h^2}{8mL^2}$$

**能级差**
$$\Delta E = E_{n+1} - E_n = \frac{(2n+1)h^2}{8mL^2}$$

### 5.7 谐振子

**能量本征值**
$$E_v = (v + \frac{1}{2})\hbar\omega$$
$v = 0, 1, 2, \ldots$

**零点能**
$$E_0 = \frac{1}{2}\hbar\omega$$

**振动频率**
$$\omega = \sqrt{\frac{k}{\mu}}$$
$k$ 为力常数，$\mu$ 为约化质量。

**波函数**
$$\Psi_v(\xi) = N_v H_v(\xi) e^{-\xi^2/2}$$
$\xi = \sqrt{\alpha}x$，$H_v$ 为厄米多项式。

**选择定则**
$$\Delta v = \pm 1$$

### 5.8 氢原子

**能量本征值**
$$E_n = -\frac{\mu e^4}{8\varepsilon_0^2 h^2}\frac{1}{n^2} = -\frac{13.6 \text{ eV}}{n^2}$$

**波函数**
$$\Psi_{nlm}(r,\theta,\phi) = R_{nl}(r)Y_l^m(\theta,\phi)$$

**径向波函数（1s）**
$$R_{10}(r) = 2\left(\frac{Z}{a_0}\right)^{3/2}e^{-Zr/a_0}$$

**玻尔半径**
$$a_0 = \frac{\varepsilon_0 h^2}{\pi m_e e^2} = 0.529 \text{ Å}$$

**角动量量子化**
$$L = \sqrt{l(l+1)}\hbar$$

**角动量z分量**
$$L_z = m\hbar$$

**主量子数**
$$n = 1, 2, 3, \ldots$$

**角量子数**
$$l = 0, 1, 2, \ldots, n-1$$

**磁量子数**
$$m = -l, -l+1, \ldots, 0, \ldots, l-1, l$$

**里德堡公式**
$$\tilde{\nu} = R_H\left(\frac{1}{n_1^2} - \frac{1}{n_2^2}\right)$$

### 5.9 电子自旋

**自旋角动量**
$$S = \sqrt{s(s+1)}\hbar$$
$s = \frac{1}{2}$

**自旋z分量**
$$S_z = m_s\hbar$$
$m_s = \pm\frac{1}{2}$

**自旋波函数**
$$\alpha(\omega) = |\uparrow\rangle, \quad \beta(\omega) = |\downarrow\rangle$$

**泡利矩阵**
$$\sigma_x = \begin{pmatrix}0&1\\1&0\end{pmatrix}, \sigma_y = \begin{pmatrix}0&-i\\i&0\end{pmatrix}, \sigma_z = \begin{pmatrix}1&0\\0&-1\end{pmatrix}$$

**自旋算符**
$$\hat{S}_x = \frac{\hbar}{2}\sigma_x, \quad \hat{S}_y = \frac{\hbar}{2}\sigma_y, \quad \hat{S}_z = \frac{\hbar}{2}\sigma_z$$

### 5.10 多电子原子

**泡利不相容原理**
同一原子中不能有两个电子具有完全相同的四个量子数。

**洪德规则**
在等价轨道上，电子尽可能分占不同轨道且自旋平行。

**总角动量**
$$\vec{J} = \vec{L} + \vec{S}$$

**自旋-轨道耦合**
$$\hat{H}_{SO} = \xi(r)\vec{L}\cdot\vec{S}$$

**屏蔽常数**
$$\sigma$$
Slater规则计算。

**有效核电荷**
$$Z_{eff} = Z - \sigma$$

### 5.11 变分法

**能量期望值**
$$E = \frac{\int\Psi^*\hat{H}\Psi d\tau}{\int\Psi^*\Psi d\tau}$$

**变分原理**
$$E \geq E_0$$
试探波函数计算的能量不小于基态能量。

**线性变分**
$$\Psi = \sum_i c_i\phi_i$$

**久期方程**
$$\sum_j(H_{ij} - ES_{ij})c_j = 0$$

### 5.12 分子轨道理论

**LCAO近似**
$$\Psi = \sum_i c_i\phi_i$$

**成键轨道**
$$\sigma = \frac{1}{\sqrt{2(1+S)}}(\phi_A + \phi_B)$$

**反键轨道**
$$\sigma^* = \frac{1}{\sqrt{2(1-S)}}(\phi_A - \phi_B)$$

**重叠积分**
$$S = \int\phi_A\phi_B d\tau$$

**键级**
$$BO = \frac{n_{成键} - n_{反键}}{2}$$

### 5.13 休克尔分子轨道理论

**休克尔矩阵元**
$$H_{ii} = \alpha, \quad H_{ij} = \beta \text{ (相邻)}, \quad H_{ij} = 0 \text{ (不相邻)}$$

**久期行列式**
$$|H - ES| = 0$$

**π电子能量**
$$E_\pi = \sum n_i\epsilon_i$$

**离域能**
$$DE = E_\pi - n\cdot(\alpha + \beta)$$

## 6. 统计热力学基础

### 6.1 配分函数

**玻尔兹曼分布**
$$P_i = \frac{e^{-E_i/k_BT}}{Z}$$

**正则配分函数**
$$Z = \sum_i e^{-E_i/k_BT}$$

**分子配分函数**
$$q = \sum_i g_i e^{-\epsilon_i/k_BT}$$

**配分函数的分离**
$$q = q_{tr} \cdot q_{rot} \cdot q_{vib} \cdot q_{el}$$

### 6.2 各种运动的配分函数

**平动配分函数**
$$q_{tr} = \left(\frac{2\pi m k_B T}{h^2}\right)^{3/2} V$$

**转动配分函数（线性分子）**
$$q_{rot} = \frac{8\pi^2 I k_B T}{\sigma h^2} = \frac{T}{\sigma\Theta_r}$$

**转动配分函数（非线性分子）**
$$q_{rot} = \frac{\sqrt{\pi}}{\sigma}\left(\frac{T^3}{\Theta_A\Theta_B\Theta_C}\right)^{1/2}$$

**振动配分函数**
$$q_{vib} = \frac{e^{-\Theta_v/2T}}{1-e^{-\Theta_v/T}}$$

**电子配分函数**
$$q_{el} = g_0 e^{-\epsilon_0/k_BT} + g_1 e^{-\epsilon_1/k_BT} + \cdots$$

### 6.3 热力学量与配分函数

**内能**
$$U = k_B T^2\left(\frac{\partial \ln Z}{\partial T}\right)_V$$

**熵**
$$S = k_B \ln Z + \frac{U}{T}$$

**亥姆霍兹自由能**
$$A = -k_B T \ln Z$$

**压力**
$$P = k_B T\left(\frac{\partial \ln Z}{\partial V}\right)_T$$

**焓**
$$H = U + PV$$

**吉布斯自由能**
$$G = -k_B T \ln Z + PV$$

### 6.4 玻色-爱因斯坦与费米-狄拉克统计

**玻色-爱因斯坦分布**
$$\langle n_i \rangle = \frac{1}{e^{(\epsilon_i-\mu)/k_BT} - 1}$$

**费米-狄拉克分布**
$$\langle n_i \rangle = \frac{1}{e^{(\epsilon_i-\mu)/k_BT} + 1}$$

**化学势**
$$\mu = \left(\frac{\partial A}{\partial N}\right)_{T,V}$$

## 附录：常用常数

| 常数 | 符号 | 数值 |
|------|------|------|
| 普朗克常数 | $h$ | $6.626 \times 10^{-34}$ J·s |
| 约化普朗克常数 | $\hbar$ | $1.055 \times 10^{-34}$ J·s |
| 玻尔兹曼常数 | $k_B$ | $1.381 \times 10^{-23}$ J·K⁻¹ |
| 阿伏伽德罗常数 | $N_A$ | $6.022 \times 10^{23}$ mol⁻¹ |
| 气体常数 | $R$ | $8.314$ J·mol⁻¹·K⁻¹ |
| 法拉第常数 | $F$ | $96485$ C·mol⁻¹ |
| 电子电荷 | $e$ | $1.602 \times 10^{-19}$ C |
| 电子质量 | $m_e$ | $9.109 \times 10^{-31}$ kg |
| 真空介电常数 | $\varepsilon_0$ | $8.854 \times 10^{-12}$ F·m⁻¹ |
| 玻尔半径 | $a_0$ | $5.292 \times 10^{-11}$ m |
| 光速 | $c$ | $2.998 \times 10^{8}$ m·s⁻¹ |
