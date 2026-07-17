# 卷十五：代数几何

> 代数几何研究多项式方程组的解集——代数簇——的几何性质。它用交换代数（V12）的工具研究几何对象，用拓扑学（V10）和同调代数（V12 Ch 70）的方法计算不变量。本卷从经典仿射和射影簇出发，逐步引入概形语言和层上同调，为现代代数几何的核心工具奠定基础。

---

## 第81章：仿射代数簇
仿射代数簇是代数几何最基础的研究对象，它是多项式方程组的零点集，带有 Zariski 拓扑和坐标环结构。本章的核心是 Hilbert 零点定理，它建立了代数集与理想之间的深刻对应。

### 81.1 仿射代数集

**定义 81.1**（仿射空间）：域 $k$ 上的 $n$ 维**仿射空间** $\mathbb{A}_k^n$（或 $\mathbb{A}^n$）是 $k^n$ 作为集合，但赋予来自多项式环 $k[x_1, \ldots, x_n]$ 的几何结构。

**定义 81.2**（代数集）：设 $S \subseteq k[x_1, \ldots, x_n]$ 是多项式子集。$S$ 确定的**仿射代数集**（或零点集）为

$$V(S) = \{P \in \mathbb{A}^n : f(P) = 0 \text{ 对所有 } f \in S\}$$

若 $S = \{f_1, \ldots, f_m\}$ 有限，则 $V(S) = V(f_1, \ldots, f_m)$ 是 $m$ 个多项式方程的解集。

**定义 81.3**（理想）：若 $I$ 是 $k[x_1, \ldots, x_n]$ 的理想，记 $V(I) = V(S)$，其中 $S$ 是 $I$ 的任意生成元集。由 Hilbert 基定理（定理 68.2），$k[x_1, \ldots, x_n]$ 是 Noether 环，故每个理想 $I$ 由有限个多项式生成，因此 $V(I)$ 始终是有限个方程的解集。

**命题 81.1**（代数集的基本性质）：

1. $V(0) = \mathbb{A}^n$，$V(1) = \varnothing$
2. $\bigcap_\alpha V(I_\alpha) = V\left(\sum_\alpha I_\alpha\right)$（任意交）
3. $V(I) \cup V(J) = V(IJ) = V(I \cap J)$（有限并）

因此，代数集的补集构成了 $\mathbb{A}^n$ 上某个拓扑的闭集，称为 **Zariski 拓扑**。

*证明*：1 显然。2：$P \in \bigcap_\alpha V(I_\alpha)$ 当且仅当对所有 $\alpha$，$f(P) = 0$（$\forall f \in I_\alpha$），当且仅当 $P \in V(\sum_\alpha I_\alpha)$。3：$P \in V(I) \cup V(J)$ 当且仅当 $P \in V(I)$ 或 $P \in V(J)$。若 $P \in V(I)$，则对任意 $fg \in IJ$，$(fg)(P) = f(P)g(P) = 0$，故 $P \in V(IJ)$。反之，若 $P \notin V(I) \cup V(J)$，则存在 $f \in I$，$g \in J$ 使 $f(P) \neq 0$，$g(P) \neq 0$。则 $fg \in IJ$ 且 $(fg)(P) \neq 0$，故 $P \notin V(IJ)$。∎

**定义 81.4**（Zariski 拓扑）：$\mathbb{A}^n$ 上的 **Zariski 拓扑** 以代数集为闭集。开集是代数集的补集。

**注释 81.1**：Zariski 拓扑不是 Hausdorff 的（除非 $n = 0$）。任意两个非空开集都有非空交（不可约性）。这与分析中的拓扑形成鲜明对比，体现了代数几何的独特性质。

### 81.2 Hilbert 零点定理

**定义 81.5**（理想的方向）：对子集 $X \subseteq \mathbb{A}^n$，定义

$$I(X) = \{f \in k[x_1, \ldots, x_n] : f(P) = 0 \text{ 对所有 } P \in X\}$$

$I(X)$ 是 $k[x_1, \ldots, x_n]$ 的理想（称为 $X$ 的**消去理想**）。

**定义 81.6**（根理想）：理想 $I$ 的**根**为

$$\sqrt{I} = \{f \in k[x_1, \ldots, x_n] : f^m \in I \text{ 对某个 } m \geq 1\}$$

若 $I = \sqrt{I}$，则称 $I$ 为**根理想**。

**定理 81.2**（Hilbert 零点定理，Nullstellensatz）：设 $k$ 是代数闭域。则对任意理想 $I \subseteq k[x_1, \ldots, x_n]$，

$$I(V(I)) = \sqrt{I}$$

此外，若 $V(I) = \varnothing$，则 $I = (1)$（弱零点定理）。

*证明思路*：弱零点定理是拉比诺维奇技巧（Rabinowitsch trick）的推论：若 $I$ 是极大理想，则 $k[x_1, \ldots, x_n]/I$ 是 $k$ 的有限扩张，由 $k$ 代数闭知 $I = (x_1 - a_1, \ldots, x_n - a_n)$。强零点定理由弱零点定理和商环的构造推得。∎

**推论 81.3**（代数集与根理想的一一对应）：在代数闭域 $k$ 上，映射 $I \mapsto V(I)$ 和 $X \mapsto I(X)$ 给出了

$$\{\text{根理想 } I \subseteq k[x_1, \ldots, x_n]\} \longleftrightarrow \{\text{代数集 } X \subseteq \mathbb{A}^n\}$$

之间的一一对应（反向包含序）。极大理想对应于单点集。

### 81.3 不可约性与代数簇

**定义 81.7**（不可约代数集）：代数集 $X$ 称为**不可约的**，如果 $X$ 不能写成两个真闭子集的并：$X = X_1 \cup X_2$ 推出 $X = X_1$ 或 $X = X_2$。不可约的仿射代数集称为**仿射代数簇**（affine variety）。

**命题 81.4**：代数集 $X$ 不可约当且仅当 $I(X)$ 是素理想。

*证明*：$X$ 可约 $\iff$ $X = V(I) \cup V(J) = V(IJ)$（$X \neq V(I), V(J)$）$\iff$ $IJ \subseteq I(X)$ 但 $I \nsubseteq I(X)$，$J \nsubseteq I(X)$ $\iff$ $I(X)$ 不是素理想。∎

**推论 81.5**（不可约分解）：每个代数集 $X$ 可唯一地写成有限个不可约代数簇的并 $X = X_1 \cup \cdots \cup X_r$，其中 $X_i \nsubseteq X_j$（$i \neq j$）。这对应于 $I(X)$ 的极小素理想分解。

*证明*：由 $k[x_1, \ldots, x_n]$ 是 Noether 环，每个根理想是有限个极小素理想的交。唯一性由素理想的极小性保证。∎

### 81.4 坐标环与态射

**定义 81.8**（坐标环）：仿射代数簇 $X \subseteq \mathbb{A}^n$ 的**坐标环**（或仿射坐标环）定义为

$$A(X) = k[x_1, \ldots, x_n] / I(X)$$

$A(X)$ 是有限生成 $k$-代数，且是整环（因为 $I(X)$ 是素理想）。$A(X)$ 的元素是 $X$ 上的正则函数。

**定义 81.9**（正则函数）：$X$ 上的**正则函数**是多项式函数 $f: X \to k$，即 $f \in A(X)$。$X$ 上的正则函数全体构成环 $A(X)$。

**命题 81.6**（坐标环的函子性）：仿射代数簇与有限生成整 $k$-代数之间的范畴等价：

$$\{\text{仿射代数簇 } / k\} \longleftrightarrow \{\text{有限生成整 } k\text{-代数}\}^{\text{op}}$$

等价由 $X \mapsto A(X)$ 和 $A \mapsto \operatorname{Spec}_m(A)$（$A$ 的极大谱）给出。

**定义 81.10**（态射）：仿射代数簇 $X \subseteq \mathbb{A}^n$ 到 $Y \subseteq \mathbb{A}^m$ 的**态射**（正则映射）$\varphi: X \to Y$ 是每个分量由正则函数给出的映射：$\varphi = (f_1, \ldots, f_m)$，$f_i \in A(X)$，且 $\varphi(X) \subseteq Y$。

态射诱导坐标环的反向同态 $\varphi^*: A(Y) \to A(X)$，$\varphi^*(g) = g \circ \varphi$。

**定理 81.7**（仿射簇范畴等价）：映射 $X \mapsto A(X)$ 是仿射代数簇范畴与有限生成整 $k$-代数范畴的反向范畴等价。

**例 81.1**（有理函数域）：仿射代数簇 $X$ 的**有理函数域** $k(X)$ 定义为 $A(X)$ 的分式域。有理函数是 $X$ 上「几乎处处」定义的正则函数的等价类。

### 81.5 维数理论

**定义 81.11**（Krull 维数）：仿射代数簇 $X$ 的**维数** $\dim X$ 定义为 $A(X)$ 的 Krull 维数——即 $A(X)$ 中素理想链的最大长度：

$$\dim X = \max\{r : \mathfrak{p}_0 \subsetneq \mathfrak{p}_1 \subsetneq \cdots \subsetneq \mathfrak{p}_r \subseteq A(X), \mathfrak{p}_i \text{ 素理想}\}$$

**定义 81.12**（超越次数）：设 $K/k$ 是有限生成域扩张。$K$ 在 $k$ 上的**超越次数** $\operatorname{tr.deg}_k K$ 是 $K$ 中代数无关的极大子集的大小。

**定理 81.8**（维数与超越次数）：对仿射代数簇 $X$，

$$\dim X = \operatorname{tr.deg}_k k(X)$$

即 $X$ 的维数等于其有理函数域在 $k$ 上的超越次数。

**命题 81.9**（维数的基本性质）：
1. $\dim \mathbb{A}^n = n$
2. 若 $Y \subsetneq X$ 是不可约闭子簇，则 $\dim Y < \dim X$
3. 超曲面 $V(f) \subseteq \mathbb{A}^n$（$f$ 非常数）的维数为 $n-1$

**定理 81.10**（Krull 高度定理）：设 $A$ 是 Noether 环，$f \in A$ 非零因子。则 $f$ 生成的理想的每个极小素理想的高度为 $1$。特别地，每个真包含 $\{0\}$ 的极小素理想的高度为 $1$。

---

---

## 第82章：射影簇与态射
射影簇是射影空间中齐次多项式的零点集，其紧致性（在经典拓扑中）使其在几何中具有重要地位。本章引入射影簇、有理映射和双有理等价的概念。

### 82.1 射影空间

**定义 82.1**（射影空间）：域 $k$ 上的 $n$ 维**射影空间** $\mathbb{P}_k^n$（或 $\mathbb{P}^n$）是 $k^{n+1} \setminus \{0\}$ 在等价关系 $(x_0, \ldots, x_n) \sim (\lambda x_0, \ldots, \lambda x_n)$（$\lambda \in k^\times$）下的商。点 $(x_0 : \cdots : x_n)$ 称为**齐次坐标**。

**定义 82.2**（标准仿射开覆盖）：$\mathbb{P}^n$ 被 $n+1$ 个仿射开集覆盖：$U_i = \{(x_0 : \cdots : x_n) : x_i \neq 0\} \cong \mathbb{A}^n$（$i = 0, \ldots, n$）。同构由 $(x_0 : \cdots : x_n) \mapsto (x_0/x_i, \ldots, \widehat{x_i/x_i}, \ldots, x_n/x_i)$ 给出。

**定义 82.3**（齐次多项式）：多项式 $F \in k[x_0, \ldots, x_n]$ 称为 $d$ 次**齐次**的，如果 $F(\lambda x_0, \ldots, \lambda x_n) = \lambda^d F(x_0, \ldots, x_n)$。齐次多项式在射影空间中的零点集有良定义（因为 $F(\lambda x) = 0 \iff F(x) = 0$）。

**定义 82.4**（射影代数集）：设 $S \subseteq k[x_0, \ldots, x_n]$ 是齐次多项式子集。$S$ 确定的**射影代数集**为

$$V_P(S) = \{P \in \mathbb{P}^n : F(P) = 0 \text{ 对所有齐次 } F \in S\}$$

齐次理想 $I$ 的射影零点集记作 $V_P(I)$。

**定义 82.5**（齐次理想）：$k[x_0, \ldots, x_n]$ 的理想 $I$ 称为**齐次理想**，如果 $I$ 可由齐次多项式生成。等价地，$I = \bigoplus_{d \geq 0} (I \cap R_d)$，其中 $R_d$ 是 $d$ 次齐次多项式空间。

**定理 82.1**（射影零点定理）：设 $k$ 是代数闭域，$I \subseteq k[x_0, \ldots, x_n]$ 是齐次理想。若 $V_P(I) = \varnothing$，则 $\sqrt{I} \supseteq (x_0, \ldots, x_n)$（即 $I$ 包含所有充分高次齐次多项式）。否则 $I_P(V_P(I)) = \sqrt{I}$，其中 $I_P$ 是射影消去理想。

**定义 82.6**（射影代数簇）：不可约的射影代数集称为**射影代数簇**（projective variety）。

**定义 82.7**（齐次坐标环）：射影簇 $X \subseteq \mathbb{P}^n$ 的**齐次坐标环**为

$$S(X) = k[x_0, \ldots, x_n] / I(X)$$

$S(X)$ 是分次 $k$-代数：$S(X) = \bigoplus_{d \geq 0} S_d$。与仿射情形不同，$S(X)$ 的分次元素不是 $X$ 上的函数（因为齐次坐标不是良定义的），但 $S_d$ 中两个元素的比值是 $X$ 上的有理函数。

### 82.2 有理映射与双有理等价

**定义 82.8**（有理映射）：设 $X$ 是代数簇。$X$ 到 $Y$ 的**有理映射** $\varphi: X \dashrightarrow Y$ 是定义在 $X$ 的某个非空开子集 $U$ 上的态射。两个有理映射视为相等，如果它们在交上一致。

**定义 82.9**（双有理等价）：代数簇 $X$ 和 $Y$ 称为**双有理等价**的（记作 $X \sim_{\text{bir}} Y$），如果存在有理映射 $\varphi: X \dashrightarrow Y$ 和 $\psi: Y \dashrightarrow X$，使得 $\psi \circ \varphi = \operatorname{id}_X$ 和 $\varphi \circ \psi = \operatorname{id}_Y$（作为有理映射）。

**命题 82.2**：$X$ 和 $Y$ 双有理等价当且仅当它们的有理函数域同构：$k(X) \cong k(Y)$（作为 $k$ 的扩域）。

**定义 82.10**（双有理几何）：双有理几何研究代数簇在双有理等价下的不变量。维数是双有理不变量。光滑性不是双有理不变量（奇点解消！）。

**定理 82.3**（Hironaka 奇点解消，陈述）：特征 $0$ 的域上的每个代数簇都双有理等价于一个光滑射影代数簇。

*说明*：Hironaka 的奇点解消定理是代数几何的里程碑式成果，其证明极其复杂，获得了 Fields 奖。正特征情形在 21 世纪由多位数学家基本解决。

**例 82.1**（二次 Cremona 变换）：$\mathbb{P}^2 \dashrightarrow \mathbb{P}^2$ 由 $(x:y:z) \mapsto (yz:xz:xy)$ 给出。这是双有理自同构（非态射！），在 $x=0$、$y=0$、$z=0$ 处未定义。

**例 82.2**（爆破）：$\mathbb{A}^2$ 在原点处的**爆破**是 $\tilde{\mathbb{A}}^2 = \{(x, y, (u:v)) \in \mathbb{A}^2 \times \mathbb{P}^1 : xv = yu\}$。投影 $\pi: \tilde{\mathbb{A}}^2 \to \mathbb{A}^2$ 在原点外是同构，$\pi^{-1}(0) \cong \mathbb{P}^1$（例外除子）。爆破是解消奇点的基本操作。

### 82.3 Veronese 嵌入与 Segre 嵌入

**定义 82.11**（Veronese 嵌入）：$d$ 次 **Veronese 嵌入** $\nu_d: \mathbb{P}^n \to \mathbb{P}^N$（$N = \binom{n+d}{d} - 1$）由所有 $d$ 次单项式给出：

$$\nu_d(x_0 : \cdots : x_n) = (\cdots : x^I : \cdots)$$

其中 $x^I$ 遍历所有 $d$ 次单项式。$\nu_d$ 是闭嵌入，其像由二次关系定义。

**定义 82.12**（Segre 嵌入）：**Segre 嵌入** $\sigma: \mathbb{P}^n \times \mathbb{P}^m \to \mathbb{P}^{nm + n + m}$ 由

$$\sigma((x_0 : \cdots : x_n), (y_0 : \cdots : y_m)) = (\cdots : x_i y_j : \cdots)_{0 \leq i \leq n, 0 \leq j \leq m}$$

给出。$\sigma$ 是闭嵌入，将积 $\mathbb{P}^n \times \mathbb{P}^m$ 实现为 $\mathbb{P}^{nm+n+m}$ 中的射影簇。

**命题 82.4**：射影簇的积是射影簇（通过 Segre 嵌入）。仿射簇的积是仿射簇（$\mathbb{A}^n \times \mathbb{A}^m \cong \mathbb{A}^{n+m}$）。

---

---

## 第83章：概形理论初步
概形（scheme）是 Grothendieck 在 20 世纪 60 年代引入的代数几何基本语言，它将代数簇推广到任意交换环，统一了代数几何、数论和表示论。本章从结构层出发，定义仿射概形和一般概形。

### 83.1 层

**定义 83.1**（预层）：拓扑空间 $X$ 上的集合（或 Abel 群、环）**预层** $\mathcal{F}$ 是：对每个开集 $U \subseteq X$ 赋予一个集合 $\mathcal{F}(U)$，对每个包含 $V \subseteq U$ 赋予一个限制映射 $\rho_{UV}: \mathcal{F}(U) \to \mathcal{F}(V)$，满足 $\rho_{UU} = \operatorname{id}$ 和 $\rho_{VW} \circ \rho_{UV} = \rho_{UW}$。

**定义 83.2**（层）：预层 $\mathcal{F}$ 称为**层**，如果满足以下粘合条件：对任意开覆盖 $U = \bigcup_{i \in I} U_i$ 和截面 $s_i \in \mathcal{F}(U_i)$ 满足 $s_i|_{U_i \cap U_j} = s_j|_{U_i \cap U_j}$（对所有 $i, j$），存在唯一的 $s \in \mathcal{F}(U)$ 使得 $s|_{U_i} = s_i$（对所有 $i$）。

**定义 83.3**（茎）：$\mathcal{F}$ 在点 $x \in X$ 处的**茎**为 $\mathcal{F}_x = \varinjlim_{U \ni x} \mathcal{F}(U)$（关于限制映射的归纳极限）。$\mathcal{F}_x$ 的元素是 $\mathcal{F}$ 在 $x$ 附近的「芽」（germ）。

**定义 83.4**（环层空间）：**环层空间** $(X, \mathcal{O}_X)$ 是拓扑空间 $X$ 和 $\mathcal{O}_X$ 上环层 $\mathcal{O}_X$ 的配对。$\mathcal{O}_X$ 称为**结构层**。态射 $(X, \mathcal{O}_X) \to (Y, \mathcal{O}_Y)$ 是连续映射 $f: X \to Y$ 和环层同态 $f^\#: \mathcal{O}_Y \to f_*\mathcal{O}_X$ 的配对。

### 83.2 仿射概形

**定义 83.5**（环的谱）：交换环 $A$ 的**谱** $\operatorname{Spec} A$ 是 $A$ 的所有素理想 $\mathfrak{p}$ 构成的集合。$\operatorname{Spec} A$ 上的 Zariski 拓扑以

$$V(I) = \{\mathfrak{p} \in \operatorname{Spec} A : \mathfrak{p} \supseteq I\}$$

为闭集（$I$ 是 $A$ 的理想）。

**定义 83.6**（结构层）：$\operatorname{Spec} A$ 上的结构层 $\mathcal{O}_{\operatorname{Spec} A}$ 定义为：对开集 $U \subseteq \operatorname{Spec} A$，

$$\mathcal{O}_{\operatorname{Spec} A}(U) = \{s: U \to \coprod_{\mathfrak{p} \in U} A_{\mathfrak{p}} : s(\mathfrak{p}) \in A_{\mathfrak{p}}, \text{局部地是分数}\}$$

其中 $A_{\mathfrak{p}}$ 是 $A$ 在 $\mathfrak{p}$ 处的局部化。$\mathcal{O}_{\operatorname{Spec} A}$ 是环层，其茎 $\mathcal{O}_{\operatorname{Spec} A, \mathfrak{p}} \cong A_{\mathfrak{p}}$。

**定义 83.7**（仿射概形）：**仿射概形**是一个环层空间 $(X, \mathcal{O}_X)$，它同构于某个交换环 $A$ 的 $(\operatorname{Spec} A, \mathcal{O}_{\operatorname{Spec} A})$。

**定理 83.1**（仿射概形范畴等价）：映射 $A \mapsto \operatorname{Spec} A$ 给出了交换环范畴与仿射概形范畴之间的反范畴等价。态射 $\operatorname{Spec} B \to \operatorname{Spec} A$ 一一对应于环同态 $A \to B$。

**命题 83.2**：对仿射代数簇 $X$（在代数闭域 $k$ 上），其极大谱 $\operatorname{Spec}_m A(X)$ 与 $X$（作为经典代数簇）同胚。仿射概形 $\operatorname{Spec} A(X)$ 包含了 $X$ 的所有不可约子簇的「一般点」，是经典簇的丰富化。

**例 83.1**（非约化概形）：$\operatorname{Spec} k[x]/(x^2)$ 是一个单点空间（唯一的素理想是 $(x)$），但其结构层的全局截面是 $k[x]/(x^2)$，包含幂零元 $x$。这对应了「双重点」的直观。

### 83.3 概形的定义

**定义 83.8**（概形）：**概形**是一个环层空间 $(X, \mathcal{O}_X)$，其中每点 $x \in X$ 存在开邻域 $U$ 使得 $(U, \mathcal{O}_X|_U)$ 是仿射概形。即概形局部地是交换环的谱。

**定义 83.9**（概形态射）：概形 $(X, \mathcal{O}_X)$ 到 $(Y, \mathcal{O}_Y)$ 的态射是作为环层空间的态射。

**定义 83.10**（$S$-概形）：固定基概形 $S$。$S$**-概形**是带有一个态射 $X \to S$ 的概形 $X$。$S = \operatorname{Spec} k$ 时，$S$-概形就是 $k$ 上的概形。

**定义 83.11**（分离态射）：概形 $X$ 称为**分离的**（separated），如果对角态射 $\Delta: X \to X \times X$ 是闭浸入。分离概形对应于 Hausdorff 空间的代数几何类比。

**定义 83.12**（概形的性质）：
- **Noether 概形**：可由有限个仿射概形覆盖，每个的环是 Noether 环
- **整概形**：不可约且约化（$\mathcal{O}_X(U)$ 无幂零元）
- **正规概形**：所有局部环 $\mathcal{O}_{X, x}$ 是整闭整环
- **光滑概形**：完备化后是形式幂级数环（类比于流形）

**定义 83.13**（射影概形）：射影空间 $\mathbb{P}^n_A = \operatorname{Proj} A[x_0, \ldots, x_n]$（$A$ 是环）的闭子概形称为**射影概形**。其中 $\operatorname{Proj}$ 是分次环的齐次谱。

**定理 83.3**（代数簇作为概形）：代数闭域 $k$ 上的代数簇范畴等价嵌入到 $k$ 上的有限型整分离概形范畴。概形语言将经典代数簇推广到任意环，并使「数论与几何的统一」成为可能。

### 83.4 纤维积与基变换

**定义 83.14**（纤维积）：概形范畴中，纤维积 $X \times_S Y$ 满足万有性质：对任意 $S$-概形 $Z$，

$$\operatorname{Hom}_S(Z, X \times_S Y) \cong \operatorname{Hom}_S(Z, X) \times \operatorname{Hom}_S(Z, Y)$$

在仿射层面，$\operatorname{Spec} B \times_{\operatorname{Spec} A} \operatorname{Spec} C \cong \operatorname{Spec}(B \otimes_A C)$。

**定义 83.15**（基变换）：给定态射 $f: X \to S$ 和基变换 $T \to S$，$X$ 的**基变换**为 $X_T = X \times_S T$。基变换是「在 $T$ 上重新看待 $X$」的操作。

**定义 83.16**（纤维）：态射 $f: X \to Y$ 在点 $y \in Y$ 处的**纤维** $X_y = X \times_Y \operatorname{Spec} k(y)$，其中 $k(y) = \mathcal{O}_{Y, y}/\mathfrak{m}_y$ 是剩余域。纤维是 $f$ 在 $y$ 上的几何纤维。

---

---

## 第84章：上同调方法
层上同调是代数几何最重要的计算工具，它推广了拓扑空间的上同调（V14），为 Riemann-Roch 定理、Serre 对偶和现代代数几何的核心定理提供了框架。

### 84.1 层上同调的定义

**定义 84.1**（层范畴）：拓扑空间 $X$ 上的 Abel 群层构成 Abel 范畴 $\mathbf{Sh}(X)$。它有足够多内射对象（内射层）。

**定义 84.2**（整体截面函子）：整体截面函子 $\Gamma(X, -): \mathbf{Sh}(X) \to \mathbf{Ab}$ 定义为 $\Gamma(X, \mathcal{F}) = \mathcal{F}(X)$。$\Gamma(X, -)$ 是左正合函子。

**定义 84.3**（层上同调）：$\mathcal{F}$ 的 $i$ 次**层上同调群** $H^i(X, \mathcal{F})$ 是整体截面函子的右导出函子：

$$H^i(X, \mathcal{F}) = R^i\Gamma(X, \mathcal{F})$$

具体计算：取内射分解 $0 \to \mathcal{F} \to \mathcal{I}^0 \to \mathcal{I}^1 \to \cdots$，则 $H^i(X, \mathcal{F}) = H^i(\Gamma(X, \mathcal{I}^\bullet))$。

**命题 84.1**（基本性质）：
1. $H^0(X, \mathcal{F}) = \Gamma(X, \mathcal{F})$
2. 短正合列 $0 \to \mathcal{F} \to \mathcal{G} \to \mathcal{H} \to 0$ 诱导长正合序列
3. 若 $\mathcal{F}$ 是内射层，则 $H^i(X, \mathcal{F}) = 0$（$i > 0$）

### 84.2 Čech 上同调

**定义 84.4**（Čech 复形）：设 $\mathfrak{U} = \{U_i\}_{i \in I}$ 是 $X$ 的开覆盖。对层 $\mathcal{F}$，定义 Čech 复形：

$$\check{C}^p(\mathfrak{U}, \mathcal{F}) = \prod_{i_0 < \cdots < i_p} \mathcal{F}(U_{i_0} \cap \cdots \cap U_{i_p})$$

微分 $\delta: \check{C}^p \to \check{C}^{p+1}$ 由 $(\delta s)_{i_0, \ldots, i_{p+1}} = \sum_{k=0}^{p+1} (-1)^k s_{i_0, \ldots, \widehat{i_k}, \ldots, i_{p+1}}|_{U_{i_0} \cap \cdots \cap U_{i_{p+1}}}$ 给出。

**定义 84.5**（Čech 上同调）：$\check{H}^p(\mathfrak{U}, \mathcal{F}) = H^p(\check{C}^\bullet(\mathfrak{U}, \mathcal{F}))$。取所有开覆盖的归纳极限得 **Čech 上同调** $\check{H}^p(X, \mathcal{F})$。

**定理 84.1**（Leray 定理）：若 $\mathfrak{U}$ 是 $X$ 的开覆盖，且对每个 $U_{i_0} \cap \cdots \cap U_{i_p}$ 和每个 $q > 0$，$H^q(U_{i_0} \cap \cdots \cap U_{i_p}, \mathcal{F}) = 0$，则 $\check{H}^p(\mathfrak{U}, \mathcal{F}) \cong H^p(X, \mathcal{F})$。

特别地，对仿射概形上的拟凝聚层和仿射开覆盖，Čech 上同调等于层上同调。

### 84.3 凝聚层与 Serre 定理

**定义 84.6**（$\mathcal{O}_X$-模层）：环层空间 $(X, \mathcal{O}_X)$ 上的 $\mathcal{O}_X$**-模层** $\mathcal{F}$ 是 Abel 群层，且对每个开集 $U$，$\mathcal{F}(U)$ 是 $\mathcal{O}_X(U)$-模，限制映射与模结构兼容。

**定义 84.7**（拟凝聚层与凝聚层）：$\mathcal{O}_X$-模层 $\mathcal{F}$ 称为**拟凝聚的**，如果局部地有表示 $\mathcal{O}_X^{\oplus J}|_U \to \mathcal{O}_X^{\oplus I}|_U \to \mathcal{F}|_U \to 0$。若 $I$ 和 $J$ 可取有限，则 $\mathcal{F}$ 称为**凝聚层**。

**定义 84.8**（Serre 捻层）：在射影空间 $\mathbb{P}^n_A$ 上，**Serre 捻层** $\mathcal{O}(d)$ 是分次 $A[x_0, \ldots, x_n]$-模 $A[x_0, \ldots, x_n](d)$（将次数平移 $d$）对应的层。对射影概形 $X \subseteq \mathbb{P}^n_A$，$\mathcal{O}_X(d) = \mathcal{O}(d)|_X$。

**定理 84.2**（Serre 定理）：设 $X$ 是 Noether 环 $A$ 上的射影概形，$\mathcal{F}$ 是 $X$ 上的凝聚层。则
1. 对每个 $i \geq 0$，$H^i(X, \mathcal{F})$ 是有限 $A$-模
2. 存在 $d_0$ 使得对 $d \geq d_0$，$H^i(X, \mathcal{F}(d)) = 0$（$i > 0$）
3. $\mathcal{F}(d)$ 由整体截面生成（$d \gg 0$）

其中 $\mathcal{F}(d) = \mathcal{F} \otimes_{\mathcal{O}_X} \mathcal{O}_X(d)$。

*证明思路*：将 $\mathcal{F}$ 推到 $\mathbb{P}^n_A$ 上，用 Čech 上同调计算。$\mathbb{P}^n_A$ 的 Čech 复形是有限 $A$-模的复形，故上同调是有限 $A$-模。消没性由 $d \to \infty$ 时 Čech 复形的分析得到。∎

**定理 84.3**（凝聚层的有限性，Grothendieck）：若 $X$ 是域 $k$ 上的真概形（proper scheme），$\mathcal{F}$ 是凝聚层，则 $H^i(X, \mathcal{F})$ 是有限维 $k$-向量空间。

### 84.4 Serre 对偶

**定理 84.4**（Serre 对偶，射影空间）：设 $X = \mathbb{P}^n_k$（$k$ 是域）。则对任意凝聚层 $\mathcal{F}$，存在自然的完美配对

$$H^i(X, \mathcal{F}) \times \operatorname{Ext}^{n-i}(\mathcal{F}, \omega_X) \to H^n(X, \omega_X) \cong k$$

其中 $\omega_X = \mathcal{O}_X(-n-1)$ 是 $\mathbb{P}^n$ 的**对偶化层**（canonical sheaf）。

*证明思路*：对 $\mathbb{P}^n_k$ 直接计算。用标准仿射开覆盖 $\{U_i = D_+(x_i)\}$ 的 Čech 上同调：$H^n(\mathbb{P}^n, \mathcal{O}(-n-1))$ 由 Čech $n$-余圈 $\frac{1}{x_0 \cdots x_n}$ 生成，同构于 $k$。对一般 $\mathcal{F}$，构造配对 $\operatorname{Ext}^{n-i}(\mathcal{F}, \omega) \times H^i(\mathcal{F}) \to H^n(\omega) \cong k$：将 $\operatorname{Ext}$ 类（代表 $\omega \to \mathcal{I}^\bullet$ 的态射）与 Čech 上同调类复合，利用 Yoneda 配对。非退化性通过对 $\mathcal{F} = \mathcal{O}(d)$ 的显式计算和凝聚层的有限长度归纳证明。

**定理 84.5**（Serre 对偶，一般形式）：设 $X$ 是域 $k$ 上的光滑射影簇，维数为 $n$。则存在**典范层** $\omega_X = \Omega_{X/k}^n$（$n$ 次微分形式的层），使得对任意凝聚层 $\mathcal{F}$，有自然同构

$$H^i(X, \mathcal{F}) \cong \operatorname{Ext}^{n-i}(\mathcal{F}, \omega_X)^\vee$$

特别地，$H^i(X, \mathcal{F}) \cong H^{n-i}(X, \mathcal{F}^\vee \otimes \omega_X)^\vee$（当 $\mathcal{F}$ 是局部自由层时）。

*证明思路*：由 Grothendieck 的对偶理论：真态射 $f: X \to \operatorname{Spec} k$ 有例外逆向像 $f^!$（右伴随于 $Rf_*$）。定义对偶化复形 $\omega_X^\bullet = f^! k$。对光滑 $X$，有 $\omega_X^\bullet \cong \omega_X[n]$。Serre 对偶是等式 $R\operatorname{Hom}(R\Gamma(X, \mathcal{F}), k) \cong R\Gamma(X, R\operatorname{\mathcal{H}\textit{om}}(\mathcal{F}, \omega_X^\bullet))$ 取上同调的结果。对射影空间，可通过直接 Čech 计算验证轨道同构。

**推论 84.6**（Serre 对偶的特殊情形）：
1. $\dim H^n(X, \mathcal{O}_X) = 1$（$H^n(X, \omega_X) \cong k$）
2. $H^i(X, \mathcal{O}_X) \cong H^{n-i}(X, \omega_X)^\vee$
3. 对曲线 $C$（$n = 1$），$H^1(C, \mathcal{F}) \cong \operatorname{Hom}(\mathcal{F}, \omega_C)^\vee$

### 84.5 Riemann-Roch 定理

**定义 84.9**（Euler 示性数）：凝聚层 $\mathcal{F}$ 的 **Euler 示性数**为

$$\chi(X, \mathcal{F}) = \sum_{i \geq 0} (-1)^i \dim_k H^i(X, \mathcal{F})$$

（有限和，由 Serre 定理保证）。

**定理 84.7**（Hirzebruch-Riemann-Roch 定理）：设 $X$ 是域 $k$ 上的光滑射影簇，$\mathcal{E}$ 是 $X$ 上的局部自由层（向量丛）。则

$$\chi(X, \mathcal{E}) = \int_X \operatorname{ch}(\mathcal{E}) \cdot \operatorname{td}(T_X)$$

其中 $\operatorname{ch}(\mathcal{E})$ 是 $\mathcal{E}$ 的 Chern 特征标，$\operatorname{td}(T_X)$ 是切丛的 Todd 类，$\int_X$ 表示在 $X$ 的基本类上的求值。

*证明思路*：(1) 由分裂原理，可假设 $\mathcal{E}$ 是线丛的直和，从而 $\operatorname{ch}(\mathcal{E})$ 由线丛的 Chern 根的指数和给出。(2) 对射影空间 $\mathbb{P}^n$ 上的线丛 $\mathcal{O}(d)$，直接计算 $\chi(\mathbb{P}^n, \mathcal{O}(d)) = \binom{n+d}{d}$，验证与 $\int \operatorname{ch}(\mathcal{O}(d)) \operatorname{td}(T_{\mathbb{P}^n})$ 一致。(3) 利用嵌入 $i: X \hookrightarrow \mathbb{P}^N$ 将一般情形约化到射影空间：由 Grothendieck-Riemann-Roch，$\chi(X, \mathcal{E}) = \chi(\mathbb{P}^N, i_*\mathcal{E})$，并用射影空间上的计算结果推得公式。Todd 类的定义 $\operatorname{td}(E) = \prod \frac{x_i}{1-e^{-x_i}}$ 确保了乘积公式在短正合列下的可加性。

**定理 84.8**（曲线上的 Riemann-Roch）：设 $C$ 是光滑射影曲线，$D$ 是 $C$ 上的除子。则

$$\ell(D) - \ell(K_C - D) = \deg D + 1 - g$$

其中 $\ell(D) = \dim H^0(C, \mathcal{O}_C(D))$，$K_C$ 是典范除子，$g = \dim H^1(C, \mathcal{O}_C)$ 是 $C$ 的亏格（genus）。

*证明思路*：应用 Serre 对偶定理 84.5：$\ell(K_C - D) = \dim H^1(C, \mathcal{O}_C(D))$。故 $\chi(\mathcal{O}_C(D)) = \ell(D) - \ell(K_C - D)$。而 $\chi(\mathcal{O}_C(D)) = \deg D + \chi(\mathcal{O}_C) = \deg D + 1 - g$（由 Riemann-Roch 的初等形式）。∎

**推论 84.9**（Riemann-Roch 的应用）：
1. $g = 0$ 时，$C \cong \mathbb{P}^1$（有理曲线）
2. $g = 1$ 时，$C$ 是椭圆曲线，$\ell(K_C) = 1$，$\deg K_C = 0$
3. $g \geq 2$ 时，典范映射 $C \to \mathbb{P}^{g-1}$ 是 $C$ 到其典范模型的态射

**定理 84.10**（Grothendieck-Riemann-Roch）：设 $f: X \to Y$ 是光滑射影簇之间的真态射。则对 $X$ 上的凝聚层 $\mathcal{F}$，

$$\operatorname{ch}(f_!\mathcal{F}) \cdot \operatorname{td}(T_Y) = f_*(\operatorname{ch}(\mathcal{F}) \cdot \operatorname{td}(T_X))$$

在 $Y$ 的 Chow 环（或有理上同调）中，其中 $f_! = \sum (-1)^i R^i f_* \mathcal{F}$。

---

---

## 第85章：环面簇与模空间
环面簇是代数几何与组合数学的交叉领域，建立了扇（代数几何）与凸多面体（组合学）之间的精确字典。本章从扇的构造出发引入环面簇，并讨论模空间理论和极小模型纲领。

### 85.1 环面簇的构造

**环面簇**（Toric Variety）是包含代数环面$T \cong (k^\times)^n$为稠密开子集、且$T$的群作用可延拓到全簇的正规代数簇。环面簇由组合几何数据——**扇**（fan）$\Sigma$——完全分类。设$N \cong \mathbb{Z}^n$为格，$M = \operatorname{Hom}(N, \mathbb{Z})$为对偶格。扇$\Sigma$是$N_{\mathbb{R}} = N \otimes \mathbb{R}$中一组强凸有理多面锥的集合，满足面封闭性和两两交为面的条件。每个锥$\sigma \in \Sigma$对应仿射环面簇$U_\sigma = \operatorname{Spec}(k[\sigma^\vee \cap M])$，其中$\sigma^\vee = \{m \in M_{\mathbb{R}} : \langle m, v \rangle \geq 0,\ \forall v \in \sigma\}$为对偶锥。沿公共面$\sigma \cap \tau$的自然粘合给出了环面簇$X_\Sigma$。

环面簇的几何性质一一对应于扇的组合性质：$X_\Sigma$光滑当且仅当每个锥$\sigma$由基的一部分生成（即$\det = \pm 1$）；$X_\Sigma$完备当且仅当$\Sigma$的支撑为整个$N_{\mathbb{R}}$；$X_\Sigma$是射影的当且仅当$\Sigma$是一个全维凸多面体的正规扇。经典例子：
- **射影空间**$\mathbb{P}^n$：对应于以$(e_0, \ldots, e_n)$（$e_0 = -\sum_{i=1}^n e_i$，$\{e_i\}$为$\mathbb{Z}^n$的标准基）为生成元的扇，其$\binom{n+1}{1}$个极大锥由任意$n$个生成元张成；
- **加权射影空间**$\mathbb{P}(a_0, \ldots, a_n)$：扇的生成元改为满足$\sum a_i u_i = 0$的有理向量；
- **Hirzebruch曲面**$\mathbb{F}_a = \mathbb{P}(\mathcal{O}_{\mathbb{P}^1} \oplus \mathcal{O}_{\mathbb{P}^1}(a))$（$a \geq 0$）：对应的二维扇由四个锥组成，其生成元为$(0, 1), (0, -1), (1, 0), (-1, -a)$。环面簇建立了代数几何与组合凸多面体之间的精确对应，使奇点解消、上同调计算等问题可转化为纯组合问题。

### 85.2 模空间理论

**模空间理论**将代数簇（或其他几何对象）的同构类参数化，使参数空间本身具有代数簇（或叠）结构。椭圆曲线的模空间是最经典的例子：域$k$上的椭圆曲线由**$j$-不变量**$j(E) = 1728 \cdot 4a^3/(4a^3 + 27b^2)$完全分类，故仿射直线$\mathbb{A}^1_j$是椭圆曲线的粗模空间（不分叉时）。加入尖点（$j = \infty$对应节点三次曲线）得到紧化$\mathbb{P}^1$。**曲线模空间**$M_g$：亏格$g \geq 2$光滑曲线的粗模空间维数为$3g-3$（Riemann，1857年），由Riemann-Roch定理通过计算$H^0(C, \omega_C^{\otimes 2})$（二阶微分）的自由度得到。Deligne和Mumford于1969年引入**稳定曲线**概念，构造了紧化模空间$\overline{M}_g$，并证明$M_g$是不可约拟射影代数簇。在双有理几何中，**典范环**$R(K_X) = \bigoplus_{m \geq 0} H^0(X, mK_X)$的$\operatorname{Proj}$给出了簇的典范模型，而Mori程序通过分析收缩映射对模空间的结构进行精细控制，实现了高维簇的分类。

### 85.3 双有理几何与极小模型纲领

**极小模型纲领**（MMP，Minimal Model Program）是双有理几何的核心算法，由Mori在1980年代奠基。对光滑射影簇$X$，其典范除子$K_X$的正负性是关键分类指标。**锥定理**（Cone Theorem）断言：$X$的曲线锥$\overline{NE}(X)$中与$K_X$负交的部分由极射线（extremal rays）$R_i$生成，每条极射线对应一个收缩映射$\operatorname{cont}_{R_i}: X \to Y_i$，有以下三种情形：
1. **纤维型**：$\dim Y < \dim X$，此时$X$是Mori纤维空间，终止；
2. **除子型**：收缩一个除子，$\dim Y = \dim X$，继续对$Y$做MMP；
3. **小收缩型**：例外集余维$\geq 2$，此时$K_Y$不是$\mathbb{Q}$-Cartier的，需要**翻转**（flip）：构造双有理映射$X \dashrightarrow X^+$使得$K_{X^+}$在翻转曲线上为正。

**Birkar-Cascini-Hacon-McKernan定理**（2010年）：特征零域上，任意光滑射影簇的典范环是有限生成的，且对数一般型簇的翻转存在。该结果证明了极小模型纲领在极大一般型的核心步骤，为此Birkar获得了2018年Fields奖。MMP的输出是一个极小模型（$K_X$是nef的）或Mori纤维空间，实现了双有理分类的最终目标。

---

---

## 第86章：Fano 簇与有理簇
Fano 簇和有理簇是双有理几何和正特征代数几何中最重要的对象之一。Fano 簇（反典范除子丰沛的光滑射影簇）的纤维正曲率（某种意义上）为 Mori 理论提供了基本构建单元，而有理簇问题（单有理簇是否必为有理簇）则是代数几何中最深刻的未解问题之一。

### 86.1 Fano 簇的基本性质

**定义 86.1**（Fano 簇）：特征 0 的代数闭域 $k$ 上的光滑射影簇 $X$ 称为 **Fano 簇**，若其反典范除子 $-K_X$ 是丰沛的（ample）。

等价地，$X$ 的典范丛 $\omega_X = \mathcal{O}_X(K_X)$ 的对偶丛 $\omega_X^{-1}$ 是丰沛的。

**定义 86.2**（Fano 指标）：Fano 簇 $X$ 的 **Fano 指标**（Fano index）定义为最大整数 $r$ 满足

$$-K_X = r H$$

其中 $H \in \operatorname{Pic}(X)$ 是丰沛除子类，且 $H$ 不被任何大于 1 的整数整除。通常可取 $H$ 为 $-K_X$ 在 $\operatorname{Pic}(X)/\operatorname{Tors}$ 中的原像。Fano 指标满足 $1 \leq r \leq \dim X + 1$（上界由 Kobayashi-Ochiai 定理保证）。

**命题 86.1**（Fano 簇的基本几何性质）：
1. Fano 簇是单有理的（uniruled）——即被有理曲线覆盖；
2. $\chi(X, \mathcal{O}_X) = 1$，且 $H^i(X, \mathcal{O}_X) = 0$ 对所有 $i > 0$ 成立（由 Kodaira 消没定理）；
3. Fano 簇的 Picard 数 $\rho(X)$ 可以为任意大的值。

### 86.2 二维和三维 Fano 簇的分类

**定理 86.1**（Del Pezzo 曲面分类）：二维 Fano 簇即 **del Pezzo 曲面**，由次数 $d = K_X^2$（$1 \leq d \leq 9$）分类：

| 次数 $d$ | Del Pezzo 曲面 | 描述 |
|----------|---------------|------|
| 9 | $\mathbb{P}^2$ | 射影平面 |
| 8 | $\mathbb{P}^1 \times \mathbb{P}^1$ 或 $\mathbb{F}_1$ | 二次曲面或一次爆破 $\mathbb{P}^2$ |
| 7 | $\mathbb{P}^2$ 上 2 点爆破 | |
| 6 | $\mathbb{P}^2$ 上 3 点爆破 | 三次曲面 |
| 5 | $\mathbb{P}^2$ 上 4 点爆破 | |
| 4 | $\mathbb{P}^2$ 上 5 点爆破 | $\mathbb{P}^4$ 中两个二次超曲面的交 |
| 3 | $\mathbb{P}^2$ 上 6 点爆破 | 三次曲面（$\mathbb{P}^3$ 中） |
| 2 | $\mathbb{P}^2$ 上 7 点爆破 | 四次曲面（$\mathbb{P}(1, 1, 1, 2)$） |
| 1 | $\mathbb{P}^2$ 上 8 点爆破 | 六次曲面（$\mathbb{P}(1, 1, 2, 3)$） |

*注：* $d = 3$ 的 del Pezzo 曲面即为 $\mathbb{P}^3$ 中的光滑三次曲面。著名的 27 条直线定理（Cayley-Salmon）断言：$\mathbb{P}^3$ 中每个光滑三次曲面上恰好有 27 条直线。

**定理 86.2**（三维 Fano 簇的分类，Iskovskikh 1977-1979，Mori-Mukai 1981-2003）：三维光滑 Fano 簇恰好有 **105 个形变族**（deformation families），按 Fano 指标 $r$ 和 Picard 数 $\rho$ 分类：

- Fano 指标 $r = 4$：仅 $\mathbb{P}^3$（1 族）；
- Fano 指标 $r = 3$：二次超曲面 $Q^3 \subset \mathbb{P}^4$（1 族）；
- Fano 指标 $r = 2$：包括 del Pezzo 三维簇（36 族，最大 Picard 数为 10）；
- Fano 指标 $r = 1$：其余 67 族（包括著名的素数 Fano 三维簇 $V_{22}$，由 Mukai 发现）。

*证明思路*：Iskovskikh 利用双有理几何的经典方法（线性系统、收缩映射）进行了初步分类。Mori 和 Mukai 运用 Mori 理论（极小模型纲领）的现代工具——特别是极射线收缩（extremal ray contraction）方法——系统化地完成了分类。核心策略是：对给定的 Fano 簇 $X$，选择 Mori 收缩 $\varphi: X \to Y$，然后对 $Y$ 应用归纳。关键步骤包括验证翻转（flip）不会发生（因为 $-K_X$ 丰沛保证了 Mori 收缩的三种可能性中只有纤维型和除子型出现）。∎

### 86.3 Mori 纤维空间与有理连通簇

**定义 86.3**（Mori 纤维空间）：**Mori 纤维空间**（Mori Fiber Space）是带有纤维型极射线收缩 $\varphi: X \to Y$ 的 $\mathbb{Q}$-因式簇 $X$，其中 $X$ 仅有 terminal 奇点，$Y$ 是 $\mathbb{Q}$-因式簇且 $\dim Y < \dim X$，一般纤维是 Fano 簇（带有 terminal 奇点）。

Mori 纤维空间是极小模型纲领（MMP）的三大输出类型之一。每个光滑射影簇通过 MMP 最终分解为 Mori 纤维空间（经由极小模型和翻转序列）。

**定义 86.4**（有理连通簇）：代数闭域上的光滑射影簇 $X$ 称为**有理连通的**（rationally connected），若其中的一般两点可以由有理曲线相连。

更精确地，存在有理映射 $\pi: \mathbb{P}^1 \times \cdots \times \mathbb{P}^1 \dashrightarrow X$ 使其像覆盖 $X$ 的开稠子集。

**定理 86.3**（Kollár-Miyaoka-Mori 定理，1992 年）：特征 0 的代数闭域上的光滑 Fano 簇是有理连通的。更一般地，光滑 Fano 簇是**有理链连通的**（rationally chain connected）——任意两点可由若干条有理曲线的链相连。

*证明思路*：利用 Mori 的弯曲-断裂引理（bend-and-break lemma）：由于 $-K_X$ 是丰沛的，对于 $X$ 上的一般曲线 $C$，有 $-K_X \cdot C > 0$。弯曲-断裂引理确保我们可以将穿过一般点的有理曲线"弯曲"（通过形变），使其收敛到一条可约曲线。这产生了足够多的有理曲线。再通过构造有理曲线的"组合链"来连接任意两点。Campana 独立地给出了等价结果。∎

**推论 86.4**：Fano 簇上的 Chow 群 $\operatorname{CH}_0(X)$ 是平凡群——即 $X$ 上任意两点模有理等价后相等。

### 86.4 Luroth 问题与有理性

**Luroth 问题**（1876 年）：设 $k \subset K \subset k(t_1, \ldots, t_n)$ 是嵌入在有理函数域中的子域。则 $K$ 本身是否有理（即同构于某个 $m$ 个变量的有理函数域）？

$n = 1$ 时 Luroth 定理给出肯定回答（$K \cong k(t)$）。$n = 2$ 时 Castelnuovo 定理（1894 年）在代数几何语言中断言：特征 0 的代数闭域上，单有理曲面必为有理曲面。

$n \geq 3$ 时 Luroth 问题的回答是**否定的**。反例构造是代数几何的重大里程碑：

**定理 86.5**（三维 Luroth 问题的反例）：

(1) **Artin-Mumford 反例**（1972 年）：利用 Brauer 群的三阶挠元（扭 3-形式）构造了特征 0 的代数闭域上的单有理三维簇 $X$，满足 $H^3(X, \mathbb{Z})_{\text{tors}} \neq 0$。由于任何有理簇均有无挠的上同调，$X$ 不能是有理的。

(2) **Clemens-Griffiths 反例**（1972 年）：三维光滑三次超曲面 $V_3 \subset \mathbb{P}^4$ 是单有理的，但其**中间 Jacobian** $J(V_3)$（二维复环面）不是 Jacobian 簇的直和项，故 $V_3$ 不是有理的。中间 Jacobian 是有理曲面不存在的不变量。

(3) **Iskovskikh-Manin 反例**（1971 年）：四维光滑三次超曲面 $V_3 \subset \mathbb{P}^5$ 不是有理的。证法基于双有理自同构群的有限性——证明 $\operatorname{Bir}(V_3)$ 是有限群，而有理簇的双有理自同构群是无界大的（Cremona 群 $\operatorname{Cr}_n = \operatorname{Bir}(\mathbb{P}^n)$ 当 $n \geq 2$ 时无限）。

这些反例共同说明：单有理性和有理性之间的鸿沟随维数增长而加大，高维有理性问题是极其微妙和困难的。

---

---

## 第87章：极化簇与 Hilbert 概型
极化簇和 Hilbert 概型是现代代数几何中模空间理论的核心工具。Hilbert 概型将闭子概型的参数化问题形式化为射影概型结构，而极化簇的 GIT（几何不变量理论）则为构造代数簇的模空间提供了标准方法。

### 87.1 Hilbert 多项式与 Hilbert 概型

**定义 87.1**（极化簇）：**极化簇**是一个对 $(X, L)$，其中 $X$ 是代数闭域 $k$ 上的射影簇，$L \in \operatorname{Pic}(X)$ 是 $X$ 上的丰沛线丛（极化）。极化簇的 Hilbert 多项式为

$$P(m) = \chi(X, L^{\otimes m}) = \sum_{i=0}^{\dim X} (-1)^i \dim_k H^i(X, L^{\otimes m})$$

由 Serre 消没定理，当 $m \gg 0$ 时，$H^i(X, L^{\otimes m}) = 0$ 对所有 $i > 0$ 成立，故

$$P(m) = \dim_k H^0(X, L^{\otimes m}), \quad m \gg 0$$

由 Riemann-Roch 定理（Hirzebruch 版本），Hilbert 多项式的主导项为

$$P(m) = \frac{L^n}{n!} m^n + \text{（低次项）}$$

其中 $n = \dim X$，$L^n = (L^{\otimes n})$ 的相交数即为 $L$ 的次数。

**定理 87.1**（Grothendieck 的 Hilbert 概型定理，1961 年）：设 $\mathbb{P}^N_k$ 是域 $k$ 上的射影空间。对任意数值多项式 $P(t) \in \mathbb{Q}[t]$，存在射影概型 $\operatorname{Hilb}_P(\mathbb{P}^N_k)$，其 $k$-点自然一一对应于 $\mathbb{P}^N_k$ 中 Hilbert 多项式为 $P(t)$ 的闭子概型。而且该对应具有**万有性质**：存在万有闭子概型

$$\mathcal{Z} \subseteq \operatorname{Hilb}_P(\mathbb{P}^N_k) \times \mathbb{P}^N_k$$

使得对任意概型 $S$ 和任意 $S$-平坦的闭子概型 $Y \subseteq S \times \mathbb{P}^N_k$（纤维的 Hilbert 多项式均为 $P(t)$），存在唯一的态射 $f: S \to \operatorname{Hilb}_P(\mathbb{P}^N_k)$ 使得 $Y = (f \times \operatorname{id})^* \mathcal{Z}$。

*证明思路*：核心是利用 Grothendieck 的 Quot 概型（Quot scheme）理论。考虑多项式环 $S = k[x_0, \ldots, x_N]$ 和商 $S / I$（$I$ 为齐次理想）。Hilbert 基定理保证了对固定的 Hilbert 多项式 $P(t)$，存在统一的 $m_0$ 使得对所有 $m \geq m_0$，理想 $I_m$ 由 $I_{m_0}$ 生成。由此可将 Hilbert 概型嵌入 Grassmann 概型 $\operatorname{Grass}(P(m_0), \dim S_{m_0})$ 中，再证明该嵌入是闭浸入。∎

### 87.2 模空间的构造：稳定曲线

**定理 87.2**（Deligne-Mumford 稳定曲线模空间 $\overline{M}_g$）：设 $g \geq 2$。亏格 $g$ 的**稳定曲线**的模叠 $\overline{\mathcal{M}}_g$ 是光滑、真（proper）且不可约的 Deligne-Mumford 叠。其粗模空间 $\overline{M}_g$ 是 $3g-3$ 维射影簇。

一条曲线 $C$ 是**稳定的**，若：(1) $C$ 是连通的约化（reduced）曲线，仅有结点（node）奇点；(2) $C$ 的光滑有理分支包含至少 3 个特殊点（与曲线其余部分的相交点）；(3) 其典范层 $\omega_C$ 是丰沛的（等价地，对偶图是稳定的）。

*构造思路*：利用 Hilbert 概型。固定充分大的 $m$（如 $m = 3$），考虑 $\omega_C^{\otimes m}$ 的整体截面给出了嵌入 $C \hookrightarrow \mathbb{P}^{N}$（由 Riemann-Roch 定理，$N = (2m-1)(g-1)-1$）。所有稳定曲线的 $m$-典范嵌入构成 Hilbert 概型中的局部闭子集。Hilbert-Mumford 稳定性条件保证该子集对 $PGL(N+1)$ 作用是 GIT 半稳定的，取 GIT 商即得 $\overline{M}_g$。∎

**极化 Abelian 簇的模空间**：亏格 $g$ 的主极化 Abel 簇的粗模空间 $\mathcal{A}_g$ 由 Siegel 上半空间 $\mathbb{H}_g$ 经 $Sp(2g, \mathbb{Z})$ 作用取商得到。$\mathcal{A}_g$ 是 $g(g+1)/2$ 维拟射影簇。其紧化包括：
- **Satake 紧化**（Baily-Borel 紧化，极小紧化）；
- **toroidal 紧化**（由 Faltings-Chai 描述，可容许退化）；
- **二阶 Voronoi 紧化**（Alexeev，完全显式）。

### 87.3 GIT 稳定性与 Hilbert-Mumford 数值准则

**定义 87.2**（GIT 的稳定性条件，Mumford 1965 年）：设 $G$ 是代数闭域 $k$ 上的简约代数群，$L$ 是射影概型 $X$ 上的丰沛 $G$-等变线丛。点 $x \in X$ 称为：

- **半稳定的**（semistable），若存在 $n > 0$ 和 $G$-不变截面 $s \in H^0(X, L^{\otimes n})^G$ 使得 $s(x) \neq 0$；
- **稳定的**（stable），若 $x$ 是半稳定的，轨道 $G \cdot x$ 在 $X^{ss}$ 中是闭的，且稳定子群 $G_x$ 是有限群；
- **真稳定的**（properly stable），若 $x$ 是稳定的且稳定子群 $G_x$ 的维数为 0。

半稳定点集 $X^{ss}$ 是 $X$ 的开子集。GIT 商 $X /\!/ G = \operatorname{Proj}\left(\bigoplus_{n \geq 0} H^0(X, L^{\otimes n})^G\right)$ 是射影簇。

**定理 87.3**（Hilbert-Mumford 数值准则）：设 $G$ 是简约代数群，$\lambda: \mathbb{G}_m \to G$ 是单参数子群（1-PSG）。对 $x \in X$，定义 Hilbert-Mumford 数值

$$\mu(x, \lambda) = -\operatorname{ord}_{t=0}(\lambda(t) \cdot \tilde{x})$$

其中 $\tilde{x}$ 是 $x$ 在某个 $G$-等变化下的提升。则

- $x$ 是 **半稳定的** 当且仅当对所有 1-PSG $\lambda$，$\mu(x, \lambda) \geq 0$；
- $x$ 是 **稳定的** 当且仅当对所有非平凡 1-PSG $\lambda$，$\mu(x, \lambda) > 0$。

*证明思路*：若存在 1-PSG $\lambda$ 使 $\mu(x, \lambda) < 0$，则 $\lim_{t \to 0} \lambda(t) \cdot x$ 存在且不属于 $x$ 的轨道闭包，从而轨道不是闭的。反之，若所有 $\mu(x, \lambda) \geq 0$，利用 Hilbert-Mumford 定理（任何偏离 G-不变截面的方向必然由某个 1-PSG 的负数值体现）可得 $x$ 是半稳定的。∎

**应用于稳定曲线**：曲线的 GIT 稳定性（Hilbert-Mumford 稳定性）恰好对应于 Deligne-Mumford 稳定性条件。一条曲线 $C$ 在 GIT 意义下是半稳定的（关于 $m$-典范嵌入）当且仅当它是 Deligne-Mumford 意义下的稳定曲线。

---

---

## 第88章：Arakelov 几何
Arakelov 几何将代数几何的概型方法推广到算术情形，在 $\operatorname{Spec} \mathbb{Z}$ 上构造"算术曲面"，并在每个无穷远点处附加 Hermite 度量以赋予"紧性"。这是将代数几何方法与解析工具相结合的交叉领域，其核心应用包括 Faltings 对 Mordell 猜想的证明。

### 88.1 算术曲面与 Hermite 度量

**定义 88.1**（算术曲面）：**算术曲面**是一个平坦、有限型的态射 $\pi: \mathcal{X} \to \operatorname{Spec} \mathbb{Z}$，其一般纤维 $\mathcal{X}_\mathbb{Q} = \mathcal{X} \times_{\operatorname{Spec} \mathbb{Z}} \operatorname{Spec} \mathbb{Q}$ 是一条光滑射影曲线。实数纤维 $\mathcal{X}(\mathbb{C}) = \mathcal{X} \times_{\operatorname{Spec} \mathbb{Z}} \operatorname{Spec} \mathbb{C}$ 是紧 Riemann 面（不一定连通）。在每个连通分支 $\mathcal{X}_\sigma$（$\sigma \in \mathcal{X}(\mathbb{C})$ 的连通分支）上需装备 **Kähler 度量**——称为 Hermite 度量或 Kähler 形式 $\omega_\sigma$。

在每个非无穷远点 $p$（即正素数），$\mathcal{X}$ 的纤维 $\mathcal{X}_p = \mathcal{X} \times_{\operatorname{Spec} \mathbb{Z}} \operatorname{Spec} \mathbb{F}_p$ 是有限域 $\mathbb{F}_p$ 上的代数曲线（带有可能的奇点）。

**定义 88.2**（算术除子）：算术曲面 $\mathcal{X}$ 上的 **算术除子** 是有限形式和

$$D = \sum_{P} n_P [P] + \sum_{\sigma} \lambda_\sigma [\mathcal{X}_\sigma]$$

其中 $P$ 遍历 $\mathcal{X}$ 的不可约水平除子（算术除子的有限部分），$\lambda_\sigma \in \mathbb{R}$ 为无穷远除子的系数。此类除子形式上类比于紧 Riemann 面上的除子，但额外考虑了无穷远度量。

### 88.2 算术 Chow 群与算术相交理论

**定义 88.3**（算术 Chow 群）：算术曲面 $\mathcal{X}$ 的 **算术 Chow 群** $\widehat{\operatorname{CH}}^p(\mathcal{X})$ 由以下数据生成：代数圈 $Z$（$\mathcal{X}$ 的子概型）配以沿 $\mathcal{X}(\mathbb{C})$ 每个连通分支的 **Green 流** $g_\sigma$（满足微分方程 $\partial \bar{\partial} g_\sigma + \delta_Z = \omega_Z$ 的流），模去有理等价和无穷远处的全纯函数的贡献。

算术 Chow 群 $\widehat{\operatorname{CH}}^*(\mathcal{X})$ 构成分次环，配以算术相交积

$$\widehat{\operatorname{CH}}^p(\mathcal{X}) \times \widehat{\operatorname{CH}}^q(\mathcal{X}) \to \widehat{\operatorname{CH}}^{p+q}(\mathcal{X}) \otimes \mathbb{R}$$

此积在有限位与通常的相交积一致，在无穷远处与 Green 流的 star 积一致。

**定义 88.4**（算术相交数）：若 $\mathcal{X}$ 是算术曲面，$D, E$ 是两个算术除子，则其**算术相交数** $\widehat{D \cdot E} \in \mathbb{R}$ 定义为

$$\widehat{D \cdot E} = D_{\text{fin}} \cdot E_{\text{fin}} + \text{（无穷远处的贡献）}$$

无穷远处的贡献由 Green 函数 $g(D, E)$ 在 $\mathcal{X}(\mathbb{C})$ 上的积分给出。

**定理 88.1**（算术 Hodge 指标定理，Faltings 1984 年）：在算术曲面上，相交配对 $\widehat{\cdot}$ 满足与 Hodge 指标定理类似的符号性质。

### 88.3 算术 Riemann-Roch 定理

**定理 88.2**（算术 Riemann-Roch 定理，Gillet-Soulé 1992 年）：设 $\pi: \mathcal{X} \to \operatorname{Spec} \mathbb{Z}$ 是算术曲面，$\overline{E}$ 是 $\mathcal{X}$ 上的 Hermite 向量丛。则算术 Euler 示性数

$$\widehat{\chi}(\overline{E}) = \sum_{i=0}^2 (-1)^i \widehat{\deg}(\det R^i \pi_* \overline{E})$$

等于由 Gillet-Soulé 的 Chern 形式 $\widehat{\operatorname{ch}}(\overline{E})$ 和 Todd 形式 $\widehat{\operatorname{Td}}(T_{\mathcal{X}/\mathbb{Z}})$ 在算术 Chow 环中的相交积分

$$\widehat{\chi}(\overline{E}) = \int_{\mathcal{X}} \widehat{\operatorname{ch}}(\overline{E}) \cdot \widehat{\operatorname{Td}}(T_{\mathcal{X}/\mathbb{Z}})$$

*证明思路*：这一定理将 Grothendieck-Riemann-Roch 定理推广到算术情形，其证明的关键是处理**解析挠率**（analytic torsion, Ray-Singer 挠率）的贡献。算术 Riemann-Roch 的核心新特征在于：等式中的**解析挠率项** $T(\overline{E})$ 由 $\det \Delta$（Laplacian 的行列式）决定，体现了算术曲面在无穷远处的度量信息。Gillet 和 Soulé 构造了算术 K-理论和算术 Chow 环之间的 Chern 特征标，建立了层上同调与微分几何之间的桥梁。∎

### 88.4 算术 Hilbert-Samuel 定理

**定理 88.3**（算术 Hilbert-Samuel 定理，Zhang 1995 年，Abbes-Bouche 1995 年）：设 $\mathcal{X}$ 是算术曲面，$\overline{L}$ 是 $\mathcal{X}$ 上的 Hermite 线丛（丰沛线丛配以正曲率度量）。则

$$\widehat{\chi}(\overline{L}^{\otimes n}) = \frac{\widehat{\deg}(\overline{L})}{2} n^2 + O(n \log n)$$

其中 $\widehat{\deg}(\overline{L})$ 是 $\overline{L}$ 的算术次数。这与通常的 Hilbert-Samuel 定理（$P(n) = \frac{L^n}{n!} n^n + \cdots$）在形式上是平行的。

*证明思路*：算术 Hilbert-Samuel 的核心是控制 $\mathcal{X}$ 上全局截面空间的范数——这是算术曲面上度量信息的直接体现。利用算术 Riemann-Roch 定理和 Laplace 算子的谱渐近性质（Weyl 律在紧 Riemann 面上的应用），可以提取出主导项和误差项。∎

### 88.5 应用：Mordell 猜想与算术 Bogomolov 猜想

**Arakelov 几何的核心应用：**

1. **Faltings 对 Mordell 猜想的证明**（1983 年）：设 $C$ 是数域 $K$ 上亏格 $g \geq 2$ 的光滑射影曲线，则 $C(K)$ 是有限集。Faltings 的核心洞察是将 $C(K)$ 的有界高度与算术曲面上自相交数 $\omega_{C/Y}^2$ 的 Arakelov 版本关联。利用算术 Hodge 指标定理和高度不等式，证明若有无限多个 $K$ 点，则 $\widehat{\operatorname{div}}(P)^2$ 取任意大的值，与算术相交理论中的有界性原理矛盾。

2. **Vojta 猜想**：Vojta 猜想（1987 年）将 Mordell 猜想推广到高维，断言数域上的对数一般型簇上的有理点具有稀疏性质——每个有理点集包含于有限个真子簇的并集中。Vojta 的证明框架将 Arakelov 几何的高度不等式与 Nevanlinna 理论中的第二主定理通过 Diophantine 相应类比结合。

3. **算术 Bogomolov 猜想**：若曲线 $C$ 嵌入其 Jacobian 簇 $J(C)$，且 $J(C)$ 上的 Néron-Tate 高度 $\hat{h}$ 在 $C$ 上有一组严格正的最小累积点（但不全为零），则这些最小高度与某种 Arakelov 自相交数相关。Ullmo（1998 年）和 Zhang（1998 年）独立地利用等分布定理（equidistribution）的算术版本证明了该猜想。

4. **Zhang 的最小高度**：Zhang 提出了 **本质最小高度**（essential minimum）：对代数簇 $X$ 上的高度函数，定义 $\mu_{\text{ess}}(X) = \inf_{U \subset X \text{开稠}} \sup_{P \in U(\overline{K})} h(P)$。Zhang 的最小高度定理断言：$\mu_{\text{ess}}(X) \geq 0$ 且等号成立的充要条件由 Galois 轨道的等分布性质刻画。

5. **有效 Mordell 定理**：de Jong-Rémond 和 Binyamini 等人利用 Arakelov 几何建立了有效高度的有界性——给出了 $C(K)$ 大小的显式上界（虽然当前界很大），这比原始的 Faltings 定理更构造性。

---

---

---

## 第260章（补充）
> 范畴论是"数学的数学"，它提供了统一的语言和框架来描述数学结构及其相互关系。本卷从范畴、函子和自然变换的基本概念出发，建立极限、伴随函子、单子和 Abel 范畴的理论，为同调代数（V12 Ch 70）、代数拓扑（V14）和代数几何（V15）提供统一的范畴论基础。

---

---

## 第94章：范畴、函子与自然变换
范畴论的基本三位一体——范畴、函子和自然变换——提供了描述数学结构的统一语言。Yoneda 引理是范畴论最基本的定理，它表明一个对象完全由它与其他对象的关系决定。

### 94.1 范畴的定义

**定义 94.1**（范畴）：一个**范畴** $\mathcal{C}$ 由以下数据组成：
- 一族**对象** $\operatorname{Ob}(\mathcal{C})$
- 对每对对象 $X, Y$，一个**态射集** $\operatorname{Hom}_{\mathcal{C}}(X, Y)$（或 $\mathcal{C}(X, Y)$）
- 对每个对象 $X$，一个**恒等态射** $\operatorname{id}_X \in \mathcal{C}(X, X)$
- 对每三个对象 $X, Y, Z$，一个**合成映射** $\circ: \mathcal{C}(Y, Z) \times \mathcal{C}(X, Y) \to \mathcal{C}(X, Z)$

满足：合成结合律 $(h \circ g) \circ f = h \circ (g \circ f)$，恒等律 $\operatorname{id}_Y \circ f = f = f \circ \operatorname{id}_X$。

**例 94.1**（基本范畴）：
- **Set**：集合范畴（对象：集合，态射：函数）
- **Grp**：群范畴（对象：群，态射：群同态）
- **Ab**：Abel 群范畴
- **Ring**：环范畴
- **Top**：拓扑空间范畴（对象：拓扑空间，态射：连续映射）
- **Vect$_k$**：$k$-向量空间范畴
- **R-Mod**：左 $R$-模范畴

**定义 94.2**（小范畴与局部小范畴）：范畴 $\mathcal{C}$ 称为**局部小**的，如果每个 $\mathcal{C}(X, Y)$ 是集合。$\mathcal{C}$ 称为**小范畴**，如果 $\operatorname{Ob}(\mathcal{C})$ 也是集合。

**定义 94.3**（同构）：态射 $f: X \to Y$ 称为**同构**，如果存在 $g: Y \to X$ 使得 $g \circ f = \operatorname{id}_X$，$f \circ g = \operatorname{id}_Y$。$g$ 称为 $f$ 的逆。

**定义 94.4**（对偶范畴）：范畴 $\mathcal{C}$ 的**对偶范畴** $\mathcal{C}^{\text{op}}$ 与 $\mathcal{C}$ 有相同的对象，但态射方向反转：$\mathcal{C}^{\text{op}}(X, Y) = \mathcal{C}(Y, X)$。

### 94.2 函子

**定义 94.5**（函子）：范畴 $\mathcal{C}$ 到 $\mathcal{D}$ 的**函子** $F: \mathcal{C} \to \mathcal{D}$ 由以下组成：
- 对象映射：$X \mapsto F(X)$
- 态射映射：对每个 $f: X \to Y$，$F(f): F(X) \to F(Y)$

满足：$F(\operatorname{id}_X) = \operatorname{id}_{F(X)}$，$F(g \circ f) = F(g) \circ F(f)$。

**定义 94.6**（反变函子）：$\mathcal{C}^{\text{op}} \to \mathcal{D}$ 的函子称为 $\mathcal{C}$ 到 $\mathcal{D}$ 的**反变函子**。它反转态射方向：$F(f: X \to Y): F(Y) \to F(X)$。

**例 94.2**（常见函子）：
- 遗忘函子 $U: \mathbf{Grp} \to \mathbf{Set}$（忘记群结构，只保留集合）
- 自由函子 $F: \mathbf{Set} \to \mathbf{Grp}$（生成自由群）
- 基本群函子 $\pi_1: \mathbf{Top}_* \to \mathbf{Grp}$（V11 Ch 60）
- 同调函子 $H_n: \mathbf{Top} \to \mathbf{Ab}$（V14 Ch 77）
- Hom 函子：$\mathcal{C}(A, -): \mathcal{C} \to \mathbf{Set}$（协变），$\mathcal{C}(-, A): \mathcal{C}^{\text{op}} \to \mathbf{Set}$（反变）

### 94.3 自然变换

**定义 94.7**（自然变换）：设 $F, G: \mathcal{C} \to \mathcal{D}$ 是两个函子。**自然变换** $\alpha: F \Rightarrow G$ 由对每个 $X \in \mathcal{C}$ 的一个态射 $\alpha_X: F(X) \to G(X)$ 组成，使得对每个 $f: X \to Y$，下图交换：

$$
\begin{CD}
F(X) @>{\alpha_X}>> G(X) \\
@V{F(f)}VV @VV{G(f)}V \\
F(Y) @>>{\alpha_Y}> G(Y)
\end{CD}
$$

若每个 $\alpha_X$ 是同构，则 $\alpha$ 称为**自然同构**，记作 $F \cong G$。

**定义 94.8**（函子范畴）：从 $\mathcal{C}$ 到 $\mathcal{D}$ 的函子及它们之间的自然变换构成**函子范畴** $[\mathcal{C}, \mathcal{D}]$（或 $\mathcal{D}^{\mathcal{C}}$）。

**例 94.3**（自然变换的例子）：
- 行列式 $\det: \mathbf{GL}_n \Rightarrow \mathbf{GL}_1$（$k^\times$）是自然变换
- 有限维向量空间 $V$ 到其双重对偶 $V \to V^{**}$ 的嵌入是自然变换（$V \cong V^{**}$ 自然同构）
- Hurewicz 同态 $\pi_n \Rightarrow H_n$ 是自然变换（V14）

### 94.4 Yoneda 引理

**定义 94.9**（Yoneda 嵌入）：对局部小范畴 $\mathcal{C}$，定义 **Yoneda 嵌入**

$$Y: \mathcal{C} \to [\mathcal{C}^{\text{op}}, \mathbf{Set}], \quad Y(X) = \mathcal{C}(-, X)$$

即 $Y(X)$ 是反变 Hom 函子：$Y(X)(A) = \mathcal{C}(A, X)$。

**定理 94.1**（Yoneda 引理）：设 $\mathcal{C}$ 是局部小范畴，$F: \mathcal{C}^{\text{op}} \to \mathbf{Set}$ 是函子，$X \in \mathcal{C}$。则存在自然的一一对应

$$\operatorname{Nat}(\mathcal{C}(-, X), F) \cong F(X)$$

（其中 $\operatorname{Nat}$ 表示自然变换的集合）。此同构由 $\alpha \mapsto \alpha_X(\operatorname{id}_X)$ 给出。

*证明*：定义映射 $\Phi: \operatorname{Nat}(\mathcal{C}(-, X), F) \to F(X)$，$\Phi(\alpha) = \alpha_X(\operatorname{id}_X)$。逆映射 $\Psi: F(X) \to \operatorname{Nat}(\mathcal{C}(-, X), F)$ 定义为：对 $u \in F(X)$，$\Psi(u)_A(f) = F(f)(u)$（$f: A \to X$）。验证 $\Phi \circ \Psi = \operatorname{id}$ 和 $\Psi \circ \Phi = \operatorname{id}$。∎

**推论 94.2**（Yoneda 嵌入是完全忠实的）：Yoneda 嵌入 $Y: \mathcal{C} \to [\mathcal{C}^{\text{op}}, \mathbf{Set}]$ 是完全忠实的：$\operatorname{Nat}(\mathcal{C}(-, X), \mathcal{C}(-, Y)) \cong \mathcal{C}(X, Y)$。特别地，$X \cong Y$ 当且仅当 $\mathcal{C}(-, X) \cong \mathcal{C}(-, Y)$。

*证明*：在 Yoneda 引理（定理 94.1）中取 $F = \mathcal{C}(-, Y)$，则 $\operatorname{Nat}(\mathcal{C}(-, X), \mathcal{C}(-, Y)) \cong \mathcal{C}(X, Y)$。具体地，自然变换 $\alpha: \mathcal{C}(-, X) \Rightarrow \mathcal{C}(-, Y)$ 由 $\alpha_X(\operatorname{id}_X) \in \mathcal{C}(X, Y)$ 唯一决定；反之，每个 $f: X \to Y$ 通过后合成 $f \circ (-)$ 给出自然变换。这建立了双向一一对应，故 Yoneda 嵌入是全忠实函子。∎

**推论 94.3**（Yoneda 推论）：一个对象 $X$ 完全由它与其他对象的关系（即函子 $\mathcal{C}(-, X)$）决定（在同构意义下）。这是范畴论的基本哲学。

---

---

## 第95章：极限与余极限
极限和余极限是范畴论中最重要的构造，统一了积、余积、等化子、拉回、推出等概念。

### 95.1 极限的普遍定义

**定义 95.1**（图与锥）：设 $J$ 是小范畴（称为**指标范畴**）。函子 $D: J \to \mathcal{C}$ 称为 $\mathcal{C}$ 中的一个 **$J$ 型图**。

$D$ 上的一个**锥**（cone）由对象 $C \in \mathcal{C}$ 和一族态射 $\{c_j: C \to D(j)\}_{j \in J}$ 组成，使得对每个 $J$ 中的态射 $u: j \to k$，$D(u) \circ c_j = c_k$。

**定义 95.2**（极限）：图 $D: J \to \mathcal{C}$ 的**极限** $\varprojlim D$（或 $\lim D$）是 $D$ 上的一个万有锥：它是一个锥 $(L, \{\ell_j\})$，使得对任意其他锥 $(C, \{c_j\})$，存在唯一的态射 $f: C \to L$ 使得 $\ell_j \circ f = c_j$（对所有 $j$）。

**定义 95.3**（余极限）：对偶地，$D$ 上的**余锥**及**余极限** $\varinjlim D$（或 $\operatorname{colim} D$）是极限在 $\mathcal{C}^{\text{op}}$ 中的对偶概念。

**命题 95.1**：若极限存在，则它在同构意义下唯一。

### 95.2 特殊极限与余极限

**定义 95.4**（积与余积）：设 $J$ 是离散范畴（只有恒等态射）。$J$ 型图的极限是**积** $\prod_{j \in J} X_j$，余极限是**余积** $\coprod_{j \in J} X_j$。

- **Set** 中：积 = 笛卡尔积，余积 = 不交并
- **Grp** 中：积 = 直积，余积 = 自由积
- **Ab** 中：积 = 直积，余积 = 直和（有限时两者相同）
- **Vect$_k$** 中：积 = 直积，余积 = 直和

**定义 95.5**（等化子与余等化子）：两个平行态射 $f, g: X \rightrightarrows Y$ 的图。
- **等化子** $\operatorname{eq}(f, g)$ 是使得 $f \circ e = g \circ e$ 的万有态射 $e: E \to X$
- **余等化子** $\operatorname{coeq}(f, g)$ 是使得 $c \circ f = c \circ g$ 的万有态射 $c: Y \to C$

**定义 95.6**（拉回与推出）：
- **拉回**（pullback）是图 $X \to Z \leftarrow Y$ 的极限
- **推出**（pushout）是图 $X \leftarrow Z \to Y$ 的余极限

**定理 95.2**（极限的构造）：若 $\mathcal{C}$ 有所有积和所有等化子，则 $\mathcal{C}$ 有所有小极限。具体地，$\varprojlim D$ 是等化子

$$\varprojlim D \longrightarrow \prod_{j \in J} D(j) \rightrightarrows \prod_{u: j \to k} D(k)$$

其中两个态射分别由 $D(u) \circ \pi_j$ 和 $\pi_k$ 给出。

*证明*：设图 $D: J \to \mathcal{C}$。构造积 $P = \prod_{j} D(j)$ 和 $Q = \prod_{u: j \to k} D(k)$。定义两个态射 $f, g: P \rightrightarrows Q$：$f$ 的第 $u$ 分量为 $D(u) \circ \pi_j$，$g$ 的第 $u$ 分量为 $\pi_k$。取等化子 $e: L \to P$，则 $(L, \pi_j \circ e)$ 构成 $D$ 的锥。对任意锥 $(C, c_j)$，泛性质给出唯一态射 $h: C \to P$ 使得 $\pi_j \circ h = c_j$。由锥条件 $D(u) \circ c_j = c_k$ 推出 $f \circ h = g \circ h$，故 $h$ 唯一地通过等化子 $e$ 分解，即存在唯一 $C \to L$。这验证了 $L$ 的极限泛性质。拉回作为二元积与等化子的特例自然包含于此构造。∎

### 95.3 完备性

**定义 95.7**（完备范畴）：范畴 $\mathcal{C}$ 称为**完备**的，如果它有所有小极限。$\mathcal{C}$ 称为**余完备**的，如果它有所有小余极限。

**定理 95.3**：**Set** 是完备和余完备的。**Grp**、**Ab**、**Ring**、**R-Mod**、**Top** 都是完备和余完备的。

**命题 95.4**（极限的函子性）：若 $\mathcal{C}$ 完备，则极限构造定义了函子 $\varprojlim: [J, \mathcal{C}] \to \mathcal{C}$。类似地，$\varinjlim$ 是函子。

**定义 95.8**（保极限的函子）：函子 $F: \mathcal{C} \to \mathcal{D}$ 称为**保极限**的，如果对每个图 $D: J \to \mathcal{C}$，$F(\varprojlim D) \cong \varprojlim (F \circ D)$（自然同构）。

**例 95.1**：Hom 函子 $\mathcal{C}(X, -)$ 保极限（所有极限）。$\mathcal{C}(-, X)$ 将余极限变为极限。

---

---

## 第96章：伴随函子
伴随函子是范畴论最核心的概念之一，广泛出现在数学的各个分支中。自由-遗忘伴随、积-Hom 伴随、量化词伴随等都是典型例子。

### 96.1 伴随的定义

**定义 96.1**（伴随函子）：设 $F: \mathcal{C} \to \mathcal{D}$ 和 $G: \mathcal{D} \to \mathcal{C}$ 是函子。$F$ 称为 $G$ 的**左伴随**（$G$ 是 $F$ 的**右伴随**），记作 $F \dashv G$，如果存在自然同构

$$\mathcal{D}(F(X), Y) \cong \mathcal{C}(X, G(Y))$$

对 $X \in \mathcal{C}$，$Y \in \mathcal{D}$ 自然。

**定义 96.2**（单位与余单位）：伴随 $F \dashv G$ 给出两个自然变换：
- **单位**（unit）：$\eta: \operatorname{id}_{\mathcal{C}} \Rightarrow G \circ F$（由 $X \mapsto F(X)$ 的恒等态射经过伴随同构得到）
- **余单位**（counit）：$\varepsilon: F \circ G \Rightarrow \operatorname{id}_{\mathcal{D}}$（对偶地）

满足三角恒等式：$G\varepsilon \circ \eta G = \operatorname{id}_G$ 和 $\varepsilon F \circ F\eta = \operatorname{id}_F$。

**例 96.1**（典型伴随对）：
1. 自由 $\dashv$ 遗忘：$F: \mathbf{Set} \to \mathbf{Grp}$（自由群）$\dashv$ $U: \mathbf{Grp} \to \mathbf{Set}$（遗忘函子）
2. 张量 $\dashv$ Hom：对 $R$-模，$M \otimes_R - \dashv \operatorname{Hom}_R(M, -)$
3. 对拓扑空间范畴 $\mathbf{Top}$ 与集合范畴 $\mathbf{Set}$，$\pi_0 \dashv \text{离散} \dashv U$（其中 $\pi_0$ 为连通分支函子，$\text{离散}$ 为离散拓扑函子，$U$ 为遗忘函子）
4. $\Delta \dashv \varprojlim$（对角函子 $\dashv$ 极限函子）：$\varinjlim \dashv \Delta \dashv \varprojlim$

### 96.2 伴随函子的性质

**定理 96.1**（左伴随保余极限，右伴随保极限）：若 $F \dashv G$，则 $F$ 保所有余极限，$G$ 保所有极限。

*证明*：对余极限 $C = \varinjlim D_j$，$\mathcal{D}(F(C), Y) \cong \mathcal{C}(C, G(Y)) \cong \varprojlim \mathcal{C}(D_j, G(Y)) \cong \varprojlim \mathcal{D}(F(D_j), Y) \cong \mathcal{D}(\varinjlim F(D_j), Y)$。由 Yoneda 引理，$F(C) \cong \varinjlim F(D_j)$。∎

**命题 96.2**：若 $F \dashv G$ 且 $F' \dashv G$，则 $F \cong F'$（左伴随在同构意义下唯一）。类似地，右伴随也唯一。

**定理 96.2**（一般伴随函子定理，Freyd）：设 $\mathcal{C}$ 是完备范畴，$G: \mathcal{D} \to \mathcal{C}$ 是函子。则 $G$ 有左伴随当且仅当：
1. $G$ 保所有小极限
2. 对每个 $X \in \mathcal{C}$，逗号范畴 $X \downarrow G$ 有初始对象

（还需要"解集条件"（solution set condition）的适当版本）。

*证明概要*：充分性：$G$ 保极限且满足解集条件 $\Rightarrow$ 对每个 $X \in \mathcal{C}$，逗号范畴 $X \downarrow G$ 有初始对象，该初始对象 $(S_X, \eta_X: X \to G(S_X))$ 定义左伴随 $F(X) = S_X$。构造核心：解集条件保证 $X \downarrow G$ 中有一族"生成"对象 $\{(M_i, f_i: X \to G(M_i))\}_{i \in I}$；由于 $G$ 保极限，这些 $M_i$ 的积的某个子对象给出初始对象。必要性：左伴随 $F \dashv G$ 自动保证 $G$ 保极限（定理 96.1），且对每个 $X$，$(F(X), \eta_X)$ 是 $X \downarrow G$ 的初始对象，从而解集条件取单点集 $\{F(X)\}$ 即满足。∎

**定理 96.3**（特殊伴随函子定理）：设 $\mathcal{C}$ 是完备、良幂（well-powered）且有余生成子（cogenerator）的范畴，$\mathcal{D}$ 是局部小范畴。若 $G: \mathcal{D} \to \mathcal{C}$ 保所有小极限，则 $G$ 有左伴随。

**例 96.2**（Stone-Čech 紧化）：遗忘函子 $U: \mathbf{CHaus} \to \mathbf{Top}$（紧 Hausdorff 空间到拓扑空间）有左伴随 $\beta$（Stone-Čech 紧化）。这是特殊伴随函子定理的应用。

### 96.3 伴随与等价

**定义 96.3**（范畴等价）：函子 $F: \mathcal{C} \to \mathcal{D}$ 称为**范畴等价**，如果存在函子 $G: \mathcal{D} \to \mathcal{C}$ 使得 $G \circ F \cong \operatorname{id}_{\mathcal{C}}$ 和 $F \circ G \cong \operatorname{id}_{\mathcal{D}}$（自然同构）。

**命题 96.3**：若 $F \dashv G$ 且单位和余单位都是自然同构，则 $F$ 和 $G$ 是范畴等价（此时 $F \dashv G$ 且 $G \dashv F$）。

**定理 96.4**：函子 $F: \mathcal{C} \to \mathcal{D}$ 是范畴等价当且仅当 $F$ 是完全忠实的且本质满的（essentially surjective：每个 $Y \in \mathcal{D}$ 同构于某个 $F(X)$）。

*证明*：（$\Rightarrow$）若 $F$ 等价，存在 $G$ 使 $G \circ F \cong \operatorname{id}_{\mathcal{C}}$。自然同构给出每个 $X$ 的同构 $X \cong G(F(X))$，故 $F$ 完全忠实。本质满：对 $Y \in \mathcal{D}$，由 $F \circ G \cong \operatorname{id}_{\mathcal{D}}$ 知 $Y \cong F(G(Y))$，即 $Y$ 同构于 $F$ 的像。（$\Leftarrow$）构造拟逆函子 $G$：对每个 $Y \in \mathcal{D}$，由本质满择一 $X_Y \in \mathcal{C}$ 及同构 $\varepsilon_Y: F(X_Y) \xrightarrow{\cong} Y$。对态射 $h: Y \to Z$，由 $F$ 全忠实，存在唯一 $g: X_Y \to X_Z$ 使 $F(g) = \varepsilon_Z^{-1} \circ h \circ \varepsilon_Y$。定义 $G(Y) = X_Y$，$G(h) = g$。验证 $G$ 是函子且 $\varepsilon$ 给出 $F \circ G \cong \operatorname{id}_{\mathcal{D}}$；再利用 $F$ 忠实构造 $\eta: \operatorname{id}_{\mathcal{C}} \cong G \circ F$。∎

---

---

## 第97章：单子与代数
单子（monad）是伴随函子的代数抽象，捕获了"代数结构"的普遍概念。它在函数式编程和形式语义学中也有重要应用。

### 97.1 单子的定义

**定义 97.1**（单子）：范畴 $\mathcal{C}$ 上的**单子**是一个三元组 $(T, \eta, \mu)$，其中：
- $T: \mathcal{C} \to \mathcal{C}$ 是函子
- $\eta: \operatorname{id}_{\mathcal{C}} \Rightarrow T$（单位）
- $\mu: T^2 \Rightarrow T$（乘法）

满足结合律：$\mu \circ T\mu = \mu \circ \mu T$（作为 $T^3 \Rightarrow T$ 的自然变换），和单位律：$\mu \circ \eta T = \operatorname{id}_T = \mu \circ T\eta$。

**定理 97.1**（伴随给出单子）：每个伴随 $F \dashv G$（$F: \mathcal{C} \to \mathcal{D}$，$G: \mathcal{D} \to \mathcal{C}$）给出 $\mathcal{C}$ 上的一个单子 $(T = G \circ F, \eta, \mu = G \varepsilon F)$，其中 $\eta$ 是伴随的单位，$\varepsilon$ 是伴随的余单位。

*证明*：验证单子的三个公理。$\mu$ 的自然性由 $\varepsilon$ 的自然性保证。结合律由 $\varepsilon$ 的三角恒等式推出。∎

**例 97.1**（来自伴随的单子）：
- 自由群函子 $F \dashv U$ 给出 **Set** 上的单子 $UF$（自由群单子）
- 自由 $R$-模函子 $\dashv$ 遗忘函子给出向量空间单子
- 幂集函子 $\mathcal{P}: \mathbf{Set} \to \mathbf{Set}$（$\eta_X(x) = \{x\}$，$\mu_X$ 为并集）是单子
- **Set** 上的 Maybe 单子：$T(X) = X \sqcup \{*\}$

### 97.2 Eilenberg-Moore 代数与 Kleisli 范畴

**定义 97.2**（Eilenberg-Moore 代数）：单子 $(T, \eta, \mu)$ 的一个**代数**（或 Eilenberg-Moore 代数）是一个对 $(A, a)$，其中 $A \in \mathcal{C}$，$a: T(A) \to A$ 是 $\mathcal{C}$ 中的态射，满足 $a \circ \eta_A = \operatorname{id}_A$ 和 $a \circ \mu_A = a \circ T(a)$。

代数的态射 $f: (A, a) \to (B, b)$ 是 $\mathcal{C}$ 中的态射 $f: A \to B$ 满足 $b \circ T(f) = f \circ a$。代数及其态射构成 **Eilenberg-Moore 范畴** $\mathcal{C}^T$。

**定理 97.2**（Eilenberg-Moore 分解）：每个伴随 $F \dashv G$ 生成的单子 $T$，函子 $G$ 通过 $\mathcal{C}^T$ 分解：存在比较函子 $K: \mathcal{D} \to \mathcal{C}^T$ 使得 $U^T \circ K = G$ 和 $K \circ F = F^T$（其中 $U^T \dashv F^T$ 是 $\mathcal{C}^T$ 的自由-遗忘伴随）。

**定义 97.3**（Kleisli 范畴）：单子 $T$ 的 **Kleisli 范畴** $\mathcal{C}_T$ 的对象与 $\mathcal{C}$ 相同，但态射 $\mathcal{C}_T(X, Y) = \mathcal{C}(X, T(Y))$。合成由 $T$ 的乘法定义。Kleisli 范畴是 Eilenberg-Moore 范畴的"自由代数"满子范畴。

**命题 97.4**：$\mathcal{C}^T$ 是 $T$ 的代数的"最大"范畴（终对象），$\mathcal{C}_T$ 是 $T$ 的代数的"最小"范畴（初对象），在适当的范畴意义下。

*证明概要（Kleisli 范畴的构造）*：给定单子 $(T, \eta, \mu)$，定义 Kleisli 范畴 $\mathcal{C}_T$：对象 $\operatorname{Ob}(\mathcal{C}_T) = \operatorname{Ob}(\mathcal{C})$；态射 $\mathcal{C}_T(X, Y) = \mathcal{C}(X, T(Y))$；恒等态射 $\operatorname{id}_X^{\mathcal{C}_T} = \eta_X: X \to T(X)$；合成 $g \circ_{\mathcal{C}_T} f = \mu_Z \circ T(g) \circ f$（其中 $f: X \to T(Y)$，$g: Y \to T(Z)$）。验证结合律依赖单子乘法 $\mu$ 的结合律：$(h \circ g) \circ f = \mu_W \circ T(\mu_W \circ T(h) \circ g) \circ f = \mu_W \circ \mu_{T(W)} \circ T^2(h) \circ T(g) \circ f = \mu_W \circ T(h) \circ \mu_Z \circ T(g) \circ f = h \circ (g \circ f)$。存在自由函子 $F_T: \mathcal{C} \to \mathcal{C}_T$（$F_T(X)=X$，$F_T(f)=\eta_Y \circ f$）和遗忘函子 $U_T: \mathcal{C}_T \to \mathcal{C}$（$U_T(X)=T(X)$，$U_T(f)=\mu_Y \circ T(f)$），满足 $F_T \dashv U_T$ 且生成的单子恰为 $T$。$\mathcal{C}_T$ 等价于 $\mathcal{C}^T$ 中由自由代数 $(\mu_X: T^2(X) \to T(X))$ 生成的满子范畴。∎

### 97.3 单子与代数理论

**定义 97.4**（代数理论）：单子 $(T, \eta, \mu)$ 在 **Set** 上的代数 $(A, a)$ 可以看作带有满足某些等式的运算的集合。例如：
- 群单子：$T(X)$ 是 $X$ 生成的自由群，代数 $(A, a)$ 是群（$a: T(A) \to A$ 是群的乘法、逆和单位元）
- 环单子：类似地，代数环

**定理 97.5**（Beck 单子性定理）：设 $G: \mathcal{D} \to \mathcal{C}$ 有左伴随 $F$。则比较函子 $K: \mathcal{D} \to \mathcal{C}^T$ 是范畴等价当且仅当 $G$ 反映同构且 $\mathcal{D}$ 有余等化子，且 $G$ 保这些余等化子。

Beck 单子性定理提供了判断一个函子是否为"遗忘函子"的精确标准。

---

---

## 第98章：Abel 范畴与导出范畴初步
Abel 范畴是能进行同调代数的范畴框架。导出范畴是 Abel 范畴的局部化，使得拟同构成为真正的同构，是现代同调代数的核心语言。

### 98.1 Abel 范畴

**定义 98.1**（加性范畴）：范畴 $\mathcal{A}$ 称为**加性范畴**（或预加性范畴），如果每个 $\mathcal{A}(X, Y)$ 是 Abel 群，且合成是双线性的。此外，$\mathcal{A}$ 有零对象（既是始对象又是终对象）和有限双积（既是积又是余积）。

**定义 98.2**（Abel 范畴）：加性范畴 $\mathcal{A}$ 称为 **Abel 范畴**，如果
1. 每个态射有核和余核
2. 每个单态射是其余核的核，每个满态射是其核的余核
3. （等价地）每个态射有典范分解 $f = m \circ e$，其中 $e$ 是余核的满态射，$m$ 是核的单态射

**例 98.1**：
- **Ab**（Abel 群范畴）是 Abel 范畴
- **R-Mod**（$R$-模范畴）是 Abel 范畴
- **Sh**（层范畴）是 Abel 范畴
- 有限维向量空间上的线性映射范畴是 Abel 范畴
- 拓扑 Abel 群范畴不是 Abel 范畴（因为满态射的余核不一定是单态射的核）

**定义 98.3**（正合列）：Abel 范畴中的序列 $\cdots \to A \xrightarrow{f} B \xrightarrow{g} C \to \cdots$ 称为**正合的**，如果 $\ker g = \operatorname{im} f$（其中 $\operatorname{im} f = \ker(\operatorname{coker} f)$）。

**定理 98.1**（Freyd-Mitchell 嵌入定理）：每个小 Abel 范畴 $\mathcal{A}$ 可以完全忠实地嵌入到某个环 $R$ 的模范畴 **R-Mod** 中，且嵌入是正合的。

*说明*：Freyd-Mitchell 嵌入定理意味着在 Abel 范畴中做同调代数时，可以"假装"在模范畴中工作，使用元素论证（diagram chasing）。

*证明思路*：将小 Abel 范畴 $\mathcal{A}$ 视为加性范畴，构造函子 $H: \mathcal{A}^{\text{op}} \to \mathbf{Ab}$ 的适当满子范畴作为"层"，再取归纳极限构造环 $R$，使 $\mathcal{A}$ 等价于 $R$-Mod 中紧生成对象的满子范畴。核心技术是利用 $\mathcal{A}$ 中所有可表函子构成的谱（spectrum）来"编码"模范畴结构，最终得到完全忠实且正合的嵌入 $\mathcal{A} \hookrightarrow R\text{-Mod}$。∎

### 98.2 复形与同调

**定义 98.4**（链复形）：Abel 范畴 $\mathcal{A}$ 中的**链复形**是一列对象 $A_n$ 和态射 $d_n: A_n \to A_{n-1}$ 满足 $d_{n-1} \circ d_n = 0$。**上链复形**中态射方向为 $d^n: A^n \to A^{n+1}$。

**定义 98.5**（同调）：链复形 $A_\bullet$ 的 $n$ 次同调为 $H_n(A_\bullet) = \ker d_n / \operatorname{im} d_{n+1}$。

**定义 98.6**（拟同构）：链复形态射 $f: A_\bullet \to B_\bullet$ 称为**拟同构**，如果对所有 $n$，它诱导的同调同构 $H_n(A_\bullet) \cong H_n(B_\bullet)$。

### 98.3 导出范畴

**定义 98.7**（同伦范畴）：Abel 范畴 $\mathcal{A}$ 的链复形范畴 $\mathbf{Ch}(\mathcal{A})$ 的**同伦范畴** $K(\mathcal{A})$ 的对象与 $\mathbf{Ch}(\mathcal{A})$ 相同，态射是链映射的同伦类。

**定义 98.8**（导出范畴）：Abel 范畴 $\mathcal{A}$ 的**导出范畴** $D(\mathcal{A})$ 是 $K(\mathcal{A})$ 关于拟同构的局部化（Verdier 局部化）。即 $D(\mathcal{A}) = K(\mathcal{A})[\mathcal{Q}^{-1}]$，其中 $\mathcal{Q}$ 是所有拟同构的类。

在 $D(\mathcal{A})$ 中，拟同构变成了真正的同构。这是导出函子理论（V12 Ch 70）的范畴论基础。

**定理 98.2**（导出范畴是三角范畴）：导出范畴 $D(\mathcal{A})$ 具有**三角范畴**结构：存在平移函子 $[1]: D(\mathcal{A}) \to D(\mathcal{A})$（$A[1]_n = A_{n-1}$）和一类**好三角**（distinguished triangles）$A \to B \to C \to A[1]$，满足 Verdier 公理。

**定义 98.9**（导出函子）：设 $F: \mathcal{A} \to \mathcal{B}$ 是左正合函子。$F$ 的**全导出函子** $\mathbf{R}F: D^+(\mathcal{A}) \to D^+(\mathcal{B})$ 定义为 $\mathbf{R}F(A_\bullet) = F(I_\bullet)$，其中 $A_\bullet \to I_\bullet$ 是内射分解（或 $K$-内射分解）。$R^i F(A) = H^i(\mathbf{R}F(A))$ 是通常的导出函子。

**定理 98.3**（导出函子的存在性）：若 $\mathcal{A}$ 有足够多内射对象，则每个左正合函子 $F: \mathcal{A} \to \mathcal{B}$ 有全导出函子 $\mathbf{R}F: D^+(\mathcal{A}) \to D^+(\mathcal{B})$。

**例 98.2**（导出函子的范畴论解释）：
- $\operatorname{Ext}^n(A, B) = \operatorname{Hom}_{D(\mathcal{A})}(A, B[n])$（导出范畴中的 Hom）
- 层上同调 $H^n(X, \mathcal{F}) = \operatorname{Hom}_{D(\mathbf{Sh}(X))}(\mathbb{Z}_X, \mathcal{F}[n])$
- 群上同调 $H^n(G, M) = \operatorname{Ext}^n_{\mathbb{Z}G}(\mathbb{Z}, M)$

---

---

## 第266章（补充）
拓扑斯理论（Topos Theory）由 Grothendieck（1963）、Lawvere（1964）和 Tierney（1972）创立，是连接逻辑、代数和几何的桥梁。一个拓扑斯是一个"广义的集合论宇宙"，在其中可以做几乎所有的数学——同时保留了范畴论的一致性和几何的局部性质。

### Grothendieck拓扑与景

**定义**（Grothendieck景 / site）：设 $\mathcal{C}$ 是范畴。$\mathcal{C}$ 上的 **Grothendieck 拓扑** $J$ 为每个对象 $U \in \mathcal{C}$ 指定一族筛（sieves）——即"覆盖" $U$ 的态射族（满足公理：恒等覆盖、覆盖的拉回存在且可复合）。装备了 Grothendieck 拓扑的范畴 $(\mathcal{C}, J)$ 称为**景**（site）。

**定义**（覆盖筛 / covering sieve）：对象 $U$ 上的筛 $S$ 是 $\mathcal{C}$ 中的态射族 $\{f_i: U_i \to U\}$（以 $U$ 为共同目标），在复合下封闭：若 $f \in S$ 且 $g$ 与 $f$ 可复合，则 $f \circ g \in S$。$S$ 是 $J(U)$ 中的覆盖筛，如果它满足 Grothendieck 拓扑的三条公理。

**例**：
- **Zariski景**：$\mathcal{C} = \operatorname{Open}(X)$（$X$ 上光滑概形的开嵌入范畴），覆盖为开覆盖
- **étale景**（概形上）：$\mathcal{C} = \text{概形}/\text{格}$，覆盖为满射的 étale 态射族
- **fppf景**（fidèlement plate de présentation finie）：覆盖为平坦满射的有限表示态射族

**定义**（层 / sheaf on a site）：$\mathcal{C}$ 上取值于集合（或群、环等）范畴的预层 $\mathcal{F}: \mathcal{C}^{\text{op}} \to \mathbf{Set}$ 是 **$J$-层**，如果对每个覆盖筛 $\{f_i: U_i \to U\} \in J(U)$，$\mathcal{F}(U)$ 是 $\prod_i \mathcal{F}(U_i)$ 的等化子（在 $\prod_{i,j} \mathcal{F}(U_i \times_U U_j)$ 的两对对偶投影下）——即满足一般的粘合条件。

### 拓扑斯的定义与基本例子

**定义**（Grothendieck拓扑斯 / elementary topos）：一个**Grothendieck 拓扑斯**是等价于景 $(\mathcal{C}, J)$ 上层范畴 $\operatorname{Sh}(\mathcal{C}, J)$ 的范畴。更一般地，**初等拓扑斯**（Lawvere-Tierney）是满足以下条件的范畴：
1. 具有所有有限极限
2. 笛卡尔闭（Cartesian closed）
3. 具有子对象分类器 $\Omega$（充当"广义真值对象"）

初等拓扑斯是范畴论的"类集合范畴"——可以内在地解释高阶直觉主义逻辑。

**例**：
- $\mathbf{Set}$（集合范畴）是拓扑斯（$\Omega = \{0, 1\}$，经典二值逻辑）
- $\operatorname{Sh}(X)$（拓扑空间上的集合层范畴）是拓扑斯
- $G\text{-}\mathbf{Set}$（$G$-集合范畴，$G$ 群）是拓扑斯
- $\mathcal{B}\mathbb{G}_m$（分类代数 $\mathbb{Z}[x, y]/(xy - 1)$ 的可换环范畴）不是 Grothendieck 拓扑斯，但作为分类叠是"2-拓扑斯"

**定理**（Giraud刻画定理）：一个范畴等价于 Grothendieck 拓扑斯当且仅当它满足：具有所有小 colimit、具有一组生成元、小余积是分离的（disjoint）、等价关系是有效的（effective）。

### 分类拓扑斯与Lawvere-Tierney拓扑

**定义**（分类拓扑斯）：若几何理论 $\mathbb{T}$ 的所有模型（在所有 Grothendieck 拓扑斯中）同构于拓扑斯 $\mathcal{E}_{\mathbb{T}}$ 中一个"万有模型"的拉回，则 $\mathcal{E}_{\mathbb{T}}$ 是 $\mathbb{T}$ 的**分类拓扑斯**。例如：
- 群的分类拓扑斯是 $G$ 的群对象（群作用层范畴）
- 环的分类拓扑斯对应交换环范畴中的仿射概形

**定义**（Lawvere-Tierney拓扑 / 拓扑斯中的局部算子）：拓扑斯 $\mathcal{E}$ 的子对象分类器 $\Omega$ 上的 **Lawvere-Tierney 拓扑**（即层化模态 / local operator）是映射 $j: \Omega \to \Omega$ 满足 $j \circ \operatorname{true} = \operatorname{true}$、$j \circ j = j$ 和 $j \circ \wedge = \wedge \circ (j \times j)$。$j$ 的代数（$\Omega$ 中满足 $j$ 不变性的子对象）构成 $\mathcal{E}$ 的一个子拓扑斯 $\operatorname{Sh}_j(\mathcal{E})$——即 $\mathcal{E}$ 中 $j$-层的全子范畴。这个子拓扑斯对应 $\mathcal{E}$ 中由 $j$ 指定的"更精细的层条件"。

*意义*：Lawvere-Tierney 拓扑是 Grothendieck 拓扑在初等拓扑斯中的内在形式——无需引用外部集合论即可定义拓扑斯中的局部化和层概念。

**定理**（Deligne完备性定理）：每个凝聚 Grothendieck 拓扑斯（coherent topos）具有足够的点——即存在一族拓扑斯态射 $x_i: \mathbf{Set} \to \mathcal{E}$（点）使得逆像函子的族 $\{x_i^*\}$ 是保守的（conservative）。因此，Grothendieck 拓扑斯中的层可由其在"点"上的茎（stalk）完全确定——这推广了拓扑空间中层的茎检验原理。

### 拓扑斯理论的数学影响

1. **代数几何**：Grothendieck 拓扑斯是将 fpqc 下降（descent）形式化的范畴框架。平坦下降等价于层条件：一个预层是层当且仅当它满足平坦覆盖的所有下降数据。这是模叠理论和导出代数几何的基础语言。

2. **逻辑基础**：拓扑斯提供了直觉主义类型论的范畴语义——每个拓扑斯 $\mathcal{E}$ 有内在的逻辑（能解释量词、合取、析取和蕴含），但排中律（$\varphi \vee \neg\varphi$）在一般的拓扑斯中不成立。这不同于经典 $\mathbf{Set}$ 中的逻辑。

3. **同伦类型论（HoTT）**：$\infty$-拓扑斯（或 $(\infty, 1)$-拓扑斯）是 $\infty$-范畴版的拓扑斯——它是同伦类型论和 $\infty$-群的模型范畴。这将拓扑斯思想推广到了同伦论的领域，是现代数学基础的前沿。

---

*本卷建立了范畴论的核心框架：范畴、函子和自然变换提供了描述数学结构的统一语言；Yoneda 引理是范畴论最基本的定理，体现了"对象由关系决定"的哲学；极限和余极限统一了数学中的各种构造；伴随函子是范畴论最核心的概念，自由-遗忘、张量-Hom 等伴随对在数学中无处不在；单子理论将代数结构抽象为范畴论概念；Abel 范畴和导出范畴为同调代数（V12 Ch 70）提供了现代框架。范畴论是连接代数、几何、拓扑和分析的统一语言。*

---

*本卷从经典代数几何（仿射簇、射影簇、Hilbert 零点定理）出发，引入现代概形语言和层上同调方法。仿射代数簇与有限生成整代数的范畴等价建立了代数与几何的桥梁；概形理论将这一对应推广到所有交换环，统一了代数几何与数论；Serre 定理和 Serre 对偶为凝聚层上同调的计算提供了核心工具；Riemann-Roch 定理及其推广是代数几何最重要的定理之一，深刻影响了代数曲线、曲面和高维簇的分类理论。为后续数论 II（V16）中椭圆曲线和模形式的学习提供了几何基础。**补充部分**整合了范畴论基础——代数几何与同调代数的共同语言：范畴、函子与自然变换、Yoneda引理、极限与余极限、伴随函子、单子与代数、Abel范畴与导出范畴初步，为概形理论和层上同调提供了统一的范畴论框架。*


*卷十五：代数几何终。*
