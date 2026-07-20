## 第85章：泛包络代数与PBW定理
泛包络代数将李代数嵌入结合代数，使得李代数的表示论转化为结合代数的模论。PBW（Poincaré-Birkhoff-Witt）定理是泛包络代数的基本结构定理。

### 123.1 泛包络代数的构造

**定义 123.1**（泛包络代数）：李代数 $\mathfrak{g}$ 的**泛包络代数** $U(\mathfrak{g})$ 是张量代数 $T(\mathfrak{g}) = \bigoplus_{k=0}^{\infty} \mathfrak{g}^{\otimes k}$ 模去双边理想 $J = \langle X \otimes Y - Y \otimes X - [X, Y] : X, Y \in \mathfrak{g} \rangle$ 的商代数：$U(\mathfrak{g}) = T(\mathfrak{g}) / J$。

**定理 123.1**（泛性质）：存在自然李代数同态 $i: \mathfrak{g} \to U(\mathfrak{g})$（将 $X$ 映为其在 $T(\mathfrak{g})$ 中的像），使得对任意结合代数 $A$ 和李代数同态 $f: \mathfrak{g} \to A$（$A$ 带有交换子 $[a,b] = ab - ba$ 作为李括号），存在唯一的结合代数同态 $\tilde{f}: U(\mathfrak{g}) \to A$ 使得 $f = \tilde{f} \circ i$。即 $\operatorname{Hom}_{\text{Lie}}(\mathfrak{g}, A) \cong \operatorname{Hom}_{\text{Assoc}}(U(\mathfrak{g}), A)$。

**证明**：张量代数 $T(\mathfrak{g})$ 的泛性质将线性映射 $\mathfrak{g} \to A$ 唯一地延拓为结合代数同态 $T(\mathfrak{g}) \to A$。对李代数同态 $f$，其延拓 $\hat{f}$ 满足 $\hat{f}(X \otimes Y - Y \otimes X - [X, Y]) = f(X)f(Y) - f(Y)f(X) - f([X, Y]) = 0$，故 $J \subseteq \ker \hat{f}$。因此 $\hat{f}$ 通过商诱导 $\tilde{f}: U(\mathfrak{g}) \to A$。唯一性由 $i(\mathfrak{g})$ 生成 $U(\mathfrak{g})$ 保证。$\blacksquare$

**推论 123.1**（表示论的翻译）：$\mathfrak{g}$ 的表示（即李代数同态 $\mathfrak{g} \to \mathfrak{gl}(V)$）与 $U(\mathfrak{g})$-模一一对应。这将对李代数表示的研究转化为对结合代数 $U(\mathfrak{g})$ 上模的研究。

**证明**：由定理 123.1 的泛性质，对李代数同态 $\rho: \mathfrak{g} \to \mathfrak{gl}(V)$，存在唯一的结合代数同态 $\tilde{\rho}: U(\mathfrak{g}) \to \operatorname{End}(V)$ 使 $\tilde{\rho} \circ i = \rho$，这赋予 $V$ 以 $U(\mathfrak{g})$-模结构。反之，给定 $U(\mathfrak{g})$-模 $V$（即结合代数同态 $\tilde{\rho}: U(\mathfrak{g}) \to \operatorname{End}(V)$），复合 $i$ 得 $\rho = \tilde{\rho} \circ i: \mathfrak{g} \to \mathfrak{gl}(V)$ 为李代数表示。这两个构造互逆，故一一对应。$\blacksquare$

### 123.2 PBW定理

**定理 123.2**（PBW定理，Poincaré 1900, Birkhoff 1937, Witt 1937）：设 $\{X_1, \ldots, X_n\}$ 是李代数 $\mathfrak{g}$ 的一组有序基。则单项式 $\{X_1^{k_1} X_2^{k_2} \cdots X_n^{k_n} : k_i \in \mathbb{Z}_{\geq 0}\}$（按顺序排列）构成 $U(\mathfrak{g})$ 的一组基。

**证明**：构造线性映射 $\varphi: S(\mathfrak{g}) \to U(\mathfrak{g})$（对称代数到泛包络代数）。在对称代数上用归纳法定义 $\varphi(x_1 \cdots x_m) = \frac{1}{m!} \sum_{\sigma \in S_m} X_{\sigma(1)} \cdots X_{\sigma(m)}$（$U(\mathfrak{g})$ 中的乘积）。验证 $\varphi$ 将 $S(\mathfrak{g})$ 的基（有序单项式）映为 $U(\mathfrak{g})$ 中的有序单项式，且该映射是线性同构——因为 $\varphi$ 将滤过 $S(\mathfrak{g}) \to \operatorname{gr} U(\mathfrak{g})$ 诱导为分次同构。关键在于验证 $\varphi(xy - yx) = [X, Y]$（在 $U(\mathfrak{g})$ 中），这由对称化算子的性质保证。$\blacksquare$

*意义*：PBW定理表明 $U(\mathfrak{g})$ 作为向量空间同构于对称代数 $S(\mathfrak{g})$（$\mathfrak{g}$ 上的多项式代数）——尽管作为代数结构完全不同（$U(\mathfrak{g})$ 是非交换的）。自然滤过 $\{U_k(\mathfrak{g})\}$（$U_k$ 由次数 $\leq k$ 的元素张成）的伴随分次代数 $\operatorname{gr} U(\mathfrak{g}) \cong S(\mathfrak{g})$。这意味着 $\dim U(\mathfrak{g})$ 是无限的（当 $\mathfrak{g} \neq \{0\}$），且 $U(\mathfrak{g})$ 是 Noether 环。

**定理 123.3**（Bernstein-Gelfand-Gelfand 范畴 $\mathcal{O}$ 定理，1976）：对半单李代数 $\mathfrak{g}$，BGG 范畴 $\mathcal{O}$（由所有有限生成的 $U(\mathfrak{g})$-模构成的范畴，其中 $\mathfrak{n}^+$ 局部幂零作用且 $\mathfrak{h}$ 半单作用）具有有限长、每个对象有有限 Jordan-Hölder 序列，且不可约对象由最高权分类。投射对象的存在性和 BGG 互反律（BGG reciprocity）是范畴 $\mathcal{O}$ 的核心结构定理。

**证明**：范畴 $\mathcal{O}$ 的定义条件确保每个对象 $M$ 具有权空间分解 $M = \bigoplus_{\mu \in \mathfrak{h}^*} M_\mu$。由 $\mathfrak{n}^+$ 的局部幂零性和 $\mathfrak{h}$ 的半单作用，每个非零对象 $M$ 中存在最高权向量 $v \in M_\lambda$（$\mathfrak{n}^+ \cdot v = 0$），从而存在 Verma 模的满射 $\Delta(\lambda) = U(\mathfrak{g}) \otimes_{U(\mathfrak{b})} \mathbb{C}_\lambda \twoheadrightarrow M$。$U(\mathfrak{g})$ 是 Noether 环（由 PBW 定理），故 $\mathcal{O}$ 中每个有限生成对象也是 Noether 的，因而具有有限长度。不可约对象 $L(\lambda)$ 由最高权 $\lambda \in \mathfrak{h}^*$ 唯一分类：$L(\lambda)$ 是 $\Delta(\lambda)$ 的唯一不可约商。投射覆盖 $P(\lambda) \to L(\lambda)$ 的存在性由 $U(\mathfrak{g})$ 上适当的完备化（或 $\mathcal{O}$ 具有足够多投射对象）保证。BGG 互反律 $(P(\lambda) : \Delta(\mu)) = [\Delta(\mu) : L(\lambda)]$ 由 Verma 模的合成因子重数与投射模的滤过之间的对偶性得出。$\blacksquare$

### 123.3 Casimir算子与中心

**定义 123.2**（Casimir算子）：设 $\mathfrak{g}$ 是半单李代数，$\{X_i\}$ 是 $\mathfrak{g}$ 关于 Killing 型的一组基，$\{X^i\}$ 是对偶基（$\kappa(X_i, X^j) = \delta_i^j$）。**Casimir算子** $C = \sum_i X_i X^i \in U(\mathfrak{g})$。$C$ 位于 $U(\mathfrak{g})$ 的中心 $\mathcal{Z}(\mathfrak{g})$ 中，且与表示 $\pi$ 的选取无关。

**命题 123.1**（Casimir算子的作用）：在最高权为 $\lambda$ 的不可约表示 $V_\lambda$ 上，Casimir 算子作用为标量 $c(\lambda) = \kappa(\lambda + \rho, \lambda + \rho) - \kappa(\rho, \rho)$，其中 $\rho$ 是正根之和的一半。

**证明**：在 $V_\lambda$ 中取最高权向量 $v_\lambda$。对 $C = \sum_i X_i X^i$ 计算 $C \cdot v_\lambda$。将基 $\{X_i\}$ 分解为 $\mathfrak{h}$ 的基 $\{H_i\}$、正根向量 $\{E_\alpha\}$ 和负根向量 $\{F_\alpha\}$。由于 $E_\alpha \cdot v_\lambda = 0$，$C$ 在 $v_\lambda$ 上的作用简化为 $\sum H_i H^i \cdot v_\lambda + \sum [E_\alpha, F_\alpha] \cdot v_\lambda = \kappa(\lambda, \lambda) v_\lambda + \sum \kappa(\alpha, \lambda) v_\lambda = (\kappa(\lambda, \lambda) + 2\kappa(\lambda, \rho)) v_\lambda = \kappa(\lambda+\rho, \lambda+\rho) v_\lambda - \kappa(\rho, \rho) v_\lambda$。由于 $C$ 在 $U(\mathfrak{g})$ 的中心中，它在不可约表示 $V_\lambda$ 上作用为标量，故在整个 $V_\lambda$ 上 $C = c(\lambda) \operatorname{id}$。$\blacksquare$

**定理 123.4**（Harish-Chandra 同构，1951）：中心 $\mathcal{Z}(\mathfrak{g}) \cong U(\mathfrak{h})^W$——即 $U(\mathfrak{g})$ 的中心同构于 Cartan 子代数的泛包络代数在 Weyl 群作用下的不变量。该同构由 Harish-Chandra 投影 $P: U(\mathfrak{g}) \to U(\mathfrak{h})$（滤过 $U(\mathfrak{g}) = U(\mathfrak{h}) \oplus (\mathfrak{n}^- U(\mathfrak{g}) + U(\mathfrak{g}) \mathfrak{n}^+)$ 的前项投影）的标准万有实现给出。这一定理将中心特征标与权 $\lambda$ 通过 $\chi_\lambda: \mathcal{Z}(\mathfrak{g}) \to \mathbb{C}$（即无穷小特征标）对应起来——两个不可约最高权模具有相同的无穷小特征标当且仅当它们的最高权相差 Weyl 群作用。

**证明**：由 PBW 定理的三角分解 $U(\mathfrak{g}) \cong U(\mathfrak{n}^-) \otimes U(\mathfrak{h}) \otimes U(\mathfrak{n}^+)$。定义 Harish-Chandra 投影 $P: U(\mathfrak{g}) \to U(\mathfrak{h})$ 为滤去含 $\mathfrak{n}^\pm$ 因子的项：对 $u \in U(\mathfrak{g})$，唯一地写 $u = u_{\mathfrak{h}} + \sum u_- \cdot u_+$（$u_- \in U(\mathfrak{n}^-)\mathfrak{n}^-$，$u_+ \in \mathfrak{n}^+ U(\mathfrak{n}^+)$），令 $P(u) = u_{\mathfrak{h}}$。限制到中心 $\mathcal{Z}(\mathfrak{g})$：对 $z \in \mathcal{Z}(\mathfrak{g})$ 和任意根向量 $e_\alpha \in \mathfrak{n}^+$，$[z, e_\alpha] = 0$。展开此等式并应用 $P$，得 $P(z)$ 在 Weyl 群单反射 $s_\alpha$ 下不变：$s_\alpha(P(z)) = P(z)$。由 Weyl 群由单反射生成，$P(z) \in U(\mathfrak{h})^W$。单射性：若 $P(z) = 0$ 且 $z \neq 0$，则 $z$ 可写为 $\mathfrak{n}^-$ 或 $\mathfrak{n}^+$ 元素的非零组合，但 $z$ 与 $\mathfrak{h}$ 交换迫使 $z$ 的权为零，与 $z \neq 0$ 矛盾。满射性：对每个 Weyl 不变量，可通过 Casimir 元素和更高次中心元的对称多项式构造原像。$\blacksquare$

---

---

---

---

---
---

## 第86章：Borel-Weil-Bott定理与几何实现
Borel-Weil-Bott 定理将紧李群的不可约表示的构造几何化：将表示实现为全纯线丛的截面空间的上同调。

### 124.1 旗流形与线丛

**定义 124.1**（旗流形）：复半单李群 $G_\mathbb{C}$ 的 **Borel 子群** $B$ 是极大可解连通子群。**旗流形**（广义旗流形）是齐性空间 $\mathcal{B} = G_\mathbb{C} / B$。它是紧 Kähler 流形，也是光滑射影代数簇。

旗流形 $\mathcal{B}$ 的几何结构极为丰富。其维数为 $|\Phi^+|$（正根的个数），它可被分解为 Schubert 胞腔 $X_w^\circ = BwB/B$（$w \in W$），每个胞腔同构于 $\mathbb{C}^{\ell(w)}$，给出 $\mathcal{B}$ 的胞腔分解。旗流形上的 Bruhat 序描述了这些胞腔的闭包 $X_w = \overline{X_w^\circ}$（Schubert 簇）之间的包含关系。在复半单李群 $G_\mathbb{C} = SL(n, \mathbb{C})$ 的情形，$\mathcal{B}$ 是 $\mathbb{C}^n$ 中完备旗的全体：
$$\mathcal{B} = \{0 = V_0 \subset V_1 \subset \cdots \subset V_n = \mathbb{C}^n : \dim V_i = i\}$$
它也是广义旗流形 $G_\mathbb{C} / P$（$P$ 为抛物子群）的原型。Borel 子群 $B$ 的选取对应于 Cartan 子代数 $\mathfrak{h}$ 和正根系 $\Phi^+$ 的选取，不同的选取给出同构的旗流形。

**定义 124.2**（与权关联的线丛）：对任意整权 $\lambda \in \mathfrak{h}^*$（满足 $\lambda$ 在每条余根上取整数值），可定义 $B$ 的 1 维表示 $\mathbb{C}_\lambda$（由 $\lambda$ 经指数映射诱导），进而构造 $\mathcal{B}$ 上的齐性线丛 $\mathcal{L}_\lambda = G_\mathbb{C} \times_B \mathbb{C}_\lambda$。$\mathcal{L}_\lambda$ 的全纯截面在 $\mathcal{B}$ 的 Dolbeault 上同调中给出了不可约表示。

线丛 $\mathcal{L}_\lambda$ 的构造体现了表示论与复几何的深刻统一。这里 $B$ 通过特征标 $\chi_\lambda: B \to \mathbb{C}^\times$ 作用于 $\mathbb{C}_\lambda$（$b \cdot z = \chi_\lambda(b) z$），而 $\mathcal{L}_\lambda$ 在 $G_\mathbb{C} \times_B \mathbb{C}_\lambda$ 中的等价类由 $(gb, z) \sim (g, \chi_\lambda(b) z)$ 定义。$\mathcal{L}_\lambda$ 的截面 $s: \mathcal{B} \to \mathcal{L}_\lambda$ 等价于函数 $f: G_\mathbb{C} \to \mathbb{C}$ 满足 $f(gb) = \chi_\lambda(b)^{-1} f(g)$。当 $\lambda$ 为支配整权时，$\mathcal{L}_\lambda$ 是丰沛线丛（ample line bundle），其上同调 $H^0(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda))$ 给出不可约有限维表示；当 $\lambda$ 为非支配整权时，上同调集中在更高次，由 Bott-Borel-Weil 定理（定理 124.2）精确描述。这一对应——将代数表示论完全转化为复几何中的层上同调计算——是几何表示论的起点。

### 124.2 Borel-Weil-Bott定理

**定理 124.1**（Borel-Weil 定理，1954-1957）：设 $\lambda$ 是支配整权。则不可约表示 $V_\lambda$（$G$ 的表示，经复化视为 $G_\mathbb{C}$ 的全纯表示）同构于 $\mathcal{B}$ 上 $\mathcal{L}_\lambda$ 的全局全纯截面空间：
$$H^0(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda)) \cong V_\lambda$$

**证明**：取 $G$ 的紧致实形 $G_c$。由 Peter-Weyl 定理，$G_c$ 在 $\mathcal{B} \cong G_c/T$ 上的正则表示分解为 $\bigoplus_\lambda V_\lambda \otimes V_\lambda^*$（$\lambda$ 遍历支配整权）。该分解对应 $G_c/T$ 上的函数空间。$V_\lambda$ 中的最高权向量 $v_\lambda$（满足 $B v_\lambda = \chi_\lambda v_\lambda$，$\chi_\lambda$ 为 $T$ 的特征标）给出 $G_c/T$ 上的截面的全局截面，该截面恰为 $\mathcal{L}_\lambda$ 的截面。利用 Casimir 算子 $\Omega = \sum_i X_i X^i$ 在 $H^0(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda))$ 上的作用：$\Omega$ 的特征值 $\langle \lambda, \lambda + 2\rho \rangle$ 唯一刻画了不可约表示 $V_\lambda$。由 $G_c$ 在 $\mathcal{B}$ 上的可迁性，$\mathcal{L}_\lambda$ 的截面空间构成 $G_c$ 的表示，且最高权为 $\lambda$。由最高权表示的唯一性，$H^0(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda)) \cong V_\lambda$。$\blacksquare$

**定理 124.2**（Bott-Borel-Weil 定理，Bott 1957）：对任意整权 $\lambda$（不必是支配的），$\mathcal{L}_\lambda$ 的上同调群 $H^q(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda))$ 要么为零（对所有 $q$），要么恰在一个 $q = \ell(w)$ 处非零，其中 $w \in W$ 是使 $w(\lambda + \rho) - \rho$ 为支配权的唯一 Weyl 群元素（$\ell(w)$ 为 $w$ 的长度）。非零时 $H^{\ell(w)}(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda)) \cong V_{w(\lambda + \rho) - \rho}$。当 $\lambda$ 已是支配权时，$w = e$，回到 Borel-Weil 定理。

**证明**（框架）：使用 Schubert 胞腔分层和 Demazure 算符。对每个单根 $\alpha$，考虑 $\mathbb{P}^1$-纤维化 $\pi_\alpha: G/B \to G/P_\alpha$。Leray 谱序列给出 $H^q(G/B, \mathcal{L}_\lambda)$ 与 $H^{q \pm 1}(G/P_\alpha, \cdots)$ 的关系。Demazure 算符 $D_\alpha(e^\mu) = (e^\mu - e^{s_\alpha(\mu)-\alpha})/(1-e^{-\alpha})$ 描述了上同调在穿越 $\alpha$-壁时的转移。通过对 $|\ell(w)|$ 归纳，将一般权 $\lambda$ 逐次约化到支配权情形（定理 124.1）。若 $\lambda+\rho$ 奇异，则上同调全消没。$\blacksquare$

**推论 124.1**（Euler-Poincaré特征）：形式特征标满足 $\chi_\lambda = \sum_{q} (-1)^q \operatorname{ch} H^q(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda))$。结合 Weyl 特征公式，Bott-Borel-Weil 定理给出了特征公式的几何证明。

### 124.3 几何表示论的视角

**定义 124.3**（等变上同调与特征类）：$T$-等变上同调 $H_T^*(\mathcal{B})$ 中的 Schubert 类 $[X_w]$（$w \in W$）构成 $H_T^*(\mathcal{B})$ 的基。Schubert 类的乘积公式（Chevalley-Monk 公式）与表示论中张量积分解有深刻联系。

**定理 124.3**（Borel 同构）：$H_T^*(\mathcal{B}) \cong \mathbb{C}[\mathfrak{h}] / (\mathbb{C}[\mathfrak{h}]^W_+)$，其中 $\mathbb{C}[\mathfrak{h}]^W_+$ 是 Weyl 群不变多项式中无常数项的理想。这给出了旗流形的等变上同调环的代数描述。

**证明**：$T$-等变上同调 $H_T^*(\mathcal{B})$ 是 $H_T^*(\mathrm{pt}) = \mathbb{C}[\mathfrak{h}]$ 上的代数。Borel 构造 $ET \times_T \mathcal{B}$ 给出纤维化 $\mathcal{B} \to ET \times_T \mathcal{B} \to BT$，其 Serre 谱序列在 $E_2$ 页为 $H^*(BT) \otimes H^*(\mathcal{B})$。由于 $H^*(\mathcal{B})$ 集中于偶数维（Schubert 类），谱序列退化，故 $H_T^*(\mathcal{B}) \cong \mathbb{C}[\mathfrak{h}] \otimes H^*(\mathcal{B})$ 作为 $\mathbb{C}[\mathfrak{h}]$-模。Weyl 群作用给出 $H_T^*(\mathcal{B})^W \cong \mathbb{C}[\mathfrak{h}]^W \otimes H^*(\mathcal{B})^W$，结合 $H^*(\mathcal{B}) \cong \mathbb{C}[\mathfrak{h}]/(\mathbb{C}[\mathfrak{h}]^W_+)$（Borel 描述的通常上同调）推得等变版本。$\blacksquare$

---

---

---

---

---