# 卷二十九：数学物理方法

> 本卷从变分原理出发，建立变分法的经典应用（Euler-Lagrange 方程）、辛几何的具体实现（Hamilton 方程至 Hamilton 向量场）、对称性与守恒量的数学定理（Noether 定理）、Hilbert 空间上自伴算子的谱理论、纤维丛上的变分问题（场论）、伪 Riemann 几何和共形场论等纯粹数学结构。本卷是微分几何（V12）、泛函分析（V14）、李理论（V23）和调和分析（V24）的系统应用。

---

## 第147章：变分原理与 Lagrange 力学
Lagrange 形式是变分法的经典应用：从泛函驻值条件导出 Euler-Lagrange 方程。本章与 V26 Ch 136 的变分法互补，聚焦于变分法的数学结构。

### 147.1 最小作用量原理

**定义 147.1**（作用量）：设 $q^i(t)$（$i=1,\ldots,n$）是 $n$ 个广义坐标。**作用量泛函**为

$$S[q] = \int_{t_1}^{t_2} L(q, \dot{q}, t) \, dt$$

其中 $L: TQ \times \mathbb{R} \to \mathbb{R}$ 是定义在切丛上的 Lagrange 函数。

**原理 147.1**（驻值原理）：使作用量 $S[q]$ 取驻值的曲线 $q(t)$ 满足 $\delta S = 0$，在固定端点条件 $q(t_1), q(t_2)$ 固定下导出运动方程。

**定理 147.1**（Euler-Lagrange 方程）：由 $\delta S = 0$ 导出

$$\frac{d}{dt}\left( \frac{\partial L}{\partial \dot{q}^i} \right) - \frac{\partial L}{\partial q^i} = 0, \quad i = 1, \ldots, n$$

*证明*：考虑变分 $q^i(t) \to q^i(t) + \varepsilon \eta^i(t)$，其中 $\eta^i(t_1) = \eta^i(t_2) = 0$（固定端点）。作用量的变分为
$$\delta S = \int_{t_1}^{t_2} \sum_i \left( \frac{\partial L}{\partial q^i} \varepsilon \eta^i + \frac{\partial L}{\partial \dot{q}^i} \varepsilon \dot{\eta}^i \right) dt$$
对第二项分部积分：$\int_{t_1}^{t_2} \frac{\partial L}{\partial \dot{q}^i} \dot{\eta}^i dt = -\int_{t_1}^{t_2} \frac{d}{dt}\!\left(\frac{\partial L}{\partial \dot{q}^i}\right) \eta^i dt$（边界项因 $\eta^i(t_1)=\eta^i(t_2)=0$ 消失）。故
$$\delta S = \varepsilon \int_{t_1}^{t_2} \sum_i \left( \frac{\partial L}{\partial q^i} - \frac{d}{dt}\frac{\partial L}{\partial \dot{q}^i} \right) \eta^i dt = 0$$
由变分 $\eta^i(t)$ 的任意性及变分法基本引理，被积函数恒为零，即得 Euler-Lagrange 方程。∎

**例 147.1**（二次型 Lagrange 函数）：$L = \frac{1}{2}\dot{\mathbf{x}}^2$，Euler-Lagrange 方程给出 $\ddot{\mathbf{x}} = 0$（线性轨迹）。

**例 147.2**（调和振子型 Lagrange 函数）：$L = \frac{1}{2}\dot{x}^2 - \frac{1}{2}k x^2$，运动方程 $\ddot{x} + kx = 0$。

**例 147.3**（径向对称 Lagrange 函数）：$L = \frac{1}{2}(\dot{r}^2 + r^2\dot{\theta}^2) - V(r)$。由 $\theta$ 的 Euler-Lagrange 方程得 $r^2\dot{\theta} = \text{const}$（守恒量）。

### 147.2 Noether 定理

**定理 147.2**（Noether 定理，1918）：Lagrange 系统的每一个连续对称性对应一个守恒量。

具体地，若作用量在变换 $q^i \to q^i + \varepsilon \xi^i(q, \dot{q})$ 和 $t \to t + \varepsilon \tau(q, \dot{q})$ 下不变（$\delta S = 0$），则

$$Q = \sum_i \frac{\partial L}{\partial \dot{q}^i} \xi^i - \left( \sum_i \frac{\partial L}{\partial \dot{q}^i} \dot{q}^i - L \right) \tau$$

是守恒量（$\frac{dQ}{dt} = 0$）。

*证明概要*：考虑无穷小变换 $q^i \to q^i + \varepsilon \xi^i$，$t \to t + \varepsilon \tau$。计算作用量的变分 $\delta S = \int_{t_1}^{t_2} [\frac{\partial L}{\partial q^i} \delta q^i + \frac{\partial L}{\partial \dot{q}^i} \delta \dot{q}^i + L \frac{d(\delta t)}{dt}] dt$。使用 $\delta q^i = \varepsilon \xi^i - \dot{q}^i \delta t$ 及分部积分，令 $\delta S = 0$ 对任意积分区间成立，得到 $\frac{d}{dt}[\frac{\partial L}{\partial \dot{q}^i} \xi^i - (\frac{\partial L}{\partial \dot{q}^i} \dot{q}^i - L)\tau] = (\frac{\partial L}{\partial q^i} - \frac{d}{dt}\frac{\partial L}{\partial \dot{q}^i})(\xi^i - \dot{q}^i \tau)$。在 Euler-Lagrange 方程的壳层（on-shell）上，右端为0，故 $Q$ 守恒。∎

**例 147.4**（Noether 定理的典型对应关系）：
- **时间平移不变性** $\implies$ 守恒量 $Q_t = \sum_i \frac{\partial L}{\partial \dot{q}^i} \dot{q}^i - L$
- **空间平移不变性** $\implies$ 守恒量 $Q_x = \frac{\partial L}{\partial \dot{q}^i}$
- **旋转不变性** $\implies$ 角型守恒量

### 147.3 约束与 Lagrange 乘子

**定义 147.2**（约束系统）：若坐标受约束 $f_\alpha(q, t) = 0$（$\alpha = 1, \ldots, m$），则使用 Lagrange 乘子 $\lambda_\alpha$：

$$L' = L + \sum_{\alpha=1}^m \lambda_\alpha(t) f_\alpha(q, t)$$

运动方程为 $\frac{d}{dt}\frac{\partial L}{\partial \dot{q}^i} - \frac{\partial L}{\partial q^i} = \sum_\alpha \lambda_\alpha \frac{\partial f_\alpha}{\partial q^i}$。

**定理 147.3**（d'Alembert 原理的数学表述）：约束力的虚功为零 $\sum_i \mathbf{F}_i^{\text{constraint}} \cdot \delta \mathbf{r}_i = 0$，这等价于 Lagrange 乘子法的几何条件。

---

---

## 第148章：Hamilton 力学与辛几何
Hamilton 形式将二阶 ODE 系统转化为一阶 ODE 系统，并揭示其背后的辛几何结构。本章建立 Legendre 变换、Hamilton 正则方程、Poisson 括号代数以及辛流形上的 Hamilton 向量场理论。

### 148.1 Legendre 变换与 Hamilton 方程

**定义 148.1**（广义动量与 Hamilton 函数）：对 Lagrange 函数 $L(q, \dot{q}, t)$，定义广义动量

$$p_i = \frac{\partial L}{\partial \dot{q}^i}$$

和 Hamilton 函数（Legendre 变换）

$$H(q, p, t) = \sum_i p_i \dot{q}^i - L(q, \dot{q}, t)$$

其中 $\dot{q}^i$ 需用 $(q, p)$ 表示。

**定理 148.1**（Hamilton 正则方程）：

$$\dot{q}^i = \frac{\partial H}{\partial p_i}, \quad \dot{p}_i = -\frac{\partial H}{\partial q^i}$$

*证明*：由 Legendre 变换 $H = \sum_i p_i \dot{q}^i - L$，计算全微分：
$$dH = \sum_i \left( \dot{q}^i dp_i + p_i d\dot{q}^i - \frac{\partial L}{\partial q^i} dq^i - \frac{\partial L}{\partial \dot{q}^i} d\dot{q}^i \right) - \frac{\partial L}{\partial t} dt$$
由 $p_i = \frac{\partial L}{\partial \dot{q}^i}$，$d\dot{q}^i$ 项抵消。又由 Euler-Lagrange 方程 $\dot{p}_i = \frac{d}{dt}\frac{\partial L}{\partial \dot{q}^i} = \frac{\partial L}{\partial q^i}$。比较 $dH = \sum_i (\frac{\partial H}{\partial q^i} dq^i + \frac{\partial H}{\partial p_i} dp_i) + \frac{\partial H}{\partial t} dt$，即得 $\dot{q}^i = \frac{\partial H}{\partial p_i}$，$\dot{p}_i = -\frac{\partial H}{\partial q^i}$。等价性得证。∎

**例 148.1**（调和振子型 Hamilton 函数）：$H = \frac{p^2}{2} + \frac{1}{2}kq^2$。正则方程：$\dot{q} = p$，$\dot{p} = -kq$。

### 148.2 Poisson 括号

**定义 148.2**（Poisson 括号）：相空间上的函数 $f(q, p)$ 和 $g(q, p)$ 的 Poisson 括号为

$$\{f, g\} = \sum_i \left( \frac{\partial f}{\partial q^i} \frac{\partial g}{\partial p_i} - \frac{\partial f}{\partial p_i} \frac{\partial g}{\partial q^i} \right)$$

**命题 148.2**（Poisson 括号的性质）：
- 反对称：$\{f, g\} = -\{g, f\}$
- 双线性
- Leibniz 法则：$\{fg, h\} = f\{g, h\} + \{f, h\}g$
- Jacobi 恒等式：$\{f, \{g, h\}\} + \{g, \{h, f\}\} + \{h, \{f, g\}\} = 0$

即 Poisson 括号使相空间上的光滑函数构成 Lie 代数。

**定理 148.3**（运动方程）：对任意可观测量 $f(q, p, t)$，$\frac{df}{dt} = \{f, H\} + \frac{\partial f}{\partial t}$。特别地，$f$ 是守恒量当且仅当 $\{f, H\} = 0$（且 $f$ 不显含时）。

**基本 Poisson 括号**：$\{q^i, q^j\} = 0$，$\{p_i, p_j\} = 0$，$\{q^i, p_j\} = \delta^i_j$。

### 148.3 辛几何

**定义 148.3**（辛形式）：相空间 $T^*Q$（余切丛）上的典范辛形式为

$$\omega = \sum_i dq^i \wedge dp_i$$

$\omega$ 是非退化的闭 2-形式（$d\omega = 0$）。

**定义 148.4**（辛流形）：辛流形 $(M, \omega)$ 是光滑流形配以非退化闭 2-形式 $\omega$。

**定理 148.4**（Darboux 定理）：任何辛流形局部上存在坐标 $(q^i, p_i)$ 使得 $\omega = \sum_i dq^i \wedge dp_i$。即所有辛流形局部同构。

**定义 148.5**（Hamilton 向量场）：对函数 $H \in C^\infty(M)$，其 Hamilton 向量场 $X_H$ 由 $\iota_{X_H} \omega = dH$（即 $\omega(X_H, \cdot) = dH$）定义。在 Darboux 坐标下，$X_H = \sum_i (\frac{\partial H}{\partial p_i} \frac{\partial}{\partial q^i} - \frac{\partial H}{\partial q^i} \frac{\partial}{\partial p_i})$。

**定理 148.5**（Liouville 定理）：Hamilton 流保持相空间体积（辛体积 $\omega^n$）。即 $\phi_t^* \omega = \omega$，故 $\phi_t^*(\omega^n) = \omega^n$。

**定理 148.6**（Poincaré 回复定理）：对保测变换（包括 Hamilton 流），紧致相空间上的几乎每个点都是回复的。

### 148.4 Hamilton-Jacobi 理论与可积系统

**定义 148.6**（Hamilton-Jacobi 方程）：求函数 $S(q, t)$ 满足

$$\frac{\partial S}{\partial t} + H\left(q, \frac{\partial S}{\partial q}, t\right) = 0$$

**定理 148.7**（Liouville-Arnold 可积性定理）：若 $n$ 自由度的 Hamilton 系统有 $n$ 个相互对合（$\{F_i, F_j\} = 0$）的独立守恒量，则系统可通过作用-角变量 $(I_i, \theta_i)$ 完全积分。运动在 $n$ 维环面上，$\dot{\theta}_i = \omega_i(I)$（常数），$\dot{I}_i = 0$。

---

---

## 第149章：量子力学数学基础
量子力学的数学基础是 Hilbert 空间上自伴算子的谱理论和 C*-代数表示论。本章建立量子力学的公理化框架，视其为泛函分析的具体实现。

### 149.1 量子力学的公理化

**公理 149.1**（量子态）：考虑复可分 Hilbert 空间 $\mathcal{H}$。态由 $\mathcal{H}$ 上的密度算子 $\rho$（$\rho \geq 0, \operatorname{Tr}(\rho) = 1$）描述。纯态对应于一维投影 $\rho = |\psi\rangle\langle\psi|$（$\|\psi\| = 1$）。

**公理 149.2**（可观测量）：可观测量由 $\mathcal{H}$ 上的自伴算子 $A = A^\dagger$ 描述。$A$ 的谱 $\sigma(A)$ 中的元素对应于测量值。

**公理 149.3**（测量 / Born 法则）：在态 $\rho$ 中测量可观测量 $A$，结果在 Borel 集 $E \subseteq \mathbb{R}$ 中的概率为 $\mathbb{P}(E) = \operatorname{Tr}(\rho P_A(E))$，其中 $P_A$ 是 $A$ 的谱测度（投影值测度，PVM）。

**公理 149.4**（时间演化 / Schrödinger 方程）：态的时间演化由

$$i\hbar \frac{d}{dt}|\psi(t)\rangle = \hat{H} |\psi(t)\rangle$$

其中 $\hat{H}$ 是 Hamilton 算子（自伴算子）。形式解为 $|\psi(t)\rangle = e^{-i\hat{H}t/\hbar} |\psi(0)\rangle$。

*导出概要*：由量子化条件 $[\hat{x}, \hat{p}] = i\hbar$ 出发。将经典 Hamilton 函数 $H(p, q)$ 中的变量提升为 $\mathcal{H}$ 上的自伴算子，得到 Hamilton 算子 $\hat{H}$。Schrödinger 方程 $i\hbar \frac{d}{dt}|\psi(t)\rangle = \hat{H}|\psi(t)\rangle$ 是量子化的直接结果。形式解为 $|\psi(t)\rangle = e^{-i\hat{H}t/\hbar}|\psi(0)\rangle$。∎

**定理 149.1**（Stone 定理）：时间演化 $U(t) = e^{-i\hat{H}t/\hbar}$ 是 $\mathcal{H}$ 上的强连续酉算子群。

**公理 149.5**（复合系统）：若系统 $A$ 和 $B$ 的 Hilbert 空间分别为 $\mathcal{H}_A$ 和 $\mathcal{H}_B$，则复合系统的 Hilbert 空间为 $\mathcal{H}_A \otimes \mathcal{H}_B$（张量积）。

### 149.2 谱理论在量子力学中的应用

**定义 149.1**（谱分解）：由谱定理，自伴算子 $\hat{A}$ 有谱分解

$$\hat{A} = \int_{\sigma(\hat{A})} \lambda \, dP_A(\lambda)$$

**例 149.1**（位置与动量算子）：在 $L^2(\mathbb{R})$ 上，
- 位置算子：$(\hat{x}\psi)(x) = x\psi(x)$
- 动量算子：$(\hat{p}\psi)(x) = -i\hbar \frac{d\psi}{dx}$

**定理 149.2**（正则对易关系 / CCR）：$[\hat{x}, \hat{p}] = i\hbar \hat{I}$。

**定理 149.3**（Stone-von Neumann 定理）：CCR 的不可约表示在酉等价意义下唯一，即标准 Schrödinger 表示。

**定理 149.4**（Heisenberg 不确定性原理）：对任意态 $|\psi\rangle$ 和可观测量 $A, B$，

$$\Delta_\psi(A) \cdot \Delta_\psi(B) \geq \frac{1}{2} |\langle \psi | [A, B] | \psi \rangle|$$

特别地，$\Delta x \cdot \Delta p \geq \frac{\hbar}{2}$。

*证明*：由 Cauchy-Schwarz 不等式和自伴算子的性质。∎

### 149.3 几个精确可解的自伴算子谱问题

**例 149.2**（调和振子型 Hamilton 算子）：$\hat{H} = \frac{\hat{p}^2}{2} + \frac{1}{2}\omega^2\hat{x}^2$。引入升降算子 $a = \sqrt{\frac{\omega}{2\hbar}}(\hat{x} + \frac{i}{\omega}\hat{p})$，$a^\dagger = \sqrt{\frac{\omega}{2\hbar}}(\hat{x} - \frac{i}{\omega}\hat{p})$。$[a, a^\dagger] = 1$。$\hat{H} = \hbar\omega(a^\dagger a + \frac{1}{2})$。谱为 $E_n = \hbar\omega(n + \frac{1}{2})$，$n = 0, 1, 2, \ldots$。

**例 149.3**（Coulomb 型 Hamilton 算子）：$\hat{H} = -\frac{\hbar^2}{2}\nabla^2 - \frac{1}{r}$。利用 $SO(3)$ 对称性分离变量求解。谱为 $E_n = -\frac{1}{2n^2}$（$n = 1, 2, \ldots$，采用原子单位）。简并度 $n^2$ 由 $SO(4)$ 对称性解释（Lenz-Runge 向量对应的隐藏对称性）。

### 149.4 量子力学的 C*-代数表述

**定义 149.2**（量子力学的代数方法）：量子系统的可观测量构成 C*-代数 $\mathfrak{A}$（或 von Neumann 代数）。态是 $\mathfrak{A}$ 上的正线性泛函 $\omega$（$\omega(1) = 1$）。GNS 构造将代数态转化为 Hilbert 空间表示。

**定理 149.5**（Gelfand-Naimark-Segal 构造）：对 C*-代数 $\mathfrak{A}$ 上的任意态 $\omega$，存在 Hilbert 空间 $\mathcal{H}_\omega$、表示 $\pi_\omega: \mathfrak{A} \to \mathcal{B}(\mathcal{H}_\omega)$ 和循环向量 $\Omega_\omega$，使得 $\omega(A) = \langle \Omega_\omega | \pi_\omega(A) | \Omega_\omega \rangle$。

### 149.5 Maxwell 方程组与外微分

**定理 149.6**（Maxwell 方程组的微分形式表述）：

$$\nabla \cdot \mathbf{E} = \rho, \quad \nabla \cdot \mathbf{B} = 0$$

$$\nabla \times \mathbf{E} = -\frac{\partial \mathbf{B}}{\partial t}, \quad \nabla \times \mathbf{B} = \mathbf{J} + \frac{\partial \mathbf{E}}{\partial t}$$

引入四维势 $A^\mu = (\phi, \mathbf{A})$ 和场强张量 $F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu$，Maxwell 方程组可紧凑地写为 $\partial_\mu F^{\mu\nu} = J^\nu$ 和 $\partial_{[\lambda}F_{\mu\nu]} = 0$。这是 $U(1)$ 规范场的经典原型，也是外微分 $dF = 0$ 和 $d * F = *J$ 的具体实现。∎

---

---

## 第150章：量子场论数学引论
量子场论（QFT）是纤维丛上变分问题的核心实例，其数学框架包含路径积分的测度论表述和公理化场论（Wightman 公理、Osterwalder-Schrader 重构定理）。本章介绍 QFT 的数学结构。

### 150.1 自由量子场

**定义 150.1**（Klein-Gordon 场）：自由标量场 $\phi(x, t)$ 满足 Klein-Gordon 方程

$$\partial_\mu \partial^\mu \phi + m^2 \phi = 0$$

即 $(\square + m^2)\phi = 0$。

**定义 150.2**（正则量子化）：将场 $\phi(x)$ 和共轭动量 $\pi(x) = \partial_t \phi(x)$ 提升为算子值分布，满足等时对易关系：

$$[\phi(x, t), \pi(y, t)] = i\hbar \delta(x - y)$$

**定义 150.3**（Fock 空间）：自由量子场的状态空间是 Fock 空间 $\mathcal{F} = \bigoplus_{n=0}^\infty \mathcal{H}^{\otimes_s n}$（玻色子）或 $\mathcal{F} = \bigoplus_{n=0}^\infty \mathcal{H}^{\wedge n}$（费米子）。$\mathcal{H} = L^2(\mathbb{R}^3, d^3p/2E_p)$ 是单粒子 Hilbert 空间。

**定理 150.1**（Wightman 公理）：相对论量子场论应满足：
1. 存在 Hilbert 空间 $\mathcal{H}$ 和 Poincaré 群的酉表示 $U(a, \Lambda)$
2. 存在唯一的真空态 $\Omega$（Poincaré 不变）
3. 场 $\phi(f)$（$f \in \mathcal{S}(\mathbb{R}^4)$）是 $\mathcal{H}$ 上的算子值缓增分布
4. 谱条件：能量-动量算子的谱在向前光锥内
5. 微观因果性：若 $f$ 和 $g$ 的支集类空分离，则 $[\phi(f), \phi(g)] = 0$（玻色子）或 $\{\phi(f), \phi(g)\} = 0$（费米子）
6. 循环性：$\{\phi(f_1)\cdots\phi(f_n)\Omega\}$ 在 $\mathcal{H}$ 中稠密

### 150.2 路径积分

**定义 150.4**（Feynman 路径积分）：量子力学中的传播子可形式地表为

$$\langle x_f | e^{-i\hat{H}T/\hbar} | x_i \rangle = \int_{x(0)=x_i}^{x(T)=x_f} \mathcal{D}x(t) \, e^{iS[x]/\hbar}$$

其中 $S[x]$ 是经典作用量，$\mathcal{D}x(t)$ 是形式上的「路径测度」。

**定义 150.5**（Wick 旋转与 Euclidean QFT）：做 Wick 旋转 $t \to -i\tau$，将 Minkowski 时空变为 Euclidean 时空。路径积分变为

$$Z = \int \mathcal{D}\phi \, e^{-S_E[\phi]/\hbar}$$

其中 $S_E[\phi] = \int d^4x \left( \frac{1}{2}(\partial_\mu\phi)^2 + \frac{1}{2}m^2\phi^2 + V(\phi) \right)$ 是 Euclidean 作用量。

**定理 150.2**（Osterwalder-Schrader 重构定理，1973-1975）：满足 Osterwalder-Schrader 公理的 Euclidean 关联函数可以通过解析延拓唯一地重构满足 Wightman 公理的相对论量子场论。

### 150.3 规范场论

**定义 150.6**（Yang-Mills 理论）：规范群 $G$（如 $SU(3) \times SU(2) \times U(1)$）的 Yang-Mills 作用量为

$$S_{YM}[A] = -\frac{1}{4} \int d^4x \, \operatorname{Tr}(F_{\mu\nu}F^{\mu\nu})$$

其中 $F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu + [A_\mu, A_\nu]$ 是规范场强，$A_\mu$ 取值于 $G$ 的李代数。

**定理 150.3**（Yang-Mills 存在性与质量间隙 / Clay 问题）：证明对任意紧致单纯规范群 $G$，$\mathbb{R}^4$ 上的量子 Yang-Mills 理论存在，且具有质量间隙 $\Delta > 0$。这是七大千禧年问题之一，尚未解决。

**定义 150.7**（BRST 量子化）：使用 BRST 对称性（Becchi-Rouet-Stora-Tyutin）处理规范对称性的量子化。引入鬼场（ghost fields）和 BRST 算子 $Q$，物理态空间为 $Q$-上同调 $\ker Q / \operatorname{im} Q$。

**定理 150.4**（Higgs 机制）：在规范场与标量场耦合时，若标量场的真空期望值非零，则规范对称性自发破缺，规范玻色子获得质量。这是电弱统一理论的核心。

---

---

## 第151章：广义相对论数学基础
广义相对论的数学框架是伪 Riemann 几何（Lorentz 流形），其 Einstein 场方程可从 Einstein-Hilbert 作用量的变分原理导出。本章建立度规、曲率张量、Einstein 方程及奇点定理等核心数学结构。

### 151.1 Lorentz 流形与时空

**定义 151.1**（时空）：**时空**是四维 Lorentz 流形 $(M, g)$，其中 $g$ 是 Lorentz 度量（符号差 $(-, +, +, +)$ 或 $(+, -, -, -)$）。每点的切空间 $T_pM$ 被光锥分为类时、类光和类空向量。

**定义 151.2**（测地线）：类时测地线满足

$$\frac{d^2 x^\mu}{d\tau^2} + \Gamma^\mu_{\nu\rho} \frac{dx^\nu}{d\tau} \frac{dx^\rho}{d\tau} = 0$$

其中 $\tau$ 是仿射参数，$\Gamma^\mu_{\nu\rho}$ 是 Christoffel 符号。

**定义 151.3**（Riemann 曲率张量）：曲率描述了时空的弯曲程度：

$$R^\rho_{\sigma\mu\nu} = \partial_\mu \Gamma^\rho_{\nu\sigma} - \partial_\nu \Gamma^\rho_{\mu\sigma} + \Gamma^\rho_{\mu\lambda}\Gamma^\lambda_{\nu\sigma} - \Gamma^\rho_{\nu\lambda}\Gamma^\lambda_{\mu\sigma}$$

**Ricci 张量**：$R_{\mu\nu} = R^\rho_{\mu\rho\nu}$，**标量曲率**：$R = g^{\mu\nu}R_{\mu\nu}$。

### 151.2 Einstein 场方程

**定理 151.1**（Einstein 场方程）：

$$R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu} + \Lambda g_{\mu\nu} = \kappa T_{\mu\nu}$$

其中 $T_{\mu\nu}$ 是能动张量（源项），$\Lambda$ 是宇宙学常数，$\kappa$ 是耦合常数。

**定义 151.4**（Einstein-Hilbert 作用量）：Einstein 方程可由变分原理导出。作用量为

$$S = \frac{1}{2\kappa} \int_M (R - 2\Lambda) \sqrt{-g} \, d^4x + S_{\text{matter}}$$

**定理 151.2**（Bianchi 恒等式的几何意义）：$\nabla^\mu G_{\mu\nu} = 0$（其中 $G_{\mu\nu} = R_{\mu\nu} - \frac{1}{2}R g_{\mu\nu}$ 是 Einstein 张量），这是微分几何的 Bianchi 恒等式 $\nabla_{[\lambda} R_{\mu\nu]\rho\sigma} = 0$ 的推论，保证了能动张量的协变守恒 $\nabla^\mu T_{\mu\nu} = 0$。

### 151.3 经典精确解

**例 151.1**（Schwarzschild 解）：球对称真空解（$\Lambda = 0$）：

$$ds^2 = -\left(1 - \frac{2M}{r}\right)dt^2 + \left(1 - \frac{2M}{r}\right)^{-1} dr^2 + r^2 d\Omega^2$$

在 $r = r_s = 2M$（Schwarzschild 半径）处，度规有坐标奇异性（事件视界）。

**定理 151.3**（Birkhoff 定理）：Schwarzschild 解是球对称真空 Einstein 方程的唯一解。

**例 151.2**（Kerr 解）：轴对称真空解，由参数 $M$ 和 $a$ 参数化。Kerr 度规包含事件视界和能层（ergosphere）结构。

**例 151.3**（FLRW 解）：均匀各向同性度规：

$$ds^2 = -dt^2 + a(t)^2 \left[ \frac{dr^2}{1 - k r^2} + r^2 d\Omega^2 \right]$$

其中 $a(t)$ 是尺度因子，$k = -1, 0, 1$ 对应三种常曲率空间。Friedmann 方程：

$$\left(\frac{\dot{a}}{a}\right)^2 = \frac{\rho}{3} - \frac{k}{a^2} + \frac{\Lambda}{3}$$

### 151.4 奇点定理

**定义 151.5**（测地不完备性与奇点）：**奇点**定义为测地线不完备性——时空无法沿测地线延拓。

**定理 151.4**（Penrose 奇点定理）：若时空包含捕获面（trapped surface），且满足零能量条件 $T_{\mu\nu}k^\mu k^\nu \geq 0$（对所有类光向量 $k$），则存在不完备的类光测地线。

**定理 151.5**（Hawking 奇点定理）：在满足适当能量条件的时空中，过去的类时测地不完备性不可避免。

**定理 151.6**（黑洞热力学四定律 / Bardeen-Carter-Hawking）：
- 第零定律：稳态黑洞视界上的表面引力 $\kappa$ 为常数
- 第一定律：$dM = \frac{\kappa}{8\pi} dA + \Omega dJ + \Phi dQ$
- 第二定律：视界面积 $A$ 满足 $\delta A \geq 0$
- 第三定律：不可能通过有限步骤使 $\kappa$ 达到零

### 151.5 线性化引力与渐近平坦时空

**定义 151.7**（线性化 Einstein 方程）：线性化 $g_{\mu\nu} = \eta_{\mu\nu} + h_{\mu\nu}$（$|h_{\mu\nu}| \ll 1$）在 Lorentz 规范下给出波动方程 $\square \bar{h}_{\mu\nu} = -2\kappa T_{\mu\nu}$。真空中 $\square \bar{h}_{\mu\nu} = 0$。

**定理 151.7**（Bondi-Sachs 质量）：对渐近平坦时空，在类光无穷远 $\mathscr{I}^+$ 处可定义 Bondi 质量，其变化率等于辐射携带的能量通量。

**定义 151.8**（ADM 质量 / Arnowitt-Deser-Misner）：对渐近平坦时空，在类空无穷远处定义的总能量（ADM 质量）为

$$M_{ADM} = \frac{1}{2\kappa} \lim_{r \to \infty} \int_{S^2_r} (\partial_j h_{ij} - \partial_i h_{jj}) n^i \, dA$$

**定理 151.8**（正质量定理 / Schoen-Yau, Witten）：若时空满足主导能量条件，则 $M_{ADM} \geq 0$，且 $M_{ADM} = 0$ 当且仅当时空是 Minkowski 时空。

---

---

## 第152章：共形场论
共形场论（CFT）研究具有共形对称性的量子场论，是二维场论和无穷维 Lie 代数表示论的核心工具。其基本框架建立在 Virasoro 代数上：能量-动量张量的 Laurent 展开系数 $L_n$ 满足对易关系 $[L_m, L_n] = (m-n)L_{m+n} + \frac{c}{12}m(m^2-1)\delta_{m+n,0}$，其中中心荷 $c$ 刻画了量子反常。主场（primary field）$\phi$ 由共形权 $(h, \bar{h})$ 标记，满足 $L_0|\phi\rangle = h|\phi\rangle$。算子乘积展开（OPE）描述了场在短距离下的奇异性结构。极小模型对中心荷 $c < 1$ 进行了完整分类，其 $c = 1 - \frac{6}{m(m+1)}$（$m=3,4,\ldots$），对应可解格点模型的临界行为。CFT 通过状态-算子对应建立了二维共形场论的代数结构。

---

---

## 第153章：可积系统与可解模型
可积系统是具有"足够多"守恒量的动力系统，其关键在于Lax对形式化：将非线性演化方程表示为算子方程$\frac{\partial L}{\partial t} = [M, L]$，其中$L$和$M$是依赖于位势的线性算子。此形式化保证了$\operatorname{tr}(L^n)$的守恒性。反散射方法（IST）将非线性PDE的初值问题转化为线性散射问题，基本步骤为：(i)以初值构造散射数据；(ii)散射数据的时间演化是平凡的；(iii)通过Gel'fand-Levitan-Marchenko积分方程重构位势。经典例子包括KdV方程$u_t + 6uu_x + u_{xxx} = 0$（Lax对$L = -\partial_x^2 - u, M = -4\partial_x^3 - 6u\partial_x - 3u_x$）和Toda链。Yang-Baxter方程$R_{12}R_{13}R_{23} = R_{23}R_{13}R_{12}$是可积格点模型（如六顶角模型、XXZ自旋链）的核心，它保证了多体散射的因子化性质。

---

---

## 第154章：重正化群
重正化群是研究多尺度系统的数学框架，核心在于动量壳层积分和 beta 函数 $\beta(g) = \mu \frac{dg}{d\mu}$ 描述的耦合常数流。beta 函数的零点称为固定点（fixed point），固定点的稳定性决定了临界指数。所有在同一固定点吸引域内的理论属于同一个普适类（universality class），具有相同的临界指数。这一框架为不同微观系统在临界点附近的普适标度行为提供了统一的数学解释。

---

---

## 第155章：Vlasov-Maxwell 系统的数学理论
本章研究耦合 PDE 系统的数学结构。**核心方程**：（1）**Vlasov 方程**——相空间分布函数 $f(t, x, v)$ 的输运方程：$\partial_t f + v \cdot \nabla_x f + F \cdot \nabla_v f = 0$，该方程是无穷维 Hamilton 系统（由 Morrison-Marsden-Weinstein 括号刻画）；（2）**磁流体动力学方程（MHD）**——耦合 Navier-Stokes 方程和 Maxwell 方程的非线性 PDE 系统；（3）**Landau 阻尼**——线性化 Vlasov-Poisson 方程的 Laplace 变换分析表明电场扰动代数衰减，相位混合导致的这种渐近行为由 Mouhot-Villani (2011) 在半线性水平严格证明；（4）**Grad-Shafranov 方程**——非线性椭圆 PDE $\Delta^* \psi = -r^2 \frac{dp}{d\psi} - \frac{1}{2} \frac{dF^2}{d\psi}$，其解的存在性和分岔由变分方法保证。

---


---

---

## 第360章（补充）
> 量子信息科学研究信息在量子力学框架下的数学表示与处理，其数学基础涉及 Hilbert 空间、算子理论、张量积和群表示论。量子纠缠是张量积结构中不可分解的态，量子算法（Shor、Grover）在计算复杂性上体现了量子模型的优势。本卷在量子力学数学基础（V30 Ch 149）和泛函分析（V14 Ch 73-Hilbert 空间）的基础上，系统建立量子态与测量公理、纠缠理论、量子信道、量子算法和量子纠错码的数学理论。

---

---

## 第262章：量子力学的信息论公理
量子力学可以用信息论的语言重新表述，将量子态视为信息载体，其数学结构是 Hilbert 空间上的密度算子和完全正映射。

### 262.1 量子态与密度矩阵

**定义 262.1**（量子态 / Quantum State）：量子态由单位向量 $|\psi\rangle \in \mathcal{H}$（Hilbert 空间）表示（模相位：$|\psi\rangle$ 和 $e^{i\theta}|\psi\rangle$ 表示同一态）。$\dim \mathcal{H} = d$。

**定义 262.2**（密度矩阵 / Density Matrix）：**密度算子** $\rho$ 是 $\mathcal{H}$ 上的正半定迹为 1 的算子：
$$\rho \geq 0, \quad \operatorname{Tr}(\rho) = 1$$

纯态：$\rho = |\psi\rangle\langle\psi|$；混合态：$\rho = \sum_i p_i |\psi_i\rangle\langle\psi_i|$（$p_i > 0$，$\sum p_i = 1$）。

**定义 262.3**（复合系统与张量积）：两个系统 $\mathcal{H}_A$ 和 $\mathcal{H}_B$ 的复合系统为 $\mathcal{H}_A \otimes \mathcal{H}_B$。子系统 $\rho_A$ 的**约化密度矩阵**为 $\rho_A = \operatorname{Tr}_B(\rho_{AB})$（部分迹）。

### 262.2 量子测量

**定义 262.4**（投影测量 / von Neumann 测量）：由可观测量的谱分解 $M = \sum_m m P_m$ 定义。测量结果 $m$ 的概率为 $\operatorname{Tr}(\rho P_m)$，测量后状态退相为 $P_m \rho P_m / \operatorname{Tr}(\rho P_m)$。

**定义 262.5**（POVM / 正算子值测度）：**POVM** 是一组正算子 $\{E_m\}$ 满足 $\sum_m E_m = I$。结果 $m$ 的概率为 $\operatorname{Tr}(\rho E_m)$。POVM 推广了投影测量，适用于非理想测量和信息最优获取。

**定理 262.1**（Naimark 扩张定理）：任何 POVM 可由更大 Hilbert 空间上的投影测量实现。即 POVM 测量等价于扩展系统后的投影测量。

### 262.3 量子比特与 Bloch 球

**定义 262.6**（量子比特 / Qubit）：$\mathcal{H} = \mathbb{C}^2$。纯态 $|\psi\rangle = \alpha|0\rangle + \beta|1\rangle$（$|\alpha|^2 + |\beta|^2 = 1$）。任意单量子比特密度矩阵可写为

$$\rho = \frac{1}{2}(I + \mathbf{r} \cdot \boldsymbol{\sigma})$$

其中 $\mathbf{r} \in \mathbb{R}^3$（Bloch 向量）满足 $|\mathbf{r}| \leq 1$，$\boldsymbol{\sigma} = (\sigma_x, \sigma_y, \sigma_z)$ 为 Pauli 矩阵。纯态对应 $|\mathbf{r}| = 1$（Bloch 球面）。


### 262.4 量子隐形传态的代数结构

量子隐形传态（Bennett et al. 1993）利用纠缠态和经典通信传输量子态，其代数结构可表述为 Bell 基测量和 Pauli 校正的对应关系。

**协议步骤**：方 $A$ 欲向方 $B$ 传输未知态 $|\psi\rangle = \alpha|0\rangle + \beta|1\rangle$。双方预先共享 EPR 对 $|\Phi^+\rangle = \frac{1}{\sqrt{2}}(|00\rangle + |11\rangle)$。总初态为：

$$|\psi\rangle_A \otimes |\Phi^+\rangle_{AB} = (\alpha|0\rangle + \beta|1\rangle)_A \otimes \frac{1}{\sqrt{2}}(|00\rangle + |11\rangle)_{AB}$$

**步骤 1**：方 $A$ 对持有的两个量子比特施加 CNOT 门（控制位为其未知态）和 Hadamard 门，将总态重写为 Bell 基的展开：

$$\frac{1}{2}\sum_{k=0}^{3} |\text{Bell}_k\rangle_A \otimes \sigma_k (\alpha|0\rangle + \beta|1\rangle)_B$$

其中 $\sigma_0 = I$、$\sigma_1 = X$、$\sigma_2 = Z$、$\sigma_3 = XZ$ 为 Pauli 算子。

**步骤 2**：方 $A$ 对自身两量子比特做 Bell 基测量，得到结果 $k \in \{00, 01, 10, 11\}$（2 比特经典信息）。测量后方 $B$ 的量子比特塌缩为 $\sigma_k|\psi\rangle$。

**步骤 3**：方 $A$ 通过经典信道将 $k$ 发送给方 $B$。方 $B$ 根据 $k$ 施加相应的 Pauli 校正门 $\sigma_k^\dagger$，恢复出 $|\psi\rangle$。

**注**：隐形传态不违反不可克隆定理——方 $A$ 手中的原始态在 Bell 测量中被破坏，信息通过经典信道传递，且协议消耗了一个 EPR 对。

---

---

## 第263章：量子纠缠
量子纠缠是多个子系统之间不可分解的量子关联，是张量积结构中的本质特征。

### 263.1 纠缠的定义与判定

**定义 263.1**（可分态与纠缠态）：两体态 $\rho_{AB}$ 是**可分的**（separable），如果可写为直积态的凸组合：
$$\rho_{AB} = \sum_i p_i \rho_A^{(i)} \otimes \rho_B^{(i)}$$

否则 $\rho_{AB}$ 是**纠缠的**。可分态对应经典关联，纠缠态是量子独有的。

**定理 263.1**（PPT 判据 / Peres-Horodecki 判据，1996）：若 $\rho_{AB}$ 可分，则其部分转置 $\rho_{AB}^{T_B}$（仅对子系统 $B$ 取转置）是正半定的。对 $2 \otimes 2$ 和 $2 \otimes 3$ 系统，PPT 条件是纠缠的必要充分条件。

**定义 263.2**（纠缠目击 / Entanglement Witness）：Hermitian 算子 $W$ 满足 $\operatorname{Tr}(W \rho_{\text{sep}}) \geq 0$（对所有可分态），且存在纠缠态 $\rho_{\text{ent}}$ 使 $\operatorname{Tr}(W \rho_{\text{ent}}) < 0$。$W$「目击」了 $\rho_{\text{ent}}$ 的纠缠性。

### 263.2 纠缠度量

**定义 263.3**（纠缠熵 / Von Neumann 熵）：对纯态 $|\psi\rangle_{AB}$，**纠缠熵** $E(|\psi\rangle) = S(\rho_A) = S(\rho_B)$，其中 von Neumann 熵 $S(\rho) = -\operatorname{Tr}(\rho \log \rho)$。纠缠熵衡量了子系统混合的程度。

**定义 263.4**（形成纠缠 / Entanglement of Formation）：两体混合态 $\rho_{AB}$ 的**形成纠缠**为
$$E_F(\rho) = \inf \left\{ \sum_i p_i S(\rho_A^{(i)}) : \rho = \sum_i p_i |\psi_i\rangle\langle\psi_i| \right\}$$

即分解为纯态的最小平均纠缠熵（为 $2 \otimes 2$ 状态可解析计算，Wootters 1998）。

**定理 263.2**（纠缠的不可增性 / LOCC 单调性）：纠缠在**局部操作与经典通信**（LOCC）下不会增加。任何合理的纠缠度量必须是 LOCC 单调的。这是纠缠作为资源的基本性质。

### 263.3 Bell 不等式与非局域性

**定义 263.5**（Bell-CHSH 不等式 / Clauser-Horne-Shimony-Holt）：对二元测量 $A, A'$（方 $A$ 端）和 $B, B'$（方 $B$ 端），任何经典局域隐变量理论满足
$$|\langle AB \rangle + \langle AB' \rangle + \langle A'B \rangle - \langle A'B' \rangle| \leq 2$$

量子纠缠态可违反此界，最大值可达 $2\sqrt{2}$（Tsirelson 界）。

**定理 263.3**（Tsirelson 界）：量子力学中 CHSH 表达式的最大值为 $2\sqrt{2}$。这严格小于无信号条件下代数学的最大值 $4$（Popescu-Rohrlich 盒），表明量子非局域性比一般无信号理论弱。

---

---

## 第264章：量子信道与量子容量
量子信道描述了量子信息传输的数学模型，刻画为完全正保迹映射（CPTP）。

### 264.1 量子信道

**定义 264.1**（量子信道 / 完全正保迹映射 / CPTP Map）：量子信道 $\mathcal{E}: \mathcal{B}(\mathcal{H}_A) \to \mathcal{B}(\mathcal{H}_B)$ 是线性映射，满足：
- **保迹**（trace-preserving）：$\operatorname{Tr}(\mathcal{E}(\rho)) = \operatorname{Tr}(\rho)$
- **完全正**（completely positive / CP）：对任意扩展系统 $R$，$\mathcal{E} \otimes \operatorname{id}_R$ 保持正定性

**定理 264.1**（Kraus 表示 / 算子和表示）：任何 CPTP 映射 $\mathcal{E}$ 可表示为
$$\mathcal{E}(\rho) = \sum_{k=1}^K A_k \rho A_k^\dagger$$

其中 Kraus 算子 $A_k$ 满足 $\sum_k A_k^\dagger A_k = I$。

**定义 264.2**（Stinespring 膨胀定理）：任何 CPTP 映射 $\mathcal{E}$ 可用更大大 Hilbert 空间中的酉演化 $U$ 和环境初态 $|0\rangle_E$ 实现：$\mathcal{E}(\rho) = \operatorname{Tr}_E(U (\rho \otimes |0\rangle\langle 0|_E) U^\dagger)$。这是量子信道的纯化表示。

### 264.2 典型量子信道

**定义 264.3**（常见量子噪声信道）：
- **去极化信道**（depolarizing）：$\mathcal{E}(\rho) = (1-p)\rho + \frac{p}{d} I$
- **幅值阻尼信道**（amplitude damping）：模拟 $|1\rangle \to |0\rangle$ 的衰变过程
- **相位阻尼信道**（dephasing）：消灭非对角元，模拟信息丢失：$\mathcal{E}(\rho) = (1-p)\rho + p \operatorname{diag}(\rho)$

### 264.3 量子信道容量

**定义 264.4**（量子信道容量的分类）：
- **经典容量** $C(\mathcal{E})$：通过信道可靠传输经典信息的最大速率
- **量子容量** $Q(\mathcal{E})$：通过信道可靠传输量子信息的最大速率
- **私密容量** $P(\mathcal{E})$：信道可用于秘密共享的容量
- **纠缠辅助容量** $C_E(\mathcal{E})$：收发双方共享无限纠缠时传输经典信息的容量

**定理 264.2**（Holevo-Schumacher-Westmoreland 定理 / HSW 定理，1996-1998）：量子信道 $\mathcal{E}$ 的经典容量为
$$C(\mathcal{E}) = \lim_{n \to \infty} \frac{1}{n} \chi(\mathcal{E}^{\otimes n})$$

其中 **Holevo 量** $\chi(\mathcal{E}) = \max_{\{p_i, \rho_i\}} [S(\mathcal{E}(\sum_i p_i \rho_i)) - \sum_i p_i S(\mathcal{E}(\rho_i))]$。

**注 264.1**（Holevo 界的简要推导）：对于发送方以概率 $p_i$ 制备状态 $\rho_i$、接收方通过 POVM $\{E_m\}$ 测量的经典通信场景，设输入随机变量为 $X$，测量结果为 $Y$。经典互信息 $I(X:Y)$ 受限于 Holevo 界：
$$\chi = S\left(\sum_i p_i \rho_i\right) - \sum_i p_i S(\rho_i)$$
推导关键：由量子相对熵的单调性（Lindblad-Uhlmann 定理），对任意 POVM 测量，经典互信息不超过 Holevo 量；再由 HSW 定理，该上界在 $n \to \infty$ 的意义下可由适当的编码方案渐近达到。Holevo 界的本质是 $S(\rho) - \sum_i p_i S(\rho_i)$ 度量了"量子态集合的可区分性"——它是量子信息论中经典容量的单次使用上界，比经典 Shannon 信道容量多了 von Neumann 熵的凹性修正项。当输入为纯态且相互正交时，Holevo 量达到最大值 $\log d$。∎

**定理 264.3**（Lloyd-Shor-Devetak 定理 / LSD 定理）：量子信道的量子容量为相干信息的正则化极限：
$$Q(\mathcal{E}) = \lim_{n \to \infty} \frac{1}{n} I_c(\mathcal{E}^{\otimes n})$$

其中**相干信息** $I_c(\mathcal{E}) = \max_{\rho} [S(\mathcal{E}(\rho)) - S(\mathcal{E} \otimes \operatorname{id}_R(|\psi\rangle\langle\psi|_{\rho R}))]$。

---

---

## 第265章：量子算法
量子算法利用 Hilbert 空间上的酉变换（叠加、干涉和纠缠）实现特定计算任务的加速。

### 265.1 量子计算模型

**定义 265.1**（量子电路模型）：$n$ 个量子比特初始化为 $|0^n\rangle$。应用酉门序列（$H$、$T$、CNOT 等通用门集合），最后测量得到结果。量子电路是经典电路对应的量子推广。

**定义 265.2**（通用量子门集合 / quantum gate universality）：
$$\{H, T, \operatorname{CNOT}\}$$

（$H$ 为 Hadamard 门，$T = \operatorname{diag}(1, e^{i\pi/4})$，CNOT 为受控非门）是近似通用的——任何 $n$ 量子比特酉变换可被 $O(4^n \log(1/\varepsilon))$ 个门 $\varepsilon$-逼近（Solovay-Kitaev 定理）。

**定义 265.3**（量子 Fourier 变换 / QFT）：$n$ 量子比特的量子 Fourier 变换 $\operatorname{QFT}_N$（$N=2^n$）：
$$|j\rangle \mapsto \frac{1}{\sqrt{N}} \sum_{k=0}^{N-1} e^{2\pi i jk / N} |k\rangle$$

QFT 可在 $O(n^2)$ 个门内实现（经典 FFT 需 $O(n 2^n)$）。

### 265.2 Shor 算法与 Grover 算法

**定理 265.1**（Shor 的因式分解算法）：存在量子算法在 $O((\log N)^3)$ 时间内分解 $N$ 位整数（以高概率）。核心步骤：用量子 Fourier 变换求模 $N$ 指数 $f(x) = a^x \bmod N$ 的周期（量子周期求取），然后用数论从周期推因子。

**定理 265.2**

**推导概要**（Shor 算法的核心步骤）：

1. **约化到周期求取**：随机选取 $a$（$1 < a < N$，$\gcd(a, N) = 1$）。若 $\gcd(a, N) > 1$ 则已完成分解。考虑函数 $f(x) = a^x \bmod N$，其周期 $r$ 满足 $a^r \equiv 1 \pmod{N}$。若 $r$ 为偶数且 $a^{r/2} \not\equiv -1 \pmod{N}$，则 $\gcd(a^{r/2} \pm 1, N)$ 给出 $N$ 的非平凡因子。

2. **量子周期求取**：用 $n = 2\lceil \log_2 N \rceil$ 个辅助量子比特制备叠加态 $\frac{1}{\sqrt{M}}\sum_{x=0}^{M-1} |x\rangle|0\rangle$（$M = 2^n$），Oracle 计算 $f(x)$：$\frac{1}{\sqrt{M}}\sum_x |x\rangle|f(x)\rangle$。对辅助寄存器做 QFT 并测量，得到 $\frac{1}{\sqrt{M}}\sum_x e^{2\pi i s x / M}|x\rangle$，其中 $s \approx \frac{kM}{r}$（$k$ 为某整数）。测量结果给出 $s/M \approx k/r$。

3. **连分式算法**：从测量值 $s/M$ 用连分式展开求得 $r$（以高概率）。复杂度：QFT 需 $O(n^2)$ 个量子门，连分式 $O(n^3)$ 经典运算，总体 $O((\log N)^3)$。
（Grover 的搜索算法，1996）：在 $N$ 个未排序元素中找标记元素，Grover 算法使用 $O(\sqrt{N})$ 次查询（经典需要 $O(N)$）。算法核心是反复应用 **Grover 迭代** $G = H^{\otimes n} (2|0\rangle\langle 0| - I) H^{\otimes n} \cdot O_f$（$O_f$ 为标记元素的谕示），将状态向标记方向旋转。

**定理 265.3**（BBBV 定理 / 量子查询下界，Bennett-Bernstein-Brassard-Vazirani 1997）：量子计算机搜索 $N$ 个元素至少需要 $\Omega(\sqrt{N})$ 次查询。Grover 算法是最优的。

### 265.3 量子复杂性类

**定义 265.4**（量子复杂性类）：
- **BQP**：被多项式时间量子电路以有界误差判定的语言类
- **QMA**：量子模拟 NP——多项式时间量子验证者可验证的「量子证明」

**定理 265.4**（BQP 的位置）：BPP $\subseteq$ **BQP** $\subseteq$ PSPACE（Bernstein-Vazirani 1993）。已知 BQP 包含因式分解和离散对数问题，但不知道 BQP 是否包含 NP 完全问题。

---

---

## 第266章：量子纠错与容错量子计算
量子纠错是量子计算容错性的数学基础，它通过编码和校正克服量子态的退相干效应。

### 266.1 量子纠错原理

**定义 266.1**（量子纠错码 / Quantum Error-Correcting Code）：$[[n, k, d]]$ 量子码将 $k$ 个逻辑量子比特编码为 $n$ 个物理量子比特，可纠正任意 $\lfloor (d-1)/2 \rfloor$ 个量子比特上的错误（包括相位错误和比特翻转错误）。

**定理 266.1**（量子纠错条件 / Knill-Laflamme 条件，1997）：一组错误算子 $\{E_a\}$ 可被码 $C$（投影 $P$）纠正当且仅当
$$P E_a^\dagger E_b P = \lambda_{ab} P$$

对所有 $a, b$，$\lambda_{ab}$ 是 Hermitian 矩阵。这是经典纠错条件 $\mathbf{1}^T H E_a^T E_b \mathbf{1} = \lambda_{ab}$ 的量子推广。

**定义 266.2**（稳定子码 / Stabilizer Code，Gottesman 1997）：**稳定子码**由 Pauli 群的 Abel 子群 $S$（稳定子）的公共 +1 本征空间定义。著名的 Shor 码 $[[9, 1, 3]]$ 和 CSS 码都是稳定子码。

**定理 266.2**（CSS 构造 / Calderbank-Shor-Steane 1996）：若存在经典线性码 $C_1 = [n, k_1, d_1]$ 和 $C_2 = [n, k_2, d_2]$ 满足 $C_2^\perp \subseteq C_1$，则可构造量子 CSS 码 $[[n, k_1 - k_2, \min(d_1, d_2)]]$。

### 266.2 表面码与容错阈值

**定义 266.3**（表面码 / Surface Code, Kitaev / Bravyi-Kitaev）：在 $L \times L$ 二维格子上定义的稳定子码。距离 $d = L$，每个格点上 4 体或 2 体测量。**容错阈值**：若每个物理门的错误率低于阈值 $p_{\text{th}}$，则增加 $L$（扩大码距）可使逻辑错误率指数衰减。

**定理 266.3**（阈值定理 / Aharonov-Ben-Or / Kitaev / Knill-Laflamme-Zurek）：若物理量子门的错误率低于某个常数阈值，则原则上可以进行任意长的容错量子计算。证明方法在于使用量子纠错码的分级编码（concatenation）。

### 266.3 拓扑量子计算

**定义 266.4**（anyons 与拓扑量子计算）：二维系统中的 anyons（既非玻色子也非费米子）的**编织操作**（braiding）构成量子门。非 Abelian anyons（如 Majorana 零模、Ising anyons、Fibonacci anyons）的编织是实现拓扑保护量子门的一种途径。

**定理 266.4**（Fibonacci anyons 的通用性）：Fibonacci anyons 的编织操作可近似实现任意单量子比特门和 CNOT 门，从而是通用的拓扑量子计算模型。这是通过编织群在量子比特空间上的稠密性保证的（类似于 Solovay-Kitaev 定理）。

---

*本卷在量子力学数学基础（V30）和泛函分析（V14）的基础上，系统建立了量子态与测量公理、量子纠缠理论、量子信道与容量、量子算法和量子纠错与容错计算的数学理论。共 5 章。*

*本卷从变分原理出发，建立了 Euler-Lagrange 方程、Hamilton 方程与辛几何、Noether 定理、Hilbert 空间上自伴算子的谱理论、纤维丛上的变分问题（场论）、伪 Riemann 几何、共形场论、可积系统、重正化群和 Vlasov-Maxwell 系统的数学理论。**补充部分**从算子代数角度审视量子信息理论：Hilbert 空间上的密度矩阵与 CPTP 映射给出了量子操作的谱表示，von Neumann 熵与量子相对熵建立了量子信息度量的公理基础，量子纠错码的稳定子形式将纠错问题转化为线性代数约束，算子代数（C*-代数、von Neumann 代数）为量子多体系统和量子场论提供了严格数学框架。*


*卷二十九：数学物理方法终。*
