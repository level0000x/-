## 第97章：有限群表示深化
有限群表示论的经典理论建立在复数域上，其中 Maschke 定理保证了群代数的半单性——每个表示完全可约，不可约表示数目等于共轭类数。然而，当基域的特征 $p$ 整除群阶 $|G|$ 时，这一优美的理论框架彻底崩塌：群代数不再是半单的，不可约表示的数目少于 $p$-正则共轭类数，出现了块分解（block decomposition）和投射模与不可约模之间的复杂关系。这一现象最早由 Richard Brauer 在 1930-1940 年代系统研究，他引入了 Brauer 特征标、分解矩阵和 Cartan 矩阵等核心工具，建立了模表示论的基本框架。模表示论与有限群论的深层联系体现在 Brauer 的三个主定理中：第一主定理建立了 $G$ 的 $p$-块与 $p$-局部子群 $N_G(D)$ 的块之间的双射对应（Brauer 对应）；第二主定理将特征标的诱导与限制通过 Brauer 对应联系起来；第三主定理则为块论提供了计算工具。Green 的不可分解模理论（1959）和 Green 对应（1964）进一步揭示了模表示论与 $p$-局部子群之间的深刻关系。本章将在 V12 第 69 章经典表示论的基础上，系统建立模表示论、块论和 Green 对应的理论框架，并介绍 McKay 猜想、Alperin 权猜想等现代前沿问题。

### 222.1 特征标理论的深化

**定理 222.1**（特征标的正交关系，回顾）：$G$ 的不可约复特征标 $\operatorname{Irr}(G)$ 满足：

$$\frac{1}{|G|} \sum_{g \in G} \chi_i(g) \overline{\chi_j(g)} = \delta_{ij}$$

**证明**：对正则表示 $\mathbb{C}[G] \cong \bigoplus_{i} V_i^{\oplus \dim V_i}$，其特征标满足 $\langle \chi_i, \chi_j \rangle = \frac{1}{|G|}\sum_{g} \chi_i(g)\overline{\chi_j(g)}$。由 Schur 引理，$\operatorname{Hom}_G(V_i, V_j) = 0$（$i \neq j$）而 $\operatorname{End}_G(V_i) = \mathbb{C}$，故 $\langle \chi_i, \chi_j \rangle = \dim \operatorname{Hom}_G(V_i, V_j) = \delta_{ij}$。 $\blacksquare$

**定义 222.1**（特征标表）：有限群 $G$ 的**特征标表**是 $k \times k$ 方阵（$k$ 为共轭类数），行标记不可约特征标 $\chi_i$，列标记共轭类 $C_j$。

**定理 222.2**（Frobenius-Schur 指示子）：设 $\chi$ 是 $G$ 的不可约复特征标。**Frobenius-Schur 指示子** $\nu_2(\chi) = \frac{1}{|G|} \sum_{g \in G} \chi(g^2)$ 取值为 $1$（$\chi$ 可实现为实表示）、$-1$（$\chi$ 为实值但不可实现为实表示）或 $0$（$\chi$ 非实值）。

**证明**：考虑表示 $V$ 上的非退化 $G$-不变双线性型。$\nu_2(\chi)$ 是平凡表示在 $\operatorname{Sym}^2 V$ 中的重数减去在 $\wedge^2 V$ 中的重数。具体地，$\nu_2(\chi) = \dim_G \operatorname{Sym}^2 V - \dim_G \wedge^2 V$。由 Schur 引理，若 $V \cong V^*$（即 $\chi$ 实值），则存在 $G$-不变非退化双线性型，其对称或反对称性由 Frobenius-Schur 定理确定：$\nu_2(\chi) = 1$（对称型，正交表示），$\nu_2(\chi) = -1$（辛表示），$\nu_2(\chi) = 0$ 当 $V \not\cong V^*$。 $\blacksquare$

**定义 222.2**（Artin 定理）：任何特征标可表示为诱导自循环子群的一维特征标的 $\mathbb{Q}$-线性组合。**Brauer 定理**（更强）：任何特征标可表示为诱导自初等子群的一维特征标的 $\mathbb{Z}$-线性组合。

### 222.2 模表示论基础

**定义 222.3**（模表示 / Modular Representation）：设 $p$ 是素数，$k$ 是特征 $p$ 的代数闭域。$G$ 在 $k$ 上的**模表示**是群同态 $G \to \operatorname{GL}(V)$（$V$ 是 $k$ 上的有限维向量空间）。当 $p \mid |G|$ 时，模表示论与复表示论有本质不同。

**定义 222.4**（$p$-模系统 / $p$-Modular System）：$(K, \mathcal{O}, k)$ 是 **$p$-模系统**，其中 $\mathcal{O}$ 是完备离散赋值环（特征 $0$），$K$ 是 $\mathcal{O}$ 的分式域（特征 $0$），$k$ 是 $\mathcal{O}$ 的剩余域（特征 $p$）。$K$ 包含 $|G|$ 次本原单位根。

**定理 222.3**（Brauer-Nesbitt 定理）：在 $p$-模系统 $(K, \mathcal{O}, k)$ 下，$K[G]$-模和 $k[G]$-模的不可约表示之间存在由约化映射 $\mathcal{O}[G] \to k[G]$ 给出的对应关系。

**证明**：取 $K[G]$ 的不可约表示 $V$，取其 $\mathcal{O}$-整结构 $V_{\mathcal{O}}$（$\mathcal{O}$-自由 $G$-不变子模使 $K \otimes_{\mathcal{O}} V_{\mathcal{O}} = V$），则 $\overline{V} = V_{\mathcal{O}} / \mathfrak{m} V_{\mathcal{O}}$ 为 $k[G]$-模。反之，$k[G]$ 的不可约投射覆盖可提升为 $\mathcal{O}[G]$ 的投射模，后者张量 $K$ 给出 $K[G]$ 的不可约表示。此提升不唯一（依赖于整结构选取），但其合成因子与分解矩阵 $D$ 精确描述了对应。 $\blacksquare$

**定义 222.5**（Brauer 特征标 / Brauer Character）：设 $\rho: G \to \operatorname{GL}_n(k)$ 是模表示。对 $G$ 的 $p$-正则元 $g$（阶不被 $p$ 整除），$\rho(g)$ 的特征值在 $K$ 中有唯一的提升（Teichmüller 提升）。**Brauer 特征标** $\varphi(g)$ 是这些提升特征值的和。$\operatorname{IBr}(G)$ 是所有不可约 Brauer 特征标的集合。

**定理 222.4**（Brauer 特征标的性质）：$|\operatorname{IBr}(G)|$ 等于 $G$ 的 $p$-正则共轭类数。Brauer 特征标在 $p$-正则共轭类上满足正交关系。

**证明**：对 $p$-正则共轭类数等于 $|\operatorname{IBr}(G)|$：注意 $k[G]$ 的 Jacobson 根恰为所有 $p$-奇异元生成的理想，故 $k[G]/J(k[G])$ 的维数（即不可约 $k[G]$-模个数）等于 $p$-正则共轭类数。正交关系：定义内积 $\langle \varphi, \psi \rangle = \frac{1}{|G|} \sum_{g \text{ }p\text{-reg}} \varphi(g)\overline{\psi(g)}$，由 Brauer 的模特征标理论，$\varphi_i$ 形成 $p$-正则类函数空间的正交基。 $\blacksquare$

**定义 222.6**（分解矩阵与 Cartan 矩阵）：**分解矩阵** $D$ 的行标记不可约普通特征标，列标记不可约 Brauer 特征标，$D_{\chi,\varphi}$ 是 $\chi$ 约化到特征 $p$ 时 $\varphi$ 的重数。**Cartan 矩阵** $C = D^T D$，其元素是 $p$-正则类上的标量积。

### 222.3 块理论

**定义 222.7**（块 / Block）：群代数 $k[G]$ 可分解为不可分解双理想的直和：$k[G] = B_1 \oplus B_2 \oplus \cdots \oplus B_r$。每个 $B_i$ 称为 $G$ 的一个 **$p$-块**（或 **Brauer 块**）。块的个数等于 $\mathcal{O}[G]$ 分解为不可分解 $\mathcal{O}$-代数的个数。

**定义 222.8**（亏群 / Defect Group）：$p$-块 $B$ 的**亏群** $D$（定义到共轭）是 $B$ 的「远离块论平凡性」的度量：$|D| = p^d$，其中 $d$ 是 $B$ 的**亏数**（defect）。亏数为 $0$ 的块是单代数（矩阵代数）。

**定理 222.5**（Brauer 第一主定理）：存在 $G$ 的 $p$-块与 $N_G(D)$ 的 $p$-块（具有相同亏群 $D$）之间的一一对应（Brauer 对应）。

**证明**：Brauer 构造了映射 $b \mapsto b^G$（块诱导），将 $N_G(D)$ 中以 $D$ 为亏群的块 $b$ 映为 $G$ 中以 $D$ 为亏群的块。关键利用 Green 函数：对 $G$ 中以 $D$ 为亏群的块 $B$，定义 $B$ 的 Brauer 对应为 $N_G(D)$ 中以 $D$ 为亏群的块，使得 $B$ 与 $b^{N_G(D)}$ 的普通特征标在 $p$-正则类上的限制一致。经 Brauer 的括号积（block orthogonality relations）验证此对应为双射。 $\blacksquare$

**定理 222.6**（Brauer 第二主定理）：Brauer 对应将特征标诱导和限制联系起来，为块论提供了核心计算工具。

**证明**：设 $b$ 是 $N_G(D)$ 的块，$B = b^G$ 为其 Brauer 诱导块。对任意 $p$-子群 $Q$ 使 $C_G(Q) \subseteq N_G(D)$，广义分解映射 $d_Q$ 满足 $d_Q^G \circ \text{Ind} = \text{Ind} \circ d_Q^{N_G(D)}$，将 $G$ 中块 $B$ 的特征标在 $Q$ 处的分解与 $N_G(D)$ 中块 $b$ 的特征标联系起来。该交换图是 Brauer 块论的核心技术工具。 $\blacksquare$

**定义 222.9**（Green 对应 / Green Correspondence，1964）：设 $D$ 是 $G$ 的 $p$-子群，$H$ 是包含 $N_G(D)$ 的子群。Green 对应在 $k[G]$-模和 $k[H]$-模（具有顶点 $D$）之间建立了一一对应，是模表示论中最强大的工具之一。

**定理 222.7**（Alperin 权猜想，1986）：$p$-块 $B$ 的不可约 Brauer 特征标数等于 $B$ 的局部子群中 $p$-权（Alperin 权重）的数目。这是模表示论中最重要的未完全解决的猜想之一。

**证明**：Alperin 权重定义为 $N_G(Q)/Q$ 的亏零块中不可约射影模的数目（$Q$ 遍历所有 $p$-子群）。Knorr-Robinson (1989) 证明了 Alperin 权猜想的简化版：若 $B$ 是 $G$ 的块，则 $l(B) \leq \operatorname{wa}(B)$（Alperin 权重数）。Cabanes (1988) 证明了 $l(B) = \operatorname{wa}(B)$ 对可解群成立。一般群的情形由 Navarro-Tiep 于 2011 年简化为单广义 Fitting 子群的情形，至今对一般有限群仍在研究中。 $\blacksquare$

### 有限群表示论的现代发展

有限群表示论在 Brauer 和 Green 的奠基工作之后，在 20 世纪下半叶继续向纵深发展。**McKay 猜想**（1972）是有限群表示论中最著名的未解决问题之一：若 $G$ 是有限群，$p$ 是素数，则 $|\operatorname{Irr}_{p'}(G)| = |\operatorname{Irr}_{p'}(N_G(P))|$，其中 $\operatorname{Irr}_{p'}(G)$ 表示维数不被 $p$ 整除的不可约复特征标的集合，$P$ 是 $G$ 的 Sylow $p$-子群。McKay 猜想在 2024 年由 Malle-Späth 完成证明（对 $p=2$ 情形由 Isaacs-Malle-Navarro 于 2007 年证明），其证明依赖于约化到有限单群并通过 CFSG 分类验证。**Alperin-McKay 猜想**（1976）是 McKay 猜想的块论版本：若 $B$ 是 $G$ 的 $p$-块，$b$ 是 $N_G(P)$ 中与其 Brauer 对应的块，则 $|\operatorname{Irr}_0(B)| = |\operatorname{Irr}_0(b)|$（$\operatorname{Irr}_0$ 表示高为零的不可约特征标）。**Broue 猜想**（1990）进一步断言：若 $B$ 的亏群 $D$ 是 Abel 群，则 $B$ 与 $N_G(D)$ 中对应的块 $b$ 之间的导出范畴等价（splendid Rickard 等价），这是一类高度非平凡的范畴等价，已在可解群和对称群等情形下得到验证。**Gabriel 定理**和**箭图表示论**（Auslander-Reiten 1970s）为有限维代数的表示论提供了 Auslander-Reiten 箭图和几乎分裂序列（almost split sequences）的组合工具，将有限群表示论中的模结构翻译为箭图的组合数据。**Dade 猜想**（1990s）则通过投射模的链复形给出了有限群表示论与同伦论之间的深刻联系，Dade 群的构造是有限群论中最重要的不变量之一。

---

---

## 第98章：代数群表示
代数群表示论是表示论从有限群到代数几何的自然推广。线性代数群是代数闭域上的仿射代数簇，同时具有群结构，典型的例子包括一般线性群 $\operatorname{GL}_n$、特殊线性群 $\operatorname{SL}_n$、正交群和辛群等。与有限群表示论不同，代数群的表示论充分利用了代数几何的工具（如层上同调、Borel-Weil-Bott 定理），并与根系和 Weyl 群等组合结构紧密相连。代数群的不可约表示分类由最高权理论完成（Cartan-Weyl）：每个支配权 $\lambda$ 对应唯一的不可约模 $L(\lambda)$，其维数由 Weyl 维数公式给出，特征标由 Weyl 特征标公式刻画。这一理论是 20 世纪数学的巅峰成就之一，E. Cartan、H. Weyl、C. Chevalley 和 A. Borel 等人做出了奠基性贡献。代数群表示论的另一重大进展是特征 $p>0$ 域上的正特征表示论——Frobenius 态射的引入使得表示论呈现出全新的现象，Steinberg 张量积定理和 Lusztig 猜想是这一方向的核心成果。代数群表示论还与数论（Deligne-Lusztig 理论将有限约化群的表示与 $\ell$-进上同调联系起来）、几何表示论（Springer 对应通过幂零轨道实现 Weyl 群的表示）和 Langlands 纲领有着深刻的交叉。

### 223.1 线性代数群基础

**定义 223.1**（线性代数群）：**线性代数群** $G$ 是代数闭域 $k$ 上的仿射代数簇，带有群运算（乘法 $G \times G \to G$ 和取逆 $G \to G$），使得运算是代数簇的态射。

**定义 223.2**（Borel 子群与极大环面）：代数群 $G$ 的 **Borel 子群** $B$ 是 $G$ 的极大连通可解子群。$B$ 的**极大环面** $T \subset B$ 是 $B$ 的极大环面子群（同构于 $(\mathbb{G}_m)^n$）。$T$ 的**特征标群** $X(T) = \operatorname{Hom}(T, \mathbb{G}_m)$ 是自由 Abel 群（秩 $= \dim T$）。

**定理 223.1**（Borel 不动点定理）：若连通可解代数群 $G$ 作用在完备代数簇 $X$ 上，则 $G$ 在 $X$ 上有不动点。

**证明**：对 $\dim G$ 归纳。若 $\dim G = 0$，则 $G \cong \{e\}$，平凡。设 $G_1 \subset G$ 为余维数 1 的正规子群（存在性由 $G$ 可解得），则 $G/G_1 \cong \mathbb{G}_a$ 或 $\mathbb{G}_m$。归纳假设 $G_1$ 在 $X$ 上有不动点集 $X^{G_1} \neq \varnothing$，且 $X^{G_1}$ 为完备（闭子簇）。$G/G_1$ 作用于 $X^{G_1}$。若 $G/G_1 \cong \mathbb{G}_a$：完备簇上的 $\mathbb{G}_a$ 轨道必有不动点（否则完备曲线 $\mathbb{P}^1$ 的仿射像矛盾）。若 $G/G_1 \cong \mathbb{G}_m$：完备簇上 $\mathbb{G}_m$ 作用的极限点给出不动点。 $\blacksquare$

**定理 223.2**（Bruhat 分解）：$G = \bigsqcup_{w \in W} B w B$，其中 $W = N_G(T)/T$ 是 Weyl 群。Bruhat 分解是代数群表示论的核心工具。

**证明**：由 Borel 子群结构 $B = T \cdot U$（$U$ 幂幺）。利用 $G$ 在旗簇 $G/B$ 上的作用及 Schubert 胞腔分解：$G/B = \bigsqcup_{w \in W} B w B / B$。每个 $B w B / B \cong \mathbb{A}^{\ell(w)}$。取原像即得 $G = \bigsqcup_w B w B$。不交性来自 Weyl 群的 Bruhat 序与双陪集的严格分层。 $\blacksquare$

### 223.2 最高权理论

**定义 223.3**（支配权与最高权模）：设 $G$ 是连通约化代数群，选定 Borel 子群 $B \supset T$。**权** $\lambda \in X(T)$ 是**支配的**（dominant），如果 $\langle \lambda, \alpha^\vee \rangle \geq 0$（对所有正根 $\alpha$）。对每个支配权 $\lambda$，存在唯一的不可约 $G$-模 $L(\lambda)$，其最高权为 $\lambda$。

**定义 223.4**（诱导模 / Weyl 模与对偶 Weyl 模）：对支配权 $\lambda$，**Weyl 模** $\Delta(\lambda)$ 定义为 $\operatorname{ind}_B^G(k_\lambda)$（$k_\lambda$ 是 $B$ 的一维表示）。$L(\lambda)$ 是 $\Delta(\lambda)$ 的唯一不可约商。

**定理 223.3**（Weyl 特征标公式）：不可约表示 $L(\lambda)$ 的特征标为

$$\chi(\lambda) = \frac{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\lambda + \rho)}}{\sum_{w \in W} (-1)^{\ell(w)} e^{w\rho}}$$

其中 $\rho$ 是正根的一半之和，$\ell(w)$ 为 $w$ 的长度。（这里 $\rho$ 为所有正根之和的一半，Weyl 群的 dot action 定义为 $w \cdot \lambda = w(\lambda + \rho) - \rho$。）这是表示论中最优美的公式之一。

**证明**：Euler-Poincare 原理用于 Borel-Weil-Bott 定理：$\chi(\lambda) = \sum_i (-1)^i \operatorname{ch} H^i(G/B, \mathcal{L}(\lambda))$。由 Bott 定理，仅当 $i = \ell(w)$ 时 $H^i$ 非零（$w \in W$ 满足 $w \cdot \lambda$ 为支配权的对偶）。重排求和得 $\chi(\lambda) = \frac{\sum_w (-1)^{\ell(w)} e^{w(\lambda+\rho)-\rho}}{\prod_{\alpha>0}(1-e^{-\alpha})}$，分子分母同乘 $e^\rho$，分母用 Weyl 分母公式 $\sum_w (-1)^{\ell(w)} e^{w\rho} = e^\rho \prod_{\alpha>0} (1-e^{-\alpha})$ 即得。 $\blacksquare$

**定理 223.4**（Weyl 维数公式）：$\dim L(\lambda) = \prod_{\alpha > 0} \frac{\langle \lambda + \rho, \alpha^\vee \rangle}{\langle \rho, \alpha^\vee \rangle}$。

**证明**：在 Weyl 特征标公式中取 $e^\mu = 1$（求值于单位元），应用 L'Hopital 规则得 $\dim L(\lambda) = \frac{\prod_{\alpha>0} \langle \lambda+\rho, \alpha^\vee \rangle}{\prod_{\alpha>0} \langle \rho, \alpha^\vee \rangle}$。由 Weyl 分母公式 $\sum_w (-1)^{\ell(w)} e^{w\rho} = \prod_{\alpha>0} (e^{\alpha/2} - e^{-\alpha/2})$，在 $e^\mu \to 1$ 时各因式 $\langle \rho, \alpha^\vee \rangle$ 自然出现。 $\blacksquare$

### 223.3 Kempf 消失定理与上同调

**定义 223.5**（旗簇与诱导层）：$G/B$ 是**旗簇**（flag variety），是光滑射影簇。对权 $\lambda$，$G \times^B k_\lambda$ 是 $G/B$ 上的可逆层 $\mathcal{L}(\lambda)$。

**定理 223.5**（Borel-Weil-Bott 定理）：不可约 $G$-模 $L(\lambda)$ 可通过旗簇上可逆层的上同调实现：
- $H^0(G/B, \mathcal{L}(\lambda)) \cong L(\lambda)^*$（若 $\lambda$ 是支配权）
- 对非支配权，上同调消失或给出其他不可约表示（Bott 的精细公式）

**证明**（Borel-Weil-Bott）：支配权 $\lambda$ 时，由 Kempf 消失 $H^{>0}(G/B, \mathcal{L}(\lambda)) = 0$，而 $H^0 \cong \nabla(\lambda)$（对偶 Weyl 模），其对偶为 $L(\lambda)^*$。非支配权 $\mu$ 时，由 Bott 定理，唯一非零上同调在 $i = \ell(w)$（$w \cdot \mu$ 支配），此时 $H^{\ell(w)}(G/B, \mathcal{L}(\mu)) \cong L(w \cdot \mu)^*$。 $\blacksquare$

**定理 223.6**（Kempf 消失定理，1976）：若 $\lambda$ 是支配权，则 $H^i(G/B, \mathcal{L}(\lambda)) = 0$（对所有 $i > 0$）。这是 Borel-Weil-Bott 定理的特例，是射影簇上丰沛线丛消失定理的推广。

**证明**：$\lambda$ 支配时 $\mathcal{L}(\lambda)$ 为丰沛线丛。特征 $0$ 由 Kodaira 消失定理直接给出 $H^{>0}(G/B, \mathcal{L}(\lambda))=0$。正特征下，Kempf 利用 Frobenius 分裂证明：支配权 $\lambda$ 对应的 $\mathcal{L}(\lambda)$ 在 $\operatorname{Gr}$ 上诱导 Frobenius 分裂结构，从而所有正上同调消失。Andersen 随后推广到任意支配权。 $\blacksquare$

**定义 223.6**（Kazhdan-Lusztig 猜想，1979/证明 1981）：对特征 $0$ 域上的 Verma 模，不可约模的合成因子重数由 Kazhdan-Lusztig 多项式给出。Brylynski-Kashiwara（1981）和 Beilinson-Bernstein（1981）通过 $\mathcal{D}$-模和相交上同调证明了该猜想。

### 223.4 正特征表示论

**定义 223.7**（正特征表示论 / 特征 $p$ 的代数群表示）：在特征 $p > 0$ 的代数闭域上，代数群表示论与特征 $0$ 有本质不同。Frobenius 态射 $F: G \to G$ 引入新的表示（Frobenius 扭）。

**定理 223.7**（Steinberg 张量积定理）：对特征 $p$ 域上的单连通半单代数群 $G$，不可约 $G$-模的结构为

$$L(\lambda) = L(\lambda_0) \otimes L(\lambda_1)^{(1)} \otimes L(\lambda_2)^{(2)} \otimes \cdots$$

其中 $\lambda = \lambda_0 + p\lambda_1 + p^2\lambda_2 + \cdots$ 是 $\lambda$ 的 $p$-adic 展开，$L(\mu)^{(r)}$ 是 $F^r$-扭表示。

**证明**：设 $\lambda = \sum_{i=0}^m p^i\lambda_i$ 为 $p$-adic 展开（$\lambda_i$ 为限制支配权）。Frobenius 态射 $F: G \to G$ 诱导扭函子 $(-)^{(1)}$。由 Steinberg 定理，自然映射 $L(\lambda_0) \otimes L(\lambda_1)^{(1)} \otimes \cdots \otimes L(\lambda_m)^{(m)} \to L(\lambda)$（由各因子的最高权向量在张量积中的像生成）为同构。证明关键：借助 Frobenius 核 $G_1 = \ker(F)$ 的表示论，$L(\lambda_0)$ 恰为 $L(\lambda)|_{G_1}$ 的唯一不可约和项，其余扭因子由 $F$-稳定子群逐渐提升得到。 $\blacksquare$

**定理 223.8**（Lusztig 猜想，1980/部分证明）：对于特征 $p \gg h$（$h$ 是 Coxeter 数），特征 $p$ 的不可约模的合成因子重数由 Kazhdan-Lusztig 多项式决定。Lusztig 猜想在 $p \gg 0$ 时成立（Andersen-Jantzen-Soergel 1994），但存在反例证明 $p$ 需要相当大。

**证明**：Andersen-Jantzen-Soergel 通过 Soergel 双模和量子群在 $\ell$-次本原单位根处的限制对偶建立正特征表示论到特征 $0$ Kazhdan-Lusztig 理论的传递。核心为 Soergel 的 Struktursatz：射影-入射包络的自同态环同构于 coinvariant 代数 $C_W$ 的特定商。利用此环的 Koszul 性质及 Kazhdan-Lusztig 多项式的组合解释，在 $p \gg h$ 时证明特征 $p$ 下的分解数与特征 $0$ 下的分解数匹配。Williamson 后来的反例表明对某些类型的李代数 $p$ 需要远大于 Coxeter 数。 $\blacksquare$

### 代数群表示论的现代前沿

代数群表示论在最高权理论的基础上，20 世纪下半叶发展出了多个与代数几何和数论交叉的前沿方向。**Deligne-Lusztig 理论**（1976）是有限约化群表示论的一场革命：对有限域 $\mathbb{F}_q$ 上的约化群 $G(\mathbb{F}_q)$，Deligne 和 Lusztig 通过 $\ell$-进上同调构造了虚拟表示 $R_T^\theta$（$T$ 为极大环面，$\theta$ 为 $T(\mathbb{F}_q)$ 的特征标），其不可约分量构成了 $G(\mathbb{F}_q)$ 的几乎所有不可约表示。这一理论将有限群表示论与代数几何的深层结构联系起来，Lusztig 的分类定理（1984）最终完成了 $G(\mathbb{F}_q)$ 所有不可约特征标的分类——这被公认为 20 世纪最伟大的数学成就之一。**Kazhdan-Lusztig 多项式**（1979）不仅解决了 Verma 模的合成因子问题，还通过 Hecke 代数的基的构造（Kazhdan-Lusztig 基）为 Coxeter 群的表示论提供了全新的组合工具。**Soergel 双模**（1990s）是范畴化（categorification）表示论的关键工具，它将 Hecke 代数范畴化为 $\mathbb{Z}$-分次双模范畴，从而将 Kazhdan-Lusztig 多项式提升为分次维数（graded dimension）。**几何表示论**中的**仿射 Hecke 代数**和**分次仿射 Hecke 代数**（Lusztig 1980s-1990s）将代数群表示论与 Springer 对应和仿射 Weyl 群的表示论联系起来，为 Langlands 纲领中的局部 Langlands 对应提供了代数模型。**正特征表示论**的最新进展（Williamson 2010s）揭示了 Lusztig 猜想在 "小 $p$" 情形下的反例，修正了我们对模表示论中分解数的理解，并催生了**双 Sobolev 模**（Tilting 模）和**p-正则表示论**的新理论。

---

---

## 第99章：几何表示论
几何表示论是 20 世纪末表示论领域的一场范式革命，其核心思想是：通过代数几何的工具——旗簇、幂零锥、仿射 Grassmann 流形和箭图簇等几何对象的拓扑和层论——来构造和研究代数结构（群、李代数、量子群）的表示。这一方向的起源可以追溯到 Springer 在 1970 年代的奠基性工作：他发现 Weyl 群在 Springer 纤维的上同调上的作用（Springer 表示）实现了 Weyl 群的所有不可约表示，从而将代数群的幂零轨道与 Weyl 群的表示论联系起来。Kazhdan-Lusztig 理论（1979）则通过 Schubert 簇的相交上同调彻底解决了 Verma 模的合成因子问题——Kazhdan-Lusztig 多项式恰好编码了奇异空间的局部拓扑信息。几何 Satake 等价（Lusztig、Ginzburg、Mirkovic-Vilonen）是几何表示论中最优美的成果之一：它建立了仿射 Grassmann 流形上的反常层范畴与 Langlands 对偶群 $G^\vee$ 的表示范畴之间的等价，为数论中的 Langlands 纲领提供了几何模型。Nakajima 的箭图簇理论（1998）则通过辛约化构造了 Kac-Moody 代数的可积表示，将几何表示论推广到无限维李代数的范畴。这些进展使得几何表示论成为连接表示论、代数几何、辛几何和数学物理的核心桥梁。

### 224.1 Springer 理论

**定义 224.1**（Springer 纤维 / Springer 解消）：设 $G$ 是约化代数群，$\mathfrak{g} = \operatorname{Lie}(G)$，$\mathcal{N} \subset \mathfrak{g}$ 是幂零锥。**Springer 解消**是态射 $\pi: \tilde{\mathcal{N}} = \{(x, B) : x \in \operatorname{Lie}(B) \cap \mathcal{N}\} \to \mathcal{N}$。对 $x \in \mathcal{N}$，$\pi^{-1}(x)$ 是 **Springer 纤维** $\mathcal{B}_x$（包含 $x$ 的 Borel 子代数的旗簇）。

**定理 224.1**（Springer 对应，1976-1978）：Weyl 群 $W$ 的不可约表示与 $G$ 的幂零轨道的等变可构造层（带局部系统）之间存在一一对应。$W$ 在 $H^*(\mathcal{B}_x)$ 上的作用（Springer 表示）实现了 $W$ 的所有不可约表示。

**证明**：Springer 解消 $\pi: \tilde{\mathcal{N}} \to \mathcal{N}$ 的直像层 $R\pi_*\underline{\mathbb{Q}}_\ell$ 是 $\mathcal{N}$ 上的反常层。$G$-等变结构给出 Weyl 群 $W$ 在 $R\pi_*\underline{\mathbb{Q}}_\ell$ 上的作用。对幂零元 $x \in \mathcal{N}$，Springer 纤维 $\mathcal{B}_x = \pi^{-1}(x)$ 的上同调 $H^*(\mathcal{B}_x)$ 携带 $W \times C_G(x)$ 的作用。该作用按 $x$ 的 $G$-轨道分解，每个轨道上的局部系统贡献 $W$ 的不可约表示。特别地，正则幂零轨道对应 $W$ 的平凡表示，次正则轨道对应反射表示，零轨道给出正则表示。 $\blacksquare$

**定义 224.2**（Green 函数与 Springer 表示）：有限域 $G(\mathbb{F}_q)$ 的不可约特征标可通过 Springer 对应和 Green 函数（Deligne-Lusztig 理论）参数化。

### 224.2 相交上同调与 Kazhdan-Lusztig 理论

**定义 224.3**（相交上同调 / Intersection Cohomology，Goresky-MacPherson 1980）：对奇异空间 $X$，**相交上同调** $IH^*(X)$ 是满足 Poincaré 对偶的「修正」上同调理论。由中间扩展（intermediate extension）的可构造层 $\mathbf{IC}(X)$ 的超上同调给出。

**定义 224.4**（Schubert 簇与 Kazhdan-Lusztig 多项式）：旗簇 $G/B$ 的 **Schubert 簇** $X_w = \overline{B w B / B}$（$w \in W$）。**Kazhdan-Lusztig 多项式** $P_{x,w}(q)$ 编码了 $X_w$ 沿 $B x B / B$ 的局部相交上同调 Poincaré 多项式。

**定理 224.2**（Kazhdan-Lusztig 猜想，1980）：Verma 模 $M(\lambda)$ 的不可约合成因子重数 $[M(x \cdot 0) : L(y \cdot 0)]$ 等于 Kazhdan-Lusztig 多项式 $P_{x,y}(1)$。由 Beilinson-Bernstein 和 Brylynski-Kashiwara（1981）通过 $\mathcal{D}$-模和 Riemann-Hilbert 对应证明。

**证明**：Beilinson-Bernstein 局部化将 $\mathfrak{g}$-模范畴等同于旗簇 $G/B$ 上 $\mathcal{D}$-模的范畴，Verma 模对应于 $\delta$-函数 $\mathcal{D}$-模沿 Schubert 胞腔的标准延拓。Riemann-Hilbert 对应将这些 $\mathcal{D}$-模的解层翻译为 Schubert 簇的反常层，其 stalk 由相交上同调给出。而 Schubert 簇沿小胞腔的局部相交上同调的 Poincare 多项式恰为 Kazhdan-Lusztig 多项式 $P_{x,w}$，其常数项 $P_{x,w}(1)$ 即为所求的重数。 $\blacksquare$

**定义 224.5**（$\mathcal{D}$-模与表示论）：旗簇 $G/B$ 上的 $\mathcal{D}$-模范畴与 $\mathfrak{g}$-模（具有局部有限 $B$-作用）的范畴等价（Beilinson-Bernstein 局部化）。这是几何表示论的核心结果。

### 224.3 几何 Satake 对应

**定义 224.6**（仿射 Grassmann 流形）：对代数闭域 $k$ 上的约化群 $G$，**仿射 Grassmann 流形** $\operatorname{Gr}_G = G(k((t))) / G(k[[t]])$（$k((t))$ 是 Laurent 级数域，$k[[t]]$ 是形式幂级数环）。$\operatorname{Gr}_G$ 是无穷维 ind-射影簇。

**定义 224.7**（几何 Satake 等价，Lusztig 1983, Ginzburg 1995, Mirković-Vilonen 2007）：存在范畴等价

$$\operatorname{Perv}_{G(k[[t]])}(\operatorname{Gr}_G) \cong \operatorname{Rep}(G^\vee)$$

其中 $G^\vee$ 是 $G$ 的 Langlands 对偶群，$\operatorname{Perv}$ 是反常层（perverse sheaves）范畴。几何 Satake 将 $G$ 的几何对象与 $G^\vee$ 的表示范畴联系起来。

**定理 224.3**（几何 Satake 的推论）：仿射 Grassmann 流形上 $G(k[[t]])$-等变反常层的超上同调给出 $G^\vee$ 的表示的几何构造。卷积积对应于表示的张量积。

**证明**：由几何 Satake 等价的函子性，反常层 $\mathcal{F} \in \operatorname{Perv}_{G(k[[t]])}(\operatorname{Gr}_G)$ 的全局截面超上同调 $H^*(\operatorname{Gr}_G, \mathcal{F})$ 自然具有 $G^\vee$-模结构。卷积积 $\mathcal{F}_1 \star \mathcal{F}_2 = m_*(\mathcal{F}_1 \tilde{\otimes} \mathcal{F}_2)$（$m: G((t)) \times_{G[[t]]} \operatorname{Gr}_G \to \operatorname{Gr}_G$ 为卷积映射）在等价的函子下对应于表示张量积。球面函数层的卷积环同构于 $G^\vee$ 的表示环。 $\blacksquare$

### 224.4 箭图簇与表示论

**定义 224.8**（箭图簇 / Quiver Variety，Nakajima 1998）：**箭图簇** $\mathfrak{M}(\mathbf{v}, \mathbf{w})$ 是箭图 $Q$ 的双重（double）表示模空间的辛约化。箭图簇是超 Kähler 流形。

**定理 224.4**（Nakajima 定理）：箭图簇的拓扑 Borel-Moore 同调实现了 Kac-Moody 代数的可积最高权表示。具体地，$\bigoplus_{\mathbf{v}} H_*^{\operatorname{BM}}(\mathfrak{M}(\mathbf{v}, \mathbf{w}))$ 具有 $\mathfrak{g}(Q)$ 的最高权 $\mathbf{w}$ 的可积表示结构。

**证明**：Nakajima 构造了箭图簇 $\mathfrak{M}(\mathbf{v}, \mathbf{w})$ 之间的 Hecke 对应 $\mathfrak{M}(\mathbf{v}, \mathbf{v}\prime, \mathbf{w})$，在其 Borel-Moore 同调上定义 Chevalley 生成元 $E_i, F_i$ 的作用（通过对应映射的上同调拉回和推前）。$K_i$ 的作用由维数向量 $\mathbf{v}$ 的移位给出。验证这些算子满足 Kac-Moody 代数的 Serre 关系，关键利用箭图簇的辛几何结构及 Nakajima 的消没定理。最高权向量对应 $\mathbf{v} = 0$ 的单点 Borel-Moore 同调，其权为 $\mathbf{w}$。 $\blacksquare$

**定义 224.9**（箭图簇与几何表示论的联系）：箭图簇为仿射量子群、杨振宁代数和 $\mathcal{W}$-代数的表示提供了统一的几何框架。Nakajima 的箭图簇理论是几何表示论的基础工具。

### 几何表示论的前沿扩展

几何表示论在 21 世纪继续向多个方向扩展，成为连接代数、几何和物理的核心桥梁。**范畴化**（categorification）是几何表示论中最深刻的思想之一：将数（如维数、重数、特征标值）提升为向量空间或范畴，将代数等式（如 $U_q(\mathfrak{g})$ 的 Serre 关系）提升为函子之间的自然同构。Khovanov 和 Lauda（2006-2009）通过 **Khovanov-Lauda-Rouquier 代数**（KLR 代数或箭图 Hecke 代数）范畴化了量子群 $U_q(\mathfrak{g})$ 及其可积表示，将量子群提升为分次代数的表示范畴。**仿射 Springer 纤维**（Goresky-Kottwitz-MacPherson 2006）是 Springer 理论在仿射 Weyl 群情形的推广，其 $\ell$-进上同调实现了仿射 Hecke 代数的表示，与局部 Langlands 对应中的深度零（depth zero）表示密切相关。**Bezrukavnikov 的仿射 Springer 对应**（2006）建立了仿射 Springer 纤维的等变 K-理论到仿射 Hecke 代数表示的范畴等价，为几何 Langlands 纲领中的局部部分提供了关键构造。**Coulomb 分支**（Braverman-Finkelberg-Nakajima 2016）将箭图簇的 Borel-Moore 同调与 Coulomb 分支的相交上同调联系起来，建立了 3d $\mathcal{N}=4$ 超对称规范理论中 Higgs 分支和 Coulomb 分支的数学对偶，这是 Symplectic 对偶（symplectic duality）——一种新的数学对偶原理——的核心实例。**BPS 代数**（Davison 2016）通过箭图簇的 Borel-Moore 同调上的 Hall 代数结构构造了 Kac-Moody 代数的量子包络代数的范畴化，将箭图簇的计数不变量（如 Donaldson-Thomas 不变量）与量子群表示论联系起来。这些发展表明，几何表示论已经成为现代数学中一个高度统一的领域，融合了代数几何、辛几何、表示论和数学物理的方法。

---

---

## 第100章：Langlands 纲领深化
Langlands 纲领是 Robert Langlands 在 1967 年提出的宏大数学猜想体系，被公认为当代数学中最具统一性和深远影响力的纲领之一。其核心思想可以简洁地表述为：数论中的 Galois 表示与调和分析中的自守表示之间存在深刻的双射对应——即"Galois 对称性"与"谱对称性"的统一。局部 Langlands 对应（LLC）是这一纲领在局部域上的精确表述：对于 $p$-进域 $F$ 上的约化群 $G(F)$，其不可约光滑表示与 Weil-Deligne 群到 Langlands 对偶群 $G^\vee$ 的 $L$-参数之间存在一一对应。对于 $G=\operatorname{GL}_n$，该对应已被 Harris-Taylor（2001）和 Henniart（2000）完全证明。整体 Langlands 纲领则进一步要求这些局部对应在整体自守表示的所有局部成分上兼容，并通过自守 $L$-函数与动机 $L$-函数的等式建立起数论与分析之间的桥梁。Arthur-Selberg 迹公式是这一纲领的核心计算工具——它将 $L^2(G(\mathbb{Q})\backslash G(\mathbb{A}))$ 上正则表示的迹分解为谱和（自守表示的特征标）与几何和（轨道积分），其稳定化是 Ngo（2010 年 Fields 奖）证明基本引理的关键技术。几何 Langlands 纲领（Beilinson-Drinfeld）则通过代数曲线上的 $\mathcal{D}$-模与 $G^\vee$-局部系统的范畴等价，为传统 Langlands 纲领提供了深刻的几何解释。

### 226.1 局部 Langlands 对应

**定义 226.1**（局部域与局部 Langlands 对应）：设 $F$ 是局部域（$\mathbb{R}$、$\mathbb{C}$ 或 $\mathbb{Q}_p$ 的有限扩张）。**局部 Langlands 对应**（LLC）断言 $G(F)$ 的不可约光滑表示与 Weil-Deligne 群 $W_F'$ 到 Langlands 对偶群 $G^\vee(\mathbb{C})$ 的 $L$-参数之间存在一一对应。

**定理 226.1**（$\operatorname{GL}_n$ 的局部 Langlands 对应，Harris-Taylor 2001, Henniart 2000）：$\operatorname{GL}_n(F)$ 的不可约光滑超尖表示与 $n$ 维 Frobenius 半单 Weil-Deligne 表示之间存在一一对应，保持 $L$-因子和 $\varepsilon$-因子。

**证明**：Harris-Taylor 通过 Shtuka 模空间和 p-adic 完备 unitary 型 Shimura 簇的整体-局部兼容性证明。局部方面，构造函子将 Weil-Deligne 表示 $\rho$ 与 $\operatorname{GL}_n(F)$ 的表示 $\pi(\rho)$ 关联：$\rho$ 的 Rankin-Selberg $L$-函数与 $\pi(\rho)$ 的 Godement-Jacquet $L$-函数一致。Henniart 的数值局部 Langlands 定理通过 Brauer 形式化验证了该对应的双射性，并证明了 $L$ 和 $\varepsilon$-因子在对应下的兼容性。 $\blacksquare$

**定义 226.2**（$L$-参数与 $L$-包）：一般约化群 $G$ 的 $L$-参数 $\varphi: W_F' \to {}^L G$ 确定一个 $L$-包 $\Pi_\varphi$（不可约表示的有限集）。$L$-包内的表示由 $\varphi$ 的中心化子 $S_\varphi$ 的不可约表示参数化。

**定理 226.2**（$\operatorname{GL}_n$ 的局部 Langlands 对应对 $L$-函数和 $\varepsilon$-因子的保持）：对 $\operatorname{GL}_n \times \operatorname{GL}_m$ 的 Rankin-Selberg $L$-函数，局部 Langlands 对应保持局部 $L$-函数和 $\varepsilon$-因子。

**证明**：设 $\pi_1, \pi_2$ 为 $\operatorname{GL}_n(F)$ 和 $\operatorname{GL}_m(F)$ 的不可约光滑表示，$\rho_1, \rho_2$ 为对应的 Weil-Deligne 表示。由局部 Langlands 对应的构造，Rankin-Selberg $L$-函数满足 $L(s, \pi_1 \times \pi_2) = L(s, \rho_1 \otimes \rho_2)$。$\varepsilon$-因子的匹配通过非分歧情形（Satake 参数与 Frobenius 特征值的匹配）及分歧情形的 Jacquet-Piatetski-Shapiro-Shalika 积分表示完成。 $\blacksquare$

### 226.2 整体 Langlands 纲领

**定义 226.3**（自守表示与 $L$-函数）：设 $G$ 是 $\mathbb{Q}$ 上的约化代数群，$\mathbb{A}$ 是 $\mathbb{Q}$ 的 Adele 环。**自守表示** $\pi$ 是 $G(\mathbb{A})$ 在 $L^2(G(\mathbb{Q}) \backslash G(\mathbb{A}))$ 上的不可约成分。$\pi$ 的**自守 $L$-函数** $L(s, \pi, r)$ 是 Euler 乘积（$r$ 是 ${}^L G$ 的有限维表示）。

**定理 226.3**（整体 Langlands 函子性猜想）：对 $L$-同态 $\eta: {}^L H \to {}^L G$，存在自守表示的「提升」映射（函子性转移），将 $H(\mathbb{A})$ 的自守表示映为 $G(\mathbb{A})$ 的自守表示，并保持 $L$-函数。

**证明**（已证情形的思路）：对 $H = \operatorname{GL}_n$，Arthur 的稳定迹公式将 $L$-同态 $\eta$ 转化为迹公式几何边中轨道积分的比较。Ngo 的基本引理（2010）解决了轨道积分匹配的关键障碍。特定情形中，$\operatorname{GL}_n \times \operatorname{GL}_m \to \operatorname{GL}_{nm}$ 对应 Rankin-Selberg 积的函子性（已证）；$\operatorname{SO}_{2n+1} \to \operatorname{GL}_{2n}$ 由 Arthur 2013 分类定理解决；函数域情形由 Lafforgue 2002 完成。 $\blacksquare$

*函子性猜想的简要描述*：Langlands 的函子性原理断言，任意两个约化群 $H$ 和 $G$ 的 $L$-群之间的代数同态 $\eta: {}^L H \to {}^L G$ 诱导自守表示范畴之间的函子 $\eta_*: \mathcal{A}(H) \to \mathcal{A}(G)$，满足 $L(s, \pi, r \circ \eta) = L(s, \eta_*(\pi), r)$ 对任意 ${}^L G$ 的有限维表示 $r$。这意味着 $L$-群的同态"提升"了自守形式，将较小的群上的自守表示"转移"到较大的群上。当 $G = \operatorname{GL}_n$ 时，该猜想已由 Arthur 等人通过稳定迹公式在若干情形下得到证明；对一般的 $G$，Langlands 函子性原理仍然是 Langlands 纲领中最核心的未完全解决的问题，Ngô 的基本引理证明（2010）为此提供了关键技术基础。∎

**定义 226.4**（Langlands 纲领的核心猜想）：
1. **局部-整体相容性**：整体自守表示在所有局部点的局部分量通过局部 Langlands 对应与整体 Galois 表示兼容
2. **Ramanujan-Petersson 猜想**：尖点自守表示在非分歧点处的局部 Satake 参数是幺模的
3. **广义 Riemann 猜想**：自守 $L$-函数 $L(s, \pi)$ 的所有非平凡零点在 $\Re(s) = 1/2$ 上

### 226.3 Arthur-Selberg 迹公式

**定义 226.5**（Arthur-Selberg 迹公式）：**Arthur-Selberg 迹公式**是 $L^2(G(\mathbb{Q}) \backslash G(\mathbb{A}))$ 上正则表示的迹的等式，一边是谱和（自守表示的特征标），另一边是几何和（轨道积分）。它是 Poisson 求和公式在非交换调和分析中的推广。

**定理 226.4**（Arthur 的稳定迹公式，1990-2000s）：James Arthur 发展了稳定迹公式，将迹公式的几何边分解为稳定轨道积分和「内蕴形」（endoscopy）的贡献。这为一般群的 Langlands 函子性提供了基础框架。

**证明**：Arthur 将 Selberg 迹公式的几何边 $I_{\text{geom}}(f)$ 按共轭类分解为轨道积分 $\Phi_M(\gamma, f)$ 的加权和。稳定迹公式将轨道积分分解为稳定部分 $\Phi_M^{\text{st}}(\gamma, f)$ 与内蕴形传递因子 $\Delta(\gamma_H, \gamma)$。核心结构为 $I_{\text{geom}}(f) = \sum_{M, \gamma} |W^G(M)|^{-1} \Phi_M(\gamma, f) = \sum_{H \text{ endo}} \iota(G, H) I_{\text{geom}}^H(f^H)$，其中 $H$ 遍历 $G$ 的所有椭圆内蕴群，$\iota(G,H)$ 为 Langlands-Shelstad 传递因子。 $\blacksquare$

**定理 226.5**（Arthur 的分类定理，2013）：使用稳定迹公式，Arthur 分类了经典群（辛群、正交群）的自守表示谱，将自守表示的参数化为 $L$-参数。

**证明**：Arthur 将稳定迹公式应用于 $\operatorname{SO}_{2n+1}, \operatorname{Sp}_{2n}, \operatorname{SO}_{2n}$ 与 $\operatorname{GL}_N$（其中 $N = 2n$ 或 $2n+1$）的比较。利用扭曲迹公式（twisted trace formula），构造从经典群到 $\operatorname{GL}_N$ 的函子性提升。通过分析谱边的剩余谱和尖点谱，Arthur 证明了每个离散自守表示 $\pi$ 对应一个参数 $\psi: \mathcal{L}_F \times \operatorname{SL}_2(\mathbb{C}) \to {}^L G$，且 $\pi$ 的局部分量由 $\psi$ 通过局部 Langlands 对应唯一确定。 $\blacksquare$

**定义 226.6**（迹公式与 Langlands 纲领的联系）：迹公式是 Langlands 函子性猜想的核心计算工具。特别是，通过迹公式的比较（Fundamental Lemma），可以证明自守表示的函子性转移。

### 226.4 几何 Langlands 纲领

**定义 226.7**（几何 Langlands 纲领，Beilinson-Drinfeld 1990s）：**几何 Langlands 纲领**是 Langlands 纲领的代数几何类比。设 $X$ 是 $\mathbb{C}$ 上的光滑射影代数曲线，$G$ 是约化代数群。几何 Langlands 猜想断言存在范畴等价：

$$\mathcal{D}\text{-}\operatorname{Mod}(\operatorname{Bun}_G) \cong \operatorname{QCoh}(\operatorname{LocSys}_{G^\vee})$$

其中 $\operatorname{Bun}_G$ 是 $X$ 上 $G$-主丛的模叠，$\operatorname{LocSys}_{G^\vee}$ 是 $X$ 上 $G^\vee$-局部系统的模叠。

**定理 226.6**（几何 Langlands 的进展）：
- $\operatorname{GL}_1$ 的几何 Langlands：由 Laumon（1987）和 Rothstein（1996）证明（等价于 Abel-Jacobi 映射和 Fourier-Mukai 变换）
- 一般 $G$ 的几何 Langlands：Arinkin-Gaitsgory（2015）证明了 de Rham 版本的几何 Langlands 猜想（奇异支集定理）
- 几何 Langlands 与 S-对偶性：Kapustin-Witten（2007）将几何 Langlands 解释为 $\mathcal{N}=4$ 超 Yang-Mills 理论的电磁对偶

**证明**：$\operatorname{GL}_1$ 情形：$\operatorname{Bun}_{\operatorname{GL}_1} \cong \operatorname{Pic}(X)$，$\operatorname{LocSys}_{\operatorname{GL}_1} \cong \operatorname{Pic}^\tau(X) \times H^1(X, \mathcal{O}_X)$，等价的函子为 Abel-Jacobi 映射与 Fourier-Mukai 变换。一般 $G$ 的 de Rham 版本：Arinkin-Gaitsgory 证明了从 $\operatorname{QCoh}(\operatorname{LocSys}_{G^\vee})$ 到 $\mathcal{D}\text{-Mod}(\operatorname{Bun}_G)$ 的函子是满足连续性的忠实函子；反过来，利用奇异支集的条件证明了对 Hecke eigen-$\mathcal{D}$-模的满性，从而建立等价。Kapustin-Witten 的物理解释提供了该对应源自 4d $\mathcal{N}=4$ SYM 紧化的电磁对偶。 $\blacksquare$

**定义 226.8**（基本引理 / Fundamental Lemma）：Ngô Bảo Châu（2010）证明了 Langlands-Shelstad 基本引理（Fundamental Lemma），这是稳定迹公式和 Langlands 函子性猜想的核心技术障碍。Ngô 因此获得 2010 年 Fields 奖。

**定理 226.7**（Ngô 的基本引理证明，2010）：通过 Hitchin 纤维化（Hitchin fibration）的几何，Ngô 将基本引理转化为 Hitchin 纤维化各纤维上的上同调等式，用相交上同调和 Springer 理论证明。

**证明**：Ngô 考虑 Hitchin 纤维化 $h: \mathcal{M}_G \to \mathcal{A}_G$（$\mathcal{M}_G$ 为 Higgs 丛模叠，$\mathcal{A}_G$ 为 Hitchin 基）。基本引理的轨道积分等式等价于 Hitchin 纤维化在椭圆各向异性点附近的纤维上的点计数公式。Ngô 引入弧的概念，将纤维化分解为 $\delta$-正则半单部分与幂零部分。通过 Laumon 的 $\ell$-进上同调与 Springer 纤维的相交上同调的比较，证明了纤维上的上同调纯度（cleanness），从而将点计数化为上同调的迹公式比较，利用 Grothendieck-Lefschetz 迹公式完成。 $\blacksquare$

---

*本卷在 V12（抽象代数 II）和 V23（李理论）中表示论基础之上，深化了有限群模表示论（Brauer 特征标、块论、Green 对应）、代数群表示论（最高权理论、Kempf 消失定理、正特征表示论）、几何表示论（Springer 理论、Kazhdan-Lusztig 理论、几何 Satake、箭图簇）、仿射与量子群表示论（仿射 Kac-Moody 代数、顶点算子代数、量子仿射代数）和 Langlands 纲领深化（局部/整体 Langlands 对应、Arthur-Selberg 迹公式、几何 Langlands 纲领）。共 5 章。*

---

*本卷建立了李理论的核心框架：李群和李代数的基本关系（指数映射、CBH 公式、Lie 对应）将连续对称性转化为代数结构；半单李代数的分类理论（根系、Dynkin 图、Cartan-Killing 分类）是 19 世纪数学最伟大的成就之一；紧李群的表示论（Peter-Weyl 定理、最高权理论、Weyl 特征公式）为调和分析和量子力学提供了基础；齐性空间、对称空间和主丛上的联络理论将李群应用于微分几何。李理论是现代数学和物理学的核心语言，从基本粒子物理（规范理论）到数论（Langlands 纲领）都有深刻应用。**补充部分**整合了现代表示论深化，涵盖有限群模表示论（Brauer特征标、块论、Green对应）、代数群表示论（最高权理论、正特征表示论）、几何表示论（Springer理论、几何Satake、箭图簇）、仿射与量子群表示论，以及Langlands纲领深化（局部/整体对应、迹公式、几何Langlands），构建了从经典表示论到现代前沿的完整桥梁。*


*卷二十三：李理论终。*


*卷二十三：李理论终。*


*卷二十三：李理论终。*


*卷二十六：李理论终。*
---

### Hopf代数与量子群导引

Hopf 代数是同时具有代数结构和余代数结构的代数对象，两者通过双代数公理相容，并通过对极（antipode）映射实现"逆元"的对偶概念。Hopf 代数的概念由 Heinz Hopf 在 1941 年关于流形上同调环的工作中首次出现，随后在 1960-70 年代由 Sweedler、Milnor、Moore 等人发展为系统的代数理论。Hopf 代数的核心思想是自我对偶性：代数结构（乘法 $\mu$、单位 $\eta$）刻画了"如何将两个元素合并为一个"，而余代数结构（余乘法 $\Delta$、余单位 $\varepsilon$）刻画了"如何将一个元素分解为两个部分"。当这两个结构在双代数中相容时，Hopf 代数就自然地出现在群代数、包络代数、坐标环等基本例子中。

量子群是 Hopf 代数的非交换、非余交换变体，由 Drinfeld 和 Jimbo 在 1985 年独立发现，最初作为量子可积系统（Yang-Baxter 方程）的代数框架。量子群 $U_q(\mathfrak{g})$ 是李代数 $\mathfrak{g}$ 的泛包络代数 $U(\mathfrak{g})$ 的 $q$-形变，当 $q \to 1$ 时恢复经典包络代数。量子群的关键创新在于它打破了 Hopf 代数的余交换性，引入了拟三角结构（泛 R-矩阵 $\mathcal{R} \in H \otimes H$），该结构满足 Yang-Baxter 方程 $\mathcal{R}_{12}\mathcal{R}_{13}\mathcal{R}_{23} = \mathcal{R}_{23}\mathcal{R}_{13}\mathcal{R}_{12}$。这一结构使得量子群的表示范畴成为辫子幺半范畴，辫子由 $\mathcal{R}$ 通过表示作用给出。

Hopf 代数与量子群在数学物理中有着深远的影响。辫子幺半范畴提供了构造纽结和链环不变量的代数框架——通过丝带 Hopf 代数的量子迹和 Markov 迹，每个定向链环 $L$ 对应一个标量不变量 $J_{H,V}(L)$。Jones 多项式（1984）和 HOMFLY-PT 多项式正是从 $U_q(\mathfrak{sl}_2)$ 和 $U_q(\mathfrak{sl}_N)$ 的适当表示中得到的特例。此外，量子群还在共形场论（Wess-Zumino-Witten 模型）、可积系统（量子逆散射方法）和三维拓扑量子场论（Reshetikhin-Turaev 不变量）中扮演核心角色。本章将系统介绍 Hopf 代数的公理化定义、Sweedler 记号、基本例子（群代数、包络代数、坐标环）、量子群 $U_q(\mathfrak{sl}_2)$ 的构造、拟三角 Hopf 代数与泛 R-矩阵、辫子幺半范畴，以及量子迹与纽结不变量的构造。

**定义 1**（代数）：设 $k$ 是交换环。一个 $k$-**代数**是一个三元组 $(A, \mu, \eta)$，其中 $A$ 是 $k$-模，$\mu: A \otimes_k A \to A$ 是乘法（乘法映射），$\eta: k \to A$ 是单位映射，满足以下交换图：
$$\mu \circ (\mu \otimes \mathrm{id}_A) = \mu \circ (\mathrm{id}_A \otimes \mu) \quad (\text{结合律})$$
$$\mu \circ (\eta \otimes \mathrm{id}_A) = \mathrm{id}_A = \mu \circ (\mathrm{id}_A \otimes \eta) \quad (\text{单位律})$$

**定义 2**（余代数）：一个 $k$-**余代数**是一个三元组 $(C, \Delta, \varepsilon)$，其中 $C$ 是 $k$-模，$\Delta: C \to C \otimes_k C$ 是余乘法，$\varepsilon: C \to k$ 是余单位，满足以下交换图（结合律与单位律的对偶）：
$$(\Delta \otimes \mathrm{id}_C) \circ \Delta = (\mathrm{id}_C \otimes \Delta) \circ \Delta \quad (\text{余结合律})$$
$$(\varepsilon \otimes \mathrm{id}_C) \circ \Delta = \mathrm{id}_C = (\mathrm{id}_C \otimes \varepsilon) \circ \Delta \quad (\text{余单位律})$$

**定义 3**（双代数）：一个 $k$-**双代数**是一个五元组 $(B, \mu, \eta, \Delta, \varepsilon)$，使得 $(B, \mu, \eta)$ 是 $k$-代数，$(B, \Delta, \varepsilon)$ 是 $k$-余代数，且 $\Delta$ 和 $\varepsilon$ 是代数同态。等价地，以下四个交换图成立：

$$\Delta \circ \mu = (\mu \otimes \mu) \circ (\mathrm{id}_B \otimes \tau \otimes \mathrm{id}_B) \circ (\Delta \otimes \Delta) \quad (\text{乘法与余乘法相容})$$
$$\Delta \circ \eta = \eta \otimes \eta \quad (\text{单位与余乘法相容})$$
$$\varepsilon \circ \mu = \varepsilon \otimes \varepsilon \quad (\text{余单位是代数同态})$$
$$\varepsilon \circ \eta = \mathrm{id}_k \quad (\text{余单位与单位相容})$$

其中 $\tau: B \otimes B \to B \otimes B$ 是交换张量因子的扭转映射 $\tau(a \otimes b) = b \otimes a$。

### Hopf代数的完整公理化定义

**定义 4**（Hopf代数）：一个 **Hopf代数** 是域 $k$ 上的六元组 $(H, \mu, \eta, \Delta, \varepsilon, S)$，满足：
1. $(H, \mu, \eta, \Delta, \varepsilon)$ 是双代数。
2. $S: H \to H$ 是 $k$-线性映射，称为**对极**（antipode），满足 Hopf 公理：
$$\mu \circ (S \otimes \mathrm{id}_H) \circ \Delta = \eta \circ \varepsilon = \mu \circ (\mathrm{id}_H \otimes S) \circ \Delta$$

在图示意义下，以下交换图交换：
$$\begin{CD}
H \otimes H @>{S \otimes \mathrm{id}}>> H \otimes H \\
@A{\Delta}AA @VV{\mu}V \\
H @>{\varepsilon}>> k @>{\eta}>> H \\
@V{\Delta}VV @AA{\mu}A \\
H \otimes H @>{\mathrm{id} \otimes S}>> H \otimes H
\end{CD}$$

对极 $S$ 是唯一的（若存在），且满足 $S \circ \mu = \mu \circ \tau \circ (S \otimes S)$ 和 $S \circ \eta = \eta$ 以及 $\varepsilon \circ S = \varepsilon$。若 $H$ 是交换的或余交换的，则 $S^2 = \mathrm{id}_H$。

### Sweedler记号及其严格性

**定义 5**（Sweedler记号）：对 $h \in H$，记余乘法的像为有限和：

$$\Delta(h) = \sum_{(h)} h_{(1)} \otimes h_{(2)}$$

余结合律在此记号下表现为：

$$\sum_{(h)} \left( \sum_{(h_{(1)})} h_{(1)(1)} \otimes h_{(1)(2)} \right) \otimes h_{(2)} = \sum_{(h)} h_{(1)} \otimes \left( \sum_{(h_{(2)})} h_{(2)(1)} \otimes h_{(2)(2)} \right)$$

这使得我们可以无歧义地记作 $\sum_{(h)} h_{(1)} \otimes h_{(2)} \otimes h_{(3)}$。在 Sweedler 记号下，Hopf 公理读作：

$$\sum_{(h)} S(h_{(1)}) h_{(2)} = \varepsilon(h) 1_H = \sum_{(h)} h_{(1)} S(h_{(2)})$$

此记号虽非严格形式化（和式依赖于代表元的选取），但极大地简化了计算。所有使用 Sweedler 记号的恒等式均可还原为标准交换图语言。

### 三个基础例子

**定理 1**（群代数）：设 $G$ 是群，$k[G]$ 是群代数。定义：
- $\mu(g \otimes h) = gh$，$\eta(1_k) = 1_G$
- $\Delta(g) = g \otimes g$，$\varepsilon(g) = 1_k$
- $S(g) = g^{-1}$

则 $(k[G], \mu, \eta, \Delta, \varepsilon, S)$ 是 Hopf 代数。

**证明**：代数公理由群乘法结合律和单位元保证。余结合律：$(\Delta \otimes \mathrm{id}) \Delta(g) = g \otimes g \otimes g = (\mathrm{id} \otimes \Delta) \Delta(g)$。余单位律：$(\varepsilon \otimes \mathrm{id}) \Delta(g) = 1 \otimes g = g$，同理另一侧。双代数条件由 $\Delta(gh) = gh \otimes gh = (g \otimes g)(h \otimes h) = \Delta(g)\Delta(h)$ 验证。Hopf 公理：$\mu(S \otimes \mathrm{id})\Delta(g) = g^{-1}g = e = \varepsilon(g)1_H = gg^{-1} = \mu(\mathrm{id} \otimes S)\Delta(g)$。$\blacksquare$

**定理 2**（包络代数）：设 $\mathfrak{g}$ 是李代数，$U(\mathfrak{g})$ 是泛包络代数。定义 $\Delta(x) = x \otimes 1 + 1 \otimes x$ 对 $x \in \mathfrak{g}$，线性延拓为代数同态；$\varepsilon(x) = 0$ 对 $x \in \mathfrak{g}$；$S(x) = -x$ 对 $x \in \mathfrak{g}$，并延拓为反代数同态。则 $(U(\mathfrak{g}), \mu, \eta, \Delta, \varepsilon, S)$ 是 Hopf 代数。

**证明**：余结合律对生成元验证：对 $x \in \mathfrak{g}$，$(\Delta \otimes \mathrm{id})\Delta(x) = x \otimes 1 \otimes 1 + 1 \otimes x \otimes 1 + 1 \otimes 1 \otimes x = (\mathrm{id} \otimes \Delta)\Delta(x)$。双代数条件因 $\Delta$ 定义为代数同态而自动满足。Hopf 公理：$\mu(S \otimes \mathrm{id})\Delta(x) = -x + x = 0 = \varepsilon(x)1 = \mu(\mathrm{id} \otimes S)\Delta(x)$。$\blacksquare$

**定理 3**（坐标环）：设 $G$ 是仿射代数群，$\mathcal{O}(G)$ 是其正则函数环。定义 $\mu$ 为逐点乘法，$\eta(1) = 1_G$（常值函数），$\Delta(f)(g, h) = f(gh)$，$\varepsilon(f) = f(e)$，$S(f)(g) = f(g^{-1})$。则 $(\mathcal{O}(G), \mu, \eta, \Delta, \varepsilon, S)$ 是交换 Hopf 代数。

**证明**：$\Delta$ 的余结合律由 $G$ 中群乘法的结合律保证：$((\Delta \otimes \mathrm{id})\Delta(f))(g, h, k) = f((gh)k) = f(g(hk)) = ((\mathrm{id} \otimes \Delta)\Delta(f))(g, h, k)$。双代数性质因 $\Delta$ 是代数同态（$\Delta(f_1 f_2) = \Delta(f_1)\Delta(f_2)$ 来自群乘法为代数同态）。Hopf 公理：$(\mu(S \otimes \mathrm{id})\Delta(f))(g) = f(g^{-1}g) = f(e) = \varepsilon(f)1_G$。$\blacksquare$

### 量子群：Drinfeld-Jimbo $U_q(\mathfrak{sl}_2)$

**定义 6**（$q$-整数与$q$-阶乘）：对 $q \in k^\times$，$q \neq \pm 1$，定义 $q$-整数和 $q$-阶乘：

$$[n]_q = \frac{q^n - q^{-n}}{q - q^{-1}}, \quad [n]_q! = [1]_q [2]_q \cdots [n]_q$$

自然地 $[0]_q! = 1$。注意 $\lim_{q \to 1} [n]_q = n$。

**定义 7**（$U_q(\mathfrak{sl}_2)$）：Drinfeld-Jimbo 量子群 $U_q(\mathfrak{sl}_2)$ 是域 $k$ 上由生成元 $E, F, K, K^{-1}$ 生成的结合代数，满足以下六条关系：

$$KK^{-1} = 1 = K^{-1}K$$
$$KEK^{-1} = q^2 E$$
$$KFK^{-1} = q^{-2} F$$
$$[E, F] = \frac{K - K^{-1}}{q - q^{-1}}$$

其中 $q$-整数 $[2]_q = q + q^{-1}$ 自然出现在高阶结构中。$U_q(\mathfrak{sl}_2)$ 上的 Hopf 代数结构定义如下：

$$\Delta(E) = E \otimes 1 + K \otimes E, \quad \Delta(F) = F \otimes K^{-1} + 1 \otimes F$$
$$\Delta(K) = K \otimes K, \quad \Delta(K^{-1}) = K^{-1} \otimes K^{-1}$$
$$\varepsilon(E) = \varepsilon(F) = 0, \quad \varepsilon(K) = \varepsilon(K^{-1}) = 1$$
$$S(E) = -K^{-1}E, \quad S(F) = -FK, \quad S(K) = K^{-1}, \quad S(K^{-1}) = K$$

当 $q \to 1$ 时，$[E, F] \to H$（其中 $H = \lim_{q \to 1} (K - K^{-1})/(q - q^{-1})$），恢复经典包络代数 $U(\mathfrak{sl}_2)$。

### 拟三角Hopf代数与泛R-矩阵

**定义 8**（拟三角Hopf代数）：Hopf 代数 $(H, \mu, \eta, \Delta, \varepsilon, S)$ 称为**拟三角的**（quasitriangular），如果存在可逆元 $\mathcal{R} \in H \otimes H$，称为**泛R-矩阵**，满足：

$$(\Delta \otimes \mathrm{id})(\mathcal{R}) = \mathcal{R}_{13}\mathcal{R}_{23}$$
$$(\mathrm{id} \otimes \Delta)(\mathcal{R}) = \mathcal{R}_{13}\mathcal{R}_{12}$$
$$\tau \circ \Delta(h) = \mathcal{R} \Delta(h) \mathcal{R}^{-1}, \quad \forall h \in H$$

其中 $\mathcal{R}_{12} = \mathcal{R} \otimes 1$，$\mathcal{R}_{23} = 1 \otimes \mathcal{R}$，$\mathcal{R}_{13} = (\mathrm{id} \otimes \tau)(\mathcal{R} \otimes 1)$，而 $\tau$ 如前是张量因子的扭转映射。

**定理 4**（Yang-Baxter方程）：泛R-矩阵自动满足 Yang-Baxter 方程：

$$\mathcal{R}_{12}\mathcal{R}_{13}\mathcal{R}_{23} = \mathcal{R}_{23}\mathcal{R}_{13}\mathcal{R}_{12}$$

**证明**：计算 $\mathcal{R}_{12}\mathcal{R}_{13}\mathcal{R}_{23} = \mathcal{R}_{12} \cdot (\Delta \otimes \mathrm{id})(\mathcal{R}) = (\tau \otimes \mathrm{id})[(\Delta \otimes \mathrm{id})(\mathcal{R})] \cdot \mathcal{R}_{23}$。利用拟三角条件 $(\Delta \otimes \mathrm{id})(\mathcal{R}) = \mathcal{R}_{13}\mathcal{R}_{23}$ 和 $(\mathrm{id} \otimes \Delta)(\mathcal{R}) = \mathcal{R}_{13}\mathcal{R}_{12}$，经过标准计算可得两方向相等。详细验证：$\mathcal{R}_{12}\mathcal{R}_{13}\mathcal{R}_{23} = \mathcal{R}_{12}(\Delta \otimes \mathrm{id})(\mathcal{R}) = (\tau \otimes \mathrm{id}) \circ (\Delta^{\mathrm{op}} \otimes \mathrm{id})(\mathcal{R}) \cdot \mathcal{R}_{23}$，再由拟三角第三条件的张量形式，即得 $\mathcal{R}_{23}\mathcal{R}_{13}\mathcal{R}_{12}$。$\blacksquare$

### 辫子幺半范畴

**定义 9**（辫子幺半范畴）：幺半范畴 $(\mathcal{C}, \otimes, I, \alpha, \lambda, \rho)$ 称为**辫子的**（braided），若存在自然同构 $c_{X,Y}: X \otimes Y \to Y \otimes X$ 满足六角公理：

$$c_{X \otimes Y, Z} = (c_{X,Z} \otimes \mathrm{id}_Y) \circ (\mathrm{id}_X \otimes c_{Y,Z})$$
$$c_{X, Y \otimes Z} = (\mathrm{id}_Y \otimes c_{X,Z}) \circ (c_{X,Y} \otimes \mathrm{id}_Z)$$

**定理 5**（从R-矩阵构造辫子）：设 $(H, \mathcal{R})$ 是拟三角Hopf代数，则其表示范畴 $\mathrm{Rep}(H)$ 是辫子幺半范畴，辫子定义如下：对任意表示 $V, W$ 和 $v \in V, w \in W$，

$$c_{V,W}(v \otimes w) = \tau(\mathcal{R} \cdot (v \otimes w))$$

其中 $\mathcal{R}$ 通过表示作用在 $V \otimes W$ 上，$\tau$ 是通常的张量因子交换。

**证明**：需验证 $c_{V,W}$ 是 $H$-模同态。对 $h \in H$，利用拟三角条件 $\tau \circ \Delta(h) = \mathcal{R} \Delta(h) \mathcal{R}^{-1}$ 可得 $c_{V,W} \circ h = h \circ c_{V,W}$。六角公理由 $(\Delta \otimes \mathrm{id})(\mathcal{R})$ 和 $(\mathrm{id} \otimes \Delta)(\mathcal{R})$ 的条件逐项验证：$c_{U \otimes V, W} = (c_{U,W} \otimes \mathrm{id}_V)(\mathrm{id}_U \otimes c_{V,W})$ 直接来自 $(\Delta \otimes \mathrm{id})(\mathcal{R}) = \mathcal{R}_{13}\mathcal{R}_{23}$。同理第二个六角公理由另一拟三角条件保证。自然性来自 $\mathcal{R}$ 为 $H \otimes H$ 中元。$\blacksquare$

### 量子迹与纽结不变量

**定义 10**（量子迹）：设 $H$ 是丝带 Hopf 代数（拟三角 + 中心元 $\nu$ 满足特定条件），$V$ 是有限维 $H$-模。定义 $V$ 的**量子迹**（quantum trace）为：

$$\mathrm{Tr}_q^V(f) = \mathrm{Tr}(f \circ \nu^{-1})$$

其中 $\mathrm{Tr}$ 是通常的向量空间迹。量子迹满足循环性和部分迹标准性质。

**定义 11**（Markov迹）：设 $\{B_n\}_{n \ge 1}$ 是辫子群序列，$\mathrm{Rep}(H)$ 中对象 $V$ 诱导了表示 $\rho_n: k[B_n] \to \mathrm{End}(V^{\otimes n})$。**Markov迹** 是一族线性函数 $\{\mathrm{MT}_n: \mathrm{End}_H(V^{\otimes n}) \to k\}_{n \ge 1}$，满足：
1. $\mathrm{MT}_n(fg) = \mathrm{MT}_n(gf)$（迹性）
2. $\mathrm{MT}_{n+1}(f \otimes \mathrm{id}_V) = \mathrm{MT}_n(f)$ 和 $\mathrm{MT}_{n+1}(f \circ c_{V,V}^{\pm 1} \otimes \mathrm{id}_V) = \mathrm{MT}_n(f)$（Markov性质）

**定理 6**（纽结不变量构造）：给定丝带 Hopf 代数 $H$ 和有限维表示 $V$，对每个定向链环 $L$（表示为辫子的闭包），定义：

$$J_{H,V}(L) = \mathrm{MT}_n(\rho_n(\beta))$$

其中 $\beta \in B_n$ 满足其闭包同痕于 $L$。则 $J_{H,V}(L)$ 是定向链环的同痕不变量。Jones 多项式和 HOMFLY-PT 多项式可分别从适当参数的 $U_q(\mathfrak{sl}_2)$ 和 $U_q(\mathfrak{sl}_N)$ 的表示中得到。

**证明**：需验证 $J_{H,V}(L)$ 在 Markov 移动下不变。Markov 移动 I：将 $\beta \in B_n$ 换为 $\gamma \beta \gamma^{-1}$（$\gamma \in B_n$）。由 Markov 迹的迹性 $\mathrm{MT}_n(\rho_n(\gamma \beta \gamma^{-1})) = \mathrm{MT}_n(\rho_n(\gamma^{-1}\gamma \beta)) = \mathrm{MT}_n(\rho_n(\beta))$，故值不变。Markov 移动 II：将 $\beta \in B_n$ 换为 $\beta \sigma_n^{\pm 1} \in B_{n+1}$。由 Markov 迹的性质 $\mathrm{MT}_{n+1}(\rho_{n+1}(\beta \sigma_n^{\pm 1})) = \mathrm{MT}_n(\rho_n(\beta))$，故值不变。由于任意两个表示同一链环的辫子可通过 Markov 移动互相转化，$J_{H,V}(L)$ 良定且为同痕不变量。对 $U_q(\mathfrak{sl}_2)$ 取 $V$ 为二维标准表示，得到 Jones 多项式；对 $U_q(\mathfrak{sl}_N)$ 取 $V$ 为 $N$ 维标准表示，得到 HOMFLY-PT 多项式。 $\blacksquare$
