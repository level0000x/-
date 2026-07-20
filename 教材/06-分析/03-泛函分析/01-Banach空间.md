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

**证明**：设 $X$ 是 $n$ 维赋范空间，取基 $\{e_1, \ldots, e_n\}$。定义欧氏范数 $\|\sum a_i e_i\|_2 = (\sum |a_i|^2)^{1/2}$。对任意范数 $\|\cdot\|$，由三角不等式和 Cauchy-Schwarz 得 $\|x\| \leq C\|x\|_2$。函数 $x \mapsto \|x\|$ 在单位球面 $S = \{x : \|x\|_2 = 1\}$ 上连续且严格正，由紧致性得 $c = \inf_S \|x\| > 0$，故 $\|x\| \geq c\|x\|_2$。$\blacksquare$

### 72.2 有界线性算子

**定义 72.4**（有界线性算子）：设 $X, Y$ 是赋范空间。线性算子 $T: X \to Y$ 称为**有界的**，如果存在 $M \geq 0$ 使得 $\|Tx\| \leq M\|x\|$ 对所有 $x \in X$ 成立。$T$ 的**算子范数**定义为

$$\|T\| = \sup_{\|x\| \leq 1} \|Tx\| = \sup_{\|x\| = 1} \|Tx\|$$

**命题 72.2**：线性算子 $T: X \to Y$ 有界当且仅当 $T$ 连续，当且仅当 $T$ 在 $0$ 处连续。

**证明**：若有界，则 $\|Tx - Ty\| = \|T(x-y)\| \leq \|T\| \|x-y\|$，故 Lipschitz 连续。若在 $0$ 处连续，则存在 $\delta > 0$ 使 $\|x\| < \delta \Rightarrow \|Tx\| < 1$。对任意 $x$，$\|T(\delta x/(2\|x\|))\| < 1$，故 $\|Tx\| < (2/\delta)\|x\|$。$\blacksquare$

**定义 72.5**（算子空间）：$X$ 到 $Y$ 的所有有界线性算子构成向量空间，记作 $\mathcal{B}(X, Y)$。配以算子范数，$\mathcal{B}(X, Y)$ 是赋范空间。若 $Y$ 是 Banach 空间，则 $\mathcal{B}(X, Y)$ 也是 Banach 空间。特别地，$X^* = \mathcal{B}(X, \mathbb{K})$ 称为 $X$ 的**对偶空间**（或共轭空间）。

**定理 72.3**（Banach-Steinhaus 一致有界原理）：设 $X$ 是 Banach 空间，$Y$ 是赋范空间，$\{T_\alpha\}_{\alpha \in A} \subseteq \mathcal{B}(X, Y)$。若对每个 $x \in X$，$\sup_{\alpha} \|T_\alpha x\| < \infty$，则 $\sup_{\alpha} \|T_\alpha\| < \infty$。

**证明**：使用 Baire 纲定理。对每个 $n \in \mathbb{N}$，定义 $F_n = \{x \in X : \sup_\alpha \|T_\alpha x\| \leq n\}$。$F_n$ 是闭集，且 $X = \bigcup_{n} F_n$。由 Baire 纲定理，存在 $n_0$ 使 $F_{n_0}$ 有内点。设 $B(x_0, r) \subseteq F_{n_0}$。对任意 $\|x\| \leq r$，$x_0 + x \in F_{n_0}$，故 $\|T_\alpha x\| \leq \|T_\alpha(x_0 + x)\| + \|T_\alpha x_0\| \leq 2n_0$。因此 $\|T_\alpha\| \leq 2n_0/r$ 对所有 $\alpha$ 成立。$\blacksquare$

### 72.3 Hahn-Banach 定理

**定理 72.4**（Hahn-Banach 延拓定理，实情形）：设 $X$ 是实向量空间，$p: X \to \mathbb{R}$ 满足 $p(x+y) \leq p(x) + p(y)$ 和 $p(tx) = tp(x)$ 对 $t \geq 0$（次线性泛函）。设 $M \subseteq X$ 是子空间，$f: M \to \mathbb{R}$ 是线性泛函满足 $f(x) \leq p(x)$ 对所有 $x \in M$。则存在 $f$ 的线性延拓 $F: X \to \mathbb{R}$ 使得 $F(x) \leq p(x)$ 对所有 $x \in X$ 成立。

**证明**：使用 Zorn 引理。考虑所有保持 $f$ 且满足 $F(x) \leq p(x)$ 的延拓构成的偏序集（按包含关系）。由 Zorn 引理存在极大延拓 $F$，定义域为 $M'$。若 $M' \neq X$，取 $x_0 \notin M'$。需定义 $F(x_0)$ 使得对任意 $y, z \in M'$：

$$F(y) + F(x_0) \leq p(y + x_0), \quad F(z) - F(x_0) \leq p(z - x_0)$$

这等价于 $F(z) - p(z - x_0) \leq F(x_0) \leq p(y + x_0) - F(y)$。由 $f(y) + f(z) = f(y+z) \leq p(y+z) \leq p(y+x_0) + p(z-x_0)$，知上确界不大于下确界，故可取 $F(x_0)$ 为中间值。在 $M' \oplus \mathbb{R}x_0$ 上延拓，与极大性矛盾。$\blacksquare$

**定理 72.5**（Hahn-Banach 定理，赋范空间版本）：设 $X$ 是赋范空间，$M \subseteq X$ 是子空间，$f \in M^*$。则存在 $F \in X^*$ 使得 $F|_M = f$ 且 $\|F\| = \|f\|$。

**证明**：取 $p(x) = \|f\| \|x\|$（次线性），则 $|f(x)| \leq p(x)$ 在 $M$ 上。由 Hahn-Banach 定理存在 $F$ 满足 $F(x) \leq p(x)$。由 $F(-x) = -F(x) \leq p(-x) = p(x)$ 得 $|F(x)| \leq p(x) = \|f\| \|x\|$，故 $\|F\| \leq \|f\|$。反向不等式显然。$\blacksquare$

**推论 72.6**（Hahn-Banach 推论）：
1. 对任意 $x \in X, x \neq 0$，存在 $f \in X^*$ 使得 $\|f\| = 1$ 且 $f(x) = \|x\|$。
2. $X^*$ 分离 $X$ 中的点：若 $x \neq y$，则存在 $f \in X^*$ 使 $f(x) \neq f(y)$。
3. $\|x\| = \sup_{\|f\| \leq 1} |f(x)|$。

### 72.4 开映射定理与闭图像定理

**定理 72.7**（开映射定理）：设 $X, Y$ 是 Banach 空间，$T \in \mathcal{B}(X, Y)$ 是满射。则 $T$ 是开映射（即将开集映为开集）。特别地，若 $T$ 是连续双射，则 $T^{-1}$ 连续，即 $T$ 是同胚（从而 $T$ 是 Banach 空间同构）。

**证明**：证 $T(B_X(0, 1))$ 包含 $B_Y(0, r)$ 对某个 $r > 0$。由满射性和 Baire 纲定理，存在 $n$ 使 $\overline{T(B_X(0, n))}$ 有内点。则 $\overline{T(B_X(0, 1))}$ 包含某球 $B_Y(y_0, \delta)$。由对称性得 $B_Y(0, \delta) \subseteq \overline{T(B_X(0, 2))}$。再由完备性迭代可得 $B_Y(0, \delta/2) \subseteq T(B_X(0, 1))$。$\blacksquare$

**定理 72.8**（闭图像定理）：设 $X, Y$ 是 Banach 空间，$T: X \to Y$ 是线性算子。则 $T$ 有界当且仅当 $T$ 的图像 $\Gamma(T) = \{(x, Tx) : x \in X\}$ 是 $X \times Y$（配以范数 $\|(x, y)\| = \|x\| + \|y\|$）中的闭集。

**证明**：($\Rightarrow$) 若 $T$ 有界，设 $(x_n, Tx_n) \to (x, y)$，则 $x_n \to x$，由连续性 $Tx_n \to Tx$，故 $y = Tx$，$\Gamma(T)$ 闭。

($\Leftarrow$) 若 $\Gamma(T)$ 闭，则 $\Gamma(T)$ 是 Banach 空间 $X \times Y$ 的闭子空间，从而是 Banach 空间。投影 $\pi_1: \Gamma(T) \to X$，$\pi_1(x, Tx) = x$ 是连续双射。由开映射定理，$\pi_1^{-1}$ 连续，故 $\|x\| + \|Tx\| = \|(x, Tx)\| \leq C\|x\|$，从而 $\|Tx\| \leq C\|x\|$，$T$ 有界。$\blacksquare$

### 72.5 算子空间的完备性

**定理 72.9**（$\mathcal{B}(X, Y)$ 的完备性）：设 $X$ 为赋范空间，$Y$ 为 Banach 空间。则 $\mathcal{B}(X, Y)$ 配以算子范数为 Banach 空间。

**证明**：设 $\{T_n\}$ 为 $\mathcal{B}(X, Y)$ 中的 Cauchy 列。对每个 $x \in X$，$\|T_n x - T_m x\| \leq \|T_n - T_m\| \|x\|$，故 $\{T_n x\}$ 在 $Y$ 中为 Cauchy 列。由 $Y$ 的完备性，定义 $T x = \lim_{n} T_n x$。$T$ 的线性性由极限的线性性得。由 $\{ \|T_n\| \}$ 的有界性（Cauchy 列有界），存在 $M$ 使 $\|T_n\| \leq M$，故 $\|T x\| = \lim \|T_n x\| \leq M \|x\|$，$T$ 有界。还需证 $\|T_n - T\| \to 0$：给定 $\varepsilon > 0$，取 $N$ 使 $m, n \geq N$ 时 $\|T_n - T_m\| < \varepsilon$。对 $\|x\| \leq 1$，$\|(T_n - T)x\| = \lim_m \|(T_n - T_m)x\| \leq \varepsilon$，故 $n \geq N$ 时 $\|T_n - T\| \leq \varepsilon$。$\blacksquare$

### 72.6 闭值域定理

**定理 72.10**（闭值域定理）：设 $X, Y$ 为 Banach 空间，$T \in \mathcal{B}(X, Y)$。则下列条件等价：

1. $\operatorname{ran}(T)$ 在 $Y$ 中闭；
2. $\operatorname{ran}(T^*) \subseteq X^*$ 在 $X^*$ 中闭；
3. $\operatorname{ran}(T) = (\ker T^*)^\perp$；
4. $\operatorname{ran}(T^*) = (\ker T)^\perp$。

其中 $T^* : Y^* \to X^*$ 为 $T$ 的共轭算子，$M^\perp = \{f \in X^* : f|_M = 0\}$。

**证明框架**： $(1) \Leftrightarrow (3)$：由 Hahn-Banach，闭子空间的零化子刻画保证了 $\operatorname{ran}(T) = (\ker T^*)^\perp$ 当且仅当 $\operatorname{ran}(T)$ 闭。$(3) \Rightarrow (4)$：用极化恒等式和对偶论证。$(4) \Rightarrow (2)$：$(\ker T)^\perp$ 总是弱* 闭的。完整证明需引入对偶配对和极集理论。$\blacksquare$

**推论 72.11**：$T$ 为满射当且仅当 $T^*$ 有有界逆（在 $\operatorname{ran}(T^*)$ 上），即 $\|f\| \leq C \|T^* f\|$ 对 $f \in Y^*$ 成立。

### 72.7 商空间与商范数

**定义 72.6**（商空间）：设 $X$ 为赋范空间，$M \subseteq X$ 为闭子空间。**商空间** $X / M$ 由等价类 $\dot{x} = x + M = \{x + m : m \in M\}$ 构成，配以自然向量空间结构。**商范数**定义为

$$\|\dot{x}\|_{X/M} = \inf_{m \in M} \|x + m\|_X = \operatorname{dist}(x, M)$$

**定理 72.12**（商范数的性质）：
1. $\|\cdot\|_{X/M}$ 是范数当且仅当 $M$ 闭；
2. **自然商映射** $\pi : X \to X/M$，$\pi(x) = \dot{x}$ 是范数为 $1$ 的连续线性满射，且 $\pi(B_X^\circ) = B_{X/M}^\circ$（开单位球映为开单位球），即 $\pi$ 是开映射；
3. 若 $X$ 为 Banach 空间且 $M$ 闭，则 $X/M$ 为 Banach 空间。

**证明**：（1）$\|\dot{x}\| = 0 \Leftrightarrow \operatorname{dist}(x, M) = 0 \Leftrightarrow x \in \overline{M} = M$，故正定性等价于 $M$ 闭。（2）由定义 $\|\pi(x)\| \leq \|x\|$，故 $\|\pi\| \leq 1$。对 $\|\dot{x}\| < 1$，存在 $m \in M$ 使 $\|x+m\| < 1$，故 $\pi(x+m) = \dot{x}$，得 $\pi(B_X^\circ) = B_{X/M}^\circ$。（3）用级数判别法——绝对收敛级数收敛等价于完备性，商范数下级数的收敛性由原空间传递。$\blacksquare$

**定理 72.13**（商空间的泛性质与第一同构定理）：设 $T \in \mathcal{B}(X, Y)$ 满足 $M \subseteq \ker T$。则存在唯一的 $\widetilde{T} \in \mathcal{B}(X/M, Y)$ 使得 $T = \widetilde{T} \circ \pi$，且 $\|\widetilde{T}\| = \|T\|$。特别地，

$$X / \ker T \cong \operatorname{ran}(T) \quad (\text{等距同构，若 } \operatorname{ran}(T) \text{ 闭})$$

### 72.8 有限维 Banach 空间的补充性质

**定理 72.14**（有限维赋范空间的完备刻画）：
1. 有限维赋范空间上所有范数都等价；
2. 有限维赋范空间总是 Banach 空间；
3. 有限维空间中有界闭集为紧集（Heine-Borel 性质）；
4. 赋范空间 $X$ 为有限维当且仅当 $B_X$ 为紧集（Riesz 引理）。

**证明**：（4）若 $\dim X = \infty$，Riesz 引理构造 $\{x_n\} \subseteq B_X$ 满足 $\|x_n - x_m\| \geq 1/2$（$n \neq m$），无收敛子列，故 $B_X$ 不紧。$\blacksquare$

### 72.9 Schauder 基

**定义 72.7**（Schauder 基）：Banach 空间 $X$ 中的序列 $\{e_n\}_{n=1}^\infty$ 称为 **Schauder 基**，如果对每个 $x \in X$ 存在唯一的标量序列 $\{a_n\}_{n=1}^\infty \subseteq \mathbb{K}$ 使得

$$x = \sum_{n=1}^\infty a_n e_n \quad (\text{级数依范数收敛})$$

即 $\lim_{N \to \infty} \|x - \sum_{n=1}^N a_n e_n\| = 0$。系数 $a_n = e_n^*(x)$ 由连续线性泛函 $e_n^* \in X^*$ 给出（坐标泛函）。

**命题 72.15**：若 $X$ 有 Schauder 基，则 $X$ 可分。

**证明**：所有基向量的有理系数有限线性组合构成可数稠密集。$\blacksquare$

**定理 72.16**（Schauder 基的特征）：序列 $\{e_n\}$ 为 Schauder 基当且仅当：
1. $\overline{\operatorname{span}}\{e_n\} = X$（完备性）；
2. 存在 $K \geq 1$ 使得对所有 $m < n$ 和标量 $a_k$，$\|\sum_{k=1}^m a_k e_k\| \leq K \|\sum_{k=1}^n a_k e_k\|$（基常数条件）。

此时偏和算子 $S_n(\sum a_k e_k) = \sum_{k=1}^n a_k e_k$ 一致有界：$\sup_n \|S_n\| < \infty$。当 $\|S_n\| \equiv 1$（基常数为 $1$）时称 $\{e_n\}$ 为**单调基**。

**证明**：若 $\{e_n\}$ 为 Schauder 基，则每个 $x \in X$ 有唯一展开 $x = \sum a_k e_k$。定义 $S_n(x) = \sum_{k=1}^n a_k e_k$。由 Banach-Steinhaus 定理，$\sup_n \|S_n\| = K < \infty$。对 $m < n$，$\|S_m x\| = \|S_m(S_n x)\| \leq K \|S_n x\|$，即基常数条件（2）。完备性（1）由定义保证。反之，若（1）和（2）成立，定义 $S_n$ 在 $\operatorname{span}\{e_k\}$ 上为 $S_n(\sum_{k=1}^N a_k e_k) = \sum_{k=1}^{\min(n,N)} a_k e_k$。由（2），$S_n$ 有界，常数 $\sup_n \|S_n\| \leq K$。由（1），$S_n$ 可延拓到 $X$ 上，且 $\lim S_n x = x$ 对所有 $x$ 成立，故 $\{e_n\}$ 为 Schauder 基。$\blacksquare$

**例**：$\ell^p$（$1 \leq p < \infty$）中的标准单位向量序列 $\{e_n\}$（$e_n = (\delta_{nk})_k$）是 Schauder 基。$C[0, 1]$ 中的 Schauder 基（三角形函数系）由 J. Schauder 于 1927 年构造。$L^p[0, 1]$（$1 \leq p < \infty$）中的 Haar 系为无条件基。

**定理 72.17**（Per Enflo，1973）：存在无 Schauder 基的可分 Banach 空间。此反例回答了 Banach 的经典问题（基问题）。

### 72.10 Banach 空间中的级数与无条件收敛

**定义 72.8**（无条件收敛）：Banach 空间中的级数 $\sum x_n$ 称为**无条件收敛**，如果对任意置换 $\sigma : \mathbb{N} \to \mathbb{N}$，$\sum x_{\sigma(n)}$ 收敛到相同的和。等价地，$\sum \varepsilon_n x_n$ 对任意符号 $\varepsilon_n = \pm 1$ 收敛。

**定理 72.18**（Dvoretzky-Rogers 定理）：在任意无穷维 Banach 空间中，存在无条件收敛但不绝对收敛的级数（即 $\sum \|x_n\| = \infty$ 而 $\sum x_n$ 无条件收敛）。这刻画了有限维与无穷维的根本差异。

**证明**：设 $X$ 为无穷维 Banach 空间。由 Dvoretzky 定理，对任意 $n$，存在 $X$ 的 $n$ 维子空间 $E_n$ 使得 $E_n$ 的 Banach-Mazur 距离 $d(E_n, \ell_2^n) \leq 1 + \varepsilon$。选取在 $E_n$ 中近似正交的向量序列 $\{y_n\}$：即存在 $c > 0$ 使对所有标量 $a_i$，$\|\sum a_i y_i\| \geq c (\sum |a_i|^2)^{1/2}$。设 $x_n = y_n / \sqrt{n}$，则 $\sum \|x_n\| = \sum \|y_n\|/\sqrt{n} = \infty$（因 $\|y_n\| \geq c$ 对所有 $n$）。但由正交估计，$\sum \varepsilon_n x_n$ 在 $X$ 中收敛：$\| \sum_{n=m}^N \varepsilon_n x_n \| \leq M \sum_{n=m}^N 1/n$，方差有限保证无条件收敛。因此 $\sum x_n$ 无条件收敛但不绝对收敛。$\blacksquare$

---
