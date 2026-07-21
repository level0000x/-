## 第88章：Galois 理论

Galois 理论是代数学中最为优美和深刻的理论之一，它建立了域扩张与群论之间的精妙对应，从而将方程的根式可解性问题转化为群的可解性问题。这一理论由 Evariste Galois 于 1832 年在决斗前夕的遗书中首次阐述，后经 Liouville、Jordan、Dedekind、Artin 等人的系统整理和发展，成为现代代数学的基石。Galois 理论的核心思想是：一个域扩张的对称性（由 Galois 群刻画）完全决定了该扩张的中间域结构，从而将看似截然不同的域论问题和群论问题建立了一一对应。

### 32.1 域扩张与 Galois 群

**定义 32.1**（域扩张）：设 $K \subseteq L$ 为域。$L$ 称为 $K$ 的**域扩张**，记作 $L/K$。$L$ 可视为 $K$ 上的向量空间，其维数 $\dim_K L$ 称为扩张的**次数**，记作 $[L : K]$。

**定义 32.2**（代数扩张与有限扩张）：若每个 $\alpha \in L$ 都是 $K$ 上某个非零多项式的根，则 $L/K$ 称为**代数扩张**。若 $[L : K] < \infty$，则称为**有限扩张**。有限扩张必然是代数扩张，但反之不然（如 $\overline{\mathbb{Q}}/\mathbb{Q}$ 是代数扩张但无限次）。

**命题 32.1（次数塔公式）**：设 $K \subseteq E \subseteq L$ 为域扩张。则 $[L : K] = [L : E][E : K]$（其中无穷大按通常约定处理）。

**证明**：设 $\{\alpha_i\}_{i \in I}$ 是 $L$ 在 $E$ 上的基，$\{\beta_j\}_{j \in J}$ 是 $E$ 在 $K$ 上的基。则 $\{\alpha_i \beta_j\}_{(i,j) \in I \times J}$ 是 $L$ 在 $K$ 上的基。线性无关性：若 $\sum_{i,j} c_{ij} \alpha_i \beta_j = 0$（$c_{ij} \in K$），则 $\sum_i (\sum_j c_{ij} \beta_j) \alpha_i = 0$，括号内元素在 $E$ 中，由 $\{\alpha_i\}$ 的 $E$-线性无关性知 $\sum_j c_{ij} \beta_j = 0$，再由 $\{\beta_j\}$ 的 $K$-线性无关性得 $c_{ij} = 0$。生成性：任意 $x \in L$ 可写为 $x = \sum_i e_i \alpha_i$（$e_i \in E$），每个 $e_i = \sum_j c_{ij} \beta_j$（$c_{ij} \in K$），故 $x = \sum_{i,j} c_{ij} \alpha_i \beta_j$。$\blacksquare$

**定义 32.2'（单扩张）**：设 $\alpha \in L$。最小的包含 $K$ 和 $\alpha$ 的子域记为 $K(\alpha)$，称为 $K$ 的**单扩张**。若 $\alpha$ 在 $K$ 上代数，则 $K(\alpha) \cong K[x]/(f(x))$，其中 $f$ 是 $\alpha$ 的极小多项式，且 $[K(\alpha) : K] = \deg f$。此时 $\{1, \alpha, \ldots, \alpha^{\deg f - 1}\}$ 是 $K(\alpha)$ 在 $K$ 上的一组基。

**定义 32.3**（Galois 群）：设 $L/K$ 是域扩张。$L$ 在 $K$ 上的 **Galois 群** $\operatorname{Gal}(L/K)$ 是 $L$ 的所有保持 $K$ 中元素不动的自同构构成的群：

$$\operatorname{Gal}(L/K) = \{\sigma \in \operatorname{Aut}(L) : \sigma|_K = \operatorname{id}_K\}$$

**定理 32.0（Dedekind 无关性引理）**：设 $G$ 是群，$F$ 是域。$G$ 到 $F^\times$ 的不同群同态 $\chi_1, \ldots, \chi_n$ 在 $F$ 上线性无关。即若 $\sum_{i=1}^{n} a_i \chi_i(g) = 0$ 对所有 $g \in G$ 成立（$a_i \in F$），则 $a_1 = \cdots = a_n = 0$。

**证明**：对 $n$ 归纳。$n=1$ 时，$a_1 \chi_1(g) = 0$ 对所有 $g$ 成立，取 $g = e$ 得 $a_1 = 0$。假设对 $n-1$ 成立。若 $\sum_{i=1}^{n} a_i \chi_i(g) = 0$ 对所有 $g$，取 $h \in G$，则 $\sum_{i=1}^{n} a_i \chi_i(hg) = \sum_{i=1}^{n} a_i \chi_i(h) \chi_i(g) = 0$。乘以 $\chi_n(h)$ 并与原式相减：$\sum_{i=1}^{n-1} a_i(\chi_i(h) - \chi_n(h)) \chi_i(g) = 0$。由归纳假设，$a_i(\chi_i(h) - \chi_n(h)) = 0$ 对所有 $i < n$ 和所有 $h$。由于 $\chi_i \neq \chi_n$，存在 $h$ 使 $\chi_i(h) \neq \chi_n(h)$，故 $a_i = 0$（$i < n$）。进而 $a_n = 0$。$\blacksquare$

**推论 32.0.1**：若 $L/K$ 是有限扩张，则 $|\operatorname{Gal}(L/K)| \leq [L : K]$。

**证明**：设 $[L : K] = n$。若 $\sigma_1, \ldots, \sigma_m \in \operatorname{Gal}(L/K)$ 互不相同，将 $\sigma_i$ 视为 $L^\times$ 到 $L^\times$ 的群同态（嵌入）。由 Dedekind 引理，它们在 $L$ 上线性无关。但 $L$ 在 $K$ 上的维数为 $n$，$\operatorname{Hom}_K(L, L)$ 的维数至多为 $n$（取 $L$ 在 $K$ 上的基后，$K$-线性映射由基的像唯一确定，构成 $n$ 维向量空间）。故 $m \leq n$，即 $|\operatorname{Gal}(L/K)| \leq [L : K]$。$\blacksquare$

**定理 32.0.2（Artin 引理）**：设 $H$ 是域 $L$ 的有限自同构群，$K = L^H$ 为 $H$ 的不动域。则 $[L : K] = |H|$，且 $L/K$ 是 Galois 扩张，$\operatorname{Gal}(L/K) = H$。

**证明**：设 $|H| = n$。先证 $[L : K] \geq n$：若 $[L : K] = m < n$，取 $L$ 在 $K$ 上的基 $x_1, \ldots, x_m$。考虑齐次线性方程组 $\sum_{j=1}^{n} \sigma_j(x_i) y_j = 0$（$i = 1, \ldots, m$），$m$ 个方程，$n$ 个未知量，必有非零解 $(y_1, \ldots, y_n) \in L^n$。则对任意 $x = \sum c_i x_i \in L$（$c_i \in K$），$\sum_j \sigma_j(x) y_j = \sum_j \sigma_j(\sum_i c_i x_i) y_j = \sum_i c_i \sum_j \sigma_j(x_i) y_j = 0$。但 Dedekind 引理（视 $\sigma_j$ 为 $L^\times \to L^\times$ 的同态）要求 $\sigma_j$ 线性无关，这与 $\sum_j y_j \sigma_j = 0$（$y_j$ 不全为零）矛盾。故 $[L : K] \geq n$。

再证 $[L : K] \leq n$：对任意 $\alpha \in L$，考虑其轨道 $\{\sigma(\alpha) : \sigma \in H\}$，设不同元素为 $\alpha_1, \ldots, \alpha_r$（$r \leq n$）。则 $f(x) = \prod_{i=1}^{r} (x - \alpha_i) \in L[x]$ 的系数是 $\alpha_1, \ldots, \alpha_r$ 的初等对称多项式，在 $H$ 作用下不变，故系数在 $K = L^H$ 中。因此 $\alpha$ 在 $K$ 上的极小多项式次数 $\leq r \leq n$。由本原元素定理（见下文），$L/K$ 可由至多 $n$ 个元素生成，每个次数 $\leq n$，故 $[L : K] \leq n$。

综合得 $[L : K] = n = |H|$。$L/K$ 是 Galois 扩张（正规且可分），且 $\operatorname{Gal}(L/K) = H$（因为 $H \subseteq \operatorname{Gal}(L/K)$ 且 $|\operatorname{Gal}(L/K)| \leq [L : K] = |H|$）。$\blacksquare$

**定义 32.4**（Galois 扩张）：域扩张 $L/K$ 称为 **Galois 扩张**，如果它是正规的（每个 $K$ 上的不可约多项式若在 $L$ 中有一个根，则所有根都在 $L$ 中）且可分的（每个代数元的极小多项式无重根）。等价地，$L/K$ 是 Galois 扩张当且仅当 $L$ 是 $K$ 上一族可分多项式的分裂域。等价地，$L/K$ 是 Galois 扩张当且仅当 $L^{\operatorname{Gal}(L/K)} = K$ 且 $|\operatorname{Gal}(L/K)| = [L : K]$。

**定理 32.1**（Galois 基本定理）：设 $L/K$ 是有限 Galois 扩张，$G = \operatorname{Gal}(L/K)$。则存在一一对应：

$$\{\text{中间域 } K \subseteq E \subseteq L\} \longleftrightarrow \{G \text{ 的子群 } H\}$$

$$E \longmapsto \operatorname{Gal}(L/E) = \{g \in G : g|_E = \operatorname{id}_E\}$$

$$L^H = \{x \in L : h(x) = x,\; \forall h \in H\} \longmapsfrom H$$

满足：
1. $[L : E] = |\operatorname{Gal}(L/E)|$，$[E : K] = [G : \operatorname{Gal}(L/E)]$
2. $E/K$ 是 Galois 扩张当且仅当 $\operatorname{Gal}(L/E) \trianglelefteq G$，此时 $\operatorname{Gal}(E/K) \cong G / \operatorname{Gal}(L/E)$

**证明**：设 $G = \operatorname{Gal}(L/K)$，$|G| = [L : K]$（有限 Galois 扩张的基本性质）。第一步：对 $H \leq G$，令 $E = L^H$，则 $[L : E] = |H|$。因为 $L/L^H$ 是 Galois 扩张且 $\operatorname{Gal}(L/L^H) = H$（由 Artin 引理 32.0.2）。第二步：对中间域 $E$，$L/E$ 是 Galois 扩张，$\operatorname{Gal}(L/E) \leq G$。第三步：$L^{\operatorname{Gal}(L/E)} = E$（由 Galois 扩张的性质，不动域恰好是基域）。第四步：$\operatorname{Gal}(L/L^H) = H$（由 Artin 引理）。这建立了两个映射之间的互逆关系。正规子群对应：$E/K$ 是 Galois 扩张当且仅当 $E$ 在所有 $\sigma \in G$ 下稳定，这等价于 $\sigma \operatorname{Gal}(L/E) \sigma^{-1} = \operatorname{Gal}(L/E)$ 对所有 $\sigma \in G$，即 $\operatorname{Gal}(L/E) \trianglelefteq G$。此时 $\sigma \mapsto \sigma|_E$ 给出满同态 $G \to \operatorname{Gal}(E/K)$，核为 $\operatorname{Gal}(L/E)$，由同构定理得结论。$\blacksquare$

Galois 基本定理是代数学中最优美的定理之一。它建立了域扩张的中间域与 Galois 群的子群之间的一一对应，将域论问题转化为群论问题。这一对应的核心是"Galois 连接"（Galois connection）——更一般地，在偏序集之间的一对反变映射，这一概念在逻辑学（Godel 不完备定理的代数化）、形式概念分析和拓扑学（Stone 对偶）中都有深远推广。Galois 对应的几何意义也十分深刻：在代数几何中，不可约代数簇的函数域之间的 Galois 扩张对应于簇之间的平展覆盖（etale covering），而 Galois 群对应于覆盖变换群（deck transformation group）——这正是 Riemann 和 Klein 在 19 世纪就认识到的"代数函数论与 Riemann 面的覆盖理论"的统一。

### 32.2 可分扩张与正规扩张

**定义 32.5**（可分扩张）：代数扩张 $L/K$ 是**可分的**，如果 $L$ 的每个元素在 $K$ 上的极小多项式无重根。在特征 $0$ 时，所有代数扩张都是可分的。在特征 $p > 0$ 时，可分性等价于 $L$ 和 $K^{1/p}$ 在 $K$ 上线性不交。

**命题 32.2（可分性的判别）**：多项式 $f \in K[x]$ 无重根当且仅当 $\gcd(f, f') = 1$（$f'$ 为 $f$ 的形式导数）。在特征 $0$ 时，不可约多项式自动满足此条件。在特征 $p > 0$ 时，不可约多项式 $f$ 有重根当且仅当 $f(x) = g(x^p)$ 对某个 $g \in K[x]$ 成立。

**证明**：若 $f$ 在分裂域中有重根 $\alpha$，则 $f(x) = (x-\alpha)^2 h(x)$，$f'(x) = 2(x-\alpha)h(x) + (x-\alpha)^2 h'(x)$，故 $f'(\alpha) = 0$，$\gcd(f, f') \neq 1$。反之，若 $\gcd(f, f') = d \neq 1$，则 $d$ 的根同时是 $f$ 和 $f'$ 的根，$\alpha$ 是 $f$ 的重根。在特征 $p$ 时，若 $f$ 不可约且有重根，则 $f' = 0$（因为 $\gcd(f, f') = f$ 要求 $f \mid f'$，但 $\deg f' < \deg f$，故 $f' = 0$），这意味着 $f$ 的每一项次数都是 $p$ 的倍数，故 $f(x) = g(x^p)$。$\blacksquare$

**定理 32.2**（本原元素定理）：有限可分扩张 $L/K$ 是单扩张，即存在 $\alpha \in L$ 使得 $L = K(\alpha)$。$\alpha$ 称为**本原元素**。

**证明**：若 $K$ 是有限域，则 $L^\times$ 是循环群（由有限域的乘法群性质），任何生成元即为本原元素。若 $K$ 无限，设 $L = K(\alpha, \beta)$（可归纳），令 $f, g$ 分别为 $\alpha, \beta$ 的极小多项式。在分裂域中，设 $\alpha = \alpha_1, \ldots, \alpha_m$ 和 $\beta = \beta_1, \ldots, \beta_n$ 为 $f$ 和 $g$ 的根。选 $c \in K$ 使 $\alpha + c\beta \neq \alpha_i + c\beta_j$ 对所有 $i, j$（$c$ 只需避开有限个"坏值"）。令 $\gamma = \alpha + c\beta$，则 $\beta$ 是 $f(\gamma - cX)$ 和 $g(X)$ 在 $K(\gamma)[X]$ 中的最大公因子，故 $\beta \in K(\gamma)$，从而 $\alpha = \gamma - c\beta \in K(\gamma)$。$\blacksquare$

**定义 32.6**（正规扩张）：代数扩张 $L/K$ 是**正规的**，如果每个 $K$ 上的不可约多项式若在 $L$ 中有一个根，则所有根都在 $L$ 中。等价地，$L$ 是 $K$ 上一族多项式的分裂域。

**命题 32.3**：$L/K$ 是 Galois 扩张当且仅当 $L/K$ 是正规的且可分的。

**命题 32.4（Galois 扩张的等价刻画）**：对有限扩张 $L/K$，以下等价：
(i) $L/K$ 是 Galois 扩张
(ii) $L$ 是 $K$ 上某个可分多项式的分裂域
(iii) $|\operatorname{Gal}(L/K)| = [L : K]$
(iv) $L^{\operatorname{Gal}(L/K)} = K$

**证明**：(i) $\Rightarrow$ (ii)：$L/K$ 有限可分，由本原元素定理 $L = K(\alpha)$。设 $f$ 为 $\alpha$ 的极小多项式，$f$ 可分且在 $L$ 中分裂（正规性），故 $L$ 是 $f$ 的分裂域。(ii) $\Rightarrow$ (iii)：设 $L$ 是 $K$ 上可分多项式 $f$ 的分裂域。对 $[L : K]$ 归纳，利用 $K$-嵌入的延拓性质可证 $|\operatorname{Gal}(L/K)| = [L : K]$。(iii) $\Rightarrow$ (iv)：设 $E = L^{\operatorname{Gal}(L/K)}$。由 Artin 引理，$[L : E] = |\operatorname{Gal}(L/K)| = [L : K]$，故 $[E : K] = 1$，即 $E = K$。(iv) $\Rightarrow$ (i)：由 Artin 引理，$L/K$ 是 Galois 扩张。$\blacksquare$

**定义 32.6'（迹与范数）**：设 $L/K$ 是有限 Galois 扩张，$G = \operatorname{Gal}(L/K)$。对 $\alpha \in L$，定义
$$\operatorname{Tr}_{L/K}(\alpha) = \sum_{\sigma \in G} \sigma(\alpha), \quad \operatorname{N}_{L/K}(\alpha) = \prod_{\sigma \in G} \sigma(\alpha)$$
迹是 $K$-线性映射 $L \to K$，范数是乘法同态 $L^\times \to K^\times$。在代数数论中，迹和范数是研究整数环和分歧理论的基本工具。

**定理 32.2.5（Hilbert 定理 90，乘法形式）**：设 $L/K$ 是有限 Galois 扩张，$G = \operatorname{Gal}(L/K) = \langle \sigma \rangle$ 为循环群。若 $\alpha \in L^\times$ 满足 $\operatorname{N}_{L/K}(\alpha) = 1$，则存在 $\beta \in L^\times$ 使得 $\alpha = \beta / \sigma(\beta)$。

**证明**：由 Dedekind 无关性引理，$\{1, \sigma, \sigma^2, \ldots, \sigma^{n-1}\}$ 作为 $L$ 到 $L$ 的映射是 $L$-线性无关的。故存在 $\gamma \in L$ 使得 $\beta = \gamma + \alpha \sigma(\gamma) + \alpha \sigma(\alpha) \sigma^2(\gamma) + \cdots + \alpha \sigma(\alpha) \cdots \sigma^{n-2}(\alpha) \sigma^{n-1}(\gamma) \neq 0$。计算 $\alpha \sigma(\beta) = \alpha \sigma(\gamma) + \alpha \sigma(\alpha) \sigma^2(\gamma) + \cdots + \alpha \sigma(\alpha) \cdots \sigma^{n-1}(\alpha) \sigma^n(\gamma) = \beta$（因为 $\sigma^n = \text{id}$ 且 $\alpha \sigma(\alpha) \cdots \sigma^{n-1}(\alpha) = \operatorname{N}_{L/K}(\alpha) = 1$）。故 $\alpha = \beta / \sigma(\beta)$。$\blacksquare$

**定理 32.2.6（Hilbert 定理 90，加法形式）**：设 $L/K$ 是有限 Galois 扩张，$G = \langle \sigma \rangle$ 为循环群。若 $\alpha \in L$ 满足 $\operatorname{Tr}_{L/K}(\alpha) = 0$，则存在 $\beta \in L$ 使得 $\alpha = \beta - \sigma(\beta)$。

**证明**：由迹的满射性（可分扩张下迹非退化），可取 $\gamma \in L$ 使 $\operatorname{Tr}_{L/K}(\gamma) = 1$。令 $\beta = \alpha \sigma(\gamma) + (\alpha + \sigma(\alpha)) \sigma^2(\gamma) + \cdots + (\alpha + \sigma(\alpha) + \cdots + \sigma^{n-2}(\alpha)) \sigma^{n-1}(\gamma)$。直接计算 $\beta - \sigma(\beta) = \alpha$。$\blacksquare$

Galois 扩张的经典例子具有丰富的结构。二次扩张 $\mathbb{Q}(\sqrt{d})/\mathbb{Q}$（$d$ 为非平方整数）是 Galois 扩张，Galois 群为 $\mathbb{Z}/2\mathbb{Z}$。分圆扩张 $\mathbb{Q}(\zeta_n)/\mathbb{Q}$（$\zeta_n = e^{2\pi i/n}$）是 Galois 扩张，Galois 群为 $(\mathbb{Z}/n\mathbb{Z})^\times$，群结构由 $a \mapsto (\zeta_n \mapsto \zeta_n^a)$ 给出。这一对应是类域论和高斯互反律的出发点。对有限域 $\mathbb{F}_q$ 的 $n$ 次扩张 $\mathbb{F}_{q^n}/\mathbb{F}_q$，Galois 群为 $\mathbb{Z}/n\mathbb{Z}$，由 Frobenius 自同构 $x \mapsto x^q$ 生成。这一简单的 Galois 群结构是 Weil 猜想中 Frobenius 自同态作用的离散类比，也是 etale 上同调理论中 Frobenius 算子的代数原型。

### 32.3 方程的根式可解性

**定义 32.7**（根式扩张）：扩张 $L/K$ 称为**根式扩张**，如果存在中间域链 $K = K_0 \subseteq K_1 \subseteq \cdots \subseteq K_n = L$，使得 $K_{i+1} = K_i(\sqrt[n_i]{a_i})$（$a_i \in K_i$）。多项式 $f \in K[x]$ 称为**根式可解的**，如果存在 $f$ 的分裂域包含于某个根式扩张中。

**定义 32.7'（可解群）**：有限群 $G$ 称为**可解群**，如果存在次正规列 $G = G_0 \triangleright G_1 \triangleright \cdots \triangleright G_n = \{e\}$，使得每个商群 $G_i / G_{i+1}$ 是 Abel 群。等价地，$G$ 的导出列 $G \supseteq G' \supseteq G'' \supseteq \cdots$ 在有限步内达到 $\{e\}$。素数阶循环群是可解的，对称群 $S_n$ 对 $n \leq 4$ 可解，$S_n$ 对 $n \geq 5$ 不可解（因为 $A_n$（$n \geq 5$）是单群）。

**定理 32.2.7（Kummer 理论）**：设 $K$ 包含 $n$ 次本原单位根，且 $\operatorname{char} K \nmid n$。则 $K$ 的指数为 $n$ 的 Abel 扩张（即 Galois 群为 $n$ 阶循环群的扩张）与 $K^\times / (K^\times)^n$ 的 $n$ 阶循环子群一一对应。具体地，若 $L = K(\sqrt[n]{a})$（$a \in K^\times$），则 $\operatorname{Gal}(L/K) \cong \mathbb{Z}/n\mathbb{Z}$。

**证明**：设 $L/K$ 是 $n$ 次循环 Galois 扩张，$\operatorname{Gal}(L/K) = \langle \sigma \rangle$。设 $\zeta \in K$ 为 $n$ 次本原单位根。$\zeta \in K$ 且 $\operatorname{N}_{L/K}(\zeta) = \zeta^n = 1$。由 Hilbert 定理 90，存在 $\alpha \in L^\times$ 使得 $\zeta = \alpha / \sigma(\alpha)$。则 $\sigma(\alpha) = \zeta^{-1} \alpha$，故 $\sigma(\alpha^n) = (\zeta^{-1} \alpha)^n = \alpha^n$。因此 $a = \alpha^n \in K$（因为它是 $\sigma$ 的不动点，而 Galois 群由 $\sigma$ 生成）。又 $[K(\alpha) : K] \geq n$（因为 $\sigma^i(\alpha) = \zeta^{-i} \alpha$ 互不相同），故 $L = K(\alpha) = K(\sqrt[n]{a})$。$\blacksquare$

**定理 32.3**（Galois 判据）：$f \in K[x]$ 在特征 $0$ 的域 $K$ 上根式可解当且仅当 $f$ 的 Galois 群（即 $f$ 的分裂域 $L$ 的 $\operatorname{Gal}(L/K)$）是可解群。

**证明**：（$\Rightarrow$）设 $f$ 的分裂域 $L$ 包含于根式扩张 $E/K$。取 $E$ 为包含 $L$ 的最小 Galois 扩张。则 $\operatorname{Gal}(E/K)$ 有一列正规子群对应根式扩张链，每个商群 $\operatorname{Gal}(E_{i+1}/E_i)$ 是循环群（因添加 $p$ 次根对应于 $p$ 次循环扩张，若 $K$ 包含足够多单位根）。取商群 $\operatorname{Gal}(E/K) / \operatorname{Gal}(E/L) \cong \operatorname{Gal}(L/K)$ 也可解。（$\Leftarrow$）若 $\operatorname{Gal}(L/K)$ 可解，则存在正规子群列使商群为素数阶循环群。通过在基域中添加适当单位根，每个素数阶循环扩张可由根式扩张实现（Kummer 理论）。具体地，设 $G = G_0 \triangleright G_1 \triangleright \cdots \triangleright G_r = \{e\}$ 为合成列，$G_i/G_{i+1}$ 为素数阶循环群。对应中间域 $K = E_0 \subseteq E_1 \subseteq \cdots \subseteq E_r = L$，$E_{i+1}/E_i$ 为素数阶循环扩张。在 $E_i$ 中添加适当的单位根后，$E_{i+1}/E_i$ 成为 Kummer 扩张，从而可由根式扩张实现。$\blacksquare$

**定理 32.4**（五次方程不可解性，Abel-Ruffini 定理）：一般五次方程 $x^5 + a_4 x^4 + \cdots + a_0 = 0$ 在有理函数域 $\mathbb{C}(a_0, \ldots, a_4)$ 上不是根式可解的。其 Galois 群为对称群 $S_5$，而 $S_5$ 不是可解群（因为 $A_5$ 是非交换单群）。

**证明**：一般五次方程在 $\mathbb{C}(a_0, \ldots, a_4)$ 上的 Galois 群是 $S_5$（由对称多项式基本定理和 van der Waerden 的不可约性判别法）。$S_5$ 的合成列为 $S_5 \triangleright A_5 \triangleright \{e\}$，其中 $A_5$ 是 $60$ 阶非交换单群，故 $S_5$ 不可解。由 Galois 判据，一般五次方程不能根式求解。$\blacksquare$

**定理 32.4.1（三次方程的 Galois 群）**：设 $f(x) = x^3 + px + q \in \mathbb{Q}[x]$ 不可约，判别式 $\Delta = -4p^3 - 27q^2$。则 $f$ 的分裂域的 Galois 群为：
- $S_3$（阶 $6$），若 $\Delta$ 不是 $\mathbb{Q}$ 中的平方数
- $A_3 \cong \mathbb{Z}/3\mathbb{Z}$（阶 $3$），若 $\Delta$ 是 $\mathbb{Q}$ 中的平方数

**证明**：$\Delta = \prod_{i < j} (\alpha_i - \alpha_j)^2$，其中 $\alpha_i$ 为 $f$ 的根。$\sqrt{\Delta} = \prod_{i < j} (\alpha_i - \alpha_j)$ 在 $A_3$ 下不变，在奇置换下变号。故 $\sqrt{\Delta} \in \mathbb{Q}$ 当且仅当 Galois 群 $\subseteq A_3$。由于 $f$ 不可约，Galois 群是 $S_3$ 的可递子群，只能是 $S_3$ 或 $A_3$。$\blacksquare$

五次方程不可解性的证明是 Galois 理论最辉煌的胜利。它彻底终结了自 16 世纪意大利数学家发现三次和四次方程求根公式以来，数学家们对五次及以上方程求根公式长达三个世纪的探索。Galois 的洞察力在于：他将"根式可解"这一数论/代数问题转化为 Galois 群的群论性质（可解性），而这一转化完全通过与具体的方程脱钩——将方程视为域扩张，Galois 群视为对称性的抽象体现。这一范式转换深远影响了 20 世纪数学：代数拓扑中的覆盖空间理论（基本群与 Galois 群的类比）、代数数论中的类域论（Galois 群的 Abel 化）、乃至 Grothendieck 的远 Abel 几何（从 Galois 群恢复数域或代数曲线的几何信息），都是 Galois 基本思想的回响。

### 32.4 有限域的 Galois 理论

**定理 32.4.2（有限域的分类）**：设 $F$ 是有限域。则 $|F| = p^n$（$p$ 为素数，$n \geq 1$），且对每个 $p^n$ 存在唯一的 $p^n$ 元有限域（在同构意义下），记为 $\mathbb{F}_{p^n}$。$\mathbb{F}_{p^n}$ 是 $x^{p^n} - x$ 在 $\mathbb{F}_p$ 上的分裂域。

**定理 32.4.3（有限域的 Galois 理论）**：$\mathbb{F}_{p^n}/\mathbb{F}_p$ 是 $n$ 次 Galois 扩张，Galois 群为 $\mathbb{Z}/n\mathbb{Z}$，由 Frobenius 自同构 $\operatorname{Fr}_p: x \mapsto x^p$ 生成。$\mathbb{F}_{p^n}$ 的所有子域为 $\mathbb{F}_{p^d}$（$d \mid n$），对应 Galois 群的子群 $\langle \operatorname{Fr}_p^d \rangle \cong \mathbb{Z}/(n/d)\mathbb{Z}$。

**证明**：$\mathbb{F}_{p^n}$ 是 $x^{p^n} - x$ 的分裂域，该多项式可分（导数 $-1 \neq 0$），故 $\mathbb{F}_{p^n}/\mathbb{F}_p$ 是 Galois 扩张。$\operatorname{Fr}_p$ 是 $\mathbb{F}_{p^n}$ 的自同构，且 $\operatorname{Fr}_p^n = \text{id}$（因为 $x^{p^n} = x$ 对所有 $x \in \mathbb{F}_{p^n}$）。若 $\operatorname{Fr}_p^k = \text{id}$（$k < n$），则 $x^{p^k} = x$ 对所有 $x \in \mathbb{F}_{p^n}$，但 $x^{p^k} - x$ 至多有 $p^k$ 个根，矛盾。故 $\operatorname{Fr}_p$ 的阶为 $n$，$\operatorname{Gal}(\mathbb{F}_{p^n}/\mathbb{F}_p) = \langle \operatorname{Fr}_p \rangle \cong \mathbb{Z}/n\mathbb{Z}$。子域结构与 $\mathbb{Z}/n\mathbb{Z}$ 的子群对应。$\blacksquare$

### 32.5 分圆扩张

**定义 32.8**（分圆扩张）：设 $\zeta_n = e^{2\pi i/n}$ 为 $n$ 次本原单位根。$\mathbb{Q}(\zeta_n)/\mathbb{Q}$ 称为 $n$ 次**分圆扩张**。

**定理 32.5.1（分圆扩张的 Galois 群）**：$\mathbb{Q}(\zeta_n)/\mathbb{Q}$ 是 Galois 扩张，其次数为 $\varphi(n)$（Euler 函数），Galois 群为：
$$\operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q}) \cong (\mathbb{Z}/n\mathbb{Z})^\times$$
同构由 $a \mapsto (\sigma_a: \zeta_n \mapsto \zeta_n^a)$ 给出（$a \in (\mathbb{Z}/n\mathbb{Z})^\times$）。

**证明**：$\zeta_n$ 的极小多项式是 $n$ 次分圆多项式 $\Phi_n(x) = \prod_{1 \leq k \leq n, \gcd(k,n)=1} (x - \zeta_n^k)$，次数为 $\varphi(n)$。$\Phi_n(x) \in \mathbb{Q}[x]$（由 Gauss 引理），且 $\mathbb{Q}(\zeta_n)$ 是 $\Phi_n$ 的分裂域（包含 $\zeta_n$ 的所有共轭），故 $\mathbb{Q}(\zeta_n)/\mathbb{Q}$ 是 Galois 扩张。每个 $\sigma \in \operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q})$ 由 $\sigma(\zeta_n)$ 决定，而 $\sigma(\zeta_n)$ 必须是 $\zeta_n$ 的共轭，即 $\zeta_n^a$（$\gcd(a, n) = 1$）。映射 $\sigma \mapsto a \bmod n$ 是单同态，且两边阶均为 $\varphi(n)$，故为同构。$\blacksquare$

**推论 32.5.2（二次互反律与分圆域）**：二次域 $\mathbb{Q}(\sqrt{p^*})$（$p^* = (-1)^{(p-1)/2} p$）是 $\mathbb{Q}(\zeta_p)$ 的唯一二次子域。这建立了二次互反律与分圆域的 Galois 群之间的深刻联系，是类域论中 Kronecker-Weber 定理（$\mathbb{Q}$ 的任何 Abel 扩张都包含于某个分圆扩张中）的特殊情形。

### 32.6 Galois 逆问题与无穷 Galois 理论

**定义 32.9**（Galois 逆问题）：给定有限群 $G$ 和域 $K$，是否存在 $K$ 的 Galois 扩张 $L/K$ 使得 $\operatorname{Gal}(L/K) \cong G$？对 $K = \mathbb{Q}$，Galois 逆问题（即每个有限群是否都是 $\mathbb{Q}$ 上某个 Galois 扩张的 Galois 群）是未解决的公开问题，但对许多群类（如所有可解群、所有对称群 $S_n$ 和交错群 $A_n$、大多数散在单群）已得到肯定解答。Shafarevich 在 1954 年证明了所有可解群都可实现为 $\mathbb{Q}$ 上的 Galois 群，其证明使用了嵌入问题和数域的局部-整体原理。对有限域 $\mathbb{F}_q$，Galois 逆问题是平凡的：$\mathbb{F}_{q^n}/\mathbb{F}_q$ 的 Galois 群是 $\mathbb{Z}/n\mathbb{Z}$，而 $\mathbb{F}_q$ 上的任意有限 Galois 扩张都是这些循环扩张的合成。

**定理 32.6.1（正规基定理）**：设 $L/K$ 是有限 Galois 扩张，$G = \operatorname{Gal}(L/K)$。则存在 $\alpha \in L$ 使得 $\{\sigma(\alpha) : \sigma \in G\}$ 是 $L$ 在 $K$ 上的一组基。这样的 $\alpha$ 称为**正规基元素**。

**证明**（框架）：$L$ 是 $K[G]$-模（$G$ 通过 Galois 作用）。正规基定理等价于 $L \cong K[G]$ 作为 $K[G]$-模。由 Krull-Schmidt 定理和 $K[G]$ 的半单性（特征不整除 $|G|$ 时），只需证 $L$ 和 $K[G]$ 有相同的特征标。$\blacksquare$

**定义 32.10**（无穷 Galois 理论 / Krull 拓扑）：设 $L/K$ 是无穷 Galois 扩张（如 $\overline{\mathbb{Q}}/\mathbb{Q}$）。则 $\operatorname{Gal}(L/K)$ 配以 **Krull 拓扑**（以子群 $\operatorname{Gal}(L/E)$（$E/K$ 为有限 Galois 子扩张）为邻域基）成为 **射有限群**（profinite group）。无穷 Galois 基本定理在 Krull 拓扑下成立：中间域与闭子群一一对应。$\operatorname{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ 是绝对 Galois 群，其结构是数论中最核心的未解问题之一——理解其表示论（Langlands 纲领）和其外 Galois 表示（$\operatorname{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ 在代数基本群上的作用）是当代数论的前沿。

**证明**：无穷 Galois 扩张 $L/K$ 是所有有限 Galois 子扩张 $L_i/K$ 的正向极限。$\operatorname{Gal}(L/K) = \varprojlim \operatorname{Gal}(L_i/K)$，其中投射极限在有限群的离散拓扑下取。Krull 拓扑使 $\operatorname{Gal}(L/K)$ 成为紧 Hausdorff 全不连通拓扑群。有限 Galois 子扩张的 Galois 群形成投射系统，极限的拓扑在这个系统中就是自然的 Krull 拓扑。基本定理：对闭子群 $H$，$L^H$ 是中间域；对中间域 $E$，$\operatorname{Gal}(L/E)$ 是闭子群。这些对应是一一对应且满足 Galois 连接的所有性质。$\blacksquare$

无穷 Galois 理论是有限 Galois 理论的自然推广，其核心区别在于 Galois 群不再是有限群，而是射有限群——这一拓扑结构反映了无穷代数扩张的极限性质。射有限群的结构定理（如每个射有限群都是有限群的投射极限）使得无穷 Galois 理论中的许多问题可以约化为有限情形。$\operatorname{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})$ 的绝对 Galois 群是数学中最神秘的对象之一：它的上同调群控制着数域上的 Brauer 群、Milnor $K$-理论和 Galois 上同调中的许多深层次结构；它的表示论（特别是 $\ell$-进表示）是 Langlands 纲领的核心对象；它的外自同构群（通过 Belyi 定理）与 $\overline{\mathbb{Q}}$ 上的代数曲线的 Grothendieck-Teichmuller 群有紧密联系。绝对 Galois 群的结构至今仍是开放问题，而 Neukirch-内田定理（数域的 Galois 群完全决定了该数域的同构类）和望月新一的远 Abel 几何（从数域的绝对 Galois 群恢复该数域）则进一步揭示了 Galois 群在数论中的中心地位。

### 32.7 Galois 上同调初步

**定义 32.11**（Galois 上同调）：设 $G$ 是射有限群，$M$ 是离散 $G$-模（即 $G$ 在 $M$ 上的作用连续）。$G$ 的系数在 $M$ 中的上同调群 $H^n(G, M)$ 定义为 $M$ 的不动点函子的右导出函子。特别地，$H^0(G, M) = M^G$，$H^1(G, M)$ 分类 $M$ 的交叉同态（crossed homomorphisms）模去主交叉同态。

**命题 32.7.1（Hilbert 定理 90 的上同调表述）**：$H^1(\operatorname{Gal}(L/K), L^\times) = 0$ 和 $H^1(\operatorname{Gal}(L/K), L) = 0$。

Galois 上同调是类域论和 Langlands 纲领的基本技术工具。Tate 上同调、局部类域论中的 Brauer 群的计算、以及 étale 上同调都是 Galois 上同调的自然推广。在算术几何中，Galois 上同调被用于研究椭圆曲线的 Selmer 群和 Birch-Swinnerton-Dyer 猜想。

---

---

---

---

---