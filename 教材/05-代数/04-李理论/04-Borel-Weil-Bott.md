## 第87章：Kac-Moody代数与无限维李代数
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

---

---

---