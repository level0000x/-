# 卷二十一：动力系统与特殊函数

## 第214章：特殊函数深化
**98.1 超几何函数的统一理论**

**定义**（广义超几何函数）：$_pF_q\left(\begin{smallmatrix} a_1,\ldots,a_p \\ b_1,\ldots,b_q \end{smallmatrix}; z\right) = \sum_{n=0}^{\infty} \frac{(a_1)_n \cdots (a_p)_n}{(b_1)_n \cdots (b_q)_n} \frac{z^n}{n!}$，收敛于 $|z| < 1$（若 $p=q+1$ 时收敛于单位圆盘）。当 $p = q+1$ 时满足相应的超几何微分方程（阶数为 $\max(p, q+1)$）。

**命题**（经典特例）：
- $_2F_1(1,1;2;z) = -\frac{\log(1-z)}{z}$（对数）
- $_2F_1(\frac{1}{2},\frac{1}{2};\frac{3}{2};z^2) = \frac{\arcsin(z)}{z}$
- $_1F_1(a;c;z)$（合流超几何 / Kummer 函数）是 Whittaker 方程的解，包含 Bessel 函数 $J_\nu(z)$、Laguerre 多项式 $L_n^{(\alpha)}(z)$ 为特例
- $_0F_1(; \nu+1; -\frac{z^2}{4}) = \Gamma(\nu+1)(\frac{2}{z})^{\nu} J_\nu(z)$

**98.2 椭圆函数**

**定义**（Jacobi 椭圆函数）：给定模 $k \in (0,1)$，定义椭圆正弦 $\operatorname{sn}(u, k) = \sin \operatorname{am}(u, k)$（$\operatorname{am}$ 是 Jacobi 振幅）。等价地，$u = \int_0^{\operatorname{sn}(u,k)} \frac{dt}{\sqrt{(1-t^2)(1-k^2 t^2)}}$（椭圆积分的逆）。定义 $\operatorname{cn}(u,k) = \sqrt{1 - \operatorname{sn}^2(u,k)}$，$\operatorname{dn}(u,k) = \sqrt{1 - k^2 \operatorname{sn}^2(u,k)}$。

**定理**（加法定理与二重周期性）：椭圆函数是 $\mathbb{C}$ 上双周期亚纯函数（即存在两个 $\mathbb{R}$-线性无关的周期 $\omega_1, \omega_2$ 使得 $f(z+\omega_i) = f(z)$）。Jacobi 椭圆函数的实周期 $4K(k)$（$\operatorname{sn},\operatorname{cn}$）和 $2K(k)$（$\operatorname{dn}$），其中 $K(k) = \int_0^{\pi/2} \frac{d\theta}{\sqrt{1 - k^2 \sin^2 \theta}}$ 是第一类完全椭圆积分。

椭圆函数在可积系统（KdV 方程的 $\operatorname{cn}$-波解）、代数几何（椭圆曲线参数化）和数论（模函数与模形式）中有深刻应用。

---

---

---

---

---

---

## 第215章（补充）
> 本部分以种群模型和传染病模型为具体载体，研究非线性 ODE 系统的定性理论（平衡点、周期轨道、分岔、稳定性），以及反应-扩散系统的斑图形成与行波理论。内容本质上是 ODE 定性理论和 PDE 应用的特例研究。

---

---

---

---

## 第216章：非线性常微分方程系统的定性分析
本章以种群模型为具体载体，研究非线性自治 ODE 系统的平衡点、周期轨道、分岔和稳定性理论。

### 237.1 一维自治方程

**定义 237.1**（一阶线性方程）：$\dot{N} = rN$，$r \in \mathbb{R}$。通解 $N(t) = N_0 e^{rt}$。$r > 0$ 时 $N = 0$ 为不稳定平衡点，$r < 0$ 时 $N = 0$ 为全局渐近稳定平衡点。

**定义 237.2**（Logistic 方程）：一阶非线性自治方程

$$\dot{N} = rN\left(1 - \frac{N}{K}\right), \quad r, K > 0$$

平衡点：$N = 0$（不稳定）和 $N = K$（全局渐近稳定）。显式解为

$$N(t) = \frac{K N_0 e^{rt}}{K + N_0(e^{rt} - 1)}$$

该方程是 Riccati 型的可积 ODE，其右端为二次多项式向量场。

**定义 237.3**（具双稳的三次向量场）：方程

$$\dot{N} = rN(N - A)\left(1 - \frac{N}{K}\right), \quad 0 < A < K, \; r > 0$$

平衡点：$N = 0$（渐近稳定），$N = A$（不稳定，鞍点型阈值），$N = K$（渐近稳定）。这是一维梯度系统 $\dot{N} = -\nabla V(N)$，其中势函数 $V(N)$ 为四次多项式，具有双稳态势阱结构。

**定义 237.4**（一维离散动力系统的分岔）：Ricker 映射 $N_{t+1} = N_t e^{r(1 - N_t/K)}$。不动点 $N = K$ 在 $0 < r < 2$ 时稳定；$r = 2$ 处发生倍周期分岔；$r > 2$ 后经倍周期级联通向混沌。这是典型的一维单峰映射。

### 237.2 二维 ODE 系统的定性分析

**定义 237.5**（Lotka-Volterra 系统）：二维非线性自治 ODE 系统

$$\begin{cases} \dot{x} = \alpha x - \beta xy \\ \dot{y} = \gamma xy - \delta y \end{cases}, \quad \alpha, \beta, \gamma, \delta > 0$$

**定理 237.1**（Lotka-Volterra 系统的定性结构）：唯一正平衡点 $(\delta/\gamma, \alpha/\beta)$ 是非双曲中心。系统保守，存在首次积分

$$H(x, y) = \gamma x - \delta \ln x + \beta y - \alpha \ln y$$

所有正初始条件的轨线为绕平衡点的周期轨道。周期由椭圆型积分表出。由于平衡点非双曲，系统不具有结构稳定性。

*证明概要*：直接验证 $\frac{d}{dt}H(x(t), y(t)) = 0$。$H$ 在平衡点取严格极小值，其等值线在平衡点附近为闭 Jordan 曲线。∎

**定义 237.6**（$n$ 维竞争系统）：

$$\dot{N}_i = r_i N_i\left(1 - \sum_{j=1}^n \alpha_{ij} \frac{N_j}{K_i}\right), \quad i = 1, \ldots, n$$

其中 $\alpha_{ij} > 0$ 为竞争系数矩阵，$r_i, K_i > 0$。这是一类 Kolmogorov 型系统 $\dot{N}_i = N_i f_i(N_1, \ldots, N_n)$。

**定理 237.2**（二维竞争系统的全局动力学）：对 $n = 2$，系统在 $\mathbb{R}_+^2$ 上有四种可能的全局相图，由参数 $\alpha_{12}$ 与 $K_1/K_2$ 及 $\alpha_{21}$ 与 $K_2/K_1$ 的大小关系分类：(i) 物种1排斥物种2；(ii) 物种2排斥物种1；(iii) 双稳态共存；(iv) 稳定共存。分类依据是 Jacobian 矩阵在各平衡点处的特征值符号。

### 237.3 年龄结构的 PDE 模型

**定义 237.7**（McKendrick-von Foerster 方程）：一阶线性 PDE

$$\frac{\partial n}{\partial t} + \frac{\partial n}{\partial a} = -\mu(a) n(t, a), \quad t > 0, \; a > 0$$

边界条件 $n(t, 0) = \int_0^\infty \beta(a) n(t, a) da$。其中 $\mu(a)$ 和 $\beta(a)$ 为给定的非负函数。这是带非局部边界条件的输运方程。

**定理 237.3**（Euler-Lotka 特征方程）：求分离变量解 $n(t, a) = e^{rt} \psi(a)$ 导致特征方程

$$\int_0^\infty e^{-ra} \beta(a) \ell(a) da = 1, \quad \ell(a) = \exp\left(-\int_0^a \mu(s) ds\right)$$

该方程关于 $r$ 恰有一个实根 $r^*$，决定了解的渐近增长率。

---

---

---

---

---

## 第217章：传染病模型的数学结构
本章研究一类仓室型 ODE 系统的定性性质（阈值现象、终态分析），并将其推广到 PDE 和网络上的动力系统。

### 238.1 SIR 型 ODE 系统

**定义 238.1**（SIR 系统）：三维非线性 ODE 系统

$$\begin{cases} \dot{S} = -\beta S I \\ \dot{I} = \beta S I - \gamma I \\ \dot{R} = \gamma I \end{cases}, \quad \beta, \gamma > 0$$

总人口 $N = S + I + R$ 守恒（$\dot{N} = 0$）。系统可约化为二维系统（$(S, I)$-平面）。

**定义 238.2**（基本再生数）：无量纲参数 $\mathcal{R}_0 = \beta S(0) / \gamma$。这是系统在无病平衡点 $(S(0), 0)$ 处的阈值参数。

**定理 238.1**（阈值定理）：(i) 若 $\mathcal{R}_0 \leq 1$，则 $I(t)$ 单调递减趋于 $0$；(ii) 若 $\mathcal{R}_0 > 1$，则 $I(t)$ 先增后减（单峰），终态满足

$$S(\infty) = S(0) e^{-\mathcal{R}_0(1 - S(\infty)/S(0))}, \quad I(\infty) = 0$$

$S(\infty)$ 是该超越方程在 $(0, S(0))$ 中的唯一解。

*证明概要*：由 $dI/dS = -1 + \gamma/(\beta S)$ 积分得首次积分 $I + S - (\gamma/\beta)\ln S = \text{const}$。令 $t \to \infty$ 且 $I(\infty) = 0$ 即得终态方程。∎

**定义 238.3**（SIR 型系统的变体）：
- **SEIR 系统**：增加状态变量 $E$（满足 $\dot{E} = \beta SI - \sigma E$，$\sigma > 0$），维数增至四维。
- **SIRS 系统**：增加恢复项 $\dot{S} = -\beta SI + \omega R$（$\omega > 0$），系统存在地方病平衡点。
- **SIS 系统**：$\dot{S} = -\beta SI + \gamma I$，$\dot{I} = \beta SI - \gamma I$，可约化为一维系统，$\mathcal{R}_0$ 决定全局动力学。

### 238.2 网络上的动力系统

**定义 238.4**（图上的 SIR 系统）：设图 $G = (V, E)$，节点 $i$ 的状态 $(S_i, I_i, R_i)$ 满足

$$\dot{I}_i = \beta S_i \sum_{j \sim i} I_j - \gamma I_i, \quad \dot{S}_i = -\beta S_i \sum_{j \sim i} I_j, \quad \dot{R}_i = \gamma I_i$$

这是 $3|V|$ 维 ODE 系统，耦合结构由图的邻接关系决定。

**定理 238.2**（无标度网络上的阈值消失）：若度分布 $P(k) \sim k^{-\gamma}$（$2 < \gamma \leq 3$），则当网络规模 $N \to \infty$ 时传播阈值趋于零——对任意正传播率 $\beta > 0$，系统均存在非零的地方病平衡点。

### 238.3 反应-扩散 SIR 系统

**定义 238.5**（空间 SIR 的 PDE 模型）：

$$\begin{cases} \frac{\partial S}{\partial t} = d_S \nabla^2 S - \beta S I \\ \frac{\partial I}{\partial t} = d_I \nabla^2 I + \beta S I - \gamma I \end{cases}$$

**定理 238.3**（行波解的波速）：当 $d_S = 0$（简化情形），$I$ 的方程退化为 Fisher-KPP 型方程，存在行波解且最小波速为

$$c^* = 2\sqrt{d_I(\beta S_0 - \gamma)}$$

当 $\beta S_0 \leq \gamma$ 时不存在正的行波解。

*证明概要*（Fisher-KPP 方程 $\partial_t u = D \partial_{xx}u + ru(1-u/K)$）：代入行波变量 $\xi = x - ct$，得 $D u'' + cu' + ru(1-u/K) = 0$。化为一阶系统 $u' = v$，$Dv' = -cv - ru(1-u/K)$。平衡点 $(0, 0)$ 为不稳定结点，$(K, 0)$ 为鞍点。行波解对应于连接两者的异宿轨，波速条件 $c \geq 2\sqrt{Dr}$。∎

---

---

---

---

---

## 第218章：反应-扩散系统的斑图形成与行波
### 239.1 Turing 不稳定性

**定义 239.1**（二组分反应-扩散系统）：

$$\begin{cases} \frac{\partial u}{\partial t} = D_u \nabla^2 u + f(u, v) \\ \frac{\partial v}{\partial t} = D_v \nabla^2 v + g(u, v) \end{cases}$$

其中 $f, g: \mathbb{R}^2 \to \mathbb{R}$ 为光滑函数，$D_u, D_v > 0$。

**定义 239.2**（Turing 不稳定性）：设 $(u^*, v^*)$ 为反应系统 $\dot{u} = f(u, v), \dot{v} = g(u, v)$ 的渐近稳定平衡点。若存在波数 $k > 0$ 使得在 $(u^*, v^*)$ 处线性化的全系统（含扩散项）的某个特征值实部为正，则称系统在 $(u^*, v^*)$ 处发生 Turing 不稳定性。充要条件是

$$\begin{cases} \operatorname{Tr}(J) = f_u + g_v < 0 \\ \det(J) = f_u g_v - f_v g_u > 0 \\ D_v f_u + D_u g_v > 2\sqrt{D_u D_v \det(J)} \end{cases}$$

**定理 239.1**（Turing 不稳定性的代数条件）：Turing 不稳定性要求 $D_v \gg D_u$（扩散系数显著分离），且 Jacobian 矩阵满足 $f_u g_v < 0$（一个自激活、一个自抑制）和 $f_v g_u < 0$（交叉抑制型耦合）。

**定义 239.3**（Gierer-Meinhardt 系统——Turing 不稳定性的标准例子）：

$$\begin{cases} \frac{\partial a}{\partial t} = D_a \nabla^2 a + \rho_a \frac{a^2}{h} - \mu_a a \\ \frac{\partial h}{\partial t} = D_h \nabla^2 h + \rho_h a^2 - \mu_h h \end{cases}$$

当 $D_h \gg D_a$ 时该系统满足 Turing 不稳定性条件，产生空间周期斑图。

### 239.2 Keller-Segel 趋化性方程

**定义 239.4**（Keller-Segel 系统）：抛物-椭圆型耦合 PDE

$$\begin{cases} \frac{\partial u}{\partial t} = D_u \nabla^2 u - \chi \nabla \cdot (u \nabla v) \\ \frac{\partial v}{\partial t} = D_v \nabla^2 v + \alpha u - \beta v \end{cases}, \quad \chi > 0$$

第二式为带线性源汇的扩散方程。第一式中的 $-\chi \nabla \cdot (u \nabla v)$ 是带有浓度依赖系数的漂移-扩散项。

**定理 239.2**（二维空间的临界质量与爆破）：在 $\mathbb{R}^2$ 上考虑 Keller-Segel 系统，存在临界质量 $M_c = 8\pi D_u / \chi$。若初始质量 $M_0 = \int u_0 dx < M_c$，解全局存在；若 $M_0 > M_c$，解在有限时间内爆破（$\|u\|_{L^\infty} \to \infty$）。临界情形 $M_0 = M_c$ 下解存在但可能爆破。

### 239.3 兴奋介质的行波——奇异摄动方法

**定义 239.5**（FitzHugh-Nagumo 方程）：二维反应-扩散系统

$$\begin{cases} \frac{\partial u}{\partial t} = D \nabla^2 u + u(1-u)(u-a) - v, \quad 0 < a < 1 \\ \frac{\partial v}{\partial t} = \varepsilon(bu - v), \quad \varepsilon \ll 1, \; b > 0 \end{cases}$$

**定理 239.3**（行波的存在性——奇异摄动分析）：当 $\varepsilon \to 0$ 时，系统的行波解可由快-慢分解构造：快子系统（兴奋前沿）由反应-扩散波前给出，慢子系统（恢复期）由一维 ODE 的慢流形描述。行波的存在性通过对快、慢子系统的匹配渐近展开得出。

---

---

---

---

---

## 第219章：生化网络的数学建模——随机过程与奇异摄动
### 240.1 Michaelis-Menten 动力学的奇异摄动分析

**定义 240.1**（酶促反应网络）：三物质反应系统

$$E + S \underset{k_{-1}}{\overset{k_1}{\rightleftharpoons}} ES \overset{k_{\text{cat}}}{\longrightarrow} E + P$$

对应的 ODE 系统包括四个浓度变量，但受两个守恒律约束，实际自由度为二。

**定理 240.1**（准稳态约化 / QSSA）：在条件 $[S] \gg [E]_T$ 下，中间产物 $[ES]$ 的动力学比 $[S]$ 快得多，应用奇异摄动理论可约化为一维系统

$$\frac{d[S]}{dt} = -\frac{V_{\max}[S]}{K_m + [S]}, \quad V_{\max} = k_{\text{cat}}[E]_T, \quad K_m = \frac{k_{-1} + k_{\text{cat}}}{k_1}$$

*证明概要*：对 $[ES]$ 应用准稳态假设 $d[ES]/dt \approx 0$，结合酶守恒 $[E]_T = [E] + [ES]$，解得代数关系 $[ES] = [E]_T[S]/(K_m + [S])$。由此消去 $[ES]$ 即得约化方程。QSSA 的严格有效性需用 Tikhonov 定理（奇异摄动理论）论证。∎

### 240.2 基因调控网络的 ODE 模型与分岔

**定义 240.2**（Goodwin 振荡器）：二维 ODE 系统

$$\begin{cases} \dot{m} = \frac{\alpha}{1 + p^n / K^n} - \gamma_m m \\ \dot{p} = \beta m - \gamma_p p \end{cases}, \quad n \in \mathbb{N}, \; \alpha, \beta, \gamma_m, \gamma_p, K > 0$$

右端第一项为 Hill 型递减函数（负反馈），$n$ 为 Hill 系数。

**定理 240.2**（Hopf 分岔产生振荡）：当 Hill 系数 $n$ 充分大时（在标准化参数下典型阈值为 $n > 8$），系统通过 Hopf 分岔产生稳定的极限环——即持续周期振荡。分岔条件由 Jacobian 矩阵纯虚数特征值条件 $\operatorname{Tr}(J) = 0$ 给出。

### 240.3 离散动力系统与布尔网络

**定义 240.3**（$N$-$K$ 布尔网络）：$N$ 个二值变量 $\{x_i \in \{0, 1\}\}_{i=1}^N$，每个 $x_i$ 的更新由 $K$ 个随机选取的输入节点经随机布尔函数确定。状态空间大小为 $2^N$，动力学由有向状态转移图描述。

**定理 240.3**（Kauffman 的有序-混沌相变）：当 $K = 1$ 时系统处于冻结有序相（吸引子长度和数量均较小）；$K \geq 3$ 时系统处于混沌相（吸引子长度随 $N$ 指数增长）；$K = 2$ 为临界值（"混沌边缘"），此时吸引子数量约为 $\sqrt{N}$。相变由 Lyapunov 指数或 Hamming 距离的传播刻画。

### 240.4 化学主方程与 Markov 过程

**定义 240.4**（化学主方程 / Chemical Master Equation）：设系统含 $d$ 种分子，状态空间 $\mathbb{Z}_{\geq 0}^d$，$R$ 个反应通道。反应 $j$ 的倾向函数为 $a_j(\mathbf{x})$，化学计量变化向量为 $\nu_j \in \mathbb{Z}^d$。概率分布 $P(\mathbf{x}, t)$ 满足无穷维线性 ODE

$$\frac{dP(\mathbf{x}, t)}{dt} = \sum_{j=1}^R \left[a_j(\mathbf{x} - \nu_j) P(\mathbf{x} - \nu_j, t) - a_j(\mathbf{x}) P(\mathbf{x}, t)\right]$$

这是连续时间 Markov 链的 Kolmogorov 前向方程。

**定理 240.4**（Gillespie 算法的数学基础）：化学主方程对应的 Markov 链可通过以下方式精确模拟——从当前状态 $\mathbf{x}$ 出发，(i) 等待时间 $\tau$ 服从指数分布 $\operatorname{Exp}(a_0(\mathbf{x}))$，其中 $a_0 = \sum_j a_j$；(ii) 反应 $j$ 被选中的概率为 $a_j/a_0$。该算法是 Doob-Gillespie 型随机模拟算法，精确生成 Markov 链的样本路径。

---

*本卷在常微分方程定性理论、反应-扩散方程和随机过程的基础上，系统建立了非线性 ODE 系统定性分析（Logistic 方程、Lotka-Volterra 系统、竞争模型）、仓室型 ODE 系统的阈值动力学（SIR 模型及其变体）、反应-扩散系统的斑图形成与行波（Turing 不稳定性、Keller-Segel 爆破、FitzHugh-Nagumo 奇异摄动）以及生化网络的数学建模（奇异摄动 QSSA、Hopf 分岔、布尔网络、化学主方程）的理论。共 4 章。*


---

---

---

---

---

## 第220章（补充）
> 动力系统研究随时间演化的系统的长期行为，起源于 Newton 力学和 Poincaré 对天体力学的研究。本卷在常微分方程（V18）的基础上，建立离散和连续动力系统的基本理论，包括稳定性、混沌、遍历论和分支理论。动力系统为理解自然界中的复杂动力学现象提供了统一的数学框架。

> **前置知识**：本子卷依赖本卷第201-210章（常微分方程和偏微分方程基础）和第90-94章（拓扑学）的核心内容。

---

---

---

---

---

## 第221章：离散动力系统
离散动力系统由映射的迭代生成，是最简单的动力系统，但可以展现极其丰富的动力学行为。

### 137.1 迭代与轨道

**定义 137.1**（离散动力系统）：一个**离散动力系统**由状态空间 $X$（通常为 $\mathbb{R}^n$ 的子集或流形）和映射 $f: X \to X$ 组成。从初始状态 $x_0 \in X$ 出发，系统在时刻 $n$ 的状态为

$$x_n = f^n(x_0) = \underbrace{f \circ f \circ \cdots \circ f}_{n \text{ 次}}(x_0)$$

序列 $\{x_n\}_{n=0}^{\infty}$ 称为 $x_0$ 的**轨道**（orbit）或**正向轨道**。

**定义 137.2**（不动点与周期点）：
- $x$ 是**不动点**，如果 $f(x) = x$
- $x$ 是**周期点**（周期为 $p$），如果 $f^p(x) = x$ 且 $f^k(x) \neq x$（$0 < k < p$）
- 周期 $p$ 的轨道 $\{x, f(x), \ldots, f^{p-1}(x)\}$ 称为**周期轨道**或**$p$-周期轨道**

**定义 137.3**（稳定性的分类）：设 $x^*$ 是不动点：
- $x^*$ 是 **Lyapunov 稳定**的，如果对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得 $|x_0 - x^*| < \delta \implies |f^n(x_0) - x^*| < \varepsilon$ 对所有 $n \geq 0$
- $x^*$ 是**渐近稳定**的，如果它是 Lyapunov 稳定的，且存在 $\eta > 0$ 使得 $|x_0 - x^*| < \eta \implies \lim_{n \to \infty} f^n(x_0) = x^*$
- $x^*$ 是**不稳定**的，如果它不是 Lyapunov 稳定的

**定理 137.1**（一维不动点的线性稳定性）：设 $f: \mathbb{R} \to \mathbb{R}$ 是 $C^1$ 映射，$x^*$ 是不动点。
- 若 $|f'(x^*)| < 1$，则 $x^*$ 是渐近稳定的（**吸引不动点**）
- 若 $|f'(x^*)| > 1$，则 $x^*$ 是不稳定的（**排斥不动点**）
- 若 $|f'(x^*)| = 1$，线性稳定性分析不足，需考虑高阶项

*证明*：由中值定理，$|x_{n+1} - x^*| = |f(x_n) - f(x^*)| = |f'(\xi_n)| |x_n - x^*|$。当 $|f'(x^*)| < 1$ 时，在 $x^*$ 附近 $|f'| < \lambda < 1$，故 $|x_n - x^*| \leq \lambda^n |x_0 - x^*| \to 0$。∎

**定理 137.2**（高维不动点的线性稳定性）：设 $f: \mathbb{R}^n \to \mathbb{R}^n$ 是 $C^1$ 映射，$x^*$ 是不动点，$Df(x^*)$ 是 Jacobi 矩阵。
- 若 $Df(x^*)$ 的所有特征值的模 $< 1$，则 $x^*$ 是渐近稳定的（**汇**，sink）
- 若存在特征值模 $> 1$，则 $x^*$ 是不稳定的（**源**，source 或**鞍点**，saddle）
- 若所有特征值模 $\leq 1$ 且至少一个等于 1，线性分析不足

### 137.2 一维映射的动力学

**例 137.1**（Logistic 映射）：$f(x) = rx(1-x)$，$x \in [0, 1]$，$r \in [0, 4]$。这是最经典的一维非线性离散动力系统。

- $0 < r \leq 1$：仅有不动点 $x = 0$（稳定），种群灭绝
- $1 < r < 3$：不动点 $x^* = 1 - 1/r$ 稳定，$x = 0$ 不稳定
- $3 \leq r < 1 + \sqrt{6} \approx 3.449$：2-周期轨道稳定（倍周期分岔）
- $r$ 继续增大：出现 4, 8, 16, ... 周期轨道（倍周期分岔级联）
- $r \approx 3.5699$（Feigenbaum 点）：进入混沌区域
- $r = 4$：完全混沌，在 $[0, 1]$ 上有稠密轨道

**定理 137.3**（Li-Yorke 定理，1975）：「周期 3 蕴含混沌」。若连续映射 $f: I \to I$（$I$ 为区间）有 3-周期轨道，则 $f$ 有任意周期的周期轨道，且存在不可数集合 $S \subseteq I$（混沌集）满足 Li-Yorke 混沌条件。

*证明概要*：设 3-周期轨道为 $a<b<c$，由介值定理可证 $f([a,b])\supseteq[b,c]$ 和 $f([b,c])\supseteq[a,c]$。利用区间映射的 Markov 划分，构造符号动力学的子移位，对任意正整数 $n$，可从符号序列中提取 $n$-周期点。混沌集 $S$ 的构造基于：不含特定重复模式的轨道集合是不可数的，且其中任意两点满足混沌条件。∎

**定理 137.4**（Sharkovskii 定理，1964）：将正整数按以下 **Sharkovskii 序**排列：

$$3 \triangleright 5 \triangleright 7 \triangleright \cdots \triangleright 2\cdot 3 \triangleright 2\cdot 5 \triangleright \cdots \triangleright 2^2\cdot 3 \triangleright 2^2\cdot 5 \triangleright \cdots \triangleright 2^3 \triangleright 2^2 \triangleright 2 \triangleright 1$$

即：先排所有大于1的奇数（$3,5,7,\dots$），再排所有 $2 \times$ 奇数（$6,10,14,\dots$），再排 $2^2 \times$ 奇数，以此类推，最后将2的所有幂降序排列（$\dots, 8, 4, 2, 1$）。此序是 $\mathbb{N}$ 上的全序。定理断言：若连续映射 $f: \mathbb{R} \to \mathbb{R}$ 有 $m$-周期轨道，且 $m \triangleright n$（$m$ 在 $n$ 之前），则 $f$ 必有 $n$-周期轨道。特别地，"周期3蕴含所有周期"——若存在3-周期轨道（3排在最前），则 $f$ 有任意周期的周期轨道。这是 Li-Yorke 定理（1975）的前身。∎

### 137.3 符号动力学与混沌

**定义 137.4**（符号空间）：令 $\Sigma_2 = \{0, 1\}^{\mathbb{N}}$ 为由两个符号构成的所有无穷序列的空间。度量定义为 $d(\mathbf{s}, \mathbf{t}) = \sum_{n=0}^{\infty} \frac{|s_n - t_n|}{2^n}$。**移位映射** $\sigma: \Sigma_2 \to \Sigma_2$ 定义为 $\sigma(s_0 s_1 s_2 \cdots) = (s_1 s_2 s_3 \cdots)$。

**命题 137.5**（移位映射的混沌性质）：
1. $\sigma$ 在 $\Sigma_2$ 上有稠密轨道
2. $\sigma$ 的周期点在 $\Sigma_2$ 中稠密
3. $\sigma$ 对初始条件敏感依赖（Devany 混沌的三个条件）

**定理 137.6**（Logistic 映射与符号动力学的联系）：$r = 4$ 时，Logistic 映射 $f(x) = 4x(1-x)$ 拓扑共轭于移位映射。具体地，半共轭由 $h(\theta) = \sin^2(\pi\theta)$ 给出（通过帐篷映射）。

### 137.4 拓扑共轭与结构稳定性

**定义 137.5**（拓扑共轭）：两个映射 $f: X \to X$ 和 $g: Y \to Y$ 是**拓扑共轭**的，如果存在同胚 $h: X \to Y$ 使得 $h \circ f = g \circ h$。拓扑共轭的映射具有相同的动力学性质（周期轨道结构、稠密性、混沌性等）。

**定义 137.6**（结构稳定性）：映射 $f$ 是**结构稳定**的，如果存在 $f$ 的邻域（在 $C^r$ 拓扑中），使得此邻域内所有映射拓扑共轭于 $f$。

---

---

---

---

---

## 第222章：连续动力系统
连续动力系统由微分方程定义，其解形成流（flow），是经典力学和许多物理系统的数学模型。

### 138.1 流与向量场

**定义 138.1**（流）：设 $M$ 是光滑流形。向量场 $X$ 生成一个**流** $\phi_t: M \to M$（$t \in \mathbb{R}$），满足 $\frac{d}{dt}\phi_t(x) = X(\phi_t(x))$，$\phi_0(x) = x$。流满足群性质：$\phi_{t+s} = \phi_t \circ \phi_s$。

**定义 138.2**（轨道与不变集）：
- 过点 $x$ 的轨道：$\gamma(x) = \{\phi_t(x) : t \in \mathbb{R}\}$
- 正向轨道：$\gamma^+(x) = \{\phi_t(x) : t \geq 0\}$
- 负向轨道：$\gamma^-(x) = \{\phi_t(x) : t \leq 0\}$
- 集合 $A$ 是**不变集**，如果 $\phi_t(A) = A$ 对所有 $t \in \mathbb{R}$
- $A$ 是**正向不变集**，如果 $\phi_t(A) \subseteq A$ 对所有 $t \geq 0$

**定义 138.3**（$\omega$-极限集与 $\alpha$-极限集）：对点 $x$，
- $\omega(x) = \{y : \exists t_n \to \infty, \phi_{t_n}(x) \to y\}$（$\omega$-极限集）
- $\alpha(x) = \{y : \exists t_n \to -\infty, \phi_{t_n}(x) \to y\}$（$\alpha$-极限集，仅当负向轨道存在）

### 138.2 平衡点与线性化

**定义 138.4**（平衡点）：点 $x^*$ 是**平衡点**（不动点/奇点），如果 $X(x^*) = 0$，即 $\phi_t(x^*) = x^*$ 对所有 $t$。

**定理 138.1**（Hartman-Grobman 定理）：设 $x^*$ 是 $C^1$ 向量场 $X$ 的双曲平衡点（即 $DX(x^*)$ 的所有特征值实部非零）。则存在 $x^*$ 的邻域 $U$，使得 $X$ 在 $U$ 上的流拓扑共轭于其线性化 $\dot{\mathbf{x}} = DX(x^*) \mathbf{x}$ 的流。

*证明概要*：通过对线性部分和非线性扰动构造适当的同胚。关键在于双曲性保证存在不变的稳定/不稳定子空间的一致压缩/扩张性。利用Banach不动点定理，将共轭同胚 $h = \text{id} + u$ 的构造转化为函数方程 $(L + R)(h(x)) = h(DX \cdot x)$ 的求解，其中 $L$ 为线性流，$R$ 为高阶项。双曲条件确保该方程有唯一连续解。∎

**定义 138.5**（稳定流形定理）：设 $x^*$ 是双曲平衡点。则存在：
- **稳定流形** $W^s(x^*) = \{x : \lim_{t \to \infty} \phi_t(x) = x^*\}$（维数 $= n_-$，即负实部特征值个数）
- **不稳定流形** $W^u(x^*) = \{x : \lim_{t \to -\infty} \phi_t(x) = x^*\}$（维数 $= n_+$，即正实部特征值个数）

$W^s$ 和 $W^u$ 是浸入子流形，在 $x^*$ 处分别切于稳定子空间 $E^s$ 和不稳定子空间 $E^u$。

**定理 138.2**（Lyapunov 函数与稳定性）：设 $x^*$ 是平衡点，$V: U \to \mathbb{R}$ 是 $C^1$ 函数，$U$ 为含 $x^*$ 的开集，满足：
- $V(x^*) = 0$，$V(x) > 0$ 对 $x \neq x^*$（正定）
- $\dot{V}(x) = \nabla V(x) \cdot X(x) \leq 0$ 在 $U$ 上

则 $x^*$ 是 Lyapunov 稳定的。若进一步 $\dot{V}(x) < 0$（$x \neq x^*$），则 $x^*$ 是渐近稳定的。

### 138.3 平面动力系统

**定理 138.3**（Poincaré-Bendixson 定理）：设 $\phi_t$ 是平面 $\mathbb{R}^2$ 上的 $C^1$ 流，$\gamma^+(x)$ 是包含在紧致集内的正向轨道。若 $\omega(x)$ 不含平衡点，则 $\omega(x)$ 是周期轨道。

*证明概要*：取 $y \in \omega(x)$，通过 $y$ 作横截线 $\Sigma$（局部截面）。由 $\omega$-极限集的不变性和不含平衡点，$\omega(x)$ 与 $\Sigma$ 的交为离散点列。利用 Jordan 曲线定理和流的单调性，可证明 $\gamma^+(x)$ 与 $\Sigma$ 的交点单调排列，极限点必为同一点，故 $\omega(x)$ 为闭轨（周期轨道）。□
**$\omega$-极限集分类**：平面流的 $\omega$-极限集只能是以下三类之一：(1) 平衡点；(2) 周期轨道；(3) 由平衡点和连接它们的异宿/同宿轨组成的图。三维及以上可出现奇怪吸引子。∎

**推论 138.4**：紧致平面区域内的正向不变集若不含平衡点，则必含周期轨道。

**例 138.1**（van der Pol 振子）：$\ddot{x} + \mu(x^2 - 1)\dot{x} + x = 0$。转化为系统：$\dot{x} = y$，$\dot{y} = -x - \mu(x^2 - 1)y$。对 $\mu > 0$，存在唯一的稳定极限环（由 Poincaré-Bendixson 定理保证）。

**例 138.2**（Lotka-Volterra 捕食者-猎物模型）：$\dot{x} = x(a - by)$，$\dot{y} = y(-c + dx)$（$a,b,c,d > 0$）。平衡点 $(c/d, a/b)$ 是中心，所有非平凡轨道是周期轨道。系统有守恒量 $H(x,y) = d x - c \ln x + b y - a \ln y$。

### 138.4 极限环与 Hopf 分支

**定义 138.6**（极限环）：极限环是孤立的周期轨道（即存在邻域内无其他周期轨道）。

**定理 138.5**（Hopf 分支定理）：考虑依赖参数 $\mu$ 的 ODE 系统 $\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}, \mu)$。设平衡点 $\mathbf{x}^*(\mu)$ 在 $\mu = \mu_0$ 时有一对纯虚特征值 $\lambda(\mu) = \alpha(\mu) \pm i\omega(\mu)$，$\alpha(\mu_0) = 0$，$\omega(\mu_0) \neq 0$，且 $\alpha'(\mu_0) \neq 0$（横截条件）。则在 $\mu = \mu_0$ 处分支出唯一的极限环族。

---

---

---

---

---

## 第223章：混沌与分形
混沌是确定性动力系统表现出的类随机行为，由对初始条件的敏感依赖所刻画。分形是具有自相似性和非整数维度的几何对象，常出现于混沌系统的吸引子。

### 139.1 混沌的定义

**定义 139.1**（Devaney 混沌，1989）：映射 $f: X \to X$（$X$ 为度量空间）是**混沌**的，如果：
1. $f$ 对初始条件敏感依赖：存在 $\delta > 0$ 使得对任意 $x$ 和 $\varepsilon > 0$，存在 $y$ 满足 $d(x,y) < \varepsilon$ 且对某个 $n \geq 0$，$d(f^n(x), f^n(y)) \geq \delta$
2. $f$ 是拓扑传递的：对任意非空开集 $U, V$，存在 $n \geq 0$ 使得 $f^n(U) \cap V \neq \emptyset$
3. $f$ 的周期点在 $X$ 中稠密

**定理 139.1**（Banks et al., 1992）：在紧致度量空间上，拓扑传递性和稠密周期点蕴含敏感依赖性。因此条件 (1) 是冗余的。

**定义 139.2**（Lyapunov 指数）：一维映射 $f$ 在轨道 $\{x_n\}$ 上的 Lyapunov 指数为

$$\lambda(x_0) = \lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} \ln |f'(x_k)|$$

（若极限存在）。$\lambda > 0$ 是混沌的数值标志。高维系统有 $n$ 个 Lyapunov 指数，正的 Lyapunov 指数数量刻画了混沌的程度。

**例 139.1**（Logistic 映射 $r=4$ 的 Lyapunov 指数）：$f(x) = 4x(1-x)$，$\lambda = \ln 2 > 0$。

### 139.2 奇怪吸引子

**定义 139.3**（吸引子）：紧致不变集 $A$ 是**吸引子**，如果存在开集 $U \supset A$（$A$ 的吸引盆）使得 $\phi_t(U) \subseteq U$ 对所有 $t \geq 0$，且 $A = \bigcap_{t \geq 0} \phi_t(U)$。

**定义 139.4**（奇怪吸引子）：如果吸引子 $A$ 上的动力系统是混沌的（对初始条件敏感依赖），则 $A$ 称为**奇怪吸引子**。奇怪吸引子通常具有分形结构。

**例 139.2**（Lorenz 吸引子，1963）：Lorenz 方程：

$$\begin{aligned} \dot{x} &= \sigma(y - x) \\ \dot{y} &= x(\rho - z) - y \\ \dot{z} &= xy - \beta z \end{aligned}$$

经典参数 $\sigma = 10, \beta = 8/3, \rho = 28$。Lorenz 吸引子是蝴蝶形状的奇怪吸引子，Lyapunov 指数为 $\lambda_1 \approx 0.9 > 0$。

**例 139.3**（Hénon 映射，1976）：$(x_{n+1}, y_{n+1}) = (1 - a x_n^2 + y_n, b x_n)$。经典参数 $a = 1.4, b = 0.3$。Hénon 吸引子是经典的奇怪吸引子。

### 139.3 分形

**定义 139.5**（Hausdorff 维数 / 分形维数）：对度量空间 $(X, d)$ 的子集 $S$，$s$ 维 Hausdorff 测度定义为

$$\mathcal{H}^s(S) = \lim_{\delta \to 0} \inf \left\{ \sum_{i=1}^{\infty} (\operatorname{diam} U_i)^s : S \subseteq \bigcup_i U_i, \operatorname{diam} U_i < \delta \right\}$$

Hausdorff 维数为 $\dim_H(S) = \inf\{s : \mathcal{H}^s(S) = 0\} = \sup\{s : \mathcal{H}^s(S) = \infty\}$。

**定义 139.6**（盒维数 / Box-counting dimension）：设 $N(\varepsilon)$ 是覆盖 $S$ 所需直径为 $\varepsilon$ 的集合的最小个数。盒维数为

$$\dim_B(S) = \lim_{\varepsilon \to 0} \frac{\ln N(\varepsilon)}{\ln(1/\varepsilon)}$$

（若极限存在）。一般有 $\dim_H(S) \leq \dim_B(S)$。

**例 139.4**（经典分形）：
- **Cantor 三分集**：从 $[0,1]$ 反复删除中间三分之一。$\dim_H = \ln 2 / \ln 3 \approx 0.631$
- **Koch 雪花曲线**：$\dim_H = \ln 4 / \ln 3 \approx 1.262$
- **Sierpiński 三角形**：$\dim_H = \ln 3 / \ln 2 \approx 1.585$
- **Menger 海绵**：$\dim_H = \ln 20 / \ln 3 \approx 2.727$

**定理 139.2**（Kaplan-Yorke 猜想 / Lyapunov 维数）：吸引子 $A$ 的 Lyapunov 维数定义为

$$\dim_L(A) = k + \frac{\sum_{i=1}^k \lambda_i}{|\lambda_{k+1}|}$$

其中 $\lambda_1 \geq \lambda_2 \geq \cdots \geq \lambda_n$ 为 Lyapunov 指数，$k$ 是满足 $\sum_{i=1}^k \lambda_i \geq 0$ 的最大整数。Lorenz 吸引子的 Lyapunov 维数约为 $2.06$。

### 139.4 通向混沌的道路

**定义 139.7**（倍周期分岔通向混沌）：Logistic 映射中，随着 $r$ 增大，出现无限级联的倍周期分岔，其分岔值满足 Feigenbaum 普适性：

$$\lim_{n \to \infty} \frac{r_n - r_{n-1}}{r_{n+1} - r_n} = \delta \approx 4.6692 \quad \text{(Feigenbaum 常数)}$$

**定义 139.8**（间歇性通向混沌 / Pomeau-Manneville）：系统在长时间规则行为与短时间不规则爆发之间交替。

**定义 139.9**（Ruelle-Takens-Newhouse 通向混沌）：经过三次 Hopf 分岔（环面→环面→环面）后，第三个环面不稳定，直接产生奇怪吸引子。

---

---

---

---

---

## 第224章：遍历论基础
遍历论研究动力系统在长时间平均下的统计行为，是统计力学和概率论在动力系统中的应用。

### 140.1 保测变换与不变测度

**定义 140.1**（保测变换）：设 $(X, \mathcal{B}, \mu)$ 是概率空间。可测变换 $T: X \to X$ 是**保测变换**，如果 $\mu(T^{-1}(A)) = \mu(A)$ 对所有 $A \in \mathcal{B}$。$\mu$ 称为 $T$-不变测度。

**例 140.1**（保测变换的例子）：
- 圆周旋转 $T(x) = x + \alpha \pmod{1}$ 保持 Lebesgue 测度
- 加倍映射 $T(x) = 2x \pmod{1}$（$x \in [0,1)$）保持 Lebesgue 测度
- 帐篷映射 $T(x) = 2\min(x, 1-x)$ 保持 Lebesgue 测度
- Logistic 映射 $r=4$：$T(x) = 4x(1-x)$ 保持测度 $\mu(A) = \frac{1}{\pi} \int_A \frac{dx}{\sqrt{x(1-x)}}$

**定理 140.1**（Krylov-Bogolyubov 定理）：紧致度量空间上的任何连续映射至少有一个不变 Borel 概率测度。

*证明思路*：取任意概率测度 $\nu$，考虑 Cesàro 平均 $\mu_n = \frac{1}{n}\sum_{k=0}^{n-1} T^k_* \nu$。由 Banach-Alaoglu 定理和 Riesz 表示定理，$\mu_n$ 有弱*收敛子列，极限测度是 $T$ 不变的。∎

### 140.2 遍历性与 Birkhoff 遍历定理

**定义 140.2**（遍历性）：保测变换 $T$ 是**遍历的**（ergodic），如果对任意满足 $T^{-1}(A) = A$ 的可测集 $A$，有 $\mu(A) = 0$ 或 $\mu(A) = 1$。即系统不可分解为两个非平凡的不变部分。

**定理 140.2**（Birkhoff 遍历定理，1931）：设 $T$ 是保测变换，$f \in L^1(\mu)$。则对几乎所有的 $x$，时间平均收敛：

$$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} f(T^k x) = \bar{f}(x)$$

其中 $\bar{f} \in L^1(\mu)$ 是 $T$ 不变的（$\bar{f} \circ T = \bar{f}$），且 $\int_X \bar{f} \, d\mu = \int_X f \, d\mu$。若 $T$ 是遍历的，则 $\bar{f}(x) = \int_X f \, d\mu$ 几乎处处成立。

*证明概要*：核心工具是极大遍历不等式（Maximal Ergodic Theorem）。定义部分和 $S_n f(x) = \sum_{k=0}^{n-1} f(T^k x)$，$M_N f = \max\{0, S_1, \dots, S_N\}$。极大不等式断言 $\int_{\{M_N f > 0\}} f \, d\mu \geq 0$。由此考虑上、下极限函数 $\bar{f}(x) = \limsup S_n f/n$ 和 $\underline{f}(x) = \liminf S_n f/n$，利用 $T$ 不变性和极大不等式证明 $\bar{f} = \underline{f} = \bar{f}$（即收敛）且 $\int \bar{f} = \int f$。遍历性下 $\bar{f}$ 几乎处处为常数，故 $\bar{f} = \int f$ 几乎处处。∎

**推论 140.3**（Boltzmann 遍历假设的数学严格化）：对遍历系统，长时间平均等于空间平均。

**定理 140.4**（遍历性的等价刻画）：以下等价：
1. $T$ 是遍历的
2. 任何 $T$ 不变的可测函数几乎处处为常数
3. 对任意 $A, B \in \mathcal{B}$，$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} \mu(T^{-k} A \cap B) = \mu(A) \mu(B)$

**定义 140.3**（混合）：$T$ 是**混合**的（mixing），如果对任意 $A, B \in \mathcal{B}$，$\lim_{n \to \infty} \mu(T^{-n} A \cap B) = \mu(A) \mu(B)$。混合蕴含遍历性，但反之不成立。

**定义 140.4**（弱混合）：$T$ 是**弱混合**的（weakly mixing），如果对任意 $A, B \in \mathcal{B}$，$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} |\mu(T^{-k} A \cap B) - \mu(A)\mu(B)| = 0$。强混合蕴含弱混合，弱混合蕴含遍历性，反之均不成立。

**定理 140.5**（弱混合的谱刻画）：$T$ 是**弱混合**的当且仅当 $T$ 在 $L^2(\mu) \ominus \{\text{常数函数}\}$ 上的 Koopman 算子 $U_T f = f \circ T$ 具有连续谱（即没有特征值）。这是弱混合的一个重要谱刻画，注意强混合蕴含弱混合，反之一般不成立。

### 140.3 熵

**定义 140.5**（测度论熵 / Kolmogorov-Sinai 熵）：设 $\mathcal{P} = \{P_1, \ldots, P_k\}$ 是 $X$ 的有限可测划分。$\mathcal{P}$ 的熵为 $H(\mathcal{P}) = -\sum_{i=1}^k \mu(P_i) \log \mu(P_i)$。$T$ 关于 $\mathcal{P}$ 的熵率为

$$h(T, \mathcal{P}) = \lim_{n \to \infty} \frac{1}{n} H\left( \bigvee_{k=0}^{n-1} T^{-k} \mathcal{P} \right)$$

$T$ 的测度论熵为 $h_\mu(T) = \sup_{\mathcal{P}} h(T, \mathcal{P})$。

**定理 140.6**（熵与遍历性）：$h_\mu(T) > 0$ 蕴含 $T$ 是遍历的（实际上是 Kolmogorov 自同构，比混合更强）。

**例 140.2**：Bernoulli 移位 $(p_1, \ldots, p_k)$ 的熵为 $-\sum p_i \log p_i$。加倍映射 $x \mapsto 2x \pmod{1}$ 关于 Lebesgue 测度的熵为 $\log 2$。

**定理 140.7**（Pesin 熵公式）：对光滑动力系统，Kolmogorov-Sinai 熵等于正的 Lyapunov 指数之和：

$$h_\mu(T) = \sum_{\lambda_i > 0} \lambda_i$$

（在适当的假设下，如 SRB 测度）。

### 140.4 拓扑动力系统

**定义 140.6**（极小性）：动力系统 $(X, T)$ 是**极小**的，如果 $X$ 不含非平凡的闭不变子集。等价地，每一条轨道都是稠密的。

**定理 140.8**（Birkhoff 回复定理）：紧致度量空间上的连续映射必有回复点（即存在 $x$ 和 $n_k \to \infty$ 使得 $T^{n_k}(x) \to x$）。

**定义 140.7**（拓扑熵）：拓扑熵 $h_{top}(T)$ 度量了动力系统的轨道复杂性。对紧致度量空间上的连续映射 $T$，

$$h_{top}(T) = \lim_{\varepsilon \to 0} \limsup_{n \to \infty} \frac{1}{n} \log N(n, \varepsilon)$$

其中 $N(n, \varepsilon)$ 是 $n$ 步轨道在 $\varepsilon$ 分辨率下可区分的最大轨道段数。

**定理 140.9**（变分原理）：$h_{top}(T) = \sup_{\mu \in \mathcal{M}_T} h_\mu(T)$，其中 $\mathcal{M}_T$ 是 $T$ 的所有不变概率测度的集合。

---

---

---

---

---

## 第225章：分支理论
分支理论研究当参数变化时，动力系统的定性行为如何变化。分支点（bifurcation point）是参数值，在此处系统的拓扑结构发生改变。

### 141.1 不动点的分支

**定义 141.1**（局部分支）：考虑依赖参数 $\mu \in \mathbb{R}$ 的 ODE $\dot{x} = f(x, \mu)$。设 $f(0, 0) = 0$。**分支点**是 $\mu$ 的值，在此处不动点 $x = 0$ 的稳定性改变或新不动点产生。

**定理 141.1**（分支的必要条件）：在分支点 $\mu = 0$ 处，$\frac{\partial f}{\partial x}(0, 0) = 0$（即线性化矩阵有零特征值）。

**定义 141.2**（鞍结分支 / Saddle-node bifurcation）：标准形 $\dot{x} = \mu - x^2$。当 $\mu < 0$ 时无不动点；$\mu = 0$ 时有一个半稳定不动点；$\mu > 0$ 时有两个不动点（一个稳定，一个不稳定）。

**定义 141.3**（跨临界分支 / Transcritical bifurcation）：标准形 $\dot{x} = \mu x - x^2$。不动点 $x = 0$ 和 $x = \mu$ 始终存在，但在 $\mu = 0$ 处交换稳定性。

**定义 141.4**（叉式分支 / Pitchfork bifurcation）：
- **超临界**（supercritical）：$\dot{x} = \mu x - x^3$。$\mu \leq 0$ 时 $x=0$ 稳定；$\mu > 0$ 时 $x=0$ 不稳定，出现两个稳定的对称不动点 $\pm \sqrt{\mu}$
- **亚临界**（subcritical）：$\dot{x} = \mu x + x^3$。$\mu < 0$ 时 $x=0$ 稳定，有两个不稳定不动点 $\pm \sqrt{-\mu}$；$\mu \geq 0$ 时 $x=0$ 不稳定

### 141.2 周期轨道的分支

**定义 141.5**（Hopf 分支）：标准形（极坐标）：
$$\dot{r} = \mu r - r^3, \quad \dot{\theta} = \omega$$

- **超临界 Hopf 分支**：$\mu \leq 0$ 时原点稳定；$\mu > 0$ 时原点不稳定，出现稳定极限环（半径 $\sqrt{\mu}$）
- **亚临界 Hopf 分支**：$\dot{r} = \mu r + r^3 - r^5$（$\mu < 0$ 时已存在不稳定极限环）

**定理 141.2**（Hopf 分支定理，正式陈述）：设 $\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x}, \mu)$ 满足 $\mathbf{f}(0, \mu) = \mathbf{0}$，$D\mathbf{f}(0, \mu)$ 有特征值 $\lambda(\mu) = \alpha(\mu) \pm i\omega(\mu)$（$\alpha(0) = 0, \omega(0) > 0$），其余特征值实部为负。若 $\alpha'(0) \neq 0$，则存在唯一的分支极限环族。分支方向由第一 Lyapunov 系数 $\ell_1(0)$ 决定：$\ell_1(0) < 0$ 为超临界，$\ell_1(0) > 0$ 为亚临界。

**定义 141.6**（倍周期分支 / Period-doubling bifurcation）：一维映射 $f(x, \mu)$ 在 $\mu = \mu_0$ 处发生倍周期分支，如果 $f_{\mu_0}'(x^*) = -1$ 且 $\frac{\partial}{\partial \mu}(f_\mu^2)''(x^*) \neq 0$ 等非退化条件成立。标准形：$f(x, \mu) = -(1+\mu)x + x^3$。

### 141.3 全局分支

**定义 141.7**（同宿分支 / Homoclinic bifurcation）：当稳定流形和不稳定流形在鞍点处相切时，产生同宿轨道，可能引发混沌（Shilnikov 机制）。

**定义 141.8**（异宿分支 / Heteroclinic bifurcation）：连接不同平衡点的轨道（异宿轨道）在参数变化时出现或消失。

**定理 141.3**（Shilnikov 定理，1965）：若三维系统有鞍-焦点型平衡点，其特征值满足 $\lambda_1 < 0$，$\lambda_{2,3} = \alpha \pm i\omega$（$\alpha > 0$），且 $|\lambda_1| < \alpha$，则同宿轨道的存在性蕴含可数无穷多个 Smale 马蹄（混沌）。

### 141.4 无穷维分支

**定义 141.9**（Turing 分支，1952）：在反应扩散方程 $\partial_t u = D \Delta u + f(u, \mu)$ 中，当扩散系数比例改变时，齐次平衡态失稳，产生空间非齐次图案（Turing 斑图）。

**定义 141.10**（Ginzburg-Landau 方程）：$\partial_t A = \mu A + (1+i\alpha)\partial_x^2 A - (1+i\beta)|A|^2 A$。这是 Hopf 分支在空间扩展系统中的标准形，描述了斑图形成的普适类。

---

---

---

---

---

## 第226章（补充）
特殊函数（Special Functions）是数学物理和微分方程理论的经典工具。它们通常作为二阶线性常微分方程的解出现，构成一套丰富的函数体系。本章系统补充 Gamma/Beta 函数、Bessel 函数和正交多项式族的理论基础。

### Gamma函数与Beta函数

**定义**（Gamma函数 / Euler第二积分）：$\Gamma(z)$ 是阶乘函数在复平面上的解析延拓（除去非正整数点），第二类 Euler 积分为：
$$\Gamma(z) = \int_0^\infty t^{z-1} e^{-t} dt \quad (\Re z > 0)$$
通过解析延拓到 $\mathbb{C} \setminus \{0, -1, -2, \ldots\}$。

**命题**（基本性质）：
- 函数方程：$\Gamma(z+1) = z \Gamma(z)$，$\Gamma(1) = 1$，故 $\Gamma(n) = (n-1)!$（$n \in \mathbb{N}$）
- 反射公式（Euler 反射公式）：$\Gamma(z) \Gamma(1-z) = \frac{\pi}{\sin(\pi z)}$
- Legendre 加倍公式：$\Gamma(2z) = \frac{2^{2z-1}}{\sqrt{\pi}} \Gamma(z) \Gamma(z + 1/2)$
- **Weierstrass无穷乘积表示**：$\frac{1}{\Gamma(z)} = z e^{\gamma z} \prod_{n=1}^\infty \left(1 + \frac{z}{n}\right) e^{-z/n}$（$\gamma \approx 0.5772$ 为 Euler-Mascheroni 常数）。由此可知 $1/\Gamma(z)$ 是整函数，其零点是 $z = 0, -1, -2, \ldots$（均为单零点）

**定义**（Beta函数 / Euler第一积分）：
$$B(x, y) = \int_0^1 t^{x-1} (1-t)^{y-1} dt \quad (\Re x, \Re y > 0)$$
其与 Gamma 函数的关系为：$B(x, y) = \frac{\Gamma(x) \Gamma(y)}{\Gamma(x + y)}$

**定理**（Stirling公式 / 渐近展开）：当 $|z| \to \infty$（$|\arg z| < \pi$），
$$\Gamma(z) \sim \sqrt{2\pi} \, z^{z - 1/2} e^{-z} \left[1 + \frac{1}{12z} + \frac{1}{288 z^2} - \frac{139}{51840 z^3} + \cdots \right]$$
$\log \Gamma(z) \sim z \log z - z - \frac{1}{2} \log z + \frac{1}{2} \log(2\pi) + O(1/z)$。

### Bessel函数

**定义**（Bessel微分方程与Bessel函数）：$\nu$ 阶 Bessel 微分方程
$$x^2 y'' + x y' + (x^2 - \nu^2) y = 0$$
的第一类解为 **Bessel 函数** $J_\nu(x)$（级数形式）：
$$J_\nu(x) = \sum_{k=0}^\infty \frac{(-1)^k}{k! \, \Gamma(k + \nu + 1)} \left(\frac{x}{2}\right)^{2k + \nu}$$
当 $\nu \notin \mathbb{Z}$ 时，$J_\nu$ 与 $J_{-\nu}$ 是线性无关的。

**命题**（整数阶与半整数阶）：
- $J_{-n}(x) = (-1)^n J_n(x)$（$n \in \mathbb{Z}$），此时 $J_n$ 和 **第二类Bessel函数** $Y_n$（Neumann函数）构成基
- 半整数阶推出初等函数表示：$J_{1/2}(x) = \sqrt{\frac{2}{\pi x}} \sin x$，$J_{n+1/2}$ 均可通过正弦和余弦及 $x^{-1/2}$ 的组合表出

**命题**（递推关系与生成函数）：
- $\frac{d}{dx}[x^\nu J_\nu(x)] = x^\nu J_{\nu-1}(x)$
- $\frac{d}{dx}[x^{-\nu} J_\nu(x)] = -x^{-\nu} J_{\nu+1}(x)$
- **生成函数**：$\exp\left[\frac{x}{2}(t - t^{-1})\right] = \sum_{n=-\infty}^\infty J_n(x) t^n$（整数阶Bessel函数的指数型生成函数，Schlömilch 1857）

**定理**（Bessel函数的正交性与Fourier-Bessel展开）：$J_\nu$ 在 $[0, a]$ 上的零点 $\{j_{\nu, n}\}$ 满足正交关系：
$$\int_0^a J_\nu(j_{\nu,m} r/a) J_\nu(j_{\nu,n} r/a) \, r \, dr = \frac{a^2}{2} [J_\nu'(j_{\nu,n})]^2 \delta_{mn}$$
由此得到 **Fourier-Bessel级数展开**——将圆柱对称区域上的函数按Bessel函数展开（Hankel变换）。

### 正交多项式

**定义**（正交多项式族）：在区间 $I$ 上对于权函数 $w(x) > 0$ 正交的多项式族 $\{P_n(x)\}$：
$$\int_I P_m(x) P_n(x) w(x) dx = h_n \delta_{mn}$$
所有经典正交多项式可通过一个统一的生成函数的超几何表示关联（Askey 方案, Askey-Wilson多项式）。

**经典正交多项式**：
- **Legendre多项式** $P_n(x)$：$I = [-1, 1]$，$w(x) = 1$，生成函数为 $(1 - 2xt + t^2)^{-1/2}$。Rodrigues公式：$P_n(x) = \frac{1}{2^n n!} \frac{d^n}{dx^n}[(x^2 - 1)^n]$
- **Hermite多项式** $H_n(x)$：$I = (-\infty, \infty)$，$w(x) = e^{-x^2}$。Rodrigues公式：$H_n(x) = (-1)^n e^{x^2} \frac{d^n}{dx^n}[e^{-x^2}]$。是量子谐振子方程的 Hermite 多项式解
- **Laguerre多项式** $L_n^{(\alpha)}(x)$：$I = [0, \infty)$，$w(x) = x^\alpha e^{-x}$。氢原子径向方程的典型解
- **Chebyshev多项式**（已在逼近论中详细论述）：$T_n(\cos \theta) = \cos(n\theta)$

**命题**（递推关系与零点性质）：所有正交多项式满足三项递推关系 $x P_n(x) = A_n P_{n+1}(x) + B_n P_n(x) + C_n P_{n-1}(x)$。$P_n$ 的 $n$ 个零点全为实数且位于 $I$ 内（且在 $P_{n-1}$ 的零点之间交错）。相邻零点之间的最大间距由 Chebyshev 多项式极小化——这是 Gauss 求积公式节点的理论基础。

**定理**（广义超几何函数的统一框架）：许多特殊函数正交多项式族均为广义超几何函数 $pF_q$ 的特例。Askey方案（Askey scheme）将所有经典正交多项式按离散-连续和极限关系组织为一个层级结构，Askey-Wilson多项式位于顶层——这是特殊函数统一理论的基石。

---

*本卷基于 V18（微分方程），建立了离散和连续动力系统、混沌与分形、遍历论和分支理论的系统理论。共 5 章。*

*本卷建立了微分方程从经典到现代的理论框架：ODE 的存在唯一性理论（Picard-Lindelöf 定理）和稳定性理论（Lyapunov 方法）是动力系统研究的基础；三大经典 PDE（Laplace 方程、热方程、波动方程）的解法展示了 PDE 的丰富结构和物理背景；Sobolev 空间和弱解理论为现代 PDE 研究提供了强大的泛函分析框架（Lax-Milgram 定理、椭圆正则性理论）。补充内容涵盖微分方程的定性理论（Lotka-Volterra 系统、传染病模型的阈值动力学、Turing 不稳定性）和动力系统理论（离散/连续动力系统、混沌与分形、遍历论、分支理论），ODE 作为动力系统的连续版本形成了完整的学科体系。共 10 章。*


*卷十七：微分方程终。*


*卷十七：微分方程终。*


*卷十七：微分方程终。*


*卷二十一：动力系统与特殊函数终。*
