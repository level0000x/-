## Ch 65 域扩张
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

---

---
---

## 第66章：除环与 Brauer 群
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

---

---
---

## 第67章（补充）
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


*卷七：抽象代数 I终。*


*卷八：抽象代数（一）终。*
---

## 泛代数基础

### 代数理论的形式定义

**定义 1**（符号集）：一个**符号集**（signature）$\Sigma$ 是一族函数符号，每个符号 $f \in \Sigma$ 附有元数（arity）$\mathrm{ar}(f) \in \mathbb{N}$。零元符号（$\mathrm{ar}(f) = 0$）称为**常量符号**。

**定义 2**（$\Sigma$-代数）：一个 $\Sigma$-**代数**是一个偶对 $\mathbf{A} = (A, (f^{\mathbf{A}})_{f \in \Sigma})$，其中 $A$ 是非空集合（承载集），每个 $f^{\mathbf{A}}: A^{\mathrm{ar}(f)} \to A$ 是 $A$ 上的 $\mathrm{ar}(f)$ 元运算。

**定义 3**（项代数）：设 $X$ 是变元集合。$\Sigma$-**项**的集合 $T_\Sigma(X)$ 归纳定义为：
1. 每个 $x \in X$ 是项。
2. 每个常量符号 $c \in \Sigma$ 是项。
3. 若 $f \in \Sigma$，$\mathrm{ar}(f) = n$，且 $t_1, \ldots, t_n$ 是项，则 $f(t_1, \ldots, t_n)$ 是项。

$T_\Sigma(X)$ 本身以自然方式成为 $\Sigma$-代数：对 $f \in \Sigma$，定义 $f^{T_\Sigma(X)}(t_1, \ldots, t_n) = f(t_1, \ldots, t_n)$。$T_\Sigma(X)$ 是 $\Sigma$-代数范畴中的自由代数，满足以下普遍性质：对任意 $\Sigma$-代数 $\mathbf{A}$ 和任意映射 $\varphi: X \to A$，存在唯一的 $\Sigma$-同态 $\bar{\varphi}: T_\Sigma(X) \to \mathbf{A}$ 延拓 $\varphi$。

**定义 4**（等式）：一个 $\Sigma$-**等式**是形如 $s \approx t$ 的公式，其中 $s, t \in T_\Sigma(X)$。$\Sigma$-代数 $\mathbf{A}$ **满足** $s \approx t$，记作 $\mathbf{A} \models s \approx t$，若对每个赋值 $h: X \to A$，有 $\bar{h}(s) = \bar{h}(t)$。

### 代数簇与Birkhoff定理

**定义 5**（代数簇）：$\Sigma$-代数的类 $\mathcal{V}$ 称为一个**代数簇**（variety）或**等式类**，若存在等式集合 $E \subseteq T_\Sigma(X) \times T_\Sigma(X)$，使得 $\mathcal{V} = \{\mathbf{A} \mid \mathbf{A} \models e \text{ 对所有 } e \in E\}$。

**定理 1**（Birkhoff HSP定理，1935）：$\Sigma$-代数的一个非空类 $\mathcal{V}$ 是代数簇当且仅当 $\mathcal{V}$ 在以下三个运算下封闭：
- $\mathbf{H}$：同态像（homomorphic images）
- $\mathbf{S}$：子代数（subalgebras）
- $\mathbf{P}$：直积（direct products）

**证明**：（$\Rightarrow$）设 $\mathcal{V} = \mathrm{Mod}(E)$ 是等式定义的类。需证 $\mathcal{V}$ 在 $\mathbf{H}, \mathbf{S}, \mathbf{P}$ 下封闭。

$\mathbf{S}$-封闭：设 $\mathbf{B} \leq \mathbf{A} \in \mathcal{V}$。对任意等式 $s \approx t \in E$ 和赋值 $h: X \to B$，视为 $h: X \to A$，由 $\mathbf{A} \models s \approx t$ 知 $\bar{h}(s) = \bar{h}(t)$，而 $\bar{h}$ 的像在 $\mathbf{B}$ 的承载集中，故 $\mathbf{B} \models s \approx t$。因此 $\mathbf{B} \in \mathcal{V}$。

$\mathbf{H}$-封闭：设 $\varphi: \mathbf{A} \to \mathbf{B}$ 是满 $\Sigma$-同态，$\mathbf{A} \in \mathcal{V}$。对任意赋值 $h: X \to B$，因 $\varphi$ 是满射，可选取 $\tilde{h}: X \to A$ 使得 $\varphi \circ \tilde{h} = h$。则 $\bar{h}(s) = \varphi(\bar{\tilde{h}}(s)) = \varphi(\bar{\tilde{h}}(t)) = \bar{h}(t)$，故 $\mathbf{B} \models s \approx t$，即 $\mathbf{B} \in \mathcal{V}$。

$\mathbf{P}$-封闭：设 $\mathbf{A}_i \in \mathcal{V}$（$i \in I$），$\mathbf{A} = \prod_{i \in I} \mathbf{A}_i$。对等式 $s \approx t \in E$ 和赋值 $h: X \to A$，由直积定义及每个 $\mathbf{A}_i \models s \approx t$，在每个分量上 $\pi_i(\bar{h}(s)) = \bar{\pi_i \circ h}(s) = \bar{\pi_i \circ h}(t) = \pi_i(\bar{h}(t))$，故 $\bar{h}(s) = \bar{h}(t)$。得 $\mathbf{A} \in \mathcal{V}$。

（$\Leftarrow$）设 $\mathcal{V}$ 在 $\mathbf{H}, \mathbf{S}, \mathbf{P}$ 下封闭。令 $E = \{(s, t) \mid \mathcal{V} \models s \approx t\}$ 是 $\mathcal{V}$ 满足的所有等式。需证 $\mathcal{V} = \mathrm{Mod}(E)$。显然 $\mathcal{V} \subseteq \mathrm{Mod}(E)$。关键在反向包含。

对任意 $\mathbf{A} \in \mathrm{Mod}(E)$，需证 $\mathbf{A} \in \mathcal{V}$。构造自由代数：对足够大的集合 $Y$（可取 $Y = A$），令 $\mathbf{F} = \mathbf{F}_{\mathcal{V}}(Y)$ 是 $\mathcal{V}$ 中的自由代数。由自由性，存在满同态 $\varphi: \mathbf{F} \to \mathbf{A}$。还需验证 $\mathbf{F} \in \mathcal{V}$：自由代数 $\mathbf{F}_{\mathcal{V}}(Y)$ 构造为 $T_\Sigma(Y)$ 商去由 $E$ 生成的同余 $\theta_{\mathcal{V}}(Y)$。由于 $\mathcal{V}$ 在 $\mathbf{P}$ 下封闭，$\mathbf{F}$ 可嵌入 $\prod_{\mathbf{B} \in \mathcal{V}, |B| \le |Y|} \mathbf{B}$ 的适当幂（因为 $\mathcal{V}$ 局部小），且因 $\mathcal{V}$ 在 $\mathbf{S}$ 和 $\mathbf{P}$ 下封闭，该直积在 $\mathcal{V}$ 中，其子代数 $\mathbf{F}$ 也在 $\mathcal{V}$ 中。最后由 $\mathbf{H}$-封闭，$\mathbf{A} = \varphi(\mathbf{F}) \in \mathcal{V}$。$\blacksquare$

### 自由代数

**定义 6**（簇中的自由代数）：设 $\mathcal{V}$ 是 $\Sigma$-代数簇，$X$ 是集合。$\mathcal{V}$ 在 $X$ 上的**自由代数** $\mathbf{F}_{\mathcal{V}}(X)$ 是 $\Sigma$-代数，配备映射 $\eta_X: X \to F_{\mathcal{V}}(X)$，满足普遍性质：对任意 $\mathbf{A} \in \mathcal{V}$ 和任意映射 $f: X \to A$，存在唯一的 $\Sigma$-同态 $\bar{f}: \mathbf{F}_{\mathcal{V}}(X) \to \mathbf{A}$ 使得 $\bar{f} \circ \eta_X = f$。

**定理 2**（自由代数的构造）：对任意代数簇 $\mathcal{V} = \mathrm{Mod}(E)$ 和任意集合 $X$，自由代数 $\mathbf{F}_{\mathcal{V}}(X)$ 存在且在唯一同构意义下唯一。具体构造为：

$$\mathbf{F}_{\mathcal{V}}(X) = T_\Sigma(X) / \theta_E$$

其中 $\theta_E$ 是由等式 $E$ 诱导的最小同余关系：

$$\theta_E = \bigcap \{\theta \in \mathrm{Con}(T_\Sigma(X)) \mid T_\Sigma(X)/\theta \in \mathcal{V}\}$$

**证明**：首先构造项代数 $T_\Sigma(X)$。定义 $\theta_{\mathcal{V}}$ 为使得商代数属于 $\mathcal{V}$ 的所有同余的交。由于 $\mathcal{V}$ 中代数的直积仍在 $\mathcal{V}$ 中（Birkhoff定理），且商代数 $T_\Sigma(X)/\theta_{\mathcal{V}}$ 可嵌入所有这些直积，因此 $T_\Sigma(X)/\theta_{\mathcal{V}} \in \mathcal{V}$。设 $\mathbf{F}_{\mathcal{V}}(X) = T_\Sigma(X)/\theta_{\mathcal{V}}$，$\eta_X(x) = [x]_{\theta_{\mathcal{V}}}$。

验证普遍性质：设 $\mathbf{A} \in \mathcal{V}$，$f: X \to A$。由 $T_\Sigma(X)$ 的自由性，$f$ 唯一延拓为 $\hat{f}: T_\Sigma(X) \to \mathbf{A}$。令 $\ker \hat{f}$ 为同余核，则 $T_\Sigma(X)/\ker \hat{f} \cong \mathrm{Im}(\hat{f}) \leq \mathbf{A}$，故在 $\mathcal{V}$ 中（$\mathbf{S}$-封闭）。因此 $\theta_{\mathcal{V}} \subseteq \ker \hat{f}$，$\hat{f}$ 通过商降为 $\bar{f}: \mathbf{F}_{\mathcal{V}}(X) \to \mathbf{A}$。唯一性由 $\eta_X(X)$ 生成 $\mathbf{F}_{\mathcal{V}}(X)$ 保证。$\blacksquare$

### 同余格与置换性

**定义 7**（同余格）：$\Sigma$-代数 $\mathbf{A}$ 的所有同余关系在包含序下构成完备格 $\mathrm{Con}(\mathbf{A})$，其交为集合论交，并为所有包含给合之同余的交。

**定义 8**（代数簇）：设 $\mathcal{V}$ 是 $\Sigma$-代数簇。对任意 $\mathbf{A} \in \mathcal{V}$，$\mathrm{Con}(\mathbf{A})$ 是完备格。

**定义 9**（同余交换性）：代数 $\mathbf{A}$ 称为**同余交换的**，若对任意 $\theta_1, \theta_2 \in \mathrm{Con}(\mathbf{A})$，有 $\theta_1 \circ \theta_2 = \theta_2 \circ \theta_1$。一个簇 $\mathcal{V}$ 称为同余交换的，若其中每个代数都是同余交换的。

**定理 3**（同余交换性的等价格）：$\mathbf{A}$ 中 $\theta_1 \circ \theta_2 = \theta_2 \circ \theta_1$ 对所有 $\theta_1, \theta_2 \in \mathrm{Con}(\mathbf{A})$ 成立，当且仅当 $\mathrm{Con}(\mathbf{A})$ 中的并满足 $\theta_1 \vee \theta_2 = \theta_1 \circ \theta_2$。

**证明**：一般地，$\theta_1 \vee \theta_2 = \bigcup_{n \ge 1} (\theta_1 \circ \theta_2)^n$（关系的复合迭代）。若 $\theta_1 \circ \theta_2 = \theta_2 \circ \theta_1$，则 $(\theta_1 \circ \theta_2)^2 = \theta_1 \circ (\theta_2 \circ \theta_1) \circ \theta_2 = \theta_1 \circ (\theta_1 \circ \theta_2) \circ \theta_2 = \theta_1 \circ \theta_2$（由传递性 $\theta_i \circ \theta_i \subseteq \theta_i$ 和交换性），故需递推到任意 $n$ 知 $(\theta_1 \circ \theta_2)^n = \theta_1 \circ \theta_2$，从而 $\theta_1 \vee \theta_2 = \theta_1 \circ \theta_2$。反之亦然。$\blacksquare$

### Malcev条件

**定义 10**（Malcev项与Malcev条件）：一个代数簇 $\mathcal{V}$ 具有**同余交换性**当且仅当存在三元项 $p(x, y, z)$（称为 **Malcev项**）满足：

$$p(x, x, y) \approx y, \quad p(x, y, y) \approx x$$

对所有 $\mathbf{A} \in \mathcal{V}$ 成立。具有 Malcev 项的簇称为 **Malcev簇**。

**定理 4**（Malcev刻画定理）：$\Sigma$-代数簇 $\mathcal{V}$ 是同余交换的当且仅当 $\mathcal{V}$ 是 Malcev 簇。

**证明**：（$\Leftarrow$）设 $\mathcal{V}$ 有 Malcev 项 $p$。对 $\mathbf{A} \in \mathcal{V}$ 和 $\theta_1, \theta_2 \in \mathrm{Con}(\mathbf{A})$，若 $(a, c) \in \theta_1 \circ \theta_2$，即存在 $b$ 使得 $a \equiv_{\theta_1} b \equiv_{\theta_2} c$。计算：

$$a = p(a, b, b) \equiv_{\theta_1} p(a, a, b) = b \equiv_{\theta_2} p(b, c, c) = b = p(b, b, c) \equiv_{\theta_1} p(b, c, c) = p(a, b, b) = a$$

更简洁地：$a = p(a, b, b) \equiv_{\theta_2} p(a, b, c) \equiv_{\theta_1} p(b, b, c) = c$，故 $(a, c) \in \theta_2 \circ \theta_1$。因此 $\theta_1 \circ \theta_2 \subseteq \theta_2 \circ \theta_1$。由对称性得相等。

（$\Rightarrow$）设 $\mathcal{V}$ 同余交换。考虑自由代数 $\mathbf{F} = \mathbf{F}_{\mathcal{V}}(\{x, y, z\})$ 及其上的两个同余 $\theta_1 = \mathrm{Cg}(x, y)$ 和 $\theta_2 = \mathrm{Cg}(y, z)$（由生成对 $(x,y)$ 和 $(y,z)$ 生成的主同余）。则有 $(x, z) \in \theta_1 \circ \theta_2$（通过 $y$），故由交换性 $(x, z) \in \theta_1 \vee \theta_2 = \theta_2 \circ \theta_1$。存在 $t \in F$ 使得 $x \equiv_{\theta_2} t \equiv_{\theta_1} z$。$t$ 的自由变量的表达式即为所求的 Malcev 项 $p(x, y, z)$。由构造验证 $p(x,x,y) = y$ 和 $p(x,y,y) = x$。$\blacksquare$

**例子**：群簇是 Malcev 簇，Malcev 项为 $p(x,y,z) = xy^{-1}z$。环簇也是 Malcev 簇，项为 $p(x,y,z) = x - y + z$。

### Lawvere理论

**定义 11**（Lawvere理论）：一个 **Lawvere理论** $\mathcal{T}$ 是一个小范畴，其对象恰为自然数 $0, 1, 2, \ldots$，使得每个对象 $n$ 是 $\mathbb{N}$ 中 $n$ 个对象 $1$ 的直积（即对 $n$ 有自然同构 $n \cong 1 \times 1 \times \cdots \times 1$（$n$次）的范畴论意义）。特别地，$\mathcal{T}$ 是有有限积的范畴，且每个对象是固定对象 $1$ 的某个幂。

**定义 12**（Lawvere理论的模型）：Lawvere理论 $\mathcal{T}$ 的一个**模型**是积保持函子 $M: \mathcal{T} \to \mathbf{Set}$。模型之间的态射是自然变换。所有模型形成范畴 $\mathrm{Mod}(\mathcal{T}) = \mathbf{Prod}(\mathcal{T}, \mathbf{Set})$。

**定理 5**（代数簇与Lawvere理论的等价）：存在范畴等价：

$$\{\Sigma\text{-代数簇}\} \simeq \{\text{Lawvere理论}\}$$

具体地：给定代数簇 $\mathcal{V}$，对应的 Lawvere 理论 $\mathcal{T}_{\mathcal{V}}$ 定义为：
- $\mathcal{T}_{\mathcal{V}}(m, n) = \mathrm{Hom}_{\mathcal{V}}(\mathbf{F}_{\mathcal{V}}(m), \mathbf{F}_{\mathcal{V}}(n))$，其中 $\mathbf{F}_{\mathcal{V}}(k)$ 是 $k$ 个生成元的自由代数。

反过来，给定 Lawvere 理论 $\mathcal{T}$，其模型范畴 $\mathrm{Mod}(\mathcal{T})$ 是一个代数簇。

**证明概要**：首先验证 $\mathcal{T}_{\mathcal{V}}$ 是 Lawvere 理论。对对象 $n$，自由代数 $\mathbf{F}_{\mathcal{V}}(n)$ 有 $n$ 个自由生成元 $x_1, \ldots, x_n$，由自由性，$\mathbf{F}_{\mathcal{V}}(n) \cong \mathbf{F}_{\mathcal{V}}(1)^n$ 的验证通过在 $\mathcal{V}$ 上计算 Hom 集得到。

其次，需证 $\mathrm{Mod}(\mathcal{T}_{\mathcal{V}}) \simeq \mathcal{V}$。对每 $\mathbf{A} \in \mathcal{V}$，定义函子 $M_{\mathbf{A}}(n) = \mathrm{Hom}_{\mathcal{V}}(\mathbf{F}_{\mathcal{V}}(n), \mathbf{A}) \cong A^n$，这是因为从 $n$ 个生成元的自由代数到 $\mathbf{A}$ 的同态与 $A^n$ 中的元一一对应。此对应是自然的，且 $M_{\mathbf{A}}$ 保积：$M_{\mathbf{A}}(n \times m) \cong A^{n+m} \cong A^n \times A^m \cong M_{\mathbf{A}}(n) \times M_{\mathbf{A}}(m)$。

反之，给定模型 $M$，定义 $\Sigma$-代数结构在 $A = M(1)$ 上：对 $f \in \Sigma$（$\mathrm{ar}(f) = n$），$f$ 对应 $\mathcal{T}_{\mathcal{V}}(n, 1)$ 中的一个态射，通过 $M$ 作用给出 $A^n \to A$。这构成范畴等价。$\blacksquare$

### 补充：代数的替换性质与子直积

**定义 13**（子直积）：代数 $\mathbf{A}$ 称为一族代数 $\{\mathbf{A}_i\}_{i \in I}$ 的**子直积**，若存在单同态 $\mathbf{A} \hookrightarrow \prod_{i \in I} \mathbf{A}_i$，使得每个投射 $\pi_i|_{\mathbf{A}}: \mathbf{A} \to \mathbf{A}_i$ 是满射。

**定理 6**（Birkhoff子直积定理）：代数簇 $\mathcal{V}$ 中的每个代数同构于 $\mathcal{V}$ 中**子直不可约**（subdirectly irreducible）代数的子直积。子直不可约代数恰是那些有最小非零同余的代数。

**证明概要**：对任意 $\mathbf{A} \in \mathcal{V}$，考虑所有使得 $\bigwedge_{\theta \in S} \theta = 0_{\mathbf{A}}$ 的同余集族 $S$ 的全体。由选择引理（或格论中的完全分配性），存在 $S \subseteq \mathrm{Con}(\mathbf{A}) \setminus \{0_{\mathbf{A}}\}$ 使得所有非零同余中包含 $S$ 中某个元。对每个 $\theta \in S$，商代数 $\mathbf{A}/\theta$ 是子直不可约的（因 $\theta$ 是交不可约同余），且 $\mathbf{A} \hookrightarrow \prod_{\theta \in S} \mathbf{A}/\theta$ 是子直分解。$\blacksquare$

**注记**：子直不可约性是代数结构论的基石：群簇中，子直不可约群含于有限群或特定单群的变体；环簇中，子直不可约环与McCoy-素环相关。在Lawvere理论的对偶视角下，代数簇的研究等价于有限积完备范畴上的模型理论研究，这给出了Birkhoff定理的深层范畴论基础。

### 经典簇举例与拓展方向

群簇、环簇、格簇和模簇均为泛代数的核心研究对象。群簇中，交换群簇由 $xy \approx yx$ 定义；幂零群簇由特定换位子恒等式定义。环簇的Malcev项 $x - y + z$ 提供了丰富的同余理论。泛代数与范畴论的交汇——Lawvere理论、代数理论和monad的等价性——构成现代数学基础的三角结构：代数簇 $\leftrightarrow$ Lawvere理论 $\leftrightarrow$ 集合范畴上的有限秩monad。这一对应将Birkhoff定理推广到更一般的范畴上下文中，是Stone对偶和Gabriel-Ulmer对偶的自然推广。
