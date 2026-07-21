### 196.A 复流形补充
> 复几何是复分析和微分几何的交汇，研究复流形的几何结构。本部分作为复分析的几何补充，建立复流形、Kahler 几何、Hodge 理论、形变理论及 Calabi-Yau 流形与镜对称的系统理论。

复几何的核心特征在于复流形的"刚性"——与光滑流形不同，复流形上的全纯函数由极大值原理在紧流形上必然为常数，这使得复流形范畴中的对象比实流形范畴中的对象更加"刚性"。但同时，Kahler 条件又为复流形注入了足够的"柔性"——Kahler 度量与 Ricci 曲率之间的关系（通过 Ricci 形式）产生了丰富的 Hodge 理论结构。复几何与代数几何的关系由 Serre 的 GAGA 原理和 Kodaira 嵌入定理架起桥梁：紧复流形是射影代数的当且仅当它容许一个 Hodge 度量（即 Kahler 形式是整上同调类）。

---
## 第222章：复流形
复流形是局部同胚于 $\mathbb{C}^n$ 且转移函数为全纯的拓扑空间。复流形的研究是复几何的起点。

### 177.1 复流形的定义

复流形是微分几何与复分析交汇的核心概念，它将 $\mathbb{C}^n$ 中全纯函数的结构推广到具有全纯转移函数的拓扑空间。复流形最本质的特征在于：它不仅是一个光滑流形（实 $2n$ 维），而且其坐标卡之间的转移函数满足 Cauchy-Riemann 方程，即它们是全纯的。这一性质赋予了复流形极大的刚性——与光滑流形不同，紧复流形上的全纯函数由极大值原理必然为常数，这意味着复流形上的"函数"范畴比光滑流形上的"函数"范畴小得多。复流形的维数通常以复维数 $n$ 计，其对应的实维数为 $2n$。复流形的基本例子包括：$\mathbb{C}^n$ 本身、复射影空间 $\mathbb{CP}^n$（由 $\mathbb{C}^{n+1} \setminus \{0\}$ 在标量乘法下的商空间，全纯坐标卡由齐次坐标的仿射片给出）、复环面 $\mathbb{C}^n / \Lambda$（$\Lambda$ 为满秩格）、以及代数簇的光滑点集（Serre 的 GAGA 原理建立了复流形与代数簇之间的深刻联系）。复流形上的全纯映射 $f: M \to N$ 是满足局部坐标表示为全纯函数的映射，且全纯映射的复合仍为全纯。复流形范畴中，双全纯映射（全纯且逆也为全纯）对应于复流形的同构，而双全纯等价类是复几何中的基本分类问题。紧复流形的基本不变量包括 Hodge 数 $h^{p,q}$、Chern 数和 Kodaira 维数，后者是 Enriques-Kodaira 分类理论的核心。

**定义 177.1**（复流形）：$n$ 维**复流形** $M$ 是一个拓扑空间，带有复坐标卡 $\{(U_\alpha, \varphi_\alpha)\}$，其中 $\varphi_\alpha: U_\alpha \to \mathbb{C}^n$ 是同胚到 $\mathbb{C}^n$ 中开集，且转移函数 $\varphi_\alpha \circ \varphi_\beta^{-1}$ 在 $\varphi_\beta(U_\alpha \cap U_\beta)$ 上是全纯的。

**定义 177.2**（全纯函数与全纯映射）：$f: M \to \mathbb{C}$ 是**全纯**的，如果 $f \circ \varphi_\alpha^{-1}$ 在每个坐标卡上是全纯的。$f: M \to N$（$N$ 是复流形）是全纯的，如果局部坐标表示是全纯的。

**命题 177.1**（紧复流形上的全纯函数）：紧连通复流形上的全纯函数必为常数（极大值原理的推广）。这使复几何与实几何有本质区别。

**证明**：设 $f: M \to \mathbb{C}$ 全纯，$M$ 紧连通。则 $|f|: M \to \mathbb{R}$ 是连续的，在紧集上达到最大值。设 $|f(p)|$ 最大。取 $p$ 附近的坐标卡，在该局部坐标下 $f$ 是全纯函数。由极大值原理，$f$ 在 $p$ 的邻域中为常数。由连通性，$f$ 在整个 $M$ 上为常数。$\blacksquare$

### 177.2 近复结构与可积性

**定义 177.3**（近复结构）：实流形 $M$（$2n$ 维）上的**近复结构**是切丛 $TM$ 的自同态 $J: TM \to TM$，满足 $J^2 = -\operatorname{id}$。$J$ 赋予 $TM$ 复向量空间结构：$(a+ib) \cdot v = av + bJv$。

复化切丛 $TM \otimes \mathbb{C}$ 在 $J$ 作用下分解为 $\pm i$-特征空间：
$$TM \otimes \mathbb{C} = T^{1,0}M \oplus T^{0,1}M$$
其中 $T^{1,0}M = \{X - iJX : X \in TM\}$（全纯切空间），$T^{0,1}M = \{X + iJX : X \in TM\}$（反全纯切空间）。在局部坐标 $\{z_j = x_j + iy_j\}$ 下，$T^{1,0}M$ 由 $\partial/\partial z_j$ 张成，$T^{0,1}M$ 由 $\partial/\partial \bar{z}_j$ 张成。

**定义 177.4**（Nijenhuis 张量）：近复结构 $J$ 的 **Nijenhuis 张量**为

$$N_J(X, Y) = [X, Y] + J[JX, Y] + J[X, JY] - [JX, JY]$$

$N_J$ 衡量 $J$ 与 Lie 括号的不兼容性。$N_J$ 是 $(1,2)$-张量，且 $N_J(JX, Y) = N_J(X, JY) = -J N_J(X, Y)$。$N_J = 0$ 等价于 $T^{0,1}M$ 对 Lie 括号封闭（即 $[T^{0,1}, T^{0,1}] \subseteq T^{0,1}$），这是 Frobenius 可积性定理的条件。

**定理 177.1**（Newlander-Nirenberg 定理，1957）：近复结构 $J$ 来自复流形结构的充要条件是 $N_J \equiv 0$。此时 $J$ 称为**可积的**。

*意义*：该定理将复流形的存在性转化为近复结构的可积性条件，是复几何的核心定理。证明使用全纯坐标的构造（通过 $\bar{\partial}$-方程的可解性）。

**证明**：$N_J=0$ 等价于 $T^{1,0}M$ 对 Lie 括号封闭（Frobenius 定理的条件）。在局部坐标 $\{z_i = x_i + i y_i\}$ 中，需构造全纯坐标函数 $w_j$。Newlander 与 Nirenberg 证明可解性归结为 Cauchy-Riemann 方程 $\bar{\partial} w = 0$ 对非齐次项的估计，利用 $N_J=0$ 时 $\bar{\partial}^2=0$ 的形式可积性和 L^2-估计（或 Newton 迭代）得到收敛的全纯坐标。具体地，利用 $\bar{\partial}$-Neumann 问题和 Hormander 的 $L^2$ 估计，构造 $\bar{\partial}$-闭的 $(0,1)$-形式的解，从而得到全纯坐标函数。$\blacksquare$

**命题 177.2**（实二维情形）：任何 2 维可定向 Riemann 流形上的近复结构（由旋转 $90^\circ$ 定义）总是可积的。因此任何可定向 Riemann 曲面是复流形（1 维）。

**证明**：在实二维情形，$N_J$ 自动为零（因为 $N_J$ 的对称性导致维数约束）。任何可定向 Riemann 曲面可以通过等温坐标局部地赋予复坐标。$\blacksquare$

### 177.3 Dolbeault 上同调

**定义 177.5**（$(p, q)$-形式）：复流形 $M$ 上的**$(p, q)$-形式**是 $p$ 个全纯微分和 $q$ 个反全纯微分的外积。外微分 $d$ 分解为 $d = \partial + \bar{\partial}$，其中 $\partial$ 增加全纯次数，$\bar{\partial}$ 增加反全纯次数。具体地，
$$\partial = \sum_j dz_j \wedge \frac{\partial}{\partial z_j}, \quad \bar{\partial} = \sum_j d\bar{z}_j \wedge \frac{\partial}{\partial \bar{z}_j}$$

$\partial^2 = 0$，$\bar{\partial}^2 = 0$，$\partial \bar{\partial} + \bar{\partial} \partial = 0$（由 $d^2 = 0$ 和类型的分解唯一性）。

**定义 177.6**（Dolbeault 上同调）：$\bar{\partial}$-算子满足 $\bar{\partial}^2 = 0$，定义**Dolbeault 上同调群**：

$$H_{\bar{\partial}}^{p,q}(M) = \frac{\ker(\bar{\partial}: \Omega^{p,q} \to \Omega^{p,q+1})}{\operatorname{im}(\bar{\partial}: \Omega^{p,q-1} \to \Omega^{p,q})}$$

**定理 177.2**（Dolbeault 定理）：$H_{\bar{\partial}}^{p,q}(M) \cong H^q(M, \Omega^p)$，其中 $\Omega^p$ 是全纯 $p$-形式的层。Dolbeault 上同调是层上同调的具体实现。

**证明**：层 $\Omega^p$ 的 Dolbeault 分解 $0 \to \Omega^p \to \mathcal{A}^{p,0} \xrightarrow{\bar{\partial}} \mathcal{A}^{p,1} \xrightarrow{\bar{\partial}} \cdots$ 是 $\Omega^p$ 的精细消解（fine resolution），因为 $\mathcal{A}^{p,q}$ 是 $\bar{\partial}$-光滑形式层，即细层。由 Dolbeault-Grothendieck 引理（$\bar{\partial}$-Poincare 引理），此复形局部正合。层上同调的定义 $H^q(M, \Omega^p) = R^q\Gamma(M, \Omega^p)$ 即该消解的截面复形的上同调，即 $H_{\bar{\partial}}^{p,q}(M)$。$\blacksquare$

**定义 177.7**（Hodge 数）：$h^{p,q}(M) = \dim_{\mathbb{C}} H_{\bar{\partial}}^{p,q}(M)$。Hodge 数是复流形的基本数值不变量。

**定理 177.3（Serre 对偶）**：设 $M$ 是紧 $n$ 维复流形。则 $H^q(M, \Omega^p) \cong H^{n-q}(M, \Omega^{n-p})^*$（对偶空间）。特别地，$h^{p,q} = h^{n-p, n-q}$。

**证明**：Serre 对偶是凝聚层上同调的 Serre 对偶定理的特殊情形。对偶层 $\Omega^p$ 的 Serre 对偶为 $\Omega^{n-p}$（因为 $\Omega^n$ 是典范丛，$\Omega^p$ 与 $\Omega^{n-p}$ 的对偶由 $\wedge$ 配对给出）。利用层上同调的 Serre 对偶定理，得 $H^q(M, \Omega^p)^* \cong \operatorname{Ext}^{n-q}(\Omega^p, \Omega^n) \cong H^{n-q}(M, \Omega^{n-p})$。$\blacksquare$

---
## 第223章：Kahler 几何
Kahler 流形是同时具有 Riemann 度量、复结构和辛结构且三者兼容的流形。Kahler 几何是复几何的绝对核心。

### 178.1 Kahler 度量的定义

**定义 178.1**（Hermite 度量）：复流形 $M$ 上的 **Hermite 度量** $h$ 是每个切空间 $T_pM$（视为复向量空间）上的 Hermite 内积，光滑依赖于 $p$。分解为 $h = g - i\omega$，其中 $g = \operatorname{Re} h$ 是 Riemann 度量，$\omega = -\operatorname{Im} h$ 是实 $(1,1)$-形式。$g$ 和 $\omega$ 满足 $g(JX, JY) = g(X, Y)$ 和 $\omega(X, Y) = g(JX, Y)$。

**定义 178.2**（Kahler 度量）：Hermite 度量 $h$ 称为 **Kahler 度量**，如果相应的 $(1,1)$-形式 $\omega$ 是闭的：$d\omega = 0$。此时 $(M, h)$ 称为 **Kahler 流形**。

Kahler 条件等价于：复结构 $J$ 关于 $g$ 的 Levi-Civita 联络是平行的：$\nabla J = 0$。这一等价性揭示了 Kahler 条件的本质：复结构和 Riemann 度量在 Levi-Civita 平行移动下完全兼容。

**证明**（$\nabla J = 0 \iff d\omega = 0$）：$\omega(X, Y) = g(JX, Y)$。计算 $d\omega(X, Y, Z) = (\nabla_X \omega)(Y, Z) + (\nabla_Y \omega)(Z, X) + (\nabla_Z \omega)(X, Y)$（利用 $\nabla$ 无挠且度量相容）。$(\nabla_X \omega)(Y, Z) = g((\nabla_X J)Y, Z)$。故 $d\omega = 0$ 当且仅当 $\nabla_X J$ 满足某种循环对称性，这等价于 $\nabla J = 0$。$\blacksquare$

**命题 178.1**（Kahler 势）：在局部坐标下，Kahler 形式 $\omega$ 可写为

$$\omega = \frac{i}{2} \sum_{j,k} h_{j\bar{k}} dz_j \wedge d\bar{z}_k$$

其中 $h_{j\bar{k}} = \frac{\partial^2 \varphi}{\partial z_j \partial \bar{z}_k}$，$\varphi$ 是局部 **Kahler 势**。$d\omega = 0$ 自动满足。

Kahler 势的存在性体现了 Kahler 度量的一个关键特征：度量由单个实值函数 $\varphi$ 的二阶导数给出。在紧 Kahler 流形上，全局 Kahler 势的存在性等价于 $\omega$ 是恰当形式（即 $[\omega] = 0 \in H^2_{\text{dR}}(M)$），这通常不成立。但 $\partial \bar{\partial}$-引理保证了局部 Kahler 势的存在性，且 $\omega$ 的形变可由 $\varphi$ 的形变描述。

**经典 Kahler 流形的例子**：
- $\mathbb{C}^n$ 配以标准 Hermite 度量 $\omega = \frac{i}{2} \sum dz_j \wedge d\bar{z}_j$，Kahler 势 $\varphi = \frac{1}{2}\|z\|^2$
- $\mathbb{CP}^n$ 配以 **Fubini-Study 度量**：在齐次坐标 $[Z_0: \cdots : Z_n]$ 下，$\omega_{\text{FS}} = \frac{i}{2\pi} \partial \bar{\partial} \log \|Z\|^2$，Kahler 势 $\varphi = \log(1 + \|z\|^2)$（在仿射坐标片 $Z_0 = 1$ 上）
- 复环面 $\mathbb{C}^n/\Lambda$ 配以 $\mathbb{C}^n$ 上平移不变的 Kahler 度量
- 光滑射影代数簇（由 $\mathbb{CP}^n$ 的 Kahler 度量限制得到）

### 178.2 Kahler 恒等式

**定理 178.1**（Kahler 恒等式）：在 Kahler 流形上，Hodge 星算子 $\star$、$\partial$、$\bar{\partial}$ 及其伴随算子满足以下恒等式：

1. $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$（Laplacian 的一致性）
2. $[\Lambda, \bar{\partial}] = -i \partial^*$，$[\Lambda, \partial] = i \bar{\partial}^*$（其中 $\Lambda = L^*$ 是 $\omega \wedge$ 的伴随）
3. $[L, \bar{\partial}^*] = i \partial$，$[L, \partial^*] = -i \bar{\partial}$

其中 $L = \omega \wedge \cdot$ 是 Lefschetz 算子，$\Lambda$ 是其伴随。

这些恒等式是 Hodge 理论在 Kahler 流形上成立的核心技术原因。

**证明**：由 $\omega$ 的 Kahler 条件 $d\omega = 0$ 推出 $\partial$ 和 $\bar{\partial}$ 与 $L$ 的交换子关系。利用局部坐标中 $\omega = i\sum h_{ij} dz^i \wedge d\bar{z}^j$ 和 $h_{ij}$ 的 Kahler 势表达式，计算 $\partial^* = - \star \bar{\partial} \star$ 和 Lefschetz 算子 $L = \omega \wedge \cdot$ 及其伴随 $\Lambda = \star^{-1} L \star$ 的交换关系。初等的线性代数计算给出 $[\Lambda, \bar{\partial}] = -i\partial^*$ 和 $[L, \partial^*] = -i\bar{\partial}$。由这些恒等式和 $\Delta_d = d d^* + d^* d$ 的展开得 $\Delta_d = \Delta_\partial + \Delta_{\bar{\partial}} + \text{cross terms}$，交叉项由恒等式消去，故 $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$。$\blacksquare$

**定理 178.1.5（Lefschetz 分解定理）**：在紧 Kahler 流形 $M$（复 $n$ 维）上，Lefschetz 算子 $L^k: \bigwedge^{n-k} T^*M \to \bigwedge^{n+k} T^*M$ 诱导上同调层面的同构：
$$L^k: H^{n-k}_{\text{dR}}(M, \mathbb{C}) \xrightarrow{\cong} H^{n+k}_{\text{dR}}(M, \mathbb{C})$$
且 de Rham 上同调群有 **Lefschetz 分解**：
$$H^k_{\text{dR}}(M, \mathbb{C}) = \bigoplus_{j \geq \max(0, k-n)} L^j H^{k-2j}_{\text{prim}}(M, \mathbb{C})$$
其中 $H^r_{\text{prim}}(M, \mathbb{C}) = \ker(L^{n-r+1}: H^r \to H^{2n-r+2})$ 是**本原上同调**（primitive cohomology）。

**证明**：Lefschetz 分解的关键在于 $L$、$\Lambda$ 和 $H = [L, \Lambda]$（其中 $H$ 在 $(p,q)$-形式上作用为 $(p+q-n)$ 倍）满足 $\mathfrak{sl}(2,\mathbb{C})$ 的交换关系：$[H, L] = 2L$，$[H, \Lambda] = -2\Lambda$，$[L, \Lambda] = H$。de Rham 上同调群成为 $\mathfrak{sl}(2,\mathbb{C})$ 的有限维表示，由 $\mathfrak{sl}(2,\mathbb{C})$-表示论的完全可约性得到 Lefschetz 分解。$\blacksquare$

### 178.3 Hodge 分解定理

**定理 178.2**（Hodge 分解定理，Kahler 情形）：紧 Kahler 流形 $M$ 上的 de Rham 上同调（复系数）分解为

$$H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$$

且满足 $H_{\bar{\partial}}^{p,q}(M) \cong \overline{H_{\bar{\partial}}^{q,p}(M)}$（复共轭对称）。

**证明**：由 Kahler 恒等式（定理 178.1），$\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$，故 $\Delta_d$-调和形式与 $\Delta_{\bar{\partial}}$-调和形式一致。对 $\Delta_d$ 应用标准 Hodge 定理：紧 Riemann 流形上每个 de Rham 上同调类有唯一 $\Delta_d$-调和代表元。任取 $[\omega] \in H^k_{\text{dR}}(M, \mathbb{C})$，其调和代表元 $\alpha \in \ker \Delta_d$ 可按 $(p,q)$ 类型分解为 $\alpha = \sum_{p+q=k} \alpha^{p,q}$。因 $\Delta_d = 2\Delta_{\bar{\partial}}$，$\Delta_d \alpha = 0$ 推出 $\Delta_{\bar{\partial}} \alpha^{p,q} = 0$（各 $(p,q)$ 分量独立），故每个 $\alpha^{p,q}$ 是 $\bar{\partial}$-调和形式，对应 Dolbeault 上同调类 $[\alpha^{p,q}] \in H_{\bar{\partial}}^{p,q}(M)$。该分配是良定义的：若另一调和代表元 $\beta$ 满足 $\alpha - \beta = d\gamma$，由 Kahler 恒等式得 $\alpha^{p,q} - \beta^{p,q} = \bar{\partial} \eta^{p,q-1}$，故 $[\alpha^{p,q}] = [\beta^{p,q}]$。逆映射将 $\bar{\partial}$-调和类求和即得。这给出同构 $H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$。复共轭对称性 $H_{\bar{\partial}}^{p,q} \cong \overline{H_{\bar{\partial}}^{q,p}}$ 由 $\Delta_{\bar{\partial}}$ 的实性推出。$\blacksquare$

**推论 178.3**（Hodge 数的对称性）：$h^{p,q} = h^{q,p} = h^{n-p,n-q} = h^{n-q,n-p}$。

**推论 178.4**（Betti 数的奇偶性约束）：紧 Kahler 流形的奇数阶 Betti 数 $b_{2k+1}$ 为偶数。

**证明**：$b_{2k+1} = \sum_{p+q=2k+1} h^{p,q}$。由 $h^{p,q} = h^{q,p}$，$h^{p,q} + h^{q,p} = 2h^{p,q}$ 是偶数，而 $p = q$ 时 $p+q = 2p$ 是偶数，不可能等于 $2k+1$。故 $b_{2k+1}$ 是偶数。$\blacksquare$

### 178.4 Calabi 猜想与 Yau 定理

**定理 178.5（Calabi-Yau 定理，Yau, 1978）**：设 $(M, \omega)$ 是紧 Kahler 流形，$R$ 是任意表示 $c_1(M)$ 的实 $(1,1)$-形式。则存在唯一的 Kahler 度量 $\tilde{\omega} \in [\omega]$（同一 Kahler 类中），其 Ricci 形式 $\rho(\tilde{\omega}) = R$。

特别地，若 $c_1(M) = 0$，则 $M$ 容许唯一的 Ricci 平坦 Kahler 度量（在每个 Kahler 类中）。这样的流形称为 **Calabi-Yau 流形**。

**证明**（框架）：Calabi 猜想等价于求解复 Monge-Ampere 方程：
$$\frac{(\omega + i\partial \bar{\partial} \varphi)^n}{\omega^n} = e^F, \quad \omega + i\partial \bar{\partial} \varphi > 0$$
其中 $F$ 由 $R - \rho(\omega) = i\partial \bar{\partial} F$ 确定。Yau 使用连续性方法：构造一族方程 $\frac{(\omega + i\partial \bar{\partial} \varphi_t)^n}{\omega^n} = e^{tF + c_t}$（$t \in [0,1]$），并证明 $t=1$ 时可解。关键步骤是建立 $\varphi$ 的 $C^0$ 估计（通过 Moser 迭代和 Sobolev 不等式）、$C^2$ 估计（通过 Calabi 的第三阶估计技巧）和 $C^{2,\alpha}$ 估计（通过 Evans-Krylov 理论或 Calabi 的 $C^3$ 估计）。$\blacksquare$

Yau 定理是复几何和 Kahler 几何中最深刻的定理之一，其直接推论包括：$K3$ 曲面存在 Ricci 平坦 Kahler 度量（从而 $K3$ 曲面是超 Kahler 流形），以及任意次数的 Calabi-Yau 三维流形（如 $\mathbb{CP}^4$ 中的五次超曲面）的 Ricci 平坦 Kahler 度量的存在性。这些结果在弦理论（超弦紧化需要 Calabi-Yau 三维流形）和镜对称（mirror symmetry）中具有根本重要性。

### 178.5 Chern 类与 Chern-Weil 理论

**定义 178.6**（Chern 类，复几何视角）：复向量丛 $E \to M$ 的**第 $k$ 个 Chern 类** $c_k(E) \in H^{2k}(M, \mathbb{Z})$ 由曲率形式 $\Omega$ 通过

$$\det\left(I + \frac{i}{2\pi} \Omega\right) = 1 + c_1(E) + c_2(E) + \cdots$$

定义。对复流形 $M$，$c_k(M) = c_k(TM)$。

**定理 178.7**（Chern-Weil 理论）：Chern 类在 de Rham 上同调中不依赖于联络的选择，且是复流形的微分同胚不变量。

**证明**：设 $\nabla_0$ 和 $\nabla_1$ 是同一向量丛上的两个联络，定义插值联络 $\nabla_t = (1-t)\nabla_0 + t\nabla_1$。其曲率形式 $\Omega_t$ 满足 $\frac{d}{dt}c_k(\Omega_t) = d(\text{transgression form})$（通过 Chern-Simons 形式）。对 $t$ 从 $0$ 到 $1$ 积分，得 $c_k(\Omega_1) - c_k(\Omega_0) = d(\int_0^1 \Phi_t dt)$，即差一个恰当形式，故 de Rham 类相同。微分同胚不变性来自光滑函子性。$\blacksquare$

**定义 178.8**（Chern 数）：紧复 $n$ 维流形 $M$ 的 **Chern 数**是 $\int_M c_{i_1}(M) \wedge \cdots \wedge c_{i_k}(M)$，其中 $\sum i_j = n$。

**定理 178.9（Kodaira 嵌入定理）**：紧复流形 $M$ 是射影代数的（即可嵌入复射影空间）当且仅当 $M$ 容许一个 Hodge 度量——即 Kahler 形式 $\omega$ 是整上同调类（$[\omega] \in H^2(M, \mathbb{Z})$）。

**证明**（框架）：若 $M$ 是射影代数簇，则 $\mathbb{CP}^N$ 的 Fubini-Study 度量的限制给出 Hodge 度量。反之，若 $M$ 有 Hodge 度量 $\omega$，则 $\omega$ 对应全纯线丛 $L \to M$（$c_1(L) = [\omega]$）。$L$ 是正线丛（因为 $\omega$ 是 Kahler 形式），由 Kodaira 消没定理，$L^{\otimes k}$ 的整体截面在 $k$ 充分大时分离点和切方向，从而给出嵌入 $M \hookrightarrow \mathbb{P}(H^0(M, L^{\otimes k})^*)$。$\blacksquare$

**定理 178.10（Kodaira 消没定理）**：设 $M$ 是紧 Kahler 流形，$L \to M$ 是正全纯线丛。则 $H^q(M, \Omega^n(L)) = 0$ 对所有 $q > 0$。等价地，$H^q(M, K_M \otimes L) = 0$（$q > 0$），其中 $K_M = \Omega^n$ 是典范丛。

**证明**：Kodaira 消没定理的证明使用 Bochner 技巧。正线丛 $L$ 的曲率形式 $\Theta(L)$ 是 Kahler 形式（至多差常数），利用 Weitzenbock 公式和 Hodge 定理，$\bar{\partial}$-Laplacian 与曲率项的关系给出 $\Delta_{\bar{\partial}} \alpha = 0$ 推出 $\alpha = 0$（对 $\alpha \in \Omega^{n,q}(L)$ 且 $q > 0$）。$\blacksquare$

Kodaira 消没定理是复几何中最重要的消没定理之一，它与 Hodge 分解定理、Kodaira 嵌入定理和 Kodaira-Spencer 形变理论一起构成了复几何的四大支柱。在代数几何中，Kodaira 消没定理的代数版本（Kawamata-Viehweg 消没定理）通过正特征约化方法得到推广，成为极小模型纲领（MMP）的核心技术工具。