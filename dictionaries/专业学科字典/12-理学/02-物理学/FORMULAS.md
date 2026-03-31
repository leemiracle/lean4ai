# 物理学核心公式

## 目录

1. [力学](#力学)
2. [电磁学](#电磁学)
3. [热力学与统计物理](#热力学与统计物理)
4. [量子力学](#量子力学)
5. [相对论](#相对论)
6. [光学](#光学)
7. [振动与波动](#振动与波动)
8. [流体力学](#流体力学)

---

## 力学

### 运动学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\vec{v} = \frac{d\vec{r}}{dt}$ | 速度定义 | 描述物体位置变化率 |
| $\vec{a} = \frac{d\vec{v}}{dt} = \frac{d^2\vec{r}}{dt^2}$ | 加速度定义 | 描述速度变化率 |
| $\vec{v} = \vec{v}_0 + \vec{a}t$ | 匀加速运动速度 | 恒力作用下的运动 |
| $\vec{r} = \vec{r}_0 + \vec{v}_0 t + \frac{1}{2}\vec{a}t^2$ | 匀加速运动位移 | 自由落体、抛体运动 |
| $v^2 = v_0^2 + 2a(x-x_0)$ | 速度-位移关系 | 无时间变量的运动分析 |
| $\vec{v} = \vec{\omega} \times \vec{r}$ | 线速度与角速度 | 圆周运动 |
| $\vec{a} = \vec{\alpha} \times \vec{r} - \omega^2\vec{r}$ | 总加速度 | 非匀速圆周运动 |
| $a_n = \frac{v^2}{r} = \omega^2 r$ | 法向加速度 | 向心加速度计算 |
| $a_t = \frac{dv}{dt}$ | 切向加速度 | 曲线运动分析 |
| $\theta = \theta_0 + \omega_0 t + \frac{1}{2}\alpha t^2$ | 角位移 | 定轴转动 |

### 牛顿运动定律

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\vec{F} = m\vec{a} = \frac{d\vec{p}}{dt}$ | 牛顿第二定律 | 力学问题基础 |
| $\vec{F}_{12} = -\vec{F}_{21}$ | 牛顿第三定律 | 相互作用分析 |
| $\vec{F}_g = G\frac{m_1 m_2}{r^2}\hat{r}$ | 万有引力定律 | 天体运动 |
| $g = \frac{GM}{R^2}$ | 表面重力加速度 | 行星表面重力 |
| $\vec{F}_N = m\vec{g}\cos\theta$ | 斜面正压力 | 斜面问题 |
| $\vec{F}_f = \mu\vec{N}$ | 摩擦力 | 滑动摩擦计算 |
| $\vec{F}_s \leq \mu_s \vec{N}$ | 静摩擦力 | 静平衡分析 |

### 能量与功

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $W = \vec{F} \cdot \vec{d} = Fd\cos\theta$ | 功的定义 | 力的空间积累效应 |
| $W = \int \vec{F} \cdot d\vec{r}$ | 变力做功 | 非恒力作用 |
| $P = \frac{dW}{dt} = \vec{F} \cdot \vec{v}$ | 功率 | 能量转移速率 |
| $E_k = \frac{1}{2}mv^2$ | 平动动能 | 运动物体能量 |
| $E_k = \frac{p^2}{2m}$ | 动能-动量关系 | 动量已知时求动能 |
| $E_p = mgh$ | 重力势能 | 近地面势能 |
| $E_p = -G\frac{m_1 m_2}{r}$ | 引力势能 | 天体系统 |
| $E_p = \frac{1}{2}kx^2$ | 弹性势能 | 弹簧系统 |
| $E = E_k + E_p = \text{常数}$ | 机械能守恒 | 保守系统中应用 |
| $W_{nc} = \Delta E$ | 功能原理 | 非保守力做功 |

### 动量与冲量

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\vec{p} = m\vec{v}$ | 动量定义 | 运动状态描述 |
| $\vec{J} = \int \vec{F} dt = \Delta\vec{p}$ | 冲量-动量定理 | 碰撞问题 |
| $\vec{p}_1 + \vec{p}_2 = \vec{p}_1' + \vec{p}_2'$ | 动量守恒 | 碰撞、爆炸 |
| $\vec{F}_{ext} = \frac{d\vec{P}_{cm}}{dt}$ | 质心运动定律 | 系统运动分析 |
| $\vec{r}_{cm} = \frac{\sum m_i \vec{r}_i}{\sum m_i}$ | 质心位置 | 系统平衡点 |
| $\vec{v}_{cm} = \frac{\sum m_i \vec{v}_i}{M}$ | 质心速度 | 系统整体运动 |
| $e = \frac{v_2' - v_1'}{v_1 - v_2}$ | 恢复系数 | 碰撞类型判定 |

### 转动力学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $L = I\omega$ | 角动量 | 转动状态描述 |
| $\vec{L} = \vec{r} \times \vec{p}$ | 质点角动量 | 轨道角动量 |
| $\vec{\tau} = \vec{r} \times \vec{F}$ | 力矩 | 转动效应 |
| $\vec{\tau} = \frac{d\vec{L}}{dt}$ | 角动量定理 | 转动动力学 |
| $I = \sum m_i r_i^2 = \int r^2 dm$ | 转动惯量 | 转动惯性度量 |
| $I_{||} = I_{cm} + Md^2$ | 平行轴定理 | 偏轴转动惯量 |
| $I_{\perp} = I_x + I_y$ | 垂直轴定理 | 薄板转动惯量 |
| $E_k = \frac{1}{2}I\omega^2$ | 转动动能 | 转动能量计算 |
| $\tau = I\alpha$ | 转动第二定律 | 定轴转动 |
| $\vec{L} = \text{常数}$ | 角动量守恒 | 无外力矩系统 |

### 刚体转动惯量

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $I = \frac{2}{5}MR^2$ | 实心球 | 球体转动 |
| $I = \frac{2}{3}MR^2$ | 空心薄球壳 | 球壳转动 |
| $I = \frac{1}{2}MR^2$ | 实心圆柱（轴线） | 圆柱转动 |
| $I = \frac{1}{12}ML^2$ | 细杆（中点） | 杆的转动 |
| $I = \frac{1}{3}ML^2$ | 细杆（端点） | 端点转轴 |
| $I = MR^2$ | 薄圆环 | 圆环转动 |
| $I = \frac{1}{4}MR^2 + \frac{1}{12}ML^2$ | 圆柱（直径） | 侧轴转动 |

---

## 电磁学

### 库仑定律与电场

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\vec{F} = k\frac{q_1 q_2}{r^2}\hat{r} = \frac{1}{4\pi\epsilon_0}\frac{q_1 q_2}{r^2}\hat{r}$ | 库仑定律 | 点电荷间作用力 |
| $\vec{E} = \frac{\vec{F}}{q} = \frac{1}{4\pi\epsilon_0}\frac{Q}{r^2}\hat{r}$ | 电场强度 | 点电荷电场 |
| $\vec{E} = \frac{1}{4\pi\epsilon_0}\int \frac{\lambda dl}{r^2}\hat{r}$ | 线电荷电场 | 带电导线 |
| $\vec{E} = \frac{\sigma}{2\epsilon_0}\hat{n}$ | 无限大平面电场 | 平行板电容器 |
| $\vec{F} = q\vec{E}$ | 电场力 | 带电粒子受力 |

### 高斯定理

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\Phi_E = \oint \vec{E} \cdot d\vec{A} = \frac{Q_{enc}}{\epsilon_0}$ | 高斯定理 | 电场通量计算 |
| $\oint \vec{D} \cdot d\vec{A} = Q_{free}$ | 电位移通量 | 介质中应用 |
| $\vec{D} = \epsilon_0 \vec{E} + \vec{P}$ | 电位移矢量 | 电介质 |
| $\vec{P} = \epsilon_0 \chi_e \vec{E}$ | 电极化强度 | 极化效应 |
| $\vec{D} = \epsilon \vec{E}$ | 线性介质 | 各向同性介质 |

### 电势与电容

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $V = \frac{1}{4\pi\epsilon_0}\frac{Q}{r}$ | 点电荷电势 | 电势计算 |
| $\Delta V = -\int_{A}^{B} \vec{E} \cdot d\vec{l}$ | 电势差 | 路径积分 |
| $\vec{E} = -\nabla V$ | 电场-电势关系 | 电势梯度 |
| $U = \frac{1}{4\pi\epsilon_0}\frac{q_1 q_2}{r}$ | 电势能 | 电荷系统能量 |
| $C = \frac{Q}{V}$ | 电容定义 | 电容器 |
| $C = \epsilon_0 \frac{A}{d}$ | 平行板电容 | 平板电容器 |
| $C = 4\pi\epsilon_0 \frac{ab}{b-a}$ | 同心球电容 | 球形电容器 |
| $C = \frac{2\pi\epsilon_0 L}{\ln(b/a)}$ | 同轴电缆电容 | 圆柱电容器 |
| $C_{series} = \left(\sum \frac{1}{C_i}\right)^{-1}$ | 串联电容 | 电容组合 |
| $C_{parallel} = \sum C_i$ | 并联电容 | 电容组合 |
| $U = \frac{1}{2}CV^2 = \frac{Q^2}{2C} = \frac{1}{2}QV$ | 电容器能量 | 储能计算 |
| $u = \frac{1}{2}\epsilon_0 E^2$ | 电场能量密度 | 电场储能 |

### 磁场

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\vec{F} = q\vec{v} \times \vec{B}$ | 洛伦兹力 | 带电粒子运动 |
| $\vec{F} = I\vec{l} \times \vec{B}$ | 安培力 | 载流导线受力 |
| $d\vec{B} = \frac{\mu_0}{4\pi}\frac{I d\vec{l} \times \hat{r}}{r^2}$ | 毕奥-萨伐尔定律 | 电流磁场 |
| $B = \frac{\mu_0 I}{2\pi r}$ | 长直导线磁场 | 导线周围磁场 |
| $B = \frac{\mu_0 I}{2R}$ | 圆环中心磁场 | 圆形电流 |
| $B = \mu_0 n I$ | 螺线管内部磁场 | 长螺线管 |
| $B = \mu_0 N I / L$ | 螺线管（长度L） | 有限长螺线管 |
| $\tau = \vec{m} \times \vec{B}$ | 磁力矩 | 磁偶极子 |
| $\vec{m} = I\vec{A}$ | 磁矩 | 电流环 |
| $U = -\vec{m} \cdot \vec{B}$ | 磁矩势能 | 磁相互作用 |

### 安培定律与磁通量

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\oint \vec{B} \cdot d\vec{l} = \mu_0 I_{enc}$ | 安培定律 | 磁场环流 |
| $\Phi_B = \int \vec{B} \cdot d\vec{A}$ | 磁通量 | 磁场穿过面 |
| $\oint \vec{B} \cdot d\vec{A} = 0$ | 磁场高斯定理 | 无磁单极子 |
| $\vec{H} = \frac{\vec{B}}{\mu_0} - \vec{M}$ | 磁场强度 | 磁介质 |
| $\vec{B} = \mu \vec{H}$ | 磁性材料 | 线性磁介质 |
| $\vec{M} = \chi_m \vec{H}$ | 磁化强度 | 磁化效应 |

### 电磁感应

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\mathcal{E} = -\frac{d\Phi_B}{dt}$ | 法拉第定律 | 感应电动势 |
| $\mathcal{E} = \oint \vec{E} \cdot d\vec{l} = -\frac{d}{dt}\int \vec{B} \cdot d\vec{A}$ | 法拉第定律（积分形式） | 感应电场 |
| $\mathcal{E} = -L\frac{dI}{dt}$ | 自感电动势 | 电感器 |
| $L = \frac{\Phi}{I}$ | 自感定义 | 电感计算 |
| $L = \mu_0 n^2 A l$ | 螺线管自感 | 螺线管电感 |
| $\mathcal{E} = -M\frac{dI}{dt}$ | 互感电动势 | 变压器原理 |
| $M = \frac{\Phi_{21}}{I_1}$ | 互感定义 | 耦合电感 |
| $U_L = \frac{1}{2}LI^2$ | 电感能量 | 磁场储能 |
| $u = \frac{B^2}{2\mu_0}$ | 磁场能量密度 | 磁场储能 |

### 麦克斯韦方程组

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\nabla \cdot \vec{E} = \frac{\rho}{\epsilon_0}$ | 高斯定律（电） | 电荷产生电场 |
| $\nabla \cdot \vec{B} = 0$ | 高斯定律（磁） | 无磁单极子 |
| $\nabla \times \vec{E} = -\frac{\partial \vec{B}}{\partial t}$ | 法拉第定律 | 变化磁场产生电场 |
| $\nabla \times \vec{B} = \mu_0 \vec{J} + \mu_0 \epsilon_0 \frac{\partial \vec{E}}{\partial t}$ | 安培-麦克斯韦定律 | 电流和变化电场产生磁场 |

### 电磁波

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $c = \frac{1}{\sqrt{\mu_0 \epsilon_0}}$ | 真空光速 | 光速定义 |
| $v = \frac{1}{\sqrt{\mu \epsilon}}$ | 介质中光速 | 介质传播 |
| $n = \frac{c}{v} = \sqrt{\mu_r \epsilon_r}$ | 折射率 | 光学介质 |
| $E = cB$ | 电磁波场关系 | 平面电磁波 |
| $\vec{S} = \frac{1}{\mu_0}\vec{E} \times \vec{B}$ | 坡印廷矢量 | 能流密度 |
| $I = \langle S \rangle = \frac{1}{2}c\epsilon_0 E_0^2$ | 电磁波强度 | 辐射强度 |
| $u = \frac{1}{2}\epsilon_0 E^2 + \frac{1}{2\mu_0}B^2$ | 电磁能量密度 | 场能量 |

### 直流电路

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $V = IR$ | 欧姆定律 | 电路基础 |
| $R = \rho \frac{L}{A}$ | 电阻公式 | 导线电阻 |
| $P = IV = I^2 R = \frac{V^2}{R}$ | 电功率 | 功率计算 |
| $R_{series} = \sum R_i$ | 串联电阻 | 电阻组合 |
| $R_{parallel} = \left(\sum \frac{1}{R_i}\right)^{-1}$ | 并联电阻 | 电阻组合 |
| $\sum I_{in} = \sum I_{out}$ | 基尔霍夫电流定律 | 节点电流 |
| $\sum V_{loop} = 0$ | 基尔霍夫电压定律 | 回路电压 |
| $\tau = RC$ | RC时间常数 | 暂态过程 |
| $\tau = L/R$ | RL时间常数 | 暂态过程 |

---

## 热力学与统计物理

### 热力学定律

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $dU = \delta Q - \delta W$ | 热力学第一定律 | 能量守恒 |
| $dU = TdS - PdV$ | 热力学基本方程 | 平衡态 |
| $\Delta S \geq 0$ | 热力学第二定律 | 孤立系统熵增 |
| $S = k_B \ln \Omega$ | 玻尔兹曼熵公式 | 微观态计数 |
| $\Delta S = \int \frac{\delta Q_{rev}}{T}$ | 熵变计算 | 可逆过程 |
| $S \rightarrow 0$ as $T \rightarrow 0$ | 热力学第三定律 | 绝对零度 |

### 状态方程

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $PV = nRT$ | 理想气体状态方程 | 气体状态 |
| $PV = Nk_B T$ | 理想气体（分子数） | 微观形式 |
| $\left(P + \frac{a}{V_m^2}\right)(V_m - b) = RT$ | 范德瓦尔斯方程 | 实际气体 |
| $P V^\gamma = \text{常数}$ | 绝热过程 | 无热交换 |
| $P/T = \text{常数}$ | 等容过程 | 体积不变 |
| $V/T = \text{常数}$ | 等压过程 | 压强不变 |

### 热容与内能

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $C_V = \left(\frac{\partial U}{\partial T}\right)_V$ | 定容热容 | 等容加热 |
| $C_P = \left(\frac{\partial H}{\partial T}\right)_P$ | 定压热容 | 等压加热 |
| $C_P - C_V = nR$ | 理想气体热容差 | 迈耶公式 |
| $\gamma = \frac{C_P}{C_V}$ | 绝热指数 | 绝热过程 |
| $C_V = \frac{3}{2}nR$ | 单原子理想气体 | 平动自由度 |
| $C_V = \frac{5}{2}nR$ | 双原子理想气体 | 平动+转动 |
| $U = \frac{f}{2}nRT$ | 理想气体内能 | f为自由度 |
| $H = U + PV$ | 焓定义 | 热力学势 |

### 热力学势

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $U$ | 内能 | 能量守恒分析 |
| $H = U + PV$ | 焓 | 等压过程 |
| $F = U - TS$ | 亥姆霍兹自由能 | 等温等容 |
| $G = H - TS = U + PV - TS$ | 吉布斯自由能 | 等温等压 |
| $dU = TdS - PdV$ | 内能微分 | 基本方程 |
| $dH = TdS + VdP$ | 焓微分 | 等压系统 |
| $dF = -SdT - PdV$ | 自由能微分 | 等温系统 |
| $dG = -SdT + VdP$ | 吉布斯能微分 | 等温等压 |
| $\Delta G = \Delta H - T\Delta S$ | 吉布斯-亥姆霍兹方程 | 化学反应 |
| $\Delta G < 0$ | 自发过程判据 | 过程方向 |

### 热传导与输运

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\vec{q} = -\kappa \nabla T$ | 傅里叶定律 | 热传导 |
| $P = \frac{\kappa A \Delta T}{L}$ | 热传导功率 | 稳态传热 |
| $R_{th} = \frac{L}{\kappa A}$ | 热阻 | 热路分析 |
| $\frac{dQ}{dt} = \sigma A e (T^4 - T_0^4)$ | 斯特藩-玻尔兹曼定律 | 热辐射 |
| $\lambda_{max} T = b$ | 维恩位移定律 | 黑体辐射峰 |
| $j = -D \nabla n$ | 菲克定律 | 扩散 |
| $\eta = \frac{F/A}{dv/dz}$ | 粘滞系数 | 粘滞流动 |

### 卡诺循环与热机

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\eta = 1 - \frac{T_c}{T_h}$ | 卡诺效率 | 最大效率 |
| $\eta = \frac{W}{Q_h} = 1 - \frac{Q_c}{Q_h}$ | 热机效率 | 一般热机 |
| $COP = \frac{Q_c}{W} = \frac{T_c}{T_h - T_c}$ | 制冷系数 | 制冷机 |
| $W_{net} = Q_h - Q_c$ | 净功 | 循环功 |
| $\frac{Q_c}{Q_h} = \frac{T_c}{T_h}$ | 卡诺关系 | 可逆循环 |

### 分子动理论

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\frac{1}{2}m\langle v^2 \rangle = \frac{3}{2}k_B T$ | 平均动能 | 温度微观意义 |
| $v_{rms} = \sqrt{\frac{3k_B T}{m}} = \sqrt{\frac{3RT}{M}}$ | 方均根速率 | 速率统计 |
| $v_{avg} = \sqrt{\frac{8k_B T}{\pi m}}$ | 平均速率 | 分子碰撞 |
| $v_{mp} = \sqrt{\frac{2k_B T}{m}}$ | 最概然速率 | 麦克斯韦分布 |
| $P = \frac{1}{3}nm\langle v^2 \rangle$ | 压强公式 | 气体压强 |
| $\lambda = \frac{1}{\sqrt{2}n\sigma}$ | 平均自由程 | 碰撞间距 |
| $f(v) = 4\pi \left(\frac{m}{2\pi k_B T}\right)^{3/2} v^2 e^{-mv^2/2k_B T}$ | 麦克斯韦速率分布 | 速率分布 |

### 统计力学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $Z = \sum_i g_i e^{-E_i/k_B T}$ | 配分函数 | 统计力学核心 |
| $F = -k_B T \ln Z$ | 自由能与配分函数 | 正则系综 |
| $U = -\frac{\partial \ln Z}{\partial \beta}$ | 内能与配分函数 | 能量计算 |
| $S = k_B \ln Z + \frac{U}{T}$ | 熵与配分函数 | 熵计算 |
| $\beta = \frac{1}{k_B T}$ | 逆温度 | 统计力学 |
| $n_i = \frac{g_i}{e^{(E_i-\mu)/k_B T} + 1}$ | 费米-狄拉克分布 | 费米子 |
| $n_i = \frac{g_i}{e^{(E_i-\mu)/k_B T} - 1}$ | 玻色-爱因斯坦分布 | 玻色子 |
| $\langle E \rangle = \frac{\hbar\omega}{e^{\hbar\omega/k_B T} - 1} + \frac{1}{2}\hbar\omega$ | 谐振子平均能量 | 量子振子 |

---

## 量子力学

### 基本原理

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $E = h\nu = \hbar \omega$ | 光子能量 | 光电效应 |
| $p = \frac{h}{\lambda} = \hbar k$ | 德布罗意关系 | 物质波 |
| $\Delta x \Delta p \geq \frac{\hbar}{2}$ | 位置-动量不确定关系 | 测量精度 |
| $\Delta E \Delta t \geq \frac{\hbar}{2}$ | 能量-时间不确定关系 | 能级寿命 |
| $i\hbar \frac{\partial}{\partial t}\|\psi\rangle = \hat{H}\|\psi\rangle$ | 薛定谔方程（时间相关） | 态演化 |
| $\hat{H}\|\psi\rangle = E\|\psi\rangle$ | 定态薛定谔方程 | 能量本征态 |
| $\|\psi(\vec{r},t)\|^2$ | 概率密度 | 波函数诠释 |
| $\int \|\psi\|^2 d^3r = 1$ | 归一化条件 | 波函数 |
| $\langle A \rangle = \int \psi^* \hat{A} \psi d^3r$ | 期望值 | 测量平均值 |

### 算符与对易

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\hat{x} = x$ | 位置算符 | 坐标表象 |
| $\hat{p} = -i\hbar \frac{\partial}{\partial x}$ | 动量算符 | 坐标表象 |
| $\hat{H} = -\frac{\hbar^2}{2m}\nabla^2 + V(\vec{r})$ | 哈密顿算符 | 能量算符 |
| $\hat{L}_z = -i\hbar \frac{\partial}{\partial \phi}$ | 角动量z分量 | 角动量 |
| $\hat{L}^2 = -\hbar^2 \left[\frac{1}{\sin\theta}\frac{\partial}{\partial\theta}\left(\sin\theta\frac{\partial}{\partial\theta}\right) + \frac{1}{\sin^2\theta}\frac{\partial^2}{\partial\phi^2}\right]$ | 角动量平方 | 球坐标 |
| $[\hat{x}, \hat{p}] = i\hbar$ | 位置-动量对易子 | 正则对易 |
| $[\hat{L}_x, \hat{L}_y] = i\hbar \hat{L}_z$ | 角动量对易 | 角动量代数 |

### 一维势阱与谐振子

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $E_n = \frac{n^2 \pi^2 \hbar^2}{2mL^2}$ | 无限深势阱能级 | 量子限制 |
| $\psi_n(x) = \sqrt{\frac{2}{L}} \sin\left(\frac{n\pi x}{L}\right)$ | 无限深势阱波函数 | 驻波 |
| $E_n = \hbar\omega\left(n + \frac{1}{2}\right)$ | 谐振子能级 | 振动能级 |
| $\psi_0(x) = \left(\frac{m\omega}{\pi\hbar}\right)^{1/4} e^{-m\omega x^2/2\hbar}$ | 谐振子基态 | 高斯波包 |
| $E_0 = \frac{1}{2}\hbar\omega$ | 零点能 | 量子涨落 |
| $\Delta x = \sqrt{\frac{\hbar}{2m\omega}}$ | 谐振子基态宽度 | 基态展宽 |
| $E_n = \frac{-13.6 \text{ eV}}{n^2}$ | 氢原子能级 | 原子光谱 |
| $a_0 = \frac{4\pi\epsilon_0 \hbar^2}{m_e e^2} = 0.529 \text{ Å}$ | 玻尔半径 | 原子尺度 |

### 氢原子

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\psi_{nlm}(r,\theta,\phi) = R_{nl}(r)Y_l^m(\theta,\phi)$ | 氢原子波函数 | 电子态 |
| $E_n = -\frac{m_e e^4}{2(4\pi\epsilon_0)^2 \hbar^2 n^2}$ | 氢原子能级 | 精确公式 |
| $L^2 = \hbar^2 l(l+1)$ | 角动量量子化 | 轨道角动量 |
| $L_z = m\hbar$ | 角动量z分量 | 空间量子化 |
| $n = 1, 2, 3, ...$ | 主量子数 | 能级 |
| $l = 0, 1, 2, ..., n-1$ | 角量子数 | 角动量 |
| $m = -l, -l+1, ..., l$ | 磁量子数 | 角动量分量 |

### 自旋

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $\hat{S}^2 = \hbar^2 s(s+1)$ | 自旋大小 | 自旋量子数 |
| $S_z = \hbar m_s$ | 自旋z分量 | 自旋态 |
| $\chi_+ = \begin{pmatrix} 1 \\ 0 \end{pmatrix}$ | 自旋向上 | 电子自旋 |
| $\chi_- = \begin{pmatrix} 0 \\ 1 \end{pmatrix}$ | 自旋向下 | 电子自旋 |
| $\hat{S}_x = \frac{\hbar}{2}\begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}$ | 自旋x算符 | 泡利矩阵 |
| $\hat{S}_y = \frac{\hbar}{2}\begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix}$ | 自旋y算符 | 泡利矩阵 |
| $\hat{S}_z = \frac{\hbar}{2}\begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}$ | 自旋z算符 | 泡利矩阵 |

### 隧穿效应

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $T \approx e^{-2\kappa L}$ | 隧穿系数（WKB近似） | 势垒贯穿 |
| $\kappa = \sqrt{\frac{2m(V_0 - E)}{\hbar^2}}$ | 衰减常数 | 势垒穿透 |
| $T = \frac{1}{1 + \frac{V_0^2 \sinh^2(\kappa L)}{4E(V_0-E)}}$ | 精确隧穿系数 | 矩形势垒 |

---

## 相对论

### 狭义相对论

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $E = mc^2$ | 质能方程 | 质能等价 |
| $E = \gamma m_0 c^2$ | 总能量 | 运动质点 |
| $E^2 = (pc)^2 + (m_0 c^2)^2$ | 能量-动量关系 | 相对论能量 |
| $\gamma = \frac{1}{\sqrt{1 - v^2/c^2}}$ | 洛伦兹因子 | 时间膨胀 |
| $m = \gamma m_0$ | 相对论质量 | 质量增加 |
| $\vec{p} = \gamma m_0 \vec{v}$ | 相对论动量 | 高速运动 |
| $K = (\gamma - 1)m_0 c^2$ | 相对论动能 | 高速动能 |
| $t' = \gamma(t - vx/c^2)$ | 时间变换 | 洛伦兹变换 |
| $x' = \gamma(x - vt)$ | 空间变换 | 洛伦兹变换 |
| $\Delta t' = \gamma \Delta t_0$ | 时间膨胀 | 运动时钟 |
| $L = L_0 / \gamma$ | 长度收缩 | 运动物体 |
| $u' = \frac{u - v}{1 - uv/c^2}$ | 速度合成 | 相对速度 |
| $v_{rel} = \frac{v_1 + v_2}{1 + v_1 v_2 / c^2}$ | 相对速度 | 两物体接近 |

### 广义相对论

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $G_{\mu\nu} + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu}$ | 爱因斯坦场方程 | 引力场 |
| $R_{\mu\nu} - \frac{1}{2}Rg_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu}$ | 爱因斯坦场方程（无宇宙常数） | 引力几何化 |
| $ds^2 = -c^2 dt^2 + dx^2 + dy^2 + dz^2$ | 闵可夫斯基度规 | 平直时空 |
| $ds^2 = -\left(1 - \frac{2GM}{rc^2}\right)c^2 dt^2 + \left(1 - \frac{2GM}{rc^2}\right)^{-1}dr^2 + r^2 d\Omega^2$ | 史瓦西度规 | 球对称引力场 |
| $r_s = \frac{2GM}{c^2}$ | 史瓦西半径 | 黑洞视界 |
| $\Delta \phi = \frac{6\pi GM}{c^2 a(1-e^2)}$ | 水星近日点进动 | 轨道进动 |
| $\frac{\Delta t}{t} = \frac{GM}{c^2 R}$ | 引力时间膨胀 | 强引力场 |
| $\theta = \frac{4GM}{c^2 b}$ | 引力透镜偏转角 | 光线弯曲 |

---

## 光学

### 几何光学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $n_1 \sin\theta_1 = n_2 \sin\theta_2$ | 斯涅尔定律 | 折射定律 |
| $\theta_c = \arcsin\frac{n_2}{n_1}$ | 全反射临界角 | 光纤 |
| $\frac{1}{f} = \frac{1}{d_o} + \frac{1}{d_i}$ | 薄透镜公式 | 成像 |
| $M = -\frac{d_i}{d_o} = \frac{h_i}{h_o}$ | 放大率 | 像大小 |
| $\frac{1}{f} = (n-1)\left(\frac{1}{R_1} - \frac{1}{R_2}\right)$ | 透镜制造者公式 | 透镜设计 |
| $P = \frac{1}{f}$ | 透镜光焦度 | 屈光度 |
| $f = \frac{R}{2}$ | 球面镜焦距 | 凹面镜 |

### 波动光学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $I = I_0 \cos^2\left(\frac{\pi d \sin\theta}{\lambda}\right)$ | 双缝干涉 | 杨氏双缝 |
| $\Delta x = \frac{\lambda L}{d}$ | 干涉条纹间距 | 双缝实验 |
| $d \sin\theta = m\lambda$ | 光栅方程（明纹） | 衍射光栅 |
| $a \sin\theta = m\lambda$ | 单缝暗纹条件 | 单缝衍射 |
| $I = I_0 \left[\frac{\sin(\beta)}{\beta}\right]^2$ | 单缝衍射强度 | 衍射图样 |
| $\beta = \frac{\pi a \sin\theta}{\lambda}$ | 衍射参数 | 衍射计算 |
| $\theta \approx 1.22 \frac{\lambda}{D}$ | 艾里斑角半径 | 瑞利判据 |
| $I = I_0 \cos^2\theta$ | 马吕斯定律 | 偏振光 |
| $\tan\theta_B = \frac{n_2}{n_1}$ | 布儒斯特角 | 偏振反射 |
| $2nd\cos\theta_r = m\lambda$ | 薄膜干涉 | 薄膜颜色 |
| $R = \left(\frac{n_1 - n_2}{n_1 + n_2}\right)^2$ | 反射率 | 界面反射 |

---

## 振动与波动

### 简谐振动

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $x(t) = A\cos(\omega t + \phi)$ | 简谐振动 | 振动位移 |
| $v(t) = -A\omega\sin(\omega t + \phi)$ | 振动速度 | 速度变化 |
| $a(t) = -A\omega^2\cos(\omega t + \phi) = -\omega^2 x$ | 振动加速度 | 回复力 |
| $\omega = \sqrt{\frac{k}{m}}$ | 弹簧振子频率 | 弹簧系统 |
| $T = 2\pi\sqrt{\frac{m}{k}}$ | 弹簧振子周期 | 振动周期 |
| $\omega = \sqrt{\frac{g}{L}}$ | 单摆频率 | 小角度单摆 |
| $T = 2\pi\sqrt{\frac{L}{g}}$ | 单摆周期 | 钟摆 |
| $\omega = \sqrt{\frac{g}{R}}$ | 复摆频率 | 物理摆 |
| $E = \frac{1}{2}kA^2$ | 简谐振动总能量 | 能量守恒 |
| $E_k = \frac{1}{2}mv^2 = \frac{1}{2}kA^2\sin^2(\omega t + \phi)$ | 动能 | 振动动能 |
| $E_p = \frac{1}{2}kx^2 = \frac{1}{2}kA^2\cos^2(\omega t + \phi)$ | 势能 | 振动势能 |

### 阻尼与受迫振动

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $x(t) = A_0 e^{-\gamma t}\cos(\omega' t + \phi)$ | 阻尼振动 | 衰减振动 |
| $\gamma = \frac{b}{2m}$ | 阻尼系数 | 衰减率 |
| $\omega' = \sqrt{\omega_0^2 - \gamma^2}$ | 阻尼振动频率 | 欠阻尼 |
| $A = \frac{F_0/m}{\sqrt{(\omega_0^2 - \omega^2)^2 + (b\omega/m)^2}}$ | 受迫振幅 | 共振 |
| $\omega_{res} = \sqrt{\omega_0^2 - 2\gamma^2}$ | 共振频率 | 共振峰 |
| $Q = \frac{\omega_0}{2\gamma}$ | 品质因数 | 共振锐度 |

### 波动

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $y(x,t) = A\sin(kx - \omega t + \phi)$ | 行波方程 | 波动描述 |
| $v = f\lambda = \frac{\omega}{k}$ | 波速公式 | 波动传播 |
| $k = \frac{2\pi}{\lambda}$ | 波数 | 空间频率 |
| $\omega = 2\pi f$ | 角频率 | 时间频率 |
| $v = \sqrt{\frac{T}{\mu}}$ | 弦波速度 | 弦上波 |
| $v = \sqrt{\frac{B}{\rho}}$ | 流体中声速 | 声波 |
| $v = \sqrt{\frac{Y}{\rho}}$ | 固体中纵波速 | 固体声波 |
| $v = \sqrt{\frac{G}{\rho}}$ | 固体中横波速 | 固体剪切波 |
| $I = \frac{1}{2}\rho v \omega^2 A^2$ | 波的强度 | 能流密度 |
| $y(x,t) = 2A\sin(kx)\cos(\omega t)$ | 驻波方程 | 驻波 |
| $L = n\frac{\lambda}{2}$ | 驻波条件 | 弦驻波 |

### 声学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $v_{sound} = 331\sqrt{1 + T/273}$ m/s | 空气中声速 | 温度修正 |
| $\beta = 10 \log_{10}\frac{I}{I_0}$ dB | 声强级 | 声音强度 |
| $I_0 = 10^{-12}$ W/m$^2$ | 参考声强 | 听阈 |
| $f' = f\frac{v \pm v_o}{v \mp v_s}$ | 多普勒效应 | 运动声源 |
| $f_{beat} = \|f_1 - f_2\|$ | 拍频 | 频率差 |
| $f_n = n\frac{v}{4L}$ (n=1,3,5,...) | 闭管谐振频率 | 管乐器 |

### 多普勒效应

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $f_{obs} = f_{source}\frac{v + v_{obs}}{v - v_{source}}$ | 一般多普勒公式 | 声波 |
| $f_{obs} = f_{source}\sqrt{\frac{c + v}{c - v}}$ | 相对论多普勒 | 光波 |
| $f_{obs} = f_{source}\frac{1}{\sqrt{1 - v^2/c^2}}$ | 横向多普勒 | 相对论效应 |

---

## 流体力学

### 流体静力学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $P = P_0 + \rho g h$ | 流体压强 | 静止流体 |
| $F_b = \rho_f V g$ | 浮力 | 阿基米德原理 |
| $P_1 + \rho g h_1 = P_2 + \rho g h_2$ | 静力学基本方程 | 连通器 |

### 流体动力学

| 公式 | 说明 | 应用场景 |
|------|------|----------|
| $A_1 v_1 = A_2 v_2$ | 连续性方程 | 不可压缩流体 |
| $P + \frac{1}{2}\rho v^2 + \rho g h = \text{常数}$ | 伯努利方程 | 理想流体 |
| $v = \sqrt{2gh}$ | 托里拆利公式 | 容器出流 |
| $Re = \frac{\rho v L}{\mu} = \frac{vL}{\nu}$ | 雷诺数 | 层流/湍流判定 |
| $F_D = \frac{1}{2}C_D \rho A v^2$ | 阻力公式 | 流体阻力 |
| $F = 6\pi\eta r v$ | 斯托克斯定律 | 小球沉降 |
| $Q = \frac{\pi R^4 \Delta P}{8\eta L}$ | 泊肃叶定律 | 管道流动 |
| $v_{terminal} = \frac{2r^2 g(\rho_s - \rho_f)}{9\eta}$ | 终端速度 | 沉降速度 |

---

## 附录：常用物理常数

| 常数 | 符号 | 数值 |
|------|------|------|
| 光速 | $c$ | $2.998 \times 10^8$ m/s |
| 普朗克常数 | $h$ | $6.626 \times 10^{-34}$ J·s |
| 约化普朗克常数 | $\hbar$ | $1.055 \times 10^{-34}$ J·s |
| 万有引力常数 | $G$ | $6.674 \times 10^{-11}$ N·m²/kg² |
| 玻尔兹曼常数 | $k_B$ | $1.381 \times 10^{-23}$ J/K |
| 阿伏伽德罗常数 | $N_A$ | $6.022 \times 10^{23}$ mol⁻¹ |
| 真空介电常数 | $\epsilon_0$ | $8.854 \times 10^{-12}$ F/m |
| 真空磁导率 | $\mu_0$ | $4\pi \times 10^{-7}$ H/m |
| 电子电荷 | $e$ | $1.602 \times 10^{-19}$ C |
| 电子质量 | $m_e$ | $9.109 \times 10^{-31}$ kg |
| 质子质量 | $m_p$ | $1.673 \times 10^{-27}$ kg |
| 玻尔半径 | $a_0$ | $5.292 \times 10^{-11}$ m |
| 里德堡常数 | $R_\infty$ | $1.097 \times 10^7$ m⁻¹ |
| 精细结构常数 | $\alpha$ | $1/137$ |
| 斯特藩-玻尔兹曼常数 | $\sigma$ | $5.670 \times 10^{-8}$ W/(m²·K⁴) |
| 维恩位移常数 | $b$ | $2.898 \times 10^{-3}$ m·K |
| 气体常数 | $R$ | $8.314$ J/(mol·K) |
| 标准大气压 | $atm$ | $1.013 \times 10^5$ Pa |
| 重力加速度 | $g$ | $9.807$ m/s² |
