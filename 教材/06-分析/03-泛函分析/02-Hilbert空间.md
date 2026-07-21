## 第114章：Hilbert 空间
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

---

---

---

---

---