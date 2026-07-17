# 卷十五：泛函分析

## 第131章：Banach 空间
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

---

---

---

## 第132章：Hilbert 空间
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

---

---

---

## 第133章：对偶空间与弱拓扑
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

---

---

---

## 第134章：紧算子与谱理论
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

---

---

---

## 第135章：C*-代数初步
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

---

---

---

## 第136章：有序线性空间（Ordered Vector Spaces）
有序线性空间是泛函分析中处理不等式、正性和序结构的框架。定义：实向量空间 $V$ 配以凸锥 $V_+ \subset V$（正锥）满足 $V_+ \cap (-V_+) = \{0\}$，诱导偏序 $x \leq y \iff y - x \in V_+$。**Riesz 空间**（向量格）：若 $V$ 配以上述偏序后每对有上确界（和下确界），则 $V$ 为 Riesz 空间——算子理论的序基础。**核心定理**：（1）Krein-Rutman 定理——Banach 格上的紧正算子有正特征值及对应的正特征向量（Perron-Frobenius 定理的无穷维推广），在 PDE 和 Markov 过程的基本解估计中至关重要；（2）有序线性空间上的正线性泛函扩张定理（Krein 延拓定理）；（3）Banach 格是等距序同构于某个 $L^p(\mu)$ 空间的 $L^p$-空间理论。在数理经济学和优化理论中，有序线性空间为一般均衡理论和凸对偶理论提供了基础框架。

**定义 77.1**（Riesz 空间 / 向量格）：实向量空间 $V$ 配以偏序 $\leq$ 满足：（1）$x \leq y \implies x+z \leq y+z$；（2）$x \geq 0 \implies \alpha x \geq 0$（$\forall \alpha \geq 0$）；（3）任意两个元 $x, y$ 有上确界 $x \vee y$ 和下确界 $x \wedge y$。称 $(V, \leq)$ 为 **Riesz 空间** 或向量格。Banach 空间兼为 Riesz 空间且满足 $\|x\| \leq \|y\|$ 当 $|x| \leq |y|$（其中 $|x| = x \vee (-x)$）时称为 **Banach 格**。

**定理 77.1**（Krein-Rutman 定理）：设 $X$ 为 Banach 格，$T: X \to X$ 为紧正算子且谱半径 $r(T) > 0$。则 $r(T)$ 是 $T$ 的特征值，对应特征向量可在 $X_+$（正锥）中选取。*证明思路*：利用 Krein-Milman 定理和 Banach-Alaoglu 定理证明 $T$ 限制在正锥上的 Pringsheim 型序列收敛到特征向量。该定理是正矩阵 Perron-Frobenius 定理在无穷维情形的推广。

---

---

---

---

## 第137章：插值空间（Interpolation Spaces）
插值空间理论（Aronszajn-Gagliardo, 1960年代；Peetre, Lions）在 Banach 空间对之间构造中间空间，调和分析中精细的 Sobolev 嵌入和算子有界性证明依赖于此。**核心方法**：（1）**实插值（$K$-方法）**——设 $(X_0, X_1)$ 为相容 Banach 空间对，对 $x \in X_0 + X_1$ 定义 $K(t, x) = \inf\{\|x_0\|_{X_0} + t\|x_1\|_{X_1} : x = x_0 + x_1\}$，则 $(X_0, X_1)_{\theta,q}$ 由 $\|x\| = \left(\int_0^\infty (t^{-\theta} K(t,x))^q \frac{dt}{t}\right)^{1/q}$ 定义；（2）**复插值（Calderón 方法）**——利用解析函数在全纯带状区域边值的范数插值。**应用**：（1）Riesz-Thorin 定理的抽象化——算子 $T: X_0 \to Y_0$ 和 $T: X_1 \to Y_1$ 有界，则在插值空间上也有界；（2）Marcinkiewicz 插值定理——从弱 $L^p$ 到强 $L^p$ 的插值；（3）Sobolev 空间的分数阶推广（Besov 空间和 Triebel-Lizorkin 空间）。

**定义 78.1**（$K$-泛函与实插值空间）：设 $(X_0, X_1)$ 为相容 Banach 空间对（即两者连续嵌入同一 Hausdorff 拓扑向量空间）。对 $x \in X_0 + X_1$ 定义 **$K$-泛函** $K(t, x) = \inf\{\|x_0\|_{X_0} + t\|x_1\|_{X_1} : x = x_0 + x_1\}$（$t > 0$）。对 $0 < \theta < 1$ 和 $1 \leq q \leq \infty$，**实插值空间** $(X_0, X_1)_{\theta,q} = \{x \in X_0 + X_1 : \|x\|_{\theta,q} = (\int_0^\infty [t^{-\theta} K(t,x)]^q \frac{dt}{t})^{1/q} < \infty\}$。

**定理 78.1**（插值定理）：设 $T: X_0 + X_1 \to Y_0 + Y_1$ 为线性算子且 $T|_{X_j}: X_j \to Y_j$ 有界（$j = 0, 1$）。则对任意 $\theta \in (0,1)$ 和 $q \in [1, \infty]$，$T: (X_0, X_1)_{\theta,q} \to (Y_0, Y_1)_{\theta,q}$ 有界。*证明思路*：对 $x = x_0 + x_1$ 用分解估计 $K_Y(t, Tx) \leq \|T_0\| (K_X(\frac{\|T_1\|}{\|T_0\|} t, x))$，代入范数定义即得。该定理统一了 Riesz-Thorin 定理（复插值）和 Marcinkiewicz 插值定理（实插值）的抽象框架。

---

---

---

---

## 第138章：线性算子摄动理论（Operator Perturbation Theory）
线性算子摄动理论研究当算子受微小扰动后谱、预解式和不变子空间的变化，是量子力学（摄动展开）和数值分析的核心工具。**核心内容**：（1）**Kato-Rellich 定理**——若 $A$ 自伴，$B$ 对称且关于 $A$ 相对有界（$\|Bx\| \leq a\|x\| + b\|Ax\|$，$b < 1$），则 $A + B$ 自伴且保持 $A$ 的本质谱；（2）**预解式级数**——对充分小的 $\lambda$，$(A + \lambda B - z)^{-1} = R(z) \sum_{n=0}^{\infty} (-\lambda B R(z))^n$ 给出摄动展开；（3）**解析摄动理论（Kato-Rellich）**——孤立特征值作为摄动参数的解析函数（分支不分裂条件）；（4）**奇异摄动理论**——当"微小参数"乘在最高阶导数上时（如 $\epsilon u'' + u' + u = 0$），边界层现象要求匹配渐近展开（Prandtl 边界层理论的基础）；（5）**Fredholm 行列式和限界式**——用于迹类算子的谱摄动精确定量分析（如半经典分析框架）。在量子力学的 Rayleigh-Schrödinger 摄动展开、散射理论和 Birkhoff 标准形理论中有核心应用。

---

---

---

---

---

## 第139章：Banach 代数与调和分析
Banach 代数框架将泛函分析与调和分析统一起来。

**定义 80.1**（Banach 代数）：Banach 代数 $A$ 是 Banach 空间配以结合的乘法运算满足 $\|ab\| \leq \|a\| \|b\|$。

**定理 80.1**（Gelfand 变换）：设 $A$ 为交换 Banach 代数。Gelfand 谱空间 $\Phi_A$（$A$ 上所有非零乘性线性泛函的集合，配以弱-*拓扑）是局部紧 Hausdorff 空间。**Gelfand 变换** $\widehat{a}(\varphi) = \varphi(a)$ 是 $A \to C_0(\Phi_A)$ 的压缩同态。若 $A$ 含幺元，$\Phi_A$ 紧致。

**定理 80.2**（群代数 $L^1(G)$ 与乘性线性泛函）：设 $G$ 为局部紧交换群。则 $L^1(G)$（卷积代数）的 Gelfand 谱空间自然同胚于对偶群 $\widehat{G}$。Gelfand 变换退化为 Fourier 变换：$\widehat{f}(\chi) = \int_G f(g) \overline{\chi(g)} dg$。*证明思路*：$L^1(G)$ 的乘性线性泛函由积分与特征标的内积唯一给出——这是 Gelfand-Naimark 定理在群代数上的直接推论。由此建立了 Banach 代数的抽象谱理论与 LCA 群上调和分析的等价性。

该观点统一了经典 Fourier 分析（$G = \mathbb{R}$）、Fourier 级数（$G = \mathbb{T}$）和离散 Fourier 分析（$G = \mathbb{Z}$）：三者分别对应于 $L^1(\mathbb{R})$、$\ell^1(\mathbb{Z})$（卷积）和 $L^1(\mathbb{T})$ 的 Gelfand 变换。


---

---

---

---

---

## 第140章（补充）
> von Neumann 代数（$W^*$-代数）是算子代数的核心理论，由 John von Neumann 在 1929 年引入。本卷在 C*-代数（V14 泛函分析）和 Banach 代数（V31 上半部分）的基础上，建立 von Neumann 代数的基本理论：因子分类（I、II$_1$、II$_\infty$、III 型）、Tomita-Takesaki 模理论和 III 型因子的 Connes 分类。von Neumann 代数在量子场论和自由概率论中有深刻应用。

> **前置知识**：本子卷核心为算子代数理论，需先掌握本卷第128-134章中的Banach空间、Hilbert空间和C*-代数等核心内容，以及第55章（线性代数）中关于内积空间和谱定理的部分。

---

---

---

---

---

## 第141章：von Neumann 代数基础
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

---

---


*卷十五：泛函分析终。*
