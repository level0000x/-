## 第85章：泛包络代数与PBW定理
泛包络代数将李代数嵌入结合代数，使得李代数的表示论转化为结合代数的模论。PBW（Poincaré-Birkhoff-Witt）定理是泛包络代数的基本结构定理。

### 123.1 泛包络代数的构造

**定义 123.1**（泛包络代数）：李代数 $\mathfrak{g}$ 的**泛包络代数** $U(\mathfrak{g})$ 是张量代数 $T(\mathfrak{g}) = \bigoplus_{k=0}^{\infty} \mathfrak{g}^{\otimes k}$ 模去双边理想 $J = \langle X \otimes Y - Y \otimes X - [X, Y] : X, Y \in \mathfrak{g} \rangle$ 的商代数：$U(\mathfrak{g}) = T(\mathfrak{g}) / J$。

**定理 123.1**（泛性质）：存在自然李代数同态 $i: \mathfrak{g} \to U(\mathfrak{g})$（将 $X$ 映为其在 $T(\mathfrak{g})$ 中的像），使得对任意结合代数 $A$ 和李代数同态 $f: \mathfrak{g} \to A$（$A$ 带有交换子 $[a,b] = ab - ba$ 作为李括号），存在唯一的结合代数同态 $\tilde{f}: U(\mathfrak{g}) \to A$ 使得 $f = \tilde{f} \circ i$。即 $\operatorname{Hom}_{\text{Lie}}(\mathfrak{g}, A) \cong \operatorname{Hom}_{\text{Assoc}}(U(\mathfrak{g}), A)$。

**证明**：张量代数 $T(\mathfrak{g})$ 的泛性质将线性映射 $\mathfrak{g} \to A$ 唯一地延拓为结合代数同态 $T(\mathfrak{g}) \to A$。对李代数同态 $f$，其延拓 $\hat{f}$ 满足 $\hat{f}(X \otimes Y - Y \otimes X - [X, Y]) = f(X)f(Y) - f(Y)f(X) - f([X, Y]) = 0$，故 $J \subseteq \ker \hat{f}$。因此 $\hat{f}$ 通过商诱导 $\tilde{f}: U(\mathfrak{g}) \to A$。唯一性由 $i(\mathfrak{g})$ 生成 $U(\mathfrak{g})$ 保证。$\blacksquare$

**推论 123.1**（表示论的翻译）：$\mathfrak{g}$ 的表示（即李代数同态 $\mathfrak{g} \to \mathfrak{gl}(V)$）与 $U(\mathfrak{g})$-模一一对应。这将对李代数表示的研究转化为对结合代数 $U(\mathfrak{g})$ 上模的研究。

### 123.2 PBW定理

**定理 123.2**（PBW定理，Poincaré 1900, Birkhoff 1937, Witt 1937）：设 $\{X_1, \ldots, X_n\}$ 是李代数 $\mathfrak{g}$ 的一组有序基。则单项式 $\{X_1^{k_1} X_2^{k_2} \cdots X_n^{k_n} : k_i \in \mathbb{Z}_{\geq 0}\}$（按顺序排列）构成 $U(\mathfrak{g})$ 的一组基。

**证明**：构造线性映射 $\varphi: S(\mathfrak{g}) \to U(\mathfrak{g})$（对称代数到泛包络代数）。在对称代数上用归纳法定义 $\varphi(x_1 \cdots x_m) = \frac{1}{m!} \sum_{\sigma \in S_m} X_{\sigma(1)} \cdots X_{\sigma(m)}$（$U(\mathfrak{g})$ 中的乘积）。验证 $\varphi$ 将 $S(\mathfrak{g})$ 的基（有序单项式）映为 $U(\mathfrak{g})$ 中的有序单项式，且该映射是线性同构——因为 $\varphi$ 将滤过 $S(\mathfrak{g}) \to \operatorname{gr} U(\mathfrak{g})$ 诱导为分次同构。关键在于验证 $\varphi(xy - yx) = [X, Y]$（在 $U(\mathfrak{g})$ 中），这由对称化算子的性质保证。$\blacksquare$

*意义*：PBW定理表明 $U(\mathfrak{g})$ 作为向量空间同构于对称代数 $S(\mathfrak{g})$（$\mathfrak{g}$ 上的多项式代数）——尽管作为代数结构完全不同（$U(\mathfrak{g})$ 是非交换的）。自然滤过 $\{U_k(\mathfrak{g})\}$（$U_k$ 由次数 $\leq k$ 的元素张成）的伴随分次代数 $\operatorname{gr} U(\mathfrak{g}) \cong S(\mathfrak{g})$。这意味着 $\dim U(\mathfrak{g})$ 是无限的（当 $\mathfrak{g} \neq \{0\}$），且 $U(\mathfrak{g})$ 是 Noether 环。

**定理 123.3**（Bernstein-Gelfand-Gelfand 范畴 $\mathcal{O}$ 定理，1976）：对半单李代数 $\mathfrak{g}$，BGG 范畴 $\mathcal{O}$（由所有有限生成的 $U(\mathfrak{g})$-模构成的范畴，其中 $\mathfrak{n}^+$ 局部幂零作用且 $\mathfrak{h}$ 半单作用）具有有限长、每个对象有有限 Jordan-Hölder 序列，且不可约对象由最高权分类。投射对象的存在性和 BGG 互反律（BGG reciprocity）是范畴 $\mathcal{O}$ 的核心结构定理。

**证明**（框架）：范畴 $\mathcal{O}$ 的定义条件确保每个对象 $M$ 具有权空间分解 $M = \bigoplus_{\mu} M_\mu$。由 $\mathfrak{n}^+$ 的局部幂零性和 $\mathfrak{h}$ 的半单作用，每个对象有最高权向量，从而存在 Verma 模的满射 $\Delta(\lambda) \to L(\lambda)$。有限生成性 + Noether 性（$U(\mathfrak{g})$ 是 Noether 环）确保每个对象有有限长度。不可约对象 $L(\lambda)$ 由最高权 $\lambda$ 分类。投射覆盖 $P(\lambda) \to L(\lambda)$ 的存在性来自 $U(\mathfrak{g})$ 上适当的完备化，其 Jordan-Hölder 重数满足 BGG 互反律 $(P(\lambda) : \Delta(\mu)) = [\Delta(\mu) : L(\lambda)]$（Verma 模的合成因子重数）。$\blacksquare$

### 123.3 Casimir算子与中心

**定义 123.2**（Casimir算子）：设 $\mathfrak{g}$ 是半单李代数，$\{X_i\}$ 是 $\mathfrak{g}$ 关于 Killing 型的一组基，$\{X^i\}$ 是对偶基（$\kappa(X_i, X^j) = \delta_i^j$）。**Casimir算子** $C = \sum_i X_i X^i \in U(\mathfrak{g})$。$C$ 位于 $U(\mathfrak{g})$ 的中心 $\mathcal{Z}(\mathfrak{g})$ 中，且与表示 $\pi$ 的选取无关。

**命题 123.1**（Casimir算子的作用）：在最高权为 $\lambda$ 的不可约表示 $V_\lambda$ 上，Casimir 算子作用为标量 $c(\lambda) = \kappa(\lambda + \rho, \lambda + \rho) - \kappa(\rho, \rho)$，其中 $\rho$ 是正根之和的一半。

**定理 123.4**（Harish-Chandra 同构，1951）：中心 $\mathcal{Z}(\mathfrak{g}) \cong U(\mathfrak{h})^W$——即 $U(\mathfrak{g})$ 的中心同构于 Cartan 子代数的泛包络代数在 Weyl 群作用下的不变量。该同构由 Harish-Chandra 投影 $P: U(\mathfrak{g}) \to U(\mathfrak{h})$（滤过 $U(\mathfrak{g}) = U(\mathfrak{h}) \oplus (\mathfrak{n}^- U(\mathfrak{g}) + U(\mathfrak{g}) \mathfrak{n}^+)$ 的前项投影）的标准万有实现给出。这一定理将中心特征标与权 $\lambda$ 通过 $\chi_\lambda: \mathcal{Z}(\mathfrak{g}) \to \mathbb{C}$（即无穷小特征标）对应起来——两个不可约最高权模具有相同的无穷小特征标当且仅当它们的最高权相差 Weyl 群作用。

**证明**（框架）：由 PBW 定理的三角分解 $U(\mathfrak{g}) \cong U(\mathfrak{n}^-) \otimes U(\mathfrak{h}) \otimes U(\mathfrak{n}^+)$。Harish-Chandra 投影 $P: U(\mathfrak{g}) \to U(\mathfrak{h})$ 滤去含 $\mathfrak{n}^\pm$ 因子的项。限制到 $\mathcal{Z}(\mathfrak{g})$：对 $z \in \mathcal{Z}(\mathfrak{g})$，$z$ 与每个根向量 $e_\alpha$ 交换，迫使 $P(z)$ 在 Weyl 群反射下不变，即 $P(z) \in U(\mathfrak{h})^W$。单射性由 $\mathcal{Z}(\mathfrak{g})$ 中无非平凡元素被 $P$ 零化保证；满射性由 Casimir 元素和更高次中心元实现每个 Weyl 不变量得证。$\blacksquare$

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

**定义 124.2**（与权关联的线丛）：对任意整权 $\lambda \in \mathfrak{h}^*$（满足 $\lambda$ 在每条余根上取整数值），可定义 $B$ 的 1 维表示 $\mathbb{C}_\lambda$（由 $\lambda$ 经指数映射诱导），进而构造 $\mathcal{B}$ 上的齐性线丛 $\mathcal{L}_\lambda = G_\mathbb{C} \times_B \mathbb{C}_\lambda$。$\mathcal{L}_\lambda$ 的全纯截面在 $\mathcal{B}$ 的 Dolbeault 上同调中给出了不可约表示。

### 124.2 Borel-Weil-Bott定理

**定理 124.1**（Borel-Weil 定理，1954-1957）：设 $\lambda$ 是支配整权。则不可约表示 $V_\lambda$（$G$ 的表示，经复化视为 $G_\mathbb{C}$ 的全纯表示）同构于 $\mathcal{B}$ 上 $\mathcal{L}_\lambda$ 的全局全纯截面空间：
$$H^0(\mathcal{B}, \mathcal{O}(\mathcal{L}_\lambda)) \cong V_\lambda$$

*证明思路*：$G_c$ 紧致实形 $G$ 在 $\mathcal{B}$ 上可迁作用，$\mathcal{B} \cong G/T$（$T = G \cap B$ 是极大环面）。使用 Peter-Weyl 定理和最高权理论在层上同调中的实现——$H^0$ 的 Casimir 算子特征值分析给出最高权分类。

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