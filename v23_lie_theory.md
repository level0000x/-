# 卷二十三：李理论

> 李理论是连续对称性的数学框架，由 Sophus Lie 在 19 世纪末创立。李群是带有光滑流形结构的群，李代数是其切空间上的线性结构。本卷从李群与李代数的基本关系出发，建立半单李代数的分类理论（根系、Dynkin 图），讨论紧李群的表示论（Peter-Weyl 定理、最高权理论），并介绍李群在几何中的应用。

---

## 第119章：李群与李代数
李群是微分流形和群的结合，李代数是李群在单位元处的切空间，带有 Lie 括号运算。本章建立李群和李代数的基本理论，以及指数映射。

### 119.1 李群的定义

**定义 119.1**（李群）：**李群** $G$ 是一个光滑流形（微分流形），同时是一个群，使得群运算（乘法 $G \times G \to G$ 和取逆 $G \to G$）都是光滑映射。

**例 119.1**（基本李群）：
- $\mathbb{R}^n$（加法群）是 Abel 李群
- $\mathbb{T}^n = \mathbb{R}^n / \mathbb{Z}^n$（$n$ 维环面）是紧 Abel 李群
- **一般线性群** $\operatorname{GL}(n, \mathbb{R}) = \{A \in M_n(\mathbb{R}) : \det A \neq 0\}$（$n^2$ 维）
- **特殊线性群** $\operatorname{SL}(n, \mathbb{R}) = \{A \in \operatorname{GL}(n, \mathbb{R}) : \det A = 1\}$（$n^2 - 1$ 维）
- **正交群** $\operatorname{O}(n) = \{A \in \operatorname{GL}(n, \mathbb{R}) : A^\top A = I\}$（$n(n-1)/2$ 维）
- **特殊正交群** $\operatorname{SO}(n) = \operatorname{O}(n) \cap \operatorname{SL}(n, \mathbb{R})$（紧，连通）
- **酉群** $\operatorname{U}(n) = \{A \in \operatorname{GL}(n, \mathbb{C}) : A^* A = I\}$（紧）
- **特殊酉群** $\operatorname{SU}(n) = \operatorname{U}(n) \cap \operatorname{SL}(n, \mathbb{C})$

**定义 119.2**（左不变向量场）：$G$ 上的向量场 $X$ 称为**左不变**的，如果 $(L_g)_* X = X$ 对所有 $g \in G$，其中 $L_g(h) = gh$ 是左平移。

**命题 119.1**：左不变向量场构成 $G$ 的切空间 $T_e G$ 的同构。左不变向量场的 Lie 括号仍为左不变，因此在 $T_e G$ 上诱导了 Lie 括号。

### 119.2 李代数的定义

**定义 119.3**（李代数）：（实或复）向量空间 $\mathfrak{g}$ 连同双线性映射 $[\cdot, \cdot]: \mathfrak{g} \times \mathfrak{g} \to \mathfrak{g}$（**Lie 括号**）称为**李代数**，如果满足：
1. 反称性：$[X, Y] = -[Y, X]$
2. Jacobi 恒等式：$[X, [Y, Z]] + [Y, [Z, X]] + [Z, [X, Y]] = 0$

**定义 119.4**（李群对应的李代数）：李群 $G$ 的**李代数** $\mathfrak{g} = \operatorname{Lie}(G) = T_e G$，带有从左不变向量场的 Lie 括号诱导的括号。

**例 119.2**（矩阵李群的李代数）：
- $\mathfrak{gl}(n, \mathbb{R}) = M_n(\mathbb{R})$，$[A, B] = AB - BA$
- $\mathfrak{sl}(n, \mathbb{R}) = \{A \in M_n(\mathbb{R}) : \operatorname{tr} A = 0\}$
- $\mathfrak{so}(n) = \{A \in M_n(\mathbb{R}) : A^\top = -A\}$（反对称矩阵）
- $\mathfrak{su}(n) = \{A \in M_n(\mathbb{C}) : A^* = -A, \operatorname{tr} A = 0\}$

**定理 119.1**（Lie 第三定理的局部版本）：每个有限维李代数 $\mathfrak{g}$ 是某个李群 $G$ 的李代数。$G$ 在连通且单连通时唯一确定。

*证明概要*（含 Ado 定理）：Ado 定理（1947）断言任意有限维 Lie 代数 $\mathfrak{g}$ 可忠实表示为 $\mathfrak{gl}(n)$ 的子代数。由 Lie 第三定理的局部版本，$\mathfrak{gl}(n)$ 对应 Lie 群 $\operatorname{GL}(n)$ 的邻域，作为子代数 $\mathfrak{g} \subseteq \mathfrak{gl}(n)$ 对应 $\operatorname{GL}(n)$ 的局部子群（由 CBH 公式）。取该局部子群生成的连通李群（或取单连通覆盖）即得 $G$。忠实性由 Ado 定理保证。∎

### 119.3 指数映射

**定义 119.5**（指数映射）：李群 $G$ 上的**指数映射** $\exp: \mathfrak{g} \to G$ 定义为 $\exp(X) = \gamma_X(1)$，其中 $\gamma_X: \mathbb{R} \to G$ 是满足 $\gamma_X(0) = e$ 和 $\gamma_X'(t) = X_{\gamma_X(t)}$ 的唯一单参数子群。

**命题 119.2**（指数映射的性质）：
1. $\exp(0) = e$
2. $\exp((t+s)X) = \exp(tX) \exp(sX)$
3. $\frac{d}{dt}\big|_{t=0} \exp(tX) = X$
4. $\exp$ 是单位元 $e \in G$ 附近的微分同胚
5. 对矩阵李群，$\exp(A) = \sum_{k=0}^\infty \frac{A^k}{k!}$（矩阵指数）

**定理 119.2**（Campbell-Baker-Hausdorff 公式）：对充分小的 $X, Y \in \mathfrak{g}$，

$$\exp(X) \exp(Y) = \exp(X + Y + \frac{1}{2}[X, Y] + \frac{1}{12}[X, [X, Y]] - \frac{1}{12}[Y, [X, Y]] + \cdots)$$

CBH 公式表明李群在单位元附近的乘法完全由李代数决定。

### 119.4 李群同态与李代数同态

**定理 119.3**（Lie 对应）：设 $G, H$ 是李群，$G$ 连通单连通。李群同态 $\varphi: G \to H$ 与李代数同态 $d\varphi: \mathfrak{g} \to \mathfrak{h}$ 一一对应。

*范畴等价概要*：Lie 对应的核心是单连通李群范畴 $\mathbf{SLieGrp}$ 与有限维 Lie 代数范畴 $\mathbf{LieAlg}_{\text{fin}}$ 等价。函子 $\operatorname{Lie}: \mathbf{SLieGrp} \to \mathbf{LieAlg}_{\text{fin}}$ 将李群映为其李代数，将同态映为其微分；逆函子由 Cartan 的整体化定理（或 Lie 第三定理的全局版本）给出。该等价将子李群对应子 Lie 代数，正规闭子群对应 Lie 代数理想，商群对应商代数。这证明了连续对称性完全由无穷小线性化决定。∎

**定义 119.6**（伴随表示）：李群 $G$ 的**伴随表示** $\operatorname{Ad}: G \to \operatorname{GL}(\mathfrak{g})$ 定义为 $\operatorname{Ad}(g) = d(I_g)_e$，其中 $I_g(h) = ghg^{-1}$ 是内自同构。其微分 $\operatorname{ad}: \mathfrak{g} \to \mathfrak{gl}(\mathfrak{g})$ 为 $\operatorname{ad}(X)(Y) = [X, Y]$。

**定理 119.4**（李群-李代数对应）：连通李群的子群与子代数、理想与正规子群、商群与商代数之间有一一对应。单连通李群范畴等价于有限维李代数范畴。

---

---

## 第120章：半单李代数
半单李代数是李理论的核心研究对象，具有完全可约性和丰富的结构理论。本章讨论 Killing 型、Cartan 子代数、根系和 Dynkin 图分类。

### 120.1 Killing 型与半单性

**定义 120.1**（Killing 型）：李代数 $\mathfrak{g}$ 的 **Killing 型**是对称双线性型

$$\kappa(X, Y) = \operatorname{tr}(\operatorname{ad}(X) \circ \operatorname{ad}(Y))$$

**定理 120.1**（Cartan 判别法）：$\mathfrak{g}$ 是半单的当且仅当 Killing 型非退化。$\mathfrak{g}$ 是可解的当且仅当 $\kappa(\mathfrak{g}, [\mathfrak{g}, \mathfrak{g}]) = 0$。

**定义 120.2**（半单李代数）：李代数 $\mathfrak{g}$ 称为**半单**的，如果它没有非零 Abel 理想。等价地，$\mathfrak{g}$ 可分解为单李代数的直和。

**详解 120.1**（Killing 型与 Cartan 判别准则）：Killing 型 $\kappa$ 是对称双线性型，由伴随表示的迹定义。其矩阵元为 $\kappa_{ij} = \sum_{k,l} c_{ik}^l c_{jl}^k$，其中 $c_{ij}^k$ 是结构常数。Cartan 第一判别准则：$\mathfrak{g}$ 可解当且仅当 $\kappa(\mathfrak{g}, [\mathfrak{g}, \mathfrak{g}]) = 0$。Cartan 第二判别准则（核心）：$\mathfrak{g}$ 半单当且仅当 Killing 型非退化（即 $\det(\kappa_{ij}) \neq 0$）。此判别法的威力在于将"半单性"这一结构性质转化为纯粹线性代数条件：只需计算 Killing 型矩阵是否满秩。非退化性等价于 $\mathfrak{g}$ 没有非零 Abel 理想，因为可解理想的 Killing 型必然退化。半单李代数的进一步性质：$\kappa$ 限制在 Cartan 子代数上仍非退化，从而诱导 $\mathfrak{h}$ 与 $\mathfrak{h}^*$ 的同构，为权与根的对偶理论奠定基础。

**例 120.1**：$\mathfrak{sl}(n, \mathbb{C})$（$n \geq 2$）、$\mathfrak{so}(n, \mathbb{C})$（$n \geq 3$，$n \neq 4$）、$\mathfrak{sp}(2n, \mathbb{C})$ 是半单李代数。$\mathfrak{gl}(n, \mathbb{C})$ 不是半单的（有一维中心）。

**定理 120.2**（Weyl 完全可约性定理）：半单李代数的每个有限维表示是完全可约的（可分解为不可约表示的直和）。

### 120.2 Cartan 子代数与根系

**定义 120.3**（Cartan 子代数）：半单李代数 $\mathfrak{g}$ 的 **Cartan 子代数** $\mathfrak{h}$ 是极大 Abel 子代数，且 $\operatorname{ad}(H)$（$H \in \mathfrak{h}$）可同时对角化。

**命题 120.1**：半单李代数 $\mathfrak{g}$ 关于 $\mathfrak{h}$ 的**根空间分解**为

$$\mathfrak{g} = \mathfrak{h} \oplus \bigoplus_{\alpha \in \Phi} \mathfrak{g}_\alpha$$

其中 $\mathfrak{g}_\alpha = \{X \in \mathfrak{g} : [H, X] = \alpha(H) X \text{ 对所有 } H \in \mathfrak{h}\}$，$\alpha \in \mathfrak{h}^* \setminus \{0\}$ 称为**根**。$\Phi \subseteq \mathfrak{h}^*$ 是根系。

**命题 120.2**（根系的性质）：
1. $\Phi$ 有限，张成 $\mathfrak{h}^*$
2. 若 $\alpha \in \Phi$，则 $-\alpha \in \Phi$，且 $k\alpha \in \Phi$（$k \in \mathbb{Z}$）仅当 $k = \pm 1$
3. $\dim \mathfrak{g}_\alpha = 1$
4. 对 $\alpha, \beta \in \Phi$，$\beta - \frac{2\kappa(\beta, \alpha)}{\kappa(\alpha, \alpha)} \alpha \in \Phi$（根系在反射下封闭）

**定义 120.4**（Weyl 群）：**Weyl 群** $W$ 由根反射 $s_\alpha(\beta) = \beta - \frac{2\kappa(\beta, \alpha)}{\kappa(\alpha, \alpha)} \alpha$ 生成。$W$ 是有限群，作用在 $\mathfrak{h}^*$ 上。

### 120.3 单根与 Dynkin 图

**定义 120.5**（正根与单根）：选取 $\mathfrak{h}^*$ 中的一个超平面使其不包含任何根，定义**正根** $\Phi^+$ 为超平面一侧的根。**单根** $\Delta \subseteq \Phi^+$ 是正根中不能分解为两个正根之和的根。

**命题 120.3**：单根 $\Delta$ 是 $\mathfrak{h}^*$ 的一组基。每个正根是单根的非负整数线性组合。

**定义 120.6**（Cartan 矩阵）：$A_{ij} = \frac{2\kappa(\alpha_i, \alpha_j)}{\kappa(\alpha_i, \alpha_i)}$（$\alpha_i, \alpha_j \in \Delta$）。$A_{ij} \in \{0, -1, -2, -3\}$（$i \neq j$）。

**定义 120.7**（Dynkin 图）：**Dynkin 图**以单根为节点，$A_{ij} A_{ji}$ 条边连接节点 $i$ 和 $j$。若 $|\alpha_i| > |\alpha_j|$，画箭头指向较短根。

**定理 120.3**（Cartan-Killing 分类）：复半单李代数（等价地，单李代数）由 Dynkin 图完全分类。连通 Dynkin 图有：

- $A_n$（$n \geq 1$）：$\mathfrak{sl}(n+1, \mathbb{C})$
- $B_n$（$n \geq 2$）：$\mathfrak{so}(2n+1, \mathbb{C})$
- $C_n$（$n \geq 3$）：$\mathfrak{sp}(2n, \mathbb{C})$
- $D_n$（$n \geq 4$）：$\mathfrak{so}(2n, \mathbb{C})$
- 例外李代数：$G_2$（14 维）、$F_4$（52 维）、$E_6$（78 维）、$E_7$（133 维）、$E_8$（248 维）

这是数学中最优美的分类定理之一，与 Lie 和 Killing 在 19 世纪末的工作以及 Cartan 的完善。

---

---

## 第121章：紧李群的表示
紧李群具有优美的表示论，其所有不可约表示都是有限维的，且完全由最高权分类。本章讨论 Peter-Weyl 定理和最高权理论。

### 121.1 紧李群上的 Haar 测度

**定理 121.1**（Haar 测度）：紧李群 $G$ 上存在唯一的（左）不变概率测度 $\mu$（Haar 测度），满足 $\mu(gA) = \mu(A)$ 对所有 $g \in G$ 和可测集 $A$。紧李群上 Haar 测度是双不变的。

**命题 121.1**（Weyl 积分公式）：对 $G$ 上的类函数 $f$（$f(gxg^{-1}) = f(x)$），

$$\int_G f(g) dg = \frac{1}{|W|} \int_T f(t) \prod_{\alpha \in \Phi^+} |e^{\alpha}(t) - e^{-\alpha}(t)|^2 dt$$

其中 $T$ 是极大环面，$W$ 是 Weyl 群。

### 121.2 Peter-Weyl 定理

**定义 121.1**（表示）：李群 $G$ 的（有限维）**表示**是李群同态 $\pi: G \to \operatorname{GL}(V)$（$V$ 是有限维向量空间）。

**定理 121.2**（Peter-Weyl 定理）：紧李群 $G$ 的矩阵系数（$\pi_{ij}$ 跑遍所有不可约表示）在 $L^2(G)$ 中稠密。即

$$L^2(G) \cong \widehat{\bigoplus}_{\pi \in \widehat{G}} V_\pi \otimes V_\pi^*$$

（Hilbert 空间直和）。每个不可约表示在 $L^2(G)$ 中出现的重数等于其维数。

**推论 121.3**：紧李群的所有不可约表示都是有限维的。紧李群有可数多个不可约表示（同构类）。

### 121.3 最高权理论

**定义 121.2**（权）：设 $\pi: G \to \operatorname{GL}(V)$ 是 $G$ 的表示。$\lambda \in \mathfrak{h}^*$ 称为表示的**权**，如果存在非零 $v \in V$ 使得 $\pi(H)v = \lambda(H) v$ 对所有 $H \in \mathfrak{h}$。权空间 $V_\lambda$ 是所有 $\lambda$-权向量的集合。

**定理 121.4**（最高权定理）：紧连通李群 $G$ 的不可约表示与**支配整权**（dominated integral weights）一一对应。每个不可约表示由唯一的**最高权** $\lambda$ 确定（所有其他权 $\mu$ 满足 $\lambda - \mu$ 是正根的非负整数组合）。

**定义 121.3**（支配整权）：$\lambda \in \mathfrak{h}^*$ 是**支配整权**，如果 $\frac{2\kappa(\lambda, \alpha)}{\kappa(\alpha, \alpha)} \in \mathbb{Z}_{\geq 0}$ 对所有正根 $\alpha$。

**详解 121.1**（最高权理论的基本框架）：最高权理论建立了支配整权与不可约表示之间的一一对应，其结构如下。第一步：选取 Cartan 子代数 $\mathfrak{h}$ 和正根系 $\Phi^+$，定义支配整权的集合 $P_+ = \{\lambda \in \mathfrak{h}^* : \langle \lambda, \alpha^\vee \rangle \in \mathbb{Z}_{\geq 0}, \forall \alpha \in \Phi^+\}$。第二步：对每个 $\lambda \in P_+$，构造 Verma 模 $M(\lambda) = U(\mathfrak{g}) \otimes_{U(\mathfrak{b})} \mathbb{C}_\lambda$（其中 $\mathfrak{b} = \mathfrak{h} \oplus \bigoplus_{\alpha > 0} \mathfrak{g}_\alpha$ 是 Borel 子代数），这是一个最高权为 $\lambda$ 的无穷维模。第三步：$M(\lambda)$ 有唯一的极大真子模，商模 $L(\lambda)$ 是唯一的最高权为 $\lambda$ 的不可约模。第四步：Weyl 完全可约性定理保证了每个有限维表示分解为 $L(\lambda)$ 的直和。此框架将李群表示论转化为权格的组合学，是现代表示论的标准范式。

**定理 121.5**（Weyl 维数公式）：最高权为 $\lambda$ 的不可约表示的维数为

$$\dim V_\lambda = \prod_{\alpha \in \Phi^+} \frac{\kappa(\lambda + \rho, \alpha)}{\kappa(\rho, \alpha)}$$

其中 $\rho = \frac{1}{2} \sum_{\alpha \in \Phi^+} \alpha$（所有正根之和的一半）。

**定理 121.6**（Weyl 特征公式）：最高权 $\lambda$ 的不可约表示的特征标为

$$\chi_\lambda = \frac{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\lambda + \rho)}}{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\rho)}}$$

其中 $\ell(w)$ 是 $w$ 的长度（表示为单反射的最小个数）。

**例 121.1**（$\operatorname{SU}(2)$ 的表示）：$\operatorname{SU}(2)$ 的不可约表示由非负半整数 $j = 0, 1/2, 1, 3/2, \ldots$ 参数化，$\dim V_j = 2j + 1$。$V_j$ 是 $j$ 次齐次二元多项式空间（或自旋 $j$ 表示）。

**例 121.2**（$\operatorname{SU}(3)$ 的表示）：$\operatorname{SU}(3)$ 的不可约表示由两个非负整数 $(p, q)$ 分类，$\dim V_{(p,q)} = (p+1)(q+1)(p+q+2)/2$。$(1, 0)$ 是基础表示 $\mathbf{3}$，$(0, 1)$ 是反基础表示 $\bar{\mathbf{3}}$。

---

---

## 第122章：李群在几何中的应用
李群在几何中有深刻的应用，包括齐性空间、对称空间和主丛上的联络理论。

### 122.1 齐性空间

**定义 122.1**（齐性空间）：李群 $G$ 的**齐性空间**是 $G$ 在流形 $M$ 上的可迁作用（即 $M = G/H$，其中 $H$ 是 $G$ 的闭子群）。

**例 122.1**（经典齐性空间）：
- 球面：$S^n \cong \operatorname{SO}(n+1) / \operatorname{SO}(n)$
- 实射影空间：$\mathbb{RP}^n \cong \operatorname{SO}(n+1) / \operatorname{O}(n)$
- 复射影空间：$\mathbb{CP}^n \cong \operatorname{SU}(n+1) / \operatorname{U}(n)$
- Grassmann 流形：$\operatorname{Gr}(k, n) \cong \operatorname{O}(n) / (\operatorname{O}(k) \times \operatorname{O}(n-k))$
- 上半平面：$\mathbb{H} \cong \operatorname{SL}(2, \mathbb{R}) / \operatorname{SO}(2)$

**定理 122.1**（Maurer-Cartan 形式）：李群 $G$ 上的 **Maurer-Cartan 形式** $\omega \in \Omega^1(G, \mathfrak{g})$ 定义为 $\omega_g(v) = (L_{g^{-1}})_* v$。满足 Maurer-Cartan 方程：

$$d\omega + \frac{1}{2}[\omega, \omega] = 0$$

### 122.2 对称空间

**定义 122.2**（对称空间）：**对称空间**是黎曼流形 $(M, g)$，每点 $p \in M$ 存在等距对合 $\sigma_p: M \to M$ 以 $p$ 为孤立不动点。

**定理 122.2**（Cartan 分类）：对称空间由 $(\mathfrak{g}, \mathfrak{h}, \sigma)$ 分类，其中 $\mathfrak{g}$ 是李代数，$\mathfrak{h}$ 是对合 $\sigma$ 的固定点子代数。$\mathfrak{g} = \mathfrak{h} \oplus \mathfrak{m}$（$\mathfrak{m}$ 是 $\sigma$ 的 $-1$ 特征空间），满足 $[\mathfrak{h}, \mathfrak{h}] \subseteq \mathfrak{h}$，$[\mathfrak{h}, \mathfrak{m}] \subseteq \mathfrak{m}$，$[\mathfrak{m}, \mathfrak{m}] \subseteq \mathfrak{h}$。

**例 122.2**（对称空间的例子）：
- 球面 $S^n$、双曲空间 $\mathbb{H}^n$、实/复/四元射影空间
- 紧李群本身（双不变量度）
- $\operatorname{SL}(n, \mathbb{R}) / \operatorname{SO}(n)$（正定对称矩阵空间）

### 122.3 主丛与联络

**定义 122.3**（主 $G$-丛）：流形 $M$ 上的**主 $G$-丛** $P$ 是纤维丛 $\pi: P \to M$，纤维是李群 $G$，$G$ 在 $P$ 上自由右作用，局部平凡化与 $G$ 作用兼容。

**定义 122.4**（联络）：$P$ 上的**联络**是 $\mathfrak{g}$-值 1-形式 $\omega \in \Omega^1(P, \mathfrak{g})$，满足：
1. $\omega(\tilde{X}) = X$（对 $X \in \mathfrak{g}$，$\tilde{X}$ 是 $X$ 生成的基本向量场）
2. $R_g^* \omega = \operatorname{Ad}(g^{-1}) \omega$（等变性）

**定义 122.5**（曲率）：联络 $\omega$ 的**曲率**为 $\Omega = d\omega + \frac{1}{2}[\omega, \omega]$（$\mathfrak{g}$-值 2-形式）。

**定理 122.3**（Cartan 结构方程）：在正交标架丛（或一般主丛）上，联络 $\omega$ 和曲率 $\Omega$ 满足 Cartan 结构方程：

$$d\omega = -\frac{1}{2}[\omega, \omega] + \Omega$$

（Maurer-Cartan 方程 $\Omega = 0$ 是平坦联络的特例）。

**例 122.3**（Chern-Weil 理论）：对 $G$-不变多项式 $P$ 在 $\mathfrak{g}$ 上，$P(\Omega)$ 是 $M$ 上的闭形式，其 de Rham 上同调类不依赖于联络的选择。这是示性类（Chern 类、Pontryagin 类、Euler 类）的构造基础。

**定理 122.4**（Chern-Weil 同态）：$G$-不变多项式环 $I(G)$ 到 $M$ 的 de Rham 上同调环 $H^*_{\text{dR}}(M)$ 之间存在同态。这给出了示性类的基本构造。

---

---

## 第123章：泛包络代数与PBW定理
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

## 第124章：Borel-Weil-Bott定理与几何实现
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

## 第125章：Kac-Moody代数与无限维李代数
Kac-Moody 代数是半单李代数的无限维推广，由 Cartan 矩阵定义，去掉了正定性条件。仿射 Kac-Moody 代数在共形场论、弦论和可积系统中起核心作用。

### 125.1 Kac-Moody代数的定义

**定义 125.1**（广义 Cartan 矩阵）：$n \times n$ 整数矩阵 $A = (a_{ij})$ 称为**广义 Cartan 矩阵**，如果：
1. $a_{ii} = 2$
2. $a_{ij} \leq 0$（$i \neq j$）
3. $a_{ij} = 0 \iff a_{ji} = 0$

若 $A$ 是正定的，则为有限维半单李代数的 Cartan 矩阵。若 $A$ 是半正定的（$\det A = 0$ 但所有主子式 $\geq 0$），对应**仿射型** Kac-Moody 代数。其他情形为**不定型**。

**定义 125.2**（Kac-Moody代数）：由广义 Cartan 矩阵 $A = (a_{ij})_{1 \leq i,j \leq n}$ 生成的 **Kac-Moody 代数** $\mathfrak{g}(A)$ 由 $3n$ 个生成元 $\{e_i, f_i, h_i\}_{i=1}^n$ 和以下关系定义：
- $[h_i, h_j] = 0$
- $[h_i, e_j] = a_{ij} e_j$，$[h_i, f_j] = -a_{ij} f_j$
- $[e_i, f_j] = \delta_{ij} h_i$
- $(\operatorname{ad} e_i)^{1 - a_{ij}}(e_j) = 0$（$i \neq j$，Serre 关系）
- $(\operatorname{ad} f_i)^{1 - a_{ij}}(f_j) = 0$

**定理 125.1**（Kac-Kazhdan 定理）：$\mathfrak{g}(A)$ 可通过最高权表示理论分类。所有可积最高权表示（即 $e_i, f_i$ 局部幂零作用）由其最高权完全分类——恰好对应于支配整权。

### 125.2 仿射李代数

**定义 125.3**（仿射 Kac-Moody 代数）：仿射李代数对应于半正定广义 Cartan 矩阵（$\det A = 0$），等价于有限维单李代数 $\mathfrak{g}$ 的**环代数**（loop algebra）的中心扩张：$\hat{\mathfrak{g}} = \mathfrak{g} \otimes \mathbb{C}[t, t^{-1}] \oplus \mathbb{C} K \oplus \mathbb{C} d$，其中 $K$ 是中心元，$d = t \frac{d}{dt}$ 是导子（degree operator）。

**定理 125.2**（仿射 Dynkin 图分类）：不可约仿射 Kac-Moody 代数由（扩展的）仿射 Dynkin 图分类：
- $A_n^{(1)}$（$n \geq 1$）、$B_n^{(1)}$（$n \geq 3$）、$C_n^{(1)}$（$n \geq 2$）、$D_n^{(1)}$（$n \geq 4$）
- $E_6^{(1)}, E_7^{(1)}, E_8^{(1)}, F_4^{(1)}, G_2^{(1)}$
- 扭仿射型（twisted）：$A_{2n}^{(2)}, A_{2n-1}^{(2)}, D_n^{(2)}, E_6^{(2)}, D_4^{(3)}$

**命题 125.1**（仿射李代数的有心扩张）：中心扩张 $\hat{\mathfrak{g}}$ 的中心元 $K$ 称为**中心荷**（central charge）或**水平**（level）。不可约最高权表示 $L(\Lambda)$ 的水平 $k = \Lambda(K)$ 是基本的离散参数。

### 125.3 Weyl-Kac特征公式与Macdonald恒等式

**定理 125.3**（Weyl-Kac 特征公式，Kac 1968）：不可约最高权 $\Lambda$ 的可积模 $L(\Lambda)$ 的（形式）特征标为
$$\operatorname{ch} L(\Lambda) = \frac{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\Lambda + \rho) - \rho}}{\prod_{\alpha \in \Phi^+} (1 - e^{-\alpha})^{\dim \mathfrak{g}_\alpha}}$$
其中 $W$ 是仿射 Weyl 群（由单根生成），$\rho$ 是仿射 Weyl 向量。

**定理 125.4**（Macdonald 恒等式，1972）：取 $\Lambda = 0$（平凡表示），Weyl-Kac 分母恒等式化为
$$\sum_{w \in W} (-1)^{\ell(w)} e^{w(\rho) - \rho} = \prod_{\alpha \in \Phi^+} (1 - e^{-\alpha})^{\dim \mathfrak{g}_\alpha}$$
对 $\hat{\mathfrak{sl}}(n)$，此即经典 Macdonald 恒等式的 $q$-级数推广，包含 Euler 五角数定理和 Jacobi 三重积恒等式作为特例。

### 125.4 顶点算子代数与共形场论

**定义 125.4**（顶点算子代数，Borcherds 1986 / Frenkel-Lepowsky-Meurman 1988）：仿射 Kac-Moody 代数 $\hat{\mathfrak{g}}$ 的最高权表示 $L(k\Lambda_0)$（水平 $k$）承载了**顶点算子代数**（Vertex Operator Algebra, VOA）的结构，其中顶点算子由生成元 $e_i(z) = \sum_n e_i(n) z^{-n-1}$ 的生成函数给出。VOA 的公理化框架（Borcherds）统一了共形场论、有限单群的月光猜想和仿射李代数表示论。

**定理 125.5**（Sugawara 构造，1968）：仿射 Lie 代数 $\hat{\mathfrak{g}}$ 的泛包络代数的完备化中，可通过生成元的正规序二次型构造 Virasoro 代数生成元 $L_n$——满足 $[L_m, L_n] = (m-n)L_{m+n} + \frac{c}{12}(m^3 - m)\delta_{m+n,0}$。这给出了共形场论中能量-动量张量的数学实现。中心荷 $c = \frac{k \dim \mathfrak{g}}{k + h^\vee}$（其中 $h^\vee$ 是对偶 Coxeter 数）。

---

---

---

## 第293章（补充）
> 表示论是研究代数结构（群、代数、李代数等）通过线性作用的具体实现的理论。V12 第 69 章已介绍了有限群表示论的基础，V23 涵盖了李群与李代数的表示论。本卷在此基础上深化表示论：有限群模表示论研究特征为素数的域上的表示结构；代数群表示论将群表示论推广到代数几何框架；几何表示论通过层论和相交上同调为表示论提供几何构造；仿射李代数与量子群表示论连接无限维李代数和可积系统；Langlands 纲领深化则从表示论角度揭示数论与调和分析之间的深刻联系。

---

---

## 第222章：有限群表示深化
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

## 第223章：代数群表示
代数群表示论将群表示论推广到代数几何框架，研究代数群（既是群又是代数簇）的线性表示。半单代数群和约化代数群的表示分类是 20 世纪表示论的最高成就之一。

### 223.1 线性代数群基础

**定义 223.1**（线性代数群）：**线性代数群** $G$ 是代数闭域 $k$ 上的仿射代数簇，带有群运算（乘法 $G \times G \to G$ 和取逆 $G \to G$），使得运算是代数簇的态射。

**例 223.1**（代数群的例子）：$\operatorname{GL}_n(k)$、$\operatorname{SL}_n(k)$、$\operatorname{SO}_n(k)$、$\operatorname{Sp}_{2n}(k)$、$\mathbb{G}_a = (k, +)$（加法群）、$\mathbb{G}_m = (k^\times, \times)$（乘法群）。

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

## 第224章：几何表示论
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

## 第225章：仿射与量子群表示
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

**定义 225.6**（量子仿射代数 $U_q(\hat{\mathfrak{g}})$）：**量子仿射代数**是仿射 Kac-Moody 代数 $\hat{\mathfrak{g}}$ 的量子包络代数的 $q$-形变。它是 Drinfeld-Jimbo 量子群（见 V23 Ch 118）的仿射版本。

**定义 225.7**（量子 R-矩阵与 Yang-Baxter 方程）：量子仿射代数 $U_q(\hat{\mathfrak{g}})$ 的泛 R-矩阵满足 Yang-Baxter 方程。有限维表示 $V$ 上的 R-矩阵 $R_{V,W}: V \otimes W \to V \otimes W$ 是谱依赖的（$R(z)$）。

**定理 225.4**（Baxter 的角转移矩阵与 Bethe 拟设）：量子仿射代数 $U_q(\hat{\mathfrak{sl}}_2)$ 的表示论与 XXZ 自旋链的 Bethe 拟设解直接相关。这是量子可积系统与量子群表示论的核心联系。

**定义 225.8**（Frenkel-Reshetikhin 的 $q$-特征标，1999）：量子仿射代数的有限维表示的 $q$-特征标是经典特征标的 $q$-形变，满足与 Baxter 的 T-Q 关系类似的性质。

---

---

## 第226章：Langlands 纲领深化
Langlands 纲领（V35 Ch 174 已有概述）是当代数学中最宏大的统一纲领之一。本章从表示论角度深化 Langlands 纲领的核心内容：局部 Langlands 对应、几何 Langlands 纲领和 Arthur-Selberg 迹公式。

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
