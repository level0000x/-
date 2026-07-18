## 第113章：Banach 空间
Banach 空间是完备的赋范向量空间，是泛函分析最基本的框架。Hahn-Banach、开映射、闭图像和一致有界原理被称为 Banach 空间的四大基本定理。

### 72.1 赋范空间与 Banach 空间

**定义 72.1**（赋范空间）：设 $X$ 是数域 $\mathbb{K}$（$\mathbb{R}$ 或 $\mathbb{C}$）上的向量空间。映射 $\|\cdot\|: X \to [0, \infty)$ 称为 $X$ 上的一个**范数**，如果满足：

1. $\|x\| = 0 \Leftrightarrow x = 0$（正定性）
2. $\|\alpha x\| = |\alpha| \|x\|$（齐次性）
3. $\|x + y\| \leq \|x\| + \|y\|$（三角不等式）

$(X, \|\cdot\|)$ 称为**赋范向量空间**。范数诱导度量 $d(x, y) = \|x - y\|$ 和拓扑。

**定义 72.2**（Banach 空间）：完备的赋范向量空间称为 **Banach 空间**。即每个 Cauchy 序列都收敛。

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