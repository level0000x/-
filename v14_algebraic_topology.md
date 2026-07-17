# 卷十四：代数拓扑

> 代数拓扑用代数不变量（群、环、模）研究拓扑空间的整体性质。本卷在基本群（V11）的基础上，建立奇异同调、上同调环、高维同伦群和谱序列理论，为代数几何、微分拓扑和数学物理提供核心工具。

---

## 第77章：奇异同调
奇异同调是最基本的同调理论，为每个拓扑空间 $X$ 赋予一族 Abel 群 $H_n(X)$（$n \geq 0$），其秩等于 $X$ 中 $n$ 维「洞」的个数。

### 77.1 奇异单形与链复形

**定义 77.1**（标准单形）：$n$ 维**标准单形** $\Delta^n \subseteq \mathbb{R}^{n+1}$ 定义为

$$\Delta^n = \left\{(t_0, \ldots, t_n) \in \mathbb{R}^{n+1} : t_i \geq 0, \sum_{i=0}^n t_i = 1\right\}$$

$\Delta^n$ 的顶点为 $e_0 = (1, 0, \ldots, 0), \ldots, e_n = (0, \ldots, 0, 1)$。

**定义 77.2**（面映射）：第 $i$ 个**面映射** $F_i^n: \Delta^{n-1} \to \Delta^n$ 定义为

$$F_i^n(t_0, \ldots, t_{n-1}) = (t_0, \ldots, t_{i-1}, 0, t_i, \ldots, t_{n-1})$$

即将 $\Delta^{n-1}$ 嵌入为 $\Delta^n$ 中与顶点 $e_i$ 相对的面。

**定义 77.3**（奇异单形）：拓扑空间 $X$ 中的一个**奇异 $n$-单形**是一个连续映射 $\sigma: \Delta^n \to X$。所有奇异 $n$-单形生成的自由 Abel 群记作 $C_n(X)$（系数在 $\mathbb{Z}$ 中，若系数在 $R$ 中则记作 $C_n(X; R)$）。

**定义 77.4**（边缘算子）：边缘算子 $\partial_n: C_n(X) \to C_{n-1}(X)$ 在生成元上定义为

$$\partial_n(\sigma) = \sum_{i=0}^n (-1)^i \sigma \circ F_i^n$$

其中 $\sigma \circ F_i^n$ 是 $\sigma$ 的第 $i$ 个面。

**命题 77.1**：$\partial_{n-1} \circ \partial_n = 0$。即 $(C_\bullet(X), \partial)$ 是链复形。

*证明*：由面映射的恒等式 $F_i^{n+1} \circ F_j^n = F_{j+1}^{n+1} \circ F_i^n$（$i \leq j$），展开 $\partial_{n-1} \circ \partial_n$ 后各项成对抵消。∎

**定义 77.5**（奇异同调群）：$X$ 的 $n$ 次**奇异同调群**为

$$H_n(X) = \frac{\ker \partial_n}{\operatorname{im} \partial_{n+1}}$$

$Z_n(X) = \ker \partial_n$ 中的元素称为**闭链**（cycle），$B_n(X) = \operatorname{im} \partial_{n+1}$ 中的元素称为**边缘链**（boundary）。

### 77.2 同调的基本性质

**命题 77.2**（$H_0$ 的计算）：若 $X$ 非空且道路连通，则 $H_0(X) \cong \mathbb{Z}$。一般地，$H_0(X)$ 是自由 Abel 群，秩等于 $X$ 的道路连通分支数。

*证明*：$\partial_1(\sigma) = \sigma(1) - \sigma(0)$。对道路连通空间，所有 $0$-单形（即点）互相等价，生成一个 $\mathbb{Z}$。∎

**定义 77.6**（诱导同态）：连续映射 $f: X \to Y$ 诱导链映射 $f_\#: C_n(X) \to C_n(Y)$，$f_\#(\sigma) = f \circ \sigma$。$f_\#$ 与边缘算子交换，故诱导同调群同态 $f_*: H_n(X) \to H_n(Y)$。

**命题 77.3**（同伦不变性）：若 $f \simeq g: X \to Y$（同伦），则 $f_* = g_*: H_n(X) \to H_n(Y)$。特别地，同伦等价的空间具有同构的同调群。

*证明思路*：构造**棱柱算子**（prism operator）$P: C_n(X) \to C_{n+1}(Y)$ 满足 $\partial P + P\partial = g_\# - f_\#$，即 $f_\#$ 和 $g_\#$ 是链同伦的。$P$ 的构造基于将 $\Delta^n \times [0, 1]$ 剖分为 $n+1$ 个 $(n+1)$-单形的和。∎

**推论 77.4**：可缩空间的同调群：$H_0(X) \cong \mathbb{Z}$，$H_n(X) = 0$（$n \geq 1$）。

### 77.3 相对同调与切除定理

**定义 77.7**（相对同调群）：设 $A \subseteq X$ 是子空间。定义相对链群 $C_n(X, A) = C_n(X) / C_n(A)$。边缘算子诱导 $\partial: C_n(X, A) \to C_{n-1}(X, A)$。**相对同调群** $H_n(X, A)$ 是此链复形的同调。

**命题 77.5**（长正合序列）：对空间对 $(X, A)$，存在自然的同调长正合序列：

$$\cdots \to H_n(A) \to H_n(X) \to H_n(X, A) \xrightarrow{\partial} H_{n-1}(A) \to \cdots \to H_0(X, A) \to 0$$

*证明*：由短正合序列 $0 \to C_\bullet(A) \to C_\bullet(X) \to C_\bullet(X, A) \to 0$ 应用蛇引理（V12 定理 70.1）。∎

**定理 77.6**（切除定理）：设 $U \subseteq A \subseteq X$ 满足 $\overline{U} \subseteq \operatorname{int}(A)$。则包含映射 $(X \setminus U, A \setminus U) \hookrightarrow (X, A)$ 诱导同调同构：

$$H_n(X \setminus U, A \setminus U) \cong H_n(X, A)$$

*证明思路*：使用**重心重分**（barycentric subdivision）。将每个奇异单形细分为小单形，使得每个小单形要么落在 $A$ 中要么落在 $X \setminus U$ 中。重分算子是链同伦于恒等映射的。∎

**推论 77.7**（Mayer-Vietoris 序列）：设 $X = U \cup V$，其中 $U, V$ 是开集（或 $\operatorname{int}(U) \cup \operatorname{int}(V) = X$）。则存在长正合序列：

$$\cdots \to H_n(U \cap V) \to H_n(U) \oplus H_n(V) \to H_n(X) \xrightarrow{\partial} H_{n-1}(U \cap V) \to \cdots$$

*证明*：考虑短正合序列 $0 \to C_\bullet(U \cap V) \to C_\bullet(U) \oplus C_\bullet(V) \to C_\bullet(U) + C_\bullet(V) \to 0$。由切除定理，$C_\bullet(U) + C_\bullet(V) \hookrightarrow C_\bullet(X)$ 是链同伦等价。应用蛇引理。∎

### 77.4 球面的同调

**定理 77.8**（球面的同调群）：

$$H_n(S^k) \cong \begin{cases} \mathbb{Z} & n = 0 \text{ 或 } n = k \\ 0 & \text{其他} \end{cases}$$

*证明*：对 $k$ 归纳。$S^0$ 是两个点，$H_0(S^0) \cong \mathbb{Z}^2$，高阶同调为零。归纳步骤：将 $S^k$ 分解为两个半球 $D^k_+$ 和 $D^k_-$，交为 $S^{k-1}$。应用 Mayer-Vietoris 序列：

$$\cdots \to H_n(S^{k-1}) \to H_n(D^k) \oplus H_n(D^k) \to H_n(S^k) \to H_{n-1}(S^{k-1}) \to \cdots$$

$D^k$ 可缩，故 $H_n(D^k) = 0$（$n \geq 1$）。因此 $H_n(S^k) \cong H_{n-1}(S^{k-1})$ 对 $n \geq 2$ 成立。由归纳假设得结论。∎

**推论 77.9**（Brouwer 不动点定理，一般维数）：任意连续映射 $f: D^n \to D^n$ 有不动点。

*证明*：若 $f$ 无不动点，则存在收缩映射 $r: D^n \to S^{n-1}$。这将诱导 $H_{n-1}(S^{n-1}) \cong \mathbb{Z}$ 到 $H_{n-1}(D^n) = 0$ 的恒等同态通过 $r_* \circ i_*$，矛盾。∎

**推论 77.10**（维数不变性）：若 $\mathbb{R}^n \cong \mathbb{R}^m$（同胚），则 $n = m$。

*证明*：$\mathbb{R}^n \setminus \{0\} \simeq S^{n-1}$。若 $\mathbb{R}^n \cong \mathbb{R}^m$，则 $S^{n-1} \simeq S^{m-1}$，故 $H_{n-1}(S^{n-1}) \cong H_{n-1}(S^{m-1})$。仅当 $n = m$ 时可能。∎

### 77.5 胞腔同调

**定义 77.8**（CW 复形）：CW 复形是归纳构造的空间：$X^0$ 是离散点集；$X^n$ 由 $X^{n-1}$ 粘合 $n$ 维胞腔 $D^n_\alpha$ 得到（沿边界 $S^{n-1}_\alpha \to X^{n-1}$ 粘合）。$X = \bigcup_n X^n$ 赋予弱拓扑。

**定理 77.11**（胞腔同调）：对 CW 复形 $X$，$H_n(X^n, X^{n-1})$ 是自由 Abel 群，秩等于 $X$ 的 $n$ 维胞腔数。$H_n(X)$ 同构于胞腔链复形

$$\cdots \to H_n(X^n, X^{n-1}) \xrightarrow{d_n} H_{n-1}(X^{n-1}, X^{n-2}) \to \cdots$$

的同调，其中 $d_n$ 由边界粘合映射的度决定。

**例 77.1**（实射影空间 $\mathbb{R}P^n$ 的胞腔结构）：$\mathbb{R}P^n$ 每个维数 $0, 1, \ldots, n$ 各有一个胞腔。其胞腔同调为：

$$H_k(\mathbb{R}P^n) \cong \begin{cases} \mathbb{Z} & k = 0 \\ \mathbb{Z}/2\mathbb{Z} & 0 < k < n, k \text{ 奇} \\ 0 & 0 < k < n, k \text{ 偶} \\ \mathbb{Z} & k = n \text{（若 } n \text{ 奇）} \\ 0 & k = n \text{（若 } n \text{ 偶）} \end{cases}$$

---

---

## 第78章：上同调与杯积
上同调是同调的对偶理论，但其优势在于有自然的乘法结构——杯积（cup product），将上同调变为分次环。

### 78.1 上同调群

**定义 78.1**（上链复形）：设 $C_\bullet(X)$ 是奇异链复形。对 Abel 群 $G$，定义**上链群** $C^n(X; G) = \operatorname{Hom}(C_n(X), G)$。上边缘算子 $\delta^n: C^n(X; G) \to C^{n+1}(X; G)$ 定义为 $(\delta^n \varphi)(\sigma) = \varphi(\partial_{n+1} \sigma)$。

**定义 78.2**（奇异上同调群）：$X$ 的系数在 $G$ 中的 $n$ 次**奇异上同调群**为

$$H^n(X; G) = \frac{\ker \delta^n}{\operatorname{im} \delta^{n-1}}$$

**命题 78.1**（上同调与同调的关系）：由万有系数定理，存在分裂短正合序列：

$$0 \to \operatorname{Ext}(H_{n-1}(X), G) \to H^n(X; G) \to \operatorname{Hom}(H_n(X), G) \to 0$$

特别地，若 $G = \mathbb{R}$（或 $\mathbb{Q}$），则 $H^n(X; \mathbb{R}) \cong \operatorname{Hom}(H_n(X), \mathbb{R})$（对偶空间）。

### 78.2 杯积

**定义 78.3**（杯积）：设 $R$ 是交换环。定义**杯积**

$$\smile: H^p(X; R) \times H^q(X; R) \to H^{p+q}(X; R)$$

在上链层次上，对 $\varphi \in C^p(X; R)$，$\psi \in C^q(X; R)$，$(\varphi \smile \psi)(\sigma) = \varphi(\sigma|_{[e_0, \ldots, e_p]}) \cdot \psi(\sigma|_{[e_p, \ldots, e_{p+q}]})$，其中 $\sigma|_{[e_0, \ldots, e_p]}$ 表示 $\sigma$ 限制在前 $p+1$ 个顶点上。

**命题 78.2**（杯积的性质）：
1. $\delta(\varphi \smile \psi) = \delta\varphi \smile \psi + (-1)^p \varphi \smile \delta\psi$（杯积在上同调层次良定义）
2. $(\varphi \smile \psi) \smile \eta = \varphi \smile (\psi \smile \eta)$（结合律）
3. $\varphi \smile \psi = (-1)^{pq} \psi \smile \varphi$（分次交换律，在同调层次）
4. 杯积是自然的：$f^*(\varphi \smile \psi) = f^*\varphi \smile f^*\psi$

**定义 78.4**（上同调环）：$X$ 的**上同调环** $H^*(X; R) = \bigoplus_{n \geq 0} H^n(X; R)$ 在杯积下构成分次交换 $R$-代数。

**例 78.1**（球面的上同调环）：$H^*(S^n; \mathbb{Z}) \cong \mathbb{Z}[\alpha]/(\alpha^2)$，其中 $\deg \alpha = n$。即 $H^0 \cong H^n \cong \mathbb{Z}$，其余为零，$\alpha \smile \alpha = 0$。

**例 78.2**（复射影空间 $\mathbb{C}P^n$ 的上同调环）：$H^*(\mathbb{C}P^n; \mathbb{Z}) \cong \mathbb{Z}[x]/(x^{n+1})$，其中 $\deg x = 2$。

**例 78.3**（环面 $T^2$ 的上同调环）：$H^*(T^2; \mathbb{Z}) \cong \Lambda(a, b)$（$a, b$ 为 1 次生成元的外代数），$a \smile b = -b \smile a$ 是 $H^2$ 的生成元。

### 78.3 Poincaré 对偶

**定义 78.5**（定向）：$n$ 维拓扑流形 $M$ 的**定向**是 $H_n(M, M \setminus \{x\}) \cong \mathbb{Z}$ 在每点 $x$ 处的一致选择。等价地，在 $M$ 紧致时，**基本类** $[M] \in H_n(M)$ 是当 $M$ 可定向时的生成元。

**定理 78.3**（Poincaré 对偶）：设 $M$ 是紧致无边可定向 $n$ 维流形。则杯积与基本类 $[M]$ 的配对给出同构：

$$H^k(M; \mathbb{Z}) \cong H_{n-k}(M; \mathbb{Z})$$

同构由 $\alpha \mapsto [M] \smallfrown \alpha$ 给出（$\smallfrown$ 是 **cap 积**）。

*证明思路*：对闭可定向 $n$ 维流形 $M$，取基本类 $[M] \in H_n(M)$。定义 cap 积 $\smallfrown: H^k(M) \times H_n(M) \to H_{n-k}(M)$，则映射 $\alpha \mapsto [M] \smallfrown \alpha$ 给出同构。验证方法：(1) 对 $\mathbb{R}^n$ 中的开集用切除定理验证局部同构；(2) 用 Mayer-Vietoris 序列将局部情形粘合为全局——若 $M = U \cup V$ 且同构在 $U, V, U \cap V$ 上成立，则由五引理知在 $M$ 上也成立；(3) 对紧致流形用归纳法将局部同构推广到有限并。cap 积的自然性保证了该映射不依赖于剖分选择。∎

**推论 78.4**：紧致可定向流形的 Euler 示性数为 $\chi(M) = \sum_{k=0}^n (-1)^k \operatorname{rank} H_k(M)$。由 Poincaré 对偶，$\operatorname{rank} H_k(M) = \operatorname{rank} H_{n-k}(M)$。

**定理 78.5**（Poincaré 对偶的杯积形式）：配对

$$H^k(M; \mathbb{R}) \times H^{n-k}(M; \mathbb{R}) \to \mathbb{R}, \quad (\alpha, \beta) \mapsto \langle \alpha \smile \beta, [M] \rangle$$

是非退化的双线性型。当 $n = 4k$ 时，$H^{2k}$ 上的二次型（符号差）是重要的拓扑不变量。

### 78.4 de Rham 上同调回顾

由 V11 第 64 章的 de Rham 定理（陈述）：对光滑流形 $M$，de Rham 上同调 $H^k_{dR}(M)$ 同构于奇异上同调 $H^k(M; \mathbb{R})$。杯积对应于微分形式的外积。

---

---

## 第79章：同伦群
同伦群 $\pi_n(X)$（$n \geq 1$）是基本群 $\pi_1(X)$ 的高维推广，捕捉了 $n$ 维球面到 $X$ 的映射的同伦类。

### 79.1 高维同伦群的定义

**定义 79.1**（$\pi_n$ 的定义）：设 $X$ 为带基点 $(X, x_0)$ 的拓扑空间。$\pi_n(X, x_0)$ 定义为保持基点的映射 $f: (S^n, s_0) \to (X, x_0)$ 的保基点同伦类构成的集合。等价地，$f: (I^n, \partial I^n) \to (X, x_0)$ 的同伦类。

**定义 79.2**（群运算）：$\pi_n(X, x_0)$ 上的群运算由「坐标压缩」定义：对 $f, g: (I^n, \partial I^n) \to (X, x_0)$，

$$(f + g)(t_1, \ldots, t_n) = \begin{cases} f(2t_1, t_2, \ldots, t_n) & 0 \leq t_1 \leq 1/2 \\ g(2t_1-1, t_2, \ldots, t_n) & 1/2 \leq t_1 \leq 1 \end{cases}$$

**命题 79.1**：对 $n \geq 2$，$\pi_n(X, x_0)$ 是 Abel 群。

*证明*：对 $n \geq 2$，存在「旋转」同伦，将 $f$ 和 $g$ 的运算顺序交换。直观上，$n \geq 2$ 时 $I^n$ 的边界 $\partial I^n$ 中 $f$ 和 $g$ 被挤压到不同的坐标方向，有足够空间交换。∎

**命题 79.2**（函子性）：$\pi_n$ 是从带基点拓扑空间范畴到群范畴（$n \geq 2$ 时为 Abel 群范畴）的函子。同伦等价诱导同伦群的同构。

**命题 79.3**（$\pi_n$ 与覆叠空间）：若 $p: \tilde{X} \to X$ 是覆叠映射，则对 $n \geq 2$，$p_*: \pi_n(\tilde{X}) \to \pi_n(X)$ 是同构。即覆叠空间不改变高维同伦群。

*证明*：$S^n$（$n \geq 2$）是单连通的，故任意映射 $S^n \to X$ 可唯一提升到 $\tilde{X}$（由提升判别法，定理 61.4）。∎

**推论 79.5**：$\pi_n(S^1) = 0$ 对 $n \geq 2$（因为 $\mathbb{R}$ 可缩，$\pi_n(\mathbb{R}) = 0$）。

### 79.2 球面的同伦群

**定理 79.6**（$\pi_n(S^n)$ 的计算）：$\pi_n(S^n) \cong \mathbb{Z}$。生成元是恒等映射 $[S^n \to S^n]$ 的同伦类。

*证明思路*：使用 Hurewicz 定理（见 79.4 节）：$H_n(S^n) \cong \mathbb{Z}$，且 $H_k(S^n) = 0$（$0 < k < n$）。由 Hurewicz 定理，$\pi_n(S^n) \cong H_n(S^n) \cong \mathbb{Z}$。映射度（Brouwer 度）给出同构。∎

**定理 79.7**（部分低维同伦群，陈述）：

| 球面 | $\pi_3$ | $\pi_4$ | $\pi_5$ | $\pi_6$ |
|---|---|---|---|---|
| $S^2$ | $\mathbb{Z}$ | $\mathbb{Z}/2$ | $\mathbb{Z}/2$ | $\mathbb{Z}/12$ |
| $S^3$ | $\mathbb{Z}$ | $\mathbb{Z}/2$ | $\mathbb{Z}/2$ | $\mathbb{Z}/12$ |
| $S^4$ | $0$ | $\mathbb{Z}$ | $\mathbb{Z}/2$ | $\mathbb{Z}/2$ |

*说明*：球面的同伦群计算极其困难，至今仍无一般公式。$\pi_{n+k}(S^n)$ 对 $k$ 固定、$n$ 充分大时稳定（Freudenthal 悬挂定理）。

### 79.3 纤维化与同伦长正合序列

**定义 79.3**（纤维化 / Hurewicz 纤维化）：映射 $p: E \to B$ 称为**纤维化**（或 Hurewicz 纤维化），如果对任意空间 $X$ 和同伦 $H: X \times I \to B$，以及初始提升 $\tilde{H}_0: X \to E$（$p \circ \tilde{H}_0 = H_0$），存在同伦 $\tilde{H}: X \times I \to E$ 提升 $H$ 且延伸 $\tilde{H}_0$。即下列图表存在提升：

$$
\begin{CD}
X @>{\tilde{H}_0}>> E \\
@V{i_0}VV @VV{p}V \\
X \times I @>>{H}> B
\end{CD}
$$

**例 79.1**（常见纤维化）：
- 覆叠映射是纤维化（离散纤维）
- Hopf 纤维化：$S^1 \to S^3 \to S^2$，$S^3 \to S^7 \to S^4$，$S^7 \to S^{15} \to S^8$
- 道路空间纤维化：$\Omega B \to PB \to B$（$PB$ 可缩，$\Omega B$ 是回路空间）

**定理 79.8**（纤维化的同伦长正合序列）：设 $p: E \to B$ 是纤维化，$F = p^{-1}(b_0)$ 是纤维。取基点 $e_0 \in F$。则存在长正合序列：

$$\cdots \to \pi_n(F) \to \pi_n(E) \to \pi_n(B) \xrightarrow{\partial} \pi_{n-1}(F) \to \cdots \to \pi_0(E) \to \pi_0(B)$$

*证明思路*：边界同态 $\partial: \pi_n(B) \to \pi_{n-1}(F)$ 由提升性质定义：$S^n$ 中的映射提升到 $E$ 时，其在 $S^{n-1}$（赤道）上的限制落在 $F$ 中。正合性验证需利用同伦提升性质。∎

**推论 79.9**（$\pi_n(S^1)$ 的重新证明）：由覆叠 $\mathbb{R} \to S^1$（纤维 $\mathbb{Z}$），长正合序列给出 $\pi_n(\mathbb{R}) \to \pi_n(S^1) \to \pi_{n-1}(\mathbb{Z})$。$\mathbb{R}$ 可缩，$\mathbb{Z}$ 离散，故 $\pi_n(S^1) = 0$（$n \geq 2$），$\pi_1(S^1) \cong \mathbb{Z}$。

**例 79.2**（Hopf 纤维化的应用）：由 $S^1 \to S^3 \to S^2$ 的长正合序列：

$$\cdots \to \pi_3(S^1) \to \pi_3(S^3) \to \pi_3(S^2) \to \pi_2(S^1) \to \cdots$$

$\pi_3(S^1) = \pi_2(S^1) = 0$，$\pi_3(S^3) \cong \mathbb{Z}$。故 $\pi_3(S^2) \cong \mathbb{Z}$（由 Hopf 映射 $S^3 \to S^2$ 生成）。这是第一个非平凡的高维同伦群。

### 79.4 Hurewicz 定理与 Whitehead 定理

**定理 79.10**（Hurewicz 定理）：设 $X$ 是道路连通空间，$\pi_i(X) = 0$ 对 $i < n$（$n \geq 2$）。则 $\tilde{H}_i(X) = 0$ 对 $i < n$，且

$$h: \pi_n(X) \to H_n(X)$$

（Hurewicz 同态，将同伦类 $[f: S^n \to X]$ 映到 $f_*[S^n] \in H_n(X)$）是同构。

对 $n = 1$，$h: \pi_1(X) \to H_1(X)$ 是 Abel 化同态（即 $H_1(X) \cong \pi_1(X)/[\pi_1(X), \pi_1(X)]$）。

*证明思路*：对 $n = 1$，$H_1(X)$ 是 $\pi_1(X)$ 的 Abel 化（由奇异同调的定义）。对 $n \geq 2$，需要构造 Hurewicz 同态的逆。假设 $\pi_i(X) = 0$（$i < n$），则 $X$ 的 $(n-1)$-骨架可缩，$X$ 同伦等价于仅由 $n$ 维及以上胞腔构成的 CW 复形。此时 $H_n(X)$ 自由生成于 $n$ 维胞腔，每个胞腔给出 $S^n \to X$ 的映射，构成 $\pi_n(X)$ 的生成元。∎

**定理 79.11**（Whitehead 定理）：设 $f: X \to Y$ 是 CW 复形之间的连续映射。若 $f_*: \pi_n(X) \to \pi_n(Y)$ 对所有 $n$ 是同构，则 $f$ 是同伦等价。

*说明*：Whitehead 定理表明同伦群完全决定了 CW 复形的同伦型。但注意：存在不同伦等价的空间具有相同的同伦群（例如有不同的同调群，而同伦等价蕴含同调同构）。

**推论 79.12**：若 $X$ 是 CW 复形且 $\pi_n(X) = 0$ 对所有 $n$，则 $X$ 可缩。

### 79.5 悬挂同态与稳定同伦群

**定义 79.4**（悬挂）：空间 $X$ 的**悬挂** $\Sigma X$ 定义为 $X \times [0, 1] / \sim$，其中 $(x, 0) \sim (y, 0)$ 和 $(x, 1) \sim (y, 1)$ 对所有 $x, y$ 成立。$\Sigma S^n \cong S^{n+1}$。

**定理 79.13**（Freudenthal 悬挂定理）：悬挂映射 $E: \pi_k(X) \to \pi_{k+1}(\Sigma X)$（$E[f] = [\Sigma f]$）在 $k \leq 2n-2$ 时（若 $X$ 是 $(n-1)$-连通的）是同构。

特别地，$\pi_{n+k}(S^n)$ 对 $n > k+1$ 稳定，即 $\pi_{n+k}(S^n)$ 不依赖于 $n$。记作 $\pi_k^S$（第 $k$ 个**稳定同伦群**）。

**例 79.3**：$\pi_0^S = \mathbb{Z}$（映射度），$\pi_1^S = \mathbb{Z}/2$（Hopf 映射），$\pi_2^S = \mathbb{Z}/2$，$\pi_3^S = \mathbb{Z}/24$。

---

---

## 第80章：谱序列初步
谱序列是计算同调（或同伦）群的系统化工具，通过逐次逼近从容易计算的「初始页」收敛到目标群。

### 80.1 谱序列的定义与收敛

**定义 80.1**（谱序列）：一个（上同调）**谱序列**是一列分次 $R$-模（或 Abel 群）$E_r^{p,q}$（$r \geq 0$ 或 $r \geq 1$）和微分 $d_r: E_r^{p,q} \to E_r^{p+r, q-r+1}$ 满足 $d_r \circ d_r = 0$，且 $E_{r+1}^{p,q} \cong H^{p,q}(E_r) = \frac{\ker d_r|_{E_r^{p,q}}}{\operatorname{im} d_r|_{E_r^{p-r, q+r-1}}}$。

**注释**：同调谱序列中微分方向为 $d^r: E^r_{p,q} \to E^r_{p-r, q+r-1}$。

**定义 80.2**（收敛）：称谱序列**收敛**到 $H^*$（记作 $E_2^{p,q} \Rightarrow H^{p+q}$），如果对每个 $(p, q)$，$E_r^{p,q}$ 对充分大的 $r$ 稳定，且极限项 $E_\infty^{p,q}$ 是 $H^{p+q}$ 的某个滤过（filtration）的商：$0 \subseteq F^0 \subseteq F^1 \subseteq \cdots \subseteq H^n$ 且 $E_\infty^{p,q} \cong F^p H^{p+q} / F^{p-1} H^{p+q}$。

### 80.2 滤过与谱序列的构造

**定义 80.3**（滤过链复形）：链复形 $C_\bullet$ 的**滤过**是一族子复形 $\cdots \subseteq F_{p-1} C_\bullet \subseteq F_p C_\bullet \subseteq F_{p+1} C_\bullet \subseteq \cdots$（递增滤过，或递减滤过 $F^p$）。

滤过诱导谱序列的 $E^0$ 页：$E^0_{p,q} = F_p C_{p+q} / F_{p-1} C_{p+q}$。$d^0$ 由原始的边缘算子诱导。$E^1_{p,q} = H_{p+q}(F_p / F_{p-1})$。

**定理 80.1**（滤过链复形的谱序列）：若滤过是有界的（即对每个 $n$，$F_p C_n = 0$ 对充分小的 $p$，$F_p C_n = C_n$ 对充分大的 $p$），则谱序列收敛到 $H_*(C_\bullet)$：

$$E^1_{p,q} = H_{p+q}(F_p C_\bullet / F_{p-1} C_\bullet) \Rightarrow H_{p+q}(C_\bullet)$$

### 80.3 Serre 谱序列

**定理 80.2**（Serre 谱序列）：设 $p: E \to B$ 是纤维化，$F$ 是纤维，$B$ 是道路连通的 CW 复形。则存在（同调）谱序列

$$E^2_{p,q} = H_p(B; H_q(F)) \Rightarrow H_{p+q}(E)$$

其中 $H_p(B; H_q(F))$ 是以 $H_q(F)$ 为局部系数的同调（若 $B$ 单连通，则为普通同调）。

*证明思路*：取 $B$ 的骨架滤过 $B^0 \subseteq B^1 \subseteq \cdots$，拉回得到 $E$ 的滤过 $E^p = p^{-1}(B^p)$。此滤过诱导的谱序列即 Serre 谱序列。$E^2$ 页的计算用到纤维化在胞腔上的局部平凡性。∎

**推论 80.3**（Serre 正合序列）：若 $B$ 是单连通 CW 复形，则存在正合序列

$$\cdots \to H_n(F) \to H_n(E) \to H_n(B) \to H_{n-1}(F) \to \cdots$$

这是 Serre 谱序列在 $E^2_{p,q} = H_p(B) \otimes H_q(F)$（当 $B$ 单连通时）的特殊情形。

**例 80.1**（用 Serre 谱序列计算 $\Omega S^n$ 的同调）：道路-回路纤维化 $\Omega S^n \to PS^n \to S^n$（$PS^n$ 可缩）。Serre 谱序列给出 $H_*(\Omega S^n) \cong \mathbb{Z}[x]/(x^2)$ 外代数（$n$ 奇）或多项式代数（$n$ 偶），其中生成元在 $n-1$ 次。

### 80.4 Leray-Serre 上同调谱序列

**定理 80.4**（上同调 Serre 谱序列）：在定理 80.2 的条件下，存在上同调谱序列

$$E_2^{p,q} = H^p(B; H^q(F)) \Rightarrow H^{p+q}(E)$$

当 $B$ 单连通时，$E_2^{p,q} \cong H^p(B) \otimes H^q(F)$。

此外，此谱序列是**乘法的**：$E_r$ 页上有自然的杯积结构，且微分 $d_r$ 满足 Leibniz 法则。这极大地增强了计算能力。

### 80.5 应用举例

**定理 80.5**（$\pi_4(S^3)$ 的计算）：$\pi_4(S^3) \cong \mathbb{Z}/2\mathbb{Z}$。

*证明思路*：考虑 Hopf 纤维化 $S^3 \to S^7 \to S^4$。由同伦长正合序列，$\pi_4(S^3) \cong \pi_4(S^7) \oplus \pi_5(S^4) \cong \pi_5(S^4)$。然后使用 Serre 谱序列计算 $\Omega S^4$ 的同调，结合 Hurewicz 定理。$\pi_4(S^3) \cong \mathbb{Z}/2$ 由 Hopf 不变量为 1 的映射给出。∎

**定理 80.6**（Eilenberg-MacLane 空间的同调）：$K(\mathbb{Z}, n)$ 的同调群可通过 Serre 谱序列从路径空间纤维化 $K(\mathbb{Z}, n-1) \to PK(\mathbb{Z}, n) \to K(\mathbb{Z}, n)$ 归纳计算。例如：

- $H^*(K(\mathbb{Z}, 2); \mathbb{Z}) \cong \mathbb{Z}[x]$，$\deg x = 2$（$K(\mathbb{Z}, 2) \simeq \mathbb{C}P^\infty$）
- $H^*(K(\mathbb{Z}, 3); \mathbb{Z})$ 在低次由 $\mathbb{Z}$ 在 3 次生成

**定理 80.7**（Leray-Hirsch 定理）：设 $F \to E \xrightarrow{p} B$ 是纤维化，$B$ 是 CW 复形。若存在 $H^*(F)$ 的齐次基 $\{c_i\}$ 和 $E$ 中的上同调类 $\{\tilde{c}_i\}$ 使得 $j^*\tilde{c}_i = c_i$（$j: F \hookrightarrow E$），则

$$H^*(E) \cong H^*(B) \otimes H^*(F)$$

作为 $H^*(B)$-模（即 $H^*(E)$ 是自由 $H^*(B)$-模，基为 $\{\tilde{c}_i\}$）。

**例 80.2**：旗流形 $U(n)/T^n$ 的上同调可通过此定理从纤维化 $U(n)/T^n \to BT^n \to BU(n)$ 计算，得到 Borel 的图像。

---

---

## 第182章：纤维丛与示性类
纤维丛是代数拓扑与微分几何交汇处的核心概念。它形式化了"局部平凡、全局扭曲"的几何结构——在局部上看，纤维丛是乘积空间 $U \times F$，但在全局上可能通过"扭转"的方式粘合而成。示性类（characteristic classes）通过上同调类精确刻画这种扭曲，是连接拓扑、几何与数学物理的桥梁。

### 81.1 纤维丛的基本概念

**定义 81.1**（纤维丛）：一个**纤维丛** $(E, \pi, B, F, G)$ 由以下数据构成：

- **全空间**（total space）$E$
- **底空间**（base space）$B$
- **投影**（projection）$\pi: E \to B$，是连续满射
- **标准纤维**（typical fiber）$F$
- **结构群**（structure group）$G \subseteq \text{Diff}(F)$（或 $G \subseteq \text{Homeo}(F)$）
- 一族**局部平凡化** $\{ \phi_i: \pi^{-1}(U_i) \to U_i \times F \}$，其中 $\{U_i\}$ 是 $B$ 的开覆盖

满足：对每对 $(i, j)$，**转移函数**（transition function）$g_{ij}: U_i \cap U_j \to G$ 定义为

$$\phi_i \circ \phi_j^{-1}(x, f) = (x, g_{ij}(x) \cdot f)$$

且满足**上循环条件**（cocycle condition）：$g_{ij}(x) \circ g_{jk}(x) = g_{ik}(x)$，对所有 $x \in U_i \cap U_j \cap U_k$。

**例 81.1**（向量丛）：标准纤维 $F = \mathbb{R}^n$，结构群 $G = GL(n, \mathbb{R})$（或 $O(n)$，若赋予度量）。最重要的例子是微分流形 $M$ 上的**切丛** $TM$、**余切丛** $T^*M$、**法丛**以及各种张量丛。Mobius 带是 $\mathbb{R}$ 上最常见的非平凡线丛——它局部平凡但全局不可定向。

**例 81.2**（主丛）：标准纤维 $F = G$（李群），$G$ 通过左乘作用于自身。**主 $G$-丛**（principal $G$-bundle）记作 $P \to B$。主丛是研究一般纤维丛的基础工具：每个向量丛 $E \to B$ 关联一个主 $GL(n)$-丛（其**标架丛** $F(E)$），标架丛的纤维是 $E$ 在一点上的所有基（标架）。

**例 81.3**（覆叠空间）：覆叠空间是纤维为离散空间的纤维丛，即 $F$ 为离散拓扑空间，$G$ 为离散群。

**定义 81.2**（截面）：纤维丛 $\pi: E \to B$ 的一个**截面**（section）是连续映射 $s: B \to E$ 满足 $\pi \circ s = \text{id}_B$。向量丛的截面空间记作 $\Gamma(E)$，它是一个 $C^\infty(B)$-模。切丛的截面即**向量场**，余切丛的截面即 **1-形式**。

**定义 81.3**（拉回丛）：设 $f: X \to B$ 是连续映射，$E \to B$ 是纤维丛。**拉回丛**（pullback bundle）$f^*E \to X$ 定义为

$$f^*E = \{(x, e) \in X \times E : f(x) = \pi(e)\}$$

投影为 $(x, e) \mapsto x$。拉回丛继承了原丛的纤维和结构群。

**定义 81.4**（丛同构）：两个纤维丛 $\pi_1: E_1 \to B$ 和 $\pi_2: E_2 \to B$（同一底空间）称为**同构**，如果存在同胚 $\Phi: E_1 \to E_2$ 满足 $\pi_2 \circ \Phi = \pi_1$，且 $\Phi$ 在每根纤维上是线性同构（向量丛情形）或 $G$-等变同胚（主丛情形）。

**定理 81.1**（上同调分类定理）：对李群 $G$，存在**分类空间** $BG$ 和**万有丛** $EG \to BG$（$EG$ 可缩），使得对任意仿紧空间 $X$，$X$ 上主 $G$-丛的同构类与连续映射同伦类集 $[X, BG]$ 一一对应。丛 $P \to X$ 对应的映射 $f_P: X \to BG$ 称为**分类映射**（classifying map），且 $P \cong f_P^* EG$。

重要例子：
- $BGL(n, \mathbb{R}) \simeq BO(n) \simeq \text{Gr}_n(\mathbb{R}^\infty)$（无穷 Grassmann 流形）
- $BGL(n, \mathbb{C}) \simeq BU(n) \simeq \text{Gr}_n(\mathbb{C}^\infty)$
- $BU(1) \simeq \mathbb{CP}^\infty = K(\mathbb{Z}, 2)$
- $B\mathbb{Z}/2 \simeq \mathbb{RP}^\infty = K(\mathbb{Z}/2, 1)$

**推论 81.2**（示性类的定义）：设 $c \in H^*(BG; R)$ 为上同调类。对任意主 $G$-丛 $P \to X$ 及分类映射 $f_P: X \to BG$，定义丛 $P$ 的**示性类**为 $c(P) = f_P^*(c) \in H^*(X; R)$。这解释了为什么示性类是"万有"的——它们来自分类空间的上同调。

### 81.2 Stiefel-Whitney 类与 Chern 类

**定义 81.5**（Stiefel-Whitney 类）：对实向量丛 $E \to B$（秩 $n$），其 **Stiefel-Whitney 类** $w_i(E) \in H^i(B; \mathbb{Z}/2\mathbb{Z})$（$0 \leq i \leq n$）是满足以下公理的唯一族上同调类：

1. $w_0(E) = 1$，$w_i(E) = 0$ 当 $i > \text{rank}(E)$
2. **自然性**（naturality）：对任意连续映射 $f: X \to B$，$w_i(f^*E) = f^* w_i(E)$
3. **Whitney 和公式**：对总 Stiefel-Whitney 类 $w(E) = 1 + w_1(E) + w_2(E) + \cdots + w_n(E)$，有

$$w(E \oplus F) = w(E) \smile w(F)$$

4. **正规化**（normalization）：$\mathbb{RP}^1 \cong S^1$ 上重言线丛 $\gamma^1$ 满足 $w_1(\gamma^1) \neq 0 \in H^1(\mathbb{RP}^1; \mathbb{Z}/2) \cong \mathbb{Z}/2$

**定理 81.3**（Stiefel-Whitney 类的存在性与唯一性）：满足上述公理的 Stiefel-Whitney 类存在且唯一。存在性的标准构造使用分类空间 $BO(n)$ 的上同调：$H^*(BO(n); \mathbb{Z}/2) \cong \mathbb{Z}/2[w_1, \ldots, w_n]$（多项式代数），其中 $w_i$ 即万有 Stiefel-Whitney 类。唯一性由分裂原理保证。

**定理 81.4**（Stiefel-Whitney 类的几何意义）：
- $w_1(E) = 0 \iff E$ 可定向（$w_1$ 是定向障碍类）
- $w_2(E) = 0 \iff E$ 有自旋结构（$w_2$ 是自旋障碍类）
- 紧流形 $M$ 可平行化（tangential parallelizable）当且仅当 $w_i(TM) = 0$ 对所有 $i > 0$

特别地，$w_1(T\mathbb{RP}^n) \neq 0$（当 $n$ 奇），$\mathbb{RP}^2$ 不可平行化（$w_2(T\mathbb{RP}^2) \neq 0$）。

**定理 81.5**（Wu 公式与 Wu 类）：对闭流形 $M^n$，存在唯一的上同调类 $v_i \in H^i(M; \mathbb{Z}/2)$（Wu 类），使得对所有 $x \in H^{n-i}(M; \mathbb{Z}/2)$，$\langle v_i \smile x, [M] \rangle = \langle Sq^i(x), [M] \rangle$，其中 $Sq^i$ 是 Steenrod 平方运算。Stiefel-Whitney 类与 Wu 类的关系为 $w = Sq(v)$，即 $w_k = \sum_{i=0}^k Sq^{k-i}(v_i)$。Wu 公式表明 Stiefel-Whitney 类完全由上同调环的 Steenrod 代数结构决定——它们是流形的同伦型不变量。

**定义 81.6**（Chern 类）：对复向量丛 $E \to B$（秩 $n$），其 **Chern 类** $c_i(E) \in H^{2i}(B; \mathbb{Z})$ 满足类似公理：

1. $c_0(E) = 1$，$c_i(E) = 0$ 当 $i > \text{rank}(E)$
2. **自然性**：$c_i(f^*E) = f^* c_i(E)$
3. **Whitney 和公式**：$c(E \oplus F) = c(E) \smile c(F)$
4. **正规化**：$\mathbb{CP}^1 \cong S^2$ 上重言线丛 $\gamma^1_{\mathbb{C}}$ 满足 $c_1(\gamma^1_{\mathbb{C}}) = -1 \cdot [\omega_{FS}]$，其中 $[\omega_{FS}]$ 是 Fubini-Study 形式的基本类（即 $\langle c_1(\gamma^1_{\mathbb{C}}), [\mathbb{CP}^1] \rangle = -1$）

总 Chern 类记作 $c(E) = 1 + c_1(E) + c_2(E) + \cdots + c_n(E)$。Chern 类从分类空间的上同调得到：$H^*(BU(n); \mathbb{Z}) \cong \mathbb{Z}[c_1, \ldots, c_n]$，$\deg c_i = 2i$。

**例 81.4**（$\mathbb{CP}^n$ 的切丛）：$\mathbb{CP}^n$ 的全纯切丛 $T\mathbb{CP}^n$ 的 Chern 类为 $c(T\mathbb{CP}^n) = (1 + x)^{n+1}$，其中 $x = c_1(\mathcal{O}(1)) \in H^2(\mathbb{CP}^n; \mathbb{Z})$ 是超平面丛的第一 Chern 类。特别地，$c_1(T\mathbb{CP}^n) = (n+1)x$，$c_n(T\mathbb{CP}^n) = \binom{n+1}{n} x^n = (n+1)x^n$。

**定理 81.6**（分裂原理，Splitting Principle）：对任意向量丛 $E \to B$，存在连续映射 $f: F(E) \to B$（**旗流形**，flag manifold），使得：

1. 拉回丛 $f^*E$ 分裂为线丛的直和：$f^*E \cong L_1 \oplus L_2 \oplus \cdots \oplus L_n$
2. 诱导同态 $f^*: H^*(B) \to H^*(F(E))$ 是**单射**

分裂原理将复杂向量丛的示性类计算约化到线丛情形。例如，Chern 类可形式地写为 $c(E) = \prod_{i=1}^n (1 + x_i)$，其中 $x_i = c_1(L_i)$ 称为 **Chern 根**（Chern roots）。

**定理 81.7**（Chern-Weil 理论）：设 $\nabla$ 是复向量丛 $E \to M$（$M$ 是光滑流形）上的联络，其曲率 $F_\nabla \in \Omega^2(M; \text{End}(E))$。则 Chern 类可由曲率形式的多项式表示为 de Rham 上同调类：

$$c_k(E) = \left[ \sigma_k\left(\frac{i}{2\pi} F_\nabla\right) \right] \in H^{2k}_{\text{dR}}(M)$$

其中 $\sigma_k$ 是第 $k$ 个初等对称多项式（即特征值的第 $k$ 个对称和）。特别地，

$$c_1(E) = \left[\frac{i}{2\pi} \text{Tr}(F_\nabla)\right], \quad c_2(E) = \left[\frac{1}{8\pi^2}\left(\text{Tr}(F_\nabla \wedge F_\nabla) - \text{Tr}(F_\nabla) \wedge \text{Tr}(F_\nabla)\right)\right]$$

Chern-Weil 理论的美妙之处在于：尽管曲率 $F_\nabla$ 依赖于联络的选择，由曲率多项式定义的上同调类却不依赖于联络——它是拓扑不变量。

### 81.3 Pontryagin 类与 Euler 类

**定义 81.7**（Pontryagin 类）：实向量丛 $E \to B$（秩 $n$）的 **Pontryagin 类** $p_k(E) \in H^{4k}(B; \mathbb{Z})$（或系数在任意交换环中）由复化定义：

$$p_k(E) = (-1)^k c_{2k}(E \otimes_{\mathbb{R}} \mathbb{C})$$

总 Pontryagin 类 $p(E) = 1 + p_1(E) + p_2(E) + \cdots$，其中 $p_k(E)$ 的次数为 $4k$。注意 $c_{2k+1}(E \otimes \mathbb{C})$ 是 2-挠元，故定义中只取偶数次 Chern 类。

由分裂原理，Pontryagin 类可形式地写为 $p(E) = \prod (1 + x_i^2)$，其中 $x_i$ 是复化的 Chern 根（本质上是实丛的「Euler 形式」的对称化）。

**例 81.5**（球面的 Pontryagin 类）：对 $S^n$，其切丛的 Pontryagin 类在 $n \neq 4k$ 时平凡。$TS^4$ 有非平凡 $p_1$（实际上 $S^4$ 不是某个紧 Lie 群的齐性空间这一事实可通过 Pontryagin 类得到部分解释）。

**定义 81.8**（Euler 类）：设 $E \to B$ 是秩 $n$ 的**定向**实向量丛。其 **Euler 类** $e(E) \in H^n(B; \mathbb{Z})$ 满足：

1. 自然性：$e(f^*E) = f^* e(E)$
2. 若 $E$ 是奇秩丛，则 $2e(E) = 0$
3. $e(E \oplus F) = e(E) \smile e(F)$（在定向相容条件下的 Whitney 和公式的乘法形式）
4. **正规化**：对 $n$ 维闭定向流形 $M$，$\langle e(TM), [M] \rangle = \chi(M)$（Euler 示性数）

**定理 81.8**（Euler 类与 Stiefel-Whitney 类的关系）：在模 2 约化下，$e(E) \equiv w_n(E) \pmod{2}$。换言之，Euler 类是顶维 Stiefel-Whitney 类的整系数提升。

**定理 81.9**（Gauss-Bonnet-Chern 定理）：设 $M$ 是 $2n$ 维闭定向 Riemann 流形，$\Omega$ 是其曲率 2-形式（Levi-Civita 联络的曲率）。则

$$\chi(M) = \frac{1}{(2\pi)^n} \int_M \text{Pf}(\Omega)$$

其中 $\text{Pf}(\Omega)$ 是曲率形式的 Pfaffian，满足 $\text{Pf}(\Omega)^2 = \det(\Omega)$。这一定理将 Euler 示性数（拓扑量）表示为曲率的积分（几何量），是 Gauss-Bonnet 定理的高维推广。

**定理 81.10**（Hirzebruch 符号差定理）：设 $M$ 是 $4k$ 维定向紧流形。其**符号差**（signature）$\sigma(M)$（即相交形式在中间维上同调 $H^{2k}(M; \mathbb{R})$ 上的符号差）由 $L$-亏格（$L$-genus）给出：

$$\sigma(M) = \langle L_k(p_1, \ldots, p_k), [M] \rangle$$

其中 $L$-多项式由形式幂级数 $\prod_{i=1}^k \frac{x_i}{\tanh x_i}$ 的 Taylor 展开定义（$x_i$ 是 Pontryagin 根）。前几个 $L$-多项式为：

$$L_1 = \frac{1}{3}p_1, \quad L_2 = \frac{1}{45}(7p_2 - p_1^2), \quad L_3 = \frac{1}{945}(62p_3 - 13p_2p_1 + 2p_1^3)$$

**例 81.6**（$\mathbb{CP}^2$ 的符号差）：$\mathbb{CP}^2$ 的相交形式为 $[1]$，故 $\sigma(\mathbb{CP}^2) = 1$。$p_1(T\mathbb{CP}^2) = 3x^2$（$x$ 为生成元），$L_1 = p_1/3 = x^2$，$\langle x^2, [\mathbb{CP}^2] \rangle = 1 = \sigma(\mathbb{CP}^2)$。

### 81.4 示性类与指标定理

示性类深层的意义在 Atiyah-Singer 指标定理中得到了最完整的体现——它统一了多个经典定理，揭示了分析学（椭圆算子的指标）、拓扑学（示性类）和几何学（曲率）之间的内在联系。

**定理 81.11**（Atiyah-Singer 指标定理）：设 $D: \Gamma(E) \to \Gamma(F)$ 是紧无边流形 $M$ 上的椭圆微分算子（例如 Dirac 算子、Dolbeault 算子、符号差算子），$\sigma(D)$ 是其主象征（principal symbol），可视作 $K$ 理论中的元素。则

$$\text{ind}(D) = (-1)^{n(n+1)/2} \langle \text{ch}(\sigma(D)) \smile \hat{A}(TM), [TM] \rangle$$

其中：
- $\text{ch}: K(M) \to H^*(M; \mathbb{Q})$ 是 **Chern 特征**（Chern character），定义为 $\text{ch}(E) = \sum_{i=1}^n e^{x_i}$，$x_i$ 为 Chern 根。前几项为

$$\text{ch}(E) = \text{rank}(E) + c_1 + \frac{1}{2}(c_1^2 - 2c_2) + \frac{1}{6}(c_1^3 - 3c_1c_2 + 3c_3) + \cdots$$

- $\hat{A}(TM)$ 是 **$\hat{A}$-亏格**（$\hat{A}$-genus，或 A-hat genus），由形式幂级数 $\prod \frac{x_i/2}{\sinh(x_i/2)}$ 定义（$x_i$ 是 $TM \otimes \mathbb{C}$ 的 Pontryagin 根）

**推论 81.12**（指标定理的重要特例）：

1. **Gauss-Bonnet-Chern 定理**：取 de Rham 算子 $D = d + d^*$（作用于 $\bigwedge^* T^*M$），则 $\text{ind}(D) = \chi(M)$，指标定理约化为 Euler 示性数的曲率积分表示。

2. **Hirzebruch-Riemann-Roch 定理**：取 Dolbeault 算子 $\bar{\partial}$（作用于全纯向量丛），则

$$\chi(M, E) = \langle \text{ch}(E) \smile \text{Td}(TM), [M] \rangle$$

其中 $\text{Td}$ 是 **Todd 亏格**（Todd genus），由 $\prod \frac{x_i}{1 - e^{-x_i}}$ 定义。这一定理将全纯 Euler 示性数与 Chern 类联系起来，是复几何的基石。

3. **Hirzebruch 符号差定理**：取符号差算子，$\hat{A}$-亏格替换为 $L$-亏格。

**定理 81.13**（Chern 特征的函子性）：Chern 特征 $\text{ch}: K(X) \to H^*(X; \mathbb{Q})$ 是环同态：$\text{ch}(E \oplus F) = \text{ch}(E) + \text{ch}(F)$，$\text{ch}(E \otimes F) = \text{ch}(E) \smile \text{ch}(F)$。在张量积 $H^*(X; \mathbb{Q})$ 后，$\text{ch}$ 诱导同构 $K(X) \otimes \mathbb{Q} \cong H^*(X; \mathbb{Q})$（对有限 CW 复形）。

**定理 81.14**（Grothendieck-Riemann-Roch 定理）：设 $f: X \to Y$ 是光滑射影态射（代数几何中），$E$ 是 $X$ 上的向量丛。则

$$\text{ch}(f_! E) \smile \text{Td}(TY) = f_*(\text{ch}(E) \smile \text{Td}(TX))$$

其中 $f_!$ 是 $K$ 理论的直接像。这一定理是 Hirzebruch-Riemann-Roch 的相对化版本，在模空间理论和枚举几何中有深远应用。

### 81.5 小结：示性类的统一视角

示性类理论可总结为以下层次结构：

| 示性类 | 系数 | 次数 | 几何意义 |
|---|---|---|---|
| $w_i$（Stiefel-Whitney） | $\mathbb{Z}/2$ | $i$ | 定向障碍、自旋障碍 |
| $c_i$（Chern） | $\mathbb{Z}$ | $2i$ | 复向量丛的拓扑扭曲度量 |
| $p_i$（Pontryagin） | $\mathbb{Z}$ | $4i$ | 实向量丛复化后的扭曲 |
| $e$（Euler） | $\mathbb{Z}$ | $n$（秩） | 截面消失的障碍类 |

这些示性类的关系由以下交换图表概括：

- 实向量丛 $\xrightarrow{\text{复化}}$ 复向量丛：$p_k(E) = (-1)^k c_{2k}(E \otimes \mathbb{C})$
- 复向量丛 $\xrightarrow{\text{忘却复结构}}$ 实向量丛：$c_i(E) \mapsto w_{2i}(E_{\mathbb{R}})$（模 2）
- Euler 类与顶维 Stiefel-Whitney 类：$e(E) \equiv w_n(E) \pmod{2}$
- 所有示性类 $\xrightarrow{\text{Chern-Weil}}$ 曲率形式的多项式（de Rham 上同调）

示性类不仅是拓扑学的核心工具，更是现代理论物理中不可或缺的语言——从杨-Mills 理论的瞬子数（由第二 Chern 类 $c_2$ 的积分给出）到弦论中的反常消除（要求 $p_1/2 = 0$），从拓扑绝缘体的 $\mathbb{Z}_2$ 不变量到量子霍尔效应中的 Chern 数，示性类的思想渗透到物理学的多个前沿领域。

---

---

## 第82章：低维流形专题（3维与4维）
低维拓扑的核心研究对象是 3 维和 4 维流形——它们在几何和分析中表现出与高维 ($\geq 5$) 截然不同的现象，需要专门的技术和理论。在 3 维和 4 维，Whitney 技巧失效，阻碍了高维手术理论的直接应用。

**82.1 三维流形**：**Thurston 几何化猜想**（1982 年提出，由 Perelman 于 2003 年使用 Ricci 流证明）断言每个紧致 3 维流形可沿球面和环面唯一分解为具有八种几何结构之一的片。作为推论，Poincaré 猜想的证明：每个单连通闭 3 维流形同胚于 $S^3$。基本构造包括 Heegaard 分裂、Dehn 手术和 JSJ 分解。**量子不变量**：Witten-Reshetikhin-Turaev 不变量（Chern-Simons 量子场论）和 Khovanov 同调给出 3 维流形的新型拓扑不变量，扩展了经典基本群方法。

**82.2 四维流形**：四维的最大特点在于存在**怪异光滑结构**。**Donaldson 理论**（1983 年）利用 Yang-Mills 瞬子方程的模空间构造了四维流形的光滑不变量（Donaldson 多项式不变量），首次证明 $\mathbb{R}^4$ 存在不可数多个两两不微分同胚的光滑结构。**Seiberg-Witten 理论**（1994 年）提供了计算更简便的光滑不变量，证明了 Thom 猜想（代数曲线在光滑同调类中最小亏格）。**Freedman 定理**（1982 年）通过 Casson 手柄给出了单连通四维拓扑流形的完整分类（由相交形式和 Kirby-Siebenmann 不变量决定），结合 Donaldson 的结果展示了拓扑与光滑范畴的巨大差异——存在无穷多拓扑同胚但不微分同胚的四维流形对。

---

---

---

---

## 第184章（补充）
> 代数 K 理论是连接代数、拓扑、数论和代数几何的深层桥梁。从 Grothendieck 的 K0 构造到 Quillen 的高阶 K 理论，再到 Voevodsky 的母题上同调，K 理论揭示了代数结构与拓扑不变量的深刻联系。本卷系统建立低阶 K 理论（K0、K1、K2）的基本框架、Milnor K 理论、代数 K 理论与母题上同调的关联，以及 K 理论在数论、几何和物理学中的应用。

> **卷序说明**：本章节号（Ch 196-201）反映其在全书逻辑链中的位置。物理卷序上本卷位于V51，作为代数K理论方向的专题补充卷。

---

---

## 第185章：低阶K理论导引
$K_0$ 是代数 K 理论的起点，由 Grothendieck 在 1957 年研究 Riemann-Roch 定理时引入。其基本思想是将"分裂正合列的可加性"形式化为 Abel 群。

### 196.1 Grothendieck 群的定义

**定义 196.1**（环的 $K_0$）：设 $R$ 为含幺环。令 $\mathcal{P}(R)$ 为有限生成投射左 $R$-模的同构类全体。在 $\mathcal{P}(R)$ 上定义加法运算 $[P] + [Q] = [P \oplus Q]$。则 **$K_0(R)$** 是上述交换么半群 $(\mathcal{P}(R), \oplus)$ 的 **Grothendieck 群**（群完备化）：由形式差 $[P] - [Q]$ 生成，模去关系 $[P] - [Q] = [P'] - [Q'] \iff \exists$ 有限生成投射模 $R$ 使得 $P \oplus Q' \oplus R \cong P' \oplus Q \oplus R$。

等价地，$K_0(R)$ 由生成元 $[P]$（$P$ 为有限生成投射 $R$-模）和关系 $[P \oplus Q] = [P] + [Q]$ 生成的 Abel 群。

**例 196.1**（域和除环的 $K_0$）：若 $R$ 是域（或除环），则有限生成投射模等价于有限维向量空间，分类由维数给出。因此 $K_0(R) \cong \mathbb{Z}$，由 $[R]$ 生成。

**例 196.2**（Dedekind 整环的 $K_0$）：若 $R$ 为 Dedekind 整环（如代数整数环），则
$$K_0(R) \cong \mathbb{Z} \oplus \operatorname{Cl}(R)$$
其中 $\operatorname{Cl}(R)$ 是 $R$ 的理想类群。$\mathbb{Z}$ 分量来自秩（rank），$\operatorname{Cl}(R)$ 分量反映了非自由投射模（即非主理想）的信息。这是 $K_0$ 与数论联系的第一个实例。

### 196.2 $K_0$ 的基本性质

**命题 196.1**（$K_0$ 的函子性）：$R \mapsto K_0(R)$ 是从含幺环范畴到 Abel 群范畴的协变函子（对任意环同态 $f: R \to S$，标量限制 $S \otimes_R -$ 诱导 $f_*: K_0(R) \to K_0(S)$）。

**命题 196.2**（Morita 不变性）：若环 $R$ 和 $S$ 是 Morita 等价的（即它们的模范畴等价），则 $K_0(R) \cong K_0(S)$。特别地，$K_0(R) \cong K_0(M_n(R))$。

**命题 196.3**（幂等元描述）：$K_0(R)$ 也可等价地定义为 $M_\infty(R) = \bigcup_{n=1}^\infty M_n(R)$ 中幂等元的等价类在直和下的 Grothendieck 群。投射模 $P$ 可表为 $P \cong e R^n$（$e \in M_n(R)$ 为幂等元），因此 $K_0(R)$ 的每个元素可写为 $[e] - [f]$（$e, f$ 为幂等矩阵）。

### 196.3 拓扑空间的 $K^0$

**定义 196.2**（拓扑 $K^0$）：紧 Hausdorff 空间 $X$ 上复向量丛的同构类在直和下构成交换么半群。其 Grothendieck 群记为 $K^0(X)$。这就是 **拓扑 K 理论** 的起点（Atiyah-Hirzebruch, 1959）。

**定理 196.1**（Swan 定理）：$X$ 紧 Hausdorff 时，$X$ 上复向量丛的范畴等价于 $C(X)$ 上有限生成投射模的范畴。因此 $K_0(C(X)) \cong K^0(X)$——代数 K 理论与拓扑 K 理论在此处交汇。

---

$K_1$ 由 Bass 和 Schanuel 在 1964 年引入，其定义源于一般线性群 $GL_n(R)$ 的白头化（Whitehead lemma）——可逆矩阵的"初等变换"生成整个换位子群。

### 197.1 初等矩阵与 Whitehead 引理

**定义 197.1**（初等矩阵）：对 $i \neq j$ 和 $r \in R$，**初等矩阵** $e_{ij}(r)$ 为单位矩阵加上第 $(i, j)$ 个非对角线位置上的 $r$。令 $E_n(R)$ 为所有 $n \times n$ 初等矩阵 $e_{ij}(r)$ 生成的 $GL_n(R)$ 的子群。

**引理 197.1**（初等矩阵的换位关系）：
$$[e_{ij}(r), e_{jk}(s)] = e_{ik}(rs) \quad (i \neq k)$$
$$[e_{ij}(r), e_{k\ell}(s)] = I_n \quad (j \neq k, i \neq \ell)$$

**定理 197.1**（Whitehead 引理）：对任意 $n \geq 3$，
$$E_n(R) = [GL_n(R), GL_n(R)] = [E_n(R), E_n(R)]$$
即初等子群同时是一般线性群和自身的换位子群。

### 197.2 $K_1$ 的定义与基本性质

**定义 197.2**（环的 $K_1$）：令 $GL(R) = \bigcup_{n=1}^\infty GL_n(R)$（通过标准嵌入 $A \mapsto \begin{pmatrix} A & 0 \\ 0 & 1 \end{pmatrix}$ 取正向极限）。令 $E(R) = \bigcup_{n=1}^\infty E_n(R)$。定义
$$K_1(R) = GL(R) / E(R) = GL(R)^{\text{ab}}$$
即一般线性群的 **Abel 化**（$E(R) = [GL(R), GL(R)]$ 为换位子群）。

**例 197.1**（域的 $K_1$）：对域 $F$，由 Dieudonne 行列式，$K_1(F) \cong F^\times$。特别地，$K_1(\mathbb{R}) \cong \mathbb{R}^\times$，$K_1(\mathbb{C}) \cong \mathbb{C}^\times$。

**例 197.2**（整数的 $K_1$）：$K_1(\mathbb{Z}) \cong \{\pm 1\} \cong \mathbb{Z}/2\mathbb{Z}$。

**命题 197.1**（行列式映射）：对交换环 $R$，存在行列式诱导的满同态 $\det: K_1(R) \to R^\times$，其核记为 $SK_1(R)$。一般地，$K_1(R) \cong R^\times \oplus SK_1(R)$ 不一定成立，但存在正合列 $1 \to SK_1(R) \to K_1(R) \to R^\times \to 1$，该正合列在环 $R$ 为局部环时分裂。

**命题 197.2**（Morita 不变性）：$K_1$ 也是 Morita 不变的：$K_1(R) \cong K_1(M_n(R))$。

### 197.3 拓扑空间的 $K^1$

**定义 197.3**（拓扑 $K^1$）：$K^1(X)$ 定义为 $X$ 上的 $GL_n(\mathbb{C})$-值连续函数的同伦类的正向极限，等价于悬挂的约化 $K^0$：$K^1(X) = \tilde{K}^0(\Sigma X)$。

---

$K_2$ 由 Milnor 在 1970 年引入，主要动机是在 Mennicke 符号和 Moore 关于泛中心扩张的理论工作基础上，完成低阶 K 群的正合列。

### 198.1 Steinberg 群与泛中心扩张

**定义 198.1**（Steinberg 群）：设 $R$ 为含幺环（$n \geq 3$）。**Steinberg 群** $\operatorname{St}_n(R)$ 由生成元 $x_{ij}(r)$（$1 \leq i \neq j \leq n, r \in R$）定义，满足 Steinberg 关系：
1. $x_{ij}(r) x_{ij}(s) = x_{ij}(r + s)$
2. $[x_{ij}(r), x_{jk}(s)] = x_{ik}(rs)$（$i \neq k$）
3. $[x_{ij}(r), x_{k\ell}(s)] = 1$（$j \neq k, i \neq \ell$）

存在自然的满同态 $\phi_n: \operatorname{St}_n(R) \twoheadrightarrow E_n(R)$，将 $x_{ij}(r)$ 映为 $e_{ij}(r)$。其核是 $K_2(R)$ 与 $E_n(R)$ 的泛中心扩张之间关系的关键。

**定理 198.1**（Steinberg 群的泛中心扩张，Steinberg 1962）：对 $n \geq 3$，$\operatorname{St}_n(R)$ 是 $E_n(R)$ 的 **泛中心扩张**——$\ker(\phi_n)$ 包含在 $\operatorname{St}_n(R)$ 的中心中，且任何 $E_n(R)$ 的中心扩张都通过 $\operatorname{St}_n(R)$ 分解。

### 198.2 $K_2$ 的定义

**定义 198.2**（环的 $K_2$）：对 $n \geq 3$，定义
$$K_2(R) = \ker(\operatorname{St}_n(R) \to E_n(R))$$
该定义与 $n \geq 3$ 的选取无关（通过稳定性定理）。$K_2(R)$ 是 Abel 群且包含在 $\operatorname{St}(R)$ 的中心中。

**定理 198.2**（Bass 正合列）：$K_2$ 自然地出现在正合列中：
$$0 \to K_2(R) \to \operatorname{St}(R) \to E(R) \to 1$$
该正合列为泛中心扩张。

**例 198.1**（域上的 $K_2$——Matsumoto 定理, 1969）：对域 $F$，
$$K_2(F) \cong F^\times \otimes_{\mathbb{Z}} F^\times / \langle a \otimes (1-a) : a \in F \setminus \{0, 1\} \rangle$$
这恰好是 Milnor $K_2^M(F)$ 的定义——Milnor $K_2$ 与 Quillen $K_2$ 在域上一致。生成元 $\{a, b\}$（$a, b \in F^\times$）称为 **Steinberg 符号**，满足双乘性 $\{a b, c\} = \{a, c\}\{b, c\}$ 和 Steinberg 关系 $\{a, 1-a\} = 1$（$a \neq 0, 1$）。

**例 198.2**（有限域的 $K_2$—Quillen）：若 $\mathbb{F}_q$ 为 $q$ 元有限域，则 $K_2(\mathbb{F}_q) = 0$。

### 198.3 Milnor K 理论简介

**定义 198.3**（Milnor $K$ 群）：域 $F$ 的 **Milnor $K$ 群** $K_n^M(F)$ 是分次环 $K_*^M(F)$ 的 $n$ 次部分，定义为
$$K_n^M(F) = (F^\times)^{\otimes_{\mathbb{Z}} n} / \langle a_1 \otimes \cdots \otimes a_n : a_i + a_{i+1} = 1 \text{ 对某 } i \rangle$$

关键性质：
- $K_0^M(F) = \mathbb{Z}$，$K_1^M(F) = F^\times$
- $K_2^M(F)$ 即上述 Matsumoto 定理的表述
- 存在符号映射 $\{a_1, \ldots, a_n\} \in K_n^M(F)$，满足多重线性和 Steinberg 关系

**定理 198.3**（Milnor 猜想 / Voevodsky 定理）：对特征不为 2 的域 $F$，
$$K_n^M(F) / 2 \cong H^n_{\text{Gal}}(F, \mu_2^{\otimes n})$$
这是 Bloch-Kato 猜想的 $\ell = 2$ 情形，由 Voevodsky 于 1996 年证明。

---

---

## 第199章：Milnor $K$ 理论与 Bloch 群
Milnor K 理论由 Milnor 在 1970 年引入，专注于域上的 K 理论，并与二次型、Galois 上同调和 Bloch 群有深刻联系。

### 199.1 Milnor $K$ 群

**定义 199.1**（Milnor $K$ 理论，域）：域 $F$ 的 **Milnor $K$ 群** $K_n^M(F)$ 是分次环 $K_*^M(F)$ 的 $n$ 次部分，由

$$K_*^M(F) = T(F^\times) / \langle a \otimes (1-a) : a \in F \setminus \{0, 1\} \rangle$$

定义，其中 $T(F^\times)$ 是乘法群 $F^\times$ 的张量代数。$\{a_1, \ldots, a_n\}$ 记 $a_1 \otimes \cdots \otimes a_n$ 在 $K_n^M(F)$ 中的像（Milnor 符号）。

**命题 199.1**（Milnor $K$ 群的低阶）：
- $K_0^M(F) = \mathbb{Z}$
- $K_1^M(F) = F^\times$
- $K_2^M(F)$ 与 Quillen $K_2(F)$ 一致（Matsumoto 定理）

**定理 199.1**（Milnor $K$ 理论与 Galois 上同调，Bloch-Kato 猜想 / Voevodsky 定理 2011）：对域 $F$ 和素数 $\ell \neq \operatorname{char}(F)$，存在自然同构

$$K_n^M(F) / \ell \cong H^n_{\text{Gal}}(F, \mu_\ell^{\otimes n})$$

（Galois 上同调与 Milnor $K$ 理论的联系）。这是 Milnor 猜想（$\ell = 2$）和 Bloch-Kato 猜想（一般 $\ell$）的融合，由 Voevodsky 证明（2011 年 Fields 奖）。

### 199.2 Bloch 群与稀释子

**定义 199.2**（Bloch 群）：域 $F$ 的 **Bloch 群** $\mathcal{B}(F)$ 是由 $[x]$（$x \in F \setminus \{0, 1\}$）生成的 Abel 群，模去关系

$$[x] - [y] + \left[\frac{y}{x}\right] - \left[\frac{1 - x^{-1}}{1 - y^{-1}}\right] + \left[\frac{1 - x}{1 - y}\right] = 0$$

（五项关系，five-term relation）。

**定理 199.2**（Bloch-Suslin 定理，1986）：对无限域 $F$，$K_3(F)_{\text{ind}} \cong \mathcal{B}(F)$（$K_3$ 的不分解部分）。Bloch 群是 $K_3$ 的精确代数描述。

**定义 199.3**（稀释子，Dilogarithm）：**Bloch-Wigner 稀释子** $D: \mathbb{C} \setminus \{0, 1\} \to \mathbb{R}$ 定义为

$$D(z) = \operatorname{Im}(\operatorname{Li}_2(z)) + \log|z| \cdot \arg(1 - z)$$

$D(z)$ 是单值的且在 $\mathbb{C}P^1$ 上连续延拓。$D(z)$ 满足五项关系，因此诱导了 $\mathcal{B}(\mathbb{C}) \to \mathbb{R}$ 的同态。

**定理 199.3**（Bloch 群与双对数恒等式）：Bloch 群的结构由稀释子（dilogarithm）和经典的双对数恒等式（Euler, Abel, Kummer）控制。$\mathcal{B}(\mathbb{C})$ 的秩为不可数无限。

### 199.3 调节子映射

**定义 199.4**（Borel 调节子）：Borel 定义了从 $K_{2n-1}(\mathbb{C})$ 到 $\mathbb{R}$ 的调节子映射，其像与 $\zeta(n)$ 相关。更一般地，对数域 $F$，

$$K_{2n-1}(\mathcal{O}_F) \otimes \mathbb{Q} \cong \mathbb{Q}^{d_n}$$

其中 $d_n = \dim_{\mathbb{Q}} H^1_{\text{mot}}(F, \mathbb{Q}(n))$。

**定理 199.4**（Beilinson 猜想，1984）：特殊 $L$ 值 $L^*(M, n)$ 与母题 $M$ 的调节子映射的像（在 $K$ 理论中）有联系。这是代数 $K$ 理论与数论 $L$ 函数之间最深刻的猜想。

---

---

## 第200章：代数 $K$ 理论与母题
母题（motives）是 Grothendieck 在 1960 年代提出的概念，旨在统一代数簇的所有上同调理论。Voevodsky 建立了母题上同调与代数 $K$ 理论的联系。

### 200.1 母题范畴

**定义 200.1**（母题，Grothendieck）：**母题**（motive）是代数簇的"普遍上同调"对象。对光滑射影代数簇 $X$，其母题 $h(X)$ 是 Abel 范畴 $\mathcal{M}(k)$（母题范畴）中的对象，满足对所有 Weil 上同调理论 $H^*$ 存在实现函子 $r_H: \mathcal{M}(k) \to \text{Vec}$ 使得 $r_H(h(X)) = H^*(X)$。

**定义 200.2**（Chow 母题）：**Chow 母题**范畴 $\mathcal{M}_{\text{rat}}(k)$ 由光滑射影代数簇的对应（correspondences）构造。对象是 $(X, p, n)$（$X$ 是簇，$p$ 是幂等对应，$n$ 是 Tate 扭转）。其中：
- **幂等对应** $p \in \operatorname{CH}^{\dim X}(X \times X)_{\mathbb{Q}}$ 满足 $p \circ p = p$（对应合成的意义下），作用相当于在 $X$ 的上同调中取出某个直和分量——形式上 $p$ 将母题 $h(X)$ 投影到其"子母题"。
- **Tate 扭转** $n \in \mathbb{Z}$：对象 $(X, p, n)$ 的"母题上同调"相对于 $(X, p, 0)$ 有一个维数位移。Tate 母题 $\mathbb{Q}(n)$ 是 $\operatorname{Spec}(k)$ 的母题经过 $n$ 次 Tate 扭转，其 Betti 实现给出 $(2\pi i)^n \mathbb{Q}$，反映了母题范畴中的"维数权重"结构。Tate 扭转是定义母题范畴中 Hom 群的分次结构以及联系母题上同调与代数 $K$ 理论谱序列的关键成分。

**定理 200.1**（Jannsen 定理，1992）：Chow 母题范畴是半单 Abel 范畴当且仅当数值等价与有理等价一致（这是 Grothendieck 标准猜想之一）。

### 200.2 Voevodsky 的母题上同调

**定义 200.3**（母题上同调，Voevodsky 2000）：光滑代数簇 $X$ 的**母题上同调** $H^{p,q}_{\text{mot}}(X, \mathbb{Z})$ 定义为 $X$ 在母题稳定同伦范畴 $\mathcal{SH}(k)$ 中的母题 Eilenberg-MacLane 谱 $H\mathbb{Z}$ 的上同调。

**定理 200.2**（母题上同调与代数 $K$ 理论，Voevodsky 2003）：对光滑代数簇 $X$，

$$H^{p,q}_{\text{mot}}(X, \mathbb{Z}) \cong \operatorname{CH}^q(X, 2q-p)$$

（Bloch 高阶 Chow 群）。母题上同调给出了 Bloch 高阶 Chow 群的上同调解释。

**定理 200.3**（母题谱序列，Friedlander-Suslin-Voevodsky）：存在从母题上同调到代数 $K$ 理论的谱序列：

$$E_2^{p,q} = H^{p-q,-q}_{\text{mot}}(X, \mathbb{Z}) \Rightarrow K_{-p-q}(X)$$

这统一了代数 $K$ 理论和母题上同调。

### 200.3 Voevodsky 的 Fields 奖工作

**定理 200.4**（Milnor 猜想 / Voevodsky 定理，1996-2003）：对域 $k$（$\operatorname{char}(k) \neq 2$），Milnor $K$ 理论模 2 与 étale 上同调之间存在自然同构：

$$K_n^M(k) / 2 \cong H^n_{\text{ét}}(k, \mathbb{Z}/2\mathbb{Z})$$

**定理 200.5**（Bloch-Kato 猜想，已证明，Voevodsky-Rost 2011）：该猜想等价于定理 199.1（Bloch-Kato 猜想的 étale 上同调版本），两者表述不同但实质相同。详见第 199 章。

### 200.4 代数 $K$ 理论与 $L$ 函数

**定理 200.6**（Lichtenbaum 猜想，Beilinson 猜想）：对光滑射影代数簇 $X$ 在整数环 $\mathcal{O}_F$ 上的模型，$K$ 群的秩由 Hasse-Weil $L$ 函数在整点处的零点阶数给出：

$$\dim_{\mathbb{Q}} K_{2n-1}(X) \otimes \mathbb{Q} = \operatorname{ord}_{s=n} L(h^{2n-1}(X), s)$$

这推广了 Borel 关于数域 $K$ 群的结果。

---

---

## 第201章：$K$ 理论的其他方向与应用
代数 $K$ 理论在拓扑、几何、算子代数和物理学中有广泛的应用。

### 201.1 拓扑 $K$ 理论与指标定理

**定义 201.1**（拓扑 $K$ 理论，Atiyah-Hirzebruch 1959）：紧 Hausdorff 空间 $X$ 的拓扑 $K$ 理论 $K^0(X)$ 是 $X$ 上复向量丛的 Grothendieck 群。$K^{-n}(X) = \tilde{K}^0(S^n X)$（Bott 周期性：$K^{-n-2}(X) \cong K^{-n}(X)$）。

**定理 201.1**（Atiyah-Singer 指标定理，1963）：椭圆算子 $D$ 的解析指标等于拓扑指标：

$$\operatorname{Index}(D) = \int_M \operatorname{Ch}(\sigma(D)) \wedge \operatorname{Td}(M)$$

其中 $\operatorname{Ch}$ 是 Chern 特征标（$K$ 理论到上同调的映射），$\operatorname{Td}$ 是 Todd 类。

**定理 201.2**（Swan 定理，1962）：$C(X)$ 上有限生成投射模的范畴等价于 $X$ 上复向量丛的范畴。因此 $K_0(C(X)) \cong K^0(X)$（代数 $K$ 理论与拓扑 $K$ 理论的联系）。

### 201.2 C*-代数 $K$ 理论

**定义 201.2**（C*-代数 $K$ 理论）：C*-代数 $A$ 的 $K_0(A)$ 定义为 $A$ 中投影的 Murray-von Neumann 等价类的 Grothendieck 群。$K_1(A)$ 定义为 $A$ 中酉元的连通分支群。

**定理 201.3**（六项正合列，$K$ 理论的基本正合列）：对 C*-代数的短正合列 $0 \to J \to A \to A/J \to 0$，存在 $K$ 理论的六项正合列：

$$\begin{CD}
K_0(J) @>>> K_0(A) @>>> K_0(A/J) \\
@AAA @. @VVV \\
K_1(A/J) @<<< K_1(A) @<<< K_1(J)
\end{CD}$$

**定理 201.4**（Bott 周期性，C*-代数情形）：$K_0(SA) \cong K_1(A)$，$K_1(SA) \cong K_0(A)$（其中 $SA = C_0(\mathbb{R}) \otimes A$ 是悬挂）。这给出了 C*-代数 $K$ 理论的 2-周期性。

### 201.3 $K$ 理论在物理学中的应用

**定义 201.3**（拓扑绝缘体与 $K$ 理论）：拓扑绝缘体（topological insulator）的拓扑相由 $K$ 理论分类。时间反演对称的拓扑绝缘体由 $KR$ 理论（实 $K$ 理论带对合）分类。

**定理 201.5**（Kitaev 的周期表，2009）：自由费米子系统的拓扑相由 $K$ 理论的 Bott 周期间接分类（"十重分类"）。$K$ 理论是理解拓扑序和拓扑量子计算的数学基础。

**定义 201.4**（$K$ 理论与 D-膜）：弦论中 D-膜的荷由 $K$ 理论分类（而非整数上同调）。$K^0(X)$ 分类 IIB 理论中 D-膜的荷，$K^1(X)$ 分类 IIA 理论中 D-膜的荷。

### 201.4 Waldhausen $K$ 理论与代数 $K$ 理论空间的构造

**定义 201.5**（Waldhausen $K$ 理论，1985）：Waldhausen 将 Quillen 的 Q-构造推广到带有余纤维化（cofibration）和弱等价（weak equivalence）的范畴（Waldhausen 范畴）。Waldhausen $K$ 理论是代数 $K$ 理论、代数几何 $K$ 理论和等变稳定同伦论中最重要的统一框架。

**定理 201.6**（Waldhausen 的加性定理和纤维化定理）：Waldhausen $K$ 理论满足对 Waldhausen 范畴的分裂正合列和纤维化序列的加性行为，推广了 Quillen 的局部化定理。

---

---

## 第201章（续）：Quillen 的 + 构造与高阶 K-理论
D. Quillen (1973) 的 + 构造将 K-理论从 $K_0$ 和 $K_1$ 推广到所有 $n \geq 0$，是代数 K-理论成为独立学科的标志（Quillen 因此获 1978 年菲尔兹奖）。

**定义 201.1**（Quillen + 构造）：设 $X$ 为连通 CW 复形，$N \trianglelefteq \pi_1(X)$ 为完全子群。则存在典范映射 $f: X \to X_N^+$ 满足：（1）$\pi_1(f)$ 诱导 $\pi_1(X) / N$ 的同构；（2）对所有 $\mathbb{Z}[\pi_1(X)/N]$-模 $M$ 及所有 $n \geq 1$，$f$ 诱导同调同构 $H_n(X; f^* M) \cong H_n(X_N^+; M)$。对环 $R$，定义 $K_n(R) := \pi_n(B \operatorname{GL}(R)^+)$（$n \geq 1$）其中 $B \operatorname{GL}(R)$ 是无穷一般线性群 $\operatorname{GL}(R) = \varinjlim_n \operatorname{GL}_n(R)$ 的分类空间。

**定理 201.1**（Bass-Heller-Swan, Quillen）：$K_0(R)$（Grothendieck 群）、$K_1(R)$（$\operatorname{GL}(R) / [\operatorname{GL}(R), \operatorname{GL}(R)]$）与上述定义一致。$K_2(R)$（Milnor K-理论）与 $H_2(E(R); \mathbb{Z})$（初等矩阵群 $E(R)$ 的整系数二阶同调）一致。

**定理 201.2**（Quillen 的基本定理与 Adams 操作）：
（1）局部化定理：对环 $R$ 和乘性子集 $S$，有长正合序列 $K_{n+1}(R_S) \to K_n(\mathcal{H}) \to K_n(R) \to K_n(R_S) \to \cdots$，其中 $\mathcal{H}$ 是有限生成 $S$-挠 $R$-模范畴的完全子范畴。（2）**Adams 操作** $\psi^k: K_n(R) \to K_n(R)$ 由外幂构造诱导，满足 $\psi^k \circ \psi^\ell = \psi^{k\ell}$ 且 $\psi^p \equiv \text{Frob}^* \pmod{p}$（在特征 $p$ 上与 Frobenius 一致）。这些操作是 Lichtenbaum-Quillen 猜想（后发展为 Voevodsky-Rost 的 Bloch-Kato 猜想的证明）的核心代数工具。

---

*本卷建立了代数 $K$ 理论的完整框架：$K_0$（投射模的 Grothendieck 群）建立了将正合列转化为群关系的代数框架；$K_1$（一般线性群的 Abel 化）通过 Whitehead 引理揭示了初等矩阵与换位子的深层联系；$K_2$（Steinberg 群与泛中心扩张）通过 Matsumoto 定理将域上的 $K_2$ 与 Milnor 符号连接；Milnor $K$ 理论与 Bloch 群（符号、稀释子、调节子）将 $K$ 理论与数论 $L$ 函数连接；母题上同调（Voevodsky 的母题稳定同伦论、Bloch-Kato 猜想）是 21 世纪数学的里程碑；拓扑 $K$ 理论、C*-代数 $K$ 理论和物理学应用展示了 $K$ 理论的跨领域影响力。代数 $K$ 理论是当代数学中连接代数、拓扑、几何、数论和物理的统一语言。*


---

---

## 第190章（补充）
> 低维拓扑研究 3 维和 4 维流形的拓扑结构，是当代拓扑学中最活跃的前沿领域之一。纽结理论是 3 维拓扑的核心组成部分，通过代数和组合不变量（Jones 多项式、Khovanov 同调）来区分和分类纽结。Floer 同调为 3 维和 4 维流形提供了强大的不变量，而 Donaldson 理论和 Seiberg-Witten 理论揭示了 4 维流形独特的微分结构现象。本卷在拓扑学（V10）、代数拓扑（V14）和微分几何（V11）的基础上，系统介绍低维拓扑的核心理论。

---

---

## 第217章：三维流形基础
3 维流形是低维拓扑的核心研究对象。与高维不同，3 维流形具有丰富的几何结构（Thurston 的几何化纲领）和组合结构（Heegaard 分解、Dehn 手术）。

### 217.1 三维流形的基本构造

**定义 217.1**（Heegaard 分解）：亏格 $g$ 的 **Heegaard 分解**是一个闭 3 维流形 $M$ 的表示为 $M = H_g \cup_\varphi H_g$，其中 $H_g$ 是亏格 $g$ 的柄体（handlebody），$\varphi: \partial H_g \to \partial H_g$ 是边界曲面 $\Sigma_g$ 上的同胚。

**定理 217.1**（Heegaard 定理）：任何闭可定向 3 维流形都存在 Heegaard 分解。Heegaard 分解的亏格是 3 维流形的基本量。

**定义 217.2**（Dehn 手术）：设 $K \subset S^3$ 是纽结，$N(K)$ 是 $K$ 的管状邻域。沿 $K$ 的 **Dehn 手术**是将 $N(K)$ 挖去，再将实心环面 $S^1 \times D^2$ 沿 $\partial N(K)$ 的某条简单闭曲线粘回。所有闭可定向 3 维流形都可通过 $S^3$ 中某个链环的 Dehn 手术得到（Lickorish-Wallace 定理）。

**定理 217.2**（Lickorish-Wallace 定理，1960-1962）：任何闭可定向 3 维流形可通过 $S^3$ 中链环的 $\pm 1$ Dehn 手术得到。

### 217.2 三维流形的分解

**定理 217.3**（Kneser-Milnor 素分解定理）：每个紧致可定向 3 维流形可唯一分解为素流形的连通和（$M = M_1 \# M_2 \# \cdots \# M_n$），其中 $M_i$ 是闭单连通 3 维流形（同胚于 $S^3$）或不可约流形。

**定理 217.4**（JSJ 分解定理 / Jaco-Shalen-Johannson 1979）：每个不可约 3 维流形可沿本质环面（incompressible tori）唯一地分解为 Seifert 纤维流形和双曲流形。

**定义 217.3**（Seifert 纤维流形）：**Seifert 纤维流形**是局部平凡 $S^1$ 纤维的 3 维流形，允许有限条奇异纤维。其不变量是 $(g; b; (\alpha_1, \beta_1), \ldots, (\alpha_n, \beta_n))$（基曲面亏格、Euler 数和奇异纤维类型）。

**定义 217.4**（双曲 3 维流形）：**双曲 3 维流形**是容许完备双曲度量（截面曲率恒为 $-1$）的 3 维流形。由 Mostow 刚性定理，双曲 3 维流形上的双曲结构唯一（如果存在）。

**定理 217.5**（Mostow 刚性定理，1968）：若 $M$ 和 $N$ 是有限体积的完备双曲 3 维流形，且 $\pi_1(M) \cong \pi_1(N)$，则 $M$ 和 $N$ 等距。即双曲 3 维流形的拓扑完全决定了其双曲度量。

### 217.3 几何化纲领

**定理 217.6**（Thurston 几何化猜想 / Perelman 证明，1982/2003）：任何闭可定向 3 维流形可沿球面和环面唯一地分解为素流形，其中每个素流形恰好容许 8 种 Thurston 几何之一。

**定义 217.5**（Thurston 的 8 种几何）：$S^3$（球面几何），$\mathbb{E}^3$（欧氏几何），$\mathbb{H}^3$（双曲几何），$S^2 \times \mathbb{R}$，$\mathbb{H}^2 \times \mathbb{R}$，$\widetilde{\operatorname{SL}(2, \mathbb{R})}$（$\operatorname{SL}(2, \mathbb{R})$ 的泛覆盖），$\operatorname{Nil}$（幂零几何），$\operatorname{Sol}$（可解几何）。

**定理 217.7**（Poincaré 猜想 / Perelman 2003）：任何单连通闭 3 维流形同胚于 $S^3$。这是几何化猜想的直接推论。

**定理 217.8**（球面空间形式猜想 / 椭圆化猜想）：任何有限基本群的闭 3 维流形是球面空间形式（即 $S^3/\Gamma$，$\Gamma$ 是有限群自由作用在 $S^3$ 上）。由 Perelman 证明。

---

---

## 第218章：纽结理论基础
纽结理论是研究嵌入 $S^1 \hookrightarrow S^3$（纽结）和多个 $S^1$ 的嵌入（链环）的拓扑学分支。纽结理论的核心问题是区分纽结类型和发现纽结不变量。

### 218.1 纽结与链环

**定义 218.1**（纽结与链环）：**纽结**是 $S^1$ 到 $S^3$（或 $\mathbb{R}^3$）的光滑嵌入（或局部平坦嵌入）。**链环**是多个不相交的 $S^1$ 的嵌入。纽结 $K$ 的**补空间**是 $S^3 \setminus \nu(K)$（$\nu(K)$ 是 $K$ 的管状邻域）。

**定义 218.2**（纽结的等价 / 合痕）：两个纽结 $K_0$ 和 $K_1$ 是**合痕的**（或等价的），如果存在连续单参数族 $\{h_t\}_{t \in [0,1]}$ 的 $\mathbb{R}^3$ 上的同胚，使得 $h_0 = \operatorname{id}$ 且 $h_1(K_0) = K_1$。

**定理 218.1**（Reidemeister 定理，1927）：两个纽结图表示同一个纽结（模合痕）当且仅当它们可以通过有限次 **Reidemeister 运动**（I 型、II 型、III 型）相互转化。

**定义 218.3**（Reidemeister 运动）：
- **R1**：添加或消除一个扭结（twist）
- **R2**：对两条交叉的弧线，可滑动一根穿过另一根
- **R3**：三条弧线相交时，中间弧线可滑过交叉点

### 218.2 经典纽结不变量

**定义 218.4**（交叉数）：纽结 $K$ 的**交叉数** $c(K)$ 是 $K$ 的所有纽结图中交叉点数的最小值。交叉数是纽结不变量。

**定义 218.5**（三色性 / Fox 染色）：纽结图是**三色可染的**，如果每条弧可染以三种颜色之一，使得每个交叉点处三条弧要么同色要么全不同色，且至少使用两种颜色。三色可染性是纽结不变量。

**定义 218.6**（Alexander 多项式，1928）：纽结 $K$ 的 **Alexander 多项式** $\Delta_K(t) \in \mathbb{Z}[t, t^{-1}]$ 是 $K$ 的补空间无穷循环覆盖的一维同调的不变量。$\Delta_K(t)$ 是 $t \leftrightarrow t^{-1}$ 对称的，且 $\Delta_K(1) = \pm 1$。

**定理 218.2**（Alexander 多项式的构造）：从纽结的 Seifert 曲面 $S$ 的 Seifert 矩阵 $V$ 出发，$\Delta_K(t) = \det(t^{1/2} V - t^{-1/2} V^T)$（模去 $t^{\pm 1/2}$ 的乘法）。

*不变性证明概要*：Alexander 多项式 $\Delta_K(t)$ 是 $K$ 的补空间 $S^3 \setminus K$ 的无穷循环覆盖的 1 维同调的扭化 Alexander 模的生成多项式。证明其不变性分两步：（1）对任何给定的纽结图构造 Wirtinger 表示并计算 Fox 微积分，得到 Alexander 矩阵，其初等因子给出 $\Delta_K(t)$。Reidemeister 运动（R1-R3）下 Alexander 矩阵的初等因子不变，保证 $\Delta_K(t)$ 是合痕不变量。（2）等价地，通过 Seifert 曲面方法：不同 Seifert 曲面通过 S-等价性关联，Seifert 矩阵在 S-等价下作初等变换（子矩阵扩展或削减），而 $\det(t^{1/2}V - t^{-1/2}V^T)$ 在这些变换下保持不变（模去 $t^{\pm 1/2}$）。∎

**定义 218.7**（纽结群）：纽结 $K$ 的**纽结群** $\pi_K = \pi_1(S^3 \setminus K)$ 是 $K$ 的补空间的基本群。纽结群是强有力的纽结不变量。Wirtinger 表示：从纽结分叉点出发，每个弧段对应一个生成元，每个交叉点对应一个关系。

**定理 218.3**（Gordon-Luecke 定理，1989）：纽结由它的补空间决定（不依赖于嵌入方式）。即若 $S^3 \setminus K \cong S^3 \setminus K'$，则 $K \cong K'$。

### 218.3 Jones 多项式与量子不变量

**定义 218.8**（Jones 多项式，1984）：Vaughan Jones 定义的 **Jones 多项式** $V_K(t) \in \mathbb{Z}[t^{1/2}, t^{-1/2}]$ 由以下缆式（skein）关系唯一确定：

$$t^{-1} V_{L_+}(t) - t V_{L_-}(t) = (t^{1/2} - t^{-1/2}) V_{L_0}(t)$$

其中 $L_+$、$L_-$、$L_0$ 是仅在交叉点处不同的链环图，且 $V_{\text{平凡纽结}}(t) = 1$。

**定理 218.4**（Jones 多项式的性质）：
- $V_K(1) = (-2)^{\#K - 1}$（$\#K$ 是链环的分量数）
- $V_K(t)$ 是链环不变量（比 Alexander 多项式更强）
- Jones 多项式区分了手性（chirality）：存在 $V_K(t) \neq V_K(t^{-1})$ 的纽结
- 通过 von Neumann 代数（特别是 $\operatorname{II}_1$ 因子）和辫群表示得到

**定义 218.9**（HOMFLY-PT 多项式，1985）：Freyd-Yetter、Hoste-Lickorish-Millett 和 Przytycki-Traczyk 独立发现的二变量纽结多项式 $P_K(a, z)$，满足：

$$a P_{L_+}(a, z) - a^{-1} P_{L_-}(a, z) = z P_{L_0}(a, z)$$

且 $P_{\text{平凡纽结}}(a, z) = 1$。Jones 多项式是 $a = t^{-1}$、$z = t^{1/2} - t^{-1/2}$ 的特例，Alexander 多项式是 $a = 1$ 的特例。

**定义 218.10**（Kauffman 括号多项式）：Kauffman 括号 $\langle D \rangle$ 是未定向链环图 $D$ 的多项式不变量，满足：
- $\langle \bigcirc \rangle = 1$（平凡纽结）
- $\langle D \sqcup \bigcirc \rangle = (-A^2 - A^{-2}) \langle D \rangle$
- $\langle \text{正交叉} \rangle = A \langle \text{平行} \rangle + A^{-1} \langle \text{反平行} \rangle$

Jones 多项式通过 $V_K(t) = (-A^3)^{-w(D)} \langle D \rangle |_{A = t^{-1/4}}$ 得到（$w(D)$ 是拧数）。

### 218.4 Khovanov 同调

**定义 218.11**（Khovanov 同调，2000）：Mikhail Khovanov 构造了 **Khovanov 同调** $\operatorname{Kh}^{i,j}(K)$，它是 Jones 多项式的「范畴化」（categorification）。其分次 Euler 特征给出 Jones 多项式：

$$\sum_{i,j} (-1)^i q^j \dim \operatorname{Kh}^{i,j}(K) = (q + q^{-1}) V_K(q^2)$$

**定理 218.5**（Khovanov 同调的性质）：Khovanov 同调是比 Jones 多项式更强的纽结不变量。它区分了具有相同 Jones 多项式但不同 Khovanov 同调的纽结，且具有函子性质（跨越同痕诱导同构）。

---

---

## 第219章：量子拓扑不变量
量子拓扑不变量源自数学物理（Witten 的 Chern-Simons 理论）和量子群理论，将纽结不变量推广到 3 维流形不变量。

### 219.1 辫群与 Markov 定理

**定义 219.1**（辫群 / Artin 辫群）：$n$ 股辫的 **Artin 辫群** $B_n$ 由生成元 $\sigma_1, \ldots, \sigma_{n-1}$ 和关系定义：
- $\sigma_i \sigma_j = \sigma_j \sigma_i$（$|i - j| \geq 2$）
- $\sigma_i \sigma_{i+1} \sigma_i = \sigma_{i+1} \sigma_i \sigma_{i+1}$（辫关系）

**定理 219.1**（Alexander 定理，1923）：任何纽结/链环可表示为某个辫的闭包（braid closure）。

**定理 219.2**（Markov 定理，1936）：两个辫表示同一个链环当且仅当它们可通过 **Markov 运动**（共轭 $\sigma_i b \sigma_i^{-1}$ 和稳定化 $b \leftrightarrow b \sigma_n^{\pm 1} \in B_{n+1}$）相互转化。

**定义 219.2**（辫群表示与纽结不变量）：寻找 $B_n$ 的一族表示 $\{\rho_n: B_n \to \operatorname{GL}(V_n)\}$ 满足 Markov 迹条件，从而构造链环不变量。Jones 多项式由此构造。

### 219.2 量子群与 R-矩阵

**定义 219.3**（量子群 / 量子包络代数）：**量子群** $U_q(\mathfrak{g})$ 是半单李代数 $\mathfrak{g}$ 的泛包络代数的 $q$-形变（Drinfeld-Jimbo，1985）。它是 Hopf 代数，由 Chevalley 生成元 $E_i, F_i, K_i^{\pm 1}$ 和 $q$-Serre 关系定义。

**定义 219.4**（R-矩阵 / 泛 R-矩阵）：$U_q(\mathfrak{g})$ 的 **泛 R-矩阵** $\mathcal{R} \in U_q(\mathfrak{g}) \hat{\otimes} U_q(\mathfrak{g})$ 满足：
- $\mathcal{R} \Delta(x) = \Delta^{\operatorname{op}}(x) \mathcal{R}$（对所有 $x \in U_q(\mathfrak{g})$）
- $(\Delta \otimes \operatorname{id})(\mathcal{R}) = \mathcal{R}_{13} \mathcal{R}_{23}$
- $(\operatorname{id} \otimes \Delta)(\mathcal{R}) = \mathcal{R}_{13} \mathcal{R}_{12}$

R-矩阵给出 Yang-Baxter 方程的解：$\mathcal{R}_{12} \mathcal{R}_{13} \mathcal{R}_{23} = \mathcal{R}_{23} \mathcal{R}_{13} \mathcal{R}_{12}$。

**定理 219.3**（量子群构造辫群表示）：对每个 $U_q(\mathfrak{g})$ 的有限维表示 $V$，$R = \tau \circ \mathcal{R}|_{V \otimes V}$（$\tau$ 是交换映射）满足辫关系。这给出辫群 $B_n$ 在 $V^{\otimes n}$ 上的表示，从而通过 Markov 迹得到链环不变量。

### 219.3 拓扑量子场论与 Witten 不变量

**定义 219.5**（拓扑量子场论 / TQFT，Atiyah 1988）：**拓扑量子场论**是一个函子 $Z: \operatorname{Bord}_n \to \operatorname{Vect}$，将 $n$ 维流形范畴映射到向量空间范畴。具体地：
- 每个闭 $(n-1)$ 维流形 $\Sigma$ 对应向量空间 $Z(\Sigma)$
- 每个 $n$ 维配边（cobordism）$M: \Sigma_0 \to \Sigma_1$ 对应线性映射 $Z(M): Z(\Sigma_0) \to Z(\Sigma_1)$
- 满足粘合公理：$Z(M_1 \cup_\Sigma M_2) = Z(M_2) \circ Z(M_1)$

**定义 219.6**（Witten-Chern-Simons 理论，1989）：Edward Witten 在 Chern-Simons 规范理论（作用量 $S_{CS}(A) = \frac{k}{4\pi} \int_M \operatorname{Tr}(A \wedge dA + \frac{2}{3} A \wedge A \wedge A)$）中，路径积分给出 3 维流形 $M$ 的不变量（Witten 不变量）：

$$Z_k(M) = \int \mathcal{D}A \, e^{i k S_{CS}(A)}$$

其中积分沿 $M$ 上的所有联络。Witten 不变量推广了 Jones 多项式。

**定理 219.4**（Reshetikhin-Turaev 不变量，1991）：Reshetikhin 和 Turaev 用量子群严格构造了 Witten 不变量（RT 不变量），通过 Kirby 演算和量子 $6j$-符号。

### 219.4 范畴化与同调不变量

**定义 219.7**（Khovanov 同调 / 范畴化原理）：**范畴化**（categorification）是将数值或多项式不变量提升为同调理论的过程。Khovanov 同调将 Jones 多项式范畴化，**Ozsváth-Szabó 同调**（Knot Floer homology）将 Alexander 多项式范畴化。

**定义 219.8**（Knot Floer 同调 / $\widehat{\operatorname{HFK}}$）：对纽结 $K \subset S^3$，**Knot Floer 同调** $\widehat{\operatorname{HFK}}(K)$ 是双分次（Alexander 分次和 Maslov 分次）的有限维向量空间，满足：

$$\sum_{i,j} (-1)^i t^j \dim \widehat{\operatorname{HFK}}_j(K, i) = \Delta_K(t)$$

---

---

## 第220章：Floer 同调
Floer 同调是 3 维和 4 维流形的无穷维 Morse 同调理论，由 Andreas Floer 在 1980 年代创立。它为 3 维流形提供了强有力的不变量，并为 4 维流形的光滑结构分类提供了核心工具。

### 220.1 Morse 同调与 Floer 同调的基本思想

**定义 220.1**（Floer 同调的基本构造）：Floer 同调 $HF(M)$ 是无穷维空间上的 Morse 同调。构造步骤：
1. 定义无穷维流形 $\mathcal{C}$（联络空间 / 映射空间）
2. 定义 Morse 函数 $\mathcal{F}: \mathcal{C} \to \mathbb{R}$（Chern-Simons 泛函 / 辛作用泛函）
3. 链复形由 $\mathcal{F}$ 的临界点生成
4. 边界算子计算梯度流线（连接临界点的 PDE 解）的计数

**定义 220.2**（Floer 同调的数学要求）：需要证明：
- 横向性：梯度流线的模空间是光滑流形（通过加微扰）
- 紧致性：模空间可紧化（通过 bubbling 分析和 Uhlenbeck 紧致性）
- 粘合：边界算子满足 $\partial^2 = 0$（模空间边界对应断裂轨道）

### 220.2 Instanton Floer 同调

**定义 220.3**（Instanton Floer 同调，Floer 1988）：设 $Y$ 是闭 3 维流形（整数同调球）。$\mathcal{C}$ 是 $Y$ 上 $\operatorname{SU}(2)$ 联络的规范等价类空间。Chern-Simons 泛函为

$$\operatorname{CS}(A) = \frac{1}{8\pi^2} \int_Y \operatorname{Tr}(A \wedge dA + \frac{2}{3} A \wedge A \wedge A)$$

**Instanton Floer 同调** $I_*(Y)$ 由 $\operatorname{CS}$ 的临界点（平坦联络）生成，边界算子由反自对偶瞬子（ASD instanton）的连接数给出。

**定理 220.1**（Instanton Floer 同调的性质）：$I_*(Y)$ 是 $\mathbb{Z}/8\mathbb{Z}$ 分次的。对整数同调球 $Y$，$\chi(I_*(Y)) = |H_1(Y; \mathbb{Z})|$（Casson 不变量）。

### 220.3 Heegaard Floer 同调

**定义 220.4**（Heegaard Floer 同调，Ozsváth-Szabó 2001-2004）：**Heegaard Floer 同调** $\widehat{\operatorname{HF}}(Y)$ 由 $Y$ 的 Heegaard 分解 $(U, \Sigma_g, V)$ 构造。生成元是 $g$ 个点在 $\Sigma_g$ 上的有序组（$\operatorname{Sym}^g(\Sigma_g)$ 中的交点）。边界算子计算伪全纯圆盘的计数。

**定理 220.2**（Heegaard Floer 同调的优势）：$\widehat{\operatorname{HF}}(Y)$ 是有限维 $\mathbb{Z}/2\mathbb{Z}$ 分次的向量空间，满足：
- 计算方便（比 Instanton Floer 同调更易计算）
- $\chi(\widehat{\operatorname{HF}}(Y)) = \pm |H_1(Y; \mathbb{Z})|$（若 $b_1(Y) = 0$）
- 有以下更精细的版本：$\operatorname{HF}^+(Y)$、$\operatorname{HF}^-(Y)$、$\operatorname{HF}^\infty(Y)$

**定义 220.5**（Knot Floer 同调与 Heegaard Floer 的关系）：Knot Floer 同调 $\widehat{\operatorname{HFK}}(K)$ 是 Heegaard Floer 同调的纽结版本，通过标定 Heegaard 图中的纽结轨道得到。

**定理 220.3**（Heegaard Floer 同调检测属数，Ozsváth-Szabó 2004）：$\widehat{\operatorname{HF}}(Y)$ 检测 $Y$ 的 Thurston 半范数。特别地，纽结 $K$ 的亏格（genus）可由 Knot Floer 同调读取：

$$g(K) = \max\{i : \widehat{\operatorname{HFK}}(K, i) \neq 0\}$$

### 220.4 其他 Floer 同调理论

**定义 220.6**（Monopole Floer 同调 / Seiberg-Witten Floer 同调，Kronheimer-Mrowka 2007）：基于 Seiberg-Witten 方程（而非反自对偶方程）的 Floer 同调。与 Heegaard Floer 同调同构（由 Kutluhan-Lee-Taubes 和 Colin-Ghiggini-Honda 证明）。

**定义 220.7**（Lagrangian Floer 同调，Floer 1988）：辛流形 $(M, \omega)$ 中两个 Lagrangian 子流形 $L_0, L_1$ 的交点生成链复形，边界算子由伪全纯带的计数给出。是镜对称（mirror symmetry）和 Fukaya 范畴的核心工具。

**定义 220.8**（Sutured Floer 同调，Juhász 2006）：将 Heegaard Floer 同调推广到带缝合的 3 维流形（sutured manifolds）。应用于纽结补空间和接触几何。

---

---

## 第221章：四维流形
4 维流形是微分拓扑中最特殊的维数：在所有维数中，只有 4 维流形可能具有（无穷多个）不同的光滑结构（exotic $\mathbb{R}^4$ 等）。Donaldson 理论和 Seiberg-Witten 理论是区分 4 维流形光滑结构的核心工具。

### 221.1 四维流形的特殊性

**定理 221.1**（光滑结构的维数依赖）：
- 维数 $n \neq 4$：紧致拓扑流形只有有限个光滑结构（到 $n = 3$ 是唯一的，$n \geq 5$ 由 Kirby-Siebenmann 分类）
- 维数 $n = 4$：存在无穷多个不同的光滑结构（如 $\mathbb{R}^4$ 上有不可数无穷个不同的光滑结构）

**定义 221.1**（相交形式 / Intersection Form）：闭可定向光滑 4 维流形 $X$ 的**相交形式** $Q_X: H^2(X; \mathbb{Z}) \times H^2(X; \mathbb{Z}) \to \mathbb{Z}$ 定义为 $Q_X(\alpha, \beta) = \langle \alpha \cup \beta, [X] \rangle$。$Q_X$ 是对称双线性型。

**定理 221.2**（Freedman 定理，1982）：单连通闭拓扑 4 维流形由其相交形式 $Q_X$ 和 Kirby-Siebenmann 不变量 $\operatorname{ks}(X) \in \mathbb{Z}/2\mathbb{Z}$ 完全分类。任何幺模对称双线性型都可实现为某单连通拓扑 4 维流形的相交形式。

### 221.2 Donaldson 理论

**定理 221.3**（Donaldson 定理，1983）：设 $X$ 是闭光滑单连通 4 维流形。若 $X$ 的相交形式 $Q_X$ 是正定的，则 $Q_X$ 在 $\mathbb{Z}$ 上等价于对角形式 $\langle 1 \rangle \oplus \cdots \oplus \langle 1 \rangle$。即正定相交形式必须是标准的。

**推论 221.1**（exotic 4 维流形的存在）：Freedman 定理允许 $E_8$ 形式作为拓扑 4 维流形的相交形式，但由 Donaldson 定理，$E_8$ 形式不能实现为光滑 4 维流形的相交形式。这证明了存在拓扑等价但非微分同胚的 4 维流形。

**定义 221.2**（Donaldson 不变量）：Donaldson 通过反自对偶联络（ASD instanton）的模空间定义了 4 维流形 $X$ 的**Donaldson 多项式不变量** $D_X: \operatorname{Sym}_*(H_2(X; \mathbb{Z})) \to \mathbb{Q}$。这些不变量是光滑结构的不变量。

**定理 221.4**（Donaldson 不变量对光滑结构的敏感性）：存在同胚但不微分同胚的 4 维流形，其 Donaldson 不变量不同。Donaldson 不变量证明了 $\mathbb{C}P^2 \# k \overline{\mathbb{C}P^2}$ 上存在无穷多个不同的光滑结构。

### 221.3 Seiberg-Witten 理论

**定义 221.3**（Seiberg-Witten 方程，1994）：设 $X$ 是闭光滑 4 维流形，带有 $\operatorname{Spin}^c$ 结构 $\mathfrak{s}$。**Seiberg-Witten 方程**为：

$$\begin{cases} D_A \Phi = 0 \\ F_A^+ = \Phi \otimes \Phi^* - \frac{1}{2} |\Phi|^2 \operatorname{id} \end{cases}$$

其中 $\Phi$ 是正旋量，$A$ 是 $\operatorname{Spin}^c$ 联络，$D_A$ 是 Dirac 算子，$F_A^+$ 是 $A$ 的曲率的自对偶部分。

**定义 221.4**（Seiberg-Witten 不变量）：Seiberg-Witten 方程的解空间 $M(\mathfrak{s})$ 是紧致光滑流形。**Seiberg-Witten 不变量** $\operatorname{SW}_X(\mathfrak{s})$ 是 $M(\mathfrak{s})$ 上 Euler 类的积分，是 $\operatorname{Spin}^c$ 结构 $\mathfrak{s}$ 的函数。

**定理 221.5**（Seiberg-Witten 不变量的性质）：
- 只有有限个 $\operatorname{Spin}^c$ 结构 $\mathfrak{s}$ 满足 $\operatorname{SW}_X(\mathfrak{s}) \neq 0$（基本类）
- 若 $X$ 容许正标量曲率度量，则 $\operatorname{SW}_X(\mathfrak{s}) = 0$（对所有 $\mathfrak{s}$）
- 对 Kähler 曲面，$\operatorname{SW}_X$ 与规范类（canonical class）直接相关

**定理 221.6**（Witten 猜想 / Taubes 定理）：Seiberg-Witten 不变量等价于 Donaldson 不变量（通过 Witten 的物理论证和后来的数学证明）。Seiberg-Witten 理论的计算比 Donaldson 理论简单得多。

### 221.4 Exotic 结构与阻塞理论

**定义 221.5**（Exotic $\mathbb{R}^4$）：存在与 $\mathbb{R}^4$（标准欧氏 4 维空间）同胚但不微分同胚的 4 维流形。事实上，存在不可数无穷个不同的 exotic $\mathbb{R}^4$（Taubes 1987，Gompf 1985）。

**定理 221.7**（$\frac{11}{8}$ 猜想 / Furuta 定理）：对闭光滑单连通 4 维流形 $X$ 满足 $b_2^+(X) > 0$，有 $b_2(X) \geq \frac{11}{8} |\sigma(X)|$（$\sigma$ 是符号差）。$\frac{11}{8}$ 猜想是最优下界，由 Furuta（2001）用等变 K 理论证明其弱形式。

**定义 221.6**（10/8 定理 / Furuta 不等式）：$b_2(X) \geq \frac{10}{8} |\sigma(X)| + 2$（Furuta 1996 的 $10/8$ 定理给出了部分证明，完整 $\frac{11}{8}$ 猜想仍未完全解决）。

---

---

## 第196章（补充）
几何群论（Geometric Group Theory）是 Gromov（1987）开创的现代数学分支——将有限生成群视为带字度量的几何对象，用拟等距不变量分类群。Princeton Companion 将其列为独立分支。它连接了代数、拓扑、几何和动力系统。

### Gromov双曲群

**定义**（Cayley图与字度量）：设 $G$ 是有限生成群，$S$ 是对称生成元集。**Cayley图** $\Gamma(G, S)$ 的顶点是群元素，$g$ 与 $gs$（$s \in S$）之间有边。**字度量** $d(g, h)$ 是连接 $g$ 和 $h$ 的最短路径长（字长 $|g^{-1}h|_S$）。Cayley图上的不同生成元集的字度量是拟等距的——这使得大量群的性质成为拟等距不变量。

**定义**（Gromov δ-双曲空间与双曲群）：度量空间 $(X, d)$ 的测地三角形 $\triangle$ 称为 **δ-slim**，如果每条边落在另外两条边的 δ-邻域内。$X$ 是 **δ-双曲空间**（Gromov 双曲空间），若所有测地三角形的 slim 参数有上确界 δ。**双曲群**是 Cayley 图为 Gromov 双曲空间的有限生成群。

**例**：有限群（平凡地）、自由群 $\mathbb{F}_n$（$n \geq 2$）、基本群 $\pi_1(S)$（$S$ 为亏格 $\geq 2$ 的紧曲面）、经典 Schottky 群均为此类。$\mathbb{Z}^n$（$n \geq 2$）不是双曲的（平面 Cayley 图的三角形不是 slim 的，Bass-Serre 理论的树形结构不成立）。

**定理**（Gromov双曲群的边界 / Gromov边界）：双曲群 $G$ 的 **Gromov 边界** $\partial G$ 是 $G$ 作用为收敛群的紧可度量空间。$\partial G$ 是 $G$ 的重要拟等距不变量。例：自由群 $\mathbb{F}_n$ 的边界是其 Cayley 树（$2n$-正则树）的 Cantor 边界；$\Gamma$-曲面群（亏格 ≥ 2）的边界是 $S^1$。

**定理**（拟等距刚性）：双曲群的拟等距（quasi-isometry）一定距离一个群同构（在有限距离和有限指数误差下）。特别地，两个双曲群拟等距当且仅当它们是可通约的（commensurable）——即存在有限指数子群互相同构。

### 拟等距与拟等距不变量

**定义**（拟等距 / $(K, C)$-拟等距）：映射 $f: X \to Y$（测地度量空间之间）是 $(K, C)$-**拟等距**，若对所有 $x_1, x_2 \in X$：
$$\frac{1}{K} d_X(x_1, x_2) - C \leq d_Y(f(x_1), f(x_2)) \leq K d_X(x_1, x_2) + C$$
且 $Y$ 落在 $f(X)$ 的 $C$-邻域内。拟等距是大尺度几何的"等价关系"——双曲平面 $\mathbb{H}^2$ 与 $4$-正则树拟等距。

**命题**（基本拟等距不变量）：
- 群的端（ends）数 $e(G) \in \{0, 1, 2, \infty\}$ 是拟等距不变量（Freudenthal-Hopf）
- 多项式增长次数是拟等距不变量（Gromov 1981）
- 双曲性（δ-双曲空间性质）是拟等距不变量
- 渐近维数（asymptotic dimension）$\operatorname{asdim}(G)$ 是拟等距不变量

**定理**（群的端与Stallings分类定理，1968-1971）：有限生成群 $G$ 的端数：
- $e(G) = 0$ 当且仅当 $G$ 有限
- $e(G) = 1$ 当且仅当 $G$ 有一端（如 $\mathbb{Z}^n$，$n \geq 2$；$\pi_1($亏格 \geq 2 曲面$)$）
- $e(G) = 2$ 当且仅当 $G$ 是实质上的 $\mathbb{Z}$（有有限指数无限循环子群）
- $e(G) = \infty$ 当且仅当 $G$ 可分解为非平凡自由积并合（amalgamated free product）或 HNN 扩张

**定理**（Gromov的增长定理，1981）：有限生成群的多项式增长等价于其实质上幂零（virtually nilpotent）。这是群论与渐进几何结合的里程碑成果。

### CAT(0)空间与群

**定义**（CAT(0)空间）：完备测地度量空间 $X$ 是 **CAT(0)**（非正曲率），若任意两点间存在唯一的测地线，且每个测地三角形比 Euclid 比较三角形更"薄"：对任意三点 $x, y, z$ 和比较三角形中的对应点 $\bar{x}, \bar{y}, \bar{z} \subset \mathbb{R}^2$，有 $d(x, y) \leq |\bar{x} - \bar{y}|$ 等。

**定义**（CAT(0)群 / Hadamard群）：可能一地作用在 CAT(0) 空间上的群。例子包括：自由群、$\mathbb{Z}^n$、曲面群、Coxeter 群、正曲率 Cartan 矩阵的 Kac-Moody 群。

**定理**（Cartan-Hadamard定理的度量版本）：CAT(0) 空间可缩——特别地，CAT(0) 群是有限型（即存在分类空间 $K(G, 1)$ 由有限 CW 复形实现）。

**定理**（Tits的刚性替代定理 / Tits alternative）：有限生成线性群要么实质上可解（virtually solvable），要么包含非 Abel 自由子群 $\mathbb{F}_2$。Gromov 双曲群版本：双曲群要么实质循环，要么包含 $\mathbb{F}_2$。

### Bass-Serre理论与群图

**定义**（群作用在树上的Bass-Serre理论，1977）：群 $G$ 作用在树 $T$ 上（无边反转）当且仅当 $G$ 可分解为图群（graph of groups）的基本群。这是研究群的代数结构的核心工具。

- **并合自由积**：$G = A *_C B$（$C$ 为 $A$ 和 $B$ 的公共子群）以单边图表示
- **HNN扩张**：$G = \langle H, t \mid t^{-1} C t = \phi(C) \rangle$（以稳定子 $C$ 和同构 $\phi: C \to H$ 定义）以单环图表示

**定理**（Kurosh子群定理）：自由积的子群仍是自由积。

**定义**（JSJ分解 / JSJ Decomposition，Jaco-Shalen-Johannson 1979）：3维流形的几何化分解可视为图群分解的特例——沿环面和 Klein 瓶的切割（扭元素对应 Seifert 纤维化片段，非扭对应双曲片段）。这被 Sela（1997）推广到任意有限出现群（tower argument）。

---

---

## 第197章（补充）
微分拓扑研究光滑流形上的整体性质——特别是光滑映射的横截性、流形上的Morse函数和光滑流形的配边分类。它是连接代数拓扑、微分几何和几何分析的桥梁。

---

### 横截性理论

横截性是微分拓扑最基本的概念之一：光滑映射"一般地"与子流形横截相交。它由Thom（1954）和Smale（1956）系统化。

**定义**（横截性）：设 $f: M \to N$ 是光滑映射，$Z \subset N$ 是光滑子流形。$f$ 称为**横截于** $Z$（记作 $f \pitchfork Z$），如果对任意 $x \in f^{-1}(Z)$，
$$T_{f(x)}N = df_x(T_xM) + T_{f(x)}Z$$
即 $f$ 的像与 $Z$ 的切空间张成整个 $T_{f(x)}N$。

**定理**（Thom横截性定理）：设 $M, N$ 是光滑流形，$Z \subset N$ 是闭子流形。则使 $f \pitchfork Z$ 的光滑映射 $f: M \to N$ 在 $C^\infty(M, N)$ 中构成稠密子集（在 Whitney $C^\infty$ 拓扑下）。若 $M$ 紧，它们是开稠密集。*注：这是微分拓扑中最重要的"一般性"定理——几乎所有光滑映射都横截于任何给定子流形。*

**推论**（弱横截性定理）：任何连续映射 $f: M \to N$ 可被光滑映射逼近，且该光滑映射横截于 $Z$。

**定理**（横截同伦定理）：设 $f_0, f_1: M \to N$ 横截于闭子流形 $Z$，且存在横截于 $Z$ 的同伦连接它们。则 $f_0^{-1}(Z)$ 与 $f_1^{-1}(Z)$ 是 $M$ 中的配边子流形（在光滑配边意义下）。

**定义**（管状邻域）：光滑流形 $M$ 中闭子流形 $Z$ 的**管状邻域**是向量丛 $\pi: E \to Z$ 的总空间的一个开邻域，微分同胚于 $Z$ 在 $M$ 中的邻域。存在性由Riemann度量的指数映射保证。

---

### Morse理论

Morse理论（Morse 1925-1934，Milnor 1963系统化）将光滑流形的拓扑与其上Morse函数的临界点联系起来——这是微分拓扑最有力的工具之一。

**定义**（Morse函数）：光滑函数 $f: M \to \mathbb{R}$ 的**临界点** $p$ 满足 $df_p = 0$（在局部坐标下所有一阶偏导数同时为零）。$p$ 称为**非退化**的，如果 Hessian 矩阵 $H_f(p) = \left(\frac{\partial^2 f}{\partial x_i \partial x_j}(p)\right)$ 非奇异（$\det H_f(p) \neq 0$）。$f$ 称为**Morse函数**，若其所有临界点均非退化。

**引理**（Morse引理）：设 $p$ 是 Morse 函数 $f$ 的非退化临界点。则存在 $p$ 附近的局部坐标系 $(x_1, \ldots, x_n)$，使得
$$f(x) = f(p) - x_1^2 - \cdots - x_k^2 + x_{k+1}^2 + \cdots + x_n^2$$
其中 $k$ 是 Hessian 的负特征值个数，称为临界点的**指标**（index）。$k$ 是与坐标选取无关的不变量。

**定理**（Morse不等式）：设 $M$ 是紧光滑流形，$f: M \to \mathbb{R}$ 是 Morse 函数。记 $C_k$ 为指标 $k$ 的临界点个数，$\beta_k = \operatorname{rank} H_k(M; \mathbb{R})$ 为第 $k$ 个 Betti 数。则：
1. **弱Morse不等式**：$C_k \geq \beta_k$（对所有 $k$）
2. **强Morse不等式**：$\sum_{j=0}^k (-1)^{k-j} C_j \geq \sum_{j=0}^k (-1)^{k-j} \beta_j$（对所有 $k$）
3. **Morse等式**：$\sum_{k=0}^n (-1)^k C_k = \sum_{k=0}^n (-1)^k \beta_k = \chi(M)$（Euler示性数）

*注：Morse不等式将分析量（临界点）与拓扑量（Betti数）联系起来，这是微分拓扑的核心思想。*

**定理**（Morse理论的胞腔分解）：紧流形 $M$ 上的 Morse 函数 $f$ 给出了 $M$ 的一个 CW 复形结构——每个指标 $k$ 的临界点对应一个 $k$-维胞腔。$M$ 同伦等价于一个每维胞腔数等于该维临界点数的 CW 复形。

**定理**（Reeb定理）：若紧 $n$ 维流形上存在恰有两个临界点的 Morse 函数，则该流形同胚于 $S^n$。

**定义**（Morse同调与Floer同调的关系）：Morse同调群的链复形由临界点生成，边界算子计数梯度流线（Morse-Smale条件）。这是Floer同调（无限维推广）的有限维原型。

---

### 配边理论

配边理论（cobordism theory）由 Thom（1954）创立，是代数拓扑和微分拓扑的交汇点，也是Thom获1958年Fields奖的工作。

**定义**（配边 / cobordism）：两个闭 $n$ 维光滑流形 $M_0, M_1$ 称为**配边**的，如果存在紧 $(n+1)$ 维光滑流形 $W$（**配边流形**），使得 $\partial W = M_0 \sqcup M_1$。配边是等价关系，等价类全体记为 $\Omega_n^{\mathrm{SO}}$（定向配边群）。

**定理**（Thom配边同构定理，1954）：定向配边群 $\Omega_n^{\mathrm{SO}}$ 同构于 Thom 谱的同伦群：
$$\Omega_n^{\mathrm{SO}} \cong \pi_{n+k}(\operatorname{MSO}(k)) \quad (k \gg 0)$$
其中 $\operatorname{MSO}(k)$ 是万有 $k$ 维定向向量丛的 Thom 空间。这是将配边问题化为同伦论计算的核心定理。

**定理**（Thom配边环的计算）：有理数域上，定向配边环 $\Omega_*^{\mathrm{SO}} \otimes \mathbb{Q}$ 由偶维复射影空间 $\mathbb{CP}^{2k}$ 的配边类多项式生成：
$$\Omega_*^{\mathrm{SO}} \otimes \mathbb{Q} \cong \mathbb{Q}[\mathbb{CP}^2, \mathbb{CP}^4, \mathbb{CP}^6, \ldots]$$
（每个生成元对应于一个维数 $4k$ 的生成元）。低维配边群：$\Omega_0^{\mathrm{SO}} \cong \mathbb{Z}$，$\Omega_1^{\mathrm{SO}} = \Omega_2^{\mathrm{SO}} = \Omega_3^{\mathrm{SO}} = 0$，$\Omega_4^{\mathrm{SO}} \cong \mathbb{Z}$（生成元 $[\mathbb{CP}^2]$）。

**定义**（Stiefel-Whitney数与Pontryagin数的配边不变性）：两个闭流形配边当且仅当它们的所有 Stiefel-Whitney 数和 Pontryagin 数分别相等。这些示性数是配边不变量。

**定义**（$h$-配边定理（Smale, 1961 年 Fields 奖））：设 $W$ 是紧光滑流形，$\partial W = M_0 \sqcup M_1$，且包含映射 $M_0 \hookrightarrow W$ 和 $M_1 \hookrightarrow W$ 都是同伦等价。若 $\dim W \geq 5$，则 $W$ 微分同胚于 $M_0 \times [0, 1]$，从而 $M_0$ 与 $M_1$ 微分同胚。

*意义*：$h$-配边定理是 Smale 证明 $n \geq 5$ 维 Poincaré 猜想的核心工具。它说明了高维（$\geq 5$）流形的拓扑分类可以由同伦论确定——这是高维拓扑与低维拓扑的根本区别。

**定理**（$s$-配边定理，Kervaire-Milnor 1963）：在 $h$-配边定理的条件下，若进一步指定了切丛的平凡化，可定义 Kervaire-Milnor 群 $\Theta_n$（$n$ 维同伦球面的微分同胚类）。$\Theta_n$ 的精细计算揭示了 $S^7$ 上存在 28 种不同的光滑结构（Milnor 奇异球面，1962 年获 Fields 奖）。

---

### 手术理论

手术理论（Surgery theory, Kervaire-Milnor 1963, Browder 1960s, Wall 1970s）是分类流形的系统代数拓扑框架。

**定义**（手术 / surgery）：在 $n$ 维流形 $M$ 上，一个 $k$-手术（$0 \leq k \leq n$）是指切除一个嵌入 $S^k \times D^{n-k}$，然后沿边界粘上 $D^{k+1} \times S^{n-k-1}$。手术改变流形的拓扑（特别是同伦型和同调群），保持边界不变。

**定义**（正规映射与手术障碍）：正规映射 $(f, b): M \to X$（$f$ 度数为1，$b$ 是切丛的丛同构）的手术障碍落在 $L$-群 $L_n(\pi_1(X))$（Wall的代数$L$-群，依赖于基本群）。当手术障碍为零时，$M$ 可通过手术变成同伦等价于 $X$。

**定理**（Browder-Novikov-Sullivan-Wall 手术正合序列 / 分类定理，1960s-1970s）：
$$\cdots \to L_{n+1}(\pi) \to \mathcal{S}(X) \to [X, G/O] \to L_n(\pi)$$
此正合序列联系了流形 $X$ 的手术结构集 $\mathcal{S}(X)$（同伦于 $X$ 的流形的微分同胚类）、正规不变量（映射至 $G/O$ 空间）和代数 $L$-理论。

*意义*：手术理论是分类给定同伦型的流形的各种光滑/PL/拓扑结构的基本工具。它是高维拓扑分类的完成框架。

---

*本卷在拓扑学（V10）、代数拓扑（V14）和微分几何（V11）的基础上，系统介绍了低维拓扑和纽结理论：3 维流形的分解与几何化、纽结理论的多项式与同调不变量（Alexander、Jones、HOMFLY-PT、Khovanov）、量子拓扑不变量（量子群与 TQFT）、Floer 同调系列（Instanton、Heegaard、Monopole）和 4 维流形理论（Donaldson 理论、Seiberg-Witten 理论、exotic 结构）。共 5 章。*


---

*本卷在已有内容基础上，以代数 $K$ 理论（K0/K1/K2 低阶导引、Milnor K 理论与 Bloch 群、母题上同调与 Bloch-Kato 猜想、拓扑与 C*-代数 K 理论）和低维拓扑与纽结理论（三维流形与几何化、纽结多项式与 Khovanov 同调、量子拓扑不变量、Floer 同调、四维流形）为补充单元，共 10 个附加章。*


*卷十四：代数拓扑终。*
