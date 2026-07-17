# 卷十一：微分几何

> 微分几何用微积分和线性代数的工具研究曲线、曲面以及更一般的微分流形的几何性质。本卷从经典曲线论和曲面论出发，逐步引入微分流形和 Riemann 几何的现代框架，最终以 Gauss-Bonnet 定理揭示曲率与拓扑的深层联系。

---

## 第62章：曲线论
曲线论研究 $\mathbb{R}^3$ 中曲线的局部几何性质，核心工具是 Frenet 标架和曲率不变量。

### 62.1 参数化曲线

**定义 62.1**（参数化曲线）：设 $I \subseteq \mathbb{R}$ 为区间。一个**参数化曲线**是一个光滑（$C^\infty$）映射 $\gamma: I \to \mathbb{R}^3$。$\gamma'(t)$ 称为曲线的**速度向量**，$\|\gamma'(t)\|$ 称为**速率**。

**定义 62.2**（正则曲线）：曲线 $\gamma$ 称为**正则的**，如果对所有 $t \in I$，$\gamma'(t) \neq 0$。

**定义 62.3**（重新参数化）：设 $\gamma: I \to \mathbb{R}^3$ 是正则曲线，$\varphi: J \to I$ 是光滑的微分同胚（$\varphi' \neq 0$）。则 $\tilde{\gamma} = \gamma \circ \varphi: J \to \mathbb{R}^3$ 称为 $\gamma$ 的**重新参数化**。

**定义 62.4**（弧长参数）：正则曲线 $\gamma: I \to \mathbb{R}^3$ 的**弧长函数**定义为

$$s(t) = \int_{t_0}^t \|\gamma'(u)\| du$$

若 $\|\gamma'(s)\| = 1$ 对所有 $s$ 成立，则称 $\gamma$ 以**弧长**为参数。此时 $\gamma'(s)$ 是曲线在 $\gamma(s)$ 处的**单位切向量**，记作 $T(s)$。

**命题 62.1**：每条正则曲线都可以重新参数化为弧长参数。

*证明*：由于 $\gamma$ 正则，$\|\gamma'(t)\| > 0$，故 $s(t)$ 严格单调递增，存在光滑逆函数 $t(s)$。令 $\tilde{\gamma}(s) = \gamma(t(s))$，则 $\|\tilde{\gamma}'(s)\| = \|\gamma'(t(s)) \cdot t'(s)\| = \|\gamma'(t(s))\| \cdot (1/\|\gamma'(t(s))\|) = 1$。∎

### 62.2 Frenet 标架

以下设 $\gamma(s)$ 以弧长为参数，$T(s) = \gamma'(s)$ 是单位切向量。

**定义 62.5**（曲率）：$\gamma$ 在 $s$ 处的**曲率**定义为 $\kappa(s) = \|T'(s)\| = \|\gamma''(s)\|$。

**定义 62.6**（主法向量）：若 $\kappa(s) > 0$，定义**主法向量** $N(s) = T'(s) / \kappa(s)$。则 $N(s)$ 是单位向量且垂直于 $T(s)$（因为 $\|T(s)\| = 1$ 蕴含 $T'(s) \cdot T(s) = 0$）。

**定义 62.7**（副法向量与挠率）：定义**副法向量** $B(s) = T(s) \times N(s)$。则 $\{T(s), N(s), B(s)\}$ 构成 $\mathbb{R}^3$ 的一组正交规范基，称为 $\gamma$ 在 $s$ 处的**Frenet 标架**。

**挠率** $\tau(s)$ 定义为 $\tau(s) = -B'(s) \cdot N(s)$。

**命题 62.2**：$B'(s) = -\tau(s) N(s)$。

*证明*：由 $B(s) \cdot B(s) = 1$ 得 $B'(s) \cdot B(s) = 0$。又 $B = T \times N$，故 $B' = T' \times N + T \times N' = \kappa N \times N + T \times N' = T \times N'$，因此 $B' \cdot T = 0$。于是 $B'$ 平行于 $N$，即 $B'(s) = -\tau(s) N(s)$。∎

**定理 62.3**（Frenet-Serret 公式）：

$$\begin{aligned}
T'(s) &= \kappa(s) N(s) \\
N'(s) &= -\kappa(s) T(s) + \tau(s) B(s) \\
B'(s) &= -\tau(s) N(s)
\end{aligned}$$

*证明*：第一式是曲率的定义。第三式是挠率的定义。对第二式，由 $N = B \times T$（注意 $T \times N = B$ 得 $N = B \times T$），求导：

$$N' = B' \times T + B \times T' = (-\tau N) \times T + B \times (\kappa N) = -\tau (N \times T) + \kappa (B \times N) = -\tau (-B) + \kappa (-T) = -\kappa T + \tau B$$

此处使用了 $N \times T = -B$，$B \times N = -T$。∎

**定理 62.4**（曲线论基本定理）：给定光滑函数 $\kappa(s) > 0$ 和 $\tau(s)$（$s \in I$），则存在唯一（在刚体运动意义下）的以弧长为参数的正则曲线 $\gamma: I \to \mathbb{R}^3$，以 $\kappa(s)$ 为曲率、$\tau(s)$ 为挠率。

*证明*：Frenet-Serret 公式构成关于 $(T, N, B)$ 的线性 ODE 系统。由 ODE 解的存在唯一性定理（V4 第 23 章的推广），给定初始条件 $(T(s_0), N(s_0), B(s_0))$ 为一个正交规范标架，存在唯一解。然后 $\gamma(s) = \gamma(s_0) + \int_{s_0}^s T(u) du$ 给出所需曲线。不同的初始条件对应于曲线的刚体运动。∎

**推论 62.5**：曲线的曲率和挠率是刚体运动不变量，且完全决定了曲线的形状。

### 62.3 平面曲线

**定义 62.8**（平面曲线）：若 $\gamma$ 的像落在某个平面内，则 $\gamma$ 称为**平面曲线**。

**命题 62.6**：$\gamma$ 是平面曲线当且仅当 $\tau(s) \equiv 0$。

*证明*：($\Rightarrow$) 若 $\gamma$ 是平面曲线，则 $T(s)$ 和 $N(s)$ 始终在该平面内，$B(s)$ 是常值单位法向量，故 $B'(s) = 0$，从而 $\tau(s) = 0$。

($\Leftarrow$) 若 $\tau \equiv 0$，则 $B(s)$ 是常值向量 $B_0$。由 $(T \cdot B_0)' = T' \cdot B_0 = \kappa N \cdot B_0 = 0$，故 $T(s) \cdot B_0$ 为常数，即 $\gamma(s) \cdot B_0$ 为常数，因此 $\gamma$ 落在与 $B_0$ 垂直的平面内。∎

**定义 62.9**（平面曲线的符号曲率）：对平面曲线，可定义**符号曲率** $k(s)$：$T'(s) = k(s) N(s)$。$k(s) > 0$ 表示曲线向左转，$k(s) < 0$ 表示向右转。

---

---

## 第63章：曲面论
曲面论是经典微分几何的核心，研究 $\mathbb{R}^3$ 中二维曲面的内蕴几何与外蕴几何。

### 63.1 正则曲面

**定义 63.1**（参数化曲面）：设 $U \subseteq \mathbb{R}^2$ 为开集。一个**参数化曲面**是一个光滑映射 $\mathbf{x}: U \to \mathbb{R}^3$，$\mathbf{x}(u, v) = (x(u, v), y(u, v), z(u, v))$。

**定义 63.2**（正则曲面）：参数化曲面 $\mathbf{x}$ 称为**正则的**，如果对每个 $(u, v) \in U$，偏导数 $\mathbf{x}_u$ 和 $\mathbf{x}_v$ 线性无关（即 $\mathbf{x}_u \times \mathbf{x}_v \neq 0$）。此时 $\mathbf{x}_u$ 和 $\mathbf{x}_v$ 张成曲面在 $\mathbf{x}(u, v)$ 处的**切平面**。

**定义 63.3**（正则曲面——整体定义）：$\mathbb{R}^3$ 的子集 $S$ 称为**正则曲面**，如果对每个 $p \in S$，存在 $p$ 在 $\mathbb{R}^3$ 中的邻域 $V$ 和映射 $\mathbf{x}: U \to V \cap S$（$U \subseteq \mathbb{R}^2$ 开集），使得 $\mathbf{x}$ 是光滑同胚且是正则参数化曲面。$\mathbf{x}$ 称为 $S$ 在 $p$ 处的**局部参数化**（或**坐标卡**）。

### 63.2 第一基本形式

**定义 63.4**（第一基本形式）：设 $\mathbf{x}: U \to S$ 是正则曲面的局部参数化。$S$ 的**第一基本形式**是二次型

$$I_p(w) = \langle w, w \rangle_p = \|w\|^2, \quad w \in T_p S$$

其中 $T_p S$ 是 $S$ 在 $p$ 处的切平面，$\langle \cdot, \cdot \rangle_p$ 是 $\mathbb{R}^3$ 的内积限制到 $T_p S$。

在局部坐标 $(u, v)$ 下，切向量 $w = a \mathbf{x}_u + b \mathbf{x}_v$ 的第一基本形式为

$$I_p(w) = E a^2 + 2F a b + G b^2$$

其中

$$E = \langle \mathbf{x}_u, \mathbf{x}_u \rangle, \quad F = \langle \mathbf{x}_u, \mathbf{x}_v \rangle, \quad G = \langle \mathbf{x}_v, \mathbf{x}_v \rangle$$

称为第一基本形式的**系数**。

**定义 63.5**（等距）：两个正则曲面 $S_1, S_2$ 称为**等距的**（或**局部等距的**），如果存在微分同胚 $\varphi: S_1 \to S_2$ 使得对任意 $p \in S_1$ 和 $w \in T_p S_1$，$I_p^1(w) = I_{\varphi(p)}^2(d\varphi_p(w))$。即第一基本形式被保持。

**命题 63.1**：第一基本形式完全决定了曲面上的弧长、角度和面积：

- 曲线 $\gamma(t) = \mathbf{x}(u(t), v(t))$ 的弧长：$L = \int \sqrt{E u'^2 + 2F u' v' + G v'^2} dt$
- 两切向量的夹角：$\cos \theta = \dfrac{E a_1 a_2 + F(a_1 b_2 + a_2 b_1) + G b_1 b_2}{\sqrt{E a_1^2 + 2F a_1 b_1 + G b_1^2} \sqrt{E a_2^2 + 2F a_2 b_2 + G b_2^2}}$
- 区域 $R \subseteq U$ 的面积：$A = \iint_R \sqrt{EG - F^2} du dv$

### 63.3 第二基本形式与法曲率

**定义 63.6**（单位法向量）：对正则参数化曲面 $\mathbf{x}: U \to S$，定义单位法向量

$$N(p) = \frac{\mathbf{x}_u \times \mathbf{x}_v}{\|\mathbf{x}_u \times \mathbf{x}_v\|}(p)$$

（注意 $N$ 取决于 $\mathbf{x}_u \times \mathbf{x}_v$ 的方向，即曲面的定向。）

**定义 63.7**（Gauss 映射）：映射 $N: S \to S^2$（$S^2$ 是 $\mathbb{R}^3$ 中的单位球面）将曲面上每点映到其单位法向量，称为曲面的 **Gauss 映射**。

**定义 63.8**（第二基本形式）：$S$ 的**第二基本形式**定义为

$$II_p(w) = -\langle dN_p(w), w \rangle, \quad w \in T_p S$$

在局部坐标下，$dN_p(\mathbf{x}_u) = N_u$，$dN_p(\mathbf{x}_v) = N_v$。第二基本形式的系数为

$$e = -\langle N_u, \mathbf{x}_u \rangle = \langle N, \mathbf{x}_{uu} \rangle$$
$$f = -\langle N_u, \mathbf{x}_v \rangle = \langle N, \mathbf{x}_{uv} \rangle$$
$$g = -\langle N_v, \mathbf{x}_v \rangle = \langle N, \mathbf{x}_{vv} \rangle$$

（后一等式由 $\langle N, \mathbf{x}_u \rangle = 0$ 求导得到。）

**定义 63.9**（法曲率）：设 $v \in T_p S$ 是单位切向量。曲面在 $p$ 处沿方向 $v$ 的**法曲率**为

$$\kappa_n(v) = II_p(v) = e a^2 + 2f a b + g b^2$$

其中 $v = a \mathbf{x}_u + b \mathbf{x}_v$ 且 $I_p(v) = 1$。

**定义 63.10**（主曲率、Gauss 曲率、平均曲率）：法曲率 $\kappa_n(v)$ 作为 $v$ 的函数（在单位切向量上）在 $T_p S$ 上取得最大值 $\kappa_1$ 和最小值 $\kappa_2$，称为 $S$ 在 $p$ 处的**主曲率**。对应方向称为**主方向**。

- **Gauss 曲率**：$K = \kappa_1 \kappa_2 = \dfrac{eg - f^2}{EG - F^2}$
- **平均曲率**：$H = \dfrac{\kappa_1 + \kappa_2}{2} = \dfrac{eG - 2fF + gE}{2(EG - F^2)}$

**定理 63.2**（主曲率的欧拉公式）：设 $v$ 与主方向 $e_1$ 的夹角为 $\theta$，则

$$\kappa_n(v) = \kappa_1 \cos^2 \theta + \kappa_2 \sin^2 \theta$$

*证明*：在由主方向构成的正交基下，$dN$ 是对角矩阵 $\operatorname{diag}(-\kappa_1, -\kappa_2)$。设 $v = \cos \theta e_1 + \sin \theta e_2$，则 $II(v) = \kappa_1 \cos^2 \theta + \kappa_2 \sin^2 \theta$。∎

**定义 63.11**（点分类）：曲面上点 $p$ 称为
- **椭圆点**：$K > 0$（$\kappa_1$ 和 $\kappa_2$ 同号）
- **双曲点**：$K < 0$（$\kappa_1$ 和 $\kappa_2$ 异号）
- **抛物点**：$K = 0$ 但 $H \neq 0$（一个主曲率为零）
- **平点**：$K = 0$ 且 $H = 0$（两个主曲率为零）

### 63.4 Gauss 绝妙定理

**定理 63.3**（Gauss 绝妙定理 / Theorema Egregium）：曲面的 Gauss 曲率 $K$ 仅由第一基本形式及其导数决定，即是曲面的**内蕴**不变量。

*证明思路*：引入 Christoffel 符号：

$$\Gamma_{ij}^k = \frac{1}{2} \sum_{\ell} g^{k\ell}(\partial_i g_{j\ell} + \partial_j g_{i\ell} - \partial_\ell g_{ij})$$

其中 $g_{11} = E, g_{12} = g_{21} = F, g_{22} = G$ 是第一基本形式的系数，$(g^{ij})$ 是 $(g_{ij})$ 的逆矩阵。

Gauss 曲率可表示为

$$K = \frac{R_{1212}}{g_{11}g_{22} - g_{12}^2}$$

其中 $R_{1212}$ 是 Riemann 曲率张量的分量（在二维情形下只有一个独立分量），它由 Christoffel 符号及其导数组合而成，从而仅依赖于第一基本形式。具体地：

$$R_{1212} = \frac{1}{2}\left(\frac{\partial^2 g_{11}}{\partial v^2} + \frac{\partial^2 g_{22}}{\partial u^2} - 2\frac{\partial^2 g_{12}}{\partial u \partial v}\right) + \sum_{p,q} g_{pq}(\Gamma_{22}^p \Gamma_{11}^q - \Gamma_{21}^p \Gamma_{21}^q)$$

或者等价地用 Christoffel 符号的偏导数表示：

$$R_{1212} = \partial_1\Gamma_{22}^1 - \partial_2\Gamma_{21}^1 + \Gamma_{22}^1\Gamma_{11}^1 + \Gamma_{22}^2\Gamma_{12}^1 - \Gamma_{21}^1\Gamma_{21}^1 - \Gamma_{21}^2\Gamma_{22}^1$$

（其中 $\partial_1 = \partial_u$，$\partial_2 = \partial_v$）。这表明 $K$ 完全由 $E, F, G$ 及其导数决定，与曲面在 $\mathbb{R}^3$ 中的嵌入方式无关。∎

**推论 63.4**：等距的曲面具有相同的 Gauss 曲率。特别地，不存在从平面（$K = 0$）到球面（$K = 1/R^2 > 0$）的等距映射（即无法将地图无变形地绘制在平面上）。

### 63.5 测地线与协变导数

**定义 63.12**（测地曲率）：设曲线 $\gamma(s) \subset S$ 以弧长为参数。$\gamma''(s)$ 在切平面上的投影的模长称为 $\gamma$ 在 $S$ 上的**测地曲率** $k_g$。

**定义 63.13**（测地线）：曲面 $S$ 上的曲线 $\gamma$ 称为**测地线**，如果其测地曲率恒为零，即 $\gamma''(s)$ 处处垂直于切平面。

**命题 63.5**（测地线方程）：在局部坐标 $(u, v)$ 下，测地线满足微分方程：

$$\frac{d^2 u^k}{ds^2} + \sum_{i,j=1}^2 \Gamma_{ij}^k \frac{du^i}{ds}\frac{du^j}{ds} = 0, \quad k = 1, 2$$

*证明*：$\gamma''(s)$ 垂直于 $T_p S$ 等价于 $\gamma''(s)$ 与 $\mathbf{x}_u$ 和 $\mathbf{x}_v$ 的内积为零。展开 $\gamma''(s) = \frac{d^2 u^k}{ds^2} \mathbf{x}_k + \frac{du^i}{ds}\frac{du^j}{ds} \mathbf{x}_{ij}$，利用 $\mathbf{x}_{ij} = \Gamma_{ij}^k \mathbf{x}_k + L_{ij} N$（Gauss 公式），取切向分量即得测地线方程。∎

**命题 63.6**：曲面上连接两点的最短曲线（若存在）必为测地线。

**例 63.1**（测地线举例）：
- 平面上的测地线是直线。
- 球面上的测地线是大圆。
- 柱面上的测地线是螺旋线。

---

---

## 第64章：微分流形
微分流形将曲面概念推广到任意维数，是现代微分几何的基石。微分流形是一种局部同胚于欧氏空间的拓扑空间，每个点附近可通过局部坐标（坐标卡）用 $\mathbb{R}^n$ 中的坐标描述。不同坐标卡之间的重叠区域通过光滑的过渡映射（转移函数）相互联系，这种结构使得微积分运算得以在流形上全局一致地进行。

### 64.1 微分流形的定义

**定义 64.1**（拓扑流形）：设 $M$ 是 Hausdorff 空间且具有可数基。$M$ 称为 $n$ 维**拓扑流形**，如果对每个 $p \in M$，存在 $p$ 的开邻域 $U$ 同胚于 $\mathbb{R}^n$ 的某个开集。

**定义 64.2**（坐标卡与图册）：设 $M$ 是 $n$ 维拓扑流形。
- $M$ 上的一个**坐标卡**（或局部坐标系）是一个对 $(U, \varphi)$，其中 $U \subseteq M$ 是开集，$\varphi: U \to \mathbb{R}^n$ 是同胚到其像。
- $M$ 的一个**图册** $\mathcal{A} = \{(U_\alpha, \varphi_\alpha)\}$ 是一族坐标卡满足 $\bigcup_\alpha U_\alpha = M$。
- 两个坐标卡 $(U_\alpha, \varphi_\alpha)$ 和 $(U_\beta, \varphi_\beta)$ 称为 $C^\infty$**相容的**，如果 $U_\alpha \cap U_\beta = \emptyset$，或者**转移映射**

$$\varphi_\beta \circ \varphi_\alpha^{-1}: \varphi_\alpha(U_\alpha \cap U_\beta) \to \varphi_\beta(U_\alpha \cap U_\beta)$$

是 $C^\infty$ 微分同胚。

**定义 64.3**（微分流形）：一个 $C^\infty$**微分流形**（或光滑流形）是一个拓扑流形 $M$ 配上一个极大 $C^\infty$ 图册（即所有与图册中坐标卡 $C^\infty$ 相容的坐标卡都已在图册中）。

**定义 64.4**（光滑函数）：设 $M$ 是光滑流形。函数 $f: M \to \mathbb{R}$ 称为**光滑的**，如果对每个坐标卡 $(U, \varphi)$，$f \circ \varphi^{-1}: \varphi(U) \to \mathbb{R}$ 是光滑的（作为 $\mathbb{R}^n$ 上开集的函数）。$M$ 上所有光滑函数构成的集合记作 $C^\infty(M)$。

**定义 64.5**（光滑映射）：设 $M, N$ 是光滑流形。映射 $F: M \to N$ 称为**光滑的**，如果对每对坐标卡 $(U, \varphi)$（$M$ 上）和 $(V, \psi)$（$N$ 上）满足 $F(U) \subseteq V$，映射 $\psi \circ F \circ \varphi^{-1}: \varphi(U) \to \psi(V)$ 是光滑的。

**例 64.1**（光滑流形举例）：
- $\mathbb{R}^n$：单个坐标卡 $(\mathbb{R}^n, \operatorname{id})$。
- $S^n$：球极投影给出两个坐标卡覆盖 $S^n$。
- 实射影空间 $\mathbb{R}P^n$：齐次坐标 $[x_0 : \cdots : x_n]$ 的 $n+1$ 个坐标卡。
- 环面 $T^n = S^1 \times \cdots \times S^1$：积流形。
- 开子集、积流形：光滑流形的开子集和积是光滑流形。

### 64.2 切空间与切映射

**定义 64.6**（芽与导子）：设 $p \in M$。$p$ 处的**函数芽**是在 $p$ 的某个邻域上定义的光滑函数的等价类（两个函数等价如它们在 $p$ 的某个邻域上相等）。记作 $C^\infty_p(M)$。

$p$ 处的一个**导子**（或切向量）是一个线性映射 $v: C^\infty_p(M) \to \mathbb{R}$ 满足 Leibniz 法则：

$$v(fg) = v(f)g(p) + f(p)v(g)$$

**定义 64.7**（切空间）：$M$ 在 $p$ 处的**切空间** $T_p M$ 是所有 $p$ 处导子构成的向量空间。其维数为 $n = \dim M$。

在局部坐标 $(x^1, \ldots, x^n)$（由坐标卡 $\varphi$ 给出）下，偏导算子 $\frac{\partial}{\partial x^i}\big|_p$ 构成 $T_p M$ 的一组基。任意切向量可表示为

$$v = \sum_{i=1}^n v^i \frac{\partial}{\partial x^i}\bigg|_p$$

**定义 64.8**（切映射/微分）：设 $F: M \to N$ 是光滑映射，$p \in M$。$F$ 在 $p$ 处的**切映射**（或微分）$dF_p: T_p M \to T_{F(p)} N$ 定义为

$$(dF_p(v))(f) = v(f \circ F), \quad \forall v \in T_p M, \; f \in C^\infty_{F(p)}(N)$$

在局部坐标下，$dF_p$ 由 Jacobi 矩阵表示。

**定理 64.1**（链式法则）：$(d(G \circ F))_p = dG_{F(p)} \circ dF_p$。

**定义 64.9**（切丛）：$M$ 的**切丛** $TM = \bigsqcup_{p \in M} T_p M$ 具有自然的光滑流形结构，维数为 $2n$。自然投影 $\pi: TM \to M$ 将 $v \in T_p M$ 映到 $p$。

### 64.3 向量场与 Lie 括号

**定义 64.10**（向量场）：$M$ 上的一个**光滑向量场**是一个光滑映射 $X: M \to TM$ 使得 $\pi \circ X = \operatorname{id}_M$，即 $X(p) \in T_p M$ 对每个 $p$。所有光滑向量场构成的集合记作 $\mathfrak{X}(M)$。

在局部坐标下，$X = \sum_{i=1}^n X^i \frac{\partial}{\partial x^i}$，其中 $X^i \in C^\infty(M)$。

**定义 64.11**（Lie 括号）：设 $X, Y \in \mathfrak{X}(M)$。它们的 **Lie 括号** $[X, Y] \in \mathfrak{X}(M)$ 定义为

$$[X, Y](f) = X(Y(f)) - Y(X(f)), \quad \forall f \in C^\infty(M)$$

在局部坐标下，$[X, Y] = \sum_{i,j} \left(X^j \frac{\partial Y^i}{\partial x^j} - Y^j \frac{\partial X^i}{\partial x^j}\right) \frac{\partial}{\partial x^i}$。

**命题 64.2**（Lie 括号的性质）：
1. $[X, Y] = -[Y, X]$（反交换性）
2. $[aX + bY, Z] = a[X, Z] + b[Y, Z]$（双线性性）
3. $[X, [Y, Z]] + [Y, [Z, X]] + [Z, [X, Y]] = 0$（Jacobi 恒等式）
4. $[fX, gY] = fg[X, Y] + f(Xg)Y - g(Yf)X$

### 64.4 微分形式

**定义 64.12**（余切空间与 1-形式）：$T_p^* M = (T_p M)^*$ 是 $T_p M$ 的对偶空间，称为 $p$ 处的**余切空间**。$M$ 上的一个**光滑 1-形式**是一个光滑映射 $\omega: M \to T^*M = \bigsqcup T_p^* M$，使得 $\omega(p) \in T_p^* M$。

在局部坐标下，$\{dx^1, \ldots, dx^n\}$ 是 $T_p^* M$ 的基（与 $\{\partial/\partial x^i\}$ 对偶）。1-形式可写为 $\omega = \sum \omega_i dx^i$。

**定义 64.13**（微分 $d$）：对光滑函数 $f \in C^\infty(M)$，其**微分** $df$ 是 1-形式，定义为 $df(v) = v(f)$ 对所有 $v \in TM$。在局部坐标下，$df = \sum \frac{\partial f}{\partial x^i} dx^i$。

**定义 64.14**（$k$-形式）：$M$ 上的一个**微分 $k$-形式**是一个反对称的 $(0, k)$-张量场。在局部坐标下，

$$\omega = \sum_{i_1 < \cdots < i_k} \omega_{i_1 \cdots i_k} dx^{i_1} \wedge \cdots \wedge dx^{i_k}$$

其中 $\wedge$ 是外积（楔积），满足反对称性：$dx^i \wedge dx^j = -dx^j \wedge dx^i$。

**定义 64.15**（外微分）：外微分算子 $d: \Omega^k(M) \to \Omega^{k+1}(M)$ 定义为

$$d\omega = \sum_{i_1 < \cdots < i_k} \sum_{j} \frac{\partial \omega_{i_1 \cdots i_k}}{\partial x^j} dx^j \wedge dx^{i_1} \wedge \cdots \wedge dx^{i_k}$$

**命题 64.3**（外微分的基本性质）：
1. $d$ 是线性的。
2. $d \circ d = 0$（即 $d(d\omega) = 0$ 对所有 $\omega$）。
3. $d(\omega \wedge \eta) = d\omega \wedge \eta + (-1)^{\deg \omega} \omega \wedge d\eta$。
4. 对函数 $f$，$df$ 与定义 64.13 一致。
5. $d$ 是局部的：若 $\omega = \eta$ 在开集 $U$ 上，则 $d\omega = d\eta$ 在 $U$ 上。

**定义 64.16**（闭形式与恰当形式）：$k$-形式 $\omega$ 称为
- **闭的**：若 $d\omega = 0$。
- **恰当的**：若存在 $(k-1)$-形式 $\eta$ 使得 $\omega = d\eta$。

由 $d^2 = 0$，恰当形式一定是闭的。闭形式商去恰当形式得到 **de Rham 上同调**：

$$H^k_{dR}(M) = \frac{\ker(d: \Omega^k(M) \to \Omega^{k+1}(M))}{\operatorname{im}(d: \Omega^{k-1}(M) \to \Omega^k(M))}$$

### 64.5 子流形与浸入

**定义 64.17**（浸入与淹没）：光滑映射 $F: M \to N$ 称为
- **浸入**：若 $dF_p$ 在每点 $p$ 是单射。
- **淹没**：若 $dF_p$ 在每点 $p$ 是满射。
- **嵌入**：若 $F$ 是浸入且 $F: M \to F(M)$ 是同胚（$F(M)$ 赋予 $N$ 的子空间拓扑）。

**定理 64.4**（正则值定理）：设 $F: M \to N$ 是光滑映射，$\dim M \geq \dim N$。若 $q \in N$ 是 $F$ 的**正则值**（即对所有 $p \in F^{-1}(q)$，$dF_p$ 是满射），则 $F^{-1}(q)$ 是 $M$ 的 $\dim M - \dim N$ 维嵌入子流形。

**定理 64.5**（Whitney 嵌入定理，陈述）：每个 $n$ 维光滑流形可以嵌入到 $\mathbb{R}^{2n}$ 中。

---

---

## 第65章：Riemann 几何
Riemann 几何在微分流形上赋予度量结构，使得可以讨论长度、角度、曲率等概念。Riemann 度量 $g$ 在每个切空间上定义内积，从而决定曲线弧长、测地线方程和体积元。测地线是流形上"最直"的曲线，对应于欧氏空间中直线的推广；而 Riemann 曲率张量则刻画了流形偏离平坦的程度——它既是局部几何的核心不变量，又通过 Gauss-Bonnet 定理等结果与流形的整体拓扑建立了深刻联系。

### 65.1 Riemann 度量

**定义 65.1**（Riemann 度量）：光滑流形 $M$ 上的一个 **Riemann 度量** $g$ 是一个光滑的 $(0, 2)$-张量场，使得对每个 $p \in M$，$g_p: T_p M \times T_p M \to \mathbb{R}$ 是对称正定的双线性型。即 $g_p$ 是 $T_p M$ 上的内积。

在局部坐标下，$g = \sum_{i,j} g_{ij} dx^i \otimes dx^j$，其中 $(g_{ij})$ 是对称正定矩阵，$g_{ij} = g(\partial_i, \partial_j)$。

**定义 65.2**（Riemann 流形）：一个 **Riemann 流形**是一对 $(M, g)$，其中 $M$ 是光滑流形，$g$ 是 $M$ 上的 Riemann 度量。

**例 65.1**（Riemann 流形举例）：
- $\mathbb{R}^n$ 配以标准欧氏度量 $g_{ij} = \delta_{ij}$。
- $S^n$（球面）配以 $\mathbb{R}^{n+1}$ 诱导的度量。
- Poincaré 上半平面 $\mathbb{H}^2 = \{(x, y) : y > 0\}$ 配以 $g = \frac{dx^2 + dy^2}{y^2}$（双曲度量）。
- 任何光滑流形上存在 Riemann 度量（利用单位分解构造）。

**定义 65.3**（等距）：两个 Riemann 流形 $(M, g)$ 和 $(N, h)$ 之间的微分同胚 $F: M \to N$ 称为**等距**，如果 $F^*h = g$，即 $h_{F(p)}(dF_p(v), dF_p(w)) = g_p(v, w)$ 对所有 $v, w \in T_p M$。

### 65.2 Levi-Civita 联络

**定义 65.4**（仿射联络）：$M$ 上的一个**仿射联络**（或协变导数）是一个映射 $\nabla: \mathfrak{X}(M) \times \mathfrak{X}(M) \to \mathfrak{X}(M)$，记作 $\nabla_X Y$，满足：

1. $\nabla_{fX + gY} Z = f \nabla_X Z + g \nabla_Y Z$（$C^\infty(M)$-线性于第一变量）
2. $\nabla_X (aY + bZ) = a \nabla_X Y + b \nabla_X Z$（$\mathbb{R}$-线性于第二变量）
3. $\nabla_X (fY) = (Xf)Y + f \nabla_X Y$（Leibniz 法则）

**定理 65.1**（Levi-Civita 联络的存在唯一性）：在 Riemann 流形 $(M, g)$ 上，存在唯一的仿射联络 $\nabla$ 满足：

1. **无挠性**（对称性）：$\nabla_X Y - \nabla_Y X = [X, Y]$。
2. **与度量相容**：$X(g(Y, Z)) = g(\nabla_X Y, Z) + g(Y, \nabla_X Z)$。

这个联络称为 **Levi-Civita 联络**（或 Riemann 联络）。

*证明*（存在性）：由 Koszul 公式：

$$\begin{aligned}
2g(\nabla_X Y, Z) &= X(g(Y, Z)) + Y(g(Z, X)) - Z(g(X, Y)) \\
&\quad - g(X, [Y, Z]) + g(Y, [Z, X]) + g(Z, [X, Y])
\end{aligned}$$

此公式唯一确定了 $\nabla_X Y$。可直接验证由此定义的 $\nabla$ 满足所有条件。∎

**定义 65.5**（Christoffel 符号）：在局部坐标下，Levi-Civita 联络由 **Christoffel 符号** $\Gamma_{ij}^k$ 决定：

$$\nabla_{\partial_i} \partial_j = \sum_k \Gamma_{ij}^k \partial_k$$

$$\Gamma_{ij}^k = \frac{1}{2} \sum_{\ell} g^{k\ell}(\partial_i g_{j\ell} + \partial_j g_{i\ell} - \partial_\ell g_{ij})$$

### 65.3 曲率

**定义 65.6**（Riemann 曲率张量）：Levi-Civita 联络 $\nabla$ 的 **Riemann 曲率张量** $R: \mathfrak{X}(M) \times \mathfrak{X}(M) \times \mathfrak{X}(M) \to \mathfrak{X}(M)$ 定义为

$$R(X, Y)Z = \nabla_X \nabla_Y Z - \nabla_Y \nabla_X Z - \nabla_{[X, Y]} Z$$

**命题 65.2**（Riemann 曲率张量的对称性）：

1. $R(X, Y)Z = -R(Y, X)Z$
2. $g(R(X, Y)Z, W) = -g(R(X, Y)W, Z)$
3. $R(X, Y)Z + R(Y, Z)X + R(Z, X)Y = 0$（第一 Bianchi 恒等式）
4. $g(R(X, Y)Z, W) = g(R(Z, W)X, Y)$（对偶对称性）

**定义 65.7**（Riemann 曲率张量的分量）：在局部坐标下，

$$R(\partial_i, \partial_j)\partial_k = \sum_{\ell} R_{ijk}^{\ell} \partial_{\ell}$$

$$R_{ijk\ell} = g(R(\partial_i, \partial_j)\partial_k, \partial_\ell) = \sum_m g_{\ell m} R_{ijk}^m$$

$$R_{ijk\ell} = \frac{1}{2}\left(\frac{\partial^2 g_{i\ell}}{\partial x^j \partial x^k} + \frac{\partial^2 g_{jk}}{\partial x^i \partial x^\ell} - \frac{\partial^2 g_{ik}}{\partial x^j \partial x^\ell} - \frac{\partial^2 g_{j\ell}}{\partial x^i \partial x^k}\right) + \sum_{p,q} g_{pq}(\Gamma_{i\ell}^p \Gamma_{jk}^q - \Gamma_{ik}^p \Gamma_{j\ell}^q)$$

**定义 65.8**（截面曲率）：设 $\Pi \subseteq T_p M$ 是二维子空间，由规范正交向量 $v, w$ 张成。$\Pi$ 的**截面曲率**为

$$K(\Pi) = \frac{g(R(v, w)w, v)}{g(v, v)g(w, w) - g(v, w)^2}$$

**定义 65.9**（Ricci 曲率与标量曲率）：
- **Ricci 曲率**：$\operatorname{Ric}(X, Y) = \operatorname{tr}(Z \mapsto R(Z, X)Y)$。在局部坐标下，$\operatorname{Ric}_{ij} = \sum_k R_{kij}^k$。
- **标量曲率**：$S = \operatorname{tr}_g(\operatorname{Ric}) = \sum_{i,j} g^{ij} \operatorname{Ric}_{ij}$。

**命题 65.3**（第二 Bianchi 恒等式）：

$$\nabla_X R(Y, Z) + \nabla_Y R(Z, X) + \nabla_Z R(X, Y) = 0$$

在局部坐标下：$\nabla_m R_{ijk\ell} + \nabla_i R_{jmk\ell} + \nabla_j R_{mik\ell} = 0$。

### 65.4 测地线

**定义 65.10**（测地线）：Riemann 流形 $(M, g)$ 上的光滑曲线 $\gamma: I \to M$ 称为**测地线**，如果

$$\nabla_{\gamma'} \gamma' = 0$$

在局部坐标下，这等价于测地线方程：

$$\frac{d^2 x^k}{dt^2} + \sum_{i,j} \Gamma_{ij}^k \frac{dx^i}{dt}\frac{dx^j}{dt} = 0$$

**定理 65.4**（测地线的存在唯一性）：对每个 $p \in M$ 和 $v \in T_p M$，存在唯一的测地线 $\gamma_v: (-\varepsilon, \varepsilon) \to M$ 满足 $\gamma_v(0) = p$，$\gamma_v'(0) = v$。

*证明*：测地线方程是二阶常微分方程，由 ODE 解的存在唯一性定理可得。∎

**定义 65.11**（指数映射）：$p$ 处的**指数映射** $\exp_p: T_p M \to M$ 定义为 $\exp_p(v) = \gamma_v(1)$（当右边有定义时）。$\exp_p$ 在 $0 \in T_p M$ 附近是微分同胚（因为 $d(\exp_p)_0 = \operatorname{id}_{T_p M}$）。

**定义 65.12**（完备性）：Riemann 流形 $(M, g)$ 称为**测地完备的**，如果每条测地线可以无限延伸（即定义域为 $\mathbb{R}$）。

**定理 65.5**（Hopf-Rinow 定理）：对 Riemann 流形 $(M, g)$，以下条件等价：
1. $(M, g)$ 是测地完备的。
2. $(M, g)$ 作为度量空间（由 $g$ 诱导的 Riemann 距离）是完备的。
3. $M$ 中的有界闭集是紧致的。

此时，$M$ 中任意两点之间都存在最短测地线。

---

---

## 第66章：曲率与拓扑
本章揭示曲率（局部几何量）与拓扑（全局拓扑不变量）之间的深刻联系。

### 66.1 二维情形：Gauss-Bonnet 定理

**定理 66.1**（局部 Gauss-Bonnet 定理）：设 $S$ 是 $\mathbb{R}^3$ 中的正则曲面，$R \subseteq S$ 是由分段光滑简单闭曲线 $\partial R$ 围成的区域。则

$$\int_R K dA + \int_{\partial R} k_g ds + \sum_i \theta_i = 2\pi$$

其中 $K$ 是 Gauss 曲率，$k_g$ 是边界曲线的测地曲率，$\theta_i$ 是边界角点处的外角。

*证明思路*：在 $R$ 上选取正交标架场 $\{e_1, e_2\}$，定义联络形式 $\omega_{12} = \langle \nabla e_1, e_2 \rangle$。则由曲率的定义，$d\omega_{12} = -K dA$。再由 Stokes 定理：

$$\int_R K dA = -\int_R d\omega_{12} = -\int_{\partial R} \omega_{12}$$

在边界上 $\omega_{12}$ 与 $k_g$ 的关系给出 $\int_{\partial R} \omega_{12} = 2\pi - \int_{\partial R} k_g ds - \sum \theta_i$。∎

**定理 66.2**（全局 Gauss-Bonnet 定理）：设 $S$ 是紧致无边可定向曲面。则

$$\int_S K dA = 2\pi \chi(S)$$

其中 $\chi(S)$ 是 $S$ 的 Euler 示性数。对亏格为 $g$ 的可定向曲面，$\chi(S) = 2 - 2g$。

*证明*：将 $S$ 三角剖分，对每个三角形应用局部 Gauss-Bonnet 定理，求和。所有内角之和为 $2\pi$ 乘以顶点数，测地曲率积分在内部边上抵消，外角之和给出 $\int K dA = 2\pi(V - E + F) = 2\pi \chi(S)$。∎

**推论 66.3**（Gauss-Bonnet 定理的推论）：
1. $\int_S K dA$ 是拓扑不变量（与 Riemann 度量的选择无关）。
2. 若 $S$ 同胚于 $S^2$（球面），则 $\int_S K dA = 4\pi$。特别地，$S^2$ 上的任何 Riemann 度量在某处必有正曲率。
3. 若 $S$ 同胚于 $T^2$（环面），则 $\int_S K dA = 0$。因此环面上不能处处有正 Gauss 曲率。
4. 若 $S$ 的 Gauss 曲率 $K > 0$ 处处成立，则 $\chi(S) > 0$，从而 $S$ 必同胚于 $S^2$ 或 $\mathbb{R}P^2$。

### 66.2 高维推广

**定理 66.4**（Chern-Gauss-Bonnet 定理，陈述）：设 $(M, g)$ 是 $2n$ 维紧致无边可定向 Riemann 流形。则

$$\int_M \operatorname{Pf}(\Omega) = (2\pi)^n \chi(M)$$

其中 $\operatorname{Pf}(\Omega)$ 是曲率形式 $\Omega$ 的 Pfaffian，$\chi(M)$ 是 $M$ 的 Euler 示性数。

*说明*：当 $n = 1$ 时，$\operatorname{Pf}(\Omega) = K dA$，退化为经典的 Gauss-Bonnet 定理。此定理是陈省身（Shiing-Shen Chern）于 1944 年证明的，是微分几何的里程碑式成果。

**定理 66.5**（奇维数情形）：若 $M$ 是紧致无边可定向的奇维数流形，则 $\chi(M) = 0$。

### 66.3 曲率与拓扑的其他联系

**定理 66.6**（Bonnet-Myers 定理）：设 $(M, g)$ 是完备 Riemann 流形，$\dim M = n$。若存在常数 $c > 0$ 使得 $\operatorname{Ric}(v, v) \geq (n-1)c \cdot g(v, v)$ 对所有 $v$ 成立，则 $M$ 是紧致的，且直径 $\operatorname{diam}(M) \leq \pi / \sqrt{c}$。特别地，$\pi_1(M)$ 是有限群。

*证明思路*：设 $\gamma$ 是长度大于 $\pi/\sqrt{c}$ 的测地线。利用第二变分公式和 Ricci 曲率条件，可构造连接 $\gamma$ 两端点的更短曲线，矛盾。因此所有测地线长度不超过 $\pi/\sqrt{c}$。由 Hopf-Rinow 定理，$M$ 紧致且直径有界。万有覆叠 $\tilde{M}$ 也具有相同的 Ricci 曲率下界，故也紧致，从而 $\pi_1(M)$ 有限。∎

**定理 66.7**（Hadamard-Cartan 定理）：设 $(M, g)$ 是完备单连通 Riemann 流形，且截面曲率 $K \leq 0$ 处处成立。则对每个 $p \in M$，指数映射 $\exp_p: T_p M \to M$ 是微分同胚。特别地，$M$ 微分同胚于 $\mathbb{R}^n$。

*证明思路*：截面曲率 $\leq 0$ 蕴含 Jacobi 场的长度不减，从而 $\exp_p$ 是局部微分同胚。由完备性，$\exp_p$ 是满射。单连通性保证 $\exp_p$ 是整体单射。∎

**定理 66.8**（球面定理 / 1/4-夹挤定理）：设 $(M, g)$ 是完备单连通 Riemann 流形，$\dim M = n$。若截面曲率 $K$ 满足 $1/4 < K \leq 1$，则 $M$ 同胚于 $S^n$。若 $1/4 \leq K \leq 1$，则 $M$ 同胚于 $S^n$ 或微分同胚于某个对称空间。

*说明*：这是微分几何中著名的「球面定理」，由 Rauch、Berger 和 Klingenberg 在 1950-60 年代建立。其完整证明需要深入的比较几何和 Morse 理论。

**定理 66.9**（Chern 的 Gauss-Bonnet 公式推广的积分不变量）：在偶维数紧致 Riemann 流形上，Euler 示性数可以表示为曲率形式的多项式在整个流形上的积分，这一积分值不依赖于度量的选择。

### 66.4 曲率张量的进一步分解

**定义 66.10**（Weyl 曲率张量）：在 $n \geq 3$ 维 Riemann 流形上，**Weyl 曲率张量** $W$ 定义为 Riemann 曲率张量去掉 Ricci 部分和标量曲率部分：

$$W_{ijk\ell} = R_{ijk\ell} - \frac{1}{n-2}(g_{ik}\operatorname{Ric}_{j\ell} - g_{i\ell}\operatorname{Ric}_{jk} - g_{jk}\operatorname{Ric}_{i\ell} + g_{j\ell}\operatorname{Ric}_{ik}) + \frac{S}{(n-1)(n-2)}(g_{ik}g_{j\ell} - g_{i\ell}g_{jk})$$

$W$ 具有与 $R$ 相同的对称性，且所有迹为零（$\sum_i W_{ijk}^i = 0$）。$W$ 是**共形不变**的：若 $\tilde{g} = e^{2f} g$，则 $\tilde{W} = e^{2f} W$（在指标位置适当调整后）。

**定理 66.11**（Weyl 张量等于零）：$n \geq 4$ 维 Riemann 流形局部共形平坦（即局部等距于 $\mathbb{R}^n$ 配以某个共形度量）当且仅当 $W = 0$。$n = 3$ 时，局部共形平坦等价于 Cotton 张量等于零。

---

---

## 第67章：G-结构
G-结构是微分流形切丛的结构群从一般线性群 $\operatorname{GL}(n,\mathbb{R})$ 约化到 Lie 子群 $G$ 的几何框架。形式化地，$n$ 维流形 $M$ 上的 $G$-结构是一个 $G$-主丛 $P \to M$ 连同 $G$-等变同构 $P \times_G \operatorname{GL}(n,\mathbb{R}) \cong FM$（$FM$ 为切标架丛），即切丛的每个标架均可通过 $G$ 的作用彼此转换。**可积性条件**由结构张量（挠率）的消去判定：若存在无挠联络与 $G$-结构相容，则 $G$-结构局部平坦。经典例子：（1）**Riemann 结构**——$G = \operatorname{O}(n)$，等价于 Riemann 度量的存在（正交标架丛）；（2）**复结构**——$G = \operatorname{GL}(n,\mathbb{C}) \subset \operatorname{GL}(2n,\mathbb{R})$，对应近复结构，可积性即 Newlander-Nirenberg 定理——近复结构来自复流形当且仅当其 Nijenhuis 张量消去；（3）**辛结构**——$G = \operatorname{Sp}(2n,\mathbb{R})$，对应非退化闭 2-形式，由 Darboux 定理总是局部可积（无局部不变量）。

---

### 67.4 仿射微分几何

仿射微分几何研究等体积仿射变换群（$\operatorname{SL}(n,\mathbb{R}) \ltimes \mathbb{R}^n$）下的曲面和超曲面不变量，是介于 Riemann 几何与射影几何之间的基本几何结构。核心研究对象是 $\mathbb{R}^{n+1}$ 中非退化超曲面（即其 Blaschke 度量非退化）的仿射法向量、仿射形状算子和仿射度量。**基本定理**：（1）仿射基本定理——给定 Blaschke 度量和仿射第三基本形式满足 Gauss-Codazzi 型方程，则可唯一确定超曲面（至多相差仿射变换）；（2）仿射球面分类——仿射主曲率为常数的非退化仿射超曲面分为椭球型、双曲型和抛物型；（3）Calabi 猜想（仿射版本）——完备仿射球面必为椭球面或双曲面，由 Calabi (1982) 提出、Trudinger-Wang (2000) 完全解决。仿射微分几何在信息几何（统计流形）和计算机视觉（仿射不变物体识别）中有重要应用。

### 67.5 Twistor 理论与超 Kähler 几何

Twistor 理论由 Penrose (1967) 创立，通过构造 $\mathbb{R}^4$（共形紧化为 $S^4$）上的 **twistor 空间**——$\mathbb{CP}^3$（即复三维射影空间）——将四维 Riemann 几何问题转化为复几何问题。基本构造：$S^4$ 上的每个点对应 twistor 空间中的一条全纯 $\mathbb{CP}^1$（twistor 线），反自偶联络对应于全纯向量丛。**非线性引力子构造**（Penrose, 1976）：反自偶 Einstein 度量一一对应于 twistor 空间上具有全纯切触结构的形变。**超 Kähler 几何**：超 Kähler 流形是具有三个相容复结构 $I, J, K$（满足四元数关系 $IJ = K$）的 Riemann 流形。其 twistor 空间是全纯辛流形上的 $\mathbb{CP}^1$ 全族。关键例子：（1）$K3$ 曲面——唯一紧致四维超 Kähler 流形；（2）ALE 空间（Kronheimer 分类，对应 Dynkin 图）；（3）Hilbert 概型 $\operatorname{Hilb}^n(K3)$ 与广义 Kummer 簇——高维紧致超 Kähler 流形的两类基本构造。Atiyah-Hitchin-Singer (1978) 用 twistor 方法研究了磁单极模空间上的超 Kähler 度量。

---

---

## 第68章：张量初步
### 68.1 多重线性映射

**定义 68.1.1**（多重线性映射）：设 $V_1, \ldots, V_k, W$ 为 $F$ 上的向量空间。映射 $T : V_1 \times \cdots \times V_k \to W$ 称为**多重线性映射**（$k$-线性映射），若 $T$ 对每个变元是线性的（固定其他变元时）。

**定义 68.1.2**（对偶空间）：设 $V$ 为 $F$ 上的向量空间。$V$ 上的所有线性泛函（即 $V \to F$ 的线性映射）构成的向量空间称为 $V$ 的**对偶空间**，记为 $V^* = \mathcal{L}(V, F)$。

**定理 68.1.1**：若 $\dim V = n$，则 $\dim V^* = n$。若 $B = \{e_1, \ldots, e_n\}$ 为 $V$ 的基，则 $V^*$ 有一组**对偶基** $\{e^1, \ldots, e^n\}$，满足 $e^i(e_j) = \delta_{ij}$。

*证明*：$\dim V^* = \dim \mathcal{L}(V, F) = (\dim V)(\dim F) = n$。定义 $e^i(\sum_j x_j e_j) = x_i$，则 $e^i(e_j) = \delta_{ij}$。$\{e^1, \ldots, e^n\}$ 线性无关（若 $\sum \lambda_i e^i = 0$，作用在 $e_j$ 上得 $\lambda_j = 0$），且恰有 $n$ 个，故为基。$\blacksquare$

---

### 68.2 张量积

**定义 68.2.1**（张量积的泛性质定义）：设 $V, W$ 为 $F$ 上的向量空间。$V$ 与 $W$ 的**张量积**是一个向量空间 $V \otimes W$ 加上一个双线性映射 $\otimes : V \times W \to V \otimes W$（$(v, w) \mapsto v \otimes w$），满足以下**泛性质**：

对任意双线性映射 $B : V \times W \to U$（$U$ 为任意向量空间），存在唯一的线性映射 $\tilde{B} : V \otimes W \to U$ 使得下图交换：

$$B = \tilde{B} \circ \otimes$$

即 $B(v, w) = \tilde{B}(v \otimes w)$。

**定理 68.2.1**（张量积的存在性）：对任何有限维向量空间 $V, W$，张量积 $V \otimes W$ 存在，且在同构意义下唯一。

*证明*（构造）：设 $\dim V = m$，$\dim W = n$。取 $V$ 的基 $\{e_1, \ldots, e_m\}$，$W$ 的基 $\{f_1, \ldots, f_n\}$。定义 $V \otimes W$ 为以 $\{e_i \otimes f_j \mid 1 \leq i \leq m, 1 \leq j \leq n\}$ 为基的 $mn$ 维向量空间。对 $v = \sum a_i e_i$，$w = \sum b_j f_j$，定义 $v \otimes w = \sum_{i,j} a_i b_j (e_i \otimes f_j)$。

验证泛性质：设 $B : V \times W \to U$ 为双线性映射。定义 $\tilde{B}(e_i \otimes f_j) = B(e_i, f_j)$，并线性扩充到 $V \otimes W$。则 $\tilde{B}(v \otimes w) = \tilde{B}(\sum a_i b_j e_i \otimes f_j) = \sum a_i b_j B(e_i, f_j) = B(\sum a_i e_i, \sum b_j f_j) = B(v, w)$。$\tilde{B}$ 的唯一性由基上的值唯一确定。$\blacksquare$

**定理 68.2.2**（张量积的基本性质）：设 $V, W, U$ 为有限维向量空间。

(i) $\dim(V \otimes W) = (\dim V)(\dim W)$
(ii) $V \otimes W \cong W \otimes V$（通过 $v \otimes w \mapsto w \otimes v$）
(iii) $(V \otimes W) \otimes U \cong V \otimes (W \otimes U)$
(iv) $V \otimes (W \oplus U) \cong (V \otimes W) \oplus (V \otimes U)$
(v) $F \otimes V \cong V$
(vi) $(V \otimes W)^* \cong V^* \otimes W^*$（有限维情形）

*证明*：(i) 由构造中基的个数 $mn$ 得到。(ii) 定义映射 $\tau : V \otimes W \to W \otimes V$ 为 $\tau(v \otimes w) = w \otimes v$，线性扩充。其逆为 $\tau^{-1}(w \otimes v) = v \otimes w$。(iii) 定义 $(v \otimes w) \otimes u \mapsto v \otimes (w \otimes u)$，线性扩充。(iv) 由泛性质验证。(v) 定义 $\lambda \otimes v \mapsto \lambda v$，其逆为 $v \mapsto 1 \otimes v$。(vi) 取基后验证维数相同，且存在自然同构 $\alpha \otimes \beta \mapsto (v \otimes w \mapsto \alpha(v)\beta(w))$。$\blacksquare$

**定义 68.2.2**（张量）：$k$ 个 $V$ 的张量积 $V^{\otimes k} = V \otimes V \otimes \cdots \otimes V$（$k$ 次）中的元素称为 $V$ 上的 $k$ 阶**张量**。特别地：
- $V^{\otimes 0} = F$（标量）
- $V^{\otimes 1} = V$（向量）
- $V^{\otimes 2} = V \otimes V$（二阶张量）

---

### 68.3 外代数

**定义 68.3.1**（外幂）：设 $V$ 为 $F$ 上的向量空间。$V$ 的第 $k$ 次**外幂** $\bigwedge^k V$ 是 $V^{\otimes k}$ 的商空间，模去所有形如 $v_1 \otimes \cdots \otimes v_k$ 且 $v_i = v_j$（$i \neq j$）的元素生成的子空间。$\bigwedge^k V$ 中的元素记为 $v_1 \wedge v_2 \wedge \cdots \wedge v_k$，称为 $k$-向量。

**定理 68.3.1**（外幂的基本性质）：

(i) **交错性**：$v_1 \wedge \cdots \wedge v_i \wedge \cdots \wedge v_j \wedge \cdots \wedge v_k = -v_1 \wedge \cdots \wedge v_j \wedge \cdots \wedge v_i \wedge \cdots \wedge v_k$
(ii) 若 $\{e_1, \ldots, e_n\}$ 为 $V$ 的基，则 $\{e_{i_1} \wedge e_{i_2} \wedge \cdots \wedge e_{i_k} \mid 1 \leq i_1 < i_2 < \cdots < i_k \leq n\}$ 为 $\bigwedge^k V$ 的基
(iii) $\dim \bigwedge^k V = \binom{n}{k}$（$0 \leq k \leq n$），$\bigwedge^k V = \{0\}$（$k > n$）
(iv) $\bigwedge^n V$ 是一维的，基为 $e_1 \wedge \cdots \wedge e_n$

*证明*：(i) 由定义，$v_i \wedge v_j = -v_j \wedge v_i$（因为 $(v_i + v_j) \wedge (v_i + v_j) = 0$ 展开得 $v_i \wedge v_i + v_i \wedge v_j + v_j \wedge v_i + v_j \wedge v_j = v_i \wedge v_j + v_j \wedge v_i = 0$）。(ii) 由交错性，任何 $k$-向量可写为严格递增指标对应的基向量的外积的线性组合。线性无关性由构造保证。(iii) 由 (ii)，基的个数为 $\binom{n}{k}$。(iv) $k = n$ 时 $\binom{n}{n} = 1$。$\blacksquare$

**定义 68.3.2**（外代数）：$V$ 的**外代数**（Grassmann 代数）为直和

$$\bigwedge V = \bigoplus_{k=0}^{n} \bigwedge^k V$$

外积 $\wedge$ 使 $\bigwedge V$ 成为一个结合代数（满足 $a \wedge b = (-1)^{(\deg a)(\deg b)} b \wedge a$）。

**定理 68.3.2**（行列式与外积的关系）：设 $v_1, \ldots, v_n \in \mathbb{R}^n$。则

$$v_1 \wedge v_2 \wedge \cdots \wedge v_n = \det(v_1, \ldots, v_n) \, e_1 \wedge e_2 \wedge \cdots \wedge e_n$$

*证明*：将 $v_j = \sum_i a_{ij} e_i$ 代入外积，使用交错性展开。外积的系数正是 Leibniz 公式定义的 $\det(a_{ij})$。$\blacksquare$

---

### 68.4 对称张量

**定义 68.4.1**（对称张量）：$T \in V^{\otimes k}$ 称为**对称张量**，若对任意置换 $\sigma \in S_k$，有 $\sigma \cdot T = T$（其中 $\sigma$ 通过置换因子作用在 $V^{\otimes k}$ 上）。

**定义 68.4.2**（对称幂）：$V$ 的第 $k$ 次**对称幂** $S^k V$ 是 $V^{\otimes k}$ 的商空间，模去形如 $v_1 \otimes \cdots \otimes v_k - v_{\sigma(1)} \otimes \cdots \otimes v_{\sigma(k)}$ 的元素生成的子空间。$S^k V$ 中的元素记为 $v_1 \odot v_2 \odot \cdots \odot v_k$。

**定理 68.4.1**：若 $\{e_1, \ldots, e_n\}$ 为 $V$ 的基，则 $\{e_{i_1} \odot e_{i_2} \odot \cdots \odot e_{i_k} \mid 1 \leq i_1 \leq i_2 \leq \cdots \leq i_k \leq n\}$ 为 $S^k V$ 的基。$\dim S^k V = \binom{n + k - 1}{k}$。

*证明*：由对称性，任何对称张量可写为非降指标对应的基向量的对称积的线性组合。基的个数为从 $n$ 个元素中可重复地选取 $k$ 个的组合数，即 $\binom{n+k-1}{k}$。$\blacksquare$

**定义 68.4.3**（多重线性型与张量）：$V$ 上的 $k$ 重线性型自然地对应于 $(V^*)^{\otimes k}$ 中的元素，或等价地，$V^{\otimes k}$ 上的线性泛函。特别地，$V$ 上的对称双线性型对应于 $S^2(V^*)$ 中的元素，这正是二次型的理论框架。

---

**注记 68.4.1**：张量与外代数的深入理论（包括流形上的张量场、微分形式、de Rham 上同调等）将在后续章节中详细展开。本章仅建立有限维向量空间上的基本代数框架。$\blacksquare$

---

---

---

## 第105章（补充）
> 辛几何是经典力学（Hamilton 力学）的天然数学语言，研究偶数维光滑流形上的非退化闭 2-形式（辛形式）。切触几何是奇数维流形上的对应理论。本部分作为微分几何的补充，建立辛流形、辛约化、Gromov-Witten 理论、切触几何和 Fukaya 范畴的系统理论。

---

## 第242章：辛流形基础
辛几何研究带有辛形式（封闭、非退化的 2-形式）的光滑流形，是 Hamilton 力学的相空间的抽象化。

### 242.1 辛线性代数

**定义 242.1**（辛向量空间）：有限维实向量空间 $V$ 上的**辛形式** $\omega: V \times V \to \mathbb{R}$ 是双线性、反对称（$\omega(u, v) = -\omega(v, u)$）且非退化（$\omega(u, v) = 0$ 对所有 $v$ 蕴含 $u = 0$）的。$(V, \omega)$ 称为**辛向量空间**。

**命题 242.1**（辛向量空间的标准型 / 维数）：任何辛向量空间的维数是偶数：$\dim V = 2n$。存在辛基 $(e_1, \ldots, e_n, f_1, \ldots, f_n)$ 使得 $\omega(e_i, f_j) = \delta_{ij}$，$\omega(e_i, e_j) = \omega(f_i, f_j) = 0$。辛形式在辛基下的矩阵为 $\begin{pmatrix} 0 & I \\ -I & 0 \end{pmatrix}$。

*证明概要*：设 $\dim V = m$，任选基下 $\omega$ 的矩阵 $A$ 为反对称矩阵（$A^T = -A$）。非退化性 $\iff \det A \neq 0$。对任意反对称矩阵 $A$，$\det A = \det(A^T) = \det(-A) = (-1)^m \det A$。当 $m$ 为奇数时，$\det A = -\det A \Rightarrow \det A = 0$，与非退化矛盾。故 $m$ 必为偶数 $2n$。辛基的存在性由归纳构造：取任意 $e_1 \neq 0$，由非退化性存在 $f_1$ 使 $\omega(e_1, f_1) = 1$，在辛正交补 $\{e_1, f_1\}^\omega$ 上继续归纳即得。∎

**定义 242.2**（辛群 $\operatorname{Sp}(2n)$）：**辛群** $\operatorname{Sp}(2n, \mathbb{R}) = \{A \in \operatorname{GL}(2n, \mathbb{R}) : A^T \Omega A = \Omega\}$，其中 $\Omega = \begin{pmatrix} 0 & I \\ -I & 0 \end{pmatrix}$。

### 242.2 辛流形

**定义 242.3**（辛流形）：**辛流形** $(M, \omega)$ 是光滑流形 $M$ 配备闭（$d\omega = 0$）且非退化（$\omega^n \neq 0$ 处处）的 2-形式 $\omega \in \Omega^2(M)$。$\dim M = 2n$。

**例 242.1**（辛流形的例子）：
- $\mathbb{R}^{2n}$ 的标准辛形式：$\omega_0 = \sum_i dq_i \wedge dp_i$
- 余切丛 $T^*Q$ 配备典范辛形式 $\omega = -d\lambda$，其中 Liouville 形式 $\lambda = \sum_i p_i dq_i$
- Kähler 流形 $(M, J, g)$ 的 Kähler 形式 $\omega(\cdot, \cdot) = g(J\cdot, \cdot)$ 是辛形式
- 余伴随轨道（Kirillov-Kostant-Souriau）：李群 $G$ 的余伴随轨道具有自然辛结构

**定理 242.1**（Darboux 定理）：任何辛流形 $(M^{2n}, \omega)$ 局部同构于 $(\mathbb{R}^{2n}, \omega_0)$。即辛几何无局部不变量——所有 2n 维辛流形局部看起来都一样。

*证明思路*：用 Moser 道路法（Moser's path method）。设 $p \in M$，取 $p$ 附近的局部坐标使 $\omega|_p = \omega_0|_p$（先通过线性代数找到辛基，再用指数映射拉平到一阶）。构造辛形式的线性同伦 $\omega_t = (1-t)\omega_0 + t\omega$，在 $p$ 的某邻域上 $\omega_t$ 均为闭的且 $\omega_t|_p = \omega_0|_p$。由 Poincare 引理，$\omega - \omega_0 = d\alpha$（$\alpha$ 为 1-形式，可选取使得 $\alpha|_p = 0$）。目标是寻找一族微分同胚 $\phi_t$（$\phi_0 = \operatorname{id}$）满足 $\phi_t^* \omega_t = \omega_0$。对 $t$ 求导得 $\phi_t^*(\mathcal{L}_{X_t} \omega_t + \dot{\omega}_t) = 0$，其中 $X_t$ 是 $\phi_t$ 的生成向量场。需解 $\mathcal{L}_{X_t} \omega_t + \dot{\omega}_t = 0$。利用 Cartan 公式 $\mathcal{L}_{X_t} \omega_t = d(\iota_{X_t} \omega_t)$ 和 $\dot{\omega}_t = d\alpha$，方程化为 $d(\iota_{X_t} \omega_t + \alpha) = 0$。由于 $\omega_t$ 非退化（在 $p$ 的充分小邻域上），可从 $\iota_{X_t} \omega_t = -\alpha$ 唯一解出 $X_t$。因 $\alpha|_p = 0$，$X_t|_p = 0$，故 $X_t$ 的流 $\phi_t$ 在小邻域上定义至 $t=1$。于是 $\phi_1^* \omega = \phi_1^* \omega_1 = \omega_0$，即 Darboux 坐标存在。∎

### 242.3 Hamilton 力学与辛几何

**定义 242.4**（Hamilton 向量场）：对函数 $H \in C^\infty(M)$，其 **Hamilton 向量场** $X_H$ 由 $\iota_{X_H} \omega = dH$ 唯一确定。

**定义 242.5**（Poisson 括号）：$C^\infty(M)$ 上的 **Poisson 括号**为 $\{F, G\} = \omega(X_F, X_G) = dF(X_G)$。Poisson 括号满足 Jacobi 恒等式，使 $(C^\infty(M), \{\cdot, \cdot\})$ 成为 Poisson 代数。

**推论 242.2**（Liouville 定理 / 相空间体积守恒）：Hamilton 流 $\phi_H^t$ 保持辛体积形式 $\omega^n/n!$：$(\phi_H^t)^* \omega^n = \omega^n$。特别是，Hamilton 相流不可压缩。

**定理 242.3**（Noether 定理的辛表述）：若 $G$ 通过辛同胚作用在 $(M, \omega)$ 上，且作用有矩映射 $\mu: M \to \mathfrak{g}^*$（$\langle \mu, \xi \rangle$ 的 Hamilton 向量场生成 $G$ 作用），则 $\mu$ 沿 Hamilton 流守恒：$\mu \circ \phi_H^t = \mu$（若 $\{H, \mu\} = 0$）。

---

---

## 第243章：辛约化与矩映射
辛约化（Marsden-Weinstein 约化）是构造新辛流形的基本方法，是经典力学中消除对称性（如守恒量）的数学抽象。

### 243.1 矩映射与 Hamilton 群作用

**定义 243.1**（Hamilton 群作用 / 辛作用）：李群 $G$ 在辛流形 $(M, \omega)$ 上的辛作用称为 **Hamilton 作用**，如果每个 $\xi \in \mathfrak{g}$ 对应的无穷小生成元 $X_\xi$ 是某个函数 $H_\xi$ 的 Hamilton 向量场。

**定义 243.2**（矩映射 / Moment Map）：$G$-等变映射 $\mu: M \to \mathfrak{g}^*$ 称为 **矩映射**（或动量映射），如果对所有 $\xi \in \mathfrak{g}$，$\langle \mu, \xi \rangle$ 是 $X_\xi$ 的 Hamilton 函数：

$$d\langle \mu, \xi \rangle = \iota_{X_\xi} \omega$$

**例 243.1**（余切丛的矩映射）：$G$ 左作用在 $Q$ 上，提升到 $T^*Q$。矩映射为 $\langle \mu(q, p), \xi \rangle = p(X_\xi(q))$（线性动量）。

### 243.2 Marsden-Weinstein 约化

**定理 243.1**（Marsden-Weinstein-Meyer 辛约化定理，1974）：设 $G$ 以 Hamilton 作用在 $(M, \omega)$ 上，$\mu: M \to \mathfrak{g}^*$ 是矩映射。若 $a \in \mathfrak{g}^*$ 是 $\mu$ 的正则值且 $G_a$（$a$ 的迷向子群）自由作用于 $\mu^{-1}(a)$，则商空间

$$M /\!/ G(a) = \mu^{-1}(a) / G_a$$

具有唯一的辛结构 $\omega_{\text{red}}$，满足 $\pi^* \omega_{\text{red}} = \iota^* \omega$（$\iota: \mu^{-1}(a) \hookrightarrow M$，$\pi: \mu^{-1}(a) \to M /\!/ G(a)$ 是投影）。

**定理 243.2**（约化的维数）：$\dim(M /\!/ G(a)) = \dim M - 2 \dim G_a$。特别地，若 $G$ 以有效自由作用在 $\mu^{-1}(a)$ 上，则 $\dim(M /\!/ G(a)) = \dim M - 2 \dim G$。

**例 243.2**（辛约化的例子）：
- Kepler 问题通过 $\operatorname{SO}(3)$ 约化消除角动量对称性（二维有效问题）
- 复射影空间 $\mathbb{C}P^n = S^{2n+1} /\!/ S^1$（使用 Hopf 纤维的辛约化）
- 模空间的矩映射构造：平坦联络的模空间 $M_{\text{flat}}$ 是辛约化的商

### 243.3 Delzant 定理与环面簇

**定义 243.3**（环面辛流形 / Toric Symplectic Manifold）：紧致连通辛流形 $(M^{2n}, \omega)$ 是**环面的**，如果它容许 $\mathbb{T}^n$ 的有效 Hamilton 作用（最大可能的环面维数）。

**定理 243.3**（Delzant 定理，1988）：紧致环面辛流形与 Delzant 多面体（有理多面体，满足在每个顶点处边方向形成 $\mathbb{Z}$-基）之间存在一一对应。矩映射的像 $\mu(M)$ 恰好是 Delzant 多面体。

---

---

## 第244章：伪全纯曲线与 Gromov-Witten 理论
Gromov 在 1985 年引入了伪全纯曲线方法，革命性地改变了辛几何。这是辛几何「刚性」的源泉，也是 Gromov-Witten 不变量和镜对称的基础。

### 244.1 近复结构与伪全纯曲线

**定义 244.1**（与辛形式相容的近复结构）：流形 $M$ 上的**近复结构** $J$ 满足 $J^2 = -\operatorname{id}$。$J$ 与辛形式 $\omega$ **相容**（compatible），如果 $g_J(v, w) = \omega(v, Jw)$ 是 Riemann 度量。^[注：**tame** 是更弱的条件——仅要求 $\omega(v, Jv) > 0$ 对所有 $v \neq 0$ 成立，而不要求 $g_J$ 是对称的。compatible 等价于 tame + $J$ 是 $\omega$-不变的（即 $\omega(Jv, Jw) = \omega(v, w)$）。]

**定理 244.1**（相容近复结构的存在性）：辛流形 $(M, \omega)$ 上相容近复结构的空间 $\mathcal{J}(M, \omega)$ 是非空且可缩的。

**定义 244.2**（$J$-全纯曲线）：映射 $u: (\Sigma, j) \to (M, J)$（$\Sigma$ 是 Riemann 面）是 **$J$-全纯的**，如果

$$\bar{\partial}_J u = \frac{1}{2}(du + J \circ du \circ j) = 0$$

即 $(u, J)$-全纯曲线的 Cauchy-Riemann 方程。

**定理 244.2**（能量恒等式）：$J$-全纯曲线 $u$ 的能量 $E(u) = \frac{1}{2} \int_\Sigma |du|^2 d\operatorname{vol}_\Sigma = \int_\Sigma u^* \omega$。因此 $J$-全纯曲线的面积等于辛面积（拓扑量）。

### 244.2 Gromov 紧致性与非压缩定理

**定理 244.3**（Gromov 紧致性定理，1985）：具有一致有界能量的 $J$-全纯曲线的序列可以「气泡化」收敛到节点 $J$-全纯曲线（nodal $J$-holomorphic curve），除有限个「气泡」点外在 $\Sigma$ 上光滑收敛。

**定理 244.4**（Gromov 非压缩定理 / Non-Squeezing Theorem）：若存在辛嵌入 $B^{2n}(R) \hookrightarrow B^2(r) \times \mathbb{R}^{2n-2}$（柱面），则 $R \leq r$。即一个大的辛球不能被「挤入」一个细的辛柱面中——这是辛刚性的里程碑。

*证明思路*：使用伪全纯曲线。在 $\mathbb{C}P^1$ 的辛嵌入中，$J$-全纯球的不变量限制了 $R$ 和 $r$ 的关系。能量 $\geq \pi R^2$ 但面积受限于 $\pi r^2$。∎

### 244.3 Gromov-Witten 不变量

**定义 244.3**（Gromov-Witten 不变量）：辛流形 $(M, \omega)$ 的 **Gromov-Witten 不变量**是映射

$$\operatorname{GW}_{g, k, A}: H^*(M)^{\otimes k} \to \mathbb{Q}$$

计数（在适当意义下）亏格 $g$、$k$ 个标记点且同调类为 $A \in H_2(M; \mathbb{Z})$ 的 $J$-全纯曲线的数目。形式上，

$$\operatorname{GW}_{g, k, A}(\alpha_1, \ldots, \alpha_k) = \int_{[\overline{\mathcal{M}}_{g,k}(M, A)]^{\text{vir}}} \prod_{i=1}^k \operatorname{ev}_i^* \alpha_i$$

其中 $\overline{\mathcal{M}}_{g,k}(M, A)$ 是稳定映射的模空间（紧化），$[\cdot]^{\text{vir}}$ 是虚基本类。

**定理 244.5**（GW 不变量与计数几何）：对合适的 $\alpha_i$（如 Poincaré 对偶于点类的上同调类），GW 不变量计算特定几何约束下的 $J$-全纯曲线数。这些数字是辛不变量（不依赖于 $J$ 的选择）。

### 244.4 量子上同调与 WDVV 方程

**定义 244.4**（量子上同调环 / Quantum Cohomology）：$M$ 的**量子上同调** $QH^*(M)$ 是 $H^*(M; \mathbb{C})$ 作为向量空间，但乘法量子变形：

$$\alpha * \beta = \sum_{A \in H_2(M)} (\alpha * \beta)_A \cdot q^A$$

其中 $(\alpha * \beta)_A$ 由三个点的 GW 不变量给出：$\langle \alpha, \beta, \gamma \rangle_A = \operatorname{GW}_{0,3,A}(\alpha, \beta, \gamma)$。

**定理 244.6**（WDVV 方程 / Witten-Dijkgraaf-Verlinde-Verlinde 方程）：量子上同调的关联函数满足 WDVV 方程，这是 GW 势的完全可积系统的条件。WDVV 方程等价于量子上同调的结合性。

---

---

## 第245章：切触几何
切触几何是奇数维流形上的几何，与辛几何通过「辛化」（symplectization）紧密相连。切触几何是热力学、光学和三维拓扑的自然语言。

### 245.1 切触结构

**定义 245.1**（切触流形）：奇数维流形 $M^{2n+1}$ 上的**切触结构** $\xi$ 是余维 1 的极大非可积超平面场。局部地，$\xi = \ker \alpha$，其中 **切触形式** $\alpha \in \Omega^1(M)$ 满足 $\alpha \wedge (d\alpha)^n \neq 0$ 处处。

**例 245.1**（切触流形的例子）：
- $\mathbb{R}^{2n+1}$ 的标准切触形式：$\alpha_0 = dz - \sum_{i=1}^n y_i dx_i$
- Legendre 子流形 $\Lambda \subset T^*Q \times \mathbb{R}$：$\alpha = dz - \lambda$ 的积分子流形
- 给定切触流形 $(M, \alpha)$，其**辛化**（symplectization）是辛流形 $(M \times \mathbb{R}, d(e^t \alpha))$。反之，若辛流形 $(M, \omega)$ 满足 $\omega = d\alpha$ 为恰当形式（如余切丛 $T^*Q$），则 $(M, \alpha)$ 也可视为一个切触流形
- $S^{2n+1} \subset \mathbb{C}^{n+1}$ 的标准切触结构（由复切空间诱导）

**定义 245.2**（Legendre 子流形）：切触流形 $(M^{2n+1}, \xi)$ 的最大维积分子流形（维数为 $n$）称为 **Legendre 子流形**。它们是辛几何中 Lagrangian 子流形的切触类比。

### 245.2 切触同调

**定义 245.3**（Reeb 向量场）：切触形式 $\alpha$ 的 **Reeb 向量场** $R_\alpha$ 由 $\iota_{R_\alpha} d\alpha = 0$ 和 $\alpha(R_\alpha) = 1$ 唯一确定。Reeb 向量场是 Hamilton 向量场的切触类比。

**定义 245.4**（切触同调 / Contact Homology，Eliashberg-Givental-Hofer 2000）：切触流形 $(M, \xi)$ 的**切触同调** $HC_*(M, \xi)$ 由 Reeb 轨道的链复形生成，边界算子计数伪全纯曲线。切触同调是切触结构的不变量。

**定理 245.1**（切触几何的刚性 / Eliashberg 1989）：在维数 $> 3$ 的闭流形上，所有过度扭转（overtwisted）切触结构是同痕的，但紧切触（tight）结构形成更丰富的分类。即切触几何将流形的切触结构分为两类：柔性的（过度扭转）和刚性的（紧的）。

### 245.3 三维切接触拓扑

**定义 245.5**（三维切触拓扑的特殊性）：维数 3 中切触结构 $\xi$ 的平面场可以用特征叶理（characteristic foliation）和开卷分解（open book decomposition）研究。Giroux 定理建立了开卷分解与切触结构之间的对应。

**定理 245.2**（Giroux 定理，2000）：三维闭流形上的切触结构（模同痕）与开卷分解（模正稳定化）一一对应。这是理解和分类三维切触结构的基本工具。

---

---

## 第246章：Fukaya 范畴与镜对称
Fukaya 范畴是辛流形中 Lagrangian 子流形的 $A_\infty$-范畴，是 Kontsevich 的同调镜对称猜想中的核心对象。

### 246.1 Lagrangian 子流形与 Floer 同调

**定义 246.1**（Lagrangian 子流形）：辛流形 $(M^{2n}, \omega)$ 的 $n$ 维子流形 $L$ 是 **Lagrangian** 的，如果 $\omega|_L = 0$。Lagrangian 子流形是辛几何中最基本的对象。

**定义 246.2**（Lagrangian Floer 同调）：对两个横截相交的 Lagrangian 子流形 $L_0, L_1$，**Lagrangian Floer 同调** $HF(L_0, L_1)$ 由交点生成，边界算子计数连接交点的伪全纯带（strip）。$HF(L_0, L_1)$ 在 Hamiltonian 同痕下不变。

**定理 246.1**（Floer 的 Lagrangian 交猜想 / Arnold 猜想）：在适当条件下，$\operatorname{rank} HF(L_0, L_1) \leq \sum_k \dim H^k(L_0)$，且若 $L_0 \pitchfork L_1$，则 $|L_0 \cap L_1| \geq \sum_k \dim H^k(L_0)$。

### 246.2 Fukaya $A_\infty$-范畴

**定义 246.3**（$A_\infty$-范畴）：一个 **$A_\infty$-范畴** $\mathcal{C}$ 由以下数据组成：
- 一组对象 $\operatorname{Ob}(\mathcal{C})$
- 对每对对象 $X, Y$，一个分次向量空间 $\operatorname{Hom}_{\mathcal{C}}(X, Y)$
- 对每个 $k \geq 1$，$k$ 阶乘法运算 $\mu^k: \operatorname{Hom}(X_{k-1}, X_k) \otimes \cdots \otimes \operatorname{Hom}(X_0, X_1) \to \operatorname{Hom}(X_0, X_k)$，次数为 $\deg \mu^k = 2 - k$

这些运算满足 $A_\infty$ 关系：对所有 $k \geq 1$，
$$\sum_{r+s+t = k} (-1)^{r+st} \mu^{r+1+t}(\mathrm{id}^{\otimes r} \otimes \mu^s \otimes \mathrm{id}^{\otimes t}) = 0$$

其中符号规则中 $(-1)^{r+st}$ 的指数由 Koszul 符号约定确定。特别地：
- $\mu^1 \circ \mu^1 = 0$（$\mu^1$ 是微分）
- $\mu^1(\mu^2(a, b)) = \mu^2(\mu^1(a), b) + (-1)^{|a|} \mu^2(a, \mu^1(b))$（Leibniz 法则）
- $\mu^2$ 的结合律在同伦意义下成立：$\mu^2(\mu^2(a, b), c) - \mu^2(a, \mu^2(b, c)) = \pm \mu^1(\mu^3(a, b, c)) \pm \mu^3(\mu^1(a), b, c) \pm \mu^3(a, \mu^1(b), c) \pm \mu^3(a, b, \mu^1(c))$

**定义 246.4**（Fukaya 范畴 / Fukaya 1993）：辛流形 $(M, \omega)$ 的 **Fukaya 范畴** $\mathcal{F}uk(M)$ 是一个 $A_\infty$-范畴，其中：
- 对象：合适的 Lagrangian 子流形（带额外的结构：自旋结构、分次、局部系统）
- 态射空间：$\operatorname{Hom}(L_0, L_1) = CF^*(L_0, L_1)$（Floer 链复形），其生成元为 $L_0$ 与 $L_1$ 的横截交点，分次由 Maslov 指标给出
- $A_\infty$ 运算 $\mu^k$：$\mu^1$ 是 Floer 微分（计数全纯带），$\mu^k$（$k \geq 2$）由 $k+1$ 个边界标记点的全纯 $k$-边形的计数给出，即全纯映射 $u: D^2 \setminus \{z_0, \ldots, z_k\} \to M$ 的模空间在 $\mathbb{R}$ 平移下的商

**定理 246.2**（$A_\infty$-关系的几何来源）：Floer 微分的平方 $\mu^1 \circ \mu^1 = 0$ 由模空间的边界给出（气泡化和断裂）。$\mu^2$ 结合律的偏差 $\mu^2(\mu^2(a, b), c) - \mu^2(a, \mu^2(b, c))$ 由 $\mu^3$ 对边界算子的同伦给出。所有 $A_\infty$ 关系来自模空间紧化边界的几何。

### 246.3 Kontsevich 同调镜对称

**定义 246.5**（同调镜对称猜想 / Homological Mirror Symmetry，Kontsevich 1994）：对镜面对 $(X, \check{X})$（$X$ 是 Calabi-Yau 辛流形，$\check{X}$ 是其镜面复流形），存在范畴等价：

$$D^b \mathcal{F}uk(X) \cong D^b \operatorname{Coh}(\check{X})$$

即 $X$ 的 Fukaya 范畴的导出范畴（辛几何）等价于镜面 $\check{X}$ 的相干层范畴的导出范畴（复代数几何）。

**定理 246.3**（镜对称的部分证明）：
- 椭圆曲线：Polishchuk-Zaslow（1998）证明了 $T^2$ 的同调镜对称
- 四次曲面（quartic surface）：Seidel（2015）和 Sheridan（2015）证明
- 环面簇的衍生范畴等价：由 Abouzaid、Fang、Liu 等人证明
- 完全交和超曲面的镜对称：多个作者推进

### 246.4 SYZ 猜想与 Strominger-Yau-Zaslow

**定义 246.6**（SYZ 猜想，Strominger-Yau-Zaslow 1996）：接近大体积极限的 Calabi-Yau 流形 $X$ 是特殊 Lagrangian 环面 $T^n$ 的纤维化（$T^n$-对偶 / T-duality）。镜面 $\check{X}$ 通过对偶纤维构造。

**定理 246.4**（SYZ 的 T-对偶图像）：在 SYZ 图像下，$X$ 上的 Lagrangian 子流形对应 $\check{X}$ 上的全纯向量丛（通过纤维 $T^n$ 上的 Fourier-Mukai 变换），$X$ 上的伪全纯曲线对应 $\check{X}$ 上相干层的修正复形。

---

*本卷在微分几何（V12）和代数拓扑（V15）的基础上，系统建立了辛几何（Darboux 定理、Hamilton 力学、Noether 定理）、辛约化（Marsden-Weinstein 约化、Delzant 定理）、Gromov-Witten 理论（伪全纯曲线、量子上同调、WDVV）、切触几何（Reeb 动力学、切触同调、Giroux 定理）和 Fukaya 范畴与镜对称（Lagrangian Floer 同调、Kontsevich 猜想、SYZ 猜想）的理论体系。共 5 章。*


---

---

## 第111章（补充）
> 非交换几何由 Alain Connes 在 1980 年代创立，将经典的微分几何推广到非交换代数框架。其核心思想是：空间与函数代数是等价的（Gelfand-Naimark 定理），非交换代数对应"非交换空间"。本卷在 C*-代数（V14）和 von Neumann 代数（V31）的基础上，建立谱三元组、循环上同调、非交换微分形式和标准模型几何。Connes 因算子代数理论（特别是 III 型因子的分类与结构定理）以及对叶状结构和微分几何的应用获 1982 年 Fields 奖。

---

---

## 第192章：谱三元组
谱三元组（spectral triple）是非交换几何的基本对象，它将 Dirac 算子的概念推广到非交换代数。

### 192.1 从 Gelfand-Naimark 到非交换空间

**定理 192.1**（Gelfand-Naimark 定理回顾）：紧 Hausdorff 空间 $X$ 上的连续函数代数 $C(X)$ 是交换 C*-代数。反之，任何交换 C*-代数 $\cong C(X)$（$X$ 是其谱空间）。这建立了空间与交换代数之间的范畴等价。

**Connes 的核心洞察**：将"空间"推广为"非交换 C*-代数"，从而"非交换空间"上的几何由非交换代数上的结构定义。

**定义 192.1**（谱三元组）：**谱三元组** $(\mathcal{A}, \mathcal{H}, \mathcal{D})$ 由以下组成：
1. $\mathcal{A}$：*-代数，在 Hilbert 空间 $\mathcal{H}$ 上有界表示 $\pi: \mathcal{A} \to \mathcal{B}(\mathcal{H})$
2. $\mathcal{D}$：$\mathcal{H}$ 上的自伴算子（未必有界），称为 **Dirac 算子**
3. $[\mathcal{D}, \pi(a)]$ 对所有 $a \in \mathcal{A}$ 是有界算子
4. $\mathcal{D}$ 具有紧预解式：$(\mathcal{D} - \lambda)^{-1}$ 对所有 $\lambda \notin \mathbb{R}$ 是紧算子

谱三元组是 Connes 非交换几何的基本数据，它由三个对象组成：非交换代数 $\mathcal{A}$（取代函数空间）、Hilbert 空间 $\mathcal{H}$（表示空间）和 Dirac 算子 $\mathcal{D}$（编码度量几何）。这三个要素分别对应了经典几何中"空间上的函数""旋量场空间"和"Dirac 算子"三重角色。条件 (3) 保证了 $\mathcal{A}$ 与 $\mathcal{D}$ 的交换子有界——即代数元素在度量意义下是 Lipschitz 连续的；条件 (4) 保证了 $\mathcal{D}$ 的逆（在某种迹类理想中）具有紧性——对应几何空间具有有限的"测度"。谱三元组的魅力在于，它仅用泛函分析和算子代数语言就完全刻画了 Riemann 自旋流形的全部几何数据：度量、旋量结构、示性类和指标理论皆可由 $(\mathcal{A}, \mathcal{H}, \mathcal{D})$ 恢复。

**例 192.1**（经典谱三元组）：紧 Riemann 自旋流形 $M$ 上的 Dirac 算子给出谱三元组 $(C^\infty(M), L^2(S), \mathcal{D}_M)$，其中 $S$ 是自旋丛，$\mathcal{D}_M$ 是 Dirac 算子。

**定义 192.2**（谱三元组的维数）：谱三元组有**维数** $n$（或更一般地，有**维数谱**），如果 $|\mathcal{D}|^{-1}$ 属于 Dixmier 理想 $\mathcal{L}^{(n,\infty)}$，即 $\mu_k(|\mathcal{D}|^{-1}) = O(k^{-1/n})$（$\mu_k$ 是奇异值）。

### 192.2 Dirac 算子与非交换度量

**定理 192.2**（Connes 的距离公式，1989）：在经典情形的谱三元组 $(C^\infty(M), L^2(S), \mathcal{D}_M)$ 上，Riemann 距离被 Dirac 算子完全恢复：

$$d(x, y) = \sup\{|f(x) - f(y)| : f \in C^\infty(M), \|[D, f]\| \leq 1\}$$

这给出了非交换几何中"度量"的纯代数定义！

**定义 192.3**（非交换度量）：对谱三元组 $(\mathcal{A}, \mathcal{H}, \mathcal{D})$，$\mathcal{A}$ 的态空间（纯态）上的距离定义为

$$d(\varphi, \psi) = \sup\{|\varphi(a) - \psi(a)| : a \in \mathcal{A}, \|[D, a]\| \leq 1\}$$

**例 192.2**（非交换环面）：非交换 2-环面 $\mathbb{T}_\theta^2$ 的谱三元组由以下数据定义：
- $\mathcal{A} = A_\theta$（旋转代数，由 $U, V$ 生成，满足 $VU = e^{2\pi i\theta} UV$）
- $\mathcal{H} = L^2(A_\theta) \otimes \mathbb{C}^2$（带自旋结构）
- $\mathcal{D} = \begin{pmatrix} 0 & \partial_1 - i\partial_2 \\ \partial_1 + i\partial_2 & 0 \end{pmatrix}$

### 192.3 正则性与有限性

**定义 192.4**（正则谱三元组）：谱三元组是**正则**的，如果 $\mathcal{A}$ 和 $[\mathcal{D}, \mathcal{A}]$ 属于 $\bigcap_{k \geq 1} \operatorname{Dom}(\delta^k)$，其中 $\delta(T) = [|\mathcal{D}|, T]$。

**定义 192.5**（有限谱三元组 / Fredholm 模）：谱三元组是**偶**的（even），如果存在 $\mathbb{Z}_2$-分次算子 $\gamma$（$\gamma = \gamma^*$，$\gamma^2 = 1$）使得 $\gamma \mathcal{D} = -\mathcal{D}\gamma$ 和 $\gamma a = a\gamma$ 对所有 $a \in \mathcal{A}$。否则是**奇**的（odd）。

**定义 192.6**（实结构）：谱三元组的**实结构**是反线性等距 $J: \mathcal{H} \to \mathcal{H}$，满足 $J^2 = \pm 1$，$J\mathcal{D} = \pm \mathcal{D}J$，$J\gamma = \pm \gamma J$（偶情形），以及 $[a, Jb^*J^{-1}] = 0$ 对所有 $a, b \in \mathcal{A}$（交换性条件）。

8 种可能的符号组合（$J^2, J\mathcal{D}, J\gamma$ 的符号）对应 KO-维数模 8 的 8 种情形（Bott 周期性）。

**定理 192.3**（Connes 的谱三元组公理）：实谱三元组满足 7 条公理，包括正则性、有限性、一阶条件（$[[\mathcal{D}, a], Jb^*J^{-1}] = 0$）、定向性、Poincaré 对偶等。这些公理精确刻画了"自旋流形上的 Dirac 算子"的代数量子化。

*各公理的几何动机*：**(1) 正则性**：$\mathcal{A}$ 及 $[\mathcal{D},\mathcal{A}]$ 对 $\delta(\cdot)=[|\mathcal{D}|,\cdot]$ 的光滑性，对应流形上 $C^\infty$ 函数在Dirac算子下的光滑作用。**(2) 有限性**：$\bigcap_k \operatorname{Dom}(\mathcal{D}^k)$ 是有限投射 $\mathcal{A}$-模，推广了自旋丛截面的有限生成性。**(3) 一阶条件**：$[[\mathcal{D},a], Jb^*J^{-1}]=0$ 确保Dirac算子是一阶微分算子——$[\mathcal{D},a]$ 与右乘作用对易，这是流形上Dirac算子的本质特征。**(4) 定向性**：存在Hochschild $n$-圈 $c$ 满足 $\pi(c)=\gamma$，编码了体积形式的存在性。**(5) Poincaré对偶**：Fredholm指标与 $K$-理论的配对非退化，对应经典流形上的Poincaré对偶。**(6) 实结构符号**：$J^2, J\mathcal{D}, J\gamma$ 的八种符号组合对应KO-维数（Bott周期性模8），反映旋量表示的实结构分类。**(7) 谱维数**：$|\mathcal{D}|^{-1} \in \mathcal{L}^{(n,\infty)}$ 指定了非交换空间的维数。∎

---

---

## 第193章：循环上同调
循环上同调（cyclic cohomology）是 Connes 为非交换空间引入的上同调理论，它推广了 de Rham 上同调，是非交换微分几何的核心工具。

### 193.1 Hochschild 与循环上同调

**定义 193.1**（Hochschild 上链）：代数 $\mathcal{A}$ 上的 $n$-**Hochschild 上链**是 $(n+1)$-线性泛函 $\varphi: \mathcal{A}^{n+1} \to \mathbb{C}$。Hochschild 上边缘算子 $b$ 为

$$(b\varphi)(a_0, \ldots, a_{n+1}) = \sum_{i=0}^n (-1)^i \varphi(a_0, \ldots, a_i a_{i+1}, \ldots, a_{n+1}) + (-1)^{n+1} \varphi(a_{n+1}a_0, a_1, \ldots, a_n)$$

$b^2 = 0$，定义 **Hochschild 上同调** $HH^n(\mathcal{A})$。

**定义 193.2**（循环上链）：**循环 $n$-上链**是满足循环条件的 Hochschild 上链：

$$\varphi(a_n, a_0, a_1, \ldots, a_{n-1}) = (-1)^n \varphi(a_0, a_1, \ldots, a_n)$$

**循环上边缘算子** $B$（Connes 算子）为

$$(B\varphi)(a_0, \ldots, a_{n-1}) = \sum_{i=0}^{n-1} (-1)^{(n-1)i} \varphi(1, a_i, a_{i+1}, \ldots, a_{i-1})$$

$B^2 = 0$，$bB + Bb = 0$。**循环上同调** $HC^n(\mathcal{A})$ 是 $(b, B)$-双复形的上同调。

**定理 193.1**（Connes 的 SBI 长正合列）：Hochschild 上同调和循环上同调之间存在长正合列：

$$\cdots \to HH^n(\mathcal{A}) \xrightarrow{I} HC^n(\mathcal{A}) \xrightarrow{S} HC^{n-2}(\mathcal{A}) \xrightarrow{B} HH^{n+1}(\mathcal{A}) \to \cdots$$

其中 $S$ 是周期映射，$I$ 是包含映射，$B$ 是 Connes 算子。

### 193.2 Chern 特征标

**定义 193.3**（Fredholm 模的 Chern 特征标）：设 $(\mathcal{A}, \mathcal{H}, F)$ 是奇 Fredholm 模（$F = \operatorname{sign}(\mathcal{D})$）。其 **Chern 特征标**是循环上循环 $\tau_n$（$n$ 为奇数）：

$$\tau_n(a_0, \ldots, a_n) = \operatorname{Tr}(F[F, a_0][F, a_1] \cdots [F, a_n])$$

其中 $\operatorname{Tr}$ 是 Dixmier 迹（或其推广）。

**定理 193.2**（Chern 特征标与 $K$-理论）：Chern 特征标诱导从 $K$-理论到循环上同调的配对（Chern-Connes 配对）：

$$\langle [e], [\varphi] \rangle = \frac{1}{n!} \varphi_{2n}(e, e, \ldots, e)$$

其中 $[e] \in K_0(\mathcal{A})$，$[\varphi] \in HC^{2n}(\mathcal{A})$。这是非交换几何中指标定理的核心。

**定理 193.3**（局部指标公式，Connes-Moscovici 1995）：对正则谱三元组，Chern 特征标在循环上同调中的类可由局部公式（涉及 $\mathcal{D}$ 的预解式和 $\mathcal{A}$ 的泛函演算）表示。这推广了 Atiyah-Singer 指标定理。

### 193.3 周期循环上同调

**定义 193.4**（周期循环上同调）：**周期循环上同调** $HP^*(\mathcal{A})$（$* = 0, 1$）定义为

$$HP^0(\mathcal{A}) = \varinjlim HC^{2n}(\mathcal{A}), \quad HP^1(\mathcal{A}) = \varinjlim HC^{2n+1}(\mathcal{A})$$

其中正向极限由 $S$ 映射给出。周期循环上同调是 $K$-理论的对偶理论。

**定理 193.4**（Connes 的周期精确性）：设 $0 \to \mathcal{J} \to \mathcal{A} \to \mathcal{A}/\mathcal{J} \to 0$ 是代数的扩张。则在 $K$-理论和周期循环上同调之间存在自然的六项正合列，推广了拓扑 $K$-理论的 Bott 周期性。

---

---

## 第194章：非交换微分形式
非交换微分形式将经典微分几何的外代数推广到非交换代数，是非交换几何中积分和示性类的核心。

### 194.1 泛微分分次代数

**定义 194.1**（泛微分分次代数）：代数 $\mathcal{A}$ 的**泛微分分次代数**（universal differential graded algebra）$\Omega^\bullet(\mathcal{A})$ 是 $\mathcal{A}$ 上的自由分次代数，由 $\mathcal{A}$（次数 0）和 $da$（$a \in \mathcal{A}$，次数 1）生成，满足 $d(ab) = da \cdot b + a \cdot db$ 和 $d(1) = 0$。

$\Omega^k(\mathcal{A})$ 的元素是 $a_0 da_1 da_2 \cdots da_k$ 的线性组合。

**命题 194.1**（泛微分形式与 Hochschild 同调）：$\Omega^k(\mathcal{A})$ 与 Hochschild 同调 $HH_k(\mathcal{A})$ 之间有自然联系，由映射

$$a_0 da_1 \cdots da_k \mapsto a_0 \otimes a_1 \otimes \cdots \otimes a_k$$

诱导。

### 194.2 非交换积分

**定义 194.2**（Dixmier 迹）：设 $T$ 是紧算子，$\mu_n(T)$ 为其奇异值。若 $\frac{1}{\log N} \sum_{n=1}^N \mu_n(T)$ 有极限 $\lim_{N \to \infty}$，则此极限为 $T$ 的 **Dixmier 迹** $\operatorname{Tr}_\omega(T)$（依赖于广义极限 $\omega$）。若该极限存在且与 $\omega$ 无关，$T$ 称为**可测**的。

**定义 194.3**（非交换积分）：设 $(\mathcal{A}, \mathcal{H}, \mathcal{D})$ 是 $n$ 维谱三元组。**非交换积分**（noncommutative integral）定义为

$$\int a \, ds^n = \operatorname{Tr}_\omega(a |\mathcal{D}|^{-n})$$

当 $a|\mathcal{D}|^{-n}$ 可测时。这推广了经典 Riemann 流形上的积分 $\int_M f \, dV$。

**定理 194.1**（Connes 的迹定理，1988）：对紧 $n$ 维自旋流形 $M$，Dirac 算子 $\mathcal{D}_M$ 满足

$$\operatorname{Tr}_\omega(f |\mathcal{D}_M|^{-n}) = c_n \int_M f \, dV$$

其中 $c_n = 2^{[n/2]} \pi^{n/2} / (n \Gamma(n/2))$。Dixmier 迹恢复了经典的积分！

**定理 194.2**（非交换留数，Wodzicki 1984）：伪微分算子 $P$ 的**非交换留数**（Wodzicki residue）定义为

$$\operatorname{Res}(P) = \operatorname{Tr}_\omega(P |\mathcal{D}|^{-n})$$

$\operatorname{Res}$ 是迹（trace）——即 $\operatorname{Res}([A, B]) = 0$。在经典流形上，$\operatorname{Res}(P)$ 等于 $P$ 的符号的非交换留数（Guillemin 留数）。

### 194.3 非交换示性类

**定义 194.4**（Chern 特征标，非交换形式）：在非交换几何中，投影 $e \in M_N(\mathcal{A})$ 的 Chern 特征标由循环上循环

$$\operatorname{Ch}_n(e) = \operatorname{Tr}(e - \frac{1}{2}) de \cdots de \quad (2n \text{ 个 } de)$$

给出。这推广了微分几何中的 Chern-Weil 理论。

**定理 194.3**（非交换指标定理，Connes 1979）：对 $p$-可求和 Fredholm 模 $(\mathcal{A}, \mathcal{H}, F)$，

$$\operatorname{Index}(eFe) = \langle \operatorname{Ch}_*(e), \tau_* \rangle$$

其中 $\tau_*$ 是 Fredholm 模的 Chern 特征标。这是 Atiyah-Singer 指标定理的非交换推广。

---

---

## 第195章：标准模型的非交换几何
Connes 与 Lott（1991）和 Connes（1996）发现，粒子物理的标准模型（带 Higgs 场）可以自然地由非交换几何导出。这是非交换几何最壮观的应用。

### 195.1 有限几何与内部空间

**定义 195.1**（有限谱三元组）：**有限谱三元组** $(\mathcal{A}_F, \mathcal{H}_F, \mathcal{D}_F)$ 的 $\mathcal{A}_F$ 是有限维代数，$\mathcal{H}_F$ 是有限维 Hilbert 空间。有限谱三元组描述了"内部空间"（非交换空间）的几何。

**定义 195.2**（标准模型的有限代数）：标准模型的有限代数为

$$\mathcal{A}_F = \mathbb{C} \oplus \mathbb{H} \oplus M_3(\mathbb{C})$$

（$\mathbb{H}$ 是四元数代数）。这对应标准模型的规范群 $U(1) \times SU(2) \times SU(3)$（模去离散子群）。

**定义 195.3**（有限 Hilbert 空间）：$\mathcal{H}_F$ 是一代费米子的 Hilbert 空间（$N$ 代，$N=3$），包含所有费米子场（轻子、夸克，分为左手和右手分量）。

**定义 195.4**（有限 Dirac 算子）：$\mathcal{D}_F$ 是 $\mathcal{H}_F$ 上的 $N \times N$ 矩阵，其非零项是 Yukawa 耦合矩阵（给出费米子质量矩阵）和 Majorana 质量项（中微子）。

### 195.2 谱作用量

**定义 195.5**（乘积谱三元组）：标准模型的整体谱三元组是经典几何与有限几何的乘积：

$$\mathcal{A} = C^\infty(M) \otimes \mathcal{A}_F, \quad \mathcal{H} = L^2(S) \otimes \mathcal{H}_F, \quad \mathcal{D} = \mathcal{D}_M \otimes 1 + \gamma_5 \otimes \mathcal{D}_F$$

**定理 195.1**（谱作用量原理，Connes-Chamseddine 1996-1997）：**谱作用量**（spectral action）定义为

$$S = \operatorname{Tr}_\omega\left(f\left(\frac{\mathcal{D}^2}{\Lambda^2}\right)\right) + \langle \psi, \mathcal{D} \psi \rangle$$

其中 $f$ 是截断函数（cutoff function），$\Lambda$ 是能量截断。展开谱作用量得到：

$$S = \int_M \left(\frac{1}{2g^2} F_{\mu\nu}F^{\mu\nu} + \cdots\right) d^4x + \text{Higgs 项} + \text{Yukawa 耦合}$$

即 Einstein-Hilbert 作用量 + Yang-Mills 作用量 + Higgs 作用量 + 费米子作用量——**整个标准模型**（包括 Higgs 场）从纯几何原理自动导出！

**定理 195.2**（Higgs 场的几何起源）：在非交换几何中，Higgs 场自然地出现为内部空间的"联络"的分量——它是规范场在非交换方向上的分量。这解释了 Higgs 场的几何本质。

### 195.3 质量关系与预言

**定理 195.3**（标准模型的约束）：非交换几何方法给出了标准模型参数之间的约束，包括：
- Higgs 质量 $m_H \approx 125$ GeV（实验值，LHC 2012）
- 预测了 Higgs 自耦合常数 $\lambda$ 与规范耦合常数之间的关系
- 轻微偏离标准模型：中微子必须是 Majorana 粒子，且存在质量

这些预测使得非交换几何标准模型在 LHC 发现 Higgs 粒子（$m_H \approx 125$ GeV）后需要修正，但整体框架仍极具吸引力。

---

---

## 第196章：非交换 Riemann 几何与量子群
非交换 Riemann 几何将经典 Riemann 几何推广到非交换代数，量子群是其中的核心对象。

### 196.1 非交换环面

**定义 196.1**（非交换环面 $\mathbb{T}_\theta^n$）：**非交换 $n$-环面** $\mathbb{T}_\theta^n$ 由旋转代数 $A_\theta^n$ 描述，其生成元 $U_1, \ldots, U_n$ 满足

$$U_k U_j = e^{2\pi i \theta_{jk}} U_j U_k$$

其中 $\theta_{jk} = -\theta_{kj} \in \mathbb{R}/\mathbb{Z}$ 是反对称矩阵。$A_\theta^n$ 是 $C(\mathbb{T}^n)$ 的形变量子化。

**定理 196.1**（非交换环面的几何）：当 $\theta$ 是"无理"矩阵（即 $\theta_{jk}$ 是无理数）时，$A_\theta^n$ 是单代数（无真双边理想）。非交换环面的 $K$-理论：$K_0(A_\theta^n) \cong K_1(A_\theta^n) \cong \mathbb{Z}^{2^{n-1}}$。

*K-理论计算概要*：以 $n=2$ 为例，$A_\theta^2$ 的 $K_0$ 群由投射的等价类生成。利用Pimsner-Voiculescu六项正合列（将非交换环面嵌入为 $C(\mathbb{T}) \rtimes_\theta \mathbb{Z}$ 的交叉积），得 $K_0(A_\theta^2) \cong \mathbb{Z} \oplus \mathbb{Z}$。当 $\theta$ 为无理数时，迹映射 $\tau: K_0 \to \mathbb{R}$ 的像为 $\mathbb{Z} + \theta\mathbb{Z}$，这是稠密子群。投射的分类由迹和Chern特征标完全确定。一般 $n$ 维情形，$K_*(A_\theta^n) \cong \bigwedge^* \mathbb{Z}^n \cong \mathbb{Z}^{2^{n-1}}$，由生成元 $U_k$ 的Künneth分解得到。非交换环面的K-理论是Connes非交换微分几何的经典范例。∎

**定理 196.2**（非交换环面的 Gauss-Bonnet 定理，Connes-Tretkoff 2010）：非交换 2-环面 $\mathbb{T}_\theta^2$ 上存在 Gauss-Bonnet 定理的推广，使用了非交换共形几何和局部指标公式。

### 196.2 量子群

**定义 196.2**（量子群 / Hopf 代数）：**量子群**（quantum group）是 Hopf 代数，带有余乘法 $\Delta: \mathcal{A} \to \mathcal{A} \otimes \mathcal{A}$、余单位 $\varepsilon: \mathcal{A} \to \mathbb{C}$ 和对极 $S: \mathcal{A} \to \mathcal{A}$，满足相容性条件。

**定理 196.2.1**（Hopf代数对极的唯一性）：若 $S, S'$ 均为 Hopf 代数 $\mathcal{A}$ 的对极映射，则 $S = S'$。即对极映射由代数结构和余代数结构唯一确定。

*证明概要*：设 $S, S'$ 均为对极，对任意 $a \in \mathcal{A}$，利用余乘的 Sweedler 记号 $\Delta(a) = \sum a_{(1)} \otimes a_{(2)}$。由对极公理 $m \circ (S \otimes \operatorname{id}) \circ \Delta = u \circ \varepsilon$ 和 $m \circ (\operatorname{id} \otimes S') \circ \Delta = u \circ \varepsilon$，计算：
$$S(a) = \sum S(a_{(1)}) \varepsilon(a_{(2)}) = \sum S(a_{(1)}) a_{(2)} S'(a_{(3)}) = \sum \varepsilon(a_{(1)}) S'(a_{(2)}) = S'(a)$$
其中利用了余结合律和余单位性质。故 $S = S'$。这一定理表明 Hopf 代数的"取逆"操作（对极）由代数-余代数结构强制确定，如同群中逆元由其乘积和单位唯一确定。∎

**详解 196.1**（Hopf 代数的完整公理体系）：Hopf 代数 $(\mathcal{A}, m, u, \Delta, \varepsilon, S)$ 同时是代数和余代数，结构映射满足六条公理：(1) **余乘法公理**：$\Delta$ 是代数同态，即 $\Delta(ab) = \Delta(a)\Delta(b)$；(2) **余单位公理**：$\varepsilon$ 是代数同态，且 $(\varepsilon \otimes \operatorname{id}) \circ \Delta = (\operatorname{id} \otimes \varepsilon) \circ \Delta = \operatorname{id}$（左右余单位律）；(3) **余结合律**：$(\Delta \otimes \operatorname{id}) \circ \Delta = (\operatorname{id} \otimes \Delta) \circ \Delta$，即两次余乘的顺序无关；(4) **对极公理**：$S$ 是反代数同态，满足 $m \circ (S \otimes \operatorname{id}) \circ \Delta = m \circ (\operatorname{id} \otimes S) \circ \Delta = u \circ \varepsilon$，其中 $m$ 是乘法，$u$ 是单位映射；(5) **相容性条件**：$\Delta(1) = 1 \otimes 1$，$\varepsilon(1) = 1$，$S(1) = 1$；(6) 若 $S$ 可逆（常用要求），则对极为对合：$S \circ S = \operatorname{id}$。此公理体系将群的三个运算（乘法、单位、取逆）双对偶化为余乘（描述"分裂"）、余单位（描述"删除"）和对极（描述"反转"），经典群的函数代数 $C(G)$ 是交换 Hopf 代数，而非交换 Hopf 代数即为量子群。当 $\mathcal{A}$ 是交换 Hopf 代数时，对应经典代数群；当 $\mathcal{A}$ 是余交换 Hopf 代数时，对应李双代数。

**定义 196.3**（量子 $SL(2)$ / $SL_q(2)$）：量子 $SL(2)$（Drinfeld-Jimbo 1985）由生成元 $a, b, c, d$ 和关系

$$ab = qba, \quad ac = qca, \quad bd = qdb, \quad cd = qdc$$

$$bc = cb, \quad ad - da = (q - q^{-1})bc, \quad ad - q^{-1}bc = 1$$

定义。当 $q = 1$ 时恢复经典 $SL(2)$。

**定理 196.3**（量子群与非交换几何）：量子群 $SL_q(2)$ 上的非交换几何由谱三元组描述，其 Dirac 算子由 Dabrowski 等（2003）构造。这给出了量子群空间上的非交换 Riemann 几何。

### 196.3 Podleś 量子球面

**定义 196.4**（Podleś 量子球面，1987）：**Podleś 量子球面** $S_q^2$ 是 $SU_q(2)$ 的齐性空间（量子商空间）。$C(S_q^2)$ 是 $C(SU_q(2))$ 的子代数，由 $SU_q(2)$ 的特定元素生成。

**定理 196.4**（量子球面的谱三元组，Dabrowski-Sitarz 2003）：$S_q^2$ 上存在 $SU_q(2)$-等变谱三元组，其 Dirac 算子的谱具有明确的 $q$-变形形式。这是非交换 Riemann 几何在量子齐性空间上的重要实现。

### 196.4 非交换几何的未来方向

**定义 196.5**（导出非交换几何）：将非交换几何与导出代数几何（V15、V18）结合，研究非交换空间的导出范畴和模空间。这是当前非交换几何的前沿方向。

**定义 196.6**（非交换几何与拓扑量子场论）：非交换几何中的谱三元组和循环上同调与拓扑量子场论（TQFT）有深层联系，特别是通过 Chern-Simons 理论和辫子群表示。

**定理 196.5**（Baum-Connes猜想 [含等变KK-理论]）：对任意局部紧群 $G$ 和 $G$-$C^*$-代数 $A$，**组装映射** $\mu: K^G_*( \mathcal{E}G; A) \to K_*(C^*_r(G, A))$ 是群同构。其中 $\mathcal{E}G$ 是 $G$ 的万有真作用空间。

*陈述与背景*：等变KK-理论 $KK^G_*(A, B)$ 是 Kasparov 为研究 $C^*$-代数上群作用的指标问题引入的双函子，推广了拓扑K-理论。Baum-Connes猜想的左端是等变K-同调（以 $\mathcal{E}G$ 为空间参数的Bredon同调），右端是约化群 $C^*$-代数的K-理论。组装映射将几何/拓扑数据（$G$ 在 $\mathcal{E}G$ 上的作用）映射到解析数据（约化交叉积 $C^*_r(G,A)$ 的K-理论）。该猜想蕴含了Novikov猜想、Gromov-Lawson-Rosenberg正标量曲率猜想等。Higson-Kasparov（2001）对顺从群（amenable groups）证明了该猜想；Lafforgue（2002）对双曲群证明了它。此猜想是非交换几何与几何拓扑之间最深刻的桥梁之一。∎

---

*本卷建立了非交换几何的核心理论框架：谱三元组（$\mathcal{A}, \mathcal{H}, \mathcal{D}$）将 Dirac 算子推广到非交换代数，Connes 距离公式恢复了度量；循环上同调（Hochschild/循环上同调、Chern 特征标、局部指标公式）是非交换空间的上同调理论；非交换微分形式（泛微分分次代数、Dixmier 迹、非交换积分）为非交换几何提供了积分和示性类；标准模型的非交换几何是 Connes 理论最壮观的应用，从纯几何原理导出了整个标准模型（包括 Higgs 场）；非交换环面、量子群和量子球面展示了非交换空间的具体例子。非交换几何是当代数学最深刻和最具野心的统一理论之一。*


---

*本卷从经典曲线论和曲面论出发，建立了 Frenet 标架、第一/第二基本形式、Gauss 曲率等核心概念，证明了 Gauss 绝妙定理和 Gauss-Bonnet 定理。随后引入微分流形和 Riemann 几何的现代框架，包括切空间、微分形式、Levi-Civita 联络、曲率张量等。讨论了曲率与拓扑的深层联系（Bonnet-Myers 定理、Hadamard-Cartan 定理、Chern-Gauss-Bonnet 定理）。补充内容涵盖辛几何与切触几何（Darboux 定理、Marsden-Weinstein 约化、Gromov-Witten 理论、Fukaya 范畴与镜对称）、非交换几何（Connes 理论、谱三元组、循环上同调、非交换环面、标准模型几何重构），为后续学习代数拓扑（V14）和李理论（V23）奠定了基础。*

---

---

## 第67章：其他几何专题
### 67.1 Finsler 几何简介

Finsler 几何将 Riemann 几何推广至更一般的度量结构，在切丛 $TM \setminus \{0\}$ 上赋予 **Finsler 度量** $F(x, y)$ 以代替 Riemann 度量给出的二次型。$F$ 需满足两个条件：（1）**正齐性**：$F(x, \lambda y) = \lambda F(x, y)$ 对所有 $\lambda > 0$ 成立；（2）**强凸性**：Hessian 矩阵 $g_{ij}(x, y) = \frac{1}{2}\frac{\partial^2 F^2}{\partial y^i \partial y^j}$ 对每个 $(x, y)$ 正定。区别于 Riemann 度量的关键特征在于 $F(x, y)$ 一般不满足平行四边形法则——弧长不仅依赖于位置，还依赖于方向，且不具有二次型结构。这使得 Finsler 几何中切空间的"单位球"可以是一般的光滑凸体（非椭球）。**Chern 联络**（S. S. Chern, 1948）是 Finsler 流形上的典范联络，由非线性联络（刻画切丛的水平分布）和线性联络（沿水平方向的协变导数）两部分构成，在无挠条件下保持 Finsler 度量。Chern 联络是整个 Finsler 几何曲率理论的框架基础，在现代变分学与生物形态学中有重要应用。

### 67.2 谱几何（Spectral Geometry）

谱几何研究紧致 Riemann 流形 $(M, g)$ 上 **Laplace-Beltrami 算子** $\Delta_g$ 的谱与几何性质之间的对应关系。$\Delta_g$ 的特征值满足 $0 = \lambda_0 < \lambda_1 \leq \lambda_2 \leq \cdots \nearrow \infty$。经典问题来自 Mark Kac (1966)："**能听出鼓的形状吗？**"（Can one hear the shape of a drum?）——若两个平面区域具有相同的 Dirichlet 特征值谱，它们是否必然等距？数学上的 **Weyl 渐近公式**：

$$N(\lambda) = \#\{\lambda_k \leq \lambda\} \sim \frac{\omega_n}{(2\pi)^n} \mathrm{Vol}(M) \, \lambda^{n/2}, \quad \lambda \to \infty$$

表明谱决定了流形的维数和体积；进一步，热核渐近展开中的各阶系数依次给出总标量曲率的积分等几何不变量。1992 年，Gordon、Webb 和 Wolpert 利用数论方法构造了平面上具有相同 Dirichlet 谱但不等距（也不等度规）的区域对，从而对 Kac 问题给出否定回答。谱几何在量子力学（Schrodinger 算子谱）、热核分析与数论等领域有深远应用。

### 67.3 积分几何（Integral Geometry）

积分几何研究几何量在群作用下的积分平均，由 Blaschke 学派于 20 世纪初创立。核心公式——**Crofton 公式**将平面可求长曲线 $\Gamma$ 的长度 $L$ 表示为

$$L = \frac{1}{2} \int n_\ell(\Gamma) \, d\ell$$

其中 $n_\ell(\Gamma)$ 为直线 $\ell$ 与 $\Gamma$ 的交点个数，积分对平面上的全体直线（赋以适当的运动群不变测度）进行。等价地，曲线长度等于其与随机直线相交的期望数乘以 $\pi/2$。**Radon 变换**将 $\mathbb{R}^n$ 上的函数 $f$ 映射为其在超平面上的积分值：$(\mathcal{R}f)(H) = \int_H f \, d\sigma$。Johann Radon 于 1917 年建立了 Radon 变换的反演公式，这一原理正是现代 CT 扫描（计算机断层成像）的数学基础。积分几何将度量几何性质（长度、面积、曲率）转化为群不变测度下的积分平均值，深刻体现了几何与分析、概率论的对偶关系，在凸几何、随机几何和医学成像中均有重要应用。$\blacksquare$


*卷十一：微分几何终。*
