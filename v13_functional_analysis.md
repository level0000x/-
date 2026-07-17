# 卷十三：泛函分析

> 泛函分析是线性代数在无穷维空间的推广，研究函数空间上的线性算子及其谱理论。本卷从 Banach 空间和 Hilbert 空间的基本定理出发，建立对偶理论和弱拓扑，进而研究紧算子和谱理论，最后介绍 C*-代数初步，为量子力学、偏微分方程和调和分析提供数学基础。

---

## 第72章：Banach 空间
Banach 空间是完备的赋范向量空间，是泛函分析最基本的框架。Hahn-Banach、开映射、闭图像和一致有界原理被称为 Banach 空间的四大基本定理。

### 72.1 赋范空间与 Banach 空间

**定义 72.1**（赋范空间）：设 $X$ 是数域 $\mathbb{K}$（$\mathbb{R}$ 或 $\mathbb{C}$）上的向量空间。映射 $\|\cdot\|: X \to [0, \infty)$ 称为 $X$ 上的一个**范数**，如果满足：

1. $\|x\| = 0 \Leftrightarrow x = 0$（正定性）
2. $\|\alpha x\| = |\alpha| \|x\|$（齐次性）
3. $\|x + y\| \leq \|x\| + \|y\|$（三角不等式）

$(X, \|\cdot\|)$ 称为**赋范向量空间**。范数诱导度量 $d(x, y) = \|x - y\|$ 和拓扑。

**定义 72.2**（Banach 空间）：完备的赋范向量空间称为 **Banach 空间**。即每个 Cauchy 序列都收敛。

**例 72.1**（Banach 空间举例）：
- $\mathbb{R}^n$ 和 $\mathbb{C}^n$（有限维赋范空间总是完备的）
- $\ell^p$ 空间（$1 \leq p \leq \infty$）：$\|(x_n)\|_p = (\sum_{n=1}^\infty |x_n|^p)^{1/p}$（$p < \infty$），$\|(x_n)\|_\infty = \sup_n |x_n|$
- $L^p(\Omega)$（$1 \leq p \leq \infty$）：由 V9 第 48 章的 Riesz-Fischer 定理保证完备性
- $C([a, b])$：连续函数空间配以 $\|f\|_\infty = \sup_{x \in [a, b]} |f(x)|$
- $c_0$：收敛到零的序列空间，配以 $\|\cdot\|_\infty$

**定义 72.3**（等价范数）：$X$ 上的两个范数 $\|\cdot\|_1$ 和 $\|\cdot\|_2$ 称为**等价的**，如果存在常数 $c, C > 0$ 使得 $c\|x\|_1 \leq \|x\|_2 \leq C\|x\|_1$ 对所有 $x \in X$ 成立。

**定理 72.1**：有限维赋范空间上的所有范数都等价，且有限维赋范空间总是 Banach 空间。

*证明*：设 $X$ 是 $n$ 维赋范空间，取基 $\{e_1, \ldots, e_n\}$。定义欧氏范数 $\|\sum a_i e_i\|_2 = (\sum |a_i|^2)^{1/2}$。对任意范数 $\|\cdot\|$，由三角不等式和 Cauchy-Schwarz 得 $\|x\| \leq C\|x\|_2$。函数 $x \mapsto \|x\|$ 在单位球面 $S = \{x : \|x\|_2 = 1\}$ 上连续且严格正，由紧致性得 $c = \inf_S \|x\| > 0$，故 $\|x\| \geq c\|x\|_2$。∎

### 72.2 有界线性算子

**定义 72.4**（有界线性算子）：设 $X, Y$ 是赋范空间。线性算子 $T: X \to Y$ 称为**有界的**，如果存在 $M \geq 0$ 使得 $\|Tx\| \leq M\|x\|$ 对所有 $x \in X$ 成立。$T$ 的**算子范数**定义为

$$\|T\| = \sup_{\|x\| \leq 1} \|Tx\| = \sup_{\|x\| = 1} \|Tx\|$$

**命题 72.2**：线性算子 $T: X \to Y$ 有界当且仅当 $T$ 连续，当且仅当 $T$ 在 $0$ 处连续。

*证明*：若有界，则 $\|Tx - Ty\| = \|T(x-y)\| \leq \|T\| \|x-y\|$，故 Lipschitz 连续。若在 $0$ 处连续，则存在 $\delta > 0$ 使 $\|x\| < \delta \Rightarrow \|Tx\| < 1$。对任意 $x$，$\|T(\delta x/(2\|x\|))\| < 1$，故 $\|Tx\| < (2/\delta)\|x\|$。∎

**定义 72.5**（算子空间）：$X$ 到 $Y$ 的所有有界线性算子构成向量空间，记作 $\mathcal{B}(X, Y)$。配以算子范数，$\mathcal{B}(X, Y)$ 是赋范空间。若 $Y$ 是 Banach 空间，则 $\mathcal{B}(X, Y)$ 也是 Banach 空间。特别地，$X^* = \mathcal{B}(X, \mathbb{K})$ 称为 $X$ 的**对偶空间**（或共轭空间）。

**定理 72.3**（Banach-Steinhaus 一致有界原理）：设 $X$ 是 Banach 空间，$Y$ 是赋范空间，$\{T_\alpha\}_{\alpha \in A} \subseteq \mathcal{B}(X, Y)$。若对每个 $x \in X$，$\sup_{\alpha} \|T_\alpha x\| < \infty$，则 $\sup_{\alpha} \|T_\alpha\| < \infty$。

*证明*：使用 Baire 纲定理。对每个 $n \in \mathbb{N}$，定义 $F_n = \{x \in X : \sup_\alpha \|T_\alpha x\| \leq n\}$。$F_n$ 是闭集，且 $X = \bigcup_{n} F_n$。由 Baire 纲定理，存在 $n_0$ 使 $F_{n_0}$ 有内点。设 $B(x_0, r) \subseteq F_{n_0}$。对任意 $\|x\| \leq r$，$x_0 + x \in F_{n_0}$，故 $\|T_\alpha x\| \leq \|T_\alpha(x_0 + x)\| + \|T_\alpha x_0\| \leq 2n_0$。因此 $\|T_\alpha\| \leq 2n_0/r$ 对所有 $\alpha$ 成立。∎

### 72.3 Hahn-Banach 定理

**定理 72.4**（Hahn-Banach 延拓定理，实情形）：设 $X$ 是实向量空间，$p: X \to \mathbb{R}$ 满足 $p(x+y) \leq p(x) + p(y)$ 和 $p(tx) = tp(x)$ 对 $t \geq 0$（次线性泛函）。设 $M \subseteq X$ 是子空间，$f: M \to \mathbb{R}$ 是线性泛函满足 $f(x) \leq p(x)$ 对所有 $x \in M$。则存在 $f$ 的线性延拓 $F: X \to \mathbb{R}$ 使得 $F(x) \leq p(x)$ 对所有 $x \in X$ 成立。

*证明*：使用 Zorn 引理。考虑所有保持 $f$ 且满足 $F(x) \leq p(x)$ 的延拓构成的偏序集（按包含关系）。由 Zorn 引理存在极大延拓 $F$，定义域为 $M'$。若 $M' \neq X$，取 $x_0 \notin M'$。需定义 $F(x_0)$ 使得对任意 $y, z \in M'$：

$$F(y) + F(x_0) \leq p(y + x_0), \quad F(z) - F(x_0) \leq p(z - x_0)$$

这等价于 $F(z) - p(z - x_0) \leq F(x_0) \leq p(y + x_0) - F(y)$。由 $f(y) + f(z) = f(y+z) \leq p(y+z) \leq p(y+x_0) + p(z-x_0)$，知上确界不大于下确界，故可取 $F(x_0)$ 为中间值。在 $M' \oplus \mathbb{R}x_0$ 上延拓，与极大性矛盾。∎

**定理 72.5**（Hahn-Banach 定理，赋范空间版本）：设 $X$ 是赋范空间，$M \subseteq X$ 是子空间，$f \in M^*$。则存在 $F \in X^*$ 使得 $F|_M = f$ 且 $\|F\| = \|f\|$。

*证明*：取 $p(x) = \|f\| \|x\|$（次线性），则 $|f(x)| \leq p(x)$ 在 $M$ 上。由 Hahn-Banach 定理存在 $F$ 满足 $F(x) \leq p(x)$。由 $F(-x) = -F(x) \leq p(-x) = p(x)$ 得 $|F(x)| \leq p(x) = \|f\| \|x\|$，故 $\|F\| \leq \|f\|$。反向不等式显然。∎

**推论 72.6**（Hahn-Banach 推论）：
1. 对任意 $x \in X, x \neq 0$，存在 $f \in X^*$ 使得 $\|f\| = 1$ 且 $f(x) = \|x\|$。
2. $X^*$ 分离 $X$ 中的点：若 $x \neq y$，则存在 $f \in X^*$ 使 $f(x) \neq f(y)$。
3. $\|x\| = \sup_{\|f\| \leq 1} |f(x)|$。

### 72.4 开映射定理与闭图像定理

**定理 72.7**（开映射定理）：设 $X, Y$ 是 Banach 空间，$T \in \mathcal{B}(X, Y)$ 是满射。则 $T$ 是开映射（即将开集映为开集）。特别地，若 $T$ 是连续双射，则 $T^{-1}$ 连续，即 $T$ 是同胚（从而 $T$ 是 Banach 空间同构）。

*证明*：证 $T(B_X(0, 1))$ 包含 $B_Y(0, r)$ 对某个 $r > 0$。由满射性和 Baire 纲定理，存在 $n$ 使 $\overline{T(B_X(0, n))}$ 有内点。则 $\overline{T(B_X(0, 1))}$ 包含某球 $B_Y(y_0, \delta)$。由对称性得 $B_Y(0, \delta) \subseteq \overline{T(B_X(0, 2))}$。再由完备性迭代可得 $B_Y(0, \delta/2) \subseteq T(B_X(0, 1))$。∎

**定理 72.8**（闭图像定理）：设 $X, Y$ 是 Banach 空间，$T: X \to Y$ 是线性算子。则 $T$ 有界当且仅当 $T$ 的图像 $\Gamma(T) = \{(x, Tx) : x \in X\}$ 是 $X \times Y$（配以范数 $\|(x, y)\| = \|x\| + \|y\|$）中的闭集。

*证明*：($\Rightarrow$) 若 $T$ 有界，设 $(x_n, Tx_n) \to (x, y)$，则 $x_n \to x$，由连续性 $Tx_n \to Tx$，故 $y = Tx$，$\Gamma(T)$ 闭。

($\Leftarrow$) 若 $\Gamma(T)$ 闭，则 $\Gamma(T)$ 是 Banach 空间 $X \times Y$ 的闭子空间，从而是 Banach 空间。投影 $\pi_1: \Gamma(T) \to X$，$\pi_1(x, Tx) = x$ 是连续双射。由开映射定理，$\pi_1^{-1}$ 连续，故 $\|x\| + \|Tx\| = \|(x, Tx)\| \leq C\|x\|$，从而 $\|Tx\| \leq C\|x\|$，$T$ 有界。∎

---

---

## 第73章：Hilbert 空间
Hilbert 空间是带有内积的完备空间，其几何结构比一般 Banach 空间更丰富，有正交投影、正交基等概念。

### 73.1 内积空间与 Hilbert 空间

**定义 73.1**（内积空间）：$\mathbb{K}$ 上的向量空间 $H$ 配以一个**内积** $\langle \cdot, \cdot \rangle: H \times H \to \mathbb{K}$ 满足：

1. $\langle x, x \rangle \geq 0$，且 $\langle x, x \rangle = 0 \Leftrightarrow x = 0$（正定性）
2. $\langle x, y \rangle = \overline{\langle y, x \rangle}$（共轭对称性）
3. $\langle \alpha x + \beta y, z \rangle = \alpha \langle x, z \rangle + \beta \langle y, z \rangle$（对第一变元的线性性）

内积诱导范数 $\|x\| = \sqrt{\langle x, x \rangle}$。若 $(H, \langle \cdot, \cdot \rangle)$ 在该范数下完备，则称为 **Hilbert 空间**。

**定理 73.1**（Cauchy-Schwarz 不等式）：$|\langle x, y \rangle| \leq \|x\| \|y\|$，等号成立当且仅当 $x$ 与 $y$ 线性相关。

*证明*：对 $\lambda \in \mathbb{K}$，$0 \leq \|x - \lambda y\|^2 = \|x\|^2 - 2\Re(\lambda \langle y, x \rangle) + |\lambda|^2 \|y\|^2$。取 $\lambda = \langle x, y \rangle / \|y\|^2$（$y \neq 0$ 时）可得不等式。∎

**定理 73.2**（平行四边形法则与极化恒等式）：
- 平行四边形法则：$\|x + y\|^2 + \|x - y\|^2 = 2(\|x\|^2 + \|y\|^2)$
- 极化恒等式（实情形）：$\langle x, y \rangle = \frac{1}{4}(\|x + y\|^2 - \|x - y\|^2)$
- 极化恒等式（复情形）：$\langle x, y \rangle = \frac{1}{4}\sum_{k=0}^3 i^k \|x + i^k y\|^2$

**定理 73.3**（Jordan-von Neumann 定理）：赋范空间 $(X, \|\cdot\|)$ 的范数由内积诱导当且仅当范数满足平行四边形法则。此时内积可由极化恒等式恢复。

**例 73.1**（Hilbert 空间举例）：
- $\mathbb{R}^n$ 和 $\mathbb{C}^n$ 配以标准内积
- $\ell^2$：$\langle (x_n), (y_n) \rangle = \sum_{n=1}^\infty x_n \overline{y_n}$
- $L^2(\Omega)$：$\langle f, g \rangle = \int_\Omega f \overline{g} d\mu$
- $\ell^p$ 对 $p \neq 2$ 是 Banach 空间但不是 Hilbert 空间（不满足平行四边形法则）

### 73.2 正交性

**定义 73.2**（正交）：$x, y \in H$ 称为**正交的**，记作 $x \perp y$，如果 $\langle x, y \rangle = 0$。子集 $A \subseteq H$ 的**正交补**为 $A^\perp = \{x \in H : \langle x, a \rangle = 0, \; \forall a \in A\}$。

**命题 73.4**（勾股定理）：若 $x \perp y$，则 $\|x + y\|^2 = \|x\|^2 + \|y\|^2$。

**定理 73.5**（正交投影定理）：设 $C \subseteq H$ 是非空闭凸集。则对每个 $x \in H$，存在唯一的 $y \in C$ 使得 $\|x - y\| = \operatorname{dist}(x, C) = \inf_{z \in C} \|x - z\|$。$y$ 称为 $x$ 到 $C$ 的**最佳逼近**。

特别地，若 $M \subseteq H$ 是闭子空间，则 $H = M \oplus M^\perp$，且 $M^{\perp\perp} = M$。

*证明*：存在性：取极小化序列 $(y_n) \subseteq C$ 使 $\|x - y_n\| \to d = \operatorname{dist}(x, C)$。由平行四边形法则：

$$\|y_n - y_m\|^2 = 2\|y_n - x\|^2 + 2\|y_m - x\|^2 - \|y_n + y_m - 2x\|^2$$

由 $C$ 凸，$(y_n + y_m)/2 \in C$，故 $\|y_n + y_m - 2x\|^2 \geq 4d^2$。当 $n, m \to \infty$ 时，$\|y_n - y_m\| \to 0$，$(y_n)$ 是 Cauchy 序列，由完备性收敛到某 $y$，由 $C$ 闭知 $y \in C$。

唯一性：若 $y, y'$ 都是最佳逼近，由平行四边形法则得 $\|y - y'\|^2 \leq 4d^2 - 4d^2 = 0$。

子空间情形：$M^\perp$ 是闭子空间。对 $x \in H$，取 $Px$ 为 $x$ 到 $M$ 的投影，则 $x - Px \in M^\perp$，故 $x = Px + (x - Px) \in M + M^\perp$。若 $x \in M \cap M^\perp$，则 $\langle x, x \rangle = 0$，故 $x = 0$。∎

### 73.3 Riesz 表示定理与正交基

**定理 73.6**（Riesz 表示定理）：设 $H$ 是 Hilbert 空间。对每个连续线性泛函 $f \in H^*$，存在唯一的 $y \in H$ 使得

$$f(x) = \langle x, y \rangle, \quad \forall x \in H$$

且 $\|f\| = \|y\|$。映射 $y \mapsto \langle \cdot, y \rangle$ 是 $H$ 到 $H^*$ 的共轭线性等距同构（实情形为线性）。

*证明*：若 $f = 0$，取 $y = 0$。否则，$\ker f$ 是 $H$ 的真闭子空间。取 $z \in (\ker f)^\perp$ 且 $\|z\| = 1$。对任意 $x \in H$，$x - f(x)z/f(z) \in \ker f$，故 $\langle x - f(x)z/f(z), z \rangle = 0$，即 $f(x) = \langle x, \overline{f(z)}z \rangle$。取 $y = \overline{f(z)}z$。唯一性：若 $\langle x, y_1 \rangle = \langle x, y_2 \rangle$ 对所有 $x$，则 $\langle x, y_1 - y_2 \rangle = 0$，取 $x = y_1 - y_2$ 得 $y_1 = y_2$。∎

**定义 73.3**（正交规范集）：$H$ 的子集 $\{e_\alpha\}_{\alpha \in A}$ 称为**正交规范的**，如果 $\langle e_\alpha, e_\beta \rangle = \delta_{\alpha\beta}$。

**定义 73.4**（正交规范基）：正交规范集 $\{e_\alpha\}$ 称为 $H$ 的**正交规范基**（或 Hilbert 基），如果 $\overline{\operatorname{span}}\{e_\alpha\} = H$（即其线性张成稠密）。

**定理 73.7**（正交规范基的存在性）：每个非零 Hilbert 空间都有正交规范基。任意两个正交规范基具有相同的基数，称为 $H$ 的 **Hilbert 维数**。

*证明*：Zorn 引理：所有正交规范集按包含关系构成偏序集，极大元即为正交规范基。∎

**定理 73.8**（Parseval 恒等式与 Fourier 展开）：设 $\{e_\alpha\}_{\alpha \in A}$ 是 $H$ 的正交规范基。则对任意 $x \in H$：

1. **Bessel 不等式**：$\sum_{\alpha} |\langle x, e_\alpha \rangle|^2 \leq \|x\|^2$（事实上只有可数个系数非零）
2. **Fourier 展开**：$x = \sum_{\alpha} \langle x, e_\alpha \rangle e_\alpha$（在 $H$ 的范数下收敛）
3. **Parseval 恒等式**：$\|x\|^2 = \sum_{\alpha} |\langle x, e_\alpha \rangle|^2$

*证明*：对任意有限子集 $F \subseteq A$，$\|x - \sum_{\alpha \in F} \langle x, e_\alpha \rangle e_\alpha\|^2 = \|x\|^2 - \sum_{\alpha \in F} |\langle x, e_\alpha \rangle|^2 \geq 0$，故 Bessel 不等式成立。由此知可数个系数非零。由完备性和极大性，$\|x - \sum_{n=1}^N \langle x, e_n \rangle e_n\| \to 0$。∎

**定理 73.9**（可分 Hilbert 空间的分类）：每个无穷维可分 Hilbert 空间等距同构于 $\ell^2$（配以标准正交基 $\{e_n\}$）。

### 73.4 伴随算子

**定义 73.5**（伴随算子）：设 $H_1, H_2$ 为 Hilbert 空间，$T \in \mathcal{B}(H_1, H_2)$。$T$ 的**伴随算子** $T^* \in \mathcal{B}(H_2, H_1)$ 由下式唯一确定：

$$\langle Tx, y \rangle_{H_2} = \langle x, T^* y \rangle_{H_1}, \quad \forall x \in H_1, y \in H_2$$

$T^*$ 的存在唯一性由 Riesz 表示定理保证：对固定 $y$，$x \mapsto \langle Tx, y \rangle$ 是连续线性泛函，由 Riesz 表示存在唯一 $T^*y$。

**定义 73.6**（自伴算子、正规算子、酉算子）：设 $T \in \mathcal{B}(H)$。
- $T$ 称为**自伴的**（或 Hermitian），如果 $T^* = T$。
- $T$ 称为**正规的**，如果 $T^*T = TT^*$。
- $T$ 称为**酉算子**，如果 $T^*T = TT^* = I$（即 $T$ 是等距满射）。

**命题 73.10**（伴随算子的性质）：
1. $(T^*)^* = T$，$\|T^*\| = \|T\|$，$\|T^*T\| = \|T\|^2$（C*-等式）
2. $(S+T)^* = S^* + T^*$，$(\alpha T)^* = \overline{\alpha} T^*$，$(ST)^* = T^* S^*$
3. $\ker T^* = (\operatorname{im} T)^\perp$，$\overline{\operatorname{im} T^*} = (\ker T)^\perp$

---

---

## 第74章：对偶空间与弱拓扑
本章研究 Banach 空间的对偶空间、二次对偶和弱拓扑，这些是研究无穷维空间紧致性的关键工具。

### 74.1 对偶空间与二次对偶

**定义 74.1**（对偶空间）：$X^* = \mathcal{B}(X, \mathbb{K})$ 是 Banach 空间（即使 $X$ 不完备），配以范数 $\|f\| = \sup_{\|x\| \leq 1} |f(x)|$。

**定义 74.2**（二次对偶与自然嵌入）：$X^{**} = (X^*)^*$ 是 $X$ 的**二次对偶**。自然嵌入 $J: X \to X^{**}$ 定义为 $J(x)(f) = f(x)$（$f \in X^*$）。由 Hahn-Banach 推论，$\|J(x)\| = \|x\|$，故 $J$ 是等距嵌入。

**例 74.1**（对偶空间的例子）：
- $(\ell^p)^* \cong \ell^q$，其中 $1/p + 1/q = 1$，$1 < p < \infty$（$q = \infty$ 当 $p = 1$）
- $(L^p(\Omega))^* \cong L^q(\Omega)$（$1 < p < \infty$）
- $(c_0)^* \cong \ell^1$，$(\ell^1)^* \cong \ell^\infty$
- $C([a, b])^* \cong \mathcal{M}([a, b])$（Riesz 表示定理——测度版本）

**定义 74.3**（自反空间）：Banach 空间 $X$ 称为**自反的**，如果自然嵌入 $J: X \to X^{**}$ 是满射（从而是等距同构）。

**命题 74.1**：自反空间的闭子空间是自反的。$X$ 自反当且仅当 $X^*$ 自反。

**例 74.2**：$\ell^p$ 和 $L^p$ 对 $1 < p < \infty$ 是自反的。$\ell^1$、$\ell^\infty$、$L^1$、$L^\infty$、$c_0$、$C([a, b])$ 都不是自反的。

### 74.2 弱拓扑与弱* 拓扑

在无穷维 Banach 空间中，有界闭集不一定紧致（例如单位球面不是紧致的）。弱拓扑和弱* 拓扑提供了更粗的拓扑，使得某些集合变得紧致。

**定义 74.4**（弱拓扑）：$X$ 上的**弱拓扑** $\sigma(X, X^*)$ 是使所有 $f \in X^*$ 连续的最弱拓扑。其子基为 $\{f^{-1}(U) : f \in X^*, U \subseteq \mathbb{K} \text{ 开}\}$。

网 $(x_\alpha)$ 弱收敛到 $x$（记作 $x_\alpha \rightharpoonup x$）当且仅当 $f(x_\alpha) \to f(x)$ 对所有 $f \in X^*$ 成立。

**定义 74.5**（弱* 拓扑）：$X^*$ 上的**弱* 拓扑** $\sigma(X^*, X)$ 是使所有 $J(x)$（$x \in X$）连续的最弱拓扑。即 $f_\alpha \xrightarrow{w^*} f$ 当且仅当 $f_\alpha(x) \to f(x)$ 对所有 $x \in X$。

**命题 74.2**：弱拓扑和弱* 拓扑是 Hausdorff 拓扑。若 $X$ 自反，则 $\sigma(X^*, X) = \sigma(X^*, X^{**})$，即弱* 拓扑与弱拓扑一致。

**定理 74.3**（Banach-Alaoglu 定理）：$X^*$ 中的闭单位球 $B_{X^*} = \{f \in X^* : \|f\| \leq 1\}$ 在弱* 拓扑下是紧致的。

*证明*：考虑映射 $\Phi: B_{X^*} \to \prod_{x \in X} [-\|x\|, \|x\|]$，$\Phi(f) = (f(x))_{x \in X}$。$\Phi$ 是单射且是到其像的同胚（$B_{X^*}$ 赋予弱* 拓扑，乘积空间赋予积拓扑）。由 Tychonoff 定理，乘积空间紧致。$\Phi(B_{X^*})$ 作为闭子集是紧致的。∎

**定理 74.4**（Goldstine 定理）：$J(B_X)$ 在 $B_{X^{**}}$ 中弱* 稠密。即单位球的像在二次对偶的单位球中稠密。

**推论 74.5**：$X$ 自反当且仅当 $B_X$ 在弱拓扑下紧致。

*证明*：若 $X$ 自反，$J(B_X) = B_{X^{**}}$，由 Banach-Alaoglu 定理在弱* 拓扑下紧致，而 $X$ 自反时弱* 拓扑等于弱拓扑。反之，若 $B_X$ 弱紧致，则 $J(B_X)$ 弱* 紧致从而弱* 闭，由 Goldstine 定理得 $J(B_X) = B_{X^{**}}$。∎

### 74.3 凸集的分离与 Krein-Milman 定理

**定理 74.6**（凸集分离定理 / Hahn-Banach 定理的几何形式）：设 $A, B$ 是 Banach 空间的非空不交凸集，$A$ 是开集。则存在 $f \in X^*$ 和 $\alpha \in \mathbb{R}$ 使得 $\Re f(a) < \alpha \leq \Re f(b)$ 对所有 $a \in A, b \in B$。

**定理 74.7**（Mazur 定理）：设 $x_n \rightharpoonup x$（弱收敛）。则存在凸组合序列 $\sum_{k=1}^{N_n} \lambda_k^{(n)} x_k$（$\lambda_k^{(n)} \geq 0, \sum \lambda_k^{(n)} = 1$）强收敛到 $x$。

*证明*：$x$ 属于 $\{x_n\}$ 的弱闭包的凸包。由凸集的弱闭等于强闭，$x$ 属于强闭凸包，故存在凸组合序列强收敛。∎

**定义 74.6**（极点）：设 $K$ 是向量空间的凸集。$x \in K$ 称为 $K$ 的**极点**（extreme point），如果 $x$ 不能表示为 $K$ 中两个不同点的严格凸组合，即若 $x = ty + (1-t)z$（$t \in (0, 1), y, z \in K$），则 $y = z = x$。$K$ 的极点集记作 $\operatorname{ext}(K)$。

**定理 74.8**（Krein-Milman 定理）：设 $K$ 是局部凸空间中的非空紧致凸集。则 $K = \overline{\operatorname{conv}}(\operatorname{ext}(K))$，即 $K$ 是其极点的闭凸包。

*说明*：此定理及其在 Banach-Alaoglu 定理的应用（$B_{X^*}$ 是弱* 紧致凸集）是泛函分析中许多存在性证明的基础。

---

---

## 第75章：紧算子与谱理论
紧算子是有限维线性算子到无穷维的最自然推广，其谱理论具有特别简洁优美的结构。

### 75.1 紧算子

**定义 75.1**（紧算子）：设 $X, Y$ 是 Banach 空间。线性算子 $T: X \to Y$ 称为**紧算子**（或全连续算子），如果 $T(B_X)$（单位球的像）在 $Y$ 中是相对紧致的（即其闭包是紧致的）。所有紧算子构成的集合记作 $\mathcal{K}(X, Y)$。

**命题 75.1**（紧算子的等价刻画）：$T$ 紧当且仅当对 $X$ 中任意有界序列 $(x_n)$，$(Tx_n)$ 有收敛子列。

**命题 75.2**（紧算子的基本性质）：
1. 紧算子是有限秩算子的极限（在算子范数下）：$\mathcal{K}(X, Y) = \overline{\mathcal{F}(X, Y)}$，其中 $\mathcal{F}(X, Y)$ 是有限秩算子（像有限维）。
2. $\mathcal{K}(X)$（$X$ 到自身的紧算子）是 $\mathcal{B}(X)$ 的闭双边理想。
3. 若 $T \in \mathcal{K}(X)$ 且 $S \in \mathcal{B}(X)$，则 $TS$ 和 $ST$ 是紧算子。
4. 紧算子的伴随是紧算子。

**定义 75.2**（Fredholm 算子）：$T \in \mathcal{B}(X, Y)$ 称为 **Fredholm 算子**，如果 $\dim \ker T < \infty$ 且 $\dim \operatorname{coker} T = \dim(Y / \operatorname{im} T) < \infty$。此时 $T$ 的**指标**定义为 $\operatorname{ind}(T) = \dim \ker T - \dim \operatorname{coker} T$。

**定理 75.3**（Fredholm 择一 / Riesz-Schauder 理论）：设 $X$ 是 Banach 空间，$T \in \mathcal{K}(X)$。则：

1. $I - T$ 是 Fredholm 算子，且 $\operatorname{ind}(I - T) = 0$。
2. $\dim \ker(I - T) = \dim \ker(I - T^*)$。
3. 方程 $(I - T)x = y$ 有解当且仅当 $y \perp \ker(I - T^*)$（即 $y$ 与 $(I - T^*)$ 的核中所有泛函正交）。
4. $(I - T)$ 是单射当且仅当 $(I - T)$ 是满射。

*证明思路*：利用 Riesz 引理证明 $I - T$ 的像是闭的，且核为有限维。详细证明需构造 $\ker(I - T)^n$ 的升链。∎

### 75.2 谱理论初步

**定义 75.3**（谱与预解集）：设 $X$ 是复 Banach 空间，$T \in \mathcal{B}(X)$。
- $T$ 的**预解集** $\rho(T) = \{\lambda \in \mathbb{C} : \lambda I - T \text{ 是双射}\}$（此时由开映射定理，$(\lambda I - T)^{-1}$ 有界）。
- $T$ 的**谱** $\sigma(T) = \mathbb{C} \setminus \rho(T)$。

谱可进一步分为：
- **点谱** $\sigma_p(T)$：$\lambda I - T$ 不是单射（即 $\lambda$ 是特征值）
- **连续谱** $\sigma_c(T)$：$\lambda I - T$ 是单射但不满射，且像稠密
- **剩余谱** $\sigma_r(T)$：$\lambda I - T$ 是单射但不满射，且像不稠密

**定理 75.4**（谱的基本性质）：
1. $\sigma(T)$ 是 $\mathbb{C}$ 中的非空紧致集。
2. $\sigma(T) \subseteq \{\lambda \in \mathbb{C} : |\lambda| \leq \|T\|\}$。
3. **谱半径公式**：$r(T) = \lim_{n \to \infty} \|T^n\|^{1/n} = \sup_{\lambda \in \sigma(T)} |\lambda|$。

*证明*(非空性)：(1) 预解函数 $R(\lambda) = (\lambda I - T)^{-1}$ 在 $\rho(T)$ 上解析。若 $\sigma(T) = \emptyset$，则 $R(\lambda)$ 是整函数且有界（当 $|\lambda| \to \infty$ 时 $R(\lambda) \to 0$），由 Liouville 定理 $R(\lambda) \equiv 0$，矛盾。∎

**定理 75.5**（紧算子的谱定理 / Riesz-Schauder 定理）：设 $T \in \mathcal{K}(X)$（$X$ 是无穷维复 Banach 空间）。则：

1. $\sigma(T) \setminus \{0\}$ 仅由特征值构成（即 $0$ 是谱中唯一可能的非特征值点）。
2. $\sigma(T) \setminus \{0\}$ 是有限集或以 $0$ 为唯一聚点。
3. 每个非零特征值 $\lambda$ 的几何重数 $\dim \ker(\lambda I - T)$ 有限。

### 75.3 Hilbert 空间上的自伴紧算子

**定理 75.6**（自伴紧算子的谱定理）：设 $H$ 是 Hilbert 空间，$T \in \mathcal{K}(H)$ 是自伴紧算子。则存在 $H$ 的正交规范基 $\{e_n\}$ 和实数 $\lambda_n \to 0$ 使得

$$Tx = \sum_{n} \lambda_n \langle x, e_n \rangle e_n$$

即 $T$ 可以对角化，其特征向量构成正交规范基。

*证明*：首先证明 $\|T\|$ 或 $-\|T\|$ 是 $T$ 的特征值。取单位向量序列 $(x_n)$ 使 $|\langle Tx_n, x_n \rangle| \to \|T\|$（由自伴性，$\|T\| = \sup_{\|x\|=1} |\langle Tx, x \rangle|$）。由紧性，$(Tx_n)$ 有收敛子列，可得特征向量 $e_1$ 使 $Te_1 = \lambda_1 e_1$，$|\lambda_1| = \|T\|$。

然后考虑 $H_1 = \{e_1\}^\perp$。$T$ 限制在 $H_1$ 上仍是自伴紧算子。归纳构造正交特征向量列 $\{e_n\}$ 和特征值 $\lambda_n$，$|\lambda_{n+1}| \leq |\lambda_n|$。由紧性，$\lambda_n \to 0$。

最后证明 $\{e_n\}$ 是基：若 $x \perp e_n$ 对所有 $n$，则 $Tx = 0$。同时 $T$ 在 $\{e_n\}^\perp$ 上为零。故任意 $x$ 可展开为 $\sum \langle x, e_n \rangle e_n + (x - \sum \langle x, e_n \rangle e_n)$，后者在 $\ker T$ 中。∎

**推论 75.7**（Hilbert-Schmidt 展开定理）：设 $T$ 是紧自伴算子。则对任意 $x \in H$，

$$Tx = \sum_n \lambda_n \langle x, e_n \rangle e_n$$

其中 $\lambda_n$ 是 $T$ 的非零特征值（按绝对值递减，重复按重数），$\{e_n\}$ 是相应的正交规范特征向量。

**定理 75.8**（极小-极大原理 / Courant-Fischer 定理）：设 $T$ 是紧自伴算子，$\lambda_1^+ \geq \lambda_2^+ \geq \cdots > 0$ 是其正特征值。则

$$\lambda_n^+ = \min_{\dim V = n-1} \max_{\substack{x \perp V \\ \|x\| = 1}} \langle Tx, x \rangle = \max_{\dim W = n} \min_{\substack{x \in W \\ \|x\| = 1}} \langle Tx, x \rangle$$

**定理 75.9**（泛函演算 / 连续函数演算）：设 $T$ 是 Hilbert 空间上的自伴算子（不一定紧），$\sigma(T) \subseteq [m, M]$。则存在唯一的同态 $\Phi: C([m, M]) \to \mathcal{B}(H)$ 使得 $\Phi(1) = I$，$\Phi(\operatorname{id}) = T$，且 $\Phi$ 是等距的（$\|\Phi(f)\| = \|f\|_\infty$）。$\Phi(f)$ 记作 $f(T)$。

*证明思路*：对多项式 $p$，定义 $p(T)$ 自然。对连续函数 $f$，由 Weierstrass 逼近定理用多项式逼近，再由 $\|p(T)\| = \sup_{\lambda \in \sigma(T)} |p(\lambda)|$ 保证延拓的良定义。∎

---

---

## 第76章：C*-代数初步
C*-代数是 Hilbert 空间上有界算子构成的、在伴随和范数拓扑下封闭的代数，是量子力学和非交换几何的数学语言。

### 76.1 Banach 代数与 C*-代数

**定义 76.1**（Banach 代数）：$\mathbb{C}$ 上的一个 **Banach 代数**是一个结合 $\mathbb{C}$-代数 $\mathcal{A}$ 配以范数 $\|\cdot\|$，使得 $(\mathcal{A}, \|\cdot\|)$ 是 Banach 空间，且满足 $\|ab\| \leq \|a\| \|b\|$ 对所有 $a, b \in \mathcal{A}$。

若 $\mathcal{A}$ 有单位元 $1$ 且 $\|1\| = 1$，则称 $\mathcal{A}$ 为**有单位元的 Banach 代数**。

**定义 76.2**（对合）：$\mathcal{A}$ 上的一个**对合**是一个映射 $*: \mathcal{A} \to \mathcal{A}$，$a \mapsto a^*$，满足：
1. $(a^*)^* = a$
2. $(a + b)^* = a^* + b^*$
3. $(\lambda a)^* = \overline{\lambda} a^*$
4. $(ab)^* = b^* a^*$

**定义 76.3**（C*-代数）：一个 **C*-代数**是一个带有对合的 Banach 代数 $\mathcal{A}$，满足 **C*-等式**：

$$\|a^* a\| = \|a\|^2, \quad \forall a \in \mathcal{A}$$

**例 76.1**（C*-代数举例）：
- $\mathcal{B}(H)$（$H$ 为 Hilbert 空间），对合为伴随算子。C*-等式已由命题 73.10 给出。
- $\mathcal{K}(H)$（紧算子）是 $\mathcal{B}(H)$ 的 C*-子代数（闭 *-子代数）。
- $C(X)$（紧致 Hausdorff 空间 $X$ 上的连续函数），对合为复共轭 $f^*(x) = \overline{f(x)}$，范数为 $\|f\|_\infty$。这是交换 C*-代数的原型。
- $C_0(X)$（局部紧致 Hausdorff 空间上在无穷远处消失的连续函数）。
- $M_n(\mathbb{C})$（$n \times n$ 复矩阵），对合为共轭转置。

### 76.2 交换 C*-代数与 Gelfand 变换

**定理 76.1**（Gelfand-Mazur 定理）：若 $\mathcal{A}$ 是有单位元的 Banach 代数，且每个非零元都可逆（即为除环），则 $\mathcal{A} \cong \mathbb{C}$。

*证明*：对 $a \in \mathcal{A}$，$\sigma(a) \neq \emptyset$（谱非空）。取 $\lambda \in \sigma(a)$，则 $a - \lambda 1$ 不可逆，故 $a - \lambda 1 = 0$，即 $a = \lambda 1$。∎

**定义 76.4**（特征与 Gelfand 谱）：设 $\mathcal{A}$ 是交换 Banach 代数。$\mathcal{A}$ 上的一个**特征**是一个非零代数同态 $h: \mathcal{A} \to \mathbb{C}$。所有特征构成的集合 $\Omega(\mathcal{A})$ 称为 $\mathcal{A}$ 的 **Gelfand 谱**（或极大理想空间）。

**命题 76.1**：对交换 Banach 代数 $\mathcal{A}$，存在自然双射：

$$\Omega(\mathcal{A}) \longleftrightarrow \{\text{极大理想 } \mathfrak{m} \subseteq \mathcal{A}\}$$

$h \mapsto \ker h$。每个特征自动连续且 $\|h\| = 1$（若 $\mathcal{A}$ 有单位元）。

**定义 76.5**（Gelfand 变换）：对 $a \in \mathcal{A}$，定义 $\hat{a}: \Omega(\mathcal{A}) \to \mathbb{C}$ 为 $\hat{a}(h) = h(a)$。映射 $a \mapsto \hat{a}$ 称为 **Gelfand 变换**，记作 $\Gamma: \mathcal{A} \to C(\Omega(\mathcal{A}))$。

$\Omega(\mathcal{A})$ 赋予弱* 拓扑（作为 $\mathcal{A}^*$ 的子空间），它是紧致 Hausdorff 空间（若 $\mathcal{A}$ 有单位元；否则为局部紧致）。Gelfand 变换是代数同态。

**定理 76.2**（Gelfand-Naimark 定理，交换版本）：设 $\mathcal{A}$ 是交换 C*-代数（有单位元）。则 Gelfand 变换 $\Gamma: \mathcal{A} \to C(\Omega(\mathcal{A}))$ 是等距 *-同构。即

$$\|\hat{a}\|_\infty = \|a\|, \quad \widehat{a^*} = \overline{\hat{a}}, \quad \Gamma(\mathcal{A}) = C(\Omega(\mathcal{A}))$$

*证明思路*：对 $a \in \mathcal{A}$，$\|\hat{a}\|_\infty = \sup_{h \in \Omega} |h(a)| = r(a)$（谱半径）。在 C*-代数中，若 $a$ 是自伴的（$a = a^*$），则 $\|a^2\| = \|a\|^2$，归纳得 $\|a^{2^n}\| = \|a\|^{2^n}$，故 $r(a) = \lim \|a^n\|^{1/n} = \|a\|$。对一般 $a$，$\|a\|^2 = \|a^*a\| = r(a^*a) = \|\widehat{a^*a}\|_\infty = \|\overline{\hat{a}}\hat{a}\|_\infty = \|\hat{a}\|_\infty^2$。

满射性由 Stone-Weierstrass 定理：$\Gamma(\mathcal{A})$ 是 $C(\Omega)$ 的闭 *-子代数，分离点且包含常值函数，故等于 $C(\Omega)$。∎

**推论 76.3**：交换 C*-代数（有单位元）范畴对偶于紧致 Hausdorff 空间范畴。这是 Gelfand-Naimark 对偶。

### 76.3 一般 C*-代数的表示

**定理 76.4**（Gelfand-Naimark-Segal 构造 / GNS 构造）：设 $\mathcal{A}$ 是 C*-代数，$\varphi$ 是 $\mathcal{A}$ 上的**正线性泛函**（即 $\varphi(a^*a) \geq 0$ 对所有 $a$）。则存在 Hilbert 空间 $H_\varphi$、$*$-同态 $\pi_\varphi: \mathcal{A} \to \mathcal{B}(H_\varphi)$ 和循环向量 $\xi_\varphi \in H_\varphi$ 使得

$$\varphi(a) = \langle \pi_\varphi(a) \xi_\varphi, \xi_\varphi \rangle, \quad \forall a \in \mathcal{A}$$

*证明构造*：在 $\mathcal{A}$ 上定义内积 $\langle a, b \rangle_\varphi = \varphi(b^* a)$。这是半正定的。令 $N_\varphi = \{a \in \mathcal{A} : \varphi(a^*a) = 0\}$，则 $N_\varphi$ 是左理想。$H_\varphi$ 是 $\mathcal{A}/N_\varphi$ 在该内积下的完备化。$\pi_\varphi(a)(b + N_\varphi) = ab + N_\varphi$。$\xi_\varphi = 1 + N_\varphi$。∎

**定理 76.5**（Gelfand-Naimark 定理，非交换版本）：每个 C*-代数 $\mathcal{A}$ 等距 *-同构于某个 Hilbert 空间 $\mathcal{B}(H)$ 的 C*-子代数。

*证明*：取所有正线性泛函对应的 GNS 表示 $\{\pi_\varphi\}$ 的直和，得到忠实表示（即 $\pi$ 是单射）。由 C*-代数中单射 *-同态自动等距，即得。∎

### 76.4 正元与序结构

**定义 76.6**（正元）：C*-代数 $\mathcal{A}$ 中的元素 $a$ 称为**正的**（记作 $a \geq 0$），如果 $a = a^*$ 且 $\sigma(a) \subseteq [0, \infty)$。所有正元构成的集合记作 $\mathcal{A}^+$。

**命题 76.2**：$a \geq 0$ 当且仅当存在 $b \in \mathcal{A}$ 使得 $a = b^*b$。$\mathcal{A}^+$ 是 $\mathcal{A}$ 中的闭凸锥且 $\mathcal{A}^+ \cap (-\mathcal{A}^+) = \{0\}$。

**定义 76.7**（态）：C*-代数 $\mathcal{A}$ 上的一个**态**是一个正线性泛函 $\varphi$ 满足 $\|\varphi\| = 1$（若 $\mathcal{A}$ 有单位元，等价于 $\varphi(1) = 1$）。所有态构成的集合 $\mathcal{S}(\mathcal{A})$ 是 $\mathcal{A}^*$ 中弱* 紧致的凸集。

**定理 76.6**（Krein-Milman 定理在态空间中的应用）：$\mathcal{S}(\mathcal{A})$ 的极点称为**纯态**。GNS 构造中，纯态对应不可约表示。

### 76.5 量子力学诠释

C*-代数为量子力学提供了严格的数学框架：
- 物理系统的**可观测量**对应 C*-代数中的自伴元。
- 系统的**态**对应 C*-代数上的态（正线性泛函）。
- 对态 $\varphi$ 和可观测量 $a = a^*$，$\varphi(a)$ 是测量 $a$ 的期望值。
- 交换 C*-代数对应经典力学（可观测量可同时测量），非交换 C*-代数对应量子力学（存在不确定性原理）。

---

---

## 第77章：有序线性空间（Ordered Vector Spaces）
有序线性空间是泛函分析中处理不等式、正性和序结构的框架。定义：实向量空间 $V$ 配以凸锥 $V_+ \subset V$（正锥）满足 $V_+ \cap (-V_+) = \{0\}$，诱导偏序 $x \leq y \iff y - x \in V_+$。**Riesz 空间**（向量格）：若 $V$ 配以上述偏序后每对有上确界（和下确界），则 $V$ 为 Riesz 空间——算子理论的序基础。**核心定理**：（1）Krein-Rutman 定理——Banach 格上的紧正算子有正特征值及对应的正特征向量（Perron-Frobenius 定理的无穷维推广），在 PDE 和 Markov 过程的基本解估计中至关重要；（2）有序线性空间上的正线性泛函扩张定理（Krein 延拓定理）；（3）Banach 格是等距序同构于某个 $L^p(\mu)$ 空间的 $L^p$-空间理论。在数理经济学和优化理论中，有序线性空间为一般均衡理论和凸对偶理论提供了基础框架。

**定义 77.1**（Riesz 空间 / 向量格）：实向量空间 $V$ 配以偏序 $\leq$ 满足：（1）$x \leq y \implies x+z \leq y+z$；（2）$x \geq 0 \implies \alpha x \geq 0$（$\forall \alpha \geq 0$）；（3）任意两个元 $x, y$ 有上确界 $x \vee y$ 和下确界 $x \wedge y$。称 $(V, \leq)$ 为 **Riesz 空间** 或向量格。Banach 空间兼为 Riesz 空间且满足 $\|x\| \leq \|y\|$ 当 $|x| \leq |y|$（其中 $|x| = x \vee (-x)$）时称为 **Banach 格**。

**定理 77.1**（Krein-Rutman 定理）：设 $X$ 为 Banach 格，$T: X \to X$ 为紧正算子且谱半径 $r(T) > 0$。则 $r(T)$ 是 $T$ 的特征值，对应特征向量可在 $X_+$（正锥）中选取。*证明思路*：利用 Krein-Milman 定理和 Banach-Alaoglu 定理证明 $T$ 限制在正锥上的 Pringsheim 型序列收敛到特征向量。该定理是正矩阵 Perron-Frobenius 定理在无穷维情形的推广。

---

## 第78章：插值空间（Interpolation Spaces）
插值空间理论（Aronszajn-Gagliardo, 1960年代；Peetre, Lions）在 Banach 空间对之间构造中间空间，调和分析中精细的 Sobolev 嵌入和算子有界性证明依赖于此。**核心方法**：（1）**实插值（$K$-方法）**——设 $(X_0, X_1)$ 为相容 Banach 空间对，对 $x \in X_0 + X_1$ 定义 $K(t, x) = \inf\{\|x_0\|_{X_0} + t\|x_1\|_{X_1} : x = x_0 + x_1\}$，则 $(X_0, X_1)_{\theta,q}$ 由 $\|x\| = \left(\int_0^\infty (t^{-\theta} K(t,x))^q \frac{dt}{t}\right)^{1/q}$ 定义；（2）**复插值（Calderón 方法）**——利用解析函数在全纯带状区域边值的范数插值。**应用**：（1）Riesz-Thorin 定理的抽象化——算子 $T: X_0 \to Y_0$ 和 $T: X_1 \to Y_1$ 有界，则在插值空间上也有界；（2）Marcinkiewicz 插值定理——从弱 $L^p$ 到强 $L^p$ 的插值；（3）Sobolev 空间的分数阶推广（Besov 空间和 Triebel-Lizorkin 空间）。

**定义 78.1**（$K$-泛函与实插值空间）：设 $(X_0, X_1)$ 为相容 Banach 空间对（即两者连续嵌入同一 Hausdorff 拓扑向量空间）。对 $x \in X_0 + X_1$ 定义 **$K$-泛函** $K(t, x) = \inf\{\|x_0\|_{X_0} + t\|x_1\|_{X_1} : x = x_0 + x_1\}$（$t > 0$）。对 $0 < \theta < 1$ 和 $1 \leq q \leq \infty$，**实插值空间** $(X_0, X_1)_{\theta,q} = \{x \in X_0 + X_1 : \|x\|_{\theta,q} = (\int_0^\infty [t^{-\theta} K(t,x)]^q \frac{dt}{t})^{1/q} < \infty\}$。

**定理 78.1**（插值定理）：设 $T: X_0 + X_1 \to Y_0 + Y_1$ 为线性算子且 $T|_{X_j}: X_j \to Y_j$ 有界（$j = 0, 1$）。则对任意 $\theta \in (0,1)$ 和 $q \in [1, \infty]$，$T: (X_0, X_1)_{\theta,q} \to (Y_0, Y_1)_{\theta,q}$ 有界。*证明思路*：对 $x = x_0 + x_1$ 用分解估计 $K_Y(t, Tx) \leq \|T_0\| (K_X(\frac{\|T_1\|}{\|T_0\|} t, x))$，代入范数定义即得。该定理统一了 Riesz-Thorin 定理（复插值）和 Marcinkiewicz 插值定理（实插值）的抽象框架。

---

## 第79章：线性算子摄动理论（Operator Perturbation Theory）
线性算子摄动理论研究当算子受微小扰动后谱、预解式和不变子空间的变化，是量子力学（摄动展开）和数值分析的核心工具。**核心内容**：（1）**Kato-Rellich 定理**——若 $A$ 自伴，$B$ 对称且关于 $A$ 相对有界（$\|Bx\| \leq a\|x\| + b\|Ax\|$，$b < 1$），则 $A + B$ 自伴且保持 $A$ 的本质谱；（2）**预解式级数**——对充分小的 $\lambda$，$(A + \lambda B - z)^{-1} = R(z) \sum_{n=0}^{\infty} (-\lambda B R(z))^n$ 给出摄动展开；（3）**解析摄动理论（Kato-Rellich）**——孤立特征值作为摄动参数的解析函数（分支不分裂条件）；（4）**奇异摄动理论**——当"微小参数"乘在最高阶导数上时（如 $\epsilon u'' + u' + u = 0$），边界层现象要求匹配渐近展开（Prandtl 边界层理论的基础）；（5）**Fredholm 行列式和限界式**——用于迹类算子的谱摄动精确定量分析（如半经典分析框架）。在量子力学的 Rayleigh-Schrödinger 摄动展开、散射理论和 Birkhoff 标准形理论中有核心应用。

---

---

## 第80章：Banach 代数与调和分析
Banach 代数框架将泛函分析与调和分析统一起来。

**定义 80.1**（Banach 代数）：Banach 代数 $A$ 是 Banach 空间配以结合的乘法运算满足 $\|ab\| \leq \|a\| \|b\|$。

**定理 80.1**（Gelfand 变换）：设 $A$ 为交换 Banach 代数。Gelfand 谱空间 $\Phi_A$（$A$ 上所有非零乘性线性泛函的集合，配以弱-*拓扑）是局部紧 Hausdorff 空间。**Gelfand 变换** $\widehat{a}(\varphi) = \varphi(a)$ 是 $A \to C_0(\Phi_A)$ 的压缩同态。若 $A$ 含幺元，$\Phi_A$ 紧致。

**定理 80.2**（群代数 $L^1(G)$ 与乘性线性泛函）：设 $G$ 为局部紧交换群。则 $L^1(G)$（卷积代数）的 Gelfand 谱空间自然同胚于对偶群 $\widehat{G}$。Gelfand 变换退化为 Fourier 变换：$\widehat{f}(\chi) = \int_G f(g) \overline{\chi(g)} dg$。*证明思路*：$L^1(G)$ 的乘性线性泛函由积分与特征标的内积唯一给出——这是 Gelfand-Naimark 定理在群代数上的直接推论。由此建立了 Banach 代数的抽象谱理论与 LCA 群上调和分析的等价性。

该观点统一了经典 Fourier 分析（$G = \mathbb{R}$）、Fourier 级数（$G = \mathbb{T}$）和离散 Fourier 分析（$G = \mathbb{Z}$）：三者分别对应于 $L^1(\mathbb{R})$、$\ell^1(\mathbb{Z})$（卷积）和 $L^1(\mathbb{T})$ 的 Gelfand 变换。


---

---

## 第140章（补充）
> von Neumann 代数（$W^*$-代数）是算子代数的核心理论，由 John von Neumann 在 1929 年引入。本卷在 C*-代数（V14 泛函分析）和 Banach 代数（V31 上半部分）的基础上，建立 von Neumann 代数的基本理论：因子分类（I、II$_1$、II$_\infty$、III 型）、Tomita-Takesaki 模理论和 III 型因子的 Connes 分类。von Neumann 代数在量子场论和自由概率论中有深刻应用。

> **前置知识**：本卷核心为算子代数理论的基础构成，需先掌握V13（泛函分析）中的Banach代数、Hilbert空间和C*-代数等核心内容，以及V7（线性代数）中关于Hilbert空间的部分。

---

---

## 第213章：von Neumann 代数基础
von Neumann 代数由 John von Neumann 于 1929 年引入，最初称为"算子环"（rings of operators），是量子力学的数学基础的一部分。本章建立 von Neumann 代数的基础理论，包括定义、交换子定理和 von Neumann 双换位定理。

### 213.1 弱算子拓扑与 von Neumann 代数

**定义 213.1**（弱算子拓扑 / Weak Operator Topology, WOT）：$B(H)$ 上的**弱算子拓扑**是使所有形如 $T \mapsto \langle Tx, y \rangle$（$x, y \in H$）的泛函连续的最弱拓扑。具体地，网 $T_\alpha$ 弱收敛于 $T$（记作 $T_\alpha \xrightarrow{WOT} T$）当且仅当 $\langle T_\alpha x, y \rangle \to \langle Tx, y \rangle$ 对所有 $x, y \in H$。

**定义 213.2**（强算子拓扑 / Strong Operator Topology, SOT）：$B(H)$ 上的**强算子拓扑**是使所有形如 $T \mapsto \|Tx\|$（$x \in H$）的半范数连续的最弱拓扑。$T_\alpha \xrightarrow{SOT} T$ 当且仅当 $\|T_\alpha x - Tx\| \to 0$ 对所有 $x \in H$。

关系：范数拓扑 $\succ$ SOT $\succ$ WOT。$B(H)$ 的单位球在 WOT 下是紧致的（由 Banach-Alaoglu 定理）。

**定义 213.3**（换位 / Commutant）：设 $\mathcal{M} \subseteq B(H)$。$\mathcal{M}$ 的**换位**（commutant）为

$$\mathcal{M}' = \{T \in B(H) : TS = ST, \forall S \in \mathcal{M}\}$$

**命题 213.1**（换位的基本性质）：
1. $\mathcal{M}'$ 是含单位元的 SOT 闭代数
2. $\mathcal{M} \subseteq \mathcal{M}''$
3. $\mathcal{M}_1 \subseteq \mathcal{M}_2 \implies \mathcal{M}_2' \subseteq \mathcal{M}_1'$
4. $\mathcal{M}' = \mathcal{M}'''$（所以换位只能取奇数次）

**定义 213.4**（von Neumann 代数 / $W^*$-代数）：Hilbert 空间 $H$ 上的 \* -子代数 $\mathcal{M} \subseteq B(H)$ 称为 **von Neumann 代数**（或 $W^*$-代数），如果它满足以下等价条件之一：
1. $\mathcal{M} = \mathcal{M}''$（双换位定理）
2. $\mathcal{M}$ 在 SOT 下闭且含 $I$
3. $\mathcal{M}$ 在 WOT 下闭且含 $I$
4. $\mathcal{M}$ 是某个 C*-代数的 Banach 空间对偶（即作为 Banach 空间，存在唯一的预对偶 $\mathcal{M}_*$）

### 213.2 von Neumann 双换位定理

**定理 213.2**（von Neumann 双换位定理，1929）：设 $\mathcal{A} \subseteq B(H)$ 是含单位元的 \* -子代数。则 $\mathcal{A}$ 的 SOT 闭包 = $\mathcal{A}$ 的 WOT 闭包 = $\mathcal{A}''$。

*证明思路*：关键步骤是证明对任意 $T \in \mathcal{A}''$ 和任意有限个向量 $x_1, \ldots, x_n \in H$，存在 $A \in \mathcal{A}$ 使得 $\|(T-A)x_i\| < \varepsilon$。这通过考虑 $\mathcal{A}$ 在 $H^n$ 上的对角作用和 Kaplansky 稠密性定理来完成。∎

**推论 213.3**：含单位元的 \* -子代数 $\mathcal{A} \subseteq B(H)$ 是 von Neumann 代数当且仅当 $\mathcal{A} = \mathcal{A}''$。

### 213.3 预对偶

**定义 213.5**（von Neumann 代数的预对偶）：von Neumann 代数 $\mathcal{M}$ 作为 Banach 空间有唯一的预对偶 $\mathcal{M}_* \subseteq \mathcal{M}^*$：

$$\mathcal{M} \cong (\mathcal{M}_*)^*$$

**定理 213.4**（Sakai 定理，1962）：抽象 $W^*$-代数是作为 Banach 空间有预对偶的 C*-代数。任何 $W^*$-代数可表示为某个 Hilbert 空间上的 von Neumann 代数。

*证明概要*：$\mathcal{M}_*$ 由 $\mathcal{M}$ 上的所有正规（ultraweakly continuous 或 $\sigma$-weak continuous）线性泛函组成。$\mathcal{M}$ 上的 $\sigma$-弱拓扑由 $\mathcal{M}_*$ 诱导，使得 $(\mathcal{M}, \sigma\text{-weak})^* = \mathcal{M}_*$。

### 213.4 投影与分类

**定义 213.6**（von Neumann 代数中的投影）：$\mathcal{M}$ 中的**投影** $p$ 满足 $p = p^* = p^2$。投影在 von Neumann 代数理论中起核心作用。

**定义 213.7**（投影的等价关系）：投影 $p, q \in \mathcal{M}$ 称为
- **Murray-von Neumann 等价**（$p \sim q$）：存在部分等距 $v \in \mathcal{M}$ 使得 $v^*v = p$，$vv^* = q$
- $p \preceq q$：$p$ 等价于 $q$ 的子投影（即存在投影 $q_0 \leq q$ 使得 $p \sim q_0$）

**定理 213.5**（比较定理）：若 $\mathcal{M}$ 是因子（见定义 213.8），则对任意投影 $p, q \in \mathcal{M}$，必有 $p \preceq q$ 或 $q \preceq p$。

**定义 213.8**（因子 / Factor）：von Neumann 代数 $\mathcal{M}$ 称为**因子**，如果其中心是平凡的：$\mathcal{Z}(\mathcal{M}) = \mathcal{M} \cap \mathcal{M}' = \mathbb{C}I$。任何 von Neumann 代数可分解为因子的直积分（von Neumann 约化理论）。

---

---

## 第214章：因子的 Murray-von Neumann 分类
Murray 和 von Neumann（1936-1943）完成了因子的完整分类，依据是投影的维数函数的值域。这一分类是算子代数理论最辉煌的成就之一。

### 214.1 维数函数与迹

**定义 214.1**（维数函数）：设 $\mathcal{M}$ 是因子。定义映射 $D: \operatorname{Proj}(\mathcal{M}) \to [0, \infty]$ 满足：
- $D(p) = D(q) \iff p \sim q$
- $D(p+q) = D(p) + D(q)$（若 $p \perp q$）
- $D(0) = 0$

$D(p)$ 可视为投影 $p$ 的"相对维数"。$D$ 的存在性和值域决定了因子的类型。

**定义 214.2**（有限/无限/半有限投影）：
- 投影 $p$ 是**有限**的：若 $p \sim q \leq p \implies q = p$（即不存在真子投影等价于自身）
- 投影 $p$ 是**无限**的：若 $p \sim q < p$（存在真子投影等价于自身）
- 投影 $p$ 是**纯无限**的：$p$ 不含非零有限子投影
- 投影 $p$ 是**半有限**的：$p$ 不含非零有限子投影？不——半有限指 $p$ 可写为相互正交的有限投影的和

### 214.2 因子类型

**定义 214.3**（因子的 Murray-von Neumann 分类）：
- **I 型**：含极小投影的因子。$I_n$：$D$ 的值域 = $\{0, 1, 2, \ldots, n\}$（$n = 1, 2, \ldots, \infty$）
  - $I_1$：$B(H)$ 上无其他因子的情况（$\dim H = 1$）
  - $I_n$：$B(H) \cong M_n(\mathbb{C})$（$\dim H = n$）
  - $I_\infty$：$B(H)$ 且 $\dim H = \infty$
- **II 型**：无极小投影但含非零有限投影的因子
  - **II$_1$ 型**：$I$ 本身是有限投影（即 $D(I) < \infty$）。值域 $D(\operatorname{Proj}(\mathcal{M})) = [0, 1]$
  - **II$_\infty$ 型**：$I$ 是纯无限投影但含有限投影。值域 = $[0, \infty]$
- **III 型**：所有非零投影都是无限投影的因子。值域 = $\{0, \infty\}$

**定理 214.1**（II$_1$ 型因子的迹）：在 II$_1$ 型因子 $\mathcal{M}$ 上存在唯一的忠实正规迹 $\tau: \mathcal{M} \to \mathbb{C}$ 满足：
- $\tau(xy) = \tau(yx)$
- $\tau(x^*x) \geq 0$（正性）
- $\tau(I) = 1$（归一化）
- $\tau$ 是正规的（对弱收敛连续）

且 $D(p) = \tau(p)$ 给出维数函数。

### 214.3 具体实现与例子

**定义 214.4**（群 von Neumann 代数）：设 $\Gamma$ 是离散群。$\Gamma$ 的**群 von Neumann 代数** $\mathcal{L}(\Gamma)$ 是左正则表示 $\lambda: \Gamma \to B(\ell^2(\Gamma))$（$\lambda_g \delta_h = \delta_{gh}$）的像的 WOT 闭包。

$$\mathcal{L}(\Gamma) = \lambda(\Gamma)'' \subseteq B(\ell^2(\Gamma))$$

**定理 214.2**（Murray-von Neumann, 1943）：
- $\mathcal{L}(\Gamma)$ 是 II$_1$ 型因子当且仅当 $\Gamma$ 是无限可分共轭类群（ICC 群）
- $\tau(x) = \langle x \delta_e, \delta_e \rangle$ 是 $\mathcal{L}(\Gamma)$ 上的规范忠实正规迹
- 典型例子：$\mathcal{L}(\mathbb{F}_2)$（自由群 $n \geq 2$ 个生成元）、$\mathcal{L}(S_\infty)$（有限置换群的归并）

**问题 214.1**（自由群因子同构问题）：$\mathcal{L}(\mathbb{F}_m) \cong \mathcal{L}(\mathbb{F}_n)$ 对 $m \neq n$ 是否成立？这是 von Neumann 代数理论中长期未解决的著名问题之一（与自由概率论和 Voiculescu 的微观状态方法相关）。

**例 214.1**（超有限 II$_1$ 型因子）：$\mathcal{R}$ 是通过矩阵代数的归并极限获得的 II$_1$ 型因子：

$$\mathcal{R} = \overline{\bigcup_{n} M_{2^n}(\mathbb{C})}^{\text{SOT}}$$

Murray 和 von Neumann 证明 $\mathcal{R}$ 是唯一的超有限 II$_1$ 型因子（同构意义下）。

**定义 214.5**（超有限因子 / Approximately Finite Dimensional, AFD）：因子 $\mathcal{M}$ 称为**超有限**的，如果 $\mathcal{M}$ 可由有限维子代数递增序列的并生成（在强算子拓扑下）。

**定理 214.3**（Murray-von Neumann, 1943）：存在唯一（同构意义下）的超有限 II$_1$ 型因子，记作 $\mathcal{R}$。

**推论 214.4**：$\mathcal{R} \cong \mathcal{L}(S_\infty) \cong \overline{\bigotimes}_{n} M_2(\mathbb{C})$（无限张量积）。

### 214.4 Powers 因子与 III 型分类的序曲

**定义 214.6**（Powers 因子，1967）：Powers 构造了连续族的互不同构的 III 型因子 $R_\lambda$（$0 < \lambda < 1$），通过对超有限 II$_1$ 型因子 $\mathcal{R}$ 作 $\lambda$-自同构迭代。这些因子可由无穷张量积构造：

$$R_\lambda = \overline{\bigotimes}_{n=1}^\infty (M_2(\mathbb{C}), \phi_\lambda)$$

其中 $\phi_\lambda$ 是 $M_2(\mathbb{C})$ 上的非迹状态。

这一工作揭示了 III 型因子的丰富性，为 Connes 的分类铺平了道路。

---

---

## 第215章：Tomita-Takesaki 模理论
Tomita-Takesaki 模理论（1967-1970）是 von Neumann 代数理论中最重要的结构定理之一。它从给定的 von Neumann 代数和其上一个忠实的正规半有限权出发，构造了一个单参数自同构群——模自同构群（modular automorphism group）——并建立了正锥与模算子的理论。

### 215.1 权的基本理论

**定义 215.1**（权 / Weight）：von Neumann 代数 $\mathcal{M}$ 上的**权** $\varphi$ 是映射 $\varphi: \mathcal{M}_+ \to [0, \infty]$，满足
- $\varphi(x + y) = \varphi(x) + \varphi(y)$
- $\varphi(\lambda x) = \lambda \varphi(x)$（$\lambda \geq 0$，约定 $0 \cdot \infty = 0$）

权是迹和状态的推广。有限权（$\varphi(I) < \infty$）可标准化为状态。

**定义 215.2**（半有限/忠实/正规权）：
- $\varphi$ 是**忠实**的：$\varphi(x) = 0 \implies x = 0$（$x \in \mathcal{M}_+$）
- $\varphi$ 是**半有限**的：$\{x \in \mathcal{M}_+ : \varphi(x) < \infty\}$ 在 $\mathcal{M}_+$ 中稠密
- $\varphi$ 是**正规**的：对 $\mathcal{M}_+$ 中任意递增网 $x_\alpha \uparrow x$，$\varphi(x_\alpha) \uparrow \varphi(x)$

**定理 215.1**（权的基本事实）：任何 von Neumann 代数都容纳一个忠实的正规半有限权（fns weight）。这一结果依赖于 Hahn-Banach 定理和 von Neumann 代数的预对偶性质。

### 215.2 GNS 构造与 Tomita 算子

**定理 215.2**（GNS 构造 / Gelfand-Naimark-Segal, 1943）：设 $\varphi$ 是 $\mathcal{M}$ 上的忠实正规半有限权。则存在 Hilbert 空间 $L^2(\mathcal{M}, \varphi)$ 和忠实正规 \* -表示 $\pi_\varphi: \mathcal{M} \to B(L^2(\mathcal{M}, \varphi))$，使得 $\pi_\varphi(\mathcal{M})$ 是 von Neumann 代数，且有循环和分离向量。

**定义 215.3**（Tomita 算子）：给定 von Neumann 代数 $\mathcal{M}$ 和循环分离向量 $\Omega$，定义 **Tomita 算子** $S$：

$$S_0(x\Omega) = x^*\Omega, \quad x \in \mathcal{M}$$

$S_0$ 是稠定的共轭线性算子。其闭包 $S = \overline{S_0}$ 称为 Tomita 算子。

**定理 215.3**（极分解）：$S$ 有极分解 $S = J \Delta^{1/2}$，其中：
- $J$ 是共轭线性等距（$J^2 = I$，$J = J^*$），称为**模共轭**（modular conjugation）
- $\Delta = S^*S$ 是正的自伴算子，称为**模算子**（modular operator）

### 215.3 Tomita-Takesaki 定理

**定理 215.4**（Tomita-Takesaki 定理）：设 $\mathcal{M} \subseteq B(H)$ 是 von Neumann 代数，$\Omega$ 是循环分离向量。则：

1. $J \mathcal{M} J = \mathcal{M}'$（模共轭将 $\mathcal{M}$ 映为其换位）

2. $\Delta^{it} \mathcal{M} \Delta^{-it} = \mathcal{M}$ 对所有 $t \in \mathbb{R}$（模自同构群保持 $\mathcal{M}$）

3. **模自同构群** $\sigma_t^\varphi(x) = \Delta^{it} x \Delta^{-it}$（$t \in \mathbb{R}$）是 $\mathcal{M}$ 的单参数自同构群

4. **KMS 条件**：对任意 $x, y \in \mathcal{M}$，存在有界连续函数 $F(z)$ 在条带 $\{z : 0 \leq \Im(z) \leq 1\}$ 上解析，边界值为
   $$F(t) = \varphi(\sigma_t^\varphi(x) y), \quad F(t+i) = \varphi(y \sigma_t^\varphi(x))$$

*证明概要*：核心是证明 $S = J\Delta^{1/2}$ 满足以上性质。(1) 源于 $S$ 和 $F$（$F(x\Omega) = x^*\Omega$ 在 $\mathcal{M}'$ 上）的关系。$J\mathcal{M}J \subseteq \mathcal{M}'$ 通过 $S$ 与 $\mathcal{M}$ 和 $\mathcal{M}'$ 之间的代数关系论证。(2) 利用 Stone 定理构造 $\Delta^{it}$ 的单参数酉群，通过 KMS 条件的解析延拓证明 $\Delta^{it}\mathcal{M}\Delta^{-it} \subseteq \mathcal{M}$。(3-4) KMS 条件的证明依赖于复分析中的三线定理和 Phragmén-Lindelöf 原理。∎

**推论 215.5**：对任意忠实正规半有限权 $\varphi$，存在唯一的一参数自同构群 $\sigma_t^\varphi$ 满足 KMS 条件。这称为 $\varphi$ 的**模自同构群**。

### 215.4 Connes 的余循环定理与 III 型分类

**定理 215.6**（Connes 余循环定理，1973）：设 $\varphi, \psi$ 是 $\mathcal{M}$ 上的两个忠实正规半有限权。则模自同构群 $\sigma_t^\varphi$ 和 $\sigma_t^\psi$ 是余循环等价的：存在连续映射 $u: \mathbb{R} \to \mathcal{U}(\mathcal{M})$ 满足 $u_{t+s} = u_t \sigma_t^\varphi(u_s)$，使得

$$\sigma_t^\psi(x) = u_t \sigma_t^\varphi(x) u_t^*$$

**定理 215.7**（Connes 的 III 型分类定理，1973）：设 $\mathcal{M}$ 是 III 型因子。定义

$$S(\mathcal{M}) = \bigcap_{\varphi} \operatorname{Sp}(\Delta_\varphi) \subseteq [0, \infty)$$

其中 $\Delta_\varphi$ 是权 $\varphi$ 的模算子，$\operatorname{Sp}$ 表示谱。Connes 的分类：

- **III$_0$ 型**：$S(\mathcal{M}) = \{0, 1\}$
- **III$_\lambda$ 型**（$0 < \lambda < 1$）：$S(\mathcal{M}) = \{0\} \cup \{\lambda^n : n \in \mathbb{Z}\}$
- **III$_1$ 型**：$S(\mathcal{M}) = [0, \infty)$

这些因子互不同构。Haagerup（1987）证明了 III$_1$ 型因子的唯一性。

### 215.5 流与 Connes 的 T-不变量

**定义 215.7**（非平凡流 / Flow of Weights, Connes-Takesaki）：对 III 型因子 $\mathcal{M}$，Connes 和 Takesaki 构造了 III 型因子的**权流**（flow of weights）：一个 $\mathbb{R}$ 作用在可交换 von Neumann 代数上的遍历流。对 III$_\lambda$ 型因子（$\lambda \neq 0$），此流是周期的（周期 $T = -2\pi/\ln\lambda$）。

**定义 215.8**（$T$-不变量）：III 型因子的 $T$-集定义为

$$T(\mathcal{M}) = \{t \in \mathbb{R} : \sigma_t^\varphi \text{ 是内自同构}\}$$

$T(\mathcal{M})$ 是 $\mathbb{R}$ 的子群，不依赖于 $\varphi$ 的选择。对 III$_\lambda$ 型因子，$T(\mathcal{M}) = (2\pi/\ln\lambda)\mathbb{Z}$。

---

---

## 第216章：自由概率论与随机矩阵
自由概率论由 Voiculescu（1985）创立，是 von Neumann 代数理论和随机矩阵理论相结合的产物。它为 II$_1$ 型因子的研究提供了强大的新工具。

### 216.1 非交换概率空间

**定义 216.1**（非交换概率空间）：**非交换概率空间** $(\mathcal{A}, \varphi)$ 由单位元 \* -代数 $\mathcal{A}$ 和忠实的正线性泛函 $\varphi: \mathcal{A} \to \mathbb{C}$（$\varphi(1) = 1$，状态）组成。

- **经典概率**：$(\mathcal{A}, \varphi) = (L^\infty(X, \mu), \mathbb{E}_\mu)$
- **自由概率**：$(\mathcal{A}, \varphi) = (\mathcal{M}, \tau)$，其中 $\mathcal{M}$ 是 II$_1$ 型因子，$\tau$ 是忠实的正规迹

### 216.2 自由独立性

**定义 216.2**（自由独立性 / Freeness）：设 $(\mathcal{A}, \varphi)$ 是非交换概率空间。子代数族 $\mathcal{A}_1, \ldots, \mathcal{A}_n \subseteq \mathcal{A}$ 是**自由独立**的，如果对任意 $a_j \in \mathcal{A}_{i_j}$（$i_1 \neq i_2 \neq \cdots \neq i_k$，即相邻指标不同）且 $\varphi(a_j) = 0$，有

$$\varphi(a_1 a_2 \cdots a_k) = 0$$

**定义 216.3**（自由卷积）：若随机变量 $a, b$ 关于 $\varphi$ 的分布在解析意义下已知，且 $a, b$ 是自由独立的，则 $a+b$ 的分布由**自由加性卷积** $\mu \boxplus \nu$ 给出。

**定理 216.1**（自由中心极限定理）：设 $a_1, a_2, \ldots$ 是自由独立且同分布的随机变量，$\varphi(a_i) = 0$，$\varphi(a_i^2) = 1$。则

$$S_n = \frac{1}{\sqrt{n}} \sum_{i=1}^n a_i$$

在分布意义下收敛于**半圆律**：$\mu_{SC}(dx) = \frac{1}{2\pi} \sqrt{4 - x^2} \, dx$（$|x| \leq 2$）。

**推论 216.2**：半圆律在自由概率论中的地位类似于高斯分布（正态分布）在经典概率论中的地位。

### 216.3 自由概率论的算子代数应用

**定理 216.3**（Voiculescu, 1990-1995）：自由群因子 $\mathcal{L}(\mathbb{F}_n)$ 的微观状态方法：
- $\mathcal{L}(\mathbb{F}_n)$ 可嵌入超有限 II$_1$ 型因子的超积中
- 由此获得 $\mathcal{L}(\mathbb{F}_n)$ 中生成元的自由独立性和渐近自由性
- 自由群因子同构问题可通过自由熵 $\chi^*(X_1, \ldots, X_n)$ 研究

进一步：Dykema（1994）和 Radulescu（1994）独立证明了压缩自由群因子 $L(\mathbb{F}_n)_t$（$t > 0$ 连续参数）的理论，将其推广为连续参数的族。更一般地，Voiculescu 的自由维数（自由熵）发展为 $L^2$-Betti 数和 Atiyah 问题的关键工具。

**定义 216.4**（自由熵 / Free Entropy）：Voiculescu 引入了微状态自由熵 $\chi(X_1, \ldots, X_n)$，度量 von Neumann 代数生成元集的"自由度"。自由熵与 $L^2$-Betti 数有深刻的联系，并在自由群因子同构问题的研究中起关键作用。

---

---

## 第145章（补充）
> 积分方程是未知函数出现在积分号下的方程，是泛函分析、数学物理和工程数学的经典交汇领域。本卷系统建立 Fredholm 积分方程、Volterra 积分方程、奇异性积分方程和 Wiener-Hopf 积分方程的理论及其数值方法。积分方程理论是 Hilbert 空间算子理论的直接应用，也是谱理论、紧算子和变分方法的经典范例。

---

---

## 第217章：Fredholm 积分方程
Fredholm 积分方程形如

$$u(x) - \lambda \int_a^b K(x,y) u(y) dy = f(x)$$

或其特征值问题 $\int_a^b K(x,y) u(y) dy = \mu u(x)$。这是一类由 Fredholm（1903）系统研究的积分方程，其理论与紧算子的谱理论完全对应。

### 217.1 Fredholm 择一定理

**定义 217.1**（Fredholm 积分算子）：在 $L^2([a,b])$ 上定义积分算子

$$(Ku)(x) = \int_a^b K(x,y) u(y) dy$$

若 $K \in L^2([a,b] \times [a,b])$，则 $K$ 是 Hilbert-Schmidt 算子，从而是紧算子。

**定理 217.1**（Fredholm 择一定理）：对 Fredholm 积分方程 $(I - \lambda K)u = f$，以下二者恰有一者成立：
- （第一择一）对任意 $f$，方程有唯一解 $u = (I - \lambda K)^{-1} f$
- （第二择一）齐次方程 $(I - \lambda K)u = 0$ 有非零解，此时非齐次方程有解当且仅当 $f \in (\ker(I - \lambda K^*))^\perp$

这是紧算子理论中谱的基本性质：紧算子的非零谱点必为特征值，且 $\lambda^{-1}$ 是 $K$ 的特征值当且仅当 $\lambda$ 是 $(I - \lambda K)^{-1}$ 的奇点。

### 217.2 Fredholm 行列式

**定义 217.2**（Fredholm 行列式）：对核为 $K(x,y)$ 的 Fredholm 积分方程，Fredholm 行列式定义为

$$D(\lambda) = \sum_{n=0}^{\infty} \frac{(-\lambda)^n}{n!} \int_a^b \cdots \int_a^b \det(K(x_i, x_j))_{i,j=1}^n dx_1 \cdots dx_n$$

**定理 217.2**：$D(\lambda)$ 是 $\lambda$ 的整函数，其零点恰为 $K$ 的特征值的倒数 $\lambda = 1/\mu$（重数对应）。预解核

$$R(x,y;\lambda) = \frac{D(x,y;\lambda)}{D(\lambda)}$$

其中 $D(x,y;\lambda)$ 是 Fredholm 一阶子式行列式。

### 217.3 对称核与 Hilbert-Schmidt 定理

**定理 217.3**（Hilbert-Schmidt 展开定理）：若 $K(x,y)$ 是实对称且平方可积的核（$K(x,y) = K(y,x)$，$\iint |K|^2 < \infty$），则

$$K(x,y) = \sum_{n=1}^{\infty} \mu_n u_n(x) u_n(y)$$

其中 $\{\mu_n\}$ 是 $K$ 的非零特征值（每个按重数列出），$\{u_n\}$ 是对应的标准正交特征函数。级数在 $L^2$ 意义下收敛；若 $K$ 连续且正定，则收敛是绝对且一致的（Mercer 定理）。

**定理 217.4**（Mercer 定理）：若 $K$ 是连续对称正定核（即对任意 $f$，$\iint K(x,y)f(x)f(y)dx dy \geq 0$），则特征值 $\mu_n \geq 0$，且

$$K(x,y) = \sum_{n=1}^{\infty} \mu_n u_n(x) u_n(y)$$

收敛是绝对且一致的。特别地，迹公式 $\sum \mu_n = \int K(x,x) dx$ 成立。

**应用**：Mercer 定理是核方法（kernel methods）——包括支持向量机（SVM）和高斯过程回归——的数学基础，将正定核表征为特征映射的内积。

### 217.4 弱奇异性核

**定义 217.3**（弱奇异核）：形如 $K(x,y) = H(x,y) / |x-y|^\alpha$ 的核（$\alpha < d$，其中 $d$ 是空间维数）虽然在对角线上奇异，但在 $L^2$ 中仍定义紧算子——奇异性由 Hardy-Littlewood-Sobolev 不等式控制。

**定理 217.5**：若 $K(x,y)$ 满足 $\int |K(x,y)|^2 dy < \infty$ a.e. 且 $\int |K(x,y)|^2 dx < \infty$ a.e.，则 $K$ 在 $L^2$ 上是紧算子。Fredholm 择一定理和 Hilbert-Schmidt 定理均成立，且迭代预解核给出级数解。

---

---

## 第218章：Volterra 积分方程
Volterra 积分方程的特征是积分上限为变量 $x$ 而非固定值：

$$u(x) - \lambda \int_a^x K(x,y) u(y) dy = f(x)$$

（第二类 Volterra 方程）或 $\int_a^x K(x,y) u(y) dy = f(x)$（第一类）。

### 218.1 逐次逼近与 Neumann 级数

**定理 218.1**（Volterra 方程的可解性）：若核 $K(x,y)$ 在 $a \leq y \leq x \leq b$ 上连续，则对任意 $\lambda$ 和连续 $f$，Volterra 方程 $(I - \lambda V)u = f$ 有唯一连续解。且 Neumann 级数

$$u(x) = f(x) + \sum_{n=1}^{\infty} \lambda^n (V^n f)(x)$$

对任意 $\lambda$ 收敛（$V$ 的谱半径为零——拟幂零算子）。

*证明思路*：由归纳法，$|(V^n f)(x)| \leq \|K\|_\infty^n \|f\|_\infty (x-a)^n / n!$。由于 $(x-a)^n / n! \to 0$ 对任意 $x$，级数绝对一致收敛。Volterra 算子是紧算子且谱仅含 $\{0\}$（拟幂零性）。∎

### 218.2 Volterra 方程与常微分方程

**定理 218.2**（ODE 初值问题的 Volterra 表示）：$n$ 阶线性 ODE 初值问题

$$y^{(n)}(x) + a_{n-1}(x) y^{(n-1)}(x) + \cdots + a_0(x) y(x) = g(x)$$

及初值条件 $y(a) = y_0, \ldots, y^{(n-1)}(a) = y_{n-1}$ 等价于 Volterra 积分方程

$$y(x) = f(x) + \lambda \int_a^x K(x,s) y(s) ds$$

其中 $f(x)$ 由非齐次项和初值条件决定。这一等价性将 ODE 的存在唯一性理论转化为积分算子的不动点问题。

**推论 218.3**：Picard-Lindelöf 定理（Lipschitz 条件下 ODE 解的存在唯一性）是 Volterra 算子压缩性的特例。

### 218.3 Abel 积分方程

**定义 218.4**（Abel 积分方程）：第一类 Volterra 方程

$$\int_0^x \frac{u(y)}{(x-y)^\alpha} dy = f(x), \quad 0 < \alpha < 1$$

（当 $\alpha = 1/2$ 时等时线问题——tautochrone problem）。

**定理 218.4**（Abel 反演公式）：

$$u(x) = \frac{\sin(\pi \alpha)}{\pi} \frac{d}{dx} \int_0^x \frac{f(y)}{(x-y)^{1-\alpha}} dy$$

这可以理解为分数阶导数的 Abel 反演：$D^{-\alpha} u = f \implies u = D^\alpha f$，其中 $D^\alpha$ 是 Riemann-Liouville 分数阶微积分中的分数阶导数。

---

---

## 第219章：奇异性积分方程
奇异性积分方程含非可积的核（如 Cauchy 核 $1/(x-y)$），积分需要理解为主值积分。此类方程是复分析和偏微分方程边值问题的核心工具。

### 219.1 Cauchy 核与 Plemelj 公式

**定义 219.1**（Cauchy 主值积分）：定义在曲线 $\Gamma$ 上的 Cauchy 主值积分为

$$(\mathcal{H} u)(x) = \text{p.v.} \int_\Gamma \frac{u(y)}{y-x} dy = \lim_{\varepsilon \to 0} \int_{\Gamma \setminus B_\varepsilon(x)} \frac{u(y)}{y-x} dy$$

**定理 219.1**（Plemelj-Sokhotski 公式）：对 Hölder 连续函数 $u$ 在光滑曲线 $\Gamma$ 上，Cauchy 型积分

$$\Phi(z) = \frac{1}{2\pi i} \int_\Gamma \frac{u(y)}{y-z} dy \quad (z \notin \Gamma)$$

在跨越 $\Gamma$ 时的边值为

$$\Phi^\pm(x) = \pm \frac{1}{2} u(x) + \frac{1}{2\pi i} \text{p.v.} \int_\Gamma \frac{u(y)}{y-x} dy$$

即 $\Phi^+(x) - \Phi^-(x) = u(x)$ 和 $\Phi^+(x) + \Phi^-(x) = \frac{1}{\pi i} \text{p.v.} \int \frac{u(y)}{y-x} dy$。

### 219.2 Riemann-Hilbert 问题

**定义 219.2**（标量 Riemann-Hilbert 问题）：求在 $\Gamma$ 分割的区域内解析的函数 $\Phi(z)$，满足边界条件

$$\Phi^+(x) = G(x) \Phi^-(x) + g(x), \quad x \in \Gamma$$

其中 $G(x)$ 是跃度函数，$g(x)$ 是给定函数。

**定理 219.2**（标量 RHP 的可解性）：若 $G(x) \neq 0$ 且 $\Gamma$ 是简单闭曲线，令 $\kappa = \frac{1}{2\pi} [\arg G]_\Gamma$（$G$ 的指标 / winding number）。则：
- $\kappa \geq 0$：齐次问题（$g \equiv 0$）有 $\kappa$ 个线性无关解；非齐次问题对任意 $g$ 可解
- $\kappa < 0$：齐次问题仅有零解；非齐次问题可解需满足 $-\kappa$ 个相容性条件

**应用**：Riemann-Hilbert 方法（又名非线性 steepest descent 方法，Deift-Zhou 1993）是求解可积系统——KdV 方程、非线性 Schrödinger 方程、Painlevé 方程等——的长期渐近和普适性结果的核心工具。该方法还严格证明了随机矩阵理论中的 Tracy-Widom 分布公式。

### 219.3 奇异积分算子的有界性

**定理 219.3**（Calderón-Zygmund 理论）：Cauchy 奇异积分算子 $\mathcal{H}$（Hilbert 变换）在 $L^p(\mathbb{R})$（$1 < p < \infty$）上有界，且在 BMO 空间上有界（$L^\infty \to \text{BMO}$ 代替）。

*意义*：奇异积分算子的 $L^p$ 有界性是调和分析和 PDE 理论的基石，为 Mihlin-Hörmander 乘子定理和伪微分算子的 $L^p$ 连续性提供了统一的技术基础。

---

---

## 第220章：Wiener-Hopf 积分方程与 Wiener-Hopf 方法
Wiener-Hopf 积分方程形如

$$u(x) - \lambda \int_0^\infty K(x-y) u(y) dy = f(x), \quad x \geq 0$$

核仅依赖于差 $x-y$。这类方程出现在衍射理论、断裂力学、排队论和随机过程中。

**定理 220.1**（Wiener-Hopf 分解）：设 $K \in L^1(\mathbb{R})$ 且 Fourier 变换 $\hat{K}(\xi) = \int_{-\infty}^{\infty} K(x) e^{-i\xi x} dx$ 满足 $1 - \lambda \hat{K}(\xi) \neq 0$ 对所有 $\xi \in \mathbb{R}$。则存在分解

$$1 - \lambda \hat{K}(\xi) = \frac{\hat{K}_+(\xi)}{\hat{K}_-(\xi)}$$

其中 $\hat{K}_+$（$\hat{K}_-$）在上下半平面解析且非零。

**Wiener-Hopf 方法**：通过 Fourier 变换将积分方程转化为 Wiener-Hopf 函数方程，利用上半/下半平面解析性与 Liuville 定理进行因式分解，最终求解。该方法将积分方程转化为复平面上的解析函数因子化问题。

**定理 220.2**（Krein 推广）：对向量值 Wiener-Hopf 方程，存在算子值符号的 Wiener-Hopf 分解，其指标与 Toeplitz 算子的 Fredholm 性质密切相关。

---

---

## 第221章：积分方程的数值方法
积分方程的离散化产生线性方程组，可用直接方法或迭代方法求解。本章介绍四种基本的离散化方法。

### 221.1 Galerkin 法与配置法

**Galerkin 法**：在有限维子空间 $V_n = \operatorname{span}\{\varphi_1, \ldots, \varphi_n\}$ 中寻求 $u_n$，使得残差与所有测试函数 $\psi_i$ 正交：

$$(u_n - \lambda K u_n - f, \psi_i) = 0$$

得到线性系统 $\sum_{j=1}^n c_j (\varphi_j - \lambda K \varphi_j, \psi_i) = (f, \psi_i)$。

**配置法**（Collocation）：要求在配置点 $\{x_i\}$ 处精确满足方程：

$$u_n(x_i) - \lambda \int K(x_i, y) u_n(y) dy = f(x_i)$$

这是 Galerkin 法取 $\psi_i = \delta_{x_i}$ 的特例。

**定理 221.1**（Galerkin 法的收敛性）：若 $K$ 是紧算子且 $I - \lambda K$ 可逆，则对充分大的 $n$，Galerkin 近似 $u_n$ 唯一存在且 $\|u - u_n\| \leq C \inf_{v \in V_n} \|u - v\|$（Céa 引理的对偶）。

### 221.2 Nyström 法

**Nyström 法**直接在求积规则上离散化积分：

$$\int K(x_i, y) u(y) dy \approx \sum_{j=1}^n w_j K(x_i, y_j) u(y_j)$$

得到线性系统 $(I - \lambda K_n) u_n = f_n$，其中 $(K_n)_{ij} = w_j K(x_i, y_j)$。

**定理 221.2**：若求积规则对连续函数收敛，则 Nyström 法在紧算子框架下是收敛的（逐点且按范数）。收敛阶等于求积误差阶。

### 221.3 退化核逼近

若核可近似为分离核 $K(x,y) \approx \sum_{i=1}^m a_i(x) b_i(y)$（如 Karhunen-Loève 展开），则积分方程退化为线性方程组。这正是低秩逼近在积分方程中的应用。

### 221.4 不适定问题与正则化

**定义 221.1**（不适定问题）：第一类积分方程 $\int K(x,y) u(y) dy = f(x)$ 在 $L^2$ 中是不适定的（Hadamard 意义下）：$K$ 的紧性使其逆无界，数据的小误差可能导致解的剧烈变化。

**Tikhonov 正则化**：用正则化泛函

$$u_\alpha = \arg\min_u \left\{ \|K u - f\|_{L^2}^2 + \alpha \|u\|_{L^2}^2 \right\}$$

代替原问题，其中 $\alpha > 0$ 是正则化参数。等价于求解

$$(K^* K + \alpha I) u_\alpha = K^* f$$

**定理 221.3**（正则化的收敛性）：若 $\alpha \to 0$ 且 $\alpha$ 以适当速率（依赖于噪声水平 $\delta = \|f - f^\delta\|$）趋于零，则 Tikhonov 解 $u_\alpha^\delta$ 当 $\delta \to 0$ 时收敛于真正解（Morozov 偏差原理给出 $\alpha$ 的选取准则）。

---

---

## 第222章：积分方程在数学物理中的应用
积分方程方法是数学物理问题的三大解法之一（另两种为微分方程方法和变分方法）。

**定理 222.1**（位势理论与边界积分方程）：Laplace 方程 $\Delta u = 0$ 的 Dirichlet 边值问题 $u|_{\partial \Omega} = g$ 等价于边界积分方程

$$\frac{1}{2} \sigma(x) + \int_{\partial \Omega} \frac{\partial G}{\partial n_y}(x,y) \sigma(y) dS_y = g(x)$$

（双层位势表示）。对应的边界积分算子在 $L^2(\partial \Omega)$ 上是紧的（当 $\partial \Omega$ 光滑时），Fredholm 择一定理给出 Dirichlet 问题解的存在唯一性。

**电磁散射理论**：Maxwell 方程的外问题可化为积分方程（电场/磁场积分方程 EFIE/MFIE）；量子力学中 Lippmann-Schwinger 方程 $|\psi\rangle = |\psi_0\rangle + G_0 V |\psi\rangle$ 是散射理论的 Fredholm 积分方程。

**积分-微分方程**：辐射输运方程（Boltzmann 方程的特殊形式）同时含积分和微分算子，通常用离散纵坐标法（$S_N$ 法）加源迭代求解。

---

*本卷建立了积分方程理论的完整体系：Fredholm 积分方程（Fredholm择一定理、Hilbert-Schmidt展开与Mercer定理）、Volterra 积分方程（Neumann级数与拟幂零性、Abel反演公式）、奇异性积分方程（Cauchy主值积分、Plemelj-Sokhotski公式、Riemann-Hilbert问题与非线性陡降方法）、Wiener-Hopf 积分方程与Wiener-Hopf分解，以及Galerkin法、Nyström法、Tikhonov正则化等数值方法。共 6 章。*

---

---

## 第152章（补充）
拓扑向量空间（Topological Vector Space, TVS）是 Bourbaki 单独成卷的核心分析分支。它推广了 Banach 和 Hilbert 空间的框架，容纳了分布理论（Schwartz）、解析函数空间（Montel空间）和 PDE 中常见的非可赋范空间。

### 拓扑向量空间基础

**定义**（拓扑向量空间）：域 $\mathbb{K}$（$\mathbb{R}$ 或 $\mathbb{C}$）上的**拓扑向量空间** $E$ 是一向量空间，装备了 Hausdorff 拓扑，使得加法 $E \times E \to E$ 和数乘 $\mathbb{K} \times E \to E$ 连续。

**定义**（局部凸空间）：若 $E$ 的原点有由凸集组成的邻域基，则 $E$ 是**局部凸空间**（LCS）。等价地，其拓扑可由一族半范数 $\{p_\alpha\}_{\alpha \in A}$ 生成。Banach 空间是局部凸的（单个范数），$C^\infty(\mathbb{R})$ 也是（半范数族 $p_{K,n}(f) = \sup_{x \in K} |f^{(n)}(x)|$，$K$ 紧）。

**定理**（Kolmogorov可赋范准则）：TVS $E$ 是可赋范的当且仅当它是局部凸的且其原点具有有界邻域（即存在原点的邻域 $U$ 使得对任何邻域 $V$，有 $t > 0$ 使 $U \subset tV$）。这解释了为什么许多函数空间需要比范数拓扑更精细的结构。

**定义**（桶空间）：$E$ 中的**桶**（barrel）是吸收所有点的、绝对凸的闭子集。**桶空间**（barrelled space）是每个桶都是原点的邻域的局部凸空间。所有 Fréchet 空间是桶空间。**配对引理**（Banach-Steinhaus 定理的 TVS 推广）：在桶空间中，逐点有界的连续线性算子族是等度连续的。

**定理**（Mackey-Arens 定理）：设 $(E, F)$ 是对偶配对（即 $F \subset E^*$ 分离 $E$ 的点）。$E$ 上所有与 $F$ 相容的（即对偶空间恰为 $F$ 的）局部凸拓扑中，最弱的是弱拓扑 $\sigma(E, F)$，最强的是 Mackey 拓扑 $\tau(E, F)$（由 $F$ 中所有 $\sigma(F, E)$-紧绝对凸集的极生成）。这两者之间的所有相容局部凸拓扑给出相同的连续对偶。

### Fréchet 空间与 LF 空间

**定义**（Fréchet 空间）：**Fréchet 空间**是完全的可度量化局部凸空间。等价地，其拓扑可由一列递增的半范数 $\{p_n\}$ 生成且在此半范数列下完备。例子：$C^\infty[0, 1]$、$\mathcal{S}(\mathbb{R}^n)$（Schwartz 速降函数空间）、全纯函数空间 $\mathcal{O}(U)$。

**定理**（开映射定理的Fréchet推广）：Fréchet空间之间的连续线性满射必定是开的。特别地，连续线性双射自动是同胚（有界逆定理）。

**定理**（闭图像定理的Fréchet推广）：从桶空间到Fréchet空间的线性映射若其图像是闭的，则连续。这在PDE的闭算子理论中至关重要。

**定义**（LF空间）：**LF空间**（严格归纳极限）是一列 Fréchet 空间 $E_1 \subset E_2 \subset \cdots$（每个嵌入是紧的或等距的）的归纳极限，装备使所有嵌入连续的最终局部凸拓扑。例子：紧支撑光滑函数空间 $\mathcal{D}(U) = C_c^\infty(U)$、紧支撑分布空间 $\mathcal{E}'(U)$。$\mathcal{D}(U)$ 不是可度量化的——这是 LF 空间区别于 Fréchet 空间的关键。

### Krein-Milman 定理与 Choquet 理论

**定理**（Krein-Milman定理）：局部凸空间中的紧凸集 $K$ 是其端点集的闭凸包：$K = \overline{\operatorname{conv}}(\operatorname{ext}(K))$。每个紧凸集中的点都是端点的"积分"。

**定理**（Choquet定理 / Choquet-Bishop-de Leeuw 积分表示）：设 $K$ 是局部凸空间中的紧凸集。对任意 $x \in K$，存在 $K$ 的端点集 $\operatorname{ext}(K)$ 上的概率测度 $\mu$（Choquet测度），使得对任意连续仿射函数 $f: K \to \mathbb{R}$，有 $f(x) = \int_{\operatorname{ext}(K)} f \, d\mu$。此即每个点可表示为端点的重心。

*意义*：Krein-Milman 和 Choquet 理论是泛函分析"几何"面的顶峰——将凸集的几何结构（端点）与测度论表示（重心测度）联系起来，在量子力学的 C*-代数态空间表示和遍历理论中极为重要。

---

---

## 第153章（补充）
Bourbaki 将谱理论单独成卷。但教材中紧算子的谱理论（第75章）向无界算子的推广是量子力学数学基础的必要部分。

### 谱测度与谱积分

**定义**（谱测度 / 恒等分解）：Hilbert 空间 $H$ 上的**谱测度**（projection-valued measure）$E$ 是将 Borel 集 $\Delta \subset \mathbb{R}$ 映为 $H$ 上的正交投影 $E(\Delta)$ 的映射，满足：
1. $E(\varnothing) = 0$，$E(\mathbb{R}) = I$
2. $E(\Delta_1 \cap \Delta_2) = E(\Delta_1) E(\Delta_2)$
3. 对互不相交的 $\{\Delta_n\}$，$E(\bigcup \Delta_n) = \sum E(\Delta_n)$（强算子拓扑收敛）

**定理**（谱定理——无界自伴算子，von Neumann 1929）：对 Hilbert 空间 $H$ 上的任意（可能无界的）自伴算子 $A: \mathcal{D}(A) \to H$（$\mathcal{D}(A)$ 稠密），存在唯一的谱测度 $E$ 使得
$$A = \int_{\mathbb{R}} \lambda \, dE(\lambda)$$
积分在 $\mathcal{D}(A) = \{x \in H : \int \lambda^2 \, d\langle E(\lambda)x, x\rangle < \infty\}$ 上理解。这是有限维对角化的无限维推广——自伴算子"被谱测度对角化"。

**定义**（谱积分 / 算子的函数演算）：对 Borel 可测函数 $f: \mathbb{R} \to \mathbb{C}$，定义
$$f(A) = \int_{\mathbb{R}} f(\lambda) \, dE(\lambda)$$
（定义域为 $\{x : \int |f|^2 d\langle E x, x\rangle < \infty\}$）。这给出了 $A$ 的函数演算。特别地，$e^{itA}$（由 $f(\lambda) = e^{it\lambda}$）定义了酉群。

**定理**（Stone定理，1932）：Hilbert 空间上的强连续单参数酉群 $\{U(t)\}_{t \in \mathbb{R}}$ 与（可能无界的）自伴算子 $A$ 一一对应（经 $U(t) = e^{itA}$）。这是量子力学中"能量算子=时间平移生成元"的数学表述。

### 谱重数与本质谱

**定义**（谱重数 / 重数函数）：自伴算子 $A$ 的谱重数函数 $m(\lambda)$ 是在 $\lambda$ 附近谱测度的"秩"。等价于：选取与 $A$ 交换的极大 Abel 代数中的循环向量，将其作为 $L^2(\sigma(A), d\mu)$ 上的乘法算子表示。若 $m(\lambda) \equiv 1$（几乎处处），$A$ 称为具有**单谱**。

**定义**（本质谱与Weyl定理）：$A$ 的**本质谱** $\sigma_{\text{ess}}(A)$ 是去除了有限重数孤立特征值后的剩余谱。**Weyl准则**：$\lambda \in \sigma_{\text{ess}}(A)$ 当且仅当存在 Weyl 序列 $(x_n) \subset \mathcal{D}(A)$ 满足 $\|x_n\| = 1$，$x_n \rightharpoonup 0$（弱收敛）且 $\|(A - \lambda I)x_n\| \to 0$。本质谱在紧摄动下不变（Weyl定理）。

**定理**（Fredholm算子与本质谱）：$A - \lambda I$ 是 Fredholm 算子（核有限维、值域闭、余核有限维）当且仅当 $\lambda \notin \sigma_{\text{ess}}(A)$。Fredholm 指标 $\operatorname{ind}(A - \lambda I) = \dim \ker - \dim \operatorname{coker}$ 在 $\sigma_{\text{ess}}(A)$ 的连通分支上为常数。

---

---

## 第154章（补充）
分布理论（Distribution Theory / Generalized Functions）由 Laurent Schwartz 于 1945-1951 年创立（获 1950 年 Fields 奖），将"函数"概念推广为线性泛函，使得诸如 Dirac δ 函数、函数的广义导数、局部可积函数的弱导数等获得严格意义。它统一了 PDE 理论、调和分析和泛函分析。

### Schwartz空间与缓增分布

**定义**（速降函数空间 / Schwartz 空间）：$\mathbb{R}^n$ 上的 **Schwartz 空间** $\mathcal{S}(\mathbb{R}^n)$ 是所有光滑函数 $f \in C^\infty(\mathbb{R}^n)$ 的集合，满足对任意多重指标 $\alpha, \beta$，
$$\sup_{x \in \mathbb{R}^n} |x^\alpha D^\beta f(x)| < \infty$$
即 $f$ 及其所有导数在无穷远处比任何多项式的倒数下降得更快。$\mathcal{S}(\mathbb{R}^n)$ 是 Fréchet 空间（由可数族半范数 $\|f\|_{k, m} = \sup_{|\alpha| \leq k, |\beta| \leq m} |x^\alpha D^\beta f|$ 生成）。

**定义**（缓增分布 / tempered distribution）：**缓增分布**是 $\mathcal{S}(\mathbb{R}^n)$ 上的连续线性泛函。集合 $\mathcal{S}'(\mathbb{R}^n)$（缓增分布空间）装备弱-*拓扑。缓增分布包含了所有 $L^p(\mathbb{R}^n)$ 函数（$1 \leq p \leq \infty$）、所有多项式、缓增测度和 Dirac δ 函数列。

**命题**（嵌入与运算）：
- $L^p(\mathbb{R}^n) \subset \mathcal{S}'(\mathbb{R}^n)$：通过 $T_f(\varphi) = \int f \varphi \, dx$ 嵌入（局部可积的缓增增长函数）
- **分布的导数**：对 $T \in \mathcal{S}'$，定义 $\langle D^\alpha T, \varphi \rangle = (-1)^{|\alpha|} \langle T, D^\alpha \varphi \rangle$。每阶分布导数都存在——这是分布理论的核心：所有分布无穷次可微
- **Fourier变换**：$\mathcal{S}$ 上的 Fourier 变换 $\mathcal{F}$ 是同构，经对偶扩展到 $\mathcal{S}'$：$\langle \mathcal{F}T, \varphi \rangle = \langle T, \mathcal{F}\varphi \rangle$

**例**：$T = \delta$（Dirac δ）：$\langle \delta, \varphi \rangle = \varphi(0)$。其导数为 $\langle \delta', \varphi \rangle = -\varphi'(0)$。Heaviside阶梯函数 $H(x) = \mathbf{1}_{[0,\infty)}(x)$ 的分布导数是 δ：$H' = \delta$。

### 分布的局部理论与紧支撑分布

**定义**（分布空间 / 一般分布）：$\mathbb{R}^n$ 上的（一般）**分布**空间 $\mathcal{D}'(\mathbb{R}^n)$ 是紧支撑光滑函数空间 $\mathcal{D}(\mathbb{R}^n) = C_c^\infty(\mathbb{R}^n)$（装备 LF 空间拓扑）上的连续线性泛函。任何局部可积函数通过 $T_f(\varphi) = \int f \varphi \, dx$ 定义分布。

**定理**（分布的局部结构定理）：每个分布 $T \in \mathcal{D}'(\Omega)$ 在局部上是某连续函数的导数：对任意紧集 $K \subset \Omega$，存在多重指标 $\alpha$ 和连续函数 $g$ 使得 $T|_K = D^\alpha g$。

**定义**（紧支撑分布 / $\mathcal{E}'$）：有紧支撑的分布全体记为 $\mathcal{E}'(\mathbb{R}^n)$，它是光滑函数空间 $C^\infty(\mathbb{R}^n)$ 上具有紧支撑连续性（即对每个紧集 $K$ 存在 $C_K$ 使得 $|\langle T, \varphi \rangle| \leq C_K \|\varphi\|_{C^m(K)}$）的线性泛函全体。

**定理**（Paley-Wiener-Schwartz）：$\mathcal{E}'(\mathbb{R}^n)$ 中分布的 Fourier 变换是 $\mathbb{R}^n$ 上的实解析函数，且是多项式增长的。

### 分布的卷积与基本解

**定义**（分布的卷积）：若 $T \in \mathcal{D}'$ 和 $\varphi \in \mathcal{D}$，定义 $(T * \varphi)(x) = \langle T, \varphi(x - \cdot) \rangle$。对于两个分布 $S, T$，当至少一个有紧支撑时可定义 $S * T$。卷积是结合的、交换的，且 $D^\alpha(S * T) = (D^\alpha S) * T = S * (D^\alpha T)$。

**定义**（基本解 / fundamental solution）：常系数线性偏微分算子 $P(D) = \sum_{|\alpha| \leq m} a_\alpha D^\alpha$ 的**基本解**是分布 $E \in \mathcal{D}'$ 满足
$$P(D) E = \delta$$
基本解给出非齐次方程 $P(D)u = f$ 的一个特解 $u = E * f$（当 $f$ 有紧支撑时）。

**定理**（Malgrange-Ehrenpreis 定理，1954-1955）：任意非零常系数线性偏微分算子都有基本解。

**例**：Laplace算子的基本解：$\mathbb{R}^n$（$n \geq 3$）中 $E(x) = c_n |x|^{2-n}$ 满足 $\Delta E = \delta$；$\mathbb{R}^2$ 中 $E(x) = \frac{1}{2\pi} \log |x|$。热方程的基本解（热核）：$E(x, t) = \frac{\mathbf{1}_{[0,\infty)}(t)}{(4\pi t)^{n/2}} e^{-|x|^2/4t}$。

### Sobolev空间的分布定义

**定义**（Sobolev 空间 / Sobolev 空间 $H^s(\mathbb{R}^n)$）：使用 Fourier 变换和分布定义 **Sobolev 空间** $H^s(\mathbb{R}^n)$（$s \in \mathbb{R}$）：
$$H^s(\mathbb{R}^n) = \{u \in \mathcal{S}'(\mathbb{R}^n) : (1 + |\xi|^2)^{s/2} \mathcal{F}u(\xi) \in L^2(\mathbb{R}^n)\}$$
范数为 $\|u\|_{H^s} = \|(1 + |\xi|^2)^{s/2} \mathcal{F}u\|_{L^2}$。当 $s = k \in \mathbb{Z}_{\geq 0}$ 时，这就是经典的"直到 $k$ 阶导数在 $L^2$ 中"的 Sobolev 空间。$H^{-s}$ 包含 Dirac δ 等（$n/2 < s$）奇异对象。

**定理**（Sobolev 嵌入定理 / Sobolev 引理）：若 $s > n/2$，则 $H^s(\mathbb{R}^n) \subset C^0(\mathbb{R}^n)$（嵌入连续函数空间）。更一般地，若 $s > k + n/2$，则 $H^s \subset C^k$。这种"正则性提升"是 PDE 研究中用 Sobolev 空间消除奇异性的基本工具。

---

*本卷建立了算子代数理论的核心框架：C*-代数（GNS 构造、Gelfand 变换、交换 C*-代数的函数表示）、Hilbert C*-模（Kasparov KK-理论）、完全正映射（Stinespring 扩张、Arveson 扩张）与核 C*-代数、KMS 态与非交换遍历论，以及 Banach 代数与调和分析的统一观点。补充内容涵盖 von Neumann 代数（W*-代数、因子的 Murray-von Neumann 分类（I/II$_1$/II$_\infty$/III 型）、Tomita-Takesaki 模理论、Connes 的 III 型因子分类）和自由概率论（自由独立性、自由卷积、半圆律、自由熵）。**补充部分二**建立了积分方程理论的完整体系：Fredholm积分方程（Fredholm行列式、预解核、Fredholm择一定理、Hilbert-Schmidt展开与Mercer定理）、Volterra积分方程（逐次逼近与Neumann级数、与ODE的等价性、拟幂零性）、奇异积分方程（Cauchy核与Plemelj公式、Riemann-Hilbert问题、Abel反演公式）、Wiener-Hopf积分方程（Wiener-Hopf分解与Fourier变换方法）及数值方法（Galerkin法、Nyström法、退化核逼近、不适定问题的Tikhonov正则化）。共 31 章。*

---


*卷十三：泛函分析终。*
