## 第174章：Hilbert 空间
Hilbert 空间是带有内积的完备空间，其几何结构比一般 Banach 空间更丰富，有正交投影、正交基等概念。

### 73.1 内积空间与 Hilbert 空间

**定义 73.1**（内积空间）：$\mathbb{K}$ 上的向量空间 $H$ 配以一个**内积** $\langle \cdot, \cdot \rangle: H \times H \to \mathbb{K}$ 满足：

1. $\langle x, x \rangle \geq 0$，且 $\langle x, x \rangle = 0 \Leftrightarrow x = 0$（正定性）
2. $\langle x, y \rangle = \overline{\langle y, x \rangle}$（共轭对称性）
3. $\langle \alpha x + \beta y, z \rangle = \alpha \langle x, z \rangle + \beta \langle y, z \rangle$（对第一变元的线性性）

内积诱导范数 $\|x\| = \sqrt{\langle x, x \rangle}$。若 $(H, \langle \cdot, \cdot \rangle)$ 在该范数下完备，则称为 **Hilbert 空间**。

**定理 73.1**（Cauchy-Schwarz 不等式）：$|\langle x, y \rangle| \leq \|x\| \|y\|$，等号成立当且仅当 $x$ 与 $y$ 线性相关。

*证明*：当 $y = 0$ 时不等式显然成立（两边均为 $0$，且 $x$ 与 $0$ 线性相关）。设 $y \neq 0$。考虑 $\lambda \in \mathbb{K}$ 的二次函数：$0 \leq \|x - \lambda y\|^2 = \langle x - \lambda y, x - \lambda y \rangle = \|x\|^2 - \overline{\lambda}\langle x, y \rangle - \lambda\langle y, x \rangle + |\lambda|^2\|y\|^2 = \|x\|^2 - 2\Re(\overline{\lambda}\langle x, y \rangle) + |\lambda|^2\|y\|^2$。取 $\lambda = \langle x, y \rangle / \|y\|^2$，则 $\overline{\lambda}\langle x, y \rangle = |\langle x, y \rangle|^2 / \|y\|^2$。代入得 $0 \leq \|x\|^2 - 2|\langle x, y \rangle|^2/\|y\|^2 + |\langle x, y \rangle|^2/\|y\|^2 = \|x\|^2 - |\langle x, y \rangle|^2/\|y\|^2$。整理得 $|\langle x, y \rangle|^2 \leq \|x\|^2 \|y\|^2$，开方即得 Cauchy-Schwarz 不等式。等号成立当且仅当 $\|x - \lambda y\| = 0$，即 $x = \lambda y$，换言之 $x$ 与 $y$ 线性相关。$\blacksquare$

**定理 73.2**（平行四边形法则与极化恒等式）：
- 平行四边形法则：$\|x + y\|^2 + \|x - y\|^2 = 2(\|x\|^2 + \|y\|^2)$
- 极化恒等式（实情形）：$\langle x, y \rangle = \frac{1}{4}(\|x + y\|^2 - \|x - y\|^2)$
- 极化恒等式（复情形）：$\langle x, y \rangle = \frac{1}{4}\sum_{k=0}^3 i^k \|x + i^k y\|^2$

**证明**：平行四边形法则：$\|x + y\|^2 + \|x - y\|^2 = (\|x\|^2 + 2\Re\langle x,y\rangle + \|y\|^2) + (\|x\|^2 - 2\Re\langle x,y\rangle + \|y\|^2) = 2(\|x\|^2 + \|y\|^2)$。实极化恒等式：$\|x + y\|^2 - \|x - y\|^2 = (\|x\|^2 + 2\langle x,y\rangle + \|y\|^2) - (\|x\|^2 - 2\langle x,y\rangle + \|y\|^2) = 4\langle x,y\rangle$。复极化恒等式：直接展开 $\sum_{k=0}^3 i^k \|x + i^k y\|^2$，利用 $\sum i^k = 0$ 和 $\sum |i^k|^2 = 4$ 化简得 $4\langle x,y\rangle$。$\blacksquare$

**定理 73.3**（Jordan-von Neumann 定理）：赋范空间 $(X, \|\cdot\|)$ 的范数由内积诱导当且仅当范数满足平行四边形法则。此时内积可由极化恒等式恢复。

**证明**：（$\Rightarrow$）由定理 73.2，内积范数满足平行四边形法则。（$\Leftarrow$）在实情形定义 $\langle x, y \rangle = \frac{1}{4}(\|x+y\|^2 - \|x-y\|^2)$。由平行四边形法则可验证：对称性显然；$\langle x, x \rangle = \|x\|^2 \geq 0$；加性：利用平行四边形法则展开 $\langle x+y, z \rangle$ 得 $\langle x, z \rangle + \langle y, z \rangle$；齐次性：先对整数和有理数成立，由连续性推广到实数。复情形类似。$\blacksquare$

Jordan-von Neumann 定理在 Banach 空间理论中具有根本重要性。它给出了一个赋范空间是否是 Hilbert 空间的几何判据：范数满足平行四边形法则的 Banach 空间一定是 Hilbert 空间。这一判据在许多重要的 Banach 空间（如 $\ell^p$ 和 $L^p$）中迅速判定：$\ell^p$ 和 $L^p$ 是 Hilbert 空间当且仅当 $p = 2$。这一结果也解释了为什么 $L^2$ 在分析中具有如此特殊的地位——它是唯一同时是 Hilbert 空间的 $L^p$ 空间，从而兼具 Banach 空间的完备性和 Hilbert 空间的几何结构（正交性、投影等）。

### 73.2 正交性与投影定理

**定义 73.2**（正交）：$x, y \in H$ 称为**正交的**，记作 $x \perp y$，如果 $\langle x, y \rangle = 0$。子集 $A \subseteq H$ 的**正交补**为 $A^\perp = \{x \in H : \langle x, a \rangle = 0, \; \forall a \in A\}$。

**命题 73.4**（勾股定理）：若 $x \perp y$，则 $\|x + y\|^2 = \|x\|^2 + \|y\|^2$。

**证明**：由内积的双线性性和正交定义 $x \perp y$（即 $\langle x, y \rangle = 0$），展开 $\|x + y\|^2 = \langle x + y, x + y \rangle = \langle x, x \rangle + \langle x, y \rangle + \langle y, x \rangle + \langle y, y \rangle = \|x\|^2 + 0 + 0 + \|y\|^2 = \|x\|^2 + \|y\|^2$。由归纳法，若 $\{x_1, \ldots, x_n\}$ 两两正交，则 $\|\sum_{i=1}^n x_i\|^2 = \sum_{i=1}^n \|x_i\|^2$。这一结果推广了 Euclid 几何中的勾股定理，是 Hilbert 空间几何结构的基石。$\blacksquare$

**定理 73.5**（正交投影定理）：设 $C \subseteq H$ 是非空闭凸集。则对每个 $x \in H$，存在唯一的 $y \in C$ 使得 $\|x - y\| = \operatorname{dist}(x, C) = \inf_{z \in C} \|x - z\|$。$y$ 称为 $x$ 到 $C$ 的**最佳逼近**。

特别地，若 $M \subseteq H$ 是闭子空间，则 $H = M \oplus M^\perp$，且 $M^{\perp\perp} = M$。

*证明*：存在性：取极小化序列 $(y_n) \subseteq C$ 使 $\|x - y_n\| \to d = \operatorname{dist}(x, C)$。由平行四边形法则：

$$\|y_n - y_m\|^2 = 2\|y_n - x\|^2 + 2\|y_m - x\|^2 - \|y_n + y_m - 2x\|^2$$

由 $C$ 凸，$(y_n + y_m)/2 \in C$，故 $\|y_n + y_m - 2x\|^2 \geq 4d^2$。当 $n, m \to \infty$ 时，$\|y_n - y_m\| \to 0$，$(y_n)$ 是 Cauchy 序列，由完备性收敛到某 $y$，由 $C$ 闭知 $y \in C$。

唯一性：若 $y, y'$ 都是最佳逼近，由平行四边形法则得 $\|y - y'\|^2 \leq 4d^2 - 4d^2 = 0$。

子空间情形：$M^\perp$ 是闭子空间。对 $x \in H$，取 $Px$ 为 $x$ 到 $M$ 的投影，则 $x - Px \in M^\perp$，故 $x = Px + (x - Px) \in M + M^\perp$。若 $x \in M \cap M^\perp$，则 $\langle x, x \rangle = 0$，故 $x = 0$。∎

正交投影定理是 Hilbert 空间理论的核心支柱。它断言：Hilbert 空间的任意闭子空间 $M$ 都是可补的，且补空间恰好是正交补 $M^\perp$。这一性质在 Banach 空间中一般不成立——存在不可补的闭子空间（如 $\ell^\infty$ 中 $c_0$ 的闭子空间）。正交投影的存在性使得 Hilbert 空间中的许多问题（如最小二乘逼近、Ritz-Galerkin 方法、有限元分析）可以简化为在子空间上的正交投影，从而转化为线性代数问题。从几何上看，$P_M x$ 是 $x$ 在 $M$ 上的"最佳逼近"，这一性质在统计学（线性回归的最小二乘估计）、信号处理（正交投影滤波）和量子力学（测量公设中的投影算子）中都有直接应用。

### 73.3 Riesz 表示定理与正交基

**定理 73.6**（Riesz 表示定理）：设 $H$ 是 Hilbert 空间。对每个连续线性泛函 $f \in H^*$，存在唯一的 $y \in H$ 使得

$$f(x) = \langle x, y \rangle, \quad \forall x \in H$$

且 $\|f\| = \|y\|$。映射 $y \mapsto \langle \cdot, y \rangle$ 是 $H$ 到 $H^*$ 的共轭线性等距同构（实情形为线性）。

*证明*：若 $f = 0$，取 $y = 0$。否则，$\ker f$ 是 $H$ 的真闭子空间。取 $z \in (\ker f)^\perp$ 且 $\|z\| = 1$。对任意 $x \in H$，$x - f(x)z/f(z) \in \ker f$，故 $\langle x - f(x)z/f(z), z \rangle = 0$，即 $f(x) = \langle x, \overline{f(z)}z \rangle$。取 $y = \overline{f(z)}z$。唯一性：若 $\langle x, y_1 \rangle = \langle x, y_2 \rangle$ 对所有 $x$，则 $\langle x, y_1 - y_2 \rangle = 0$，取 $x = y_1 - y_2$ 得 $y_1 = y_2$。∎

Riesz 表示定理是 Hilbert 空间区别于一般 Banach 空间的根本特征。它建立了 $H$ 与 $H^*$ 之间的反线性等距同构，使得 Hilbert 空间是"自对偶"的。这一事实在数学物理中有深远影响：在量子力学中，Dirac 的 bra-ket 记号 $\langle \psi | \phi \rangle$ 正是 Riesz 表示定理的体现——ket $|\phi\rangle$ 是 Hilbert 空间中的向量，bra $\langle \psi|$ 是对偶空间中的泛函，而 Riesz 表示定理保证了 bra 与 ket 之间的自然对应。在偏微分方程中，Riesz 表示定理是 Lax-Milgram 定理（见下节）的基础，后者将椭圆型 PDE 的弱解存在唯一性问题转化为 Hilbert 空间中的变分问题。

**定义 73.3**（正交规范集）：$H$ 的子集 $\{e_\alpha\}_{\alpha \in A}$ 称为**正交规范的**，如果 $\langle e_\alpha, e_\beta \rangle = \delta_{\alpha\beta}$。

**定义 73.4**（正交规范基）：正交规范集 $\{e_\alpha\}$ 称为 $H$ 的**正交规范基**（或 Hilbert 基），如果 $\overline{\operatorname{span}}\{e_\alpha\} = H$（即其线性张成稠密）。

**定理 73.7**（正交规范基的存在性）：每个非零 Hilbert 空间都有正交规范基。任意两个正交规范基具有相同的基数，称为 $H$ 的 **Hilbert 维数**。

*证明*：存在性：考虑 $H$ 中所有正交规范集构成的集合 $\mathcal{O}$，按包含关系 $\subseteq$ 构成偏序集。$\mathcal{O}$ 非空（单点集 $\{x/\|x\|\}$ 对任意 $x \neq 0$ 是正交规范集）。设 $\mathcal{C} \subseteq \mathcal{O}$ 为全序子集（链），则 $U = \bigcup_{S \in \mathcal{C}} S$ 也是正交规范集（若 $x, y \in U$，则存在 $S \in \mathcal{C}$ 同时包含 $x, y$，故 $\langle x, y \rangle = \delta_{xy}$），故 $U \in \mathcal{O}$ 是 $\mathcal{C}$ 的上界。由 Zorn 引理，$\mathcal{O}$ 有极大元 $\mathcal{B}$。若 $\overline{\operatorname{span}}\mathcal{B} \neq H$，则存在非零 $x \in (\overline{\operatorname{span}}\mathcal{B})^\perp$。令 $e = x/\|x\|$，则 $\mathcal{B} \cup \{e\}$ 是严格更大的正交规范集，与 $\mathcal{B}$ 的极大性矛盾。故 $\mathcal{B}$ 为 $H$ 的正交规范基。基的基数（Hilbert 维数）的不变性：设 $\mathcal{B}_1, \mathcal{B}_2$ 为两个正交规范基。若其中之一有限，则显然 $|\mathcal{B}_1| = |\mathcal{B}_2| = \dim H$。若均无穷，对每个 $e \in \mathcal{B}_1$，$e = \sum_{f \in \mathcal{B}_2} \langle e, f \rangle f$，非零系数至多可数个。故 $|\mathcal{B}_1| \leq \aleph_0 \cdot |\mathcal{B}_2| = |\mathcal{B}_2|$，对称地 $|\mathcal{B}_2| \leq |\mathcal{B}_1|$，由 Schroder-Bernstein 定理得 $|\mathcal{B}_1| = |\mathcal{B}_2|$。∎

**定理 73.8**（Parseval 恒等式与 Fourier 展开）：设 $\{e_\alpha\}_{\alpha \in A}$ 是 $H$ 的正交规范基。则对任意 $x \in H$：

1. **Bessel 不等式**：$\sum_{\alpha} |\langle x, e_\alpha \rangle|^2 \leq \|x\|^2$（事实上只有可数个系数非零）
2. **Fourier 展开**：$x = \sum_{\alpha} \langle x, e_\alpha \rangle e_\alpha$（在 $H$ 的范数下收敛）
3. **Parseval 恒等式**：$\|x\|^2 = \sum_{\alpha} |\langle x, e_\alpha \rangle|^2$

*证明*：(1) Bessel 不等式：对任意有限子集 $F \subseteq A$，由勾股定理和正交规范性，$\|x - \sum_{\alpha \in F} \langle x, e_\alpha \rangle e_\alpha\|^2 = \|x\|^2 - \sum_{\alpha \in F} |\langle x, e_\alpha \rangle|^2 \geq 0$。因此 $\sum_{\alpha \in F} |\langle x, e_\alpha \rangle|^2 \leq \|x\|^2$ 对任意有限 $F$ 成立，取所有有限子集的上确界即得 Bessel 不等式。又对任意 $\varepsilon > 0$，集合 $\{\alpha \in A : |\langle x, e_\alpha \rangle| \geq \varepsilon\}$ 必为有限（否则 Bessel 不等式被违反），故仅可数个系数非零。(2) Fourier 展开收敛性：设非零系数为 $\{\langle x, e_n \rangle\}_{n=1}^\infty$。令 $S_N = \sum_{n=1}^N \langle x, e_n \rangle e_n$。对 $M > N$，$\|S_M - S_N\|^2 = \sum_{n=N+1}^M |\langle x, e_n \rangle|^2 \to 0$（$N \to \infty$），由 Bessel 不等式知该级数收敛。故 $\{S_N\}$ 为 Cauchy 列，由完备性收敛于某 $y \in H$。对任意 $\alpha$，$\langle x - y, e_\alpha \rangle = \langle x, e_\alpha \rangle - \langle x, e_\alpha \rangle = 0$，故 $x - y \perp \operatorname{span}\{e_\alpha\}$。由基的极大性，$x - y = 0$，即 $x = \sum_n \langle x, e_n \rangle e_n$。(3) Parseval 恒等式：由 Fourier 展开和级数的连续性，$\|x\|^2 = \lim_{N \to \infty} \|S_N\|^2 = \lim_{N \to \infty} \sum_{n=1}^N |\langle x, e_n \rangle|^2 = \sum_\alpha |\langle x, e_\alpha \rangle|^2$。$\blacksquare$

Parseval 恒等式是 Hilbert 空间理论中最优美的结果之一。它推广了 Fourier 分析中的经典 Parseval 等式：在 $L^2([-\pi, \pi])$ 中，三角函数系 $\{e^{inx}/\sqrt{2\pi}\}_{n \in \mathbb{Z}}$ 是正交规范基，Parseval 恒等式化为 $\frac{1}{2\pi} \int_{-\pi}^\pi |f(x)|^2 dx = \sum_{n=-\infty}^\infty |\hat{f}(n)|^2$。Parseval 恒等式在现代信号处理中对应于能量守恒：信号在时域中的总能量等于其在频域中的总能量（Plancherel 定理）。在量子力学中，波函数 $\psi$ 在正交规范基 $\{|\phi_n\rangle\}$ 下的展开系数 $c_n = \langle \phi_n | \psi \rangle$ 的模平方 $|c_n|^2$ 是测量得到本征值 $\lambda_n$ 的概率，而 $\sum |c_n|^2 = 1$ 正是总概率守恒。

**定理 73.9**（可分 Hilbert 空间的分类）：每个无穷维可分 Hilbert 空间等距同构于 $\ell^2$（配以标准正交基 $\{e_n\}$）。

**证明**：设 $H$ 可分且有正交规范基 $\{e_n\}_{n=1}^\infty$（由定理 73.7 及可分性，基可数）。定义映射 $U: H \to \ell^2$ 为 $Ux = (\langle x, e_n \rangle)_{n=1}^\infty$。由 Parseval 恒等式，$\|Ux\|_{\ell^2}^2 = \sum |\langle x, e_n \rangle|^2 = \|x\|^2$，故 $U$ 为等距嵌入。满射性：对任意 $(c_n) \in \ell^2$，令 $x = \sum c_n e_n$（在 $H$ 中收敛，因 $\sum|c_n|^2 < \infty$），则 $Ux = (c_n)$。故 $U$ 为等距同构。$\blacksquare$

### 73.4 Lax-Milgram 定理与变分方法

**定理 73.10**（Lax-Milgram 定理）：设 $H$ 是 Hilbert 空间，$a: H \times H \to \mathbb{K}$ 是双线性形式（或共轭双线性形式），满足
(i) 有界性：$|a(u, v)| \leq C \|u\| \|v\|$（$C > 0$）
(ii) 强制性（coercivity）：$|a(u, u)| \geq \alpha \|u\|^2$（$\alpha > 0$）

则对任意连续线性泛函 $f \in H^*$，存在唯一的 $u \in H$ 使得 $a(u, v) = f(v)$ 对所有 $v \in H$ 成立。且 $\|u\| \leq \frac{1}{\alpha} \|f\|$。

**证明**：由 Riesz 表示定理，$f(v) = \langle v, w \rangle$ 对某个 $w \in H$。对固定 $u$，$v \mapsto a(u, v)$ 是连续线性泛函，由 Riesz 表示定理，存在 $Au \in H$ 使得 $a(u, v) = \langle v, Au \rangle$（或 $a(u, v) = \langle Au, v \rangle$ 取决于约定）。$A: H \to H$ 是线性算子，由有界性 $\|A\| \leq C$。由强制性，$\alpha \|u\|^2 \leq |a(u, u)| = |\langle u, Au \rangle| \leq \|u\| \|Au\|$，故 $\|Au\| \geq \alpha \|u\|$——$A$ 是下有界的，从而是单射且有闭值域。若 $A$ 不满，则存在非零 $v \perp \operatorname{im} A$，则 $0 = \langle v, Av \rangle = a(v, v) \geq \alpha \|v\|^2 > 0$，矛盾。故 $A$ 是满射，存在唯一 $u = A^{-1} w$ 使 $a(u, v) = \langle v, Au \rangle = \langle v, w \rangle = f(v)$。$\blacksquare$

Lax-Milgram 定理是偏微分方程变分理论的核心工具。它将椭圆型 PDE 的弱解存在问题转化为双线性形式的强制性验证。标准例子是 Poisson 方程 $-\Delta u = f$ 在 $H^1_0(\Omega)$ 上的 Dirichlet 问题：取 $a(u, v) = \int_\Omega \nabla u \cdot \nabla v$，Poincare 不等式保证 $a$ 在 $H^1_0$ 上是强制的，由 Lax-Milgram 定理得弱解的存在唯一性。Lax-Milgram 定理的推广——**Babuška-Lax-Milgram 定理**（inf-sup 条件）——处理了 $a$ 在不同空间 $H_1 \times H_2$ 上定义的更一般情形，是混合有限元方法（如 Stokes 方程的 Taylor-Hood 元）的数学基础。

### 73.5 伴随算子与紧自伴算子的谱定理

**定义 73.5**（伴随算子）：设 $H_1, H_2$ 为 Hilbert 空间，$T \in \mathcal{B}(H_1, H_2)$。$T$ 的**伴随算子** $T^* \in \mathcal{B}(H_2, H_1)$ 由下式唯一确定：

$$\langle Tx, y \rangle_{H_2} = \langle x, T^* y \rangle_{H_1}, \quad \forall x \in H_1, y \in H_2$$

$T^*$ 的存在唯一性由 Riesz 表示定理保证：对固定 $y$，$x \mapsto \langle Tx, y \rangle$ 是连续线性泛函，由 Riesz 表示存在唯一 $T^*y$。

**定义 73.6**（自伴算子、正规算子、酉算子）：设 $T \in \mathcal{B}(H)$。
- $T$ 称为**自伴的**（或 Hermitian），如果 $T^* = T$。
- $T$ 称为**正规的**，如果 $T^*T = TT^*$。
- $T$ 称为**酉算子**，如果 $T^*T = TT^* = I$（即 $T$ 是等距满射）。

**命题 73.11**（伴随算子的性质）：
1. $(T^*)^* = T$，$\|T^*\| = \|T\|$，$\|T^*T\| = \|T\|^2$（C*-等式）
2. $(S+T)^* = S^* + T^*$，$(\alpha T)^* = \overline{\alpha} T^*$，$(ST)^* = T^* S^*$
3. $\ker T^* = (\operatorname{im} T)^\perp$，$\overline{\operatorname{im} T^*} = (\ker T)^\perp$

**证明**：(1) 对任意 $x \in H_1, y \in H_2$，$\langle (T^*)^* x, y \rangle = \langle x, T^* y \rangle = \overline{\langle T^* y, x \rangle} = \overline{\langle y, T x \rangle} = \langle T x, y \rangle$，故 $(T^*)^* = T$。$\|T^*\| = \|T\|$：由 $\|T^* y\| = \sup_{\|x\|=1} |\langle x, T^* y \rangle| = \sup_{\|x\|=1} |\langle T x, y \rangle| \leq \|T\|\|y\|$，得 $\|T^*\| \leq \|T\|$；反向不等式由 $(T^*)^* = T$ 得 $\|T\| = \|(T^*)^*\| \leq \|T^*\|$。C*-等式：$\|T^* T\| \leq \|T^*\|\|T\| = \|T\|^2$；另一方面，$\|T\|^2 = \sup_{\|x\|=1} \langle T x, T x \rangle = \sup_{\|x\|=1} \langle T^* T x, x \rangle \leq \|T^* T\|$，故 $\|T^* T\| = \|T\|^2$。(2) 直接由伴随的定义和内积的线性性/共轭线性性验证：$\langle (S+T)x, y \rangle = \langle Sx, y \rangle + \langle Tx, y \rangle = \langle x, S^* y \rangle + \langle x, T^* y \rangle = \langle x, (S^* + T^*)y \rangle$；$\langle \alpha T x, y \rangle = \alpha \langle T x, y \rangle = \alpha \langle x, T^* y \rangle = \langle x, \overline{\alpha} T^* y \rangle$；$\langle ST x, y \rangle = \langle T x, S^* y \rangle = \langle x, T^* S^* y \rangle$。(3) $y \in \ker T^* \iff T^* y = 0 \iff \langle x, T^* y \rangle = 0 \; (\forall x) \iff \langle T x, y \rangle = 0 \; (\forall x) \iff y \in (\operatorname{im} T)^\perp$。取正交补得 $\overline{\operatorname{im} T^*} = (\ker T)^\perp$。$\blacksquare$

**定理 73.12**（紧自伴算子的谱定理 / Hilbert-Schmidt 展开定理）：设 $H$ 是 Hilbert 空间，$T \in \mathcal{K}(H)$ 是自伴紧算子。则存在 $H$ 的正交规范基 $\{e_n\}$ 和实数 $\lambda_n \to 0$ 使得

$$Tx = \sum_{n} \lambda_n \langle x, e_n \rangle e_n$$

即 $T$ 可以对角化，其特征向量构成正交规范基。非零特征值 $\lambda_n$ 的几何重数有限，且 $\|T\| = \max_n |\lambda_n|$。

**证明**：首先证明 $\|T\|$ 或 $-\|T\|$ 是 $T$ 的特征值。取单位向量序列 $(x_n)$ 使 $|\langle Tx_n, x_n \rangle| \to \|T\|$（由自伴性，$\|T\| = \sup_{\|x\|=1} |\langle Tx, x \rangle|$）。由紧性，$(Tx_n)$ 有收敛子列，极限论证得特征向量 $e_1$ 使 $Te_1 = \lambda_1 e_1$，$|\lambda_1| = \|T\|$。然后考虑 $H_1 = \{e_1\}^\perp$，$T$ 限制在 $H_1$ 上仍是自伴紧算子，归纳构造正交特征向量列 $\{e_n\}$ 和特征值 $\lambda_n$，$|\lambda_{n+1}| \leq |\lambda_n|$。由紧性，$\lambda_n \to 0$。最后证明 $\{e_n\}$ 是基：若 $x \perp e_n$ 对所有 $n$，则 $Tx = 0$。同时 $T$ 在 $\{e_n\}^\perp$ 上为零。故任意 $x$ 可展开为 $\sum \langle x, e_n \rangle e_n + (x - \sum \langle x, e_n \rangle e_n)$，后者在 $\ker T$ 中。$\blacksquare$

**定理 73.13**（Hilbert-Schmidt 算子）：设 $T: H \to H$ 为紧算子。$T$ 称为 **Hilbert-Schmidt 算子**，如果对某个（从而任意）正交规范基 $\{e_n\}$，$\sum_n \|T e_n\|^2 < \infty$。Hilbert-Schmidt 算子的范数 $\|T\|_{HS} = (\sum_n \|T e_n\|^2)^{1/2}$ 与基的选取无关。全体 Hilbert-Schmidt 算子构成 Hilbert 空间 $\mathcal{HS}(H)$，内积为 $\langle S, T \rangle_{HS} = \sum_n \langle S e_n, T e_n \rangle$。Hilbert-Schmidt 算子是紧算子的最重要子类，且 $T$ 为 Hilbert-Schmidt 当且仅当 $T^*T$ 的迹有限：$\operatorname{Tr}(T^*T) < \infty$。

**证明**：首先验证范数与基的选取无关。设 $\{e_n\}$ 和 $\{f_m\}$ 为两个正交规范基。由 Parseval 恒等式，$\sum_n \|T e_n\|^2 = \sum_n \sum_m |\langle T e_n, f_m \rangle|^2 = \sum_m \sum_n |\langle e_n, T^* f_m \rangle|^2 = \sum_m \|T^* f_m\|^2$。取 $T^*$ 替代 $T$ 得 $\sum_n \|T e_n\|^2$ 与基无关。$T$ 为 Hilbert-Schmidt 蕴含 $T$ 紧：设 $T$ 的奇异值分解为 $T x = \sum_n s_n \langle x, e_n \rangle f_n$，则 $\|T\|_{HS}^2 = \sum_n s_n^2$。若 $\sum s_n^2 < \infty$，则 $s_n \to 0$，故 $T$ 为有限秩算子 $\sum_{n=1}^N s_n \langle \cdot, e_n \rangle f_n$ 按范数极限，从而紧。$\mathcal{HS}(H)$ 是 Hilbert 空间：内积 $\langle S, T \rangle_{HS} = \sum_n \langle S e_n, T e_n \rangle$ 的完备性由 Cauchy 列的标准论证可得（类似 $\ell^2$ 的完备性）。$\operatorname{Tr}(T^* T) = \sum_n \langle T^* T e_n, e_n \rangle = \sum_n \|T e_n\|^2 = \|T\|_{HS}^2$，故 $T$ 为 Hilbert-Schmidt 当且仅当 $\operatorname{Tr}(T^* T) < \infty$。$\blacksquare$

**Mercer 定理**（对积分算子的推广）：设 $K: [a,b] \times [a,b] \to \mathbb{R}$ 连续且对称正定（即 $\iint K(x,y) f(x) f(y) dx dy \geq 0$ 对所有 $f$）。定义积分算子 $T_K f(x) = \int_a^b K(x,y) f(y) dy$。则 $T_K$ 是 $L^2([a,b])$ 上的自伴紧算子，且 $K(x,y) = \sum_{n=1}^\infty \lambda_n e_n(x) e_n(y)$，其中级数绝对且一致收敛。Mercer 定理是核方法（kernel methods）在机器学习中（如 SVM、高斯过程回归）的数学基础——核函数 $K$ 的 Mercer 展开等价于特征映射 $\phi(x) = (\sqrt{\lambda_n} e_n(x))_{n=1}^\infty$ 将数据嵌入到再生核 Hilbert 空间（RKHS）。

### 73.6 正交投影与最小二乘逼近

**定理 73.14（正交投影算子的性质）**：设 $M \subseteq H$ 是闭子空间，$P_M: H \to M$ 为正交投影。则：
1. $P_M$ 是线性有界算子，$\|P_M\| = 1$（除非 $M = \{0\}$）
2. $P_M^2 = P_M$（幂等性）
3. $\langle P_M x, y \rangle = \langle x, P_M y \rangle$（自伴性）
4. $\operatorname{im} P_M = M$，$\ker P_M = M^\perp$
5. $x = P_M x + (I - P_M)x$ 是 $H$ 关于 $M$ 的正交分解

**证明**：(1) 对 $x \in H$，$\|P_M x\| \leq \|x\|$（因为 $P_M x$ 是最佳逼近），故 $\|P_M\| = 1$（当 $M \neq \{0\}$）。(2) 对 $y \in M$，$P_M y = y$，故 $P_M^2 x = P_M(P_M x) = P_M x$。(3) 对任意 $x, y \in H$，$\langle P_M x, y \rangle = \langle P_M x, P_M y + (I - P_M)y \rangle = \langle P_M x, P_M y \rangle = \langle x, P_M y \rangle$。(4)(5) 由正交分解直接得出。$\blacksquare$

**定理 73.15（最小二乘问题）**：给定 $x \in H$ 和闭子空间 $M \subseteq H$，最小化问题 $\min_{y \in M} \|x - y\|^2$ 的唯一解为 $y^* = P_M x$。在数值分析中，这对应有限元方法中的 Ritz-Galerkin 逼近。

**应用 73.1（线性回归的几何解释）**：在统计中，给定数据 $(t_i, y_i)$（$i = 1, \ldots, n$），最小二乘回归 $\min_{\beta} \sum_{i=1}^n |y_i - \sum_{j=1}^p \beta_j \phi_j(t_i)|^2$ 等价于在 $M = \operatorname{span}\{(\phi_j(t_i))_{i=1}^n\}$ 上求观测向量 $y$ 的正交投影。

### 73.7 Hilbert 空间上的线性算子

**定义 73.7（有界线性算子）**：$T: H \to H$ 称为**有界线性算子**，若存在 $C > 0$ 使得 $\|Tx\| \leq C\|x\|$ 对所有 $x \in H$。最小这样的 $C$ 称为算子范数 $\|T\|$。全体有界线性算子构成 Banach 代数 $\mathcal{B}(H)$。

**定理 73.16（一致有界性原理 / Banach-Steinhaus 定理）**：设 $\{T_\alpha\}_{\alpha \in A} \subseteq \mathcal{B}(H)$。若对每个 $x \in H$，$\sup_{\alpha} \|T_\alpha x\| < \infty$，则 $\sup_{\alpha} \|T_\alpha\| < \infty$。

**证明**：定义集合 $F_n = \{x \in H : \sup_\alpha \|T_\alpha x\| \leq n\}$。每个 $F_n$ 是闭集（因为 $T_\alpha$ 连续，且 $\sup$ 保下半连续性）。由条件，$H = \bigcup_{n=1}^\infty F_n$。由 Baire 纲定理，存在 $n_0$ 使 $F_{n_0}$ 有非空内部，故存在 $x_0 \in H$ 和 $r > 0$ 使得 $B(x_0, r) \subseteq F_{n_0}$。对任意 $\|z\| \leq r$，$\|T_\alpha z\| \leq \|T_\alpha(x_0 + z)\| + \|T_\alpha x_0\| \leq n_0 + n_0 = 2n_0$。故 $\|T_\alpha\| \leq 2n_0/r$ 对所有 $\alpha$。$\blacksquare$

**定理 73.17（开映射定理）**：设 $T \in \mathcal{B}(H)$ 是满射。则 $T$ 是开映射（即开集的像为开集）。特别地，若 $T$ 是双射，则 $T^{-1}$ 有界。

**证明**：由 Baire 纲定理，$H = \bigcup_{n=1}^\infty n\overline{T(B(0,1))}$，故 $\overline{T(B(0,1))}$ 包含某开球，进而存在 $r > 0$ 使 $B(0, r) \subseteq \overline{T(B(0,1))}$。通过线性性和逐次逼近可得 $B(0, r/2) \subseteq T(B(0,1))$，即 $T$ 将开单位球映为开集，从而将任意开集映为开集。双射时 $T$ 可逆，$T^{-1}$ 的有界性由 $\|T^{-1}y\| \leq (2/r)\|y\|$ 给出。$\blacksquare$

### 73.8 再生核 Hilbert 空间（RKHS）

**定义 73.8（再生核 Hilbert 空间）**：Hilbert 空间 $\mathcal{H} \subseteq \mathbb{K}^X$（$X$ 上的函数空间）称为**再生核 Hilbert 空间**（RKHS），如果对每个 $x \in X$，求值泛函 $\delta_x: f \mapsto f(x)$ 是连续的。由 Riesz 表示定理，存在 $K_x \in \mathcal{H}$ 使 $f(x) = \langle f, K_x \rangle$。**再生核** $K: X \times X \to \mathbb{K}$ 定义为 $K(x, y) = \langle K_y, K_x \rangle$，满足：
1. 对每个 $y$，$K(\cdot, y) \in \mathcal{H}$
2. 再生性质：$f(y) = \langle f, K(\cdot, y) \rangle$ 对所有 $f \in \mathcal{H}$

**定理 73.18（Moore-Aronszajn 定理）**：函数 $K: X \times X \to \mathbb{R}$ 是某个 RKHS 的再生核当且仅当 $K$ 是正定核：对任意 $n$ 和 $x_1, \ldots, x_n \in X$，矩阵 $(K(x_i, x_j))_{i,j=1}^n$ 是半正定的。此时 RKHS 由 $K$ 唯一确定。

**证明**：（$\Rightarrow$）若 $K$ 是再生核，则 $\sum_{i,j} c_i \overline{c_j} K(x_i, x_j) = \langle \sum_i c_i K_{x_i}, \sum_j c_j K_{x_j} \rangle = \|\sum_i c_i K_{x_i}\|^2 \geq 0$，故 $K$ 正定。($\Leftarrow$) 设 $K$ 正定。定义 $V_0 = \operatorname{span}\{K(\cdot, y) : y \in X\}$，配以内积 $\langle K(\cdot, x), K(\cdot, y) \rangle = K(x, y)$。由正定性，此内积定义良好。取 $V_0$ 在 $\|\cdot\|$ 下的完备化即得唯一的 RKHS $\mathcal{H}_K$。$\blacksquare$

**应用 73.2（SVM 与核方法）**：在机器学习中，RKHS 是支持向量机（SVM）和核方法的理论基础。给定核函数 $K$，数据 $x$ 被隐式嵌入到 RKHS 中：$\phi(x) = K(\cdot, x)$。在高维 RKHS 中进行的线性算法等价于在原空间中的非线性核方法——此即"核技巧"（kernel trick）的数学本质。

**例 73.1（常用核函数）**：
- 多项式核：$K(x, y) = (\langle x, y \rangle + c)^d$
- Gauss 径向基核（RBF）：$K(x, y) = \exp(-\|x-y\|^2/(2\sigma^2))$
- Laplace 核：$K(x, y) = \exp(-\|x-y\|/\sigma)$
- Matérn 核：$K(x, y) = \frac{2^{1-\nu}}{\Gamma(\nu)} (\sqrt{2\nu}\|x-y\|/\rho)^\nu K_\nu(\sqrt{2\nu}\|x-y\|/\rho)$

### 73.9 Hilbert 空间上的算子代数初步

**定义 73.9（C*-代数）**：Banach 代数 $\mathcal{A}$ 配以对合 $*: \mathcal{A} \to \mathcal{A}$ 称为 **C*-代数**，如果对合满足：
1. $(x^*)^* = x$，$(\alpha x + y)^* = \overline{\alpha} x^* + y^*$，$(xy)^* = y^* x^*$
2. C*-等式：$\|x^* x\| = \|x\|^2$

**例 73.2**：$\mathcal{B}(H)$（Hilbert 空间上的有界线性算子）是 C*-代数。

**定理 73.19（Gelfand-Naimark 定理）**：每个交换 C*-代数等距 *-同构于某个紧 Hausdorff 空间上的连续函数代数 $C(X)$。

**定理 73.20（谱定理——有界自伴算子的谱分解）**：设 $T \in \mathcal{B}(H)$ 是自伴算子。则存在唯一的谱测度 $E$（投影值测度）支撑在 $\sigma(T) \subseteq \mathbb{R}$ 上，使得 $T = \int_{\sigma(T)} \lambda dE(\lambda)$。对任何连续函数 $f$，$f(T) = \int_{\sigma(T)} f(\lambda) dE(\lambda)$。谱定理是自伴算子的对角化定理——它给出了自伴算子的"无穷维对角化"，将作用在 Hilbert 空间上的自伴算子表示为其特征值的"连续直和"。

**推论 73.1（连续泛函演算）**：对自伴算子 $T$，映射 $f \mapsto f(T)$ 是从 $C(\sigma(T))$ 到 $\mathcal{B}(H)$ 的等距 *-同态，称为 $T$ 的**连续泛函演算**。特别地：
1. $(f+g)(T) = f(T) + g(T)$，$(fg)(T) = f(T)g(T)$
2. $\overline{f}(T) = f(T)^*$
3. $\|f(T)\| = \|f\|_\infty$（等距性）
4. 若 $f(\lambda) \geq 0$，则 $f(T) \geq 0$

### 73.10 无界算子与自伴扩张

在量子力学、偏微分方程等应用中，许多重要的算子（如微分算子）是无界的。Hilbert 空间理论为处理无界算子提供了严格的框架。

**定义 73.10（无界算子）**：$H$ 上的（无界）线性算子 $T$ 定义在一个线性子空间 $\operatorname{dom}(T) \subseteq H$ 上，称为 $T$ 的**定义域**。$T$ 称为**闭算子**，若其图像 $\Gamma(T) = \{(x, Tx) : x \in \operatorname{dom}(T)\}$ 是 $H \times H$ 的闭子空间。

**定义 73.11（自伴无界算子）**：稠定算子 $T$（即 $\overline{\operatorname{dom}(T)} = H$）的**伴随算子** $T^*$ 定义为：
- $\operatorname{dom}(T^*) = \{y \in H : \text{存在 } z \in H \text{ 使得 } \langle Tx, y \rangle = \langle x, z \rangle \text{ 对所有 } x \in \operatorname{dom}(T)\}$
- $T^* y = z$

$T$ 称为**自伴的**，若 $T = T^*$（此时 $\operatorname{dom}(T) = \operatorname{dom}(T^*)$）。

**定理 73.21（对称算子与自伴扩张）**：稠定算子 $T$ 称为**对称的**，若 $T \subseteq T^*$（即 $\langle Tx, y \rangle = \langle x, Ty \rangle$ 对所有 $x, y \in \operatorname{dom}(T)$）。对称算子不一定自伴。$T$ 有自伴扩张当且仅当其**亏指数** $n_+ = n_-$，其中
- $n_\pm = \dim \ker(T^* \mp iI)$

**例 73.3（动量算子）**：在 $L^2([0,1])$ 上定义 $p = -i\frac{d}{dx}$，$\operatorname{dom}(p) = \{f \in C^1[0,1] : f(0) = f(1)\}$。则 $p$ 是自伴算子，对应物理中一维无限深势阱中粒子的动量算子。

### 73.11 张量积与无穷维张量积

**定义 73.12（Hilbert 空间张量积）**：设 $H_1, H_2$ 为 Hilbert 空间。其**张量积** $H_1 \otimes H_2$ 是以下述方式定义的 Hilbert 空间：在代数张量积上赋予内积 $\langle x_1 \otimes y_1, x_2 \otimes y_2 \rangle = \langle x_1, x_2 \rangle_{H_1} \langle y_1, y_2 \rangle_{H_2}$，然后取完备化。

**性质 73.4**：$H_1 \otimes H_2$ 具有以下性质：
1. 若 $\{e_n\}$ 和 $\{f_m\}$ 分别是 $H_1$ 和 $H_2$ 的正交规范基，则 $\{e_n \otimes f_m\}$ 是 $H_1 \otimes H_2$ 的正交规范基
2. $H_1 \otimes H_2 \cong \mathcal{HS}(H_1^*, H_2)$（Hilbert-Schmidt 算子空间）
3. 对 $H_1 = L^2(X)$ 和 $H_2 = L^2(Y)$，有 $L^2(X) \otimes L^2(Y) \cong L^2(X \times Y)$

**应用 73.3（多体量子系统）**：在量子力学中，两粒子系统的状态空间是单粒子空间 $H_1 \otimes H_2$。纠缠态是那些不能写成简单张量积 $x \otimes y$ 的态——这是量子信息理论中纠缠概念的数学基础。

### 73.12 Hilbert 空间上的 Fredholm 理论

**定义 73.13（Fredholm 算子）**：有界线性算子 $T \in \mathcal{B}(H)$ 称为 **Fredholm 算子**，若：
1. $\dim \ker T < \infty$
2. $\dim \ker T^* < \infty$
3. $\operatorname{im} T$ 是闭的

其**指标**定义为 $\operatorname{ind}(T) = \dim \ker T - \dim \ker T^*$。

**定理 73.22（Fredholm 指标的性质）**：
1. 若 $T$ 是 Fredholm 算子且 $K$ 是紧算子，则 $T + K$ 也是 Fredholm 算子，且 $\operatorname{ind}(T + K) = \operatorname{ind}(T)$（指标在紧扰动下不变）
2. 若 $T$ 和 $S$ 是 Fredholm 算子，则 $TS$ 也是 Fredholm 算子，且 $\operatorname{ind}(TS) = \operatorname{ind}(T) + \operatorname{ind}(S)$
3. $\operatorname{ind}(T^*) = -\operatorname{ind}(T)$

**定理 73.23（Fredholm 二择一定理）**：设 $K \in \mathcal{K}(H)$ 是紧算子。则对 $\lambda \neq 0$，要么：
- $\lambda I - K$ 可逆（有界逆）；要么
- $\lambda$ 是 $K$ 的特征值

这等价于：非零谱点只能是特征值，且特征值的唯一聚点只能是 0。

**应用 73.4（积分方程）**：Fredholm 理论是第二类 Fredholm 积分方程 $\phi(x) - \lambda \int_a^b K(x,y) \phi(y) dy = f(x)$ 解的存在唯一性理论基础。当核 $K$ 是连续函数时，相应的积分算子是紧算子，Fredholm 二择一定理保证了上述方程要么对任意 $f$ 有唯一解，要么相应的齐次方程有非平凡解。

### 73.13 Hilbert 空间与量子力学

量子力学的数学框架建立在 Hilbert 空间理论之上，Hilbert 空间提供了量子态的几何描述。

**公理 73.1（量子力学的基本公理）**：
1. **态公理**：量子系统的状态由复 Hilbert 空间 $\mathcal{H}$ 中的单位向量 $\psi$（精确到一个相位因子）描述。
2. **可观测量公理**：可观测量（位置、动量、能量等）由 $\mathcal{H}$ 上的自伴算子 $A$ 表示。
3. **谱公理**：对可观测量 $A$ 的测量结果属于 $\sigma(A)$；若 $A$ 有谱分解 $A = \int \lambda dE(\lambda)$，则测量值在区间 $[\lambda_1, \lambda_2]$ 内的概率为 $\|E([\lambda_1, \lambda_2])\psi\|^2$。
4. **演化公理**：态 $\psi(t)$ 满足 Schrödinger 方程 $i\hbar \frac{d}{dt}\psi(t) = H\psi(t)$，其中 $H$ 是 Hamilton 算子（自伴算子）。
5. **复合系统公理**：复合系统的状态空间是各子系统状态空间的张量积。

**定理 73.24（Stone 定理）**：设 $\{U(t)\}_{t \in \mathbb{R}} \subseteq \mathcal{B}(H)$ 是强连续单参数酉群（即 $U(s+t) = U(s)U(t)$，$U(0)=I$，且 $t \mapsto U(t)x$ 对每个 $x \in H$ 连续）。则存在唯一的自伴算子 $A$ 使得 $U(t) = e^{itA}$，且 $\operatorname{dom}(A) = \{x \in H : \lim_{t \to 0} \frac{U(t)x - x}{t} \text{ 存在}\}$，$Ax = -i \frac{d}{dt}\big|_{t=0} U(t)x$。

Stone 定理是量子力学中时间演化算符 $U(t) = e^{-iHt/\hbar}$ 的数学基础——它建立了自伴算子（Hamilton 量）与幺正演化群之间的一一对应。

**例 73.4（谐振子）**：一维量子谐振子的 Hamilton 量为 $H = \frac{p^2}{2m} + \frac{1}{2} m\omega^2 x^2$，其中 $x$ 和 $p$ 满足正则对易关系 $[x, p] = i\hbar I$。定义湮灭算子 $a = \sqrt{\frac{m\omega}{2\hbar}}(x + \frac{i}{m\omega}p)$ 和创生算子 $a^\dagger = \sqrt{\frac{m\omega}{2\hbar}}(x - \frac{i}{m\omega}p)$，满足 $[a, a^\dagger] = I$。则 $H = \hbar\omega(a^\dagger a + \frac{1}{2})$，谱为 $\sigma(H) = \{\hbar\omega(n + \frac{1}{2}) : n = 0, 1, 2, \ldots\}$，对应特征向量 $|n\rangle = \frac{(a^\dagger)^n}{\sqrt{n!}}|0\rangle$ 构成 $L^2(\mathbb{R})$ 的正交规范基——这展示了 Hilbert 空间中正交基在量子力学中的重要应用。

### 73.14 总结与展望

#### 核心内容回顾

Hilbert 空间理论是泛函分析的核心分支之一，它融合了代数（内积、正交性）、几何（投影、角度）和分析（完备性、紧性）三个维度。本章主要内容可概括如下：

| 主题 | 核心概念 | 关键定理 |
|------|----------|----------|
| 内积与正交性 | 内积、范数、正交补 | Cauchy-Schwarz 不等式、平行四边形律 |
| 正交基与 Fourier 展开 | 正交规范基、Fourier 系数 | Parseval 恒等式、Riesz-Fischer 定理 |
| 正交投影 | 投影算子、最佳逼近 | 投影定理、最小二乘原理 |
| Riesz 表示与对偶 | 对偶空间、Lax-Milgram | Riesz 表示定理、Lax-Milgram 引理 |
| 紧算子与谱理论 | 自伴算子、紧算子、谱分解 | 谱定理、Hilbert-Schmidt 定理 |
| 再生核 Hilbert 空间 | RKHS、正定核、核技巧 | Moore-Aronszajn 定理 |
| 算子代数 | C\*-代数、泛函演算 | Gelfand-Naimark 定理、连续泛函演算 |
| 无界算子 | 定义域、自伴扩张 | Stone 定理、亏指数理论 |
| 量子力学应用 | 态、可观测量、Schrödinger 方程 | Stone 定理、谱公理 |

#### Hilbert 空间与其他数学分支的联系

Hilbert 空间理论位于多个数学分支的交汇处：

1. **与泛函分析的关系**：Hilbert 空间是 Banach 空间的特殊情况（范数由内积诱导），但其更丰富的几何结构带来了许多 Banach 空间中没有的结论（如正交投影的存在唯一性、Riesz 表示定理的简单形式）。

2. **与调和分析的关系**：正交基的 Fourier 展开是经典 Fourier 分析在抽象 Hilbert 空间中的推广；$L^2$ 空间上的 Fourier 变换是酉算子。

3. **与微分方程的关系**：Sobolev 空间 $H^k(\Omega)$（在 $L^2$ 意义下有 $k$ 阶弱导数的函数空间）是 Hilbert 空间，是偏微分方程弱解理论的函数空间基础。

4. **与概率论的关系**：$L^2$ 空间中的鞅论、条件期望的正交投影解释（条件期望 $E[X|\mathcal{F}]$ 是 $X$ 在 $\mathcal{F}$-可测函数子空间上的正交投影）。

5. **与数值分析的关系**：有限元方法中的 Galerkin 逼近本质上是 Hilbert 空间中的正交投影问题；共轭梯度法是最速下降法在 Hilbert 空间中的高效实现。

6. **与量子信息论的关系**：量子比特（qubit）由二维 Hilbert 空间 $\mathbb{C}^2$ 中的单位向量表示；量子纠缠对应于张量积空间中非可分解的向量；量子门操作对应 $\mathbb{C}^2$ 上的酉算子。

#### 进一步阅读建议

- **经典教材**：Reed & Simon《Methods of Modern Mathematical Physics》I-IV 卷（Hilbert 空间理论的百科全书式著作）；Conway《A Course in Functional Analysis》（深入且系统）。
- **应用导向**：Brezis《Functional Analysis, Sobolev Spaces and Partial Differential Equations》（偏微分方程方向的 Hilbert 空间方法）。
- **机器学习视角**：Berlinet & Thomas-Agnan《Reproducing Kernel Hilbert Spaces in Probability and Statistics》（RKHS 理论的权威参考）。
- **量子力学视角**：von Neumann《Mathematical Foundations of Quantum Mechanics》（Hilbert 空间公理体系的经典原著，1932 年首次出版，至今仍是该领域的基石）。