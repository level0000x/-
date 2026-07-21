## 第319章：随机偏微分方程（SPDE）

随机偏微分方程将偏微分方程与随机噪声结合，用于描述时空随机场和受随机扰动影响的连续物理系统。SPDE 的数学理论在 20 世纪 80 年代迅速发展，由 Walsh、Da Prato、Zabczyk 等人奠定了 $L^2$ 框架，而 Hairer 的正则性结构理论（2014 年，获 Fields 奖）则解决了奇异 SPDE（如 KPZ 方程和 $\Phi^4_3$ 模型）的严格数学描述。SPDE 在物理、生物和金融中广泛应用：随机热方程描述随机介质中的热传导，随机 Navier-Stokes 方程描述湍流，随机波动方程描述随机介质中的波传播，KPZ 方程描述随机界面增长，而 $\Phi^4_3$ 模型是量子场论中 Higgs 机制的理论原型。SPDE 理论的核心困难在于：随机噪声通常高度不规则（如时空白噪声在 $d \geq 2$ 时不是（广义）函数），导致经典 PDE 的求解方法（如弱解、Galerkin 方法）失效，需要引入重正化和正则性结构等全新工具。

### 136.1 时空白噪声与随机积分

**定义 136.1**（时空白噪声）：$d$ 维时空白噪声 $\dot{W}(t,x)$ 是零均值 Gaussian 广义随机场，协方差为
$$\mathbb{E}[\dot{W}(t,x) \dot{W}(s,y)] = \delta(t-s) \delta(x-y)$$
其中 $\delta$ 为 Dirac delta 函数。形式地，$\dot{W}$ 是 $L^2(\mathbb{R}_+ \times \mathbb{R}^d)$ 上的 Gaussian 等正态过程：
$$\mathbb{E}\left[\int \phi(t,x) \dot{W}(t,x) dt dx \int \psi(t,x) \dot{W}(t,x) dt dx\right] = \int \phi(t,x) \psi(t,x) dt dx$$

时空白噪声的严格数学构造：定义 $W_t(\phi) = \int_0^t \int_{\mathbb{R}^d} \phi(x) \dot{W}(s,x) ds dx$ 为圆柱 Brown 运动。$W_t(\phi)$ 是 $\phi \in L^2(\mathbb{R}^d)$ 上的一维 Brown 运动（方差 $t\|\phi\|_{L^2}^2$），且 $\mathbb{E}[W_t(\phi) W_s(\psi)] = (t \wedge s) \langle \phi, \psi \rangle_{L^2}$。在 $d=1$ 时，时空白噪声与 Brown 运动的关系为 $\dot{W}(t,x) = \frac{\partial^2}{\partial t \partial x} W(t,x)$（Brown 单的混合导数），而 $W(t,x)$ 是 Brown 单（Brownian sheet）：$\mathbb{E}[W(t,x) W(s,y)] = (t \wedge s)(x \wedge y)$。

**定义 136.2**（Walsh 随机积分）：对适应随机场 $\Phi(t,x)$，Walsh 随机积分定义为
$$\int_0^t \int_{\mathbb{R}^d} \Phi(s,x) W(ds, dx)$$
这是一个 $L^2$-鞅，满足 Walsh 等距：
$$\mathbb{E}\left[\left(\int_0^t \int \Phi W(ds,dx)\right)^2\right] = \mathbb{E}\left[\int_0^t \int \Phi(s,x)^2 ds dx\right]$$

Walsh 积分的构造类似于 Itô 积分的构造：首先对简单随机场定义，然后通过 Walsh 等距延拓到 $L^2$ 空间。Walsh 积分是处理 SPDE 的基本工具，其鞅性质使得能量估计（如 Burkholder-Davis-Gundy 不等式）可以应用于 SPDE 的解。

**定理 136.1**（Burkholder-Davis-Gundy 不等式）：对 Walsh 鞅积分 $M_t = \int_0^t \int \Phi(s,x) W(ds,dx)$，对任意 $p \geq 2$：
$$\mathbb{E}\left[\sup_{0 \leq s \leq t} |M_s|^p\right] \leq C_p \mathbb{E}\left[\left(\int_0^t \int \Phi(s,x)^2 ds dx\right)^{p/2}\right]$$

**证明**：设 $M_t = \int_0^t \int \Phi(s,x) W(ds,dx)$ 为 Walsh 鞅积分。由 Walsh 等距，$M_t$ 是 $L^2$-鞅，其二次变差为 $\langle M \rangle_t = \int_0^t \int \Phi(s,x)^2 ds dx$。对 $p \geq 2$，由 Ito 公式，$|M_t|^p$ 可表示为 $|M_t|^p = \frac{p(p-1)}{2} \int_0^t |M_s|^{p-2} d\langle M \rangle_s + \text{鞅}$。取期望后利用 Doob 的 $L^p$ 极大不等式：$\mathbb{E}[\sup_{s \leq t} |M_s|^p] \leq (p/(p-1))^p \mathbb{E}[|M_t|^p]$。再结合 Burkholder 不等式（对连续鞅的版本），存在仅依赖于 $p$ 的常数 $C_p$ 使得 $\mathbb{E}[\sup_{s \leq t} |M_s|^p] \leq C_p \mathbb{E}[\langle M \rangle_t^{p/2}]$。$\blacksquare$

### 136.2 随机热方程与随机波动方程

**定义 136.3**（随机热方程）：$d$ 维空间中的随机热方程为：
$$\frac{\partial u}{\partial t} = \Delta u + \sigma(u) \dot{W}(t, x)$$
其中 $\Delta$ 为 Laplace 算子。其温和解（mild solution，即积分形式解）为：
$$u(t, x) = \int_{\mathbb{R}^d} G_t(x-y) u_0(y) dy + \int_0^t \int_{\mathbb{R}^d} G_{t-s}(x-y) \sigma(u(s,y)) W(ds, dy)$$
其中 $G_t(x) = (4\pi t)^{-d/2} \exp(-|x|^2/(4t))$ 为热核。

**定理 136.2**（随机热方程的解的存在性）：在 $d=1$ 时，若 $\sigma$ 是 Lipschitz 函数，则随机热方程在 $L^2$ 意义下存在唯一的温和解。在 $d=2$ 时，解存在但当 $\sigma$ 非常数时是分布的（非函数值）。在 $d \geq 3$ 时，热核 $G_t$ 的奇性过程导致方程需要重正化。这一维度依赖性是 SPDE 理论的典型特征——热核的积分 $\int_0^t \int G_{t-s}(x-y)^2 dy ds$ 在 $d=1$ 时收敛，在 $d=2$ 时对数发散，在 $d \geq 3$ 时幂次发散。

**证明**（$d=1$ 情形）：记 $\Gamma$ 为温和解算子。定义 Picard 迭代 $u^{(n+1)} = \Gamma(u^{(n)})$。由 Walsh 等距和 BDG 不等式，$\mathbb{E}[\|u^{(n+1)} - u^{(n)}\|_\infty^2] \leq C \int_0^t \mathbb{E}[\|u^{(n)} - u^{(n-1)}\|_\infty^2] (t-s)^{-1/2} ds$。由 Gronwall 引理（带奇异核的版本），序列在 $L^2$ 中收敛。$\blacksquare$

**定义 136.4**（随机波动方程）：随机波动方程描述随机介质中的波传播：
$$\frac{\partial^2 u}{\partial t^2} = \Delta u + \sigma(u) \dot{W}(t, x)$$
在 $d=1$ 时，其温和解公式涉及波传播子（d'Alembert 公式的随机版本）。在 $d=2$ 时，解需要分布意义上的解释。在 $d=3$ 时，类似热方程，需要重正化。

**定理 136.3**（随机波动方程的能量估计）：在 $d=1$ 时，随机波动方程的解满足能量不等式：
$$\mathbb{E}\left[\|u_t(t,\cdot)\|_{L^2}^2 + \|\nabla u(t,\cdot)\|_{L^2}^2\right] \leq \mathbb{E}\left[\|u_1(0,\cdot)\|_{L^2}^2 + \|\nabla u_0\|_{L^2}^2\right] + C \int_0^t \mathbb{E}[\|\sigma(u(s,\cdot))\|_{L^2}^2] ds$$

**证明**：设 $u$ 为随机波动方程 $\partial_t^2 u = \Delta u + \sigma(u) \dot{W}$ 的温和解。定义能量泛函 $\mathcal{E}(t) = \frac{1}{2} \mathbb{E}[\|u_t\|_{L^2}^2 + \|\nabla u\|_{L^2}^2]$。由 Ito 公式作用于 $\|u_t\|_{L^2}^2$ 和 $\|\nabla u\|_{L^2}^2$：$d\|u_t\|_{L^2}^2 = 2\langle u_t, \Delta u + \sigma(u)\dot{W}\rangle dt + \|\sigma(u)\|_{L^2}^2 dt$，$d\|\nabla u\|_{L^2}^2 = -2\langle \nabla u_t, \nabla u\rangle dt$。相加后 $\langle u_t, \Delta u\rangle$ 与 $-\langle \nabla u_t, \nabla u\rangle$ 抵消（分部积分），得 $d\mathcal{E}(t) = \frac{1}{2}\mathbb{E}[\|\sigma(u)\|_{L^2}^2] dt + \text{鞅}$。积分得 $\mathcal{E}(t) \leq \mathcal{E}(0) + \frac{1}{2}\int_0^t \mathbb{E}[\|\sigma(u(s))\|_{L^2}^2] ds$。$\blacksquare$

### 136.3 KPZ 方程与正则性结构

**定义 136.5**（KPZ 方程，Kardar-Parisi-Zhang 1986）：一维随机界面增长的 KPZ 方程为：
$$\frac{\partial h}{\partial t} = \frac{\partial^2 h}{\partial x^2} + \lambda \left(\frac{\partial h}{\partial x}\right)^2 + \dot{W}(t, x)$$
其中 $h(t,x)$ 表示界面高度。KPZ 方程是统计物理中随机界面增长的普适类模型，其非线性项 $(\partial_x h)^2$ 与白噪声 $\dot{W}$ 的组合导致解在经典意义下不定义——$h$ 是分布的（Hölder 正则性 $1/2-$），而 $(\partial_x h)^2$ 需要重正化。

**定义 136.6**（Hopf-Cole 变换）：当 $\lambda \neq 0$ 时，KPZ 方程可通过 Hopf-Cole 变换 $Z = \exp(\lambda h)$ 转化为随机热方程（乘性噪声）：
$$\frac{\partial Z}{\partial t} = \frac{\partial^2 Z}{\partial x^2} + \lambda Z \dot{W}$$
这是严格处理 KPZ 方程的关键方法——$Z > 0$ 且满足线性（乘性噪声）SPDE，其解可通过 Wiener 混沌展开构造。

**定理 136.4**（Hairer 的正则性结构，2014）：正则性结构（Regularity Structures）是处理奇异 SPDE 的一般框架，将 B 级数（Butcher 级数）和粗糙路径理论推广到 SPDE 的设定。该框架成功解决了 KPZ 方程、$\Phi^4_3$ 模型和随机量化方程的存在唯一性。

**证明（框架）**：核心思想是构建一个代数结构（正则性结构），其中包含描述方程局部行为的"模型"（$(\Pi, \Gamma)$），然后在适当正则性空间中建立不动点。$\Phi^4_3$ 模型：$\partial_t \phi = \Delta \phi - \phi^3 + \xi$（$\xi$ 为三维时空白噪声）。Hairer 的框架通过重正化（Wick 正规序）吸收发散，定义了方程的局部解，并证明了短时间内的存在唯一性。$\blacksquare$

**定理 136.5**（KPZ 普适类）：KPZ 方程描述了一大类随机界面增长模型的宏观行为（标度极限），包括：随机沉积模型、Eden 模型、定向聚合物模型、随机矩阵的最大特征值（Tracy-Widom 分布）。KPZ 方程的涨落指数为 $1/3$（空间相关长度指数 $2/3$），这一普适类的重要预测包括：一维 KPZ 方程的高度涨落服从 Tracy-Widom GOE 分布（而非 Gaussian 分布），这是随机矩阵理论在统计物理中的核心应用。KPZ 方程在 $t \to \infty$ 时，$h(t,x) \sim t^{1/3}$（高度增长）且空间相关长度 $\sim t^{2/3}$，这些标度指数是 KPZ 普适类的标志性特征。

**证明**（框架）：通过 Hopf-Cole 变换 $Z = \exp(\lambda h)$，KPZ 方程转化为随机热方程 $\partial_t Z = \partial_x^2 Z + \lambda Z \dot{W}$。利用 Feynman-Kac 公式，$Z(t,x)$ 的矩可表示为 Wiener 路径积分。在 $t \to \infty$ 极限下，利用随机热方程的长时间行为（由 KPZ 不动点——Airy 过程刻画），Tracy-Widom 分布作为 GUE 最大特征值的分布自然出现。标度指数 $1/3$ 和 $2/3$ 由 KPZ 标度关系 $h \sim t^{1/3} F(x/t^{2/3})$ 确定，其中 $F$ 为普适标度函数。这些结论由 Corwin-Quastel-Sasamoto 等人通过可积概率方法严格证明。$\blacksquare$

### 136.4 Schramm-Loewner 演化（SLE）

**定义 136.7**（SLE）：SLE（Schramm-Loewner Evolution，2000 年由 Oded Schramm 引入）是复平面上的随机共形不变曲线，由驱动函数为 $\sqrt{\kappa} B_t$（$B_t$ 为一维 Brown 运动）的 Loewner 微分方程定义：
$$\frac{d}{dt} g_t(z) = \frac{2}{g_t(z) - \sqrt{\kappa} B_t}, \quad g_0(z) = z$$
SLE$_\kappa$ 是连接上半平面 $0$ 与 $\infty$ 的随机曲线，其几何性质由参数 $\kappa > 0$ 决定。

**定理 136.6**（SLE 的相变）：SLE$_\kappa$ 的几何性质随 $\kappa$ 发生相变：
- $\kappa \in (0, 4]$：曲线是简单的（无自交），a.s. 不触及实轴
- $\kappa \in (4, 8)$：曲线有自交但不填充空间
- $\kappa \geq 8$：曲线是空间填充的（填充整个上半平面）

**证明**（框架）：SLE 由 Loewner 方程 $\partial_t g_t(z) = 2/(g_t(z) - \sqrt{\kappa} B_t)$ 定义。相变的分界点由 Bessel 过程的性质决定：设 $Z_t = g_t(z) - \sqrt{\kappa} B_t$，则 $Z_t$ 满足 $dZ_t = 2/Z_t dt - \sqrt{\kappa} dB_t$。当 $\kappa \leq 4$ 时，$Z_t$ 的 Bessel 维数 $\delta = 1 + 4/\kappa \geq 2$，故 $Z_t$ 永不触及 $0$（由 Bessel 过程的性质），曲线不自交。当 $\kappa > 4$ 时，Bessel 维数 $\delta < 2$，$Z_t$ 以正概率触及 $0$，曲线自交。当 $\kappa \geq 8$ 时，由 Beffara 的 Hausdorff 维数公式 $\min(1+\kappa/8, 2) = 2$，曲线空间填充。$\blacksquare$

**定理 136.7**（SLE 与统计物理模型的标度极限）：SLE 是许多二维统计物理模型在临界点处的标度极限：
- $\kappa = 2$：Loop-erased random walk（LERW，去圈随机游走）的标度极限
- $\kappa = 8/3$：自回避随机游走（SAW）的标度极限（Lawler-Schramm-Werner 2004 年将此猜想证明为定理，并因此获得 Fields 奖）
- $\kappa = 3$：临界 Ising 模型的界面
- $\kappa = 4$：Gaussian 自由场的等高线（调和探险者）
- $\kappa = 6$：临界渗流的界面（Smirnov 2001 年证明了三角格上临界渗流界面的共形不变性，获 Fields 奖）
- $\kappa = 8$：均匀生成树的 Peano 曲线

**定理 136.8**（SLE 的共形不变性与域 Markov 性）：SLE 是满足共形不变性和域 Markov 性（domain Markov property）的唯一随机曲线。共形不变性：SLE 在共形映射下的像仍是 SLE（同 $\kappa$）。域 Markov 性：给定曲线初始段 $K_t$，剩余部分的条件分布与 SLE 在 $\mathbb{H} \setminus K_t$ 中相同（模共形等价）。这两个性质唯一确定了 SLE 作为随机 Loewner 演化。

**定理 136.9**（SLE 的 Hausdorff 维数）：SLE$_\kappa$ 曲线的 Hausdorff 维数为 $\min(1 + \kappa/8, 2)$（Beffara 2008 年）。这一公式通过 SLE 的 Green 函数和势论估计证明，是 SLE 的几何性质与随机分析深度结合的结果。

**定理 136.10**（SLE 与随机矩阵——Cardy 公式）：SLE 在临界渗流中的应用由 Cardy 公式（预测渗流穿越概率的共形不变性，由 Smirnov 2001 年证明）和 Schramm 公式（预测 SLE 的穿越概率）联系。SLE 的穿越概率公式为：
$$\mathbb{P}(\text{SLE}_\kappa \text{ passes left of } z) = \frac{1}{2} + \frac{\Gamma(4/\kappa)}{\sqrt{\pi}\Gamma((8-\kappa)/(2\kappa))} \cdot {}_2F_1(\cdots)$$

---

## 第320章：Levy 过程、大偏差与测度值过程

Levy 过程是具有独立平稳增量的随机过程，是 Brown 运动的自然推广，允许跳跃（非连续路径）。Levy 过程的特征由 Levy-Khintchine 公式完全刻画，将过程分解为确定的漂移项、Brown 扩散项和纯跳跃项（由 Levy 测度控制）。在金融数学中，Levy 过程用于建模资产价格的跳跃（如 Merton 跳跃扩散模型、Variance Gamma 模型），在保险数学中用于建模索赔过程（Cramer-Lundberg 模型），在物理学中用于建模反常扩散和湍流。大偏差理论（Large Deviations Theory）研究罕见事件的概率衰减速率，其数学基础是 Cramer 定理（1938 年）和 Varadhan 的 Laplace 渐进方法（1966 年）。大偏差理论在统计力学（熵与自由能的关系）、信息论（信道编码定理的精细渐近）和金融数学（风险度量的精确尾估计）中有核心应用。测度值过程（如超过程、Dawson-Watanabe 超 Brown 运动）描述随机演化的种群或粒子系统，是随机偏微分方程和分枝过程理论的交叉点。

### 137.1 Levy 过程与 Levy-Khintchine 公式

**定义 137.1**（Levy 过程）：随机过程 $(X_t)_{t \geq 0}$ 是 **Levy 过程**，如果 $X_0 = 0$ a.s.，$X_t$ 具有独立平稳增量（即对 $0 \leq s < t$，$X_t - X_s$ 独立于 $\mathcal{F}_s$ 且分布仅依赖于 $t-s$），且 $X_t$ 是随机连续的（$\lim_{s \to t} \mathbb{P}(|X_t - X_s| > \varepsilon) = 0$）。Levy 过程自动具有 cadlag 版本（右连左极），且是强 Markov 过程。

**定理 137.1**（Levy-Khintchine 公式）：Levy 过程 $(X_t)$ 的特征函数为 $\mathbb{E}[e^{i u X_t}] = e^{t \psi(u)}$，其中特征指数 $\psi(u)$ 为

$$\psi(u) = i b u - \frac{1}{2} \sigma^2 u^2 + \int_{\mathbb{R}} (e^{i u x} - 1 - i u x 1_{|x| < 1}) \nu(dx)$$

三元组 $(b, \sigma^2, \nu)$ 唯一确定 $X_t$，其中 $b \in \mathbb{R}$ 为漂移系数，$\sigma^2 \geq 0$ 为 Gaussian 系数（扩散项），$\nu$ 是 $\mathbb{R} \setminus \{0\}$ 上的 Levy 测度，满足 $\int_{\mathbb{R}} (1 \wedge x^2) \nu(dx) < \infty$（控制小跳跃的总变差）。Levy 测度 $\nu(A)$ 是单位时间内跳跃大小落在 $A$ 中的期望次数。跳跃过程 $J_t = \sum_{s \leq t} \Delta X_s$ 的补偿测度为 $\nu(dx) dt$。

**证明**：对 $X_t$ 用无穷可分分布的 Levy-Khintchine 表示。由独立平稳增量，$X_t$ 是无穷可分分布。Levy 测度 $\nu$ 控制跳跃的大小和频率，截断函数 $1_{|x| < 1}$ 确保积分收敛（吸收小跳跃的一阶矩效应）。$\blacksquare$

**定理 137.2**（Levy-Ito 分解）：任何 Levy 过程可分解为三个独立部分之和：
$$X_t = b t + \sigma W_t + \int_0^t \int_{|x| \geq 1} x N(ds, dx) + \int_0^t \int_{|x| < 1} x (N(ds, dx) - \nu(dx) ds)$$

其中 $N$ 为 Poisson 随机测度（强度 $\nu(dx) dt$）。第一项为确定性漂移，第二项为 Brown 扩散，第三项为大幅跳跃之和（复合 Poisson 过程），第四项为补偿小跳跃的纯断鞅（compensated small jumps martingale）。这四项之和给出 Levy 过程的完整 Levy-Ito 分解。

**证明**：由 Levy-Khintchine 公式，Levy 过程的特征函数由 $(b, \sigma^2, \nu)$ 唯一确定。将 Levy 测度 $\nu$ 分解为 $\nu = \nu|_{|x| < 1} + \nu|_{|x| \geq 1}$。小跳部分 $\nu|_{|x| < 1}$ 满足 $\int_{|x| < 1} |x|^2 \nu(dx) < \infty$（由 Levy 测度的定义），故可构造对应的平方可积鞅——即补偿 Poisson 随机积分 $\int_0^t \int_{|x| < 1} x (N(ds, dx) - \nu(dx) ds)$。大跳部分 $\nu|_{|x| \geq 1}$ 是有限测度，故 $\int_0^t \int_{|x| \geq 1} x N(ds, dx)$ 是复合 Poisson 过程。Brown 运动部分 $W_t$ 由特征函数中 $\exp(-t \sigma^2 u^2/2)$ 项对应，漂移 $bt$ 由 $\exp(i t b u)$ 项对应。各部分的独立性由 Levy 过程的独立增量性及其特征函数的乘积形式直接得出。$\blacksquare$

**定义 137.2**（重要的 Levy 过程示例）：
- **Brown 运动**：$\nu = 0$，$\sigma^2 = 1$，$b = 0$（连续路径）
- **Poisson 过程**：$\nu = \lambda \delta_1$，$\sigma^2 = 0$，$b = 0$（单位跳跃）
- **复合 Poisson 过程**：$\nu = \lambda F$（$F$ 为跳跃分布），$\sigma^2 = 0$
- **$\alpha$-稳定过程**：$\nu(dx) = c_+ x^{-1-\alpha} 1_{x>0} dx + c_- |x|^{-1-\alpha} 1_{x<0} dx$（$\alpha \in (0, 2)$），$\sigma^2 = 0$（$\alpha = 2$ 时为 Brown 运动）
- **Gamma 过程**：$\nu(dx) = a x^{-1} e^{-bx} 1_{x>0} dx$（纯跳跃递增过程）
- **Variance Gamma 过程**：Brown 运动通过 Gamma 时间变换（$X_t = W_{G_t}$，$G_t$ 为 Gamma 过程）

**定理 137.3**（$\alpha$-稳定过程的自相似性）：若 $X_t$ 是 $\alpha$-稳定过程，则 $X_t$ 满足 $1/\alpha$-自相似性：$(X_{ct}) \stackrel{d}{=} c^{1/\alpha} X_t$。$\alpha = 2$ 时恢复 Brown 运动的 $1/2$-自相似性。$\alpha$-稳定过程的尾部分布为 $P(X_t > x) \sim C x^{-\alpha}$（$x \to \infty$），具有重尾（Pareto 尾），因此方差无限（$\alpha < 2$ 时）。

**定理 137.4**（Levy 过程的反射原理与 Wiener-Hopf 分解）：对任意 Levy 过程 $X_t$，其跑动上确界 $S_t = \sup_{0 \leq s \leq t} X_s$ 和跑动下确界 $I_t = \inf_{0 \leq s \leq t} X_s$ 满足 Wiener-Hopf 分解：对独立的指数随机变量 $T \sim \exp(q)$，$S_T$ 和 $X_T - S_T$ 独立。Wiener-Hopf 分解是研究 Levy 过程的首达时、溢出分布和波动理论的基石。

### 137.2 大偏差理论

**定义 137.3**（大偏差原则 / LDP）：一族概率测度 $\{\mu_n\}$ 满足**大偏差原则**（Large Deviation Principle），速率函数为 $I: \mathcal{X} \to [0, \infty]$（下半连续），如果对任意 Borel 集 $A$：

$$-\inf_{x \in A^\circ} I(x) \leq \liminf_{n \to \infty} \frac{1}{n} \log \mu_n(A) \leq \limsup_{n \to \infty} \frac{1}{n} \log \mu_n(A) \leq -\inf_{x \in \overline{A}} I(x)$$

速率函数 $I(x)$ 衡量了事件 $x$ 的"稀有程度"：$I(x)$ 越大，$x$ 的概率越小。LDP 的直观含义是 $\mu_n(A) \approx \exp(-n \inf_{x \in A} I(x))$，即罕见事件的概率以指数速率衰减，衰减速率由速率函数的最小值决定。

**定理 137.5**（Cramer 定理，1938）：设 $X_1, X_2, \ldots$ 是 i.i.d. 随机变量，$\overline{X}_n = \frac{1}{n} \sum_{i=1}^n X_i$。则 $\overline{X}_n$ 满足 LDP，速率函数为对数矩生成函数 $M(\theta) = \log \mathbb{E}[e^{\theta X_1}]$ 的 Legendre-Fenchel 变换：

$$I(x) = \sup_{\theta \in \mathbb{R}} (\theta x - M(\theta))$$

**证明**：上界：由 Chernoff 界，$\mathbb{P}(\overline{X}_n \geq x) = \mathbb{P}(e^{n\theta \overline{X}_n} \geq e^{n\theta x}) \leq e^{-n\theta x} \mathbb{E}[e^{\theta \sum X_i}] = \exp(-n(\theta x - M(\theta)))$。对 $\theta$ 取上确界。下界：利用指数倾斜（exponential tilting）构造新测度 $\tilde{\mathbb{P}}(A) = \mathbb{E}[e^{\theta \sum X_i - n M(\theta)} 1_A]$，在此测度下 $\overline{X}_n$ 的均值偏至 $x$。由大数定律，$\tilde{\mathbb{P}}(|\overline{X}_n - x| < \varepsilon) \to 1$，转换为原测度下的概率下界。$\blacksquare$

**定理 137.6**（Sanov 定理，1957）：设 $X_1, X_2, \ldots$ 是 i.i.d. 取值于 Polish 空间 $\mathcal{X}$ 的随机变量，经验分布 $L_n = \frac{1}{n} \sum_{i=1}^n \delta_{X_i}$。则 $L_n$ 满足 LDP，速率函数为相对熵（Kullback-Leibler 散度）：

$$I(\mu) = H(\mu \mid P) = \int \log\left(\frac{d\mu}{dP}\right) d\mu$$

其中 $P$ 为 $X_i$ 的分布。Sanov 定理是大偏差理论在统计学和信息论中最核心的应用——经验分布的罕见偏离概率由相对熵指数衰减。

**证明**：将经验分布视为有限维分布的投影，利用 Cramer 定理在有限维 Simplex 上的极限和投影极限定理。或利用组合方法：$\mathbb{P}(L_n \approx \mu) \approx \frac{n!}{\prod_i (n\mu_i)!} \prod_i P_i^{n\mu_i} \approx \exp(-n H(\mu \mid P))$（Stirling 近似）。$\blacksquare$

**定理 137.7**（Varadhan 积分引理）：若 $\{\mu_n\}$ 满足 LDP，速率函数 $I$，且 $F$ 是连续有界函数，则

$$\lim_{n \to \infty} \frac{1}{n} \log \int e^{n F(x)} \mu_n(dx) = \sup_{x} (F(x) - I(x))$$

**证明**：上界：分割积分域为 $\varepsilon$-网，$\int e^{nF} d\mu_n \leq \sum_i \sup_{B_i} e^{nF} \mu_n(B_i) \approx \sum_i \exp(n(\sup_{B_i} F - \inf_{B_i} I))$。下界：对固定 $x$，$\int e^{nF} d\mu_n \geq e^{nF(x)} \mu_n(B_\varepsilon(x)) \approx \exp(n(F(x) - I(x)))$。取 $\varepsilon \to 0$ 和 $x$ 的上确界。$\blacksquare$

Varadhan 引理是大偏差理论的 Laplace 方法，它将大偏差原理与统计力学中的 Gibbs 变分原理统一起来：$\sup_x (F(x) - I(x))$ 对应于自由能（压力函数）的 Legendre 变换。

**定理 137.8**（Schilder 定理——Brown 运动的大偏差）：Brown 运动 $W_t$ 的缩放 $(\varepsilon W_t)_{t \in [0,T]}$ 在 $C[0,T]$ 上满足 LDP（$\varepsilon \to 0$），速率函数为

$$I(\phi) = \frac{1}{2} \int_0^T \dot{\phi}(t)^2 dt$$

若 $\phi \in H^1$（$\phi(0)=0$，绝对连续且导数平方可积）；否则 $I(\phi) = \infty$。Schilder 定理是 Freidlin-Wentzell 理论的基础，用于研究小噪声 SDE 的大偏差行为。

**定理 137.9**（Freidlin-Wentzell 大偏差）：对 SDE $dX_t^\varepsilon = b(X_t^\varepsilon) dt + \varepsilon \sigma(X_t^\varepsilon) dW_t$，$X^\varepsilon$ 在 $C[0,T]$ 上满足 LDP，速率函数为

$$I(\phi) = \frac{1}{2} \int_0^T \|\dot{\phi}(t) - b(\phi(t))\|_{\sigma}^2 dt$$

其中 $\|v\|_\sigma^2 = v^T (\sigma\sigma^T)^{-1} v$。这一理论在随机动力系统（如噪声诱导的跃迁、亚稳态逃逸问题）中有核心应用。

### 137.3 测度值过程

**定义 137.4**（超过程 / Superprocess）：超过程是取值为测度的 Markov 过程，描述随机演化的连续型分枝过程。Dawson-Watanabe 超 Brown 运动是 $\mathbb{R}^d$ 上的测度值过程，其 Laplace 泛函满足：
$$\mathbb{E}\left[\exp\left(-\int_{\mathbb{R}^d} \phi(x) X_t(dx)\right)\right] = \exp\left(-\int_{\mathbb{R}^d} v(t,x) \mu_0(dx)\right)$$
其中 $v$ 满足反应扩散方程 $\frac{\partial v}{\partial t} = \Delta v - v^2$（$v(0,x) = \phi(x)$）。

**定理 137.10**（超 Brown 运动的支撑性质）：$d=1$ 时，超 Brown 运动的支撑是绝对连续的（有密度）。$d \geq 2$ 时，超 Brown 运动的支撑是奇异测度（Hausdorff 维数 $4-d$ 的随机分形），具有间歇性（intermittency）——在空间上聚集成团。这一维度依赖性是分枝扩散过程在连续极限下的典型行为。

**定义 137.5**（Fleming-Viot 过程）：Fleming-Viot 过程是描述基因频率随机演化的测度值过程，其生成元为
$$\mathcal{L} F(\mu) = \frac{1}{2} \int \int \mu(dx) (\delta_x(dy) - \mu(dy)) \frac{\delta^2 F}{\delta \mu(x) \delta \mu(y)} + \int \mathcal{L}_0 \frac{\delta F}{\delta \mu(x)} \mu(dx)$$
其中 $\mathcal{L}_0$ 是单个基因的扩散生成元。Fleming-Viot 过程是群体遗传学中 Wright-Fisher 扩散模型的连续极限。

**定理 137.11**（Dirichlet 形式与超过程）：超过程的构造可通过 Dirichlet 形式理论严格完成。超 Brown 运动的 Dirichlet 形式为 $\mathcal{E}(F, F) = \frac{1}{2} \int \|\nabla \frac{\delta F}{\delta \mu}\|_{L^2(\mu)}^2 \mathbb{P}(d\mu)$，其中 $\mathbb{P}$ 是超过程的平稳测度（若存在）。Dirichlet 形式方法将超过程的分析与势论和谱理论联系起来。

**定义 137.6**（测度值分枝过程与 SPDE 的联系）：超过程是 SPDE 的"弱解"——超 Brown 运动的密度 $u(t,x)$（若存在）形式地满足 SPDE $\partial_t u = \Delta u + \sqrt{u} \dot{W}$。这一联系使得超过程成为研究非线性 SPDE 的概率工具，也是 Dawson-Gartner 投影定理中相互作用的 Fleming-Viot 系统与 McKean-Vlasov 方程之间的桥梁。

**定理 137.12**（大偏差与 Gibbs 条件）：对于测度值过程的经验测度 $L_T = \frac{1}{T} \int_0^T \delta_{X_t} dt$，大偏差原理的速率函数 $I(\mu)$ 通常由 Dirichlet 形式或相对熵给出。这一结果将统计力学中的 Gibbs 条件（平衡态等价于自由能最小化）与随机过程的大偏差理论统一起来，是 Donsker-Varadhan 大偏差理论的核心。

---