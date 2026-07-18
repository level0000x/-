## 第88章（补充）
> 表示论是研究代数结构（群、代数、李代数等）通过线性作用的具体实现的理论。V12 第 69 章已介绍了有限群表示论的基础，V23 涵盖了李群与李代数的表示论。本卷在此基础上深化表示论：有限群模表示论研究特征为素数的域上的表示结构；代数群表示论将群表示论推广到代数几何框架；几何表示论通过层论和相交上同调为表示论提供几何构造；仿射李代数与量子群表示论连接无限维李代数和可积系统；Langlands 纲领深化则从表示论角度揭示数论与调和分析之间的深刻联系。

---

---

---

---

---
---

## 第89章：有限群表示深化
有限群表示论在 V12 第 69 章已建立了基础（特征标理论、不可约表示、诱导表示）。本章进一步深化：引入模表示论（特征整除群阶的域上的表示），研究块论（Brauer 的块分解）和 Green 对应。

### 222.1 特征标理论的深化

**定理 222.1**（特征标的正交关系，回顾）：$G$ 的不可约复特征标 $\operatorname{Irr}(G)$ 满足：

$$\frac{1}{|G|} \sum_{g \in G} \chi_i(g) \overline{\chi_j(g)} = \delta_{ij}$$

**定义 222.1**（特征标表）：有限群 $G$ 的**特征标表**是 $k \times k$ 方阵（$k$ 为共轭类数），行标记不可约特征标 $\chi_i$，列标记共轭类 $C_j$。

**定理 222.2**（Frobenius-Schur 指示子）：设 $\chi$ 是 $G$ 的不可约复特征标。**Frobenius-Schur 指示子** $\nu_2(\chi) = \frac{1}{|G|} \sum_{g \in G} \chi(g^2)$ 取值为 $1$（$\chi$ 可实现为实表示）、$-1$（$\chi$ 为实值但不可实现为实表示）或 $0$（$\chi$ 非实值）。

**定义 222.2**（Artin 定理）：任何特征标可表示为诱导自循环子群的一维特征标的 $\mathbb{Q}$-线性组合。**Brauer 定理**（更强）：任何特征标可表示为诱导自初等子群的一维特征标的 $\mathbb{Z}$-线性组合。

### 222.2 模表示论基础

**定义 222.3**（模表示 / Modular Representation）：设 $p$ 是素数，$k$ 是特征 $p$ 的代数闭域。$G$ 在 $k$ 上的**模表示**是群同态 $G \to \operatorname{GL}(V)$（$V$ 是 $k$ 上的有限维向量空间）。当 $p \mid |G|$ 时，模表示论与复表示论有本质不同。

**定义 222.4**（$p$-模系统 / $p$-Modular System）：$(K, \mathcal{O}, k)$ 是 **$p$-模系统**，其中 $\mathcal{O}$ 是完备离散赋值环（特征 $0$），$K$ 是 $\mathcal{O}$ 的分式域（特征 $0$），$k$ 是 $\mathcal{O}$ 的剩余域（特征 $p$）。$K$ 包含 $|G|$ 次本原单位根。

**定理 222.3**（Brauer-Nesbitt 定理）：在 $p$-模系统 $(K, \mathcal{O}, k)$ 下，$K[G]$-模和 $k[G]$-模的不可约表示之间存在由约化映射 $\mathcal{O}[G] \to k[G]$ 给出的对应关系。

**定义 222.5**（Brauer 特征标 / Brauer Character）：设 $\rho: G \to \operatorname{GL}_n(k)$ 是模表示。对 $G$ 的 $p$-正则元 $g$（阶不被 $p$ 整除），$\rho(g)$ 的特征值在 $K$ 中有唯一的提升（Teichmüller 提升）。**Brauer 特征标** $\varphi(g)$ 是这些提升特征值的和。$\operatorname{IBr}(G)$ 是所有不可约 Brauer 特征标的集合。

**定理 222.4**（Brauer 特征标的性质）：$|\operatorname{IBr}(G)|$ 等于 $G$ 的 $p$-正则共轭类数。Brauer 特征标在 $p$-正则共轭类上满足正交关系。

**定义 222.6**（分解矩阵与 Cartan 矩阵）：**分解矩阵** $D$ 的行标记不可约普通特征标，列标记不可约 Brauer 特征标，$D_{\chi,\varphi}$ 是 $\chi$ 约化到特征 $p$ 时 $\varphi$ 的重数。**Cartan 矩阵** $C = D^T D$，其元素是 $p$-正则类上的标量积。

### 222.3 块理论

**定义 222.7**（块 / Block）：群代数 $k[G]$ 可分解为不可分解双理想的直和：$k[G] = B_1 \oplus B_2 \oplus \cdots \oplus B_r$。每个 $B_i$ 称为 $G$ 的一个 **$p$-块**（或 **Brauer 块**）。块的个数等于 $\mathcal{O}[G]$ 分解为不可分解 $\mathcal{O}$-代数的个数。

**定义 222.8**（亏群 / Defect Group）：$p$-块 $B$ 的**亏群** $D$（定义到共轭）是 $B$ 的「远离块论平凡性」的度量：$|D| = p^d$，其中 $d$ 是 $B$ 的**亏数**（defect）。亏数为 $0$ 的块是单代数（矩阵代数）。

**定理 222.5**（Brauer 第一主定理）：存在 $G$ 的 $p$-块与 $N_G(D)$ 的 $p$-块（具有相同亏群 $D$）之间的一一对应（Brauer 对应）。

**定理 222.6**（Brauer 第二主定理）：Brauer 对应将特征标诱导和限制联系起来，为块论提供了核心计算工具。

**定义 222.9**（Green 对应 / Green Correspondence，1964）：设 $D$ 是 $G$ 的 $p$-子群，$H$ 是包含 $N_G(D)$ 的子群。Green 对应在 $k[G]$-模和 $k[H]$-模（具有顶点 $D$）之间建立了一一对应，是模表示论中最强大的工具之一。

**定理 222.7**（Alperin 权猜想，1986）：$p$-块 $B$ 的不可约 Brauer 特征标数等于 $B$ 的局部子群中 $p$-权（Alperin 权重）的数目。这是模表示论中最重要的未完全解决的猜想之一。

---

---

---

---

---
---

## 第90章：代数群表示
代数群表示论将群表示论推广到代数几何框架，研究代数群（既是群又是代数簇）的线性表示。半单代数群和约化代数群的表示分类是 20 世纪表示论的最高成就之一。

### 223.1 线性代数群基础

**定义 223.1**（线性代数群）：**线性代数群** $G$ 是代数闭域 $k$ 上的仿射代数簇，带有群运算（乘法 $G \times G \to G$ 和取逆 $G \to G$），使得运算是代数簇的态射。

**定义 223.2**（Borel 子群与极大环面）：代数群 $G$ 的 **Borel 子群** $B$ 是 $G$ 的极大连通可解子群。$B$ 的**极大环面** $T \subset B$ 是 $B$ 的极大环面子群（同构于 $(\mathbb{G}_m)^n$）。$T$ 的**特征标群** $X(T) = \operatorname{Hom}(T, \mathbb{G}_m)$ 是自由 Abel 群（秩 $= \dim T$）。

**定理 223.1**（Borel 不动点定理）：若连通可解代数群 $G$ 作用在完备代数簇 $X$ 上，则 $G$ 在 $X$ 上有不动点。

**定理 223.2**（Bruhat 分解）：$G = \bigsqcup_{w \in W} B w B$，其中 $W = N_G(T)/T$ 是 Weyl 群。Bruhat 分解是代数群表示论的核心工具。

### 223.2 最高权理论

**定义 223.3**（支配权与最高权模）：设 $G$ 是连通约化代数群，选定 Borel 子群 $B \supset T$。**权** $\lambda \in X(T)$ 是**支配的**（dominant），如果 $\langle \lambda, \alpha^\vee \rangle \geq 0$（对所有正根 $\alpha$）。对每个支配权 $\lambda$，存在唯一的不可约 $G$-模 $L(\lambda)$，其最高权为 $\lambda$。

**定义 223.4**（诱导模 / Weyl 模与对偶 Weyl 模）：对支配权 $\lambda$，**Weyl 模** $\Delta(\lambda)$ 定义为 $\operatorname{ind}_B^G(k_\lambda)$（$k_\lambda$ 是 $B$ 的一维表示）。$L(\lambda)$ 是 $\Delta(\lambda)$ 的唯一不可约商。

**定理 223.3**（Weyl 特征标公式）：不可约表示 $L(\lambda)$ 的特征标为

$$\chi(\lambda) = \frac{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\lambda + \rho)}}{\sum_{w \in W} (-1)^{\ell(w)} e^{w\rho}}$$

其中 $\rho$ 是正根的一半之和，$\ell(w)$ 为 $w$ 的长度。（这里 $\rho$ 为所有正根之和的一半，Weyl 群的 dot action 定义为 $w \cdot \lambda = w(\lambda + \rho) - \rho$。）这是表示论中最优美的公式之一。

**定理 223.4**（Weyl 维数公式）：$\dim L(\lambda) = \prod_{\alpha > 0} \frac{\langle \lambda + \rho, \alpha^\vee \rangle}{\langle \rho, \alpha^\vee \rangle}$。

### 223.3 Kempf 消失定理与上同调

**定义 223.5**（旗簇与诱导层）：$G/B$ 是**旗簇**（flag variety），是光滑射影簇。对权 $\lambda$，$G \times^B k_\lambda$ 是 $G/B$ 上的可逆层 $\mathcal{L}(\lambda)$。

**定理 223.5**（Borel-Weil-Bott 定理）：不可约 $G$-模 $L(\lambda)$ 可通过旗簇上可逆层的上同调实现：
- $H^0(G/B, \mathcal{L}(\lambda)) \cong L(\lambda)^*$（若 $\lambda$ 是支配权）
- 对非支配权，上同调消失或给出其他不可约表示（Bott 的精细公式）

**定理 223.6**（Kempf 消失定理，1976）：若 $\lambda$ 是支配权，则 $H^i(G/B, \mathcal{L}(\lambda)) = 0$（对所有 $i > 0$）。这是 Borel-Weil-Bott 定理的特例，是射影簇上丰沛线丛消失定理的推广。

**定义 223.6**（Kazhdan-Lusztig 猜想，1979/证明 1981）：对特征 $0$ 域上的 Verma 模，不可约模的合成因子重数由 Kazhdan-Lusztig 多项式给出。Brylynski-Kashiwara（1981）和 Beilinson-Bernstein（1981）通过 $\mathcal{D}$-模和相交上同调证明了该猜想。

### 223.4 正特征表示论

**定义 223.7**（正特征表示论 / 特征 $p$ 的代数群表示）：在特征 $p > 0$ 的代数闭域上，代数群表示论与特征 $0$ 有本质不同。Frobenius 态射 $F: G \to G$ 引入新的表示（Frobenius 扭）。

**定理 223.7**（Steinberg 张量积定理）：对特征 $p$ 域上的单连通半单代数群 $G$，不可约 $G$-模的结构为

$$L(\lambda) = L(\lambda_0) \otimes L(\lambda_1)^{(1)} \otimes L(\lambda_2)^{(2)} \otimes \cdots$$

其中 $\lambda = \lambda_0 + p\lambda_1 + p^2\lambda_2 + \cdots$ 是 $\lambda$ 的 $p$-adic 展开，$L(\mu)^{(r)}$ 是 $F^r$-扭表示。

**定理 223.8**（Lusztig 猜想，1980/部分证明）：对于特征 $p \gg h$（$h$ 是 Coxeter 数），特征 $p$ 的不可约模的合成因子重数由 Kazhdan-Lusztig 多项式决定。Lusztig 猜想在 $p \gg 0$ 时成立（Andersen-Jantzen-Soergel 1994），但存在反例证明 $p$ 需要相当大。

---

---

---

---

---
---

## 第91章：几何表示论
几何表示论通过几何对象（旗簇、Steinberg 簇、仿射 Grassmann 流形、箭图簇）的拓扑和层论来构造和研究代数群的表示。这是 20 世纪末和 21 世纪表示论最活跃的前沿之一。

### 224.1 Springer 理论

**定义 224.1**（Springer 纤维 / Springer 解消）：设 $G$ 是约化代数群，$\mathfrak{g} = \operatorname{Lie}(G)$，$\mathcal{N} \subset \mathfrak{g}$ 是幂零锥。**Springer 解消**是态射 $\pi: \tilde{\mathcal{N}} = \{(x, B) : x \in \operatorname{Lie}(B) \cap \mathcal{N}\} \to \mathcal{N}$。对 $x \in \mathcal{N}$，$\pi^{-1}(x)$ 是 **Springer 纤维** $\mathcal{B}_x$（包含 $x$ 的 Borel 子代数的旗簇）。

**定理 224.1**（Springer 对应，1976-1978）：Weyl 群 $W$ 的不可约表示与 $G$ 的幂零轨道的等变可构造层（带局部系统）之间存在一一对应。$W$ 在 $H^*(\mathcal{B}_x)$ 上的作用（Springer 表示）实现了 $W$ 的所有不可约表示。

**定义 224.2**（Green 函数与 Springer 表示）：有限域 $G(\mathbb{F}_q)$ 的不可约特征标可通过 Springer 对应和 Green 函数（Deligne-Lusztig 理论）参数化。

### 224.2 相交上同调与 Kazhdan-Lusztig 理论

**定义 224.3**（相交上同调 / Intersection Cohomology，Goresky-MacPherson 1980）：对奇异空间 $X$，**相交上同调** $IH^*(X)$ 是满足 Poincaré 对偶的「修正」上同调理论。由中间扩展（intermediate extension）的可构造层 $\mathbf{IC}(X)$ 的超上同调给出。

**定义 224.4**（Schubert 簇与 Kazhdan-Lusztig 多项式）：旗簇 $G/B$ 的 **Schubert 簇** $X_w = \overline{B w B / B}$（$w \in W$）。**Kazhdan-Lusztig 多项式** $P_{x,w}(q)$ 编码了 $X_w$ 沿 $B x B / B$ 的局部相交上同调 Poincaré 多项式。

**定理 224.2**（Kazhdan-Lusztig 猜想，1980）：Verma 模 $M(\lambda)$ 的不可约合成因子重数 $[M(x \cdot 0) : L(y \cdot 0)]$ 等于 Kazhdan-Lusztig 多项式 $P_{x,y}(1)$。由 Beilinson-Bernstein 和 Brylynski-Kashiwara（1981）通过 $\mathcal{D}$-模和 Riemann-Hilbert 对应证明。

**定义 224.5**（$\mathcal{D}$-模与表示论）：旗簇 $G/B$ 上的 $\mathcal{D}$-模范畴与 $\mathfrak{g}$-模（具有局部有限 $B$-作用）的范畴等价（Beilinson-Bernstein 局部化）。这是几何表示论的核心结果。

### 224.3 几何 Satake 对应

**定义 224.6**（仿射 Grassmann 流形）：对代数闭域 $k$ 上的约化群 $G$，**仿射 Grassmann 流形** $\operatorname{Gr}_G = G(k((t))) / G(k[[t]])$（$k((t))$ 是 Laurent 级数域，$k[[t]]$ 是形式幂级数环）。$\operatorname{Gr}_G$ 是无穷维 ind-射影簇。

**定义 224.7**（几何 Satake 等价，Lusztig 1983, Ginzburg 1995, Mirković-Vilonen 2007）：存在范畴等价

$$\operatorname{Perv}_{G(k[[t]])}(\operatorname{Gr}_G) \cong \operatorname{Rep}(G^\vee)$$

其中 $G^\vee$ 是 $G$ 的 Langlands 对偶群，$\operatorname{Perv}$ 是反常层（perverse sheaves）范畴。几何 Satake 将 $G$ 的几何对象与 $G^\vee$ 的表示范畴联系起来。

**定理 224.3**（几何 Satake 的推论）：仿射 Grassmann 流形上 $G(k[[t]])$-等变反常层的超上同调给出 $G^\vee$ 的表示的几何构造。卷积积对应于表示的张量积。

### 224.4 箭图簇与表示论

**定义 224.8**（箭图簇 / Quiver Variety，Nakajima 1998）：**箭图簇** $\mathfrak{M}(\mathbf{v}, \mathbf{w})$ 是箭图 $Q$ 的双重（double）表示模空间的辛约化。箭图簇是超 Kähler 流形。

**定理 224.4**（Nakajima 定理）：箭图簇的拓扑 Borel-Moore 同调实现了 Kac-Moody 代数的可积最高权表示。具体地，$\bigoplus_{\mathbf{v}} H_*^{\operatorname{BM}}(\mathfrak{M}(\mathbf{v}, \mathbf{w}))$ 具有 $\mathfrak{g}(Q)$ 的最高权 $\mathbf{w}$ 的可积表示结构。

**定义 224.9**（箭图簇与几何表示论的联系）：箭图簇为仿射量子群、杨振宁代数和 $\mathcal{W}$-代数的表示提供了统一的几何框架。Nakajima 的箭图簇理论是几何表示论的基础工具。

---

---

---

---

---
---

## 第92章：仿射与量子群表示
仿射李代数表示论连接了无限维李代数、共形场论和可积系统。量子群表示论是代数群表示论的非交换形变，在纽结理论和统计力学中有重要应用。

### 225.1 仿射 Lie 代数表示

**定义 225.1**（仿射 Kac-Moody 代数）：**仿射 Kac-Moody 代数** $\hat{\mathfrak{g}}$ 是有限维单李代数 $\mathfrak{g}$ 的圈代数 $\mathfrak{g} \otimes \mathbb{C}[t, t^{-1}]$ 的中心扩张。其定义为：
- $\hat{\mathfrak{g}} = (\mathfrak{g} \otimes \mathbb{C}[t, t^{-1}]) \oplus \mathbb{C} c \oplus \mathbb{C} d$
- $[x \otimes t^m, y \otimes t^n] = [x, y] \otimes t^{m+n} + m \delta_{m,-n} (x|y) c$
- $[c, \cdot] = 0$，$[d, x \otimes t^n] = n x \otimes t^n$

**定义 225.2**（可积最高权表示）：设 $\lambda$ 是 $\hat{\mathfrak{g}}$ 的支配整权。不可约最高权模 $L(\lambda)$ 是**可积的**，如果 $\lambda(c) \neq 0$ 且 Chevalley 生成元的作用是局部幂零的。

**定理 225.1**（Kac-Weisfeiler 特征标公式 / Kac 特征标公式）：可积最高权模 $L(\lambda)$ 的特征标为

$$\operatorname{ch} L(\lambda) = \frac{\sum_{w \in \hat{W}} (-1)^{\ell(w)} e^{w(\lambda + \hat{\rho}) - \hat{\rho}}}{\prod_{\alpha > 0} (1 - e^{-\alpha})^{\dim \hat{\mathfrak{g}}_\alpha}}$$

其中 $\hat{W}$ 是仿射 Weyl 群，$\hat{\rho}$ 是仿射 Weyl 向量。

**定义 225.3**（Macdonald 恒等式与 $\eta$ 函数）：仿射李代数的分母恒等式（Weyl 分母公式）给出经典数论公式的推广。$\widehat{\mathfrak{sl}}_2$ 的分母公式给出 Jacobi 三重积恒等式和 Dedekind $\eta$ 函数。

### 225.2 顶点算子代数

**定义 225.4**（顶点算子代数 / VOA）：**顶点算子代数** $(V, Y, \mathbf{1}, \omega)$ 是向量空间 $V$ 配备：
- 状态-场对应 $Y: V \to \operatorname{End}(V)[[z, z^{-1}]]$，$Y(a, z) = \sum_{n \in \mathbb{Z}} a_n z^{-n-1}$
- 真空向量 $\mathbf{1}$：$Y(\mathbf{1}, z) = \operatorname{id}_V$
- 共形向量 $\omega$：$Y(\omega, z) = \sum L_n z^{-n-2}$（Virasoro 代数作用）
- 局部性公理：$(z-w)^N [Y(a, z), Y(b, w)] = 0$（$N$ 充分大）

**定理 225.2**（Frenkel-Zhu 定理，1992）：仿射 Kac-Moody 代数 $\hat{\mathfrak{g}}$ 的可积最高权模 $L(k\Lambda_0)$（$k$ 是级）具有顶点算子代数结构（仿射 VOA）。

**定义 225.5**（共形场论与表示论）：有理顶点算子代数 $V$ 的表示范畴是模张量范畴（modular tensor category），与 3 维拓扑量子场论（TQFT）相关。这是 VOA 表示论与低维拓扑的联系。

**定理 225.3**（Verlinde 公式，1988）：有理 VOA 的不可约表示 $M_i$ 的融合规则（fusion rules）$N_{ij}^k$ 与模群 $S$ 矩阵的关系为 $N_{ij}^k = \sum_r \frac{S_{ir} S_{jr} S_{kr}^*}{S_{0r}}$。

### 225.3 量子仿射代数与可积系统

**定义 225.6**（量子仿射代数 $U_q(\hat{\mathfrak{g}})$）：**量子仿射代数**是仿射 Kac-Moody 代数 $\hat{\mathfrak{g}}$ 的量子包络代数的 $q$-形变。它是 Drinfeld-Jimbo 量子群（见 V23 Ch 268）的仿射版本。

**定义 225.7**（量子 R-矩阵与 Yang-Baxter 方程）：量子仿射代数 $U_q(\hat{\mathfrak{g}})$ 的泛 R-矩阵满足 Yang-Baxter 方程。有限维表示 $V$ 上的 R-矩阵 $R_{V,W}: V \otimes W \to V \otimes W$ 是谱依赖的（$R(z)$）。

**定理 225.4**（Baxter 的角转移矩阵与 Bethe 拟设）：量子仿射代数 $U_q(\hat{\mathfrak{sl}}_2)$ 的表示论与 XXZ 自旋链的 Bethe 拟设解直接相关。这是量子可积系统与量子群表示论的核心联系。

**定义 225.8**（Frenkel-Reshetikhin 的 $q$-特征标，1999）：量子仿射代数的有限维表示的 $q$-特征标是经典特征标的 $q$-形变，满足与 Baxter 的 T-Q 关系类似的性质。

---

---

---

---

---
---

## 第93章：Langlands 纲领深化
Langlands 纲领（V35 Ch 14 已有概述）是当代数学中最宏大的统一纲领之一。本章从表示论角度深化 Langlands 纲领的核心内容：局部 Langlands 对应、几何 Langlands 纲领和 Arthur-Selberg 迹公式。

### 226.1 局部 Langlands 对应

**定义 226.1**（局部域与局部 Langlands 对应）：设 $F$ 是局部域（$\mathbb{R}$、$\mathbb{C}$ 或 $\mathbb{Q}_p$ 的有限扩张）。**局部 Langlands 对应**（LLC）断言 $G(F)$ 的不可约光滑表示与 Weil-Deligne 群 $W_F'$ 到 Langlands 对偶群 $G^\vee(\mathbb{C})$ 的 $L$-参数之间存在一一对应。

**定理 226.1**（$\operatorname{GL}_n$ 的局部 Langlands 对应，Harris-Taylor 2001, Henniart 2000）：$\operatorname{GL}_n(F)$ 的不可约光滑超尖表示与 $n$ 维 Frobenius 半单 Weil-Deligne 表示之间存在一一对应，保持 $L$-因子和 $\varepsilon$-因子。

**定义 226.2**（$L$-参数与 $L$-包）：一般约化群 $G$ 的 $L$-参数 $\varphi: W_F' \to {}^L G$ 确定一个 $L$-包 $\Pi_\varphi$（不可约表示的有限集）。$L$-包内的表示由 $\varphi$ 的中心化子 $S_\varphi$ 的不可约表示参数化。

**定理 226.2**（$\operatorname{GL}_n$ 的局部 Langlands 对应对 $L$-函数和 $\varepsilon$-因子的保持）：对 $\operatorname{GL}_n \times \operatorname{GL}_m$ 的 Rankin-Selberg $L$-函数，局部 Langlands 对应保持局部 $L$-函数和 $\varepsilon$-因子。

### 226.2 整体 Langlands 纲领

**定义 226.3**（自守表示与 $L$-函数）：设 $G$ 是 $\mathbb{Q}$ 上的约化代数群，$\mathbb{A}$ 是 $\mathbb{Q}$ 的 Adele 环。**自守表示** $\pi$ 是 $G(\mathbb{A})$ 在 $L^2(G(\mathbb{Q}) \backslash G(\mathbb{A}))$ 上的不可约成分。$\pi$ 的**自守 $L$-函数** $L(s, \pi, r)$ 是 Euler 乘积（$r$ 是 ${}^L G$ 的有限维表示）。

**定理 226.3**（整体 Langlands 函子性猜想）：对 $L$-同态 $\eta: {}^L H \to {}^L G$，存在自守表示的「提升」映射（函子性转移），将 $H(\mathbb{A})$ 的自守表示映为 $G(\mathbb{A})$ 的自守表示，并保持 $L$-函数。

*函子性猜想的简要描述*：Langlands 的函子性原理断言，任意两个约化群 $H$ 和 $G$ 的 $L$-群之间的代数同态 $\eta: {}^L H \to {}^L G$ 诱导自守表示范畴之间的函子 $\eta_*: \mathcal{A}(H) \to \mathcal{A}(G)$，满足 $L(s, \pi, r \circ \eta) = L(s, \eta_*(\pi), r)$ 对任意 ${}^L G$ 的有限维表示 $r$。这意味着 $L$-群的同态"提升"了自守形式，将较小的群上的自守表示"转移"到较大的群上。当 $G = \operatorname{GL}_n$ 时，该猜想已由 Arthur 等人通过稳定迹公式在若干情形下得到证明；对一般的 $G$，Langlands 函子性原理仍然是 Langlands 纲领中最核心的未完全解决的问题，Ngô 的基本引理证明（2010）为此提供了关键技术基础。∎

**定义 226.4**（Langlands 纲领的核心猜想）：
1. **局部-整体相容性**：整体自守表示在所有局部点的局部分量通过局部 Langlands 对应与整体 Galois 表示兼容
2. **Ramanujan-Petersson 猜想**：尖点自守表示在非分歧点处的局部 Satake 参数是幺模的
3. **广义 Riemann 猜想**：自守 $L$-函数 $L(s, \pi)$ 的所有非平凡零点在 $\Re(s) = 1/2$ 上

### 226.3 Arthur-Selberg 迹公式

**定义 226.5**（Arthur-Selberg 迹公式）：**Arthur-Selberg 迹公式**是 $L^2(G(\mathbb{Q}) \backslash G(\mathbb{A}))$ 上正则表示的迹的等式，一边是谱和（自守表示的特征标），另一边是几何和（轨道积分）。它是 Poisson 求和公式在非交换调和分析中的推广。

**定理 226.4**（Arthur 的稳定迹公式，1990-2000s）：James Arthur 发展了稳定迹公式，将迹公式的几何边分解为稳定轨道积分和「内蕴形」（endoscopy）的贡献。这为一般群的 Langlands 函子性提供了基础框架。

**定理 226.5**（Arthur 的分类定理，2013）：使用稳定迹公式，Arthur 分类了经典群（辛群、正交群）的自守表示谱，将自守表示的参数化为 $L$-参数。

**定义 226.6**（迹公式与 Langlands 纲领的联系）：迹公式是 Langlands 函子性猜想的核心计算工具。特别是，通过迹公式的比较（Fundamental Lemma），可以证明自守表示的函子性转移。

### 226.4 几何 Langlands 纲领

**定义 226.7**（几何 Langlands 纲领，Beilinson-Drinfeld 1990s）：**几何 Langlands 纲领**是 Langlands 纲领的代数几何类比。设 $X$ 是 $\mathbb{C}$ 上的光滑射影代数曲线，$G$ 是约化代数群。几何 Langlands 猜想断言存在范畴等价：

$$\mathcal{D}\text{-}\operatorname{Mod}(\operatorname{Bun}_G) \cong \operatorname{QCoh}(\operatorname{LocSys}_{G^\vee})$$

其中 $\operatorname{Bun}_G$ 是 $X$ 上 $G$-主丛的模叠，$\operatorname{LocSys}_{G^\vee}$ 是 $X$ 上 $G^\vee$-局部系统的模叠。

**定理 226.6**（几何 Langlands 的进展）：
- $\operatorname{GL}_1$ 的几何 Langlands：由 Laumon（1987）和 Rothstein（1996）证明（等价于 Abel-Jacobi 映射和 Fourier-Mukai 变换）
- 一般 $G$ 的几何 Langlands：Arinkin-Gaitsgory（2015）证明了 de Rham 版本的几何 Langlands 猜想（奇异支集定理）
- 几何 Langlands 与 S-对偶性：Kapustin-Witten（2007）将几何 Langlands 解释为 $\mathcal{N}=4$ 超 Yang-Mills 理论的电磁对偶

**定义 226.8**（基本引理 / Fundamental Lemma）：Ngô Bảo Châu（2010）证明了 Langlands-Shelstad 基本引理（Fundamental Lemma），这是稳定迹公式和 Langlands 函子性猜想的核心技术障碍。Ngô 因此获得 2010 年 Fields 奖。

**定理 226.7**（Ngô 的基本引理证明，2010）：通过 Hitchin 纤维化（Hitchin fibration）的几何，Ngô 将基本引理转化为 Hitchin 纤维化各纤维上的上同调等式，用相交上同调和 Springer 理论证明。

---

*本卷在 V12（抽象代数 II）和 V23（李理论）中表示论基础之上，深化了有限群模表示论（Brauer 特征标、块论、Green 对应）、代数群表示论（最高权理论、Kempf 消失定理、正特征表示论）、几何表示论（Springer 理论、Kazhdan-Lusztig 理论、几何 Satake、箭图簇）、仿射与量子群表示论（仿射 Kac-Moody 代数、顶点算子代数、量子仿射代数）和 Langlands 纲领深化（局部/整体 Langlands 对应、Arthur-Selberg 迹公式、几何 Langlands 纲领）。共 5 章。*

---

*本卷建立了李理论的核心框架：李群和李代数的基本关系（指数映射、CBH 公式、Lie 对应）将连续对称性转化为代数结构；半单李代数的分类理论（根系、Dynkin 图、Cartan-Killing 分类）是 19 世纪数学最伟大的成就之一；紧李群的表示论（Peter-Weyl 定理、最高权理论、Weyl 特征公式）为调和分析和量子力学提供了基础；齐性空间、对称空间和主丛上的联络理论将李群应用于微分几何。李理论是现代数学和物理学的核心语言，从基本粒子物理（规范理论）到数论（Langlands 纲领）都有深刻应用。**补充部分**整合了现代表示论深化，涵盖有限群模表示论（Brauer特征标、块论、Green对应）、代数群表示论（最高权理论、正特征表示论）、几何表示论（Springer理论、几何Satake、箭图簇）、仿射与量子群表示论，以及Langlands纲领深化（局部/整体对应、迹公式、几何Langlands），构建了从经典表示论到现代前沿的完整桥梁。*


*卷二十三：李理论终。*


*卷二十三：李理论终。*


*卷二十三：李理论终。*


*卷二十六：李理论终。*
---

## Hopf 代数与量子群导引

### 代数与余代数结构

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
