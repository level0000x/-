## 第257章：Arakelov 几何
Arakelov 几何将代数几何的概型方法推广到算术情形，在 $\operatorname{Spec} \mathbb{Z}$ 上构造"算术曲面"，并在每个无穷远点处附加 Hermite 度量以赋予"紧性"。这是将代数几何方法与解析工具相结合的交叉领域，其核心应用包括 Faltings 对 Mordell 猜想的证明。

### 88.1 算术曲面与 Hermite 度量

**定义 88.1**（算术曲面）：**算术曲面**是一个平坦、有限型的态射 $\pi: \mathcal{X} \to \operatorname{Spec} \mathbb{Z}$，其一般纤维 $\mathcal{X}_{\mathbb{Q}} = \mathcal{X} \times_{\operatorname{Spec} \mathbb{Z}} \operatorname{Spec} \mathbb{Q}$ 是一条光滑射影曲线。实数纤维 $\mathcal{X}(\mathbb{C}) = \mathcal{X} \times_{\operatorname{Spec} \mathbb{Z}} \operatorname{Spec} \mathbb{C}$ 是紧 Riemann 面（不一定连通）。在每个连通分支 $\mathcal{X}_\sigma$（$\sigma \in \mathcal{X}(\mathbb{C})$ 的连通分支）上需装备 **Kähler 度量**——称为 Hermite 度量或 Kähler 形式 $\omega_\sigma$。

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

**证明**（框架）：Faltings 将经典的 Hodge 指标定理（曲面上两个除子相交的符号由其中一个的符号决定）推广到算术情形。在算术曲面 $\mathcal{X}$ 上，取 $D$ 为水平（算术）除子，其 $\mathbb{Q}$-纤维是通常曲线上的除子。考虑交集矩阵 $(D_i \cdot D_j)$ 在垂直除子空间的限制。由纤维上的经典 Hodge 指标定理，该矩阵的符号为 $(1, n-1)$（一个正方向）。无穷远处的 Green 函数贡献调整后，断言在 $\widehat{\operatorname{CH}}^1(\mathcal{X})_{\mathbb{R}}$ 上的相交配对满足同样的符号性质。核心工具是 Faltings 的高度不等式和 Arakelov 的邻接矩阵分析。$\blacksquare$

### 88.3 算术 Riemann-Roch 定理

**定理 88.2**（算术 Riemann-Roch 定理，Gillet-Soulé 1992 年）：设 $\pi: \mathcal{X} \to \operatorname{Spec} \mathbb{Z}$ 是算术曲面，$\overline{E}$ 是 $\mathcal{X}$ 上的 Hermite 向量丛。则算术 Euler 示性数

$$\widehat{\chi}(\overline{E}) = \sum_{i=0}^2 (-1)^i \widehat{\deg}(\det R^i \pi_* \overline{E})$$

等于由 Gillet-Soulé 的 Chern 形式 $\widehat{\operatorname{ch}}(\overline{E})$ 和 Todd 形式 $\widehat{\operatorname{Td}}(T_{\mathcal{X}/\mathbb{Z}})$ 在算术 Chow 环中的相交积分

$$\widehat{\chi}(\overline{E}) = \int_{\mathcal{X}} \widehat{\operatorname{ch}}(\overline{E}) \cdot \widehat{\operatorname{Td}}(T_{\mathcal{X}/\mathbb{Z}})$$

**证明**：将 Grothendieck-Riemann-Roch 定理提升到算术曲面 $\pi: \mathcal{X} \to \operatorname{Spec} \mathbb{Z}$。设 $\overline{E}$ 为 $\mathcal{X}$ 上的 Hermite 向量丛。有限素理想处的 Euler 示性数由经典 GRR 给出：$\chi_{\text{fin}}(\overline{E}) = \int_{\mathcal{X}} \operatorname{ch}(E) \cdot \operatorname{Td}(T_{\mathcal{X}/\mathbb{Z}})$。无穷远处的贡献来自解析挠率（Ray-Singer）：$T(\overline{E}) = \frac{1}{2} \sum_{q} (-1)^q q \log \det' \Delta_q$（$\Delta_q$ 为 $\overline{E}$ 值 $q$-形式的 Laplace 算子）。Gillet-Soulé 的关键构造是算术 Chern 特征标 $\widehat{\operatorname{ch}}: \widehat{K}_0(\mathcal{X}) \to \widehat{\operatorname{CH}}^*(\mathcal{X})_{\mathbb{R}}$，使得在算术 Chow 环中的积分同时捕获有限部分的交数和无穷远处的 Green 流积分：$\widehat{\chi}(\overline{E}) = \chi_{\text{fin}}(\overline{E}) + T(\overline{E}) = \int_{\mathcal{X}} \widehat{\operatorname{ch}}(\overline{E}) \cdot \widehat{\operatorname{Td}}(T_{\mathcal{X}/\mathbb{Z}})$。这一定理是 Arakelov 几何的基石。$\blacksquare$

算术 Riemann-Roch 定理是 Arakelov 几何中最为深刻和重要的定理之一。它统一了三个看似不相干的领域：有限素理想处的代数交数（经典代数几何），无穷远处的解析不变量（Ray-Singer 解析挠率），以及算术 Chow 环中的形式计算。定理中的解析挠率 $T(\overline{E})$ 是谱几何中的不变量，由 Ray 和 Singer 于 1971 年引入，其定义为 Laplace 算子 $\Delta_q$ 的正则化行列式。Bismut 和 Vasserot 后来给出了解析挠率的局部指标定理证明，将 $T(\overline{E})$ 与局部 Riemann-Roch 定理联系起来。算术 Riemann-Roch 定理的一个关键推论是算术 Hilbert-Samuel 定理（定理 88.3），它给出了截面空间维数的渐近估计。此外，算术 Riemann-Roch 定理在 Faltings 对 Mordell 猜想的证明中发挥了核心作用：Faltings 通过比较算术曲面上的 Arakelov 高度与 Néron-Tate 高度，利用算术 Riemann-Roch 定理推导出高度不等式，进而证明了 Mordell 猜想。在更一般的设定下，Gillet-Soulé 将算术 Riemann-Roch 定理推广到了高维算术簇，建立了算术 $K$-理论与算术 Chow 群之间的函子性对应（算术 Riemann-Roch 定理的协变形式）。

### 88.4 算术 Hilbert-Samuel 定理

**定理 88.3**（算术 Hilbert-Samuel 定理，Zhang 1995 年，Abbes-Bouche 1995 年）：设 $\mathcal{X}$ 是算术曲面，$\overline{L}$ 是 $\mathcal{X}$ 上的 Hermite 线丛（丰沛线丛配以正曲率度量）。则

$$\widehat{\chi}(\overline{L}^{\otimes n}) = \frac{\widehat{\deg}(\overline{L})}{2} n^2 + O(n \log n)$$

其中 $\widehat{\deg}(\overline{L})$ 是 $\overline{L}$ 的算术次数。这与通常的 Hilbert-Samuel 定理（$P(n) = \frac{L^n}{n!} n^n + \cdots$）在形式上是平行的。

**证明**：设 $\overline{L}$ 为 $\mathcal{X}$ 上的 Hermite 丰沛线丛。对 $m \gg 0$，由 Serre 消没定理知 $H^i(\mathcal{X}, \overline{L}^{\otimes m}) = 0$（$i > 0$），故 $\widehat{\chi}(\overline{L}^{\otimes m}) = \widehat{\deg}(\det H^0(\mathcal{X}, \overline{L}^{\otimes m}))$。由算术 Riemann-Roch 定理展开：$\widehat{\chi}(\overline{L}^{\otimes m}) = \int_{\mathcal{X}} (1 + m \widehat{c}_1(\overline{L}) + \frac{m^2}{2} \widehat{c}_1(\overline{L})^2) \cdot (1 + \frac{1}{2} \widehat{c}_1(T) + \cdots)$。在 $\dim \mathcal{X} = 2$ 的情形截断，主导项为 $\frac{m^2}{2} \widehat{c}_1(\overline{L})^2 = \frac{m^2}{2} \widehat{\deg}(\overline{L})$。误差项由 Todd 类的低次分量和 Laplace 算子谱的 Weyl 渐近 $\#\{\lambda_i \leq t\} \sim \frac{\operatorname{vol}}{4\pi} t$ 控制，贡献为 $O(m \log m)$。$\blacksquare$

算术 Hilbert-Samuel 定理是算术几何中截面空间渐近理论的基石。在经典代数几何中，Hilbert-Samuel 定理断言：对射影簇 $X$ 上的丰沛线丛 $L$，Hilbert 函数 $h^0(X, L^{\otimes n}) = \dim H^0(X, L^{\otimes n})$ 对充分大的 $n$ 是一个次数为 $\dim X$ 的多项式（Hilbert 多项式）。在算术几何中，$\widehat{\chi}(\overline{L}^{\otimes n})$ 取代了 $h^0$，它不仅包含了经典截面的维数信息，还编码了无穷远处 Hermite 度量的贡献。主导系数 $\widehat{\deg}(\overline{L})$ 是 $\overline{L}$ 的算术次数，它由有限部分的交数 $\deg(L_{\mathbb{Q}})$ 和无穷远处的 Green 函数积分共同决定。定理中的误差项 $O(n \log n)$ 比经典情形中的 $O(n)$（对 $\dim X = 2$）更弱，这是因为无穷远处的 Laplace 算子谱分布引入了对数因子。Zhang 在 1995 年的论文中利用这一定理建立了算术 Hilbert-Samuel 函数与可计算 Arakelov 高度之间的直接联系，证明了算术 Bogomolov 猜想所需的关键不等式。算术 Hilbert-Samuel 定理的证明依赖于算术 Riemann-Roch 定理和 Ray-Singer 解析挠率在张量幂下的渐近展开，后者由 Bismut-Vasserot 的局部指标定理精确控制。

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

---

---

---
---

### 231.A 拓扑斯补充
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

**证明**（框架）：必要性（每个 Grothendieck 拓扑斯满足这些条件）：$\operatorname{Sh}(\mathcal{C}, J)$ 是预层范畴 $\operatorname{PSh}(\mathcal{C})$ 的反射子范畴，故余完备；可表预层 $\{h_U = \operatorname{Hom}(-, U) : U \in \mathcal{C}\}$ 是生成元族；余积的分离性和等价关系的有效性由层的粘合性质保证。充分性：给定满足四条件的范畴 $\mathcal{E}$，取生成元全子范畴 $\mathcal{C}$ 并赋予典范拓扑（最细的使所有可表态射为覆盖的拓扑），证明 $\mathcal{E} \cong \operatorname{Sh}(\mathcal{C}, J_{\text{can}})$：Yoneda 嵌入 $\mathcal{E} \to \operatorname{PSh}(\mathcal{C})$ 通过有效等价关系将每个对象表示为关系商，从而嵌入像在层范畴中且本质满。$\blacksquare$

### 分类拓扑斯与Lawvere-Tierney拓扑

**定义**（分类拓扑斯）：若几何理论 $\mathbb{T}$ 的所有模型（在所有 Grothendieck 拓扑斯中）同构于拓扑斯 $\mathcal{E}_{\mathbb{T}}$ 中一个"万有模型"的拉回，则 $\mathcal{E}_{\mathbb{T}}$ 是 $\mathbb{T}$ 的**分类拓扑斯**。例如：
- 群的分类拓扑斯是 $G$ 的群对象（群作用层范畴）
- 环的分类拓扑斯对应交换环范畴中的仿射概形

**定义**（Lawvere-Tierney拓扑 / 拓扑斯中的局部算子）：拓扑斯 $\mathcal{E}$ 的子对象分类器 $\Omega$ 上的 **Lawvere-Tierney 拓扑**（即层化模态 / local operator）是映射 $j: \Omega \to \Omega$ 满足 $j \circ \operatorname{true} = \operatorname{true}$、$j \circ j = j$ 和 $j \circ \wedge = \wedge \circ (j \times j)$。$j$ 的代数（$\Omega$ 中满足 $j$ 不变性的子对象）构成 $\mathcal{E}$ 的一个子拓扑斯 $\operatorname{Sh}_j(\mathcal{E})$——即 $\mathcal{E}$ 中 $j$-层的全子范畴。这个子拓扑斯对应 $\mathcal{E}$ 中由 $j$ 指定的"更精细的层条件"。

*意义*：Lawvere-Tierney 拓扑是 Grothendieck 拓扑在初等拓扑斯中的内在形式——无需引用外部集合论即可定义拓扑斯中的局部化和层概念。

**定理**（Deligne完备性定理）：每个凝聚 Grothendieck 拓扑斯（coherent topos）具有足够的点——即存在一族拓扑斯态射 $x_i: \mathbf{Set} \to \mathcal{E}$（点）使得逆像函子的族 $\{x_i^*\}$ 是保守的（conservative）。因此，Grothendieck 拓扑斯中的层可由其在"点"上的茎（stalk）完全确定——这推广了拓扑空间中层的茎检验原理。

**证明**（框架）：凝聚拓扑斯 $\mathcal{E}$ 由有限表示对象生成的景上的层范畴给出。Deligne 的证明利用逻辑紧致性定理：取 $\mathcal{E}$ 中对象的有限可满足的层的逆系统，利用紧致性定理（布尔预层的滤过余极限保持层性质）证明存在足够的层态射到 $\mathbf{Set}$。关键引理：对凝聚景，覆盖的有限生成性保证每个层的"可满足理论"是有限一致的，由紧致性定理得一致满足性，进而构造出点族使其茎函子保守。$\blacksquare$

### 拓扑斯理论的数学影响

1. **代数几何**：Grothendieck 拓扑斯是将 fpqc 下降（descent）形式化的范畴框架。平坦下降等价于层条件：一个预层是层当且仅当它满足平坦覆盖的所有下降数据。这是模叠理论和导出代数几何的基础语言。

2. **逻辑基础**：拓扑斯提供了直觉主义类型论的范畴语义——每个拓扑斯 $\mathcal{E}$ 有内在的逻辑（能解释量词、合取、析取和蕴含），但排中律（$\varphi \vee \neg\varphi$）在一般的拓扑斯中不成立。这不同于经典 $\mathbf{Set}$ 中的逻辑。

3. **同伦类型论（HoTT）**：$\infty$-拓扑斯（或 $(\infty, 1)$-拓扑斯）是 $\infty$-范畴版的拓扑斯——它是同伦类型论和 $\infty$-群的模型范畴。这将拓扑斯思想推广到了同伦论的领域，是现代数学基础的前沿。

---

*本卷建立了范畴论的核心框架：范畴、函子和自然变换提供了描述数学结构的统一语言；Yoneda 引理是范畴论最基本的定理，体现了"对象由关系决定"的哲学；极限和余极限统一了数学中的各种构造；伴随函子是范畴论最核心的概念，自由-遗忘、张量-Hom 等伴随对在数学中无处不在；单子理论将代数结构抽象为范畴论概念；Abel 范畴和导出范畴为同调代数（V12 Ch 118）提供了现代框架。范畴论是连接代数、几何、拓扑和分析的统一语言。*

---

*本卷从经典代数几何（仿射簇、射影簇、Hilbert 零点定理）出发，引入现代概形语言和层上同调方法。仿射代数簇与有限生成整代数的范畴等价建立了代数与几何的桥梁；概形理论将这一对应推广到所有交换环，统一了代数几何与数论；Serre 定理和 Serre 对偶为凝聚层上同调的计算提供了核心工具；Riemann-Roch 定理及其推广是代数几何最重要的定理之一，深刻影响了代数曲线、曲面和高维簇的分类理论。为后续数论 II（V16）中椭圆曲线和模形式的学习提供了几何基础。**补充部分**整合了范畴论基础——代数几何与同调代数的共同语言：范畴、函子与自然变换、Yoneda引理、极限与余极限、伴随函子、单子与代数、Abel范畴与导出范畴初步，为概形理论和层上同调提供了统一的范畴论框架。*


*卷十五：代数几何终。*


*卷十五：代数几何终。*


*卷十五：代数几何终。*


*卷十八：代数几何终。*