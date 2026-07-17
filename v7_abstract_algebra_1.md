# 卷七：抽象代数 I

---

> **前置知识**：本卷建立在卷一（数系、整除理论）和卷二（代数结构：群、环、域的定义）及卷六（线性代数）的基础之上。读者应熟悉群/环/域的基本公理、同态/同构的概念、以及向量空间的基本理论。

## Ch 57 群论基础
### 39.1 群的基本概念回顾

卷二第六章已引入群的基本定义。本节简要回顾并深化。

**定义 39.1.1（群）**：群是一个集合 $G$ 配备二元运算 $\cdot$，满足：

1. **封闭性**：$\forall a, b \in G$，$a \cdot b \in G$
2. **结合律**：$(a \cdot b) \cdot c = a \cdot (b \cdot c)$
3. **幺元**：$\exists e \in G$，$\forall a \in G$，$e \cdot a = a \cdot e = a$
4. **逆元**：$\forall a \in G$，$\exists a^{-1} \in G$，$a \cdot a^{-1} = a^{-1} \cdot a = e$

若进一步满足交换律，则称为**阿贝尔群**。

**定义 39.1.2（子群）**：$H \subseteq G$ 称为 $G$ 的**子群**，记为 $H \leq G$，若 $H$ 在 $G$ 的运算下自身构成群。

**定理 39.1.1（子群判定）**：$H \subseteq G$ 是子群当且仅当

(i) $H \neq \varnothing$
(ii) $\forall a, b \in H$，$ab^{-1} \in H$

**证明**：由群的定义直接验证。取 $a \in H$，则 $e = aa^{-1} \in H$。对 $a \in H$，$a^{-1} = e a^{-1} \in H$。对 $a, b \in H$，$ab = a(b^{-1})^{-1} \in H$。$\blacksquare$

**定义 39.1.3（阶）**：群 $G$ 的元素个数称为 $G$ 的**阶**，记为 $|G|$。元素 $a \in G$ 的**阶**是使得 $a^n = e$ 的最小正整数 $n$（若不存在则为 $\infty$），记为 $|a|$。

---

### 39.2 陪集与 Lagrange 定理

**定义 39.2.1（陪集）**：设 $H \leq G$，$a \in G$。

- $aH = \{ah \mid h \in H\}$ 称为 $H$ 的**左陪集**
- $Ha = \{ha \mid h \in H\}$ 称为 $H$ 的**右陪集**

**定理 39.2.1（陪集的基本性质）**：设 $H \leq G$。

(i) $a \in aH$，故 $G = \bigcup_{a \in G} aH$
(ii) 对任意 $a, b \in G$，$aH = bH$ 或 $aH \cap bH = \varnothing$
(iii) $|aH| = |H|$（映射 $h \mapsto ah$ 是双射）

**证明**：

(i) $a = ae \in aH$（$e \in H$）。

(ii) 若 $aH \cap bH \neq \varnothing$，设 $x \in aH \cap bH$，则 $x = ah_1 = bh_2$。于是 $a = bh_2 h_1^{-1} \in bH$，故 $aH \subseteq bH$。同理 $bH \subseteq aH$，故 $aH = bH$。

(iii) 映射 $f : H \to aH$，$f(h) = ah$ 是双射：$ah_1 = ah_2 \implies h_1 = h_2$（左消去）；对任意 $ah \in aH$，$f(h) = ah$。$\blacksquare$

**定理 39.2.2（Lagrange 定理）**：设 $G$ 为有限群，$H \leq G$。则 $|H|$ 整除 $|G|$，且

$$
|G| = |H| \cdot [G : H]
$$

其中 $[G : H]$ 为 $H$ 在 $G$ 中的**指数**（即不同陪集的个数）。

**证明**：由定理 39.2.1，$G$ 被划分为 $[G : H]$ 个互不相交的左陪集，每个陪集的大小为 $|H|$。因此 $|G| = [G : H] \cdot |H|$。$\blacksquare$

**推论 39.2.3**：设 $G$ 为有限群，$a \in G$。则 $|a|$ 整除 $|G|$。特别地，$a^{|G|} = e$。

**证明**：考虑由 $a$ 生成的循环子群 $\langle a \rangle = \{a^k \mid k \in \mathbb{Z}\}$。$|\langle a \rangle| = |a|$。由 Lagrange 定理，$|a| \mid |G|$。因此 $a^{|G|} = (a^{|a|})^{|G|/|a|} = e$。$\blacksquare$

**推论 39.2.4（Fermat-Euler 定理的推广）**：若 $|G| = p$（素数），则 $G$ 是循环群，且任何非幺元都是生成元。

**证明**：取 $a \in G \setminus \{e\}$。$|a|$ 整除 $p$ 且 $|a| > 1$，故 $|a| = p$。因此 $\langle a \rangle = G$。$\blacksquare$

---

### 39.3 正规子群与商群

**定义 39.3.1（正规子群）**：$N \leq G$ 称为 $G$ 的**正规子群**，记为 $N \trianglelefteq G$，若对任意 $g \in G$，$gNg^{-1} = N$（等价地，$gN = Ng$）。

**定理 39.3.1（正规子群的判定）**：$N \trianglelefteq G$ 当且仅当 $\forall g \in G, \forall n \in N$，$gng^{-1} \in N$。

**证明**：$gNg^{-1} \subseteq N$ 对所有 $g$ 成立则 $gNg^{-1} = N$（用 $g^{-1}$ 替换 $g$ 得 $g^{-1}Ng \subseteq N$，两边左乘 $g$ 右乘 $g^{-1}$ 得 $N \subseteq gNg^{-1}$）。$\blacksquare$

**定义 39.3.2（商群）**：设 $N \trianglelefteq G$。在陪集的集合 $G/N = \{gN \mid g \in G\}$ 上定义运算 $(aN)(bN) = (ab)N$。$(G/N, \cdot)$ 构成群，称为 $G$ 模 $N$ 的**商群**。

**定理 39.3.2（商群中运算的良定义性）**：上述运算在 $N \trianglelefteq G$ 时是良定义的。

**证明**：需证若 $aN = a'N$ 且 $bN = b'N$，则 $(ab)N = (a'b')N$。

由 $aN = a'N$ 得 $a' = an_1$（$n_1 \in N$）。由 $bN = b'N$ 得 $b' = bn_2$（$n_2 \in N$）。则 $a'b' = an_1 bn_2 = ab(b^{-1}n_1 b)n_2$。由于 $N \trianglelefteq G$，$b^{-1}n_1 b \in N$，故 $(b^{-1}n_1 b)n_2 \in N$。因此 $a'b' \in (ab)N$，即 $(a'b')N = (ab)N$。$\blacksquare$

**定理 39.3.3**：若 $G$ 是阿贝尔群，则 $G$ 的任何子群都是正规子群。

**证明**：$gng^{-1} = gg^{-1}n = n \in N$。$\blacksquare$

---

### 39.4 群同态与同构定理

**定义 39.4.1（群同态）**：设 $G, H$ 为群。映射 $\varphi : G \to H$ 若满足 $\varphi(ab) = \varphi(a)\varphi(b)$（$\forall a, b \in G$），则称 $\varphi$ 为**群同态**。

**定理 39.4.1（同态的基本性质）**：设 $\varphi : G \to H$ 为群同态。

(i) $\varphi(e_G) = e_H$
(ii) $\varphi(a^{-1}) = \varphi(a)^{-1}$
(iii) $\ker \varphi = \{g \in G \mid \varphi(g) = e_H\}$ 是 $G$ 的正规子群
(iv) $\operatorname{im} \varphi = \{\varphi(g) \mid g \in G\}$ 是 $H$ 的子群
(v) $\varphi$ 是单射 $\iff$ $\ker \varphi = \{e_G\}$

**证明**：

(i) $\varphi(e_G) = \varphi(e_G e_G) = \varphi(e_G)\varphi(e_G)$，两边左乘 $\varphi(e_G)^{-1}$ 得 $\varphi(e_G) = e_H$。

(ii) $\varphi(a)\varphi(a^{-1}) = \varphi(aa^{-1}) = \varphi(e_G) = e_H$，同理 $\varphi(a^{-1})\varphi(a) = e_H$。由逆元唯一性得证。

(iii) $\ker \varphi$ 是子群（由 (i)(ii) 验证）。对 $g \in G$，$k \in \ker \varphi$，$\varphi(gkg^{-1}) = \varphi(g)\varphi(k)\varphi(g)^{-1} = \varphi(g)e_H \varphi(g)^{-1} = e_H$，故 $gkg^{-1} \in \ker \varphi$。因此 $\ker \varphi \trianglelefteq G$。

(iv) 直接验证。(v) 与线性映射的判定类似（定理 33.2.2）。$\blacksquare$

**定理 39.4.2（第一同构定理）**：设 $\varphi : G \to H$ 为群同态。则

$$
G / \ker \varphi \cong \operatorname{im} \varphi
$$

同构映射为 $\overline{\varphi}(g \ker \varphi) = \varphi(g)$。

**证明**：定义 $\overline{\varphi} : G/\ker \varphi \to \operatorname{im} \varphi$ 为 $\overline{\varphi}(gK) = \varphi(g)$（$K = \ker \varphi$）。

良定义：若 $gK = g'K$，则 $g' = gk$（$k \in K$）。$\varphi(g') = \varphi(gk) = \varphi(g)\varphi(k) = \varphi(g)$。

同态：$\overline{\varphi}((gK)(hK)) = \overline{\varphi}(ghK) = \varphi(gh) = \varphi(g)\varphi(h) = \overline{\varphi}(gK)\overline{\varphi}(hK)$。

单射：若 $\overline{\varphi}(gK) = e_H$，则 $\varphi(g) = e_H$，故 $g \in K$，$gK = K$（商群的幺元）。

满射：由 $\operatorname{im} \varphi$ 的定义显然。$\blacksquare$

**定理 39.4.3（第二同构定理）**：设 $H \leq G$，$N \trianglelefteq G$。则 $HN = \{hn \mid h \in H, n \in N\}$ 是 $G$ 的子群，$H \cap N \trianglelefteq H$，且

$$
H / (H \cap N) \cong HN / N
$$

**证明**：$HN$ 是子群：$e \in HN$；$(h_1 n_1)(h_2 n_2) = h_1 h_2 (h_2^{-1} n_1 h_2) n_2 \in HN$（因为 $h_2^{-1} n_1 h_2 \in N$）；$(hn)^{-1} = n^{-1}h^{-1} = h^{-1}(h n^{-1} h^{-1}) \in HN$。

$H \cap N \trianglelefteq H$：对 $h \in H$，$x \in H \cap N$，$hxh^{-1} \in H$（$h, x, h^{-1} \in H$）且 $hxh^{-1} \in N$（$N \trianglelefteq G$），故 $hxh^{-1} \in H \cap N$。

定义 $\varphi : H \to HN/N$ 为 $\varphi(h) = hN$。$\varphi$ 是满同态。$\ker \varphi = \{h \in H \mid hN = N\} = \{h \in H \mid h \in N\} = H \cap N$。由第一同构定理，$H/(H \cap N) \cong HN/N$。$\blacksquare$

**定理 39.4.4（第三同构定理）**：设 $N \trianglelefteq G$，$K \trianglelefteq G$ 且 $N \subseteq K$。则 $K/N \trianglelefteq G/N$，且

$$
(G/N) / (K/N) \cong G/K
$$

**证明**：定义 $\varphi : G/N \to G/K$ 为 $\varphi(gN) = gK$。

良定义：若 $gN = g'N$，则 $g' = gn$（$n \in N \subseteq K$），故 $g'K = gK$。

同态：$\varphi((gN)(hN)) = \varphi(ghN) = ghK = (gK)(hK) = \varphi(gN)\varphi(hN)$。

满射显然。$\ker \varphi = \{gN \mid gK = K\} = \{gN \mid g \in K\} = K/N$。

由第一同构定理得证。$\blacksquare$

---

### 39.5 循环群

**定义 39.5.1（循环群）**：群 $G$ 称为**循环群**，若存在 $a \in G$ 使得 $G = \langle a \rangle = \{a^n \mid n \in \mathbb{Z}\}$。

**定理 39.5.1（循环群的分类）**：

(i) 若 $|G| = \infty$，则 $G \cong \mathbb{Z}$
(ii) 若 $|G| = n$，则 $G \cong \mathbb{Z}_n$

**证明**：定义 $\varphi : \mathbb{Z} \to G$ 为 $\varphi(k) = a^k$。$\varphi$ 是满同态。$\ker \varphi$ 是 $\mathbb{Z}$ 的子群，故 $\ker \varphi = m\mathbb{Z}$（$m \geq 0$）。

若 $m = 0$，则 $\varphi$ 是单射，故 $G \cong \mathbb{Z}$。

若 $m > 0$，由第一同构定理 $G \cong \mathbb{Z}/m\mathbb{Z} = \mathbb{Z}_m$。此时 $|G| = m = n$。$\blacksquare$

**定理 39.5.2（循环群的子群）**：循环群的任何子群也是循环群。若 $G = \langle a \rangle$ 为 $n$ 阶循环群，则对 $n$ 的每个正因子 $d$，$G$ 恰有一个 $d$ 阶子群，即 $\langle a^{n/d} \rangle$。

**证明**：设 $H \leq G = \langle a \rangle$。令 $m = \min\{k > 0 \mid a^k \in H\}$。可以证明 $H = \langle a^m \rangle$（用带余除法）。

对 $n$ 阶循环群，$d \mid n$ 时，$|a^{n/d}| = n / \gcd(n, n/d) = n / (n/d) = d$。唯一性：若 $H$ 为 $d$ 阶子群，则 $H = \langle a^k \rangle$ 且 $|a^k| = n / \gcd(n, k) = d$，故 $\gcd(n, k) = n/d$。因此 $k$ 是 $n/d$ 的倍数，且 $a^k \in \langle a^{n/d} \rangle$。由此 $H = \langle a^{n/d} \rangle$。$\blacksquare$

---

### 39.6 对称群与 Cayley 定理

**定义 39.6.1（对称群）**：$n$ 个元素的集合上所有置换构成的群称为 $n$ 次**对称群**，记为 $S_n$。$|S_n| = n!$。

**定义 39.6.2（置换的轮换分解）**：任何置换 $\sigma \in S_n$ 可唯一分解为互不相交的轮换的乘积（不考虑次序）。

**定理 39.6.1（Cayley 定理）**：任何群 $G$ 同构于某个对称群的一个子群。特别地，若 $|G| = n$，则 $G$ 同构于 $S_n$ 的一个子群。

**证明**：对每个 $g \in G$，定义左乘映射 $L_g : G \to G$，$L_g(x) = gx$。$L_g$ 是 $G$ 上的置换（因为 $L_{g^{-1}}$ 是其逆）。

定义 $\varphi : G \to S_G$（$S_G$ 为 $G$ 上所有置换构成的群）为 $\varphi(g) = L_g$。

$\varphi$ 是同态：$\varphi(gh)(x) = L_{gh}(x) = ghx = L_g(hx) = L_g(L_h(x)) = (\varphi(g) \circ \varphi(h))(x)$。

$\varphi$ 是单射：若 $\varphi(g) = \text{id}$，则 $L_g(e) = ge = e$，故 $g = e$。

因此 $G \cong \operatorname{im} \varphi \leq S_G$。若 $|G| = n$，则 $S_G \cong S_n$。$\blacksquare$

---

### 39.7 群的直积

**定义 39.7.1（直积）**：设 $G_1, G_2, \ldots, G_n$ 为群。它们的**直积**为

$$
G_1 \times G_2 \times \cdots \times G_n = \{(g_1, g_2, \ldots, g_n) \mid g_i \in G_i\}
$$

运算为逐分量乘法：$(g_1, \ldots, g_n)(h_1, \ldots, h_n) = (g_1 h_1, \ldots, g_n h_n)$。

**定理 39.7.1（有限阿贝尔群的结构定理，陈述）**：任何有限阿贝尔群同构于素数幂阶循环群的直积。即存在素数 $p_1, \ldots, p_k$ 和正整数 $e_1, \ldots, e_k$ 使得

$$
G \cong \mathbb{Z}_{p_1^{e_1}} \times \mathbb{Z}_{p_2^{e_2}} \times \cdots \times \mathbb{Z}_{p_k^{e_k}}
$$

该分解在因子顺序下是唯一的（当要求 $p_1^{e_1} \mid p_2^{e_2} \mid \cdots \mid p_k^{e_k}$ 时）。

**注记 39.7.1**：完整证明将在 Ch 61 中作为主理想整环上有限生成模的结构定理的推论给出。

---

---

---

## Ch 58 群作用与 Sylow 定理
### 40.1 群作用

**定义 40.1.1（群作用）**：群 $G$ 在集合 $X$ 上的一个**作用**（左作用）是一个映射 $G \times X \to X$，$(g, x) \mapsto g \cdot x$，满足：

1. $e \cdot x = x$（$\forall x \in X$）
2. $g \cdot (h \cdot x) = (gh) \cdot x$（$\forall g, h \in G, \forall x \in X$）

**定义 40.1.2（轨道与稳定子）**：设 $G$ 作用在 $X$ 上，$x \in X$。

- $x$ 的**轨道**：$G \cdot x = \{g \cdot x \mid g \in G\}$
- $x$ 的**稳定子群**：$G_x = \{g \in G \mid g \cdot x = x\}$

**定理 40.1.1（轨道-稳定子定理）**：设 $G$ 为有限群，作用在有限集 $X$ 上。则对任意 $x \in X$，

$$
|G \cdot x| = [G : G_x] = \frac{|G|}{|G_x|}
$$

特别地，$|G \cdot x|$ 整除 $|G|$。

**证明**：定义映射 $\varphi : G/G_x \to G \cdot x$ 为 $\varphi(g G_x) = g \cdot x$。

良定义：若 $g G_x = h G_x$，则 $h^{-1}g \in G_x$，故 $(h^{-1}g) \cdot x = x$，即 $g \cdot x = h \cdot x$。

单射：若 $g \cdot x = h \cdot x$，则 $h^{-1}g \cdot x = x$，故 $h^{-1}g \in G_x$，$g G_x = h G_x$。

满射：显然。

因此 $|G \cdot x| = |G/G_x| = [G : G_x] = |G|/|G_x|$。$\blacksquare$

**定理 40.1.2（Burnside 引理）**：设有限群 $G$ 作用在有限集 $X$ 上。轨道的个数为

$$
\frac{1}{|G|} \sum_{g \in G} |\operatorname{Fix}(g)|
$$

其中 $\operatorname{Fix}(g) = \{x \in X \mid g \cdot x = x\}$。

**证明**：计数集合 $\{(g, x) \in G \times X \mid g \cdot x = x\}$ 的两种方式：

$$
\sum_{g \in G} |\operatorname{Fix}(g)| = \sum_{x \in X} |G_x| = \sum_{x \in X} \frac{|G|}{|G \cdot x|}
$$

设轨道为 $\mathcal{O}_1, \ldots, \mathcal{O}_k$。对每个轨道 $\mathcal{O}_i$，取 $x_i \in \mathcal{O}_i$，则对 $x \in \mathcal{O}_i$，$|G \cdot x| = |\mathcal{O}_i|$，故

$$
\sum_{x \in \mathcal{O}_i} \frac{|G|}{|G \cdot x|} = |\mathcal{O}_i| \cdot \frac{|G|}{|\mathcal{O}_i|} = |G|
$$

因此 $\sum_{g \in G} |\operatorname{Fix}(g)| = k |G|$，即 $k = \frac{1}{|G|} \sum_{g \in G} |\operatorname{Fix}(g)|$。$\blacksquare$

---

### 40.2 共轭作用与类方程

**定义 40.2.1（共轭作用）**：群 $G$ 在自身上的**共轭作用**定义为 $g \cdot x = gxg^{-1}$。

在此作用下，$x$ 的轨道称为 $x$ 的**共轭类**，稳定子群称为 $x$ 的**中心化子**，记为 $C_G(x) = \{g \in G \mid gxg^{-1} = x\}$。

**定义 40.2.2（中心）**：$G$ 的**中心** $Z(G) = \{g \in G \mid gx = xg, \, \forall x \in G\} = \{g \in G \mid C_G(g) = G\}$。

**定理 40.2.1（类方程）**：设 $G$ 为有限群。则

$$
|G| = |Z(G)| + \sum_{i=1}^{k} [G : C_G(x_i)]
$$

其中 $x_1, \ldots, x_k$ 是非中心元素的共轭类的代表元。

**证明**：$G$ 被划分为共轭类。$Z(G)$ 中的元素恰为那些共轭类大小为 $1$ 的元素。对其余共轭类，由轨道-稳定子定理，$|共轭类| = [G : C_G(x_i)]$。$\blacksquare$

**推论 40.2.2**：若 $|G| = p^n$（$p$ 为素数，$n \geq 1$，此时 $G$ 称为 $p$-群），则 $|Z(G)| > 1$（即非平凡 $p$-群的中心非平凡）。

**证明**：由类方程，$|G| = |Z(G)| + \sum [G : C_G(x_i)]$。$[G : C_G(x_i)]$ 整除 $|G| = p^n$ 且不为 $1$（$x_i \notin Z(G)$），故是 $p$ 的倍数。因此 $|Z(G)| \equiv |G| \equiv 0 \pmod{p}$。又 $e \in Z(G)$，故 $|Z(G)| \geq p > 1$。$\blacksquare$

---

### 40.3 Sylow 定理

**定义 40.3.1（Sylow $p$-子群）**：设 $G$ 为有限群，$|G| = p^n m$（$p \nmid m$）。$G$ 的 $p^n$ 阶子群称为 $G$ 的 **Sylow $p$-子群**。

**定理 40.3.1（Sylow 第一定理——存在性）**：设 $G$ 为有限群，$p$ 为素数，$p^k \mid |G|$。则 $G$ 存在 $p^k$ 阶子群。特别地，Sylow $p$-子群存在。

**证明**：对 $|G|$ 归纳。$|G| = 1$ 时平凡。

设 $|G| = p^n m$（$p \nmid m$）。考虑类方程 $|G| = |Z(G)| + \sum [G : C_G(x_i)]$。

**情形一**：$p \nmid |Z(G)|$。则存在某个 $x_i$ 使得 $p \nmid [G : C_G(x_i)]$。由 $[G : C_G(x_i)] = |G|/|C_G(x_i)|$ 和 $p^n \mid |G|$，得 $p^n \mid |C_G(x_i)|$。由于 $x_i \notin Z(G)$，$C_G(x_i) \subsetneq G$。由归纳假设应用在 $C_G(x_i)$ 上，$C_G(x_i)$ 存在 $p^n$ 阶子群（即 $G$ 的 Sylow $p$-子群）。

**情形二**：$p \mid |Z(G)|$。由 Cauchy 定理（定理 40.3.2），$Z(G)$ 存在 $p$ 阶元素 $a$。$N = \langle a \rangle \trianglelefteq G$（因为 $N \subseteq Z(G)$）。$|G/N| = |G|/p = p^{n-1}m$。由归纳假设，$G/N$ 存在 Sylow $p$-子群 $P/N$（$|P/N| = p^{n-1}$）。则 $|P| = p^n$，$P$ 即为 $G$ 的 Sylow $p$-子群。

对于一般的 $p^k$，由 Sylow $p$-子群的存在性，它包含 $p^k$ 阶子群（由归纳法可证）。$\blacksquare$

**定理 40.3.2（Cauchy 定理）**：若素数 $p \mid |G|$，则 $G$ 存在 $p$ 阶元素。

**证明**：考虑集合 $X = \{(g_1, \ldots, g_p) \in G^p : g_1 g_2 \cdots g_p = e\}$。$|X| = |G|^{p-1}$（前 $p-1$ 个分量可自由选择，最后一个由方程 $g_p = (g_1 \cdots g_{p-1})^{-1}$ 唯一确定）。循环群 $\mathbb{Z}_p$ 通过循环置换作用在 $X$ 上：$k \cdot (g_1, \ldots, g_p) = (g_{k+1}, \ldots, g_p, g_1, \ldots, g_k)$（$k = 0, 1, \ldots, p-1$）。验证这是群作用：$0$ 作用为恒等，且 $k \cdot (\ell \cdot x) = (k+\ell) \cdot x$。

由轨道-稳定子定理（定理 40.1.1），每个轨道的大小整除 $|\mathbb{Z}_p| = p$，故为 $1$ 或 $p$。不动点（轨道大小为 $1$ 的元素）满足 $(g, \ldots, g) \in X$，即 $g^p = e$。不动点包括 $(e, \ldots, e)$（对应 $g = e$）以及可能的满足 $|g| = p$ 的元素。

由于 $p \mid |X| = |G|^{p-1}$，而不动点总数 $\equiv |X| \equiv 0 \pmod{p}$（因非平凡轨道大小为 $p$），故至少有 $p$ 个不动点。因此存在 $g \neq e$ 使 $g^p = e$，即 $|g| = p$。$\blacksquare$

**定理 40.3.3（Sylow 第二定理——共轭性）**：设 $G$ 为有限群。$G$ 的任何两个 Sylow $p$-子群是共轭的。即若 $P, Q$ 均为 Sylow $p$-子群，则存在 $g \in G$ 使得 $Q = gPg^{-1}$。

**证明**：设 $X = \{gP \mid g \in G\}$ 为 $P$ 的左陪集组成的集合。$Q$ 通过左乘作用在 $X$ 上。将 $X$ 划分为 $Q$-轨道。

由轨道-稳定子定理，每个轨道的大小整除 $|Q| = p^n$，故为 $p$ 的幂。$|X| = [G : P] = m$（$p \nmid m$）。由于轨道的和为 $m$，必存在大小为 $1$ 的轨道（否则每个轨道大小都是 $p$ 的倍数，总和也是 $p$ 的倍数）。

设该轨道为 $\{gP\}$，即 $Q \cdot gP = gP$。这意味着 $QgP = gP$，即 $g^{-1}Qg \subseteq P$。由于 $|g^{-1}Qg| = |Q| = |P|$，故 $g^{-1}Qg = P$，即 $Q = gPg^{-1}$。$\blacksquare$

**推论 40.3.4（Sylow 第三定理——计数）**：设 $n_p$ 为 $G$ 的 Sylow $p$-子群的个数。则

(i) $n_p \equiv 1 \pmod{p}$
(ii) $n_p \mid m$（其中 $|G| = p^n m$，$p \nmid m$）

**证明**：设 $P$ 为 Sylow $p$-子群。令 $X$ 为所有 Sylow $p$-子群的集合。$P$ 通过共轭作用在 $X$ 上。将 $X$ 划分为 $P$-轨道。

每个轨道的大小整除 $|P| = p^n$，故为 $p$ 的幂。$\{P\}$ 是大小为 $1$ 的轨道。若存在另一个大小为 $1$ 的轨道 $\{Q\}$，则 $P Q P^{-1} = Q$，即 $P \subseteq N_G(Q)$。$P$ 和 $Q$ 都是 $N_G(Q)$ 的 Sylow $p$-子群。由 Sylow 第二定理（应用在 $N_G(Q)$ 上），$P$ 和 $Q$ 在 $N_G(Q)$ 中共轭，但 $Q \trianglelefteq N_G(Q)$，故 $P = Q$。

因此仅有 $\{P\}$ 是大小为 $1$ 的轨道，其余轨道大小均为 $p$ 的倍数。故 $n_p \equiv 1 \pmod{p}$。

(ii) 由 Sylow 第二定理，$G$ 传递地作用在 Sylow $p$-子群的集合上（通过共轭）。由轨道-稳定子定理，$n_p = [G : N_G(P)]$ 整除 $[G : P] = m$。$\blacksquare$

---

---

---

## Ch 59 环论基础
### 41.1 理想与商环

**定义 41.1.1（理想）**：设 $R$ 为环。子集 $I \subseteq R$ 称为 $R$ 的**理想**，若

1. $(I, +)$ 是 $(R, +)$ 的子群
2. $\forall r \in R, \forall a \in I$，$ra \in I$（左理想）且 $ar \in I$（右理想）

**例 41.1.1**：设 $R$ 为环，$a \in R$。则 $(a) = \{ra \mid r \in R\}$ 是 $R$ 的左理想。若 $R$ 是交换环，$(a) = \{ra \mid r \in R\}$ 是理想，称为由 $a$ 生成的**主理想**。

**定义 41.1.2（商环）**：设 $I$ 为环 $R$ 的理想。在加法商群 $R/I$ 上定义乘法：$(r + I)(s + I) = rs + I$。$(R/I, +, \cdot)$ 构成环，称为 $R$ 模 $I$ 的**商环**。

**定理 41.1.1**：商环中乘法的定义是良定义的。

**证明**：设 $r + I = r' + I$，$s + I = s' + I$。则 $r' = r + a$，$s' = s + b$（$a, b \in I$）。$r's' = (r + a)(s + b) = rs + rb + as + ab$。由于 $I$ 是理想，$rb, as, ab \in I$，故 $r's' + I = rs + I$。$\blacksquare$

---

### 41.2 环同态与同构定理

**定义 41.2.1（环同态）**：设 $R, S$ 为环。映射 $\varphi : R \to S$ 若满足：

1. $\varphi(a + b) = \varphi(a) + \varphi(b)$
2. $\varphi(ab) = \varphi(a)\varphi(b)$
3. $\varphi(1_R) = 1_S$（若 $R, S$ 含幺）

则称 $\varphi$ 为**环同态**。

**定理 41.2.1（环的第一同构定理）**：设 $\varphi : R \to S$ 为环同态。则 $\ker \varphi$ 是 $R$ 的理想，且

$$
R / \ker \varphi \cong \operatorname{im} \varphi
$$

**证明**：$\ker \varphi$ 是理想（类似群的情形，需额外验证乘法吸收性）。在加法群层面，由群的第一同构定理，$R/\ker \varphi \cong \operatorname{im} \varphi$（作为加法群）。同构映射 $\overline{\varphi}(r + \ker \varphi) = \varphi(r)$ 也保持乘法：$\overline{\varphi}((r + K)(s + K)) = \overline{\varphi}(rs + K) = \varphi(rs) = \varphi(r)\varphi(s) = \overline{\varphi}(r + K)\overline{\varphi}(s + K)$。$\blacksquare$

**定理 41.2.2（环的第二、第三同构定理）**：与群的同构定理类似，将 "子群" 替换为 "子环"，"正规子群" 替换为 "理想"。

---

### 41.3 素理想与极大理想

**定义 41.3.1（素理想与极大理想）**：设 $R$ 为交换环，$I$ 为 $R$ 的真理想（$I \neq R$）。

1. $I$ 称为**素理想**，若 $ab \in I \implies a \in I$ 或 $b \in I$
2. $I$ 称为**极大理想**，若不存在理想 $J$ 使得 $I \subsetneq J \subsetneq R$

**定理 41.3.1**：设 $R$ 为含幺交换环，$I$ 为 $R$ 的理想。

(i) $I$ 是素理想 $\iff$ $R/I$ 是整环
(ii) $I$ 是极大理想 $\iff$ $R/I$ 是域

**证明**：

(i) $I$ 是素理想 $\iff$ $\forall a, b \in R$，$ab \in I \implies a \in I \text{ 或 } b \in I$ $\iff$ $\forall \overline{a}, \overline{b} \in R/I$，$\overline{a}\overline{b} = \overline{0} \implies \overline{a} = \overline{0} \text{ 或 } \overline{b} = \overline{0}$ $\iff$ $R/I$ 无零因子 $\iff$ $R/I$ 是整环。

(ii) （$\Rightarrow$）设 $I$ 为极大理想。取 $\overline{a} \in R/I \setminus \{\overline{0}\}$，即 $a \notin I$。考虑理想 $J = I + (a)$。$J \supsetneq I$，由极大性 $J = R$。故存在 $i \in I$，$r \in R$ 使得 $1 = i + ra$。在 $R/I$ 中，$\overline{1} = \overline{r}\overline{a}$，故 $\overline{a}$ 可逆。因此 $R/I$ 中每个非零元可逆，即为域。

（$\Leftarrow$）设 $R/I$ 为域。若 $J \supseteq I$ 为 $R$ 的理想，$J/I$ 是 $R/I$ 的理想。域只有平凡理想，故 $J/I = \{\overline{0}\}$ 或 $J/I = R/I$。前者 $J = I$，后者 $J = R$。因此 $I$ 是极大理想。$\blacksquare$

**推论 41.3.2**：极大理想必为素理想。

**证明**：域 $\implies$ 整环。由定理 41.3.1，$R/I$ 是域 $\implies$ $R/I$ 是整环 $\implies$ $I$ 是极大理想 $\implies$ $I$ 是素理想。$\blacksquare$

---

### 41.4 中国剩余定理

**定理 41.4.1（中国剩余定理——环论版）**：设 $R$ 为含幺交换环，$I_1, \ldots, I_n$ 为 $R$ 的理想，满足 $I_i + I_j = R$（$\forall i \neq j$）。则

$$
R / (I_1 \cap I_2 \cap \cdots \cap I_n) \cong R/I_1 \times R/I_2 \times \cdots \times R/I_n
$$

**证明**：对 $n$ 归纳。$n = 2$ 时，$I_1 + I_2 = R$ 保证存在 $a_1 \in I_1$，$a_2 \in I_2$ 使得 $a_1 + a_2 = 1$。

定义 $\varphi : R \to R/I_1 \times R/I_2$ 为 $\varphi(r) = (r + I_1, r + I_2)$。$\varphi$ 是环同态。

$\ker \varphi = I_1 \cap I_2$。需证 $\varphi$ 是满射。对任意 $(r_1 + I_1, r_2 + I_2)$，取 $r = r_2 a_1 + r_1 a_2$。则

$$
r - r_1 = r_2 a_1 + r_1(a_2 - 1) = r_2 a_1 - r_1 a_1 \in I_1
$$
$$
r - r_2 = r_2(a_1 - 1) + r_1 a_2 = -r_2 a_2 + r_1 a_2 \in I_2
$$

故 $\varphi(r) = (r_1 + I_1, r_2 + I_2)$。由第一同构定理得证。

$n > 2$ 时，令 $J = I_1 \cap \cdots \cap I_{n-1}$。可证 $J + I_n = R$（利用 $I_i + I_n = R$ 和归纳）。由 $n = 2$ 的情形，$R/(J \cap I_n) \cong R/J \times R/I_n$。由归纳假设，$R/J \cong R/I_1 \times \cdots \times R/I_{n-1}$。合起来即得。$\blacksquare$

**推论 41.4.2（整数版中国剩余定理）**：设 $m_1, \ldots, m_n$ 为两两互素的正整数。则

$$
\mathbb{Z} / (m_1 \cdots m_n) \mathbb{Z} \cong \mathbb{Z}/m_1\mathbb{Z} \times \cdots \times \mathbb{Z}/m_n\mathbb{Z}
$$

**证明**：$m_i\mathbb{Z} + m_j\mathbb{Z} = \gcd(m_i, m_j)\mathbb{Z} = \mathbb{Z}$（$\gcd(m_i, m_j) = 1$）。且 $m_1\mathbb{Z} \cap \cdots \cap m_n\mathbb{Z} = \operatorname{lcm}(m_1, \ldots, m_n)\mathbb{Z} = m_1 \cdots m_n \mathbb{Z}$。由定理 41.4.1 得证。$\blacksquare$

---

---

---

## Ch 60 多项式环与因式分解
### 42.1 多项式环

**定义 42.1.1（多项式环）**：设 $R$ 为交换环。$R$ 上的一元多项式环 $R[x]$ 是所有形式表达式 $\sum_{i=0}^{n} a_i x^i$（$a_i \in R$）的集合，配备通常的多项式加法和乘法。

**定理 42.1.1（带余除法）**：设 $F$ 为域，$f, g \in F[x]$，$g \neq 0$。则存在唯一的 $q, r \in F[x]$ 使得

$$
f = qg + r, \quad \deg r < \deg g
$$

**证明**：对 $\deg f$ 归纳。若 $\deg f < \deg g$，取 $q = 0$，$r = f$ 即可。

若 $\deg f = n \geq m = \deg g$，设 $f = a_n x^n + \cdots$，$g = b_m x^m + \cdots$。令 $f_1 = f - \frac{a_n}{b_m} x^{n-m} g$。则 $\deg f_1 < n$。由归纳假设，$f_1 = q_1 g + r$（$\deg r < \deg g$）。则 $f = (q_1 + \frac{a_n}{b_m} x^{n-m})g + r$。

唯一性：若 $f = qg + r = q'g + r'$，则 $(q - q')g = r' - r$。若 $q \neq q'$，左边次数 $\geq \deg g$，右边次数 $< \deg g$，矛盾。故 $q = q'$，$r = r'$。$\blacksquare$

**定义 42.1.2（多项式函数与根）**：$f \in F[x]$，$\alpha \in F$。若 $f(\alpha) = 0$，则称 $\alpha$ 为 $f$ 的**根**。

**定理 42.1.2（因式定理）**：$\alpha \in F$ 是 $f \in F[x]$ 的根当且仅当 $x - \alpha \mid f(x)$。

**证明**：由带余除法，$f(x) = q(x)(x - \alpha) + r$（$r \in F$）。代入 $x = \alpha$ 得 $f(\alpha) = r$。故 $f(\alpha) = 0 \iff r = 0 \iff x - \alpha \mid f(x)$。$\blacksquare$

---

### 42.2 欧几里得整环、主理想整环、唯一分解整环

**定义 42.2.1（欧几里得整环）**：整环 $R$ 称为**欧几里得整环**（ED），若存在函数 $\varphi : R \setminus \{0\} \to \mathbb{N}$ 使得对任意 $a, b \in R$（$b \neq 0$），存在 $q, r \in R$ 满足

$$
a = qb + r, \quad \text{且 } r = 0 \text{ 或 } \varphi(r) < \varphi(b)
$$

**例 42.2.1**：$\mathbb{Z}$（$\varphi(n) = |n|$）和 $F[x]$（$\varphi(f) = \deg f$）是 ED。

**定义 42.2.2（主理想整环）**：整环 $R$ 称为**主理想整环**（PID），若 $R$ 的每个理想都是主理想（即由单个元素生成）。

**定理 42.2.1**：ED $\implies$ PID。

**证明**：设 $R$ 为 ED，$I$ 为 $R$ 的非零理想。取 $b \in I \setminus \{0\}$ 使得 $\varphi(b)$ 最小。对任意 $a \in I$，由带余除法 $a = qb + r$（$r = 0$ 或 $\varphi(r) < \varphi(b)$）。由于 $r = a - qb \in I$，由 $\varphi(b)$ 的最小性，$r = 0$。故 $a = qb$，即 $I = (b)$。$\blacksquare$

**定义 42.2.3（不可约元素与素元素）**：设 $R$ 为整环。

- $p \in R \setminus \{0\}$（非单位）称为**不可约元素**，若 $p = ab \implies a$ 或 $b$ 是单位
- $p \in R \setminus \{0\}$（非单位）称为**素元素**，若 $p \mid ab \implies p \mid a$ 或 $p \mid b$

**定理 42.2.2**：在整环中，素元素必为不可约元素。在 PID 中，不可约元素也是素元素。

**证明**：设 $p$ 为素元素，$p = ab$。则 $p \mid ab$，故 $p \mid a$ 或 $p \mid b$。不妨设 $p \mid a$，$a = pc$。则 $p = pcb$，由于整环中可消去 $p$，$cb = 1$，故 $b$ 是单位。因此 $p$ 不可约。

设 $R$ 为 PID，$p$ 不可约。若 $p \mid ab$ 且 $p \nmid a$。考虑理想 $(p, a)$。由于 $R$ 是 PID，$(p, a) = (d)$。$d \mid p$，故 $d$ 是单位或 $p$ 的相伴。若 $d$ 是 $p$ 的相伴，则 $p \mid a$，矛盾。故 $d$ 是单位，$(p, a) = R$。存在 $x, y \in R$ 使得 $xp + ya = 1$。则 $b = xpb + yab$。$p \mid xpb$ 且 $p \mid yab$（因为 $p \mid ab$），故 $p \mid b$。因此 $p$ 是素元素。$\blacksquare$

**定义 42.2.4（唯一分解整环）**：整环 $R$ 称为**唯一分解整环**（UFD），若

1. 每个非零非单位元素可分解为不可约元素的乘积
2. 该分解在相伴意义下唯一（即若 $a = p_1 \cdots p_m = q_1 \cdots q_n$，则 $m = n$ 且适当重排后 $p_i$ 与 $q_i$ 相伴）

**定理 42.2.3**：PID $\implies$ UFD。

**证明**（概要）：

（存在性）若存在非零非单位元素 $a$ 不能分解为不可约元素的乘积，则可构造无穷长的严格增链 $(a) \subsetneq (a_1) \subsetneq (a_2) \subsetneq \cdots$。但 $\bigcup (a_i)$ 是理想，在 PID 中为主理想 $(d)$，$d$ 属于某个 $(a_n)$，导致链终止，矛盾。

（唯一性）由定理 42.2.2，PID 中不可约元素是素元素。若 $p_1 \cdots p_m = q_1 \cdots q_n$，$p_1$ 是素的，则 $p_1 \mid q_j$（某个 $j$）。$q_j$ 不可约，故 $p_1$ 与 $q_j$ 相伴。消去 $p_1$ 和 $q_j$，对剩余部分归纳。$\blacksquare$

**推论 42.2.4**：$F[x]$ 是 UFD。

---

### 42.3 Gauss 引理与 Eisenstein 判别法

**定义 42.3.1（本原多项式）**：$f \in \mathbb{Z}[x]$ 称为**本原多项式**，若其系数的最大公因数为 $1$。

**定理 42.3.1（Gauss 引理）**：两个本原多项式的乘积是本原多项式。

**证明**：设 $f = \sum a_i x^i$，$g = \sum b_j x^j$ 为本原多项式。若 $fg$ 不是本原的，则存在素数 $p$ 整除 $fg$ 的所有系数。设 $a_r$ 是 $f$ 中第一个不被 $p$ 整除的系数，$b_s$ 是 $g$ 中第一个不被 $p$ 整除的系数。则 $fg$ 的 $x^{r+s}$ 系数为

$$
c_{r+s} = \sum_{i+j = r+s} a_i b_j = a_r b_s + \sum_{i < r \text{ 或 } j < s} a_i b_j
$$

由 $r, s$ 的选法，$a_r b_s$ 不被 $p$ 整除，而其余项至少有一个因子被 $p$ 整除，矛盾。故 $fg$ 是本原的。$\blacksquare$

**定理 42.3.2（Gauss 引理——推论）**：若 $f \in \mathbb{Z}[x]$ 在 $\mathbb{Q}[x]$ 中可约，则 $f$ 在 $\mathbb{Z}[x]$ 中也可约。

**证明**：设 $f = gh$（$g, h \in \mathbb{Q}[x]$）。通分可得 $df = g_1 h_1$（$g_1, h_1 \in \mathbb{Z}[x]$，$d \in \mathbb{Z}$）。提取 $g_1, h_1$ 的各系数的最大公因数，得 $g_1 = c_1 g^*$，$h_1 = c_2 h^*$（$g^*, h^*$ 本原）。由 Gauss 引理，$g^* h^*$ 本原，故 $d = c_1 c_2$。从而 $f = c_1 c_2 g^* h^*$ 在 $\mathbb{Z}[x]$ 中可约。$\blacksquare$

**定理 42.3.3（Eisenstein 判别法）**：设 $f(x) = a_n x^n + \cdots + a_1 x + a_0 \in \mathbb{Z}[x]$。若存在素数 $p$ 使得

(i) $p \nmid a_n$
(ii) $p \mid a_i$（$i = 0, 1, \ldots, n-1$）
(iii) $p^2 \nmid a_0$

则 $f$ 在 $\mathbb{Q}[x]$ 中不可约。

**证明**：假设 $f = gh$（$g, h \in \mathbb{Z}[x]$，非单位）。设 $g = b_r x^r + \cdots + b_0$，$h = c_s x^s + \cdots + c_0$（$r + s = n$）。

由于 $a_0 = b_0 c_0$ 且 $p \mid a_0$ 但 $p^2 \nmid a_0$，不妨设 $p \mid b_0$ 但 $p \nmid c_0$。

$p \nmid a_n$ 意味着 $p \nmid b_r$ 且 $p \nmid c_s$。设 $b_k$ 是 $b_0, \ldots, b_r$ 中第一个不被 $p$ 整除的系数。则 $k \leq r < n$。

考虑 $a_k = \sum_{i=0}^{k} b_i c_{k-i}$。对 $i < k$，$p \mid b_i$；对 $i = k$，$p \nmid b_k$ 且 $p \nmid c_0$（因为 $c_0$ 不被 $p$ 整除）。故 $p \nmid a_k$。但 $k < n$，由条件 (ii) $p \mid a_k$，矛盾。$\blacksquare$

**例 42.3.1**：$x^n - p$ 在 $\mathbb{Q}[x]$ 中不可约（取素数 $p$ 作为 Eisenstein 素数）。

---

### 42.4 代数基本定理（陈述与推论）

**定理 42.4.1（代数基本定理）**：任何非常数多项式 $f \in \mathbb{C}[x]$ 在 $\mathbb{C}$ 中有根。

**注记 42.4.1**：代数基本定理的完整证明需要复分析（卷十）或拓扑学（卷十一）的工具。此处陈述结果，以便在多项式理论中使用。

**推论 42.4.2**：$\mathbb{C}[x]$ 中的不可约多项式恰为一次多项式。

**推论 42.4.3**：$\mathbb{R}[x]$ 中的不可约多项式为一次多项式或判别式为负的二次多项式。

**推论 42.4.4**：任何 $n$ 次复系数多项式 $f(x) = a_n x^n + \cdots + a_0$ 可分解为

$$
f(x) = a_n (x - \alpha_1)(x - \alpha_2) \cdots (x - \alpha_n)
$$

其中 $\alpha_1, \ldots, \alpha_n \in \mathbb{C}$（重根按重数计算）。

---

---

---

## Ch 61 模论基础
### 43.1 模的定义与基本概念

**定义 43.1.1（模）**：设 $R$ 为环。一个**左 $R$-模**是一个阿贝尔群 $(M, +)$ 配备标量乘法 $R \times M \to M$，$(r, m) \mapsto rm$，满足：

1. $r(m + n) = rm + rn$
2. $(r + s)m = rm + sm$
3. $(rs)m = r(sm)$
4. $1_R \cdot m = m$（若 $R$ 含幺）

**评注 43.1.1**：当 $R$ 为域时，$R$-模就是 $R$ 上的向量空间。模论是线性代数的自然推广——将标量从域推广到环。

**定义 43.1.2（子模、商模、同态）**：与向量空间的子空间、商空间、线性映射的定义完全类似。

**定理 43.1.1（模的同构定理）**：与向量空间和群的同构定理完全类似，有第一、第二、第三同构定理。

---

### 43.2 自由模

**定义 43.2.1（线性无关与基）**：设 $M$ 为 $R$-模。$\{m_1, \ldots, m_n\} \subseteq M$ 称为**线性无关**的，若 $\sum r_i m_i = 0 \implies r_i = 0$（$\forall i$）。若 $\{m_1, \ldots, m_n\}$ 线性无关且生成 $M$，则称为 $M$ 的一组**基**。

**定义 43.2.2（自由模）**：有基的 $R$-模称为**自由模**。$R^n = \{(r_1, \ldots, r_n) \mid r_i \in R\}$ 是秩为 $n$ 的自由模的典范例子。

**注记 43.2.1**：与向量空间不同，不是所有模都有基。例如 $\mathbb{Z}_6$ 作为 $\mathbb{Z}$-模没有基（因为 $6 \cdot m = 0$ 对所有 $m$ 成立，但标量 $6 \neq 0$）。

---

### 43.3 主理想整环上的有限生成模

**定理 43.3.1（PID 上有限生成模的结构定理）**：设 $R$ 为 PID，$M$ 为有限生成 $R$-模。则

$$
M \cong R^r \oplus R/(d_1) \oplus R/(d_2) \oplus \cdots \oplus R/(d_k)
$$

其中 $r \geq 0$，$d_1, d_2, \ldots, d_k \in R$ 为非零非单位元素，满足 $d_1 \mid d_2 \mid \cdots \mid d_k$。$r$ 和 $d_1, \ldots, d_k$（在相伴意义下）由 $M$ 唯一确定。

**证明**（概要）：设 $M$ 由 $n$ 个元素生成。则存在满同态 $\varphi : R^n \to M$。$\ker \varphi$ 是 $R^n$ 的子模。由 Smith 正规形理论，存在 $R^n$ 的基使得 $\ker \varphi$ 由 $d_1 e_1, \ldots, d_k e_k$ 生成（$d_1 \mid \cdots \mid d_k$），其余基向量不在 $\ker \varphi$ 中。因此 $M \cong R^n / \ker \varphi \cong R/(d_1) \oplus \cdots \oplus R/(d_k) \oplus R^{n-k}$。令 $r = n - k$ 即得。$\blacksquare$

**推论 43.3.2（有限阿贝尔群的结构定理）**：任何有限生成阿贝尔群同构于

$$
\mathbb{Z}^r \oplus \mathbb{Z}_{d_1} \oplus \cdots \oplus \mathbb{Z}_{d_k}
$$

其中 $d_1 \mid d_2 \mid \cdots \mid d_k$。

**证明**：$\mathbb{Z}$ 是 PID。有限生成阿贝尔群 = 有限生成 $\mathbb{Z}$-模。由定理 43.3.1 直接得到。$\blacksquare$

**推论 43.3.3（Jordan 标准形的模论证明）**：设 $V$ 为 $F$ 上的 $n$ 维向量空间，$T \in \mathcal{L}(V)$。通过 $f(x) \cdot v = f(T)v$ 使 $V$ 成为 $F[x]$-模。$F[x]$ 是 PID。由结构定理，$V \cong \bigoplus F[x]/(p_i(x)^{e_i})$（$p_i$ 不可约）。每个 $F[x]/(p_i^{e_i})$ 对应一个 Jordan 块。这给出了 Jordan 标准形的一个简洁证明。

**注记 43.3.1**：上述推论给出了卷六 Ch 54 中 Jordan 标准形的完整证明框架。

---

---

---

## Ch 62 域扩张
### 44.1 代数扩张与超越扩张

**定义 44.1.1（域扩张）**：若 $F \subseteq K$ 均为域，则称 $K$ 为 $F$ 的**域扩张**，记为 $K/F$。

$K$ 可视为 $F$ 上的向量空间，其维数称为扩张的**次数**，记为 $[K : F]$。

**定义 44.1.2（代数元与超越元）**：设 $K/F$ 为域扩张，$\alpha \in K$。

- 若存在非零多项式 $f \in F[x]$ 使得 $f(\alpha) = 0$，则称 $\alpha$ 为 $F$ 上的**代数元**
- 否则称 $\alpha$ 为 $F$ 上的**超越元**

**定义 44.1.3（极小多项式）**：设 $\alpha$ 为 $F$ 上的代数元。在 $F[x]$ 中满足 $f(\alpha) = 0$ 的非零多项式中，次数最低的首一多项式称为 $\alpha$ 在 $F$ 上的**极小多项式**，记为 $m_{\alpha, F}(x)$。

**定理 44.1.1（极小多项式的基本性质）**：

(i) $m_{\alpha, F}(x)$ 在 $F[x]$ 中不可约
(ii) 若 $f \in F[x]$ 满足 $f(\alpha) = 0$，则 $m_{\alpha, F} \mid f$
(iii) $F(\alpha) \cong F[x]/(m_{\alpha, F}(x))$，且 $[F(\alpha) : F] = \deg m_{\alpha, F}$

**证明**：

(i) 若 $m_{\alpha, F} = gh$（$g, h$ 次数更低），则 $g(\alpha)h(\alpha) = 0$，故 $g(\alpha) = 0$ 或 $h(\alpha) = 0$，与 $m_{\alpha, F}$ 的次数最低性矛盾。

(ii) 多项式带余除法 + 次数最低性（与极小多项式的证明类似）。

(iii) 定义同态 $\varphi : F[x] \to F(\alpha)$ 为 $\varphi(f) = f(\alpha)$。$\ker \varphi = (m_{\alpha, F})$。由第一同构定理，$F[x]/(m_{\alpha, F}) \cong \operatorname{im} \varphi$。由于 $m_{\alpha, F}$ 不可约，$(m_{\alpha, F})$ 是极大理想，故 $F[x]/(m_{\alpha, F})$ 是域。$\operatorname{im} \varphi$ 包含 $F$ 和 $\alpha$，且是最小的这样的域，故 $\operatorname{im} \varphi = F(\alpha)$。

$F(\alpha)$ 作为 $F$-向量空间，基为 $\{1, \alpha, \ldots, \alpha^{n-1}\}$（$n = \deg m_{\alpha, F}$），故 $[F(\alpha) : F] = n$。$\blacksquare$

**定义 44.1.4（单扩张）**：若 $K = F(\alpha)$（$\alpha \in K$），则称 $K/F$ 为**单扩张**。若 $\alpha$ 是代数元，则称为**单代数扩张**。

---

### 44.2 有限扩张与代数扩张

**定义 44.2.1（有限扩张与代数扩张）**：

- 若 $[K : F] < \infty$，称 $K/F$ 为**有限扩张**
- 若 $K$ 中每个元素都是 $F$ 上的代数元，称 $K/F$ 为**代数扩张**

**定理 44.2.1（次数塔公式）**：设 $F \subseteq K \subseteq L$ 为域扩张。则

$$
[L : F] = [L : K] \cdot [K : F]
$$

**证明**：设 $\{x_1, \ldots, x_m\}$ 为 $K$ 在 $F$ 上的基，$\{y_1, \ldots, y_n\}$ 为 $L$ 在 $K$ 上的基。可以证明 $\{x_i y_j \mid 1 \leq i \leq m, 1 \leq j \leq n\}$ 是 $L$ 在 $F$ 上的基。$\blacksquare$

**定理 44.2.2**：有限扩张 $\implies$ 代数扩张。

**证明**：设 $[K : F] = n$。对任意 $\alpha \in K$，$1, \alpha, \ldots, \alpha^n$ 这 $n+1$ 个元素在 $n$ 维 $F$-向量空间 $K$ 中必线性相关。故存在不全为零的 $a_i \in F$ 使得 $\sum a_i \alpha^i = 0$，即 $\alpha$ 是代数元。$\blacksquare$

**定理 44.2.3**：$K/F$ 是有限扩张当且仅当 $K = F(\alpha_1, \ldots, \alpha_n)$，其中每个 $\alpha_i$ 是 $F$ 上的代数元。

**证明**：若 $K/F$ 有限，取 $K$ 在 $F$ 上的基 $\{\alpha_1, \ldots, \alpha_n\}$，则 $K = F(\alpha_1, \ldots, \alpha_n)$，且每个 $\alpha_i$ 是代数元。

反之，若 $K = F(\alpha_1, \ldots, \alpha_n)$（$\alpha_i$ 代数），则 $[F(\alpha_1) : F] < \infty$，$[F(\alpha_1, \alpha_2) : F(\alpha_1)] < \infty$，...，由塔公式乘积有限。$\blacksquare$

---

### 44.3 分裂域

**定义 44.3.1（分裂域）**：设 $f \in F[x]$ 为非常数多项式。$F$ 的扩域 $K$ 称为 $f$ 在 $F$ 上的**分裂域**，若

1. $f$ 在 $K[x]$ 中可分解为一次因式的乘积
2. $K = F(\alpha_1, \ldots, \alpha_n)$，其中 $\alpha_i$ 为 $f$ 在 $K$ 中的根

**定理 44.3.1（分裂域的存在性）**：对任何 $f \in F[x]$，$f$ 在 $F$ 上的分裂域存在。

**证明**：对 $\deg f$ 归纳。若 $\deg f = 1$，$F$ 自身就是分裂域。

若 $\deg f > 1$，取 $f$ 的一个不可约因子 $p(x)$。$K_1 = F[x]/(p(x))$ 是 $F$ 的扩域，且 $p(x)$ 在 $K_1$ 中有根 $\alpha_1 = x + (p(x))$。

在 $K_1[x]$ 中，$f(x) = (x - \alpha_1)g(x)$（$\deg g = \deg f - 1$）。由归纳假设，$g$ 在 $K_1$ 上有分裂域 $K$。则 $K$ 是 $f$ 在 $F$ 上的分裂域。$\blacksquare$

**定理 44.3.2（分裂域的唯一性）**：$f \in F[x]$ 在 $F$ 上的任何两个分裂域是同构的（$F$-同构）。

**证明**（概要）：对 $[K : F]$ 归纳。设 $K_1, K_2$ 为 $f$ 的两个分裂域。取 $f$ 的不可约因子 $p(x)$，设 $\alpha_1 \in K_1$，$\alpha_2 \in K_2$ 为 $p(x)$ 的根。则 $F(\alpha_1) \cong F[x]/(p(x)) \cong F(\alpha_2)$。在 $F(\alpha_1)$ 和 $F(\alpha_2)$ 上分别考虑 $f(x)/(x - \alpha_1)$ 和 $f(x)/(x - \alpha_2)$，由归纳可得同构可延拓到整个分裂域。$\blacksquare$

---

### 44.4 有限域

**定义 44.4.1（有限域）**：元素个数有限的域称为**有限域**（或 Galois 域）。

**定理 44.4.1（有限域的结构）**：

(i) 有限域 $F$ 的元素个数必为 $p^n$（$p$ 为素数，$n \geq 1$），其中 $p$ 为 $F$ 的特征（$\operatorname{char} F$）
(ii) 对任意素数 $p$ 和正整数 $n$，存在唯一的（同构意义下）$p^n$ 元有限域，记为 $\mathbb{F}_{p^n}$
(iii) $\mathbb{F}_{p^n}$ 是 $x^{p^n} - x$ 在 $\mathbb{F}_p$ 上的分裂域

**证明**：

(i) 有限域 $F$ 必包含其素子域 $\mathbb{F}_p$（$p = \operatorname{char} F$）。$F$ 是 $\mathbb{F}_p$ 上的有限维向量空间，设维数为 $n$，则 $|F| = p^n$。

(ii) 考虑多项式 $x^{p^n} - x \in \mathbb{F}_p[x]$。其形式导数 $p^n x^{p^n-1} - 1 = -1 \neq 0$，故无重根。设 $K$ 为该多项式的分裂域。$K$ 中满足 $x^{p^n} = x$ 的元素恰为 $p^n$ 个（因为无重根），且它们构成 $K$ 的子域（由特征 $p$ 的性质，$(a+b)^p = a^p + b^p$）。因此该子域本身即为 $p^n$ 个元素的域。

唯一性：任何 $p^n$ 元域 $F$ 中，非零元素乘法群 $F^\times$ 的阶为 $p^n-1$，故所有元素满足 $x^{p^n} - x = 0$。因此 $F$ 是 $x^{p^n} - x$ 的分裂域，由分裂域的唯一性得证。$\blacksquare$

**定理 44.4.2（有限域的乘法群）**：$\mathbb{F}_{p^n}^{\times}$ 是 $p^n-1$ 阶循环群。

**证明**：$\mathbb{F}_{p^n}^{\times}$ 是有限阿贝尔群。由有限阿贝尔群的结构定理，$\mathbb{F}_{p^n}^{\times} \cong \mathbb{Z}_{d_1} \oplus \cdots \oplus \mathbb{Z}_{d_k}$（$d_1 \mid \cdots \mid d_k$）。所有元素满足 $x^{d_k} = 1$。但 $x^{d_k} - 1$ 在域中最多有 $d_k$ 个根，而 $|\mathbb{F}_{p^n}^{\times}| = p^n - 1$，故 $d_k = p^n - 1$，$k = 1$。因此 $\mathbb{F}_{p^n}^{\times}$ 是循环群。$\blacksquare$

**推论 44.4.3（有限域中的本原元）**：$\mathbb{F}_{p^n}$ 中存在元素 $\alpha$ 使得 $\mathbb{F}_{p^n} = \mathbb{F}_p(\alpha)$。事实上，$\mathbb{F}_{p^n}^{\times}$ 的任何生成元都具有此性质。

---

### 44.5 尺规作图不可能性（概述）

**定理 44.5.1（可构造数）**：实数 $\alpha$ 称为**可构造数**（即可用尺规作图从单位线段构造），当且仅当存在域扩张链

$$
\mathbb{Q} = F_0 \subseteq F_1 \subseteq \cdots \subseteq F_k \subseteq \mathbb{R}
$$

使得 $[F_i : F_{i-1}] \leq 2$ 且 $\alpha \in F_k$。

**推论 44.5.2**：可构造数 $\alpha$ 满足 $[\mathbb{Q}(\alpha) : \mathbb{Q}] = 2^m$（$m \geq 0$）。

**定理 44.5.3（三大尺规作图不可能问题）**：

(i) **倍立方体**：$\sqrt[3]{2}$ 不可构造（$[\mathbb{Q}(\sqrt[3]{2}) : \mathbb{Q}] = 3$，不是 $2$ 的幂）
(ii) **三等分任意角**：$\cos 20^\circ$ 不可构造（极小多项式为 $8x^3 - 6x + 1$，次数为 $3$）
(iii) **化圆为方**：$\sqrt{\pi}$ 不可构造（$\pi$ 是超越数，$[\mathbb{Q}(\pi) : \mathbb{Q}] = \infty$）

**证明**：

(i) $x^3 - 2$ 在 $\mathbb{Q}[x]$ 中不可约（Eisenstein 判别法，$p = 2$）。故 $[\mathbb{Q}(\sqrt[3]{2}) : \mathbb{Q}] = 3 \neq 2^m$。

(ii) $\cos 3\theta = 4\cos^3 \theta - 3\cos \theta$。令 $\theta = 20^\circ$，则 $\cos 60^\circ = 1/2$，故 $4\cos^3 20^\circ - 3\cos 20^\circ = 1/2$，即 $8\cos^3 20^\circ - 6\cos 20^\circ - 1 = 0$。可证 $8x^3 - 6x - 1$ 在 $\mathbb{Q}[x]$ 中不可约，故 $[\mathbb{Q}(\cos 20^\circ) : \mathbb{Q}] = 3 \neq 2^m$。

(iii) Lindemann 定理（1882 年）证明 $\pi$ 是超越数，故 $[\mathbb{Q}(\pi) : \mathbb{Q}] = \infty$。$\blacksquare$

---

**注记 44.5.1**：Galois 理论的完整展开（包括方程可解性、$n$ 次一般方程不可根式解等）将在卷十三（抽象代数 II）中详细讨论。本章仅建立域扩张的基本理论，为 Galois 理论做好准备。$\blacksquare$

---

---

---

## 第63章：除环与 Brauer 群
除环（即体，skew field）是非交换代数结构的核心研究对象之一。Brauer 群则将域上中心单代数的分类组织为阿贝尔群。

### 48.1 Frobenius 定理与有限除环

**定义 48.1**（中心单代数）：域 $\mathbb{F}$ 上的有限维代数 $A$ 称为 **中心单** 若 $Z(A) = \mathbb{F}$（中心恰为 $\mathbb{F}$）且 $A$ 是单代数（无真双边理想）。

**定理 48.1**（Frobenius）：$\mathbb{R}$ 上的有限维除环仅为 $\mathbb{R}$、$\mathbb{C}$ 和 $\mathbb{H}$（四元数，Hamilton, 1843）。

*证明思路*：设 $D$ 为 $\mathbb{R}$ 上除环，取 $d \in D \setminus \mathbb{R}$，则 $\mathbb{R}(d) \cong \mathbb{C}$。若 $\dim_{\mathbb{R}} D > 2$，取 $d' \notin \mathbb{R}(d)$，其平方为负实数，导出关系 $ij = -ji$，推出 $D$ 包含四元数代数，由非交换性推得 $D = \mathbb{H}$。

**定理 48.2**（Wedderburn 小定理）：有限除环必为域（交换）。

*证明思路*（Witt, 1931）：利用共轭类的群作用，通过类方程和分圆多项式分析，矛盾于整除关系。

### 48.2 Brauer 群

**定义 48.2**（Brauer 群）：在中心单代数上定义等价关系 $A \sim B \iff A \otimes M_n(\mathbb{F}) \cong B \otimes M_m(\mathbb{F})$（矩阵代数稳定化）。等价类的集合在张量积下构成阿贝尔群 $\operatorname{Br}(\mathbb{F})$，其逆元由反代数 $A^{op}$ 给出。

**定理 48.3**（Skolem-Noether）：设 $A$ 为 $\mathbb{F}$ 上中心单代数，则 $A$ 的任意自同构均为内自同构：对任意 $\varphi \in \operatorname{Aut}_{\mathbb{F}}(A)$ 存在 $a \in A^{\times}$ 使 $\varphi(x) = a x a^{-1}$。

**例**：$\operatorname{Br}(\mathbb{R}) \cong \mathbb{Z}/2\mathbb{Z}$（仅含 $[\mathbb{R}]$ 和 $[\mathbb{H}]$）；$\operatorname{Br}(\mathbb{F}_q) = 0$（有限域除环必为域）；$\operatorname{Br}(\mathbb{Q}_p)$ 在类域论中等价于 $\mathbb{Q}/\mathbb{Z}$。

---

---

---

## 第64章（补充）
格论（Lattice Theory）是序结构与代数结构交汇的数学分支，由 Birkhoff（1930s）系统化。它在泛代数、域论、逻辑和计算机科学中有广泛应用。格（lattice）既是偏序集（每对元素有上确界和下确界），也是具有两个二元运算（$\vee$ 和 $\wedge$）的代数结构。

### 格的基础理论

**定义**（格 / lattice）：偏序集 $(L, \leq)$ 是**格**，如果对任意 $a, b \in L$，存在上确界 $a \vee b$（join）和下确界 $a \wedge b$（meet）。等价地，格是装备两个满足结合律、交换律和吸收律（absorption）的二元运算的代数结构：
$$a \vee (a \wedge b) = a, \quad a \wedge (a \vee b) = a$$

**例**：
- 集合的幂集 $(\mathcal{P}(X), \subseteq)$（$\vee = \cup$，$\wedge = \cap$）
- 群的子群族（子群格，$\vee$ 为生成的子群，$\wedge$ 为交）
- 环的理想族（理想格）
- 拓扑空间的闭集族
- $\mathbb{N}$ 上的整除偏序：$a \vee b = \operatorname{lcm}(a, b)$，$a \wedge b = \gcd(a, b)$

**定义**（完备格 / complete lattice）：格 $L$ 是**完备格**，如果任意子集（不限限于二元）有上确界和下确界。每个完备格有最大元 $\top = \bigvee L$ 和最小元 $\bot = \bigwedge L$。幂集格是完备的。

**定理**（Knaster-Tarski 不动点定理）：完备格 $L$ 上的保序映射 $f: L \to L$（即 $x \leq y \implies f(x) \leq f(y)$）必有不动点。事实上，不动点集构成完备格，且最小不动点为 $\bigwedge \{x : f(x) \leq x\}$。该定理是计算机科学中指称语义（denotational semantics）和程序验证的数学基础。

### 分配格、模格与Boolean代数

**定义**（分配格）：格 $L$ 是**分配格**，若满足分配律：$a \vee (b \wedge c) = (a \vee b) \wedge (a \vee c)$（等价于其对偶形式）。幂集格是分配的；子群格一般不是。

**定理**（Birkhoff-Stone 表示定理，1930s）：每个分配格同构于某个集合的集合代数的子格（均以 $\cup, \cap$ 为运算）。换言之，分配格的可表示性由其序结构完全确定。

**定义**（模格 / modular lattice）：格 $L$ 是**模格**（Dedekind），若 $a \leq c \implies a \vee (b \wedge c) = (a \vee b) \wedge c$。所有分配格是模格，所有正规子群组成的子群格是模格（Dedekind定理）。模格是代数几何中维数理论的代数骨架（Krull维数和高度函数）。

**定义**（Boolean代数）：**Boolean代数**是具有补运算（$a \vee \neg a = \top$，$a \wedge \neg a = \bot$）的分配格。每个Boolean代数同构于某个集合的幂集Boolean代数的子代数（Stone表示定理，1936）。

**定理**（Stone对偶 / Stone duality）：Boolean代数的范畴反等价于完全不连通的紧 Hausdorff 空间（**Stone空间**）的范畴。这推广了有限Boolean代数到全体集合的有限幂集的对应。

### Galois联络与闭包算子

**定义**（Galois联络）：偏序集 $(P, \leq)$ 和 $(Q, \leq)$ 之间的**Galois联络**是一对映射 $f: P \to Q$ 和 $g: Q \to P$，满足
$$f(p) \leq q \iff p \leq g(q) \quad (\forall p \in P, q \in Q)$$
这等价于 $f$ 和 $g$ 均保序（$p_1 \leq p_2 \implies f(p_1) \leq f(p_2)$）且 $f \circ g$ 和 $g \circ f$ 是扩张（closure）或核算（kernel）算子。

**例**：
- Galois理论中的Galois联络：固定 Galois 扩张 $E/F$。$f(H) = E^H$（中间域 $E$ 的子域→子群），$g(K) = \operatorname{Gal}(E/K)$（子群→中间域）。这是反序的Galois联络：$H \leq K \iff E^K \subseteq E^H$
- 代数几何中：理想 $I \subset k[x_1, \ldots, x_n]$ ↔ 代数集 $V(I) \subset \mathbb{A}^n$ 是 Galois 联络
- Dedekind-MacNeille完备化：通过 $f(A) = \{u : \forall a \in A, a \leq u\}$（上界算子）和 $g(B) = \{l : \forall b \in B, l \leq b\}$（下界算子），任何偏序集可嵌入完备格

**定义**（闭包算子 / closure operator）：$P$ 上的**闭包算子**是映射 $c: P \to P$ 满足：(1) $p \leq c(p)$（扩张）；(2) $p \leq q \implies c(p) \leq c(q)$（单调）；(3) $c(c(p)) = c(p)$（幂等）。闭包算子的不动点构成 $P$ 的完备子半格。例子：拓扑空间的 Kuratowski 闭包、凸包、线性生成、代数闭包、逻辑中的演绎闭包。


*卷七：抽象代数 I终。*


*卷七：抽象代数 I终。*
