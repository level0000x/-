## 第114章：Hilbert 空间
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

**证明**：平行四边形法则：$\|x + y\|^2 + \|x - y\|^2 = (\|x\|^2 + 2\Re\langle x,y\rangle + \|y\|^2) + (\|x\|^2 - 2\Re\langle x,y\rangle + \|y\|^2) = 2(\|x\|^2 + \|y\|^2)$。实极化恒等式：$\|x + y\|^2 - \|x - y\|^2 = (\|x\|^2 + 2\langle x,y\rangle + \|y\|^2) - (\|x\|^2 - 2\langle x,y\rangle + \|y\|^2) = 4\langle x,y\rangle$。复极化恒等式：直接展开 $\sum_{k=0}^3 i^k \|x + i^k y\|^2$，利用 $\sum i^k = 0$ 和 $\sum |i^k|^2 = 4$ 化简得 $4\langle x,y\rangle$。$\blacksquare$

**定理 73.3**（Jordan-von Neumann 定理）：赋范空间 $(X, \|\cdot\|)$ 的范数由内积诱导当且仅当范数满足平行四边形法则。此时内积可由极化恒等式恢复。

**证明**：（$\Rightarrow$）由定理 73.2，内积范数满足平行四边形法则。（$\Leftarrow$）在实情形定义 $\langle x, y \rangle = \frac{1}{4}(\|x+y\|^2 - \|x-y\|^2)$。由平行四边形法则可验证：对称性显然；$\langle x, x \rangle = \|x\|^2 \geq 0$；加性：利用平行四边形法则展开 $\langle x+y, z \rangle$ 得 $\langle x, z \rangle + \langle y, z \rangle$；齐次性：先对整数和有理数成立，由连续性推广到实数。复情形类似。$\blacksquare$

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

**证明**：设 $H$ 可分且有正交规范基 $\{e_n\}_{n=1}^\infty$（由定理 73.7 及可分性，基可数）。定义映射 $U: H \to \ell^2$ 为 $Ux = (\langle x, e_n \rangle)_{n=1}^\infty$。由 Parseval 恒等式，$\|Ux\|_{\ell^2}^2 = \sum |\langle x, e_n \rangle|^2 = \|x\|^2$，故 $U$ 为等距嵌入。满射性：对任意 $(c_n) \in \ell^2$，令 $x = \sum c_n e_n$（在 $H$ 中收敛，因 $\sum|c_n|^2 < \infty$），则 $Ux = (c_n)$。故 $U$ 为等距同构。$\blacksquare$

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