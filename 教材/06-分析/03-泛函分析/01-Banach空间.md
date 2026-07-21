## 第134章：Banach 空间
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

算子空间 $\mathcal{B}(X, Y)$ 的完备性是泛函分析中最为基本而又极其重要的结果之一。它保证了从任意赋范空间 $X$ 到 Banach 空间 $Y$ 的有界线性算子全体在算子范数下构成 Banach 空间。这一事实的证明体现了"逐点极限->线性结构->范数收敛"的三步推理模式，是泛函分析中许多完备性结果的雏形。从拓扑角度看，$\mathcal{B}(X, Y)$ 的完备性等价于有界线性算子空间的"遗传完备性"：只要目标空间 $Y$ 是完备的，算子空间就自动完备，而不需要对 $X$ 施加完备性要求。这一现象与一致收敛空间的性质密切相关——在紧集上一致收敛的连续函数空间总是完备的，即使定义域是局部紧空间而非完备空间。算子空间完备性的一个重要应用是构造 Banach 空间的极限和归纳极限：利用 $\mathcal{B}(X, Y)$ 的完备性，可以证明 Banach 空间范畴中存在任意小的极限和归纳极限。此外，$\mathcal{B}(X) = \mathcal{B}(X, X)$ 不仅是 Banach 空间，还是 Banach 代数（以算子复合为乘法，满足 $\|ST\| \leq \|S\| \|T\|$），这使得 Banach 代数理论（谱理论、Gelfand 变换等）可以自然地应用于算子理论。在算子空间的完备性基础上，可以进一步研究算子的强收敛与弱收敛：Banach-Steinhaus 一致有界原理（定理 72.3）提供了一种从逐点有界性推断一致有界性的方法，而这本质上依赖于 $\mathcal{B}(X, Y)$ 中 Cauchy 序列的完备性。

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

**证明**：定义 $\widetilde{T}(\dot{x}) = T(x)$，其中 $\dot{x} = x + M$。由 $M \subseteq \ker T$，此定义与代表元选取无关，即若 $x - x' \in M$，则 $T(x - x') = 0$，故 $T(x) = T(x')$。线性性显然。范数估计：$\|\widetilde{T}(\dot{x})\| = \|T(x)\| = \|T(x+m)\| \leq \|T\| \cdot \|x+m\|$ 对所有 $m \in M$ 成立，取下确界得 $\|\widetilde{T}(\dot{x})\| \leq \|T\| \cdot \|\dot{x}\|$，故 $\|\widetilde{T}\| \leq \|T\|$。反向：$\|T(x)\| = \|\widetilde{T}(\dot{x})\| \leq \|\widetilde{T}\| \cdot \|\dot{x}\| \leq \|\widetilde{T}\| \cdot \|x\|$，故 $\|T\| \leq \|\widetilde{T}\|$。因此 $\|\widetilde{T}\| = \|T\|$。取 $M = \ker T$，则 $\widetilde{T}$ 为单射，且 $\widetilde{T}$ 的像为 $\operatorname{ran}(T)$。若 $\operatorname{ran}(T)$ 闭，则 $\widetilde{T}$ 为 $X/\ker T$ 到 $\operatorname{ran}(T)$ 的等距同构。$\blacksquare$

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

**证明**（Enflo 构造概要）：Enflo 构造了一个可分的自反 Banach 空间，它不具有逼近性质（approximation property）。具体地，考虑 $\ell^2$ 上的一个特定范数，该范数由无穷多个非交换的有限维扰动定义。Grothendieck 曾证明：若一个 Banach 空间有 Schauder 基，则它具有有界逼近性质（BAP）。Enflo 的构造产生了一个不具有逼近性质的 Banach 空间，从而否定了基问题。构造的核心是使用「Enflo 负解」中的组合论证：在 $\ell^2$ 上定义一个新的范数 $\|\cdot\|_E$，使得由有限秩算子逼近恒等算子的均匀有界性失效。通过精心选择有限维子空间的递增序列 $\{E_n\}$ 和投影 $\{P_n\}$（其中 $P_n$ 是到 $E_n$ 的投影），并利用「扩张性质」（expansion property）确保 $\|P_n\| \to \infty$，从而破坏了逼近性质。$\blacksquare$

### 72.10 Banach 空间中的级数与无条件收敛

**定义 72.8**（无条件收敛）：Banach 空间中的级数 $\sum x_n$ 称为**无条件收敛**，如果对任意置换 $\sigma : \mathbb{N} \to \mathbb{N}$，$\sum x_{\sigma(n)}$ 收敛到相同的和。等价地，$\sum \varepsilon_n x_n$ 对任意符号 $\varepsilon_n = \pm 1$ 收敛。

**定理 72.18**（Dvoretzky-Rogers 定理）：在任意无穷维 Banach 空间中，存在无条件收敛但不绝对收敛的级数（即 $\sum \|x_n\| = \infty$ 而 $\sum x_n$ 无条件收敛）。这刻画了有限维与无穷维的根本差异。

**证明**：设 $X$ 为无穷维 Banach 空间。由 Dvoretzky 定理，对任意 $n$，存在 $X$ 的 $n$ 维子空间 $E_n$ 使得 $E_n$ 的 Banach-Mazur 距离 $d(E_n, \ell_2^n) \leq 1 + \varepsilon$。选取在 $E_n$ 中近似正交的向量序列 $\{y_n\}$：即存在 $c > 0$ 使对所有标量 $a_i$，$\|\sum a_i y_i\| \geq c (\sum |a_i|^2)^{1/2}$。设 $x_n = y_n / \sqrt{n}$，则 $\sum \|x_n\| = \sum \|y_n\|/\sqrt{n} = \infty$（因 $\|y_n\| \geq c$ 对所有 $n$）。但由正交估计，$\sum \varepsilon_n x_n$ 在 $X$ 中收敛：$\| \sum_{n=m}^N \varepsilon_n x_n \| \leq M \sum_{n=m}^N 1/n$，方差有限保证无条件收敛。因此 $\sum x_n$ 无条件收敛但不绝对收敛。$\blacksquare$

---

---

## 第135章：对偶空间与弱拓扑

本章研究 Banach 空间的对偶空间、二次对偶和弱拓扑，这些是研究无穷维空间紧致性的关键工具。

### 74.1 对偶空间与二次对偶

**定义 74.1**（对偶空间）：设 $X$ 为 $\mathbb{K}$（$\mathbb{R}$ 或 $\mathbb{C}$）上的赋范空间。$X$ 的**对偶空间**（或共轭空间）定义为

$$X^* = \mathcal{B}(X, \mathbb{K})$$

即 $X$ 上所有有界线性泛函的集合，配以算子范数 $\|f\|_{X^*} = \sup_{\|x\| \leq 1} |f(x)|$。$X^*$ 总是 Banach 空间（即使 $X$ 不完备）。

**定义 74.2**（二次对偶与自然嵌入）：$X^{**} = (X^*)^*$ 是 $X$ 的**二次对偶**。**自然嵌入** $J : X \to X^{**}$ 定义为

$$J(x)(f) = f(x), \quad \forall f \in X^*$$

由 Hahn-Banach 推论，$\|J(x)\|_{X^{**}} = \sup_{\|f\| \leq 1} |f(x)| = \|x\|_X$，故 $J$ 是等距嵌入。

**定义 74.3**（自反空间）：Banach 空间 $X$ 称为**自反的**，如果自然嵌入 $J : X \to X^{**}$ 是满射（从而是等距同构）。记作 $X \cong X^{**}$。

**命题 74.1**：自反空间的闭子空间是自反的。$X$ 自反当且仅当 $X^*$ 自反。

### 74.2 弱拓扑与弱* 拓扑

在无穷维 Banach 空间中，有界闭集不一定紧致（例如单位球面不是紧致的）。弱拓扑和弱* 拓扑提供了更粗的拓扑，使得某些集合变得紧致。

**定义 74.4**（弱拓扑）：$X$ 上的**弱拓扑** $\sigma(X, X^*)$ 是使所有 $f \in X^*$ 连续的最弱拓扑。其子基为 $\{f^{-1}(U) : f \in X^*, U \subseteq \mathbb{K} \text{ 开}\}$。

网 $(x_\alpha)$ 弱收敛到 $x$（记作 $x_\alpha \rightharpoonup x$）当且仅当 $f(x_\alpha) \to f(x)$ 对所有 $f \in X^*$ 成立。

**定义 74.5**（弱* 拓扑）：$X^*$ 上的**弱* 拓扑** $\sigma(X^*, X)$ 是使所有 $J(x)$（$x \in X$）连续的最弱拓扑。即 $f_\alpha \xrightarrow{w^*} f$ 当且仅当 $f_\alpha(x) \to f(x)$ 对所有 $x \in X$。

**命题 74.2**：弱拓扑和弱* 拓扑是 Hausdorff 拓扑。若 $X$ 自反，则 $\sigma(X^*, X) = \sigma(X^*, X^{**})$，即弱* 拓扑与弱拓扑一致。

**定理 74.3**（Banach-Alaoglu 定理）：$X^*$ 中的闭单位球 $B_{X^*} = \{f \in X^* : \|f\| \leq 1\}$ 在弱* 拓扑下是紧致的。

**证明**：考虑映射 $\Phi : B_{X^*} \to \prod_{x \in X} [-\|x\|, \|x\|]$ 定义为 $\Phi(f) = (f(x))_{x \in X}$。$\Phi$ 是单射且是到其像的同胚（$B_{X^*}$ 赋予弱* 拓扑，乘积空间赋予积拓扑）。由 Tychonoff 定理，乘积空间紧致。仅需验证 $\Phi(B_{X^*})$ 在积拓扑中为闭集：若网 $\Phi(f_\alpha)$ 收敛到 $(a_x)_{x \in X}$，则线性泛函 $f(x) := a_x$ 满足 $|f(x)| \leq \|x\|$（故 $\|f\| \leq 1$），且 $f_\alpha \xrightarrow{w^*} f$，故 $(a_x) = \Phi(f) \in \Phi(B_{X^*})$。紧空间的闭子集紧致。$\blacksquare$

**定理 74.4**（Goldstine 定理）：$J(B_X)$ 在 $B_{X^{**}}$ 中弱* 稠密。即单位球的像在二次对偶的单位球中稠密。

**证明**：设 $F \in B_{X^{**}}$。对任意弱* 邻域 $W = \{\Phi \in X^{**} : |\Phi(f_i) - F(f_i)| < \varepsilon, i=1,\ldots,n\}$，需找到 $x \in B_X$ 使 $J(x) \in W$，即 $|f_i(x) - F(f_i)| < \varepsilon$。由 Helly 定理（Hahn-Banach 的推论），这在 $F \in B_{X^{**}}$ 的条件下恒可能。$\blacksquare$

**推论 74.5**：$X$ 自反当且仅当 $B_X$ 在弱拓扑下紧致。

**证明**：若 $X$ 自反，$J(B_X) = B_{X^{**}}$，由 Banach-Alaoglu 定理在弱* 拓扑下紧致，而 $X$ 自反时弱* 拓扑等于弱拓扑。反之，若 $B_X$ 弱紧致，则 $J(B_X)$ 弱* 紧致从而弱* 闭，由 Goldstine 定理得 $J(B_X) = B_{X^{**}}$。$\blacksquare$

### 74.3 凸集的分离与 Krein-Milman 定理

**定理 74.6**（凸集分离定理 / Hahn-Banach 定理的几何形式）：设 $A, B$ 是 Banach 空间的非空不交凸集，$A$ 是开集。则存在 $f \in X^*$ 和 $\alpha \in \mathbb{R}$ 使得 $\Re f(a) < \alpha \leq \Re f(b)$ 对所有 $a \in A, b \in B$。

**证明**：固定 $a_0 \in A, b_0 \in B$。令 $C = A - B + (b_0 - a_0) = \{a - b + b_0 - a_0 : a \in A, b \in B\}$。则 $C$ 是开凸集且 $0 \in C$。定义 $C$ 的 Minkowski 泛函 $p(x) = \inf\{t > 0 : x \in tC\}$。$p$ 是次线性泛函。由于 $a_0 - b_0 \notin C$（否则 $A \cap B \neq \emptyset$），$p(a_0 - b_0) \geq 1$。在一维子空间 $\mathbb{R} \cdot (a_0 - b_0)$ 上定义线性泛函 $\ell(t(a_0 - b_0)) = t \cdot p(a_0 - b_0)$，则 $\ell \leq p$。由 Hahn-Banach 延拓定理，存在 $f \in X^*$ 满足 $f(x) \leq p(x)$ 对所有 $x$。取 $\alpha = \inf_{b \in B} \Re f(b)$，则对所有 $a \in A, b \in B$，$\Re f(a) < \alpha \leq \Re f(b)$。$\blacksquare$

**定理 74.7**（Mazur 定理）：设 $x_n \rightharpoonup x$（弱收敛）。则存在凸组合序列 $\sum_{k=1}^{N_n} \lambda_k^{(n)} x_k$（$\lambda_k^{(n)} \geq 0, \sum \lambda_k^{(n)} = 1$）强收敛到 $x$。

**证明**：$x$ 属于 $\{x_n\}$ 的弱闭包的凸包。由凸集的弱闭等于强闭，$x$ 属于强闭凸包，故存在凸组合序列强收敛。$\blacksquare$

**定义 74.6**（极点）：设 $K$ 是向量空间的凸集。$x \in K$ 称为 $K$ 的**极点**（extreme point），如果 $x$ 不能表示为 $K$ 中两个不同点的严格凸组合，即若 $x = ty + (1-t)z$（$t \in (0, 1), y, z \in K$），则 $y = z = x$。$K$ 的极点集记作 $\operatorname{ext}(K)$。

**定理 74.8**（Krein-Milman 定理）：设 $K$ 是局部凸空间中的非空紧致凸集。则 $K = \overline{\operatorname{conv}}(\operatorname{ext}(K))$，即 $K$ 是其极点的闭凸包。

**证明**：设 $E = \overline{\operatorname{conv}}(\operatorname{ext}(K))$。显然 $E \subseteq K$。若 $E \neq K$，取 $x_0 \in K \setminus E$。由 Hahn-Banach 分离定理，存在连续线性泛函 $f$ 和 $\alpha \in \mathbb{R}$ 使得 $\Re f(x) \leq \alpha < \Re f(x_0)$ 对所有 $x \in E$。定义 $M = \{x \in K : \Re f(x) = \max_{y \in K} \Re f(y)\}$。由于 $K$ 紧致，$\max$ 可达。$M$ 是 $K$ 的非空紧致凸真子集（称为 $K$ 的一个「面」）。由 Zorn 引理，$K$ 的紧致凸真子集族中存在极小元 $M_0$。若 $M_0$ 含有两个不同点，则存在分离它们的泛函，与 $M_0$ 的极小性矛盾。故 $M_0$ 为单点集 $\{x^*\}$，且 $x^* \in \operatorname{ext}(K)$。但 $x_0 \in M$ 且 $x^* \in M$，故 $\Re f(x^*) = \max$。然而由构造，$x^* \in E$ 时有 $\Re f(x^*) \leq \alpha < \Re f(x_0)$，而 $x_0 \in K$ 时 $\Re f(x_0) \leq \max$，矛盾。因此 $E = K$。$\blacksquare$

### 74.4 Hahn-Banach 定理的完整形式

**定理 74.9**（Hahn-Banach 控制延拓定理，实情形）：设 $X$ 为实向量空间，$p : X \to \mathbb{R}$ 为次线性泛函，即满足

$$p(x + y) \leq p(x) + p(y), \quad p(tx) = t p(x) \; (\forall t \geq 0)$$

设 $M \subseteq X$ 为子空间，$f : M \to \mathbb{R}$ 为线性泛函满足 $f(x) \leq p(x)$ 对所有 $x \in M$。则存在 $f$ 的线性延拓 $F : X \to \mathbb{R}$ 使得 $F(x) \leq p(x)$ 对所有 $x \in X$。

**证明**：考虑所有满足 $g$ 线性、包含 $f$ 且 $g \leq p$ 的延拓 $(M_g, g)$ 构成的集合 $\mathcal{P}$。定义偏序 $(M_1, g_1) \preceq (M_2, g_2)$ 当且仅当 $M_1 \subseteq M_2$ 且 $g_2|_{M_1} = g_1$。$\mathcal{P}$ 中每个链的上界为并集上的自然延拓。由 Zorn 引理，存在极大元 $(M', F)$。

若 $M' \neq X$，取 $x_0 \in X \setminus M'$。对任意 $y, z \in M'$，

$$F(y) + F(z) = F(y+z) \leq p(y+z) \leq p(y-x_0) + p(z+x_0)$$

移项得 $F(y) - p(y - x_0) \leq p(z + x_0) - F(z)$。令

$$a = \sup_{y \in M'} \left( F(y) - p(y - x_0) \right), \quad b = \inf_{z \in M'} \left( p(z + x_0) - F(z) \right)$$

则 $a \leq b$。选取 $F(x_0) \in [a, b]$，在 $M' \oplus \mathbb{R}x_0$ 上线性延拓 $F$。对任意 $t > 0$，

$$F(m + t x_0) = F(m) + tF(x_0) \leq F(m) + t\left(p\left(\frac{m}{t} + x_0\right) - F\left(\frac{m}{t}\right)\right) = p(m + t x_0)$$

$t < 0$ 时用 $a$ 的定义同样得证。故 $(M' \oplus \mathbb{R}x_0, F)$ 严格大于 $(M', F)$，与极大性矛盾。因此 $M' = X$。$\blacksquare$

**定理 74.10**（Hahn-Banach 复数形式）：设 $X$ 为复向量空间，$p$ 为半范数（$p(x+y) \leq p(x)+p(y)$，$p(\lambda x)=|\lambda|p(x)$）。设 $M \subseteq X$ 为子空间，$f : M \to \mathbb{C}$ 为复线性泛函满足 $|f(x)| \leq p(x)$。则存在复线性延拓 $F : X \to \mathbb{C}$ 满足 $|F(x)| \leq p(x)$。

**证明**：令 $g = \Re f$（实线性泛函），$g(x) \leq p(x)$。由实情形延拓 $g$ 为 $G$ 满足 $G \leq p$。定义 $F(x) = G(x) - i G(ix)$。验证 $F$ 为复线性且 $F|_M = f$。对 $|F(x)|$，写 $F(x) = e^{i\theta} |F(x)|$，则 $|F(x)| = F(e^{-i\theta}x) = \Re F(e^{-i\theta}x) = G(e^{-i\theta}x) \leq p(e^{-i\theta}x) = p(x)$。$\blacksquare$

**定理 74.11**（赋范空间保范延拓）：设 $X$ 为赋范空间，$M \subseteq X$ 为子空间，$f \in M^*$。则存在保范延拓 $F \in X^*$，即 $F|_M = f$ 且 $\|F\|_{X^*} = \|f\|_{M^*}$。

**证明**：取 $p(x) = \|f\|_{M^*} \cdot \|x\|$。$p$ 为半范数（实情形为次线性泛函），且 $|f(x)| \leq p(x)$ 在 $M$ 上成立。由定理 74.9（或 74.10）得 $F$ 满足 $|F(x)| \leq \|f\| \cdot \|x\|$，故 $\|F\| \leq \|f\|$。反向不等式显然因 $F$ 延拓 $f$。$\blacksquare$

**推论 74.12**（Hahn-Banach 推论）：对任意 $x \in X \setminus \{0\}$，存在 $f \in X^*$ 使得 $\|f\| = 1$ 且 $f(x) = \|x\|$。故 $X^*$ 分离 $X$ 中的点，且 $\|x\| = \sup_{\|f\| \leq 1} |f(x)|$。

**定理 74.13**（分离超平面定理 —— Hahn-Banach 几何形式）：设 $A, B$ 为实赋范空间 $X$ 中两个非空不交凸集，$A$ 为开集。则存在 $f \in X^* \setminus \{0\}$ 和 $\alpha \in \mathbb{R}$ 使得

$$f(a) < \alpha \leq f(b), \quad \forall a \in A, \forall b \in B$$

**证明**：取 $a_0 \in A, b_0 \in B$，令 $C = A - B + (b_0 - a_0)$。$C$ 为开凸集，$0 \in C$。定义 Minkowski 泛函 $p_C(x) = \inf\{t > 0 : x/t \in C\}$，则 $p_C$ 为次线性泛函。令 $z = b_0 - a_0 \notin C$（否则 $b_0 \in A$），有 $p_C(z) \geq 1$。在 $\mathbb{R}z$ 上定义 $f_0(tz) = t$，$f_0(tz) \leq p_C(tz)$ 对 $t \geq 0$ 成立。由 Hahn-Banach 延拓为 $f$ 满足 $f \leq p_C$。在 $C$ 上 $f \leq p_C < 1$，在 $z$ 处 $f(z) = 1$。对 $a \in A, b \in B$，因 $a - b + z \in C$，得 $f(a-b) + 1 = f(a-b+z) < 1$，故 $f(a) < f(b)$。令 $\alpha = \sup_A f$。$\blacksquare$

### 74.5 弱拓扑的半范数结构与自反性

**定义 74.7**（弱拓扑 $\sigma(X, X^*)$ 的半范数族）：弱拓扑 $\sigma(X, X^*)$ 是由半范数族

$$\mathcal{P}_w = \left\{ p_f(x) = |f(x)| : f \in X^* \right\}$$

生成的局部凸拓扑。原点的邻域基由形如

$$V(f_1, \ldots, f_n ; \varepsilon) = \{ x \in X : |f_i(x)| < \varepsilon, \; i = 1, \ldots, n \}$$

的集合构成，其中 $f_i \in X^*$，$n \in \mathbb{N}$，$\varepsilon > 0$。

弱收敛 $x_\alpha \rightharpoonup x$ 等价于对每个 $f \in X^*$，$f(x_\alpha) \to f(x)$。范数收敛蕴含弱收敛；当 $\dim X < \infty$ 时二者等价。

**定义 74.8**（弱* 拓扑 $\sigma(X^*, X)$ 的半范数族）：$X^*$ 上的弱* 拓扑由半范数族

$$\mathcal{P}_{w^*} = \left\{ q_x(f) = |f(x)| : x \in X \right\}$$

生成。原点的邻域基为 $W(x_1, \ldots, x_n ; \varepsilon) = \{ f \in X^* : |f(x_i)| < \varepsilon, \; i = 1, \ldots, n \}$。

弱* 收敛 $f_\alpha \xrightarrow{w^*} f$ 等价于 $f_\alpha(x) \to f(x)$ 对所有 $x \in X$。

**定理 74.14**（自反性等价条件）：设 $X$ 为 Banach 空间。下列条件等价：

1. $X$ 自反（$J : X \to X^{**}$ 为满射）；
2. $B_X$ 在弱拓扑 $\sigma(X, X^*)$ 下紧致；
3. $X^*$ 自反。

**证明**：$(1) \Rightarrow (2)$：若 $X$ 自反，则 $(B_X, \sigma(X, X^*))$ 经 $J$ 等同于 $(B_{X^{**}}, \sigma(X^{**}, X^*))$，后者为 Banach-Alaoglu 中的弱* 紧集。$(2) \Rightarrow (1)$：$J(B_X)$ 弱* 紧从而弱* 闭，由 Goldstine 稠密性知 $J(B_X) = B_{X^{**}}$。$(1) \Leftrightarrow (3)$：标准对偶论证——若 $X$ 自反则 $X^* \cong (X^{**})^* = (X^*)^{**}$。反之若 $X^*$ 自反，则 $J(X)$ 为 $X^{**}$ 的闭子空间，若 $J(X) \neq X^{**}$，由 Hahn-Banach 存在非零泛函零化 $J(X)$，与 $X^*$ 自反矛盾。$\blacksquare$

### 74.6 Mazur 引理与弱闭包

**定理 74.15**（Mazur 引理 —— 完整形式）：设 $X$ 为 Banach 空间，$C \subseteq X$ 为凸集。则 $C$ 的弱闭包等于 $C$ 的范数闭包：

$$\overline{C}^w = \overline{C}^{\|\cdot\|}$$

换言之，凸集的弱闭等于强闭。特别地，若 $\{x_n\}$ 弱收敛到 $x$，则 $x$ 属于 $\{x_n\}$ 的范数闭凸包。

**证明**：强闭蕴含弱闭（弱拓扑粗于范数拓扑），故 $\overline{C}^{\|\cdot\|} \subseteq \overline{C}^w$。反之，若 $x_0 \notin \overline{C}^{\|\cdot\|}$，由分离超平面定理（定理 74.13，作用于闭凸集 $\overline{C}^{\|\cdot\|}$ 和 $\{x_0\}$），存在 $f \in X^*$ 和 $\alpha \in \mathbb{R}$ 使得 $\Re f(x_0) > \alpha \geq \sup_{y \in C} \Re f(y)$。则 $\{x : \Re f(x) > \alpha\}$ 是 $x_0$ 的弱开邻域且与 $C$ 不交，故 $x_0 \notin \overline{C}^w$。$\blacksquare$

**推论 74.16**：若 $x_n \rightharpoonup x$，则存在凸组合 $\sum_{k=1}^{N_n} \lambda_k^{(n)} x_k$（$\lambda_k^{(n)} \geq 0, \sum \lambda_k^{(n)} = 1$）依范数收敛到 $x$。

### 74.7 Eberlein-Smulian 定理

**定理 74.17**（Eberlein-Smulian 定理）：设 $X$ 为 Banach 空间，$A \subseteq X$。则 $A$ 的弱紧性等价于 $A$ 的弱列紧性（每个序列有弱收敛子列）：

$$\sigma(X, X^*)\text{-紧} \; \Longleftrightarrow \; \sigma(X, X^*)\text{-列紧}$$

**证明要点**：$\Leftarrow$（非平凡方向）：先证 $A$ 弱闭有界（弱列紧蕴含之）。取 $A$ 的可数稠密子集，缩小至可分闭子空间 $Y \subseteq X$。关键在于：在可分 Banach 空间的单位球 $B_{Y^*}$ 上，弱* 拓扑可度量化（因 $B_Y$ 可分）。将 $A$ 中序列的弱极限视为 $C(B_{Y^*})$ 中的函数，用对角线法提取子列，从而将列紧性转化为紧性。$\Rightarrow$：类似论证，弱紧集的任意序列由 Eberlein 论证有弱收敛子列。$\blacksquare$

**推论 74.18**：$X$ 自反当且仅当 $B_X$ 中每个序列有弱收敛子列。

**证明**：若 $X$ 自反，$B_X$ 弱紧（定理 74.14），由 Eberlein-Smulian 推得弱列紧。反之，若 $B_X$ 弱列紧，则对任意 $F \in B_{X^{**}}$，由 Goldstine 定理存在 $x_n \in B_X$ 使 $J(x_n) \xrightarrow{w^*} F$；取弱收敛子列 $x_{n_k} \rightharpoonup x \in B_X$，则对任意 $f \in X^*$，$F(f) = \lim J(x_{n_k})(f) = \lim f(x_{n_k}) = f(x) = J(x)(f)$，故 $F = J(x)$，$J$ 满射。$\blacksquare$

---
