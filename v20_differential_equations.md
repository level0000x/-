# 卷二十：微分方程

## 第204章：常微分方程基础
本章从 ODE 的基本理论出发，重点讨论初值问题解的存在性、唯一性以及对参数和初始条件的连续依赖性。

### 89.1 基本概念

**定义 89.1**（ODE 系统）：一阶 ODE 系统的**初值问题**（IVP）为

$$\begin{cases} \mathbf{x}'(t) = \mathbf{f}(t, \mathbf{x}(t)) \\ \mathbf{x}(t_0) = \mathbf{x}_0 \end{cases}$$

其中 $\mathbf{f}: U \subseteq \mathbb{R} \times \mathbb{R}^n \to \mathbb{R}^n$ 是给定的向量场，$\mathbf{x}_0 \in \mathbb{R}^n$ 是初始条件。

**定义 89.2**（解）：区间 $I \subseteq \mathbb{R}$ 上的可微函数 $\mathbf{x}: I \to \mathbb{R}^n$ 称为 IVP 的**解**，如果 $\mathbf{x}(t_0) = \mathbf{x}_0$ 且对所有 $t \in I$，$(t, \mathbf{x}(t)) \in U$ 且 $\mathbf{x}'(t) = \mathbf{f}(t, \mathbf{x}(t))$。

**定义 89.3**（$n$ 阶 ODE）：$n$ 阶 ODE $y^{(n)} = f(t, y, y', \ldots, y^{(n-1)})$ 可通过引入 $x_1 = y$，$x_2 = y'$，$\ldots$，$x_n = y^{(n-1)}$ 化为一阶系统。

### 89.2 Picard-Lindelöf 定理

**定义 89.4**（Lipschitz 条件）：$\mathbf{f}: U \to \mathbb{R}^n$ 称为关于 $\mathbf{x}$ **局部 Lipschitz** 的，如果对每个紧子集 $K \subseteq U$，存在常数 $L_K > 0$ 使得

$$\|\mathbf{f}(t, \mathbf{x}_1) - \mathbf{f}(t, \mathbf{x}_2)\| \leq L_K \|\mathbf{x}_1 - \mathbf{x}_2\|$$

对所有 $(t, \mathbf{x}_1), (t, \mathbf{x}_2) \in K$ 成立。

**定理 89.1**（Picard-Lindelöf 定理，局部存在唯一性）：设 $\mathbf{f}$ 在包含 $(t_0, \mathbf{x}_0)$ 的开集上连续，且关于 $\mathbf{x}$ 局部 Lipschitz。则存在 $\delta > 0$，使得 IVP 在 $[t_0 - \delta, t_0 + \delta]$ 上有唯一解。

*证明*：将 IVP 转化为积分方程 $\mathbf{x}(t) = \mathbf{x}_0 + \int_{t_0}^t \mathbf{f}(s, \mathbf{x}(s)) ds$。定义 Picard 迭代：$\mathbf{x}_0(t) = \mathbf{x}_0$，$\mathbf{x}_{n+1}(t) = \mathbf{x}_0 + \int_{t_0}^t \mathbf{f}(s, \mathbf{x}_n(s)) ds$。在充分小的区间上，$C([t_0 - \delta, t_0 + \delta], \mathbb{R}^n)$ 中赋予上确界范数，Picard 迭代是压缩映射。由 Banach 不动点定理（压缩映射原理），存在唯一不动点。∎

**定理 89.2**（Peano 存在定理）：若 $\mathbf{f}$ 仅连续（不要求 Lipschitz），则 IVP 至少有一个解（但不一定唯一）。例如 $\dot{x} = 2\sqrt{|x|}$，$x(0) = 0$ 有无穷多解。

**定理 89.3**（连续依赖性）：设 $\mathbf{f}$ 连续且关于 $\mathbf{x}$ 局部 Lipschitz。则解 $\mathbf{x}(t; t_0, \mathbf{x}_0)$ 在其存在区间内连续依赖于初始条件 $(t_0, \mathbf{x}_0)$。

*证明*：使用 Gronwall 不等式。设 $\mathbf{x}_1, \mathbf{x}_2$ 是两个不同初值的解，则 $\|\mathbf{x}_1(t) - \mathbf{x}_2(t)\| \leq \|\mathbf{x}_1(0) - \mathbf{x}_2(0)\| e^{L|t|}$。∎

### 89.3 解的延拓与极大解

**定义 89.5**（极大解）：IVP 的**极大解**是定义在极大存在区间 $I_{\max}$ 上的解，不能延拓到更大的区间上。

**命题 89.4**（极大解的存在性）：若 $\mathbf{f}$ 连续且局部 Lipschitz，则每个 IVP 有唯一的极大解。

**定理 89.5**（解的爆破判别）：若极大解的存在区间 $I_{\max} = (T_-, T_+)$ 有限（即 $T_+ < \infty$），则当 $t \to T_+^-$ 时，$\|\mathbf{x}(t)\| \to \infty$ 或 $(t, \mathbf{x}(t))$ 趋于 $U$ 的边界。

*证明*：若 $\|\mathbf{x}(t)\|$ 有界且 $(t, \mathbf{x}(t))$ 不趋于边界，则 $\mathbf{x}(t)$ 有收敛子列，由局部存在性可延拓解，与极大性矛盾。∎

### 89.4 自治系统与相平面分析

**定义 89.6**（自治系统）：ODE 系统 $\mathbf{x}' = \mathbf{f}(\mathbf{x})$（$\mathbf{f}$ 不显含 $t$）称为**自治系统**。

**定义 89.7**（相图）：自治系统的**相图**是 $\mathbb{R}^n$ 中全体轨道的集合。轨道 $\{\mathbf{x}(t) : t \in I_{\max}\}$ 是相空间中的曲线。

**定义 89.8**（平衡点）：$\mathbf{x}_*$ 称为**平衡点**（或不动点），如果 $\mathbf{f}(\mathbf{x}_*) = 0$。平衡点对应于常数解。

**定义 89.9**（二维线性系统的分类）：对于线性系统 $\dot{\mathbf{x}} = A\mathbf{x}$（$A \in \mathbb{R}^{2 \times 2}$），平衡点 $\mathbf{0}$ 的类型由 $A$ 的特征值 $\lambda_1, \lambda_2$ 决定：

| 特征值类型 | 平衡点类型 |
|-----------|-----------|
| $\lambda_1 < \lambda_2 < 0$ | 稳定结点 |
| $0 < \lambda_1 < \lambda_2$ | 不稳定结点 |
| $\lambda_1 < 0 < \lambda_2$ | 鞍点 |
| $\lambda = \alpha \pm i\beta$，$\alpha < 0$ | 稳定焦点 |
| $\lambda = \alpha \pm i\beta$，$\alpha > 0$ | 不稳定焦点 |
| $\lambda = \pm i\beta$（纯虚数） | 中心 |

**命题 89.5**（相平面分析的关键步骤）：对非线性自治系统 $\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x})$：
1. **求平衡点**：解 $\mathbf{f}(\mathbf{x}) = \mathbf{0}$。
2. **线性化**：在每个平衡点处计算 Jacobi 矩阵 $D\mathbf{f}$，求特征值并分类（结点、鞍点、焦点、中心）。
3. **双曲平衡点的局部行为**：若 $\Re(\lambda) \neq 0$，由 Hartman-Grobman 定理，局部相图拓扑等价于线性化系统。
4. **零实部特征值的中心流形**：若存在纯虚数特征值，线性化不能确定稳定性，需在中心流形上约化分析非线性项。
5. **全局相图**：绘制零倾线（nullclines，即 $\dot{x}_1 = 0$ 和 $\dot{x}_2 = 0$ 的曲线），确定各区域中的向量场方向，用 Poincaré-Bendixson 定理判断周期轨的存在性。

---

---

---

---

---

## 第205章：线性ODE系统
线性 ODE 系统可借助矩阵指数和线性代数（V7）的工具完全求解。本章重点讨论常系数系统和稳定性理论。

### 90.1 矩阵指数

**定义 90.1**（矩阵指数）：对 $A \in M_n(\mathbb{C})$，定义

$$e^{tA} = \sum_{k=0}^\infty \frac{t^k A^k}{k!}$$

此级数对任意 $t \in \mathbb{R}$ 绝对收敛（在任意矩阵范数下）。

**命题 90.1**（矩阵指数的性质）：
1. $e^{0A} = I$
2. $\frac{d}{dt} e^{tA} = A e^{tA} = e^{tA} A$
3. 若 $AB = BA$，则 $e^{A+B} = e^A e^B$
4. $e^{tA}$ 可逆，$(e^{tA})^{-1} = e^{-tA}$
5. 若 $A = PJP^{-1}$（$J$ 为 Jordan 标准形），则 $e^{tA} = P e^{tJ} P^{-1}$

**定理 90.2**（线性系统的解）：IVP $\dot{\mathbf{x}} = A\mathbf{x}$，$\mathbf{x}(0) = \mathbf{x}_0$ 的唯一解为

$$\mathbf{x}(t) = e^{tA} \mathbf{x}_0$$

非齐次系统 $\dot{\mathbf{x}} = A\mathbf{x} + \mathbf{b}(t)$ 的解由常数变易公式给出：

$$\mathbf{x}(t) = e^{tA} \mathbf{x}_0 + \int_0^t e^{(t-s)A} \mathbf{b}(s) ds$$

*证明*：$\frac{d}{dt} e^{tA} \mathbf{x}_0 = A e^{tA} \mathbf{x}_0 = A\mathbf{x}(t)$，且 $\mathbf{x}(0) = \mathbf{x}_0$。唯一性由 Picard-Lindelöf 定理保证。∎

### 90.2 常系数线性系统的稳定性

**定义 90.2**（Lyapunov 稳定性）：设 $\mathbf{x}_*$ 是 $\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x})$ 的平衡点。
- $\mathbf{x}_*$ 是**稳定**的（Lyapunov 意义下），如果对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得 $\|\mathbf{x}(0) - \mathbf{x}_*\| < \delta$ 推出 $\|\mathbf{x}(t) - \mathbf{x}_*\| < \varepsilon$（对所有 $t \geq 0$）
- $\mathbf{x}_*$ 是**渐近稳定**的，如果它稳定且 $\lim_{t \to \infty} \mathbf{x}(t) = \mathbf{x}_*$
- $\mathbf{x}_*$ 是**指数稳定**的，如果存在 $C, \alpha > 0$ 使得 $\|\mathbf{x}(t) - \mathbf{x}_*\| \leq C e^{-\alpha t} \|\mathbf{x}(0) - \mathbf{x}_*\|$

**定理 90.3**（线性稳定性）：对线性系统 $\dot{\mathbf{x}} = A\mathbf{x}$：
- $\mathbf{0}$ 渐近稳定（实际上指数稳定）当且仅当 $A$ 的所有特征值满足 $\Re(\lambda) < 0$
- $\mathbf{0}$ 稳定当且仅当 $A$ 的所有特征值满足 $\Re(\lambda) \leq 0$，且满足 $\Re(\lambda) = 0$ 的特征值对应大小为 $1 \times 1$ 的 Jordan 块
- $\mathbf{0}$ 不稳定当且仅当存在特征值 $\Re(\lambda) > 0$（或 $\Re(\lambda) = 0$ 但 Jordan 块大小 > 1）

**定理 90.4**（线性化稳定性，Hartman-Grobman 定理）：设 $\mathbf{x}_*$ 是 $\dot{\mathbf{x}} = \mathbf{f}(\mathbf{x})$ 的平衡点，$\mathbf{f}$ 是 $C^1$ 的。若 $A = D\mathbf{f}(\mathbf{x}_*)$ 的所有特征值满足 $\Re(\lambda) \neq 0$（双曲平衡点），则非线性系统在 $\mathbf{x}_*$ 附近拓扑共轭于其线性化系统 $\dot{\mathbf{y}} = A\mathbf{y}$。

*证明思路*：不妨设 $\mathbf{x}_* = 0$，将系统写为 $\dot{\mathbf{x}} = A\mathbf{x} + \mathbf{g}(\mathbf{x})$，其中 $\mathbf{g}(0)=0$，$D\mathbf{g}(0)=0$。核心是构造同胚 $H = \operatorname{id} + \mathbf{h}$ 满足 $H \circ e^{tA} = \varphi_t \circ H$（$\varphi_t$ 是非线性流）。将 $\mathbf{g}$ 分解为稳定部分和不稳定部分的贡献。利用双曲性（$\Re(\lambda) \neq 0$），线性流 $e^{tA}$ 具有指数二分性：稳定子空间上的压缩和不稳定子空间上的扩张。对给定的 $\mathbf{g}$（在 $C^1$ 小邻域中截断），用压缩映射原理在适当的函数空间中求解不变叶层方程 $\mathbf{h}(A\mathbf{x} + \mathbf{g}(\mathbf{x})) = A\mathbf{h}(\mathbf{x}) + \mathbf{g}(\mathbf{x} + \mathbf{h}(\mathbf{x}))$。截断的 $\mathbf{g}$ 在原点附近与原系统一致，而远离原点处的修正不影响局部拓扑共轭性。∎

### 90.3 Lyapunov 函数

**定义 90.3**（Lyapunov 函数）：设 $\mathbf{x}_*$ 是平衡点。$C^1$ 函数 $V: \mathcal{U} \to \mathbb{R}$（$\mathcal{U}$ 是 $\mathbf{x}_*$ 的邻域）称为 **Lyapunov 函数**，如果 $V(\mathbf{x}_*) = 0$，$V(\mathbf{x}) > 0$（$\mathbf{x} \neq \mathbf{x}_*$），且沿轨道 $\dot{V}(\mathbf{x}) = \nabla V(\mathbf{x}) \cdot \mathbf{f}(\mathbf{x}) \leq 0$。

**定理 90.5**（Lyapunov 稳定性定理）：
1. 若存在 Lyapunov 函数，则 $\mathbf{x}_*$ 是稳定的
2. 若进一步 $\dot{V}(\mathbf{x}) < 0$（$\mathbf{x} \neq \mathbf{x}_*$），则 $\mathbf{x}_*$ 是渐近稳定的

*证明*：由 $V$ 沿轨道递减，$\|\mathbf{x}(t) - \mathbf{x}_*\|$ 有界。若 $\dot{V} < 0$，则轨道趋于 $\mathbf{x}_*$。∎

---

---

---

---

---

## 第206章：偏微分方程基础
偏微分方程涉及多个自变量，其理论比 ODE 复杂得多。本章从一阶 PDE 和分类入手，引入特征线法。

### 91.1 基本概念与分类

**定义 91.1**（PDE）：**偏微分方程**（PDE）是包含未知函数 $u(x_1, \ldots, x_n)$ 及其偏导数的方程。**阶数**是出现的最高阶偏导数。

**定义 91.2**（二阶线性 PDE）：一般的二阶线性 PDE 为

$$\sum_{i,j=1}^n a_{ij}(x) \frac{\partial^2 u}{\partial x_i \partial x_j} + \sum_{i=1}^n b_i(x) \frac{\partial u}{\partial x_i} + c(x) u = f(x)$$

其中 $a_{ij} = a_{ji}$。

**定义 91.3**（二阶 PDE 的分类）：在点 $x$ 处，根据系数矩阵 $A = (a_{ij}(x))$ 的特征值符号分类：
- **椭圆型**：$A$ 的所有特征值同号（或 $A$ 正定/负定）。例：Laplace 方程 $\Delta u = 0$
- **抛物型**：$A$ 有一个零特征值，其余同号。例：热方程 $u_t = \Delta u$
- **双曲型**：$A$ 有一个特征值与其余符号相反。例：波动方程 $u_{tt} = \Delta u$

### 91.2 一阶 PDE 与特征线法

**定义 91.4**（一阶拟线性 PDE）：一阶拟线性 PDE 的形式为

$$a(x, y, u) \frac{\partial u}{\partial x} + b(x, y, u) \frac{\partial u}{\partial y} = c(x, y, u)$$

**定理 91.1**（特征线法）：上述 PDE 的解曲面由特征线 ODE 系统生成：

$$\frac{dx}{dt} = a(x, y, u), \quad \frac{dy}{dt} = b(x, y, u), \quad \frac{du}{dt} = c(x, y, u)$$

其中 $u(t) = u(x(t), y(t))$。沿特征线，PDE 约化为 ODE。

*证明*：由链式法则，$\frac{du}{dt} = \frac{\partial u}{\partial x} \frac{dx}{dt} + \frac{\partial u}{\partial y} \frac{dy}{dt} = a \frac{\partial u}{\partial x} + b \frac{\partial u}{\partial y} = c$。∎

**例 91.1**（输运方程）：$u_t + c u_x = 0$（$c$ 为常数）的通解为 $u(x, t) = f(x - ct)$，其中 $f$ 由初始条件确定。特征线是 $x - ct = \text{const}$。

**例 91.2**（Burgers 方程）：$u_t + u u_x = 0$。特征线为 $x = u_0(x_0) t + x_0$。即使初始条件光滑，特征线也可能相交，导致激波（shock wave）的形成。

### 91.3 适定性

**定义 91.5**（适定性，Hadamard）：PDE 问题称为**适定的**，如果
1. 解存在
2. 解唯一
3. 解连续依赖于数据（初始条件、边界条件、方程系数）

典型的适定问题：
- **椭圆型**：Dirichlet 问题（给定边界值）或 Neumann 问题（给定法向导数）
- **抛物型**：初边值问题（给定初始条件和边界条件）
- **双曲型**：初值问题（Cauchy 问题，给定初始位置和速度）

### 91.4 分离变量法

分离变量法是求解线性齐次 PDE 初边值问题的经典方法，其核心思想是将多变量函数的解分解为单变量函数的乘积，从而将 PDE 约化为若干 ODE。

**一般步骤**：
1. **分离假设**：设解具有乘积形式 $u(x, t) = X(x) T(t)$（以两变量为例），代入齐次 PDE。
2. **变量分离**：将方程整理为"仅含 $x$ 的函数 = 仅含 $t$ 的函数"的形式，由于两边独立变量不同，必须等于同一常数 $-\lambda$（分离常数）。
3. **化为 ODE**：得到关于 $X(x)$ 和 $T(t)$ 的两个常微分方程 $X'' + \lambda X = 0$ 和 $T' + \lambda k T = 0$（具体形式取决于 PDE 类型），并配以相应的齐次边界条件。
4. **求解特征值问题**：由 $X(x)$ 的 ODE 与齐次边界条件构成 Sturm-Liouville 特征值问题，求出特征值 $\lambda_n$ 和特征函数 $X_n(x)$。
5. **叠加原理**：通解为所有分离解的线性叠加 $u(x, t) = \sum_n c_n X_n(x) T_n(t)$，系数 $c_n$ 由初始条件通过特征函数的正交性（Fourier 级数展开）确定。

该方法成功的关键在于 PDE 和边界条件均为线性齐次的，从而叠加原理成立。对于非齐次情形，可结合特征函数展开法或 Duhamel 原理处理。

---

---

---

---

---

## 第207章：椭圆、抛物与双曲型方程
本章具体讨论三大经典 PDE：Laplace 方程、热方程和波动方程，给出基本解和能量方法。

### 92.1 Laplace 方程与 Poisson 方程

**定义 92.1**（Laplace 算子）：$\mathbb{R}^n$ 中的 **Laplace 算子**（Laplacian）为 $\Delta = \sum_{i=1}^n \frac{\partial^2}{\partial x_i^2}$。

**定义 92.2**（调和函数）：$C^2$ 函数 $u$ 称为**调和函数**，如果 $\Delta u = 0$。

**定理 92.1**（基本解）：$\mathbb{R}^n$ 中 Laplace 方程的基本解为

$$\Phi(x) = \begin{cases} -\frac{1}{2\pi} \log |x| & n = 2 \\ \frac{1}{n(n-2)\omega_n} |x|^{2-n} & n \geq 3 \end{cases}$$

其中 $\omega_n$ 是 $\mathbb{R}^n$ 中单位球的体积。$\Phi$ 满足 $\Delta \Phi = \delta_0$（在分布意义下）。

**定理 92.2**（调和函数的均值性质）：若 $u$ 在 $B(x, r) \subset \mathbb{R}^n$ 中调和，则

$$u(x) = \frac{1}{|\partial B(x, r)|} \int_{\partial B(x, r)} u(y) dS(y) = \frac{1}{|B(x, r)|} \int_{B(x, r)} u(y) dy$$

*证明*：由散度定理，$\frac{d}{dr} \left(\frac{1}{|\partial B(x, r)|} \int_{\partial B(x, r)} u(y) dS(y)\right) = 0$，故球面平均值为常数。令 $r \to 0$ 得 $u(x)$。∎

**推论 92.3**（极大值原理）：调和函数在区域内部不能取到严格极大值或极小值（除非为常数）。$\max_{\overline{\Omega}} |u| = \max_{\partial\Omega} |u|$。

**定理 92.4**（Poisson 方程的解）：Poisson 方程 $-\Delta u = f$ 在 $\mathbb{R}^n$ 中的一个解为

$$u(x) = (\Phi * f)(x) = \int_{\mathbb{R}^n} \Phi(x - y) f(y) dy$$

### 92.2 热方程

**定义 92.3**（热方程）：热方程（扩散方程）为 $u_t - \Delta u = 0$。

**定义 92.4**（热核 / 基本解）：$\mathbb{R}^n$ 中热方程的基本解（热核）为

$$\Phi(x, t) = \frac{1}{(4\pi t)^{n/2}} e^{-|x|^2 / (4t)} \quad (t > 0)$$

$\Phi$ 满足 $\Phi_t - \Delta \Phi = 0$（$t > 0$）且 $\lim_{t \to 0^+} \Phi(\cdot, t) = \delta_0$。

**定理 92.5**（初值问题的解）：$\mathbb{R}^n$ 中热方程初值问题 $u_t = \Delta u$，$u(x, 0) = g(x)$ 的解为

$$u(x, t) = (\Phi(\cdot, t) * g)(x) = \frac{1}{(4\pi t)^{n/2}} \int_{\mathbb{R}^n} e^{-|x-y|^2/(4t)} g(y) dy$$

**定理 92.6**（无穷传播速度与极大值原理）：热方程的解具有无穷传播速度（初始扰动瞬间影响全空间）。对热方程，有极大值原理：

$$\max_{\overline{\Omega} \times [0, T]} u = \max\{\max_{\overline{\Omega}} u(\cdot, 0), \max_{\partial\Omega \times [0, T]} u\}$$

即最大值在初始时刻或边界上达到（抛物型极大值原理）。

### 92.3 波动方程

**定义 92.5**（波动方程）：波动方程为 $u_{tt} - c^2 \Delta u = 0$（$c > 0$ 是波速）。

**定理 92.7**（d'Alembert 公式，一维）：一维波动方程 $u_{tt} = c^2 u_{xx}$，$u(x, 0) = g(x)$，$u_t(x, 0) = h(x)$ 的解为

$$u(x, t) = \frac{1}{2}[g(x + ct) + g(x - ct)] + \frac{1}{2c} \int_{x-ct}^{x+ct} h(s) ds$$

*证明*：做变量变换 $\xi = x + ct$，$\eta = x - ct$，方程化为 $u_{\xi\eta} = 0$，通解为 $u = F(\xi) + G(\eta)$。由初始条件确定 $F$ 和 $G$。∎

**定理 92.8**（Kirchhoff 公式，三维）：三维波动方程的解为

$$u(x, t) = \frac{1}{4\pi c^2 t} \iint_{\partial B(x, ct)} h(y) dS(y) + \frac{\partial}{\partial t}\left(\frac{1}{4\pi c^2 t} \iint_{\partial B(x, ct)} g(y) dS(y)\right)$$

（球面均值法）。三维波动方程满足 Huygens 原理（强形式）：扰动沿球面传播，有清晰的前后波阵面。

**定理 92.9**（能量守恒）：对波动方程 $u_{tt} = \Delta u$（在有界区域 $\Omega$ 上，齐次边界条件），能量

$$E(t) = \frac{1}{2} \int_\Omega (u_t^2 + |\nabla u|^2) dx$$

是守恒量：$\frac{dE}{dt} = 0$。

*证明*：$\frac{dE}{dt} = \int_\Omega (u_t u_{tt} + \nabla u \cdot \nabla u_t) dx = \int_\Omega u_t(u_{tt} - \Delta u) dx + \int_{\partial\Omega} u_t \frac{\partial u}{\partial n} dS = 0$。∎

---

---

---

---

---

## 第208章：Sobolev 空间与弱解
现代 PDE 理论的核心工具是 Sobolev 空间。它将经典导数推广为弱导数（分布导数），使得在更广的函数空间中寻找 PDE 的解成为可能。

### 93.1 弱导数与 Sobolev 空间

**定义 93.1**（弱导数）：设 $\Omega \subseteq \mathbb{R}^n$ 是开集，$u \in L^1_{\text{loc}}(\Omega)$。$u$ 的**弱导数**（或分布导数）$v = D^\alpha u$（$L^1_{\text{loc}}(\Omega)$ 中）满足

$$\int_\Omega u D^\alpha \varphi \, dx = (-1)^{|\alpha|} \int_\Omega v \varphi \, dx \quad \text{对所有 } \varphi \in C_c^\infty(\Omega)$$

其中 $D^\alpha \varphi$ 是 $\varphi$ 的经典 $\alpha$ 阶偏导数。

**定义 93.2**（Sobolev 空间）：对 $1 \leq p \leq \infty$ 和整数 $k \geq 0$，**Sobolev 空间** $W^{k,p}(\Omega)$ 定义为

$$W^{k,p}(\Omega) = \{u \in L^p(\Omega) : D^\alpha u \in L^p(\Omega) \text{ 对所有 } |\alpha| \leq k\}$$

范数为 $\|u\|_{W^{k,p}} = \left(\sum_{|\alpha| \leq k} \|D^\alpha u\|_{L^p}^p\right)^{1/p}$（$p < \infty$）。$H^k(\Omega) = W^{k,2}(\Omega)$ 是 Hilbert 空间。

**命题 93.1**：$W^{k,p}(\Omega)$ 是 Banach 空间。$H^k(\Omega)$ 是 Hilbert 空间，内积为 $(u, v)_{H^k} = \sum_{|\alpha| \leq k} \int_\Omega D^\alpha u \cdot D^\alpha v \, dx$。

### 93.2 Sobolev 嵌入定理

**定理 93.2**（Sobolev 嵌入定理）：设 $\Omega \subseteq \mathbb{R}^n$ 是有 Lipschitz 边界的有界开集，$1 \leq p < \infty$。

1. 若 $k p < n$，则 $W^{k,p}(\Omega) \hookrightarrow L^q(\Omega)$（连续嵌入），其中 $\frac{1}{q} = \frac{1}{p} - \frac{k}{n}$（Sobolev 共轭指数）
2. 若 $k p = n$，则 $W^{k,p}(\Omega) \hookrightarrow L^q(\Omega)$ 对所有 $q < \infty$ 成立
3. 若 $k p > n$，则 $W^{k,p}(\Omega) \hookrightarrow C^{0,\gamma}(\overline{\Omega})$（Hölder 连续函数空间），其中 $\gamma = k - n/p$（若 $k - n/p < 1$）

**定理 93.3**（Rellich-Kondrachov 紧嵌入）：在上述条件下，若 $k p < n$ 且 $1 \leq q < p^*$（$p^* = np/(n - kp)$），则嵌入 $W^{k,p}(\Omega) \hookrightarrow L^q(\Omega)$ 是紧的。

### 93.3 弱解与变分方法

**定义 93.3**（弱解）：考虑 Poisson 方程的 Dirichlet 问题：

$$-\Delta u = f \text{ 在 } \Omega \text{ 中}, \quad u = 0 \text{ 在 } \partial\Omega \text{ 上}$$

$u \in H_0^1(\Omega)$ 称为**弱解**，如果对任意 $v \in H_0^1(\Omega)$（$H_0^1$ 是 $C_c^\infty(\Omega)$ 在 $H^1$ 范数下的闭包），

$$\int_\Omega \nabla u \cdot \nabla v \, dx = \int_\Omega f v \, dx$$

**定理 93.4**（Lax-Milgram 定理）：设 $H$ 是 Hilbert 空间，$B: H \times H \to \mathbb{R}$ 是双线性型，满足：
- 有界性：$|B(u, v)| \leq M \|u\| \|v\|$
- 强制性：$B(u, u) \geq \alpha \|u\|^2$（$\alpha > 0$）

则对任意 $F \in H^*$（$H$ 的对偶空间），存在唯一的 $u \in H$ 使得 $B(u, v) = F(v)$ 对所有 $v \in H$ 成立。且 $\|u\| \leq \frac{1}{\alpha} \|F\|_{H^*}$。

*证明*：对固定 $u$，$v \mapsto B(u, v)$ 是 $H$ 上的有界线性泛函，由 Riesz 表示定理（V13 定理 73.1），存在 $Au \in H$ 使得 $B(u, v) = (Au, v)$。$A: H \to H$ 是有界线性算子，强制性推出 $A$ 可逆。∎

**定理 93.5**（Poisson 方程弱解的存在唯一性）：对 $f \in L^2(\Omega)$，Poisson 方程的 Dirichlet 问题存在唯一弱解 $u \in H_0^1(\Omega)$。

*证明*：定义双线性型 $B(u, v) = \int_\Omega \nabla u \cdot \nabla v \, dx$ 和线性泛函 $F(v) = \int_\Omega f v \, dx$。由 Poincaré 不等式，$B(u, u) = \|\nabla u\|_{L^2}^2 \geq C \|u\|_{H^1}^2$（强制性）。由 Lax-Milgram 定理即得。∎

### 93.4 正则性理论

**定理 93.6**（椭圆正则性）：设 $u \in H_0^1(\Omega)$ 是 $-\Delta u = f$ 的弱解，$\Omega$ 有光滑边界。
1. 若 $f \in L^2(\Omega)$，则 $u \in H^2(\Omega)$ 且 $\|u\|_{H^2} \leq C \|f\|_{L^2}$
2. 若 $f \in H^k(\Omega)$，则 $u \in H^{k+2}(\Omega)$
3. 若 $f \in C^\infty(\overline{\Omega})$，则 $u \in C^\infty(\overline{\Omega})$

由此，弱解在光滑数据下是经典解，PDE 的弱解理论与经典解理论一致。

**定理 93.7**（Weyl 引理）：若 $u \in L^1_{\text{loc}}(\Omega)$ 满足 $\int_\Omega u \Delta \varphi \, dx = 0$ 对所有 $\varphi \in C_c^\infty(\Omega)$，则 $u$（几乎处处等于）一个调和函数。即弱调和函数是经典调和函数。

---

---

---

---

---

## 第209章：D-模理论简介
D-模理论将线性偏微分方程的研究代数化，是代数几何、表示论和数学物理的重要工具。设$X$是光滑代数簇，记$\mathcal{D}_X$为$X$上的微分算子层，局部上同构于Weyl代数$\mathbb{C}[x_1,\ldots,x_n]\langle\partial_1,\ldots,\partial_n\rangle$（满足$[\partial_i, x_j] = \delta_{ij}$）。线性PDE系统$P_1u = \cdots = P_ku = 0$对应于左$\mathcal{D}_X$-模$\mathcal{M} = \mathcal{D}_X/(\mathcal{D}_X P_1 + \cdots + \mathcal{D}_X P_k)$，其解空间同构于$\operatorname{Hom}_{\mathcal{D}_X}(\mathcal{M}, \mathcal{O}_X)$。这一代数化使得上同调方法得以系统运用。$\mathcal{M}$的特征簇$\operatorname{Ch}(\mathcal{M})$是余切丛$T^*X$中的闭代数子集，描述了奇异性的相位空间分布；其维数由Bernstein不等式控制：$\dim \operatorname{Ch}(\mathcal{M}) \geq \dim X$。Riemann-Hilbert对应是D-模理论的巅峰：在$X$光滑时，正则奇点D-模的导出范畴与$\mathbb{C}$-perverse层的导出范畴等价，将分析的奇异性问题转化为拓扑的层论问题。在表示论中，Beilinson-Bernstein局部化定理将半单Lie代数的表示范畴实现为旗簇上D-模的范畴，为Kazhdan-Lusztig猜想提供了几何框架。

---

---

---

---

---

## 第210章：特殊方程与推广
### 94.1 Painleve方程

Painleve方程是六类二阶非线性常微分方程（P${}_{\rm I}$--P${}_{\rm VI}$），其核心特征是拥有 **Painleve性质**：所有可移动奇点（依赖于积分常数的奇点）仅为极点，无本性奇点或分支点。Painleve（1900）与 Gambier 系统分类了所有满足此性质的形如 $y'' = F(y', y, x)$ 的二阶方程，除经典可积者外恰有六族。最著名的为 P${}_{\rm I}$：$y'' = 6y^2 + x$ 和 P${}_{\rm II}$：$y'' = 2y^3 + xy + \alpha$，其解称为 Painleve超越函数。Painleve方程与完全可积系统深刻相关：KdV 方程等可积 PDE 的相似约化常导出 Painleve 方程；Ablowitz-Ramani-Segur（ARS）猜想以此为基础判断 PDE 的 Painleve 可积性。

### 94.2 泛函微分方程

泛函微分方程（FDE）是导数依赖于过去（甚至未来）状态的微分方程。最重要的子类——**时滞微分方程**——形如 $x'(t) = f(t, x(t), x(t-\tau))$（$\tau > 0$ 为时滞）。其基本理论使用步进法（method of steps）建立：将时间轴按 $\tau$ 分段，逐段转化为 ODE 求解，由此可得存在唯一性和连续依赖性。稳定性分析的核心工具是 **Lyapunov-Krasovskii 泛函方法**——构造依赖于状态历史 $x_t(\theta) = x(t+\theta)（\theta \in [-\tau,0])$ 的泛函 $V(x_t)$，使其沿解的导数为负定以判定渐近稳定性。在种群动力学中，时滞 Logistic 方程 $\dot{N} = rN(1 - N(t-\tau)/K)$ 可产生周期振荡；在神经网络中，Hopfield 模型的传输延迟 $\dot{u}_i = -u_i/\tau_i + \sum_j w_{ij} g(u_j(t-\delta_{ij}))$ 对网络动力学有本质影响。

---

---

---

---

---

## 第211章：混合型偏微分方程（Mixed-Type PDEs）
混合型偏微分方程在区域的某一部分为椭圆型，另一部分为双曲型，其典型代表是 **Tricomi 方程** $y u_{xx} + u_{yy} = 0$：当 $y > 0$ 时为椭圆型，$y < 0$ 时为双曲型，$y = 0$ 为抛物退化线。这类方程在跨音速空气动力学（无激波跨音速流动）中自然出现——描述流场从亚音速（椭圆区域）到超音速（双曲区域）的平缓过渡。**核心理论**：（1）**Tricomi 问题**——在混合区域上指定适定的边界条件（椭圆部分给 Dirichlet，双曲部分在两条特征线上分别给不同的条件），F. Tricomi (1923) 通过将问题化归为奇异积分方程证明了存在性；（2）**Frankl 问题**——推广的边界值问题，出现于跨音速喷管设计，要求解在退化线上连续但允许法向导数跳跃；（3）**Keldysh 型方程**——另类退化方向 $u_{xx} + y^m u_{yy} = 0$（$m$ 为奇数）及其奇异 Cauchy 问题。**现代进展**：Morawetz (1956) 用乘子法得到 Tricomi 问题解的先验估计；Lupo-Payne (2004) 使用变分方法和临界点理论处理非线性混合型方程。混合型 PDE 在跨音速流动、等离子体物理（磁面方程）和金融数学中有实际应用。

---

---

---

---

---

## 第212章：KAM 理论与自由边界问题
### 96.1 KAM 理论（Kolmogorov-Arnold-Moser）

KAM 理论是 Hamilton 动力系统微扰理论的核心成就，描述了近可积系统在微小扰动下拟周期运动的保持。**基本问题**：给定可积 Hamilton 系统 $H_0(I)$（作用量-角变量坐标，环面 $I \times \mathbb{T}^n$），当加入小扰动 $H_\epsilon = H_0(I) + \epsilon H_1(I, \theta)$ 后，哪些不变环面得以存留？

**定理 96.1**（Kolmogorov 定理，1954）：若 $H_0$ 非退化（$\det(\partial^2 H_0 / \partial I_i \partial I_j) \neq 0$），则对满足 Diophantine 条件

$$|k \cdot \omega| \geq \frac{\gamma}{\|k\|^\tau}, \quad \forall k \in \mathbb{Z}^n \setminus \{0\}$$

的频率 $\omega = \nabla H_0(I)$，相应的不变环面在充分小的 $\epsilon > 0$ 下扰动后仍然存在——仅发生微小形变，其频率集合具有正 Lebesgue 测度（当 $\epsilon \to 0$ 时测度趋于全测度）。

**定义 96.1**（Diophantine 条件）：频率向量 $\omega \in \mathbb{R}^n$ 称为 $(\gamma, \tau)$-Diophantine 的（$\gamma > 0$, $\tau > n-1$），若对任意非零整数向量 $k \in \mathbb{Z}^n$，有 $|k \cdot \omega| \geq \gamma \|k\|^{-\tau}$。满足此条件的频率集合在 $\mathbb{R}^n$ 中具有全测度。

**定理 96.2**（Arnold 扩散，1964）：未被 KAM 环面覆盖的相空间区域中存在极缓慢的扩散现象（速度为 $O(e^{-c/\epsilon})$），这是导致不变环面间"泄露"的核心机制。对于 $n \geq 3$ 自由度的系统，Arnold 证明了存在穿越由 KAM 环面形成的"网"的轨道链。

### 96.2 自由边界问题（Free Boundary Problems）

自由边界问题处理 PDE 的解域边界本身是未知的、由解决定的边值问题。

**定义 96.2**（Stefan 问题 / 冰-水相变）：热方程 $u_t = \Delta u$ 在固相/液相区域分别成立，在自由界面 $\Gamma(t)$ 上满足 Stefan 条件

$$[\nabla u \cdot \mathbf{n}] = L V_n$$

其中 $L > 0$ 为潜热，$V_n$ 为界面法向速度，$[\cdot]$ 表示界面两侧跳跃。一维 Stefan 问题的显式解（Neumann 解，1860 年代）由误差函数 $\operatorname{erf}$ 构成，自由边界以 $\sim\sqrt{t}$ 的速率移动。

**定义 96.3**（障碍问题 / Obstacle Problem）：给定障碍函数 $\psi$，求解 $u \geq \psi$ 满足

$$\Delta u \leq 0, \quad u \geq \psi, \quad (u - \psi) \Delta u = 0$$

其自由边界是接触集 $\Gamma = \partial \{u = \psi\} \cap \Omega$（即 $u = \psi$ 区域的拓扑边界）。

**定理 96.3**（Caffarelli 正则性定理，1977）：障碍问题的自由边界在除去一个低维奇异集之外是光滑的（$C^{1,\alpha}$），这为整个自由边界正则性理论奠定了基础。具体而言，自由边界点分为正则点（自由边界在该点附近为 $C^{1,\alpha}$ 超曲面）和奇点（可分类），后者的 Hausdorff 维数不超过 $n-2$。

**定义 96.4**（Hele-Shaw 流动）：描述两平行平板间粘性流体的界面演化。对 Hele-Shaw 胞腔，压强 $p$ 在流体区域满足 $\Delta p = 0$，在自由边界上 $p = 0$ 且法向速度 $V_n = -\partial p / \partial n$。其数学模型等价于 Laplacian 增长（DLA 的连续极限），小扰动下界面不稳定（Saffman-Taylor 指进现象）。

---

---

---

---

---

## 第213章：特殊函数与正交多项式
特殊函数是满足特定 ODE 并通过超几何级数表达的经典函数的统称，在数学物理和渐近分析中有核心应用。**核心类型**：（1）**$\Gamma$ 函数**：$\Gamma(z) = \int_0^\infty t^{z-1} e^{-t} dt$（$\operatorname{Re}(z) > 0$），解析延拓到 $\mathbb{C} \setminus \{0, -1, -2, \ldots\}$。满足 $\Gamma(z+1) = z\Gamma(z)$，$\Gamma(n) = (n-1)!$。**Weierstrass 无穷乘积**：$\frac{1}{\Gamma(z)} = z e^{\gamma z} \prod_{n=1}^\infty (1 + \frac{z}{n}) e^{-z/n}$（$\gamma$ 为 Euler 常数）。**Beta 函数** $B(\alpha, \beta) = \frac{\Gamma(\alpha)\Gamma(\beta)}{\Gamma(\alpha+\beta)}$。（2）**Bessel 函数**：Bessel 微分方程 $z^2 y'' + z y' + (z^2 - \nu^2) y = 0$ 的解。第一类 $J_\nu(z) = \sum_{k=0}^\infty \frac{(-1)^k}{k! \Gamma(k+\nu+1)} (\frac{z}{2})^{2k+\nu}$，第二类 $Y_\nu(z)$（Weber 函数）。（3）**超几何函数**：$_2F_1(a,b;c;z) = \sum_{n=0}^\infty \frac{(a)_n (b)_n}{(c)_n n!} z^n$，其中 $(q)_n = q(q+1)\cdots(q+n-1)$ 为 Pochhammer 符号，收敛半径 1。其满足超几何微分方程，是几乎所有经典特殊函数（如 Legendre、Chebyshev、Jacobi 多项式）的统一母体。

**正交多项式**是 $L^2([a,b], w(x)dx)$ 中通过 Gram-Schmidt 对 $\{1, x, x^2, \ldots\}$ 正交化构造的多项式系。**基本定理**（三项递推关系）：任意正测度生成的正交多项式系 $\{p_n(x)\}$ 满足 $x p_n(x) = p_{n+1}(x) + \alpha_n p_n(x) + \beta_n p_{n-1}(x)$（$\beta_n > 0$），该关系由谱定理和 Jacobi 矩阵刻画。**经典正交多项式分类**（Bochner, 1929）：仅有三类超几何型的正交多项式满足 Sturm-Liouville 问题——Jacobi（含 Gegenbauer、Legendre、Chebyshev）、Laguerre、Hermite。其生成函数、Rodrigues 公式和微分方程有统一结构。

---

---

---

---


*卷二十：微分方程终。*
