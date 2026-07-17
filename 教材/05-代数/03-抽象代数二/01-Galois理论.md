## 第68章：Galois 理论
Galois 理论建立了域扩张的中间域与其 Galois 群的子群之间的一一对应，是代数方程理论的巅峰。

### 67.1 域扩张回顾

回顾 V8 第 44 章的基本概念：设 $E/F$ 是域扩张。

- **代数元**：$\alpha \in E$ 称为 $F$ 上的代数元，若存在非零多项式 $f \in F[x]$ 使 $f(\alpha) = 0$。
- **最小多项式**：$\alpha$ 在 $F$ 上的次数最低的首一多项式 $m_{\alpha,F}(x)$。
- **单扩张**：$F(\alpha) \cong F[x]/(m_{\alpha,F}(x))$。
- **扩张次数**：$[E : F] = \dim_F E$。

**定义 67.1**（Galois 群）：设 $E/F$ 是域扩张。$E/F$ 的 **Galois 群** $\operatorname{Gal}(E/F)$ 是 $E$ 的所有保持 $F$ 逐点不动的自同构构成的群：

$$\operatorname{Gal}(E/F) = \{\sigma \in \operatorname{Aut}(E) : \sigma(a) = a, \; \forall a \in F\}$$

**定义 67.2**（正规扩张）：代数扩张 $E/F$ 称为**正规的**，如果 $E$ 是某个 $F[x]$ 中多项式的分裂域。等价地，任何不可约多项式 $f \in F[x]$ 若在 $E$ 中有一个根，则 $f$ 在 $E[x]$ 中完全分裂。

**定义 67.3**（可分扩张）：代数扩张 $E/F$ 称为**可分的**，如果 $E$ 中每个元素在 $F$ 上的最小多项式没有重根（即在其分裂域中无重根）。称 $E/F$ 为 **Galois 扩张**，如果它既是正规的又是可分的。

### 67.2 Galois 对应基本定理

**定理 67.1**（Galois 对应基本定理）：设 $E/F$ 是有限 Galois 扩张，$G = \operatorname{Gal}(E/F)$。则存在以下一一对应：

$$\{\text{中间域 } F \subseteq K \subseteq E\} \longleftrightarrow \{\text{子群 } H \leq G\}$$

具体地：
- $K \mapsto \operatorname{Gal}(E/K) = \{\sigma \in G : \sigma|_K = \operatorname{id}_K\}$
- $H \mapsto E^H = \{x \in E : \sigma(x) = x, \; \forall \sigma \in H\}$（$H$ 的固定域）

且满足：

1. $[E : K] = |\operatorname{Gal}(E/K)|$，$[K : F] = [G : \operatorname{Gal}(E/K)]$。
2. $K/F$ 是正规扩张（从而也是 Galois 扩张）当且仅当 $\operatorname{Gal}(E/K) \trianglelefteq G$。此时 $\operatorname{Gal}(K/F) \cong G / \operatorname{Gal}(E/K)$。
3. 对应是反序的：$K_1 \subseteq K_2 \Leftrightarrow \operatorname{Gal}(E/K_2) \subseteq \operatorname{Gal}(E/K_1)$。

*证明思路*：核心步骤：

(1) 任意有限可分扩张是单扩张（本原元素定理）：存在 $\alpha \in E$ 使 $E = F(\alpha)$。则 $|G| = [E : F]$（因为自同构由 $\alpha$ 的像决定，而 $\alpha$ 可映到其最小多项式的任意根，Galois 扩张中所有根都在 $E$ 中且互异）。

(2) 对任意子群 $H \leq G$，$[E : E^H] = |H|$。这由线性无关性引理（Artin 引理）保证：$E$ 中元素关于 $H$ 中自同构的线性无关性。

**引理 67.1**（Artin 引理）：设 $E$ 为域，$H = \{\sigma_1, \ldots, \sigma_n\}$ 是 $E$ 的自同构构成的有限群。若 $\alpha_1, \ldots, \alpha_n \in E$ 满足 $\sum_{i=1}^n \alpha_i \sigma_i(x) = 0$ 对所有 $x \in E$ 成立，则 $\alpha_1 = \cdots = \alpha_n = 0$。换言之，$H$ 中自同构作为 $E$ 到自身的函数是 $E$-线性无关的。

*证明*：假设存在非平凡关系。取项数最少的关系 $\sum_{i=1}^m \alpha_i \sigma_i(x) = 0$（$\alpha_i \neq 0$）。由于 $\sigma_1 \neq \sigma_m$，存在 $y \in E$ 使 $\sigma_1(y) \neq \sigma_m(y)$。将关系应用于 $x$ 和 $yx$，消去 $\sigma_1$ 的系数，得到项数更少的对立关系，矛盾。∎

(3) 由 (1) 和 (2) 得 $E^{\operatorname{Gal}(E/K)} = K$ 和 $\operatorname{Gal}(E/E^H) = H$，从而建立一一对应。

(4) 正规性条件：$K/F$ 正规等价于 $\sigma(K) = K$ 对所有 $\sigma \in G$ 成立，等价于 $\operatorname{Gal}(E/K) \trianglelefteq G$。∎

**推论 67.2**：$[E : F] = |\operatorname{Gal}(E/F)|$。即 Galois 扩张的次数等于其 Galois 群的阶。

### 67.3 方程的 Galois 群

**定义 67.4**（多项式的 Galois 群）：设 $f(x) \in F[x]$ 为可分多项式（无重根），$E$ 是 $f$ 在 $F$ 上的分裂域。则 $f$ 在 $F$ 上的 **Galois 群**定义为 $\operatorname{Gal}(f/F) = \operatorname{Gal}(E/F)$。

由于 $E/F$ 是 Galois 扩张，$\operatorname{Gal}(f/F)$ 可视为 $f$ 的根上的置换群，因此 $\operatorname{Gal}(f/F) \leq S_n$（$n = \deg f$）。

**定理 67.3**（Galois 可解性判别法）：多项式 $f(x) \in F[x]$ 可用根式求解当且仅当 $\operatorname{Gal}(f/F)$ 是**可解群**。

*证明思路*：($\Rightarrow$) 若 $f$ 可用根式求解，则存在根式扩张塔 $F = F_0 \subseteq F_1 \subseteq \cdots \subseteq F_m$ 包含 $f$ 的分裂域。每个 $F_{i+1}/F_i$ 是添加 $p$ 次单位根或 $p$ 次方根，对应的 Galois 群是 Abel 群。由 Galois 对应，这给出 $\operatorname{Gal}(f/F)$ 的 subnormal 列，其商群都是 Abel 群，故可解。

($\Leftarrow$) 若 $\operatorname{Gal}(f/F)$ 可解，则存在 subnormal 列，其商群为素数阶循环群。由 Galois 对应，这对应于一列根式扩张，从而 $f$ 可用根式求解。∎

**定理 67.4**（Abel-Ruffini 定理）：一般五次方程不可用根式求解。

*证明*：一般五次方程 $f(x) = x^5 - s_1 x^4 + s_2 x^3 - s_3 x^2 + s_4 x - s_5$（$s_i$ 为独立未定元）的 Galois 群是 $S_5$。$S_5$ 不是可解群（因为 $A_5$ 是单群且非 Abel），故由定理 67.3 知不可用根式求解。∎

### 67.4 有限域与分圆域

**定理 67.5**（有限域的 Galois 群）：设 $\mathbb{F}_{p^n}/\mathbb{F}_p$ 是 $p^n$ 元域对 $p$ 元素域的扩张。则 $\operatorname{Gal}(\mathbb{F}_{p^n}/\mathbb{F}_p) \cong \mathbb{Z}/n\mathbb{Z}$，由 Frobenius 自同构 $\varphi(x) = x^p$ 生成。

*证明*：$\mathbb{F}_{p^n}$ 是 $x^{p^n} - x$ 在 $\mathbb{F}_p$ 上的分裂域，故为 Galois 扩张。Frobenius 映射 $\varphi$ 是 $\mathbb{F}_{p^n}$ 的自同构，且 $\varphi^n = \operatorname{id}$。$\varphi$ 的阶恰为 $n$（否则某 $\varphi^k = \operatorname{id}$ 蕴含 $x^{p^k} = x$ 对所有 $x$ 成立，从而 $|\mathbb{F}_{p^n}| \leq p^k$，矛盾）。且 $|\operatorname{Gal}| = [\mathbb{F}_{p^n} : \mathbb{F}_p] = n$。∎

**定理 67.6**（分圆域的 Galois 群）：设 $\zeta_n$ 是 $n$ 次本原单位根，$K = \mathbb{Q}(\zeta_n)$。则 $K/\mathbb{Q}$ 是 Galois 扩张，且

$$\operatorname{Gal}(K/\mathbb{Q}) \cong (\mathbb{Z}/n\mathbb{Z})^\times$$

同构由 $\sigma_a(\zeta_n) = \zeta_n^a$（$\gcd(a, n) = 1$）给出。特别地，$[K : \mathbb{Q}] = \varphi(n)$（Euler 函数）。

*证明*：$\zeta_n$ 的最小多项式是分圆多项式 $\Phi_n(x)$（次数 $\varphi(n)$）。$K$ 是 $\Phi_n(x)$ 的分裂域。$\Phi_n(x)$ 的根为 $\zeta_n^a$（$\gcd(a, n) = 1$），故自同构由 $\zeta_n \mapsto \zeta_n^a$ 确定，且 $\sigma_a \circ \sigma_b = \sigma_{ab \bmod n}$。∎

### 67.5 尺规作图的代数刻画

**定理 67.7**（可构造数的代数刻画）：实数 $\alpha$ 可用尺规作出当且仅当存在 $\mathbb{Q}$ 的二次扩张塔

$$\mathbb{Q} = K_0 \subseteq K_1 \subseteq \cdots \subseteq K_n$$

使得 $\alpha \in K_n$ 且 $[K_i : K_{i-1}] = 2$。特别地，$[\mathbb{Q}(\alpha) : \mathbb{Q}]$ 是 2 的幂。

**推论 67.8**（三等分角、倍立方、化圆为方不可行）：
1. 一般角不能用尺规三等分（如 $60^\circ$ 三等分等价于作 $\cos 20^\circ$，其最小多项式 $8x^3 - 6x - 1$ 次数为 3，不是 2 的幂）。
2. 倍立方问题等价于构造 $\sqrt[3]{2}$，$[\mathbb{Q}(\sqrt[3]{2}) : \mathbb{Q}] = 3$，不可尺规作图。
3. 化圆为方等价于构造 $\sqrt{\pi}$，$\pi$ 是超越数（Lindemann 定理），$[\mathbb{Q}(\pi) : \mathbb{Q}]$ 无限，不可尺规作图。

---

---

---

---

---