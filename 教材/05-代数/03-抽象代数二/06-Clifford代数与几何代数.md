## 第79章：Clifford 代数与旋量
Clifford 代数（W. K. Clifford, 1878）是平方型向量空间上最自然的非交换代数结构，将外代数和二次型信息融为一体。

**定义 78.1**（Clifford 代数）：设 $V$ 为 $\mathbb{F}$ 上的向量空间配以二次型 $Q: V \to \mathbb{F}$。Clifford 代数 $\operatorname{Cl}(V, Q)$ 是张量代数 $T(V)$ 模关系 $v \otimes v - Q(v) \cdot 1 = 0$（$\forall v \in V$）的商。等价刻画：$\operatorname{Cl}(V,Q)$ 是满足泛性质——任意 $\mathbb{F}$-代数 $A$ 和线性映射 $f: V \to A$ 使 $f(v)^2 = Q(v) \cdot 1_A$，可唯一扩充为代数同态 $\tilde{f}: \operatorname{Cl}(V,Q) \to A$——的 $\mathbb{F}$-代数。

**定理 78.1**（分类与维数）：若 $\dim V = n$ 且 $Q$ 非退化，则 $\operatorname{Cl}(V,Q) \cong \begin{cases} \mathbb{F} & n=0 \\ \mathbb{F} \oplus \mathbb{F} \text{ 或 } \mathbb{F}(\sqrt{a}) & n=1 \\ M_{2^k}(D) \text{ 或 } M_{2^{k-1}}(D \oplus D') & n \geq 2 \end{cases}$，其中除环 $D$ 由 $\mathbb{F}$ 上的 Brauer 类决定。维数为 $\dim \operatorname{Cl}(V,Q) = 2^n$。

**低维实 Clifford 代数**：$\operatorname{Cl}_{0,2}(\mathbb{R}) \cong \mathbb{H}$（四元数）；$\operatorname{Cl}_{3,0}(\mathbb{R}) \cong \mathbb{H} \oplus \mathbb{H}$；$\operatorname{Cl}_{1,3}(\mathbb{R}) \cong M_2(\mathbb{H})$（与旋量群 $\operatorname{Spin}(1,3)$ 相关）。Spin 群的定义为 $\operatorname{Spin}(V,Q) = \{v_1 \cdots v_{2k} \in \operatorname{Cl}^0(V,Q) : Q(v_i) = \pm 1\}$，是 $\operatorname{SO}(V,Q)$ 的二重覆叠群——这是描述 $\frac{1}{2}$-自旋粒子（旋量表示）的严格代数工具。

Clifford 代数在 Dirac 方程（量子场论中描述费米子）、Atiyah-Singer 指标定理的算子表述、以及 $K$-理论的 Bott 周期性定理中有核心地位。

**证明**：$n=0$ 时 $\operatorname{Cl}(V,Q) = \mathbb{F}$。$n=1$ 时取 $V = \mathbb{F} e$，$Q(e) = a \neq 0$，则 $e^2 = a$，故 $\operatorname{Cl}(V,Q) \cong \mathbb{F}[x]/(x^2-a)$。若 $a$ 为平方数则 $\cong \mathbb{F} \oplus \mathbb{F}$，否则 $\cong \mathbb{F}(\sqrt{a})$。$n \geq 2$ 时，利用 Clifford 代数的 $\mathbb{Z}_2$-分次结构和 Wall 的 Brauer 群分类：$\operatorname{Cl}(V,Q)$ 为 $\mathbb{Z}_2$-分次中心单代数，其 Brauer 类由 $Q$ 的 Hasse-Witt 不变量决定。$\dim \operatorname{Cl}(V,Q) = 2^n$ 由基 $\{e_{i_1} \cdots e_{i_k} : i_1 < \cdots < i_k\}$ 直接计算得到。$\operatorname{Spin}(V,Q)$ 为 $\operatorname{Cl}^0(V,Q)$ 中满足 $v_1 \cdots v_{2k}$ 且 $Q(v_i) = \pm 1$ 的元素，到 $\operatorname{SO}(V,Q)$ 的映射 $x \mapsto (v \mapsto x v x^{-1})$ 为二重覆叠。 $\blacksquare$

## Clifford 代数与旋量理论的现代应用

Clifford 代数在 20 世纪数学和物理中发挥了核心作用，其影响远超最初的外代数与二次型的结合。**Bott 周期性定理**（1970）的证明借助 Clifford 代数给出了最简洁的表述：$\operatorname{Cl}_{p,q+8} \cong M_{16}(\operatorname{Cl}_{p,q})$，即 Clifford 代数在 8 个维数上具有周期性。这一周期性直接导致拓扑 K-理论的 Bott 周期性 $K^{-n}(X) \cong K^{-n-8}(X)$，并推广到 KR-理论和弦论中的 D-膜分类。**Atiyah-Bott-Shapiro 构造**（1964）利用 Clifford 模将 Spin 流形上的 Dirac 算子与 K-理论中的 Thom 同构联系起来，这是 Atiyah-Singer 指标定理证明的核心技术环节。**旋量丛**（spinor bundle）$\mathcal{S}$ 在 Riemann 几何中定义为 $\operatorname{Spin}$-主丛与旋量表示的关联丛，Dirac 算子 $D: \Gamma(\mathcal{S}) \to \Gamma(\mathcal{S})$ 是一阶椭圆微分算子，其平方 $D^2 = \nabla^*\nabla + \frac{1}{4}R$（Lichnerowicz 公式）将曲率与 Laplacian 联系起来，阻碍了正标量曲率度量的存在。**Gromov-Lawson 和 Schoen-Yau 定理**（1980s）利用 Dirac 算子证明了某些流形（如环面 $T^n$）不容许正标量曲率度量，这是几何分析中最重要的刚性结果之一。在**表示论**中，Clifford 代数与 Weyl 代数的关系（通过 $[x_i, \partial_j] = \delta_{ij}$ 和 $[e_i, e_j] = 2\delta_{ij}$ 的对比）揭示了两类基本非交换代数之间的深层联系，并在 Dubrovin 的 Frobenius 簇理论和量子上同调中扮演基本角色。**超对称量子力学**中的超荷 $Q$ 满足 $Q^2 = H$（$H$ 为 Hamilton 量），这正是 Clifford 代数中 $e^2 = Q(e)$ 的物理实现。在**引力理论**中，标架形式（vielbein formalism）和自旋联络（spin connection）的核心代数结构正是 Clifford 代数，它提供了将旋量场耦合到引力场的唯一相容方式。Clifford 代数还在**Atiyah-Singer 指标定理**的 Getzler 证明（1983）中扮演关键角色：Getzler 利用 Clifford 代数在 $\mathbb{R}^n$ 上的渐近展开，将热核的超迹（supertrace）归约为 Clifford 代数的超迹（Berezin 积分），从而将 A-roof 类与 Dirac 算子的指标联系起来。

---
