## 第92章：Jordan 代数
Jordan 代数是满足交换律 $x \cdot y = y \cdot x$ 与 **Jordan 恒等式** $(x \cdot y) \cdot x^2 = x \cdot (y \cdot x^2)$ 的非结合代数。它由 Pascual Jordan 于 1933 年在形式化量子力学的背景下引入，旨在以对称积 $a \circ b = (ab + ba)/2$ 来代替结合代数中的通常乘积，从而描述量子可观测量的代数结构。Jordan 代数看似是结合代数的简单对称化，实则包含了丰富而独立的代数世界——特别是 27 维的例外 Albert 代数，它是分类理论中的唯一例外对象。

### 74.1 基本定义与 Jordan 恒等式

**定义 74.1**（Jordan 代数）：域 $k$（$\operatorname{char} k \neq 2$）上的 **Jordan 代数** 是一个 $k$-向量空间 $J$，配以双线性乘法 $\cdot: J \times J \to J$，满足：

1. $x \cdot y = y \cdot x$（交换律）；
2. $(x \cdot y) \cdot x^2 = x \cdot (y \cdot x^2)$（Jordan 恒等式）。

其中 $x^2 = x \cdot x$。注意 Jordan 恒等式弱于结合律——Jordan 代数不要求乘法满足结合律。Jordan 代数也可等价地以线性化的 Jordan 恒等式定义：

$$(x \cdot y) \cdot (z \cdot w) + (x \cdot w) \cdot (z \cdot y) + (x \cdot z) \cdot (y \cdot w) = x \cdot [y \cdot (z \cdot w)] + x \cdot [w \cdot (z \cdot y)] + x \cdot [z \cdot (y \cdot w)]$$

以及其更常见的极化形式：

$$(x, y, z^2) = 2(x \cdot z, y, z)$$

其中 $(x, y, z) = (x \cdot y) \cdot z - x \cdot (y \cdot z)$ 为结合子（associator）。

**命题 74.1**：任何 Jordan 代数都是**幂结合的**（power-associative），即 $x^n = x \cdot x^{n-1}$ 的定义是无歧义的（与括弧位置无关）。

**证明**：由 Jordan 恒等式 $(x \cdot y) \cdot x^2 = x \cdot (y \cdot x^2)$，取 $y = x^{m-1}$ 得 $x^m \cdot x^2 = x \cdot (x^{m-1} \cdot x^2)$。假设归纳假设 $x^k \cdot x^\ell = x^{k+\ell}$ 对所有 $k+\ell < m+2$ 成立，则 $x^m \cdot x^2 = x \cdot x^{m+1} = x^{m+2}$。更一般地，对任意 $m, n \geq 1$，利用极化 Jordan 恒等式 $(x^m, x, x^n) = 2(x^{m+1}, x, x^n)$ 可归纳证明 $x^m \cdot x^n = x^{m+n}$。这意味着 $x^n$ 的定义与括弧方式无关，即 Jordan 代数为幂结合。 $\blacksquare$

### 74.2 特例 Jordan 代数与例外 Jordan 代数

**定义 74.2**（特例 Jordan 代数，Special Jordan Algebra）：设 $A$ 是结合代数。在向量空间 $A$ 上定义 **Jordan 积**：

$$a \circ b = \frac{ab + ba}{2}$$

则 $(A, \circ)$ 是 Jordan 代数，记作 $A^+$。同构于某个 $A^+$ 的子代数的 Jordan 代数称为**特例 Jordan 代数**（special Jordan algebra）。

**定义 74.3**（例外 Jordan 代数，Exceptional Jordan Algebra）：一个 **例外 Jordan 代数** 是不与任何结合代数的 $A^+$ 的子代数同构的 Jordan 代数。

**定理 74.2**（Albert 代数）：设 $\mathbb{O}$ 为 Cayley 八元数代数。$3 \times 3$ 的 Hermite 矩阵

$$H_3(\mathbb{O}) = \left\{\begin{pmatrix} a & z & \bar{y} \\ \bar{z} & b & x \\ y & \bar{x} & c \end{pmatrix} : a, b, c \in \mathbb{R},\; x, y, z \in \mathbb{O}\right\}$$

在 Jordan 积下构成 27 维 Jordan 代数。$H_3(\mathbb{O})$ 是例外 Jordan 代数，称为 **Albert 代数**。

**证明**：先验证 $H_3(\mathbb{O})$ 在 Jordan 积 $X \circ Y = \frac{1}{2}(XY + YX)$ 下封闭。八元数 $\mathbb{O}$ 非结合但满足交错律，故 $H_3(\mathbb{O})$ 中矩阵乘法虽非结合，但 Jordan 恒等式 $(X \circ Y) \circ X^2 = X \circ (Y \circ X^2)$ 仍成立。维数计算：$a, b, c \in \mathbb{R}$ 贡献 3 维，$x, y, z \in \mathbb{O}$ 各贡献 8 维，$3 \times 8 = 24$ 维，合计 $3 + 24 = 27$ 维。例外性：若 $H_3(\mathbb{O})$ 为特例的，则存在结合代数 $A$ 和单射 $H_3(\mathbb{O}) \hookrightarrow A^+$。Albert 代数中最多 3 个正交原始幂等元，而任何特例 Jordan 代数中正交幂等元对应结合代数中的正交幂等元，导出 $\mathbb{O}$ 结合性的矛盾。Glennie 于 1963 年发现 s-恒等式进一步证实了例外性。 $\blacksquare$

### 74.3 形式实 Jordan 代数与分类定理

**定义 74.4**（形式实 Jordan 代数）：Jordan 代数 $J$ 称为**形式实的**，如果对任意有限个 $x_i \in J$，$\sum x_i^2 = 0$ 蕴含所有 $x_i = 0$。形式实条件相当于正定性条件，保证了代数具有 Euclid 型的内积结构。

**定理 74.3**（Jordan-von Neumann-Wigner 分类定理，1934 年）：有限维形式实 Jordan 代数恰好是以下四类的直和：

1. **$H_n(\mathbb{R})$**：$n \times n$ 实对称矩阵，维数为 $n(n+1)/2$；
2. **$H_n(\mathbb{C})$**：$n \times n$ 复 Hermite 矩阵，维数为 $n^2$；
3. **$H_n(\mathbb{H})$**：$n \times n$ 四元数 Hermite 矩阵，维数为 $n(2n-1)$；
4. **旋因子**（spin factors）$\mathbb{R} \oplus \mathbb{R}^n$：由内积空间 $(V, q)$ 构造，乘法定义为 $(\lambda, v) \cdot (\mu, w) = (\lambda\mu + q(v, w), \lambda w + \mu v)$，维数为 $n+1$；
5. **Albert 代数** $H_3(\mathbb{O})$：$3 \times 3$ 八元数 Hermite 矩阵，维数为 27。

**证明**：设 $J$ 为有限维形式实 Jordan 代数。形式实性保证 $J$ 存在正定迹型 $\text{tr}(x \cdot y)$，从而 $J$ 半单且有单位元 $1$。将 $1$ 分解为正交原始幂等元之和 $1 = \sum_{i=1}^r e_i$。Peirce 分解给出 $J = \bigoplus_{i \leq j} J_{ij}$，其中 $J_{ii} = \mathbb{R} e_i$（一维）。分析连接数 $a_{ij} = \dim J_{ij}$：若某个 $a_{ij} = 0$ 则 $J$ 可分解为直和，故可设 $J$ 既约且 $a_{ij} > 0$。若 $r = 1$ 则 $J = \mathbb{R}$。若 $r = 2$ 则 $J$ 为旋因子。若 $r \geq 3$，则 $J_{ij}$ 上可定义乘法 $(x, y) \mapsto x \cdot e_i \cdot y$ 使其成为赋范可除代数，由 Hurwitz 定理必同构于 $\mathbb{R}, \mathbb{C}, \mathbb{H}$ 或 $\mathbb{O}$。当 $a_{ij} = 1, 2, 4$ 时分别对应 $H_n(\mathbb{R}), H_n(\mathbb{C}), H_n(\mathbb{H})$；当 $a_{ij} = 8$ 时唯有 $r = 3$（$H_3(\mathbb{O})$），因 $r \geq 4$ 时八元数组合同构性失效。 $\blacksquare$

### 74.4 与对称空间和 Lie 代数的联系

Jordan 代数通过 **Kantor-Koecher-Tits 构造**（KKT 构造）与 Lie 代数建立了深刻联系。

**定理 74.4**（KKT 构造）：设 $J$ 是 Jordan 代数。定义向量空间

$$T(J) = J \oplus \operatorname{Der}(J) \oplus J$$

其中 $\operatorname{Der}(J)$ 为 $J$ 的导子代数。可在 $T(J)$ 上定义一个 3-次 Lie 代数结构（即 $\mathbb{Z}$-分次 Lie 代数 $\mathfrak{g} = \mathfrak{g}_{-1} \oplus \mathfrak{g}_0 \oplus \mathfrak{g}_1$），使得 $\mathfrak{g}_{-1} \cong \mathfrak{g}_1 \cong J$，$\mathfrak{g}_0 \cong \operatorname{Str}(J)$（$J$ 的结构代数）。

具体 Lie 括号由以下公式给出：对 $x, y \in \mathfrak{g}_{-1} \cong J$，$[x, y] = -2L(x, y) \in \operatorname{Der}(J)$，其中 $L(x, y)z = (x \cdot y) \cdot z - x \cdot (y \cdot z)$。

**证明**：验证分次 Jacobi 恒等式。$\mathfrak{g}_{-1} \cong J$ 上 Lie 括号定义为 $[x, y] = -2L(x, y)$，其中 $L(x, y) \in \operatorname{Der}(J)$。$\mathfrak{g}_0 = \operatorname{Str}(J)$ 对 $\mathfrak{g}_{-1}$ 的作用由导子自然给出。$\mathfrak{g}_1$ 上括号由对称性定义。对 $[x, [y, z]] + [y, [z, x]] + [z, [x, y]]$ 在 $\mathfrak{g}_{-1}$ 上，利用 Jordan 恒等式 $(x \cdot y) \cdot x^2 = x \cdot (y \cdot x^2)$ 可验证其为零。$\mathfrak{g}_0$ 与 $\mathfrak{g}_{\pm 1}$ 的括号由 $\operatorname{Der}(J)$ 的 Lie 括号结构定义，Jacobi 恒等式由导子性质保证。$\mathfrak{g}_{\pm 1}$ 与 $\mathfrak{g}_0$ 的括号由结构代数的伴随表示定义。此分次 Lie 代数 $T(J)$ 称为 $J$ 的 Tits-Kantor-Koecher 代数。 $\blacksquare$

*意义*：此构造将任意 Jordan 代数"线性化"为 3-次 Lie 代数，从而将 Jordan 代数的分类问题归入 Lie 代数的分类框架。反之，Lie 代数的最高权向量表示理论可用来构造 Jordan 代数。

**定理 74.5**（Koecher-Tits 构造）：形式实 Jordan 代数 $J$ 的对称锥 $\Omega = \{x^2 : x \in J\}$ 的复化是 Hermite 对称空间。这给出了**有界对称域**（bounded symmetric domains）与形式实 Jordan 代数的一一对应：

**证明**：形式实 Jordan 代数 $J$ 的对称锥 $\Omega = \{x^2 : x \in J\}$ 是 $J$ 中的齐性自对偶锥。$\Omega$ 的管状域 $T_\Omega = J + i\Omega$ 在 $J_{\mathbb{C}}$ 中为有界对称域。KKT 构造给出 $T(J)$ 的 Lie 代数 $\mathfrak{g}$，其 Cartan 分解 $\mathfrak{g} = \mathfrak{k} \oplus \mathfrak{p}$ 中 $\mathfrak{p} \cong J$。$\Omega$ 的 Riemann 对称空间为 $G/K$，其中 $G$ 为 $\mathfrak{g}$ 对应的 Lie 群，$K$ 为 $\mathfrak{k}$ 对应的紧子群。此对应是可逆的：给定不可约有界对称域 $D$，其 Shilov 边界上的几何结构唯一确定一个形式实 Jordan 代数。分类对应：$H_n(\mathbb{R}) \leftrightarrow$ III 型（Siegel），$H_n(\mathbb{C}) \leftrightarrow$ I 型（经典），$H_n(\mathbb{H}) \leftrightarrow$ II 型，旋因子 $\leftrightarrow$ IV 型，Albert 代数 $\leftrightarrow$ 例外型（$E_7$ 相关）。 $\blacksquare$

- $\operatorname{Sym}_n(\mathbb{R})^+ \leftrightarrow$ Siegel 上半空间 $\mathbb{H}_n$（III 型有界对称域）；
- $\operatorname{Herm}_n(\mathbb{C})^+ \leftrightarrow$ I 型有界对称域（Cartan 的四种古典域中的第一种）；
- 旋因子 $\leftrightarrow$ IV 型有界对称域；
- Albert 代数 $\leftrightarrow$ 27 维的例外有界对称域（E.VII 型）。

这一对应是 Elie Cartan 对称空间分类的 Jordan 代数诠释，也是非交换调和分析和表示论的重要工具。

### Jordan 代数的现代发展与例外现象

Jordan 代数理论在 20 世纪下半叶经历了深刻的变革，其核心主题是理解例外现象（exceptional phenomena）的代数根源。**Kantor 对**（Kantor pair）是 Jordan 代数的推广，完全由一对满足特定 Jordan 型恒等式的向量空间组成，它自然地包含了有限维单 Lie 代数的所有 3-分次结构。**结构群**（structure group）$\operatorname{Str}(J)$ 是 $J$ 的线性自同构群，满足 $\operatorname{Str}(J) = \{g \in GL(J) : \exists g^* \in GL(J), g(x \cdot y) = gx \cdot g^*y\}$，其中 $g^*$ 由 $g$ 唯一确定。结构代数 $\operatorname{Str}(J)$ 的 Lie 代数包含内导子代数 $\operatorname{Innder}(J) = \{L(x, y) : x, y \in J\}$ 作为理想，商为 $\operatorname{Str}(J)/\operatorname{Innder}(J)$ 同构于 $J$ 的中心的 Lie 代数。**McCrimmon 的构造**（1966）通过 Freudenthal 三重系统（Freudenthal triple system）将 Albert 代数嵌入 56 维 $E_7$ 的 Lie 代数中，揭示了例外 Lie 代数与例外 Jordan 代数之间的一一对应：$F_4 = \operatorname{Der}(H_3(\mathbb{O}))$，$E_6 = \operatorname{Str}_0(H_3(\mathbb{O}))$（保持单位元的结构群），$E_7 = \operatorname{Conf}(H_3(\mathbb{O}))$（共形群），$E_8$ 则与 $H_3(\mathbb{O})$ 的"魔方"构造（Freudenthal-Tits 魔方）相关。**魔方构造**（magic square）是 Tits（1966）和 Freudenthal（1964）独立发现的 4x4 表格，其条目是两个赋范可除代数（$\mathbb{R}, \mathbb{C}, \mathbb{H}, \mathbb{O}$）的张量积对应的 Lie 代数，行列相交处正好给出所有例外 Lie 代数，其中 Albert 代数对应 $F_4$。这一构造将 Hurwitz 定理（可除代数分类）与 Killing-Cartan 分类（单 Lie 代数分类）完美统一。Jordan 代数在**量子力学**的公理化中扮演了基本角色——Jordan、von Neumann 和 Wigner 最初引入形式实 Jordan 代数正是为了用代数方法刻画量子可观测量的集合，而 Jordan-Banach 代数（JB-代数）和 JBW-代数（Jordan-Banach 代数中弱闭的）提供了量子力学代数基础的严格数学框架。在**非交换代数几何**中，Jordan 代数通过 Jordan 簇（Jordan scheme）和 Jordan 对（Jordan pair）的范畴化，为研究非结合的几何对象提供了平台。

---

---

## 第93章：交换代数深化

交换代数深化在卷十一交换代数的基础上，进一步探讨了 Cohen-Macaulay 环、Gorenstein 环、局部上同调和 Grothendieck 对偶等高级主题。这些概念在现代代数几何中扮演着核心角色——它们将代数簇的几何性质（如光滑性、奇点解消、对偶性）转化为交换环的代数性质。Cohen-Macaulay 性质是介于正则性和一般 Noether 性之间的关键中间概念：正则环必为 Cohen-Macaulay 环，但反之不然——环面簇的齐次坐标环是 Cohen-Macaulay 的却未必正则，这一现象在环面几何中具有基本重要性。Auslander-Buchsbaum 公式（$\operatorname{pd}_R(M) + \operatorname{depth}(M) = \operatorname{depth}(R)$）将投射维数与深度联系起来，是交换代数中最优美的等式之一，它精确量化了模的"同调复杂度"与"正则序列长度"之间的对偶关系。

Gorenstein 环是 Cohen-Macaulay 环中具有有限内射维数的一类，它们在 Serre 对偶和 Grothendieck 对偶中扮演着对偶化复形的角色。Grothendieck 局部对偶定理断言：对于 $d$ 维 Gorenstein 局部环 $R$，$H^i_{\mathfrak{m}}(M) \cong \operatorname{Hom}_R(\operatorname{Ext}^{d-i}_R(M, R), E)$，其中 $E$ 是剩余域的内射包络。这一对偶定理是 Serre 对偶的局部版本，它将局部上同调（一种"局部"同调）与 Ext 函子（一种"整体"上同调）联系起来，构成了代数几何中对偶理论的代数基础。局部上同调 $H^i_{\mathfrak{m}}(M)$ 本身量度了模 $M$ 沿极大理想 $\mathfrak{m}$ 的"奇异性"——它在代数几何中对应于凝聚层沿闭子簇的局部上同调，是研究奇点理论、D-模和比较定理的基本工具。本章将系统介绍 Cohen-Macaulay 环、Gorenstein 环、局部上同调和 Grothendieck 对偶，为代数几何（卷十五）中的对偶理论和平坦下降做好充分准备。

**定义 79.1**：Noether 局部环 $(R, \mathfrak{m})$ 的 **深度** $\operatorname{depth}(R)$ 是 $R$-正则序列的最大长度。总有 $\operatorname{depth}(R) \leq \dim(R)$。若等号成立，$R$ 称为 **Cohen-Macaulay 环**。若 $R$ 是 Cohen-Macaulay 且内射维数 $\operatorname{inj.dim}_R(R) < \infty$，则 $R$ 称为 **Gorenstein 环**。

**定理 79.1**（Auslander-Buchsbaum 公式）：对有限生成 $R$-模 $M$（$R$ 正则局部环，$\operatorname{pd}_R(M) < \infty$），有 $\operatorname{pd}_R(M) + \operatorname{depth}(M) = \operatorname{depth}(R)$，其中 $\operatorname{pd}$ 是投射维数。

**证明**：设 $R$ 为正则局部环，$\dim R = d$。取 $R$ 的正则参数系 $x_1, \ldots, x_d$，构造 Koszul 复形 $K_\bullet(x_1, \ldots, x_d)$，其为 $R$ 的极小自由消解，长度为 $d$。对有限生成 $R$-模 $M$ 满足 $\operatorname{pd}_R(M) < \infty$，取极小自由消解 $0 \to F_p \to \cdots \to F_0 \to M \to 0$。应用 Auslander-Buchsbaum 定理：$\operatorname{depth}(M) + \operatorname{pd}_R(M) = \operatorname{depth}(R) = d$。故 $\operatorname{pd}_R(M) = d - \operatorname{depth}(M)$。利用 Koszul 复形上同调与深度等价刻画，$\operatorname{depth}(M) = \min\{i : H^i(K_\bullet \otimes M) \neq 0\}$。代入 $\operatorname{pd}_R(M) = \max\{i : \operatorname{Tor}_i^R(M, k) \neq 0\}$ 并利用 Koszul 复形的 Tor 计算得证。 $\blacksquare$

**定理 79.2**（Serre 正则性判别）：Noether 局部环 $R$ 是正则环当且仅当 $R$ 的全局维数有限，当且仅当 $\dim_k(\mathfrak{m}/\mathfrak{m}^2) = \dim(R)$。这是代数几何中光滑性的代数对应：$\operatorname{Spec}(R)$ 光滑当且仅当 $R$ 为正则局部环。Cohen-Macaulay 性质介于正则性与一般 Noether 环之间——所有正则环是 Cohen-Macaulay，所有 Cohen-Macaulay 环在适当维数限制下满足 Serre 条件 $(S_k)$。

**证明**：设 $d = \dim_k(\mathfrak{m}/\mathfrak{m}^2)$。取 $x_1, \ldots, x_d \in \mathfrak{m}$ 使其在 $\mathfrak{m}/\mathfrak{m}^2$ 中的像为 $k$ 的基。Koszul 复形 $K_\bullet(x_1, \ldots, x_d)$ 为 $k$ 的极小自由消解，故 $\operatorname{pd}_R(k) = d$。由 Serre 定理，$\operatorname{gldim}(R) = \operatorname{pd}_R(k)$，故 $\operatorname{gldim}(R) = d$。另一方面，$\dim(R) \leq d$ 恒成立。$R$ 正则当且仅当 $\dim(R) = \operatorname{gldim}(R)$，这等价于 $\dim(R) = \dim_k(\mathfrak{m}/\mathfrak{m}^2)$。光滑性：$\operatorname{Spec}(R)$ 在闭点光滑当且仅当切空间维数等于环维数。 $\blacksquare$

### 79.2 局部上同调与 Grothendieck 对偶

**定义 79.2**：对环 $R$ 上模 $M$ 和理想 $I \subseteq R$，第 $i$ 个 **$I$-局部上同调** $\Gamma_I(M)$ 定义为 $M$ 中所有被 $I$ 的某次幂零化的元素的子模，高阶导出函子 $H^i_I(M) = R^i \Gamma_I(M)$。

**定理 79.3**（Grothendieck 局部对偶）：设 $R$ 为 $d$ 维 Gorenstein 局部环，$\mathfrak{m}$ 为极大理想。对有限生成 $R$-模 $M$，有自然同构 $H^i_{\mathfrak{m}}(M) \cong \operatorname{Hom}_R(\operatorname{Ext}^{d-i}_R(M, R), E)$ 其中 $E$ 是 $R$ 的内射包络。

**证明**：设 $R$ 为 $d$ 维 Gorenstein 局部环，$E = E_R(k)$ 为剩余域 $k$ 的内射包。定义 Matlis 对偶 $D(M) = \operatorname{Hom}_R(M, E)$。Gorenstein 条件给出 $H^d_{\mathfrak{m}}(R) \cong E$。利用局部对偶定理：$\operatorname{RHom}_R(M, \omega_R^\bullet[d]) \cong \operatorname{RHom}_R(\operatorname{R\Gamma}_{\mathfrak{m}}(M), E)$，其中 $\omega_R^\bullet$ 为对偶化复形。对 Gorenstein 环，$\omega_R^\bullet \cong R[d]$，故 $H^i_{\mathfrak{m}}(M) \cong \operatorname{Ext}_R^{d-i}(M, R)^\vee$。此同构由谱序列 $E_2^{p,q} = \operatorname{Ext}_R^p(\operatorname{Tor}_q^R(k, M), E) \Rightarrow H^{p+q}_{\mathfrak{m}}(M)$ 并结合 Koszul 复形计算得出。 $\blacksquare$

---

*本卷在 V8 的基础上完成了抽象代数核心领域的深化：Galois 理论建立了域扩张与群论的桥梁，彻底解决了方程根式可解性问题；交换代数为代数几何和代数数论提供了理想论、局部化、Noether 环等基础工具；表示论用特征标理论揭示了有限群的结构；同调代数引入 Ext/Tor 函子和导出函子，统一了代数拓扑和代数几何的上同调理论；代数数论建立了 Dedekind 整环中理想的唯一分解定理和理想类群理论。为后续代数几何（V15）、代数拓扑（V14）和数论 II（V16）的学习奠定了基础。*


*卷十二：抽象代数 II终。*


*卷十二：抽象代数 II终。*


*卷十二：抽象代数 II终。*


*卷十四：抽象代数（二）终。*
---

### PI代数理论

PI 代数（Polynomial Identity Algebra，多项式恒等代数）是非交换代数中一类重要的代数，它们虽不交换，但满足某个非交换多项式恒等式，从而在交换代数与完全非交换代数之间占据了中间地带。PI 理论由 Dehn（1922）和 Wagner（1937）早期探索，经 Kaplansky（1948 年证明本原 PI 代数是中心单代数）、Amitsur 和 Levitzki（1950 年证明矩阵代数 $M_n(k)$ 满足标准恒等式 $S_{2n} = 0$）等人的工作，逐渐发展为非交换代数中最系统、最深刻的理论之一。PI 代数的核心洞察是：多项式恒等式对代数结构施加了强烈的限制，使得 PI 代数虽然非交换，却与交换代数共享许多良好性质，如有限维表示的分类、理想的链条件等。

Amitsur-Levitzki 定理是 PI 理论中最著名的结果：$n \times n$ 矩阵代数 $M_n(k)$ 满足标准恒等式 $S_{2n}(x_1, \ldots, x_{2n}) = \sum_{\sigma \in \mathfrak{S}_{2n}} \operatorname{sgn}(\sigma) x_{\sigma(1)} \cdots x_{\sigma(2n)} = 0$，且 $2n$ 是最小的可能次数。这一结果惊人地揭示了：任何一个 $n$ 维向量空间上的线性变换，如果取 $2n$ 个，则它们的交错乘积之和恒为零。Kaplansky 定理进一步将 PI 代数与经典结构联系起来：在特征零域上，本原 PI 代数必为中心单代数（即 $M_n(D)$，$D$ 为有限维除环），这为 PI 代数的结构理论奠定了基础。

Specht 问题（1907 年提出，1987 年由 Kemer 解决）是 PI 理论中影响最深远的猜想：在特征零域上，每个结合代数的 T-理想（恒等式理想）是否都是有限基的——即所有多项式恒等式能否由有限多个恒等式生成？Kemer 的肯定回答依赖于他建立的 PI 代数表示论与 $\mathbb{Z}_2$-分次代数之间的深刻联系（Grassmann 包络），以及有限维 $\mathbb{Z}_2$-分次代数的 T-理想有限基定理。Giambruno-Zaicev 定理（1999）进一步证明了 PI 指数 $\exp(A) = \lim_{n \to \infty} \sqrt[n]{c_n(A)}$ 存在且为整数，其中 $c_n(A)$ 是 $n$ 次多线性多项式的 codimension 序列。本章将系统介绍 PI 代数的定义、基本例子、Amitsur-Levitzki 定理、Kaplansky 定理、T-理想、Specht 问题的 Kemer 解，以及 codimension 序列的渐近理论。

**定义 1**（自由结合代数）：设 $k$ 是域。令 $k\langle x_1, \ldots, x_n \rangle$ 是非交换变元 $x_1, \ldots, x_n$ 上的自由结合代数（张量代数）。其元素是非交换多项式的有限形式和。

**定义 2**（PI代数）：结合 $k$-代数 $A$ 称为**多项式恒等代数**（PI代数），若存在非零多项式

$$f(x_1, \ldots, x_n) \in k\langle x_1, \ldots, x_n \rangle$$

使得对所有 $a_1, \ldots, a_n \in A$，有 $f(a_1, \ldots, a_n) = 0$。这样的 $f$ 称为 $A$ 的**多项式恒等式**。恒等式的最小次数称为 $A$ 的 **PI-次数**。

若 $A$ 不是 PI 代数，则称 $A$ 为 **PI-平凡**的。

### 基本例子

PI 环的定义虽然形式简洁，但判断一个给定环是否满足多项式恒等式并非总是显然的。以下几个基本例子展示了 PI 环的"典型来源"——交换代数（最平凡的 PI 环）、有限维代数（由线性相关性保证）和 Azumaya 代数（由矩阵表示控制）。

**定理 1**（交换代数）：每个交换 $k$-代数 $A$ 都是 PI 代数，满足 $[x_1, x_2] = x_1 x_2 - x_2 x_1 = 0$。此恒等式的次数为 2。

**证明**：$A$ 交换意味着对任意 $a, b \in A$，$ab = ba$。定义多项式 $f(x_1, x_2) = [x_1, x_2] = x_1 x_2 - x_2 x_1$。对任意 $a_1, a_2 \in A$，$f(a_1, a_2) = a_1 a_2 - a_2 a_1 = 0$。故 $f \in \operatorname{Id}(A)$ 为非平凡 PI 恒等式，次数为 $\deg f = 2$。$f$ 是 $A$ 的 T-理想的生成元，且 $A$ 的 PI-次数为 $1$。 $\blacksquare$

**定理 2**（有限维代数是PI代数）：设 $A$ 是域 $k$ 上的有限维结合代数，$\dim_k A = d$。则 $A$ 是 PI 代数，且所有次数为 $d+1$ 的单项式的交错和给出一个恒等式。更精确地，$A$ 满足所有次数为 $d+1$ 的标准多项式恒等式。

**证明**：任取 $d+1$ 个元素 $a_1, \ldots, a_{d+1} \in A$。由于 $\dim_k A = d$，这 $d+1$ 个元素在 $k$ 上线性相关。存在不全为零的 $\lambda_1, \ldots, \lambda_{d+1} \in k$ 使得 $\sum \lambda_i a_i = 0$。将这个线性相关性编码为多项式恒等式需要对所有代换封闭。由 Amitsur-Levitzki 的一般论证（见下），标准恒等式 $S_{2d}$ 对所有 $d$ 维代数成立，其证明不依赖矩阵结构的特殊性（仅需线性相关的维数论证和交错性）。$\blacksquare$

**定理 3**（Azumaya代数）：设 $A$ 是交换环 $R$ 上的 Azumaya 代数（中心可分离 $R$-代数），且 $A$ 作为 $R$-模有限生成忠实。则 $A$ 是 $R$ 上的 PI 代数，其 PI-次数等于 $A$ 的次数（degree）。

**证明**：$A$ 为 $R$ 上 Azumaya 代数，故 $A \otimes_R A^{\text{op}} \cong \operatorname{End}_R(A)$。对任意剩余域 $k = R/\mathfrak{m}$，$A \otimes_R k$ 为 $k$ 上中心单代数，维数为 $n^2$，其中 $n$ 为 $A$ 的次数。由 Amitsur-Levitzki 定理，$A \otimes_R k$ 满足 $S_{2n} = 0$。由于此恒等式对所有剩余域成立，且 $A$ 忠实平坦，$A$ 自身满足 $S_{2n} = 0$，故 $A$ 为 PI 代数，PI-次数为 $n$。 $\blacksquare$

### Amitsur-Levitzki定理

**定义 3**（标准多项式）：$m$ 阶**标准多项式** $S_m$ 定义为：

$$S_m(x_1, \ldots, x_m) = \sum_{\sigma \in \mathfrak{S}_m} \operatorname{sgn}(\sigma) \, x_{\sigma(1)} x_{\sigma(2)} \cdots x_{\sigma(m)}$$

**定理 4**（Amitsur-Levitzki，1950）：矩阵代数 $M_n(k)$ 满足标准恒等式 $S_{2n} = 0$，即对任意 $n \times n$ 矩阵 $X_1, \ldots, X_{2n}$，

**证明**：因 $S_{2n}$ 为多线性，只需验证 $X_i$ 为矩阵单位 $E_{pq}$ 时成立。将 $S_{2n}(E_{p_1 q_1}, \ldots, E_{p_{2n} q_{2n}})$ 展开为 $2n!$ 项的和。关键观察：每一项为 $E_{p_{\sigma(1)} q_{\sigma(1)}} \cdots E_{p_{\sigma(2n)} q_{\sigma(2n)}}$，非零仅当 $q_{\sigma(i)} = p_{\sigma(i+1)}$ 对所有 $i$ 成立。因仅有 $n$ 个不同指标，鸽巢原理保证 $2n$ 个指标中必有重复，但在交错和 $\sum \operatorname{sgn}(\sigma)$ 中，配对项抵消。严格论证利用 $S_{2n}$ 可写为 $[X_1, \ldots, X_{2n}]$ 的迹为零的性质，结合 Cayley-Hamilton 定理的线性化版本。 $\blacksquare$

$$S_{2n}(X_1, \ldots, X_{2n}) = \sum_{\sigma \in \mathfrak{S}_{2n}} \operatorname{sgn}(\sigma) X_{\sigma(1)} \cdots X_{\sigma(2n)} = 0$$

且 $2n$ 是最小的可能次数：存在 $2n-1$ 个矩阵使 $S_{2n-1} \neq 0$。

### Kaplansky定理

**定义 4**（本原代数）：环 $R$ 称为**右本原的**，若它有忠实单右模。等价地，$R$ 有极大右理想不包含任何非零理想。

**定理 5**（Kaplansky，1948）：设 $A$ 是域 $k$ 上的本原 PI 代数。则 $A$ 是有限维中心单代数，具体地：

**证明**：$A$ 本原故有忠实不可约模 $V$，$A$ 在 $\operatorname{End}_k(V)$ 中稠密。若 $\dim_k V = \infty$，则 $A$ 包含任意有限秩线性变换，不满足任何 PI 恒等式。故 $\dim_k V = n < \infty$，$A \cong M_n(D)$，$D$ 为除环。PI 条件给出 $S_{2n} = 0$ 为 $A$ 的非平凡恒等式。$D$ 的中心 $Z(D)$ 为 $k$ 的有限扩张。由 Posner 定理，$A$ 的中心 $Z(A) \cong Z(D)$ 为域，$[A:Z(A)] = n^2 [D:Z(D)] < \infty$。 $\blacksquare$

$$A \cong M_n(D)$$

其中 $D$ 是 $k$ 上的有限维可除代数（即中心单代数），且 $n = \mathrm{PIdeg}(A)$。

### T-理想

**定义 5**（T-理想）：自由结合代数 $k\langle X \rangle = k\langle x_1, x_2, \ldots \rangle$ 的一个理想 $I$ 称为 **T-理想**，若对每个代数同态 $\varphi: k\langle X \rangle \to k\langle X \rangle$，有 $\varphi(I) \subseteq I$。等价地，$I$ 在所有变元代换下封闭。

**定理 6**（PI恒等式与T-理想的对应）：$k\langle X \rangle$ 的 T-理想与 PI 代数的恒等式类之间存在一一对应：

$$I \longmapsto \{A \mid I \subseteq \mathrm{Id}(A)\}$$

其中 $\mathrm{Id}(A) = \{f \in k\langle X \rangle \mid f(a_1, \ldots, a_n) = 0, \forall a_i \in A\}$ 是 $A$ 的 **T-理想**（恒等式理想）。

**证明**：需验证 $\mathrm{Id}(A)$ 确实是 T-理想。设 $f(x_1, \ldots, x_n) \in \mathrm{Id}(A)$，对任意代换 $\varphi$（即任意 $g_1, \ldots, g_n \in k\langle X \rangle$），$f(g_1, \ldots, g_n)$ 仍是恒等式：对任意赋值 $a_i \mapsto g_i(a_1, \ldots)$，结果为零因 $f$ 本身为零对任意论证。包含方向和理想性质平凡验证。$\blacksquare$

### Specht问题与Kemer解

T-理想的语言将 PI 代数的分类问题转化为自由代数中理想生成元的有限性问题。Specht 于 1907 年提出的核心问题是：特征零域上，每个 PI 代数的所有恒等式是否都可以由有限个"基本恒等式"通过代换生成？这一问题悬而未决八十年，直到 Kemer 在 1987 年通过引入有限维 $\mathbb{Z}_2$-分次代数的表示论给出了肯定的解答。

**定义 6**（有限基）：T-理想 $I$ 称为**有限基的**（finitely based），若存在有限集合 $F \subseteq k\langle X \rangle$ 使得 $I$ 是由 $F$ 生成的（最小）T-理想。等价地，$I$ 中所有恒等式可由有限多个恒等式通过代换和线性组合导出。

**定理 7**（Specht问题，1907年提出）：在特征零域上，每个 T-理想是否都是有限基的？

**证明**：Specht 问题为开放性猜想，直到 1987 年由 Kemer 解决。证明思路：将 T-理想与 $\mathbb{Z}_2$-分次代数关联。Kemer 构造了从 T-理想到有限维 $\mathbb{Z}_2$-分次代数（Grassmann 包络）的对应。有限维 $\mathbb{Z}_2$-分次代数的 T-理想有有限基，通过此对应推得原 T-理想也有有限基。Kemer 证明的关键步骤：(1) 多项式恒等式的表示理论；(2) PI 代数的结构定理；(3) 有限基性质在 Grassmann 包络下的保持。 $\blacksquare$

**定理 8**（Kemer解，1987）：在特征零域上，每个结合代数的 T-理想是有限基的。即：特征零域上的结合 PI 代数满足 Specht 性质——任意 PI 代数的所有多项式恒等式可由有限多个恒等式生成。

**证明**：Kemer 的证明分四步。(1) 表示论归约：将自由代数 $k\langle X \rangle$ 的多线性部分视为 $\mathfrak{S}_n$-模。T-理想 $I$ 对应 $\mathfrak{S}_n$-子表示序列 $I_n \subseteq P_n$。特征零下 $\mathfrak{S}_n$ 全可约，故 $P_n = I_n \oplus Q_n$，T-理想的有限基等价于 $Q_n$ 序列满足 Noether 性质。(2) Grassmann 包络：对任意 PI 代数 $A$，构造 $G(A) = A \otimes_k E$（$E$ 为 Grassmann 代数），$G(A)$ 为 $\mathbb{Z}_2$-分次代数。Kemer 证明了 $G(A)$ 的 T-理想与 $A$ 的 T-理想一一对应。(3) 有限维归约：$G(A)$ 的 T-理想由有限维 $\mathbb{Z}_2$-分次代数 $B$（$G(A)$ 的基代数）的恒等式完全决定。$B$ 有限维，其 T-理想由幂零指标和半单部分控制。(4) 终结：有限维 $\mathbb{Z}_2$-分次代数的 T-理想经有限步后稳定，即存在有限生成元集。通过 Grassmann 包络对应推回 $A$，得 $A$ 的 T-理想有有限基。 $\blacksquare$

### Codimension序列与Regev定理

Kemer 的定理解决了 Specht 问题在定性层面的存在性——恒等式由有限基生成——但它没有给出如何从代数 $A$ 本身提取定量信息的途径。Codimension 序列 $c_n(A)$ 正是为此设计的：它度量了 $n$ 次多线性多项式中模去 $A$ 的恒等式后所"存活"的空间维数，从而将 PI 代数的复杂度转化为一个数值序列。

**定义 7**（Codimension序列）：设 $A$ 是 $k$ 上的 PI 代数。令 $P_n = \{f \in k\langle x_1, \ldots, x_n \rangle \mid f \text{ 是多线性的}\}$ 是 $n$ 次多线性多项式的空间。定义 $n$ 次 **codimension**：

$$c_n(A) = \dim_k \frac{P_n}{P_n \cap \mathrm{Id}(A)}$$

$c_n(A)$ 度量 $A$ 的恒等式在 $n$ 次多线性层面的"截断"程度。

**定理 9**（Regev，1972）：若 $A$ 是 PI 代数，则 codimension 序列以指数速度增长，即存在常数 $a > 0$ 使得

**证明**：$A$ 为 PI 代数，故存在 $m$ 满足标准恒等式 $S_{2m} \in \operatorname{Id}(A)$。$S_{2m}$ 的存在性限制 $\mathfrak{S}_n$-模 $P_n/P_n \cap \operatorname{Id}(A)$ 中不可约表示的类型。具体地，仅有 Hook 长度 $\leq m$ 的 Young 图对应的表示可存活。$n$ 次多线性多项式中可存活的分割数量为 $\sum_{\lambda \vdash n, \lambda_1' \leq m} 1$，其渐近增长为 $O(m^{2n})$。故 $c_n(A) = \dim(P_n/P_n \cap \operatorname{Id}(A)) \leq C \cdot a^n$，其中 $a = m^2$。这给出了 $c_n(A)$ 的指数上界，而 Regev 定理进一步证明了指数增长是精确的。 $\blacksquare$

$$c_n(A) \le a^n, \quad \forall n \ge 1$$

### PI-exponent定理

**定义 8**（PI-exponent）：PI 代数 $A$ 的 **PI-指数**定义为：

$$\exp(A) = \lim_{n \to \infty} \sqrt[n]{c_n(A)}$$

Regev 定理保证该极限有界；Giambruno-Zaicev 定理保证该极限存在。

**定理 10**（Giambruno-Zaicev，1999）：在特征零域上，任意 PI 代数 $A$ 的 PI-指数存在且是整数：

**证明**：由 Kemer 的结构理论，$A$ 的 T-理想对应有限维 $\mathbb{Z}_2$-分次代数 $B$（Grassmann 包络）。$c_n(A)$ 的渐近行为由 $B$ 的半单部分 $B_{\text{ss}}$ 的表示论决定。具体地，$\exp(A) = \dim B_{\text{ss}}$。因 $B_{\text{ss}}$ 为有限维半单代数，其维数为整数。极限 $\exp(A) = \lim_{n \to \infty} \sqrt[n]{c_n(A)}$ 的存在性由 $\mathfrak{S}_n$-表示渐近理论保证：$c_n(A) = \sum_{\lambda \vdash n} m_\lambda d_\lambda$，其中 $d_\lambda$ 为 $\lambda$ 的不可约表示的维数，$m_\lambda$ 为重数。渐近分析给出 $c_n(A) \sim C \cdot n^t \cdot \exp(A)^n$，其中 $t$ 为半整数。 $\blacksquare$

$$\exp(A) \in \mathbb{N} \cup \{0\}$$

具体地，$\exp(A) = \dim_k \overline{A}$，其中 $\overline{A}$ 是与 $A$ 关联的有限维（超）代数的半单部分之维数（在 Kemer 理论意义下）。若 $A$ 是有限维，则 $\exp(A) \le \dim_k A$。

### 张量积的Regev定理

**定义 9**（PI代数张量积）：设 $A, B$ 是域 $k$ 上的结合代数。称 $A \otimes_k B$ 为 $A$ 和 $B$ 的张量积代数，其乘法为 $(a_1 \otimes b_1)(a_2 \otimes b_2) = a_1 a_2 \otimes b_1 b_2$。

**定理 11**（Regev张量积定理，1972）：若 $A$ 和 $B$ 都是 $k$ 上的 PI 代数，则 $A \otimes_k B$ 也是 PI 代数。

**证明**：$A$ 满足某标准恒等式 $S_{2a} = 0$，$B$ 满足某标准恒等式 $S_{2b} = 0$。需构造 $A \otimes B$ 的一个显式 PI。

令 $m = 2a + 2b$。考虑标准多项式 $S_m$。对任意 $m$ 个张量积元 $a_1 \otimes b_1, \ldots, a_m \otimes b_m$，计算：

$$S_m(a_1 \otimes b_1, \ldots, a_m \otimes b_m) = \sum_{\sigma \in \mathfrak{S}_m} \operatorname{sgn}(\sigma) a_{\sigma(1)}\cdots a_{\sigma(m)} \otimes b_{\sigma(1)}\cdots b_{\sigma(m)}$$

由于 $m = 2a + 2b$，对每个排列 $\sigma$，因子 $a_{\sigma(1)}\cdots a_{\sigma(m)}$ 中任何连续 $2a$ 个因子可以交错化给出 $S_{2a}$ 的贡献——但因为 $m$ 足够大，可以利用鸽巢原理：$m$ 个因子中必然有 $2a$ 个来自 $A$ 的 "交替"块或 $2b$ 个来自 $B$ 的交替块。更精确地，对整个和采用 Fourier 变换（将 $S_m$ 写成关于 Capelli 恒等式的分解），利用 Regev 的原始引理：存在 $l$（依赖于 $a, b$）使得某交错化多项式恒为零。由此得 $A \otimes B$ 满足某显式恒等式。$\blacksquare$

**注记**：此定理在结合代数的 PI 理论中具有根本重要性——它表明 PI 性质在张量积下封闭，这意味着 PI 代数构成一个幺半范畴的满子范畴。结合 Amitsur-Levitzki 和 Kaplansky 定理，这进一步构建了"半单 PI 代数"——即有限个矩阵代数张量可除代数的直积——的完整分类框架。
