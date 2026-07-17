## 第85章：泛包络代数与PBW定理
泛包络代数将李代数嵌入结合代数，使得李代数的表示论转化为结合代数的模论。PBW（Poincaré-Birkhoff-Witt）定理是泛包络代数的基本结构定理。

### 123.1 泛包络代数的构造

**定义 123.1**（泛包络代数）：李代数 $\mathfrak{g}$ 的**泛包络代数** $U(\mathfrak{g})$ 是张量代数 $T(\mathfrak{g}) = \bigoplus_{k=0}^{\infty} \mathfrak{g}^{\otimes k}$ 模去双边理想 $J = \langle X \otimes Y - Y \otimes X - [X, Y] : X, Y \in \mathfrak{g} \rangle$ 的商代数：$U(\mathfrak{g}) = T(\mathfrak{g}) / J$。

**定理 123.1**（泛性质）：存在自然李代数同态 $i: \mathfrak{g} \to U(\mathfrak{g})$（将 $X$ 映为其在 $T(\mathfrak{g})$ 中的像），使得对任意结合代数 $A$ 和李代数同态 $f: \mathfrak{g} \to A$（$A$ 带有交换子 $[a,b] = ab - ba$ 作为李括号），存在唯一的结合代数同态 $\tilde{f}: U(\mathfrak{g}) \to A$ 使得 $f = \tilde{f} \circ i$。即 $\operatorname{Hom}_{\text{Lie}}(\mathfrak{g}, A) \cong \operatorname{Hom}_{\text{Assoc}}(U(\mathfrak{g}), A)$。

**推论 123.1**（表示论的翻译）：$\mathfrak{g}$ 的表示（即李代数同态 $\mathfrak{g} \to \mathfrak{gl}(V)$）与 $U(\mathfrak{g})$-模一一对应。这将对李代数表示的研究转化为对结合代数 $U(\mathfrak{g})$ 上模的研究。

### 123.2 PBW定理

**定理 123.2**（PBW定理，Poincaré 1900, Birkhoff 1937, Witt 1937）：设 $\{X_1, \ldots, X_n\}$ 是李代数 $\mathfrak{g}$ 的一组有序基。则单项式 $\{X_1^{k_1} X_2^{k_2} \cdots X_n^{k_n} : k_i \in \mathbb{Z}_{\geq 0}\}$（按顺序排列）构成 $U(\mathfrak{g})$ 的一组基。

*意义*：PBW定理表明 $U(\mathfrak{g})$ 作为向量空间同构于对称代数 $S(\mathfrak{g})$（$\mathfrak{g}$ 上的多项式代数）——尽管作为代数结构完全不同（$U(\mathfrak{g})$ 是非交换的）。自然滤过 $\{U_k(\mathfrak{g})\}$（$U_k$ 由次数 $\leq k$ 的元素张成）的伴随分次代数 $\operatorname{gr} U(\mathfrak{g}) \cong S(\mathfrak{g})$。这意味着 $\dim U(\mathfrak{g})$ 是无限的（当 $\mathfrak{g} \neq \{0\}$），且 $U(\mathfrak{g})$ 是 Noether 环。

**定理 123.3**（Bernstein-Gelfand-Gelfand 范畴 $\mathcal{O}$ 定理，1976）：对半单李代数 $\mathfrak{g}$，BGG 范畴 $\mathcal{O}$（由所有有限生成的 $U(\mathfrak{g})$-模构成的范畴，其中 $\mathfrak{n}^+$ 局部幂零作用且 $\mathfrak{h}$ 半单作用）具有有限长、每个对象有有限 Jordan-Hölder 序列，且不可约对象由最高权分类。投射对象的存在性和 BGG 互反律（BGG reciprocity）是范畴 $\mathcal{O}$ 的核心结构定理。

### 123.3 Casimir算子与中心

**定义 123.2**（Casimir算子）：设 $\mathfrak{g}$ 是半单李代数，$\{X_i\}$ 是 $\mathfrak{g}$ 关于 Killing 型的一组基，$\{X^i\}$ 是对偶基（$\kappa(X_i, X^j) = \delta_i^j$）。**Casimir算子** $C = \sum_i X_i X^i \in U(\mathfrak{g})$。$C$ 位于 $U(\mathfrak{g})$ 的中心 $\mathcal{Z}(\mathfrak{g})$ 中，且与表示 $\pi$ 的选取无关。

**命题 123.1**（Casimir算子的作用）：在最高权为 $\lambda$ 的不可约表示 $V_\lambda$ 上，Casimir 算子作用为标量 $c(\lambda) = \kappa(\lambda + \rho, \lambda + \rho) - \kappa(\rho, \rho)$，其中 $\rho$ 是正根之和的一半。

**定理 123.4**（Harish-Chandra 同构，1951）：中心 $\mathcal{Z}(\mathfrak{g}) \cong U(\mathfrak{h})^W$——即 $U(\mathfrak{g})$ 的中心同构于 Cartan 子代数的泛包络代数在 Weyl 群作用下的不变量。该同构由 Harish-Chandra 投影 $P: U(\mathfrak{g}) \to U(\mathfrak{h})$（滤过 $U(\mathfrak{g}) = U(\mathfrak{h}) \oplus (\mathfrak{n}^- U(\mathfrak{g}) + U(\mathfrak{g}) \mathfrak{n}^+)$ 的前项投影）的标准万有实现给出。这一定理将中心特征标与权 $\lambda$ 通过 $\chi_\lambda: \mathcal{Z}(\mathfrak{g}) \to \mathbb{C}$（即无穷小特征标）对应起来——两个不可约最高权模具有相同的无穷小特征标当且仅当它们的最高权相差 Weyl 群作用。

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

**例 124.1**：对 $G_\mathbb{C} = \operatorname{SL}(n, \mathbb{C})$，$B$ 可取为上三角矩阵群，$\mathcal{B}$ 是 $\mathbb{C}^n$ 中完备旗（complete flag）的集合：$\{V_0 \subset V_1 \subset \cdots \subset V_n = \mathbb{C}^n : \dim V_i = i\}$。

**定义 124.2**（与权关联的线丛）：对任意整权 $\lambda \in \mathfrak{h}^*$（满足 $\lambda$ 在每条余根上取整数值），可定义 $B$ 的 1 维表示 $\mathbb{C}_\lambda$（由 $\lambda$ 经指数映射诱导），进而构造 $\mathcal{B}$ 上的齐性线丛 $\mathcal{L}_\lambda = G_\mathbb{C} \times_B \mathbb{C}_\lambda$。$\mathcal{L}_\lambda$ 的全纯截面在 $\mathcal{B}$ 的 Dolbeault 上同调中给出了不可约表示。

### 124.2 Borel-Weil-Bott定理

**定理 124.1**（Borel-Weil 定理，1954-1957）：设 $\lambda$ 是支配整权。则不可约表示 $V_\lambda$（$G$ 的表示，经复化视为 $G_\mathbb{C}$ 的全纯表示）同构于 $\mathcal{B}$ 上 $\mathcal{L}_\lambda$ 的全局全纯截面空间：
$$H^0(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda)) \cong V_\lambda$$

*证明思路*：$G_c$ 紧致实形 $G$ 在 $\mathcal{B}$ 上可迁作用，$\mathcal{B} \cong G/T$（$T = G \cap B$ 是极大环面）。使用 Peter-Weyl 定理和最高权理论在层上同调中的实现——$H^0$ 的 Casimir 算子特征值分析给出最高权分类。

**定理 124.2**（Bott-Borel-Weil 定理，Bott 1957）：对任意整权 $\lambda$（不必是支配的），$\mathcal{L}_\lambda$ 的上同调群 $H^q(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda))$ 要么为零（对所有 $q$），要么恰在一个 $q = \ell(w)$ 处非零，其中 $w \in W$ 是使 $w(\lambda + \rho) - \rho$ 为支配权的唯一 Weyl 群元素（$\ell(w)$ 为 $w$ 的长度）。非零时 $H^{\ell(w)}(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda)) \cong V_{w(\lambda + \rho) - \rho}$。当 $\lambda$ 已是支配权时，$w = e$，回到 Borel-Weil 定理。

**推论 124.1**（Euler-Poincaré特征）：形式特征标满足 $\chi_\lambda = \sum_{q} (-1)^q \operatorname{ch} H^q(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda))$。结合 Weyl 特征公式，Bott-Borel-Weil 定理给出了特征公式的几何证明。

### 124.3 几何表示论的视角

**定义 124.3**（等变上同调与特征类）：$T$-等变上同调 $H_T^*(\mathcal{B})$ 中的 Schubert 类 $[X_w]$（$w \in W$）构成 $H_T^*(\mathcal{B})$ 的基。Schubert 类的乘积公式（Chevalley-Monk 公式）与表示论中张量积分解有深刻联系。

**定理 124.3**（Borel 同构）：$H_T^*(\mathcal{B}) \cong \mathbb{C}[\mathfrak{h}] / (\mathbb{C}[\mathfrak{h}]^W_+)$，其中 $\mathbb{C}[\mathfrak{h}]^W_+$ 是 Weyl 群不变多项式中无常数项的理想。这给出了旗流形的等变上同调环的代数描述。

---

---

---

---

---