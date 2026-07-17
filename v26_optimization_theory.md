# 卷二十六：优化理论

> 优化理论是数学在工程、经济和科学决策中的核心工具，研究在约束条件下最大化或最小化目标函数。本卷在初等线性规划（V2 Ch 11）和线性代数（V7）的基础上，建立线性规划的单纯形法和对偶理论，然后深入凸优化、非线性规划（KKT 条件）和变分法与最优控制引论。

---

## 第132章：线性规划与单纯形法
线性规划（Linear Programming, LP）是优化理论中研究最成熟的分支，由 Dantzig 在 1947 年提出单纯形法（Simplex Method）而建立。

### 132.1 线性规划的标准形式

**定义 132.1**（线性规划的标准形式）：

$$\begin{aligned} \min \quad & \mathbf{c}^T \mathbf{x} \\ \text{s.t.} \quad & A\mathbf{x} = \mathbf{b} \\ & \mathbf{x} \geq \mathbf{0} \end{aligned}$$

其中 $\mathbf{c} \in \mathbb{R}^n$，$A \in \mathbb{R}^{m \times n}$，$\mathbf{b} \in \mathbb{R}^m$。$m \leq n$ 且 $\operatorname{rank}(A) = m$。

**定义 132.2**（可行域）：可行域 $\mathcal{F} = \{\mathbf{x} \in \mathbb{R}^n : A\mathbf{x} = \mathbf{b}, \mathbf{x} \geq \mathbf{0}\}$ 是**多面体**（polyhedron）。若 $\mathcal{F}$ 有界，则称为**多胞体**（polytope）。

**定理 132.1**（线性规划的基本定理）：若 LP 有有限最优值，则存在最优解是 $\mathcal{F}$ 的顶点（基本可行解）。

*证明思路*：目标函数 $\mathbf{c}^T \mathbf{x}$ 是线性的，在多面体 $\mathcal{F}$ 上的最小值必然在极值点达到。若 $\mathcal{F}$ 有界，最优解在顶点上；若无界，沿极方向移动不会使目标函数严格减小。∎

**定义 132.3**（基本可行解）：将 $A$ 分块为 $A = [B \mid N]$，其中 $B \in \mathbb{R}^{m \times m}$ 可逆（基矩阵），$N$ 为非基列。对应的 $\mathbf{x} = \begin{pmatrix} \mathbf{x}_B \\ \mathbf{x}_N \end{pmatrix}$ 满足 $\mathbf{x}_B = B^{-1}\mathbf{b} \geq \mathbf{0}$，$\mathbf{x}_N = \mathbf{0}$，称为**基本可行解**（BFS）。

### 132.2 单纯形法

**算法 132.1**（单纯形法 / Simplex Method）：

1. **初始化**：找到一个初始 BFS
2. **定价**（Pricing）：计算简约费用 $\bar{\mathbf{c}}_N = \mathbf{c}_N - N^T B^{-T} \mathbf{c}_B$。若 $\bar{\mathbf{c}}_N \geq \mathbf{0}$，当前解为最优解，停止
3. **进基**：选择 $j$ 满足 $\bar{c}_j < 0$（通常选择最负的），$x_j$ 进入基
4. **离基**：计算 $\mathbf{d} = B^{-1} A_j$（$A_j$ 为进基列）。若 $\mathbf{d} \leq \mathbf{0}$，问题无界。否则选择 $\theta = \min_{d_i > 0} \frac{(\mathbf{x}_B)_i}{d_i}$，令离基变量为达到最小比值的行对应的变量
5. **更新**：更新基矩阵 $B$ 和 $\mathbf{x}_B$，返回步骤 2

**定理 132.2**（单纯形法的有限终止性）：若 LP 非退化（所有 BFS 中基变量严格为正），则单纯形法在有限步内终止于最优解或判定无界。

*退化处理*：当出现退化时，可能循环。Bland 法则（最小下标法则）保证有限终止。

**命题 132.3**（单纯形法的几何解释）：单纯形法沿着可行多面体的边移动，从当前顶点到相邻顶点，每次移动降低目标函数值。

### 132.3 初始可行解的构造

**定义 132.4**（两阶段法）：
- **阶段 I**：引入人工变量，求解辅助 LP $\min \sum \mathbf{1}^T \mathbf{a}$，s.t. $A\mathbf{x} + \mathbf{a} = \mathbf{b}, \mathbf{x} \geq 0, \mathbf{a} \geq 0$。若最优值为 0，则得到原问题的可行 BFS
- **阶段 II**：从阶段 I 得到的 BFS 出发，求解原问题

**定义 132.5**（大 M 法）：直接求解 $\min \mathbf{c}^T \mathbf{x} + M \sum a_i$，其中 $M > 0$ 充分大，使得人工变量在最优解中必为 0。

### 132.4 内点法

**定理 132.4**（Karmarkar 算法，1984）：存在求解 LP 的多项式时间算法（内点法），基于将可行域变换并沿梯度方向移动。

**定义 132.6**（障碍函数法）：考虑问题 $\min \mathbf{c}^T \mathbf{x} - \mu \sum_{i=1}^n \ln x_i$ s.t. $A\mathbf{x} = \mathbf{b}$。当 $\mu \to 0$ 时，最优解趋近于原 LP 的最优解。这是**原-对偶内点法**的基础。

---

---

## 第133章：对偶理论与灵敏度分析
对偶理论是线性规划中与每个原问题（Primal）自然关联的另一个线性规划问题（Dual），两者之间有深刻的关系。

### 133.1 对偶问题的构造

**定义 133.1**（对偶问题）：对标准形式 LP（Primal）：

$$\begin{aligned} \min \quad & \mathbf{c}^T \mathbf{x} \\ \text{s.t.} \quad & A\mathbf{x} = \mathbf{b}, \quad \mathbf{x} \geq \mathbf{0} \end{aligned}$$

其对偶问题（Dual）为：

$$\begin{aligned} \max \quad & \mathbf{b}^T \mathbf{y} \\ \text{s.t.} \quad & A^T \mathbf{y} \leq \mathbf{c} \end{aligned}$$

其中 $\mathbf{y} \in \mathbb{R}^m$ 为对偶变量。

**定理 133.1**（弱对偶定理）：若 $\mathbf{x}$ 是原问题可行解，$\mathbf{y}$ 是对偶问题可行解，则 $\mathbf{c}^T \mathbf{x} \geq \mathbf{b}^T \mathbf{y}$。

*证明*：$\mathbf{c}^T \mathbf{x} \geq (A^T \mathbf{y})^T \mathbf{x} = \mathbf{y}^T A \mathbf{x} = \mathbf{y}^T \mathbf{b} = \mathbf{b}^T \mathbf{y}$。∎

**定理 133.2**（强对偶定理）：若原问题有有限最优解 $\mathbf{x}^*$，则对偶问题也有有限最优解 $\mathbf{y}^*$，且 $\mathbf{c}^T \mathbf{x}^* = \mathbf{b}^T \mathbf{y}^*$。

*证明思路*：单纯形法终止时，基矩阵 $B$ 满足 $\bar{\mathbf{c}}_N \geq 0$。令 $\mathbf{y}^* = B^{-T} \mathbf{c}_B$，则 $\mathbf{y}^*$ 是对偶可行解，且目标值相等。由弱对偶定理，$\mathbf{y}^*$ 是最优的。∎

**定理 133.3**（互补松弛定理）：设 $\mathbf{x}^*$ 为原问题最优解，$\mathbf{y}^*$ 为对偶问题最优解，则

$$x_j^* \cdot (\mathbf{c}_j - \mathbf{a}_j^T \mathbf{y}^*) = 0, \quad \forall j$$

即原变量和对偶松弛变量不能同时为正。

**推论 133.4**：线性规划的可能情况（原问题/对偶问题）：
- 原问题有有限最优解 $\iff$ 对偶问题有有限最优解
- 原问题无界 $\implies$ 对偶问题不可行
- 原问题不可行 $\implies$ 对偶问题无界或不可行

### 133.2 对偶的经济解释

**定义 133.2**（影子价格）：对偶变量 $y_i$ 是第 $i$ 个约束资源的**影子价格**（shadow price），即增加一单位资源 $b_i$ 时最优值的边际改进。

**定理 133.5**（灵敏度分析）：若基矩阵 $B$ 的最优性不受扰动影响，则 $\Delta z^* = \mathbf{y}^{*T} \Delta \mathbf{b}$。

### 133.3 对偶在非 LP 情形的推广

**定义 133.3**（Lagrange 对偶）：对一般约束优化问题

$$\min_{\mathbf{x}} f(\mathbf{x}) \quad \text{s.t.} \quad g_i(\mathbf{x}) \leq 0, \; h_j(\mathbf{x}) = 0$$

定义 Lagrange 函数 $L(\mathbf{x}, \boldsymbol{\lambda}, \boldsymbol{\nu}) = f(\mathbf{x}) + \sum \lambda_i g_i(\mathbf{x}) + \sum \nu_j h_j(\mathbf{x})$，其中 $\boldsymbol{\lambda} \geq 0$。Lagrange 对偶函数为 $d(\boldsymbol{\lambda}, \boldsymbol{\nu}) = \inf_{\mathbf{x}} L(\mathbf{x}, \boldsymbol{\lambda}, \boldsymbol{\nu})$。

**定理 133.6**（弱对偶，一般情形）：对任意 $\boldsymbol{\lambda} \geq 0$，$d(\boldsymbol{\lambda}, \boldsymbol{\nu}) \leq p^*$（原问题最优值）。对偶间隙为 $p^* - d^* \geq 0$。

---

---

## 第134章：凸优化
凸优化是优化理论中最重要的子领域，其核心优势在于：凸问题的局部最优解就是全局最优解。本章从凸集和凸函数的基本概念出发，建立凸优化问题的标准形式及对偶理论（KKT 充要条件），为后续非线性规划和变分法中的最优性条件奠定几何基础。

### 134.1 凸集与凸函数

**定义 134.1**（凸集）：集合 $C$ 是**凸集**，如果对任意 $\mathbf{x}, \mathbf{y} \in C$ 和 $\theta \in [0, 1]$，有 $\theta \mathbf{x} + (1-\theta)\mathbf{y} \in C$。

**例 134.1**（常见凸集）：
- 超平面 $\{\mathbf{x} : \mathbf{a}^T \mathbf{x} = b\}$ 和半空间 $\{\mathbf{x} : \mathbf{a}^T \mathbf{x} \leq b\}$
- 多面体 $\{\mathbf{x} : A\mathbf{x} \preceq \mathbf{b}\}$
- 范数球 $\{\mathbf{x} : \|\mathbf{x}\| \leq r\}$
- 半正定锥 $\mathbb{S}_+^n = \{X \in \mathbb{S}^n : X \succeq 0\}$

**定义 134.2**（保凸运算）：凸集的交是凸集；凸集在仿射映射下的像和原像都是凸集；两个凸集的 Minkowski 和是凸集。

**定义 134.3**（凸函数）：函数 $f: \mathbb{R}^n \to \mathbb{R}$ 是**凸函数**，如果定义域 $\operatorname{dom} f$ 是凸集，且对任意 $\mathbf{x}, \mathbf{y} \in \operatorname{dom} f$ 和 $\theta \in [0, 1]$，

$$f(\theta \mathbf{x} + (1-\theta)\mathbf{y}) \leq \theta f(\mathbf{x}) + (1-\theta) f(\mathbf{y})$$

若严格不等式成立（$\mathbf{x} \neq \mathbf{y}, \theta \in (0,1)$），则称为**严格凸函数**。

**定理 134.1**（凸函数的判定与无约束极小）：
1. **一阶条件**：若 $f$ 可微，$f$ 为凸 $\iff$ $f(\mathbf{y}) \geq f(\mathbf{x}) + \nabla f(\mathbf{x})^T (\mathbf{y} - \mathbf{x})$ 对所有 $\mathbf{x}, \mathbf{y}$ 成立
2. **二阶条件**：若 $f$ 二阶可微，$f$ 为凸 $\iff$ $\nabla^2 f(\mathbf{x}) \succeq 0$（Hessian 半正定）对所有 $\mathbf{x}$ 成立

*无约束极小的充要条件*（次梯度条件）：设 $f$ 为凸函数，则 $\mathbf{x}^*$ 是全局极小点当且仅当 $\mathbf{0} \in \partial f(\mathbf{x}^*)$。其中 $\partial f(\mathbf{x}^*) = \{\mathbf{g} : f(\mathbf{y}) \geq f(\mathbf{x}^*) + \mathbf{g}^T(\mathbf{y} - \mathbf{x}^*), \forall \mathbf{y}\}$ 为次微分。若 $f$ 在 $\mathbf{x}^*$ 处可微，则此条件退化为 $\nabla f(\mathbf{x}^*) = \mathbf{0}$。证明：充分性由次梯度定义直接得 $f(\mathbf{y}) \geq f(\mathbf{x}^*)$，必要性由凸分离定理。∎

**例 134.2**（常见凸函数）：$e^{ax}$，$x^a$（$a \geq 1$ 或 $a \leq 0$），$-\ln x$，$\|x\|$（任意范数），$\max\{x_1, \ldots, x_n\}$，$\log(e^{x_1} + \cdots + e^{x_n})$（log-sum-exp）。

### 134.2 凸优化问题的标准形式

**定义 134.4**（凸优化问题）：

$$\begin{aligned} \min \quad & f_0(\mathbf{x}) \\ \text{s.t.} \quad & f_i(\mathbf{x}) \leq 0, \quad i = 1, \ldots, m \\ & A\mathbf{x} = \mathbf{b} \end{aligned}$$

其中 $f_0, f_1, \ldots, f_m$ 是凸函数。可行域是凸集。

**定理 134.2**（凸优化的基本性质）：凸优化问题的任何局部最优解都是全局最优解。最优解集是凸集。

*证明*：设 $\mathbf{x}^*$ 是局部最优解。若存在 $\mathbf{y}$ 满足 $f_0(\mathbf{y}) < f_0(\mathbf{x}^*)$，则对充分小的 $\theta > 0$，$\theta \mathbf{y} + (1-\theta)\mathbf{x}^*$ 在 $\mathbf{x}^*$ 的邻域内，且 $f_0(\theta \mathbf{y} + (1-\theta)\mathbf{x}^*) \leq \theta f_0(\mathbf{y}) + (1-\theta)f_0(\mathbf{x}^*) < f_0(\mathbf{x}^*)$，矛盾。∎

**例 134.3**（经典凸优化问题）：
- **线性规划**（LP）：$f_i$ 均为仿射函数
- **二次规划**（QP）：$f_0$ 为二次凸函数，$f_i$ 为仿射函数
- **二阶锥规划**（SOCP）：$\min \mathbf{c}^T \mathbf{x}$ s.t. $\|A_i \mathbf{x} + \mathbf{b}_i\|_2 \leq \mathbf{c}_i^T \mathbf{x} + d_i$
- **半正定规划**（SDP）：$\min \mathbf{c}^T \mathbf{x}$ s.t. $F_0 + \sum x_i F_i \succeq 0$（$F_i$ 为对称矩阵）

上述问题有嵌套关系：$\text{LP} \subset \text{QP} \subset \text{SOCP} \subset \text{SDP}$。

### 134.3 对偶理论在凸优化中的应用

**定理 134.3**（Slater 条件）：若凸优化问题存在严格可行点（即 $\mathbf{x} \in \operatorname{relint} \mathcal{D}$ 满足 $f_i(\mathbf{x}) < 0$ 对所有不等式约束，$A\mathbf{x} = \mathbf{b}$），则强对偶成立（对偶间隙为 0）。

**定理 134.4**（KKT 条件是最优性的充要条件，凸情形）：若凸优化问题满足 Slater 条件，则 $\mathbf{x}^*$ 是最优解当且仅当存在 $\boldsymbol{\lambda}^*, \boldsymbol{\nu}^*$ 满足 KKT 条件（见第 135 章）。

---

---

## 第135章：非线性规划
非线性规划（NLP）处理目标函数或约束为非线性的一般优化问题。Karush-Kuhn-Tucker（KKT）条件是一阶必要条件，在凸情形下也是充分条件。

### 135.1 无约束优化

**定理 135.1**（一阶必要条件）：若 $\mathbf{x}^*$ 是无约束问题 $\min f(\mathbf{x})$ 的局部极小点，且 $f$ 在 $\mathbf{x}^*$ 处可微，则 $\nabla f(\mathbf{x}^*) = \mathbf{0}$。

**定理 135.2**（二阶必要条件）：若 $\mathbf{x}^*$ 是局部极小点，且 $f$ 在 $\mathbf{x}^*$ 处二阶可微，则 $\nabla^2 f(\mathbf{x}^*) \succeq 0$。

**定理 135.3**（二阶充分条件）：若 $\nabla f(\mathbf{x}^*) = \mathbf{0}$ 且 $\nabla^2 f(\mathbf{x}^*) \succ 0$，则 $\mathbf{x}^*$ 是严格局部极小点。

**算法 135.1**（梯度下降法）：$\mathbf{x}_{k+1} = \mathbf{x}_k - \alpha_k \nabla f(\mathbf{x}_k)$，其中 $\alpha_k$ 为步长（由线搜索或固定值确定）。

**算法 135.2**（Newton 法）：$\mathbf{x}_{k+1} = \mathbf{x}_k - [\nabla^2 f(\mathbf{x}_k)]^{-1} \nabla f(\mathbf{x}_k)$。在初始点充分接近最优解时，Newton 法具有二次收敛速度。

**定理 135.4**（Newton 法的收敛速度）：若 $f$ 是强凸函数且 Hessian Lipschitz 连续，则 Newton 法局部二次收敛：$\|\mathbf{x}_{k+1} - \mathbf{x}^*\| \leq C \|\mathbf{x}_k - \mathbf{x}^*\|^2$。

**算法 135.3**（拟 Newton 法 / BFGS）：维护 Hessian 近似 $B_k$，更新公式：

$$B_{k+1} = B_k - \frac{B_k \mathbf{s}_k \mathbf{s}_k^T B_k}{\mathbf{s}_k^T B_k \mathbf{s}_k} + \frac{\mathbf{y}_k \mathbf{y}_k^T}{\mathbf{y}_k^T \mathbf{s}_k}$$

其中 $\mathbf{s}_k = \mathbf{x}_{k+1} - \mathbf{x}_k$，$\mathbf{y}_k = \nabla f(\mathbf{x}_{k+1}) - \nabla f(\mathbf{x}_k)$。

### 135.2 约束优化与 KKT 条件

**定义 135.1**（一般约束优化问题）：

$$\begin{aligned} \min \quad & f(\mathbf{x}) \\ \text{s.t.} \quad & g_i(\mathbf{x}) \leq 0, \quad i = 1, \ldots, m \\ & h_j(\mathbf{x}) = 0, \quad j = 1, \ldots, p \end{aligned}$$

**定理 135.5**（KKT 必要条件，Karush-Kuhn-Tucker，1951）：设 $\mathbf{x}^*$ 是局部极小点，$f, g_i, h_j$ 连续可微，且约束规范条件（如 LICQ：$\nabla g_i(\mathbf{x}^*)$（活跃约束）与 $\nabla h_j(\mathbf{x}^*)$ 线性无关）成立。则存在 Lagrange 乘子 $\boldsymbol{\lambda}^* \geq \mathbf{0}$ 和 $\boldsymbol{\nu}^*$ 满足：

$$\begin{aligned}
\nabla f(\mathbf{x}^*) + \sum_{i=1}^m \lambda_i^* \nabla g_i(\mathbf{x}^*) + \sum_{j=1}^p \nu_j^* \nabla h_j(\mathbf{x}^*) &= \mathbf{0} \quad &\text{(稳定性)} \\
g_i(\mathbf{x}^*) &\leq 0, \quad i = 1, \ldots, m \quad &\text{(原可行性)} \\
h_j(\mathbf{x}^*) &= 0, \quad j = 1, \ldots, p \quad &\text{(原可行性)} \\
\lambda_i^* &\geq 0, \quad i = 1, \ldots, m \quad &\text{(对偶可行性)} \\
\lambda_i^* g_i(\mathbf{x}^*) &= 0, \quad i = 1, \ldots, m \quad &\text{(互补松弛性)}
\end{aligned}$$

**定理 135.6**（KKT 充分条件，凸情形）：若 $f$ 和 $g_i$ 是凸函数，$h_j$ 是仿射函数，且 $\mathbf{x}^*$ 和 $(\boldsymbol{\lambda}^*, \boldsymbol{\nu}^*)$ 满足 KKT 条件，则 $\mathbf{x}^*$ 是全局最优解。

### 135.3 约束规范条件

**定义 135.2**（常见约束规范 / Constraint Qualifications）：
- **LICQ**（线性独立约束规范）：活跃约束的梯度线性无关（最强）
- **MFCQ**（Mangasarian-Fromovitz CQ）：等式约束梯度线性无关，且存在方向使所有不等式约束严格减小
- **Slater 条件**（凸情形）：存在严格可行点

**命题 135.7**：LICQ $\implies$ MFCQ $\implies$ Abadie CQ。在凸情形下，Slater 条件 $\implies$ KKT 条件成立。

### 135.4 罚函数法与增广 Lagrange 法

**定义 135.3**（外罚函数法）：将约束优化转化为无约束问题：

$$\min_{\mathbf{x}} f(\mathbf{x}) + \frac{\rho}{2} \left( \sum_{i=1}^m \max\{0, g_i(\mathbf{x})\}^2 + \sum_{j=1}^p h_j(\mathbf{x})^2 \right)$$

当 $\rho \to \infty$ 时，解趋近于原约束问题的最优解。

**定义 135.4**（增广 Lagrange 函数 / Augmented Lagrangian）：

$$L_A(\mathbf{x}, \boldsymbol{\lambda}, \boldsymbol{\nu}; \rho) = f(\mathbf{x}) + \sum_{i=1}^m \lambda_i g_i(\mathbf{x}) + \sum_{j=1}^p \nu_j h_j(\mathbf{x}) + \frac{\rho}{2}\left( \sum_{i=1}^m g_i(\mathbf{x})^2 + \sum_{j=1}^p h_j(\mathbf{x})^2 \right)$$

（仅对等式约束使用二次罚项，不等式约束可通过引入松弛变量转化为等式约束）

**算法 135.4**（增广 Lagrange 法 / 乘子法）：
1. 初始化 $\boldsymbol{\lambda}^0, \boldsymbol{\nu}^0, \rho_0$
2. 求解 $\mathbf{x}^{k+1} = \arg\min_{\mathbf{x}} L_A(\mathbf{x}, \boldsymbol{\lambda}^k, \boldsymbol{\nu}^k; \rho_k)$
3. 更新乘子：$\lambda_i^{k+1} = \max\{0, \lambda_i^k + \rho_k g_i(\mathbf{x}^{k+1})\}$，$\nu_j^{k+1} = \nu_j^k + \rho_k h_j(\mathbf{x}^{k+1})$
4. 增大 $\rho_{k+1} > \rho_k$，重复

---

---

## 第136章：变分法与最优控制引论
变分法研究泛函（函数的函数）的极值问题，起源于 Bernoulli 的最速降线问题（1696年）和 Euler-Lagrange 的工作。最优控制是变分法的现代推广，由 Pontryagin 极大值原理和 Bellman 动态规划奠定。

### 136.1 Euler-Lagrange 方程

**定义 136.1**（最简泛函）：考虑泛函

$$J[y] = \int_a^b F(x, y(x), y'(x)) \, dx$$

其中 $y(a) = \alpha$，$y(b) = \beta$ 固定。

**定理 136.1**（Euler-Lagrange 方程）：若 $y(x)$ 使 $J[y]$ 取极值，且 $F$ 充分光滑，则 $y$ 满足

$$\frac{\partial F}{\partial y} - \frac{d}{dx}\left( \frac{\partial F}{\partial y'} \right) = 0$$

*证明思路*：考虑变分 $\tilde{y} = y + \varepsilon \eta(x)$，其中 $\eta(a) = \eta(b) = 0$。计算一阶变分：
$$\frac{d}{d\varepsilon} J[y + \varepsilon \eta]\bigg|_{\varepsilon=0} = \int_a^b \left( \frac{\partial F}{\partial y} \eta + \frac{\partial F}{\partial y'} \eta' \right) dx = 0$$
对第二项分部积分：$\int_a^b \frac{\partial F}{\partial y'} \eta' dx = \left[ \frac{\partial F}{\partial y'} \eta \right]_a^b - \int_a^b \frac{d}{dx}\left( \frac{\partial F}{\partial y'} \right) \eta dx$。由 $\eta(a) = \eta(b) = 0$，边界项为零，代入得：
$$\int_a^b \left( \frac{\partial F}{\partial y} - \frac{d}{dx} \frac{\partial F}{\partial y'} \right) \eta(x) dx = 0$$
由变分法基本引理（$\eta$ 任意性），被积函数恒为零，即得 Euler-Lagrange 方程。∎

**例 136.1**（最速降线 / Brachistochrone 问题）：求从 $(0,0)$ 到 $(x_1, y_1)$ 的曲线，使质点在重力作用下用时最短。$F = \sqrt{\frac{1+(y')^2}{2gy}}$。解为摆线（cycloid）。

**例 136.2**（极小曲面 / 肥皂膜）：求连接两个圆环的最小面积旋转曲面。$F = y\sqrt{1+(y')^2}$。解为悬链面（catenoid）。

**定义 136.2**（Beltrami 恒等式）：若 $F$ 不显含 $x$（即 $\frac{\partial F}{\partial x} = 0$），则 Euler-Lagrange 方程有首次积分

$$F - y' \frac{\partial F}{\partial y'} = C \quad (\text{常数})$$

### 136.2 多变量与高阶变分

**定义 136.3**（多变量泛函）：对 $J[u] = \iint_\Omega F(x, y, u, u_x, u_y) \, dx dy$，Euler-Lagrange 方程为

$$\frac{\partial F}{\partial u} - \frac{\partial}{\partial x}\left( \frac{\partial F}{\partial u_x} \right) - \frac{\partial}{\partial y}\left( \frac{\partial F}{\partial u_y} \right) = 0$$

**例 136.3**（Dirichlet 积分）：$F = \frac{1}{2}(u_x^2 + u_y^2)$，Euler-Lagrange 方程给出 Laplace 方程 $\Delta u = 0$。

**定理 136.2**（Hamilton 原理 / 最小作用量原理）：经典力学系统的运动方程可由作用量泛函 $S[q] = \int_{t_1}^{t_2} L(q, \dot{q}, t) \, dt$ 的变分 $\delta S = 0$ 导出，其中 $L = T - V$ 为 Lagrange 函数。

**定义 136.4**（二次变分与 Legendre 条件）：极小的二阶必要条件为 Legendre 条件 $\frac{\partial^2 F}{\partial y'^2} \geq 0$。充分条件为强化的 Legendre 条件 $\frac{\partial^2 F}{\partial y'^2} > 0$ 加上 Jacobi 条件（无共轭点）。

### 136.3 约束变分问题与等周问题

**定义 136.5**（等周问题 / Isoperimetric Problem）：在积分约束 $\int_a^b G(x, y, y') \, dx = L$（常数）下，最大化或最小化 $\int_a^b F(x, y, y') \, dx$。

**定理 136.3**（等周问题的 Euler-Lagrange 方程）：定义辅助泛函 $H = F + \lambda G$（$\lambda$ 为 Lagrange 乘子），则极值曲线满足

$$\frac{\partial H}{\partial y} - \frac{d}{dx}\left( \frac{\partial H}{\partial y'} \right) = 0$$

**例 136.4**（Dido 问题）：固定周长，求最大面积的闭曲线。解为圆（等周不等式）。

### 136.4 最优控制初步

**定义 136.6**（最优控制问题）：

$$\begin{aligned} \min_{u(t)} \quad & \phi(x(T)) + \int_0^T L(x(t), u(t), t) \, dt \\ \text{s.t.} \quad & \dot{x}(t) = f(x(t), u(t), t), \quad x(0) = x_0 \end{aligned}$$

其中 $x(t) \in \mathbb{R}^n$ 为状态变量，$u(t) \in \mathbb{R}^m$ 为控制变量。

**定理 136.4**（Pontryagin 极大值原理，1962）：定义 Hamilton 函数 $H(x, u, p, t) = L(x, u, t) + p^T f(x, u, t)$，其中 $p(t)$ 是协态变量（adjoint variable）。最优控制 $u^*(t)$ 和最优轨线 $x^*(t)$ 满足：

$$\begin{aligned}
\dot{x}^* &= \frac{\partial H}{\partial p} = f(x^*, u^*, t) \\
\dot{p} &= -\frac{\partial H}{\partial x} \\
H(x^*, u^*, p, t) &= \max_{u \in \mathcal{U}} H(x^*, u, p, t) \quad \text{(极大值条件)} \\
p(T) &= \nabla \phi(x^*(T)) \quad \text{(横截条件)}
\end{aligned}$$

**定理 136.5**（Bellman 最优性原理与 HJB 方程）：定义值函数 $V(x, t) = \min_{u(\cdot)} \left[ \phi(x(T)) + \int_t^T L(x, u, \tau) d\tau \right]$。则 $V$ 满足 Hamilton-Jacobi-Bellman（HJB）方程：

$$-\frac{\partial V}{\partial t} = \min_{u \in \mathcal{U}} \left[ L(x, u, t) + \nabla_x V \cdot f(x, u, t) \right]$$

边界条件 $V(x, T) = \phi(x)$。

**定义 136.7**（线性二次型调节器 / LQR）：当系统为线性 $\dot{x} = Ax + Bu$，目标为二次型 $J = \frac{1}{2}x(T)^T Q_f x(T) + \frac{1}{2}\int_0^T (x^T Q x + u^T R u) dt$ 时，最优控制为状态反馈 $u^* = -R^{-1} B^T P(t) x$，其中 $P(t)$ 满足 Riccati 微分方程 $-\dot{P} = A^T P + PA - PBR^{-1}B^T P + Q$。

---

---

## 第137章：互补性问题与变分不等式
互补性问题是优化理论中的一个重要分支，其核心是线性互补问题$\operatorname{LCP}(q, M)$：给定向量$q \in \mathbb{R}^n$和矩阵$M \in \mathbb{R}^{n \times n}$，求$z \in \mathbb{R}^n$使得$z \geq 0$，$Mz + q \geq 0$，且$z^T(Mz + q) = 0$。$\operatorname{LCP}$与多个数学领域紧密关联：二次规划$\min\{\frac{1}{2}x^TQx + c^Tx : Ax \geq b, x \geq 0\}$的KKT条件即为$\operatorname{LCP}$；双矩阵博弈的Nash均衡也可化为$\operatorname{LCP}$。求解$\operatorname{LCP}$的经典算法是Lemke算法（1965），通过引入人工变量$z_0$构造几乎互补基，沿射线进行主元迭代直到$z_0$出基。Lemke算法在$M$为P-矩阵（所有主子式为正）时保证收敛。变分不等式$\operatorname{VI}(K, F)$求$x^* \in K$使$\langle F(x^*), x - x^* \rangle \geq 0$对所有$x \in K$成立，是$\operatorname{LCP}$的无穷维推广，在均衡分析和交通分配中有广泛应用。

---

---

## 第137章：半定规划与离散凸分析
### 137.1 半定规划

半定规划（Semidefinite Programming, SDP）是在线性矩阵不等式约束下极小化线性目标函数的凸优化问题：

$$\min \; \mathbf{c}^T \mathbf{x} \quad \text{s.t.} \quad F_0 + \sum_{i=1}^n x_i F_i \succeq 0$$

其中 $F_i$ 为 $m \times m$ 对称矩阵，$X \succeq 0$ 表示 $X$ 半正定。SDP 包含线性规划（LP, $F_i$ 为对角矩阵时）和二阶锥规划（SOCP）作为特例，严格包含关系为 $\text{LP} \subset \text{SOCP} \subset \text{SDP}$。内点法可在多项式时间内求解 SDP（至给定精度）。在组合优化中 SDP 松弛有重要突破：Goemans-Williamson（1995）将 MAX-CUT 问题表示为整数二次规划，通过 SDP 松弛（$X \succeq 0$ 代替 $X = \mathbf{v}\mathbf{v}^T$）并使用随机超平面舍入，获得了约 0.878 的近似比——这是基于 SDP 的第一个突破性近似算法，极大地推动了半定规划在近似算法设计中的应用。

### 137.2 离散凸分析

离散凸分析由室田一雄（Murota）于 1990 年代建立，将凸分析推广到离散格点 $\mathbb{Z}^n$。核心概念包括两类互为共轭的函数族：（1）**L$^\natural$-凸函数**——满足离散中点凸性 $f(x) + f(y) \geq f(\lfloor\frac{x+y}{2}\rfloor) + f(\lceil\frac{x+y}{2}\rceil)$，其水平集为 L$^\natural$-凸集；（2）**M$^\natural$-凸函数**——基于交换性质的组合凸性，函数满足 $f(x) + f(y) \geq f(x - \mathbf{1}_A) + f(y + \mathbf{1}_A)$ 类型的交换不等式。它们分别是连续凸分析中凸函数对不同离散结构的适配，且通过 Legendre-Fenchel 变换互为共轭。应用涵盖经济学中不可分商品的竞争均衡存在性（Kelso-Crawford 的劳动市场模型）和运筹学中的资源配置与库存管理。

---

---

## 第138章：动态规划与随机规划
### 138.1 动态规划（Dynamic Programming）

动态规划（Bellman, 1957）通过将多阶段决策问题分解为子问题的递归关系解决，奠基于 **Bellman 最优性原理**——最优策略具有这样的性质：无论初始状态和初始决策如何，剩余决策必须构成由第一个决策导致的状态的最优策略。

**定义 138.1**（确定性有限期动态规划）：对 $N$ 阶段确定性决策问题，值函数 $V_k(x)$ 定义为当前状态为 $x$、还剩 $k$ 步时的最优费用，满足 **Bellman 方程**

$$V_k(x) = \min_{u \in U(x)} \left[ c(x, u) + V_{k-1}\big(f(x, u)\big) \right], \quad k = 1, 2, \ldots, N$$

其中 $c(x, u)$ 为瞬时代价，$f(x, u)$ 为状态转移函数，$U(x)$ 为状态 $x$ 的可行控制集。边界条件 $V_0(x) = g(x)$（终端代价）。

**定义 138.2**（无限期折扣问题）：引入折扣因子 $\gamma \in (0, 1)$，目标为最小化期望折现总代价 $\mathbb{E}\left[ \sum_{t=0}^\infty \gamma^t c(x_t, u_t) \right]$。Bellman 方程化为不动点方程

$$V(x) = \min_{u \in U(x)} \left[ c(x, u) + \gamma V\big(f(x, u)\big) \right]$$

**算法 138.1**（值迭代 / Value Iteration）：$V_{n+1}(x) = \min_u [c(x,u) + \gamma V_n(f(x,u))]$。当 $\gamma < 1$ 时，该迭代是 $\infty$-范数下的压缩映射（压缩因子 $\gamma$），线性收敛到唯一不动点。

**算法 138.2**（策略迭代 / Policy Iteration）：交替执行策略评估和策略改进，对有限状态和有限控制问题，在至多有限步内收敛到最优策略（每步严格提升）。

**定义 138.3**（Markov 决策过程 / MDP）：动态规划在随机环境中的推广。转移概率 $p(x' \mid x, u)$ 替代确定性转移 $f(x, u)$，Bellman 方程为

$$V(x) = \min_{u \in U(x)} \left[ c(x, u) + \gamma \sum_{x'} p(x' \mid x, u) \, V(x') \right]$$

**定理 138.1**（Blackwell 最优性理论，1965）：在标准的折扣 MDP（有限状态、有限控制）中，存在确定性的平稳最优策略，且该策略可由值迭代或策略迭代找到。最优策略的存在性和结构由 Blackwell 的单调性和压缩性条件保证。

### 138.2 随机规划（Stochastic Programming）

随机规划处理包含随机参数（通过随机变量 $\xi$ 表达）的优化问题。

**定义 138.4**（二阶段线性随机规划 / Dantzig, 1955）：第一阶段在 $\xi$ 实现前确定"现在"决策 $x$，第二阶段在 $\xi$ 实现后采取折中（recourse）行动 $y$：

$$\begin{aligned} \min_x \quad & c^T x + \mathbb{E}_\xi[Q(x, \xi)] \\ \text{s.t.} \quad & Ax = b, \quad x \geq 0 \end{aligned}$$

其中 $Q(x,\xi) = \min_y \{q(\xi)^T y : W(\xi) y = h(\xi) - T(\xi) x, \; y \geq 0\}$ 为第二阶段（recourse）问题的值函数。

**定理 138.2**（二阶段问题的结构性质）：若对几乎所有 $\xi$，第二阶段问题是可行的（完全 recourse），则 $Q(x, \xi)$ 是关于 $x$ 的分片线性凸函数，$\mathbb{E}_\xi[Q(x, \xi)]$ 也是凸函数。当 $\xi$ 具有有限支撑（场景树）时，二阶段问题等价于一个大规模确定性线性规划。

**定义 138.5**（机会约束规划 / Chance-Constrained Programming, Charnes-Cooper, 1959）：用概率约束替代确定性约束：

$$P\big(g(x, \xi) \leq 0\big) \geq 1 - \alpha, \quad \alpha \in (0,1)$$

当 $g$ 关于 $x$ 线性、$\xi$ 具有已知联合正态分布时，概率约束等价于一个二阶锥约束。

### 138.3 多目标最优化

**定义 138.6**（Pareto 最优解）：对多目标问题 $\min (f_1(x), \ldots, f_k(x))$（$x \in \mathcal{X}$），解 $x^*$ 称为 **Pareto 最优**，若不存在 $x' \in \mathcal{X}$ 使得对所有 $i$ 有 $f_i(x') \leq f_i(x^*)$，且至少一个不等式严格成立。所有 Pareto 最优解的集合称为 **Pareto 前沿**。

**求解方法**：
- **加权和法**（标量化）：$\min \sum_{i=1}^k w_i f_i(x)$（$w_i \geq 0$），变化权重可生成 Pareto 前沿的凸部分
- **$\varepsilon$-约束法**：$\min f_1(x)$ s.t. $f_i(x) \leq \varepsilon_i$（$i = 2, \ldots, k$），系统改变 $\varepsilon_i$ 可生成完整的 Pareto 前沿（包括非凸部分）
- **目标规划**：最小化与目标的加权偏差 $\min \sum_i |f_i(x) - t_i|$

Pareto 前沿的结构由 Kuhn-Tucker 型必要条件刻画：若 $x^*$ Pareto 最优且各目标在约束下正则，则存在非负乘子 $\lambda_i \geq 0$（不全为零）使 $\sum \lambda_i \nabla f_i(x^*) = 0$。

---



---

---

## 第321章（补充）
> 本卷研究由工程控制问题抽象出的数学理论——线性系统的代数结构、最优控制的变分方法、动态规划的HJB方程、以及Lyapunov稳定性理论。内容本质上是线性代数、常微分方程和变分法的深化专题。

---

---

## 第227章：线性控制系统
线性控制理论的状态空间方法由Rudolf Kalman在1960年代系统化，将线性系统可控性与可观测性的代数判据建立在矩阵理论上。

### 227.1 状态空间模型

**定义 227.1**（线性时不变系统 / LTI System）：连续时间线性时不变系统的状态空间表示为

$$\begin{cases} \dot{x}(t) = A x(t) + B u(t) \\ y(t) = C x(t) + D u(t) \end{cases}$$

其中$x(t) \in \mathbb{R}^n$是状态，$u(t) \in \mathbb{R}^m$是控制输入，$y(t) \in \mathbb{R}^p$是观测输出。$A \in \mathbb{R}^{n \times n}$，$B \in \mathbb{R}^{n \times m}$，$C \in \mathbb{R}^{p \times n}$，$D \in \mathbb{R}^{p \times m}$。

**定义 227.2**（解与状态转移矩阵）：齐次方程$\dot{x} = A x$的解为$x(t) = e^{At} x(0)$，其中矩阵指数$e^{At} = \sum_{k=0}^{\infty} \frac{(At)^k}{k!}$。$\Phi(t) = e^{At}$称为**状态转移矩阵**。非齐次方程的通解为

$$x(t) = e^{At} x(0) + \int_0^t e^{A(t-\tau)} B u(\tau) d\tau$$

**定义 227.3**（传递函数）：系统的**传递函数**$G(s)$是输出和输入的Laplace变换之比（零初始条件）：

$$G(s) = C(sI - A)^{-1} B + D$$

$G(s)$是$p \times m$的有理函数矩阵。

### 227.2 可控性

**定义 227.4**（可控性 / Controllability）：系统$(A, B)$是**可控的**（或状态$x_0$在时间$T$内可控），如果对任意初始状态$x(0) = x_0$和目标状态$x_f$，存在控制输入$u(t)$（$t \in [0, T]$）使得$x(T) = x_f$。

**定理 227.1**（Kalman可控性判据）：系统$(A, B)$完全可控当且仅当**可控性矩阵**

$$\mathcal{C} = \begin{bmatrix} B & AB & A^2B & \cdots & A^{n-1}B \end{bmatrix} \in \mathbb{R}^{n \times nm}$$

满行秩：$\operatorname{rank}(\mathcal{C}) = n$。

*注*：该判据的数学本质是：$\mathcal{C}$的列空间恰好是可达子空间（reachable subspace），即从原点出发可达的所有状态的集合。$\mathcal{C}$满行秩意味着可达子空间是整个$\mathbb{R}^n$。

**定理 227.2**（Hautus引理 / PBH检验）：$(A, B)$可控当且仅当对所有$\lambda \in \mathbb{C}$，

$$\operatorname{rank}\begin{bmatrix} \lambda I - A & B \end{bmatrix} = n$$

只需对$A$的特征值验证即可。PBH检验将可控性归结为：$A$的每个特征向量不能同时与$B$的所有列正交。

**定理 227.3**（Kalman可控性分解）：若$\operatorname{rank}(\mathcal{C}) = r < n$，存在坐标变换将系统分解为

$$\begin{bmatrix} \dot{x}_c \\ \dot{x}_{\bar{c}} \end{bmatrix} = \begin{bmatrix} A_c & A_{12} \\ 0 & A_{\bar{c}} \end{bmatrix} \begin{bmatrix} x_c \\ x_{\bar{c}} \end{bmatrix} + \begin{bmatrix} B_c \\ 0 \end{bmatrix} u$$

其中$(A_c, B_c)$是可控子系统，$A_{\bar{c}}$对应不可控模式。该分解的数学构造为：取$\mathcal{C}$的列空间的一组基作为可控子空间的基，再扩张为整个$\mathbb{R}^n$的基。

### 227.3 可观测性

**定义 227.5**（可观测性 / Observability）：系统$(A, C)$是**可观测的**，如果对任意初始状态$x(0) = x_0$，能够在有限时间$T$内仅通过观测输出$y(t)$和输入$u(t)$（$t \in [0, T]$）唯一确定$x_0$。

**定理 227.4**（Kalman可观测性判据）：系统$(A, C)$完全可观测当且仅当**可观测性矩阵**

$$\mathcal{O} = \begin{bmatrix} C \\ CA \\ CA^2 \\ \vdots \\ CA^{n-1} \end{bmatrix} \in \mathbb{R}^{np \times n}$$

满列秩：$\operatorname{rank}(\mathcal{O}) = n$。

**定理 227.5**（对偶原理）：$(A, C)$可观测当且仅当对偶系统$(A^T, C^T)$可控。这是最优控制和最优估计对偶性的代数基础——可控性与可观测性互为对偶概念。

### 227.4 极点配置与镇定

**定理 227.6**（极点配置定理，Wonham 1967）：若$(A, B)$可控，则对任意给定的$n$个复共轭对$p_1, \ldots, p_n$，存在状态反馈$u = -Kx$使得闭环系统$\dot{x} = (A - BK)x$的特征值为$\{p_1, \ldots, p_n\}$。

极点配置定理的数学本质是：可控性使得状态反馈能够任意改变闭环系统的动力学（在复共轭约束下）。

**定义 227.6**（可镇定性与可检测性）：$(A, B)$**可镇定**（stabilizable）如果所有不可控模式都是稳定的（特征值实部为负）。$(A, C)$**可检测**（detectable）如果所有不可观测模式都是稳定的。

**定理 227.7**（分离原理 / Separation Principle）：对可镇定且可检测的系统，状态观测器和状态反馈控制器可以独立设计，闭环系统保持稳定。分离原理是线性系统理论中估计与控制解耦的核心定理。

---

---

## 第228章：最优控制
最优控制研究在动态约束下使性能泛函达到极值的控制策略。其数学结构是变分法在含约束情形下的推广。

### 228.1 Pontryagin极小值原理

**定义 228.1**（最优控制问题 / Bolza形式）：考虑受控动力系统$\dot{x}(t) = f(t, x(t), u(t))$，初始条件$x(t_0) = x_0$。寻找控制$u(t) \in U \subseteq \mathbb{R}^m$最小化性能泛函

$$J[u] = \phi(x(t_f)) + \int_{t_0}^{t_f} L(t, x(t), u(t)) dt$$

**定理 228.1**（Pontryagin极小值原理，1956）：若$u^*(t)$是最优控制，$x^*(t)$是最优轨线，则存在非零伴随向量$\lambda(t)$（协态）满足：

1. **状态方程**：$\dot{x}^* = \frac{\partial H}{\partial \lambda}(t, x^*, u^*, \lambda)$
2. **协态方程**：$\dot{\lambda} = -\frac{\partial H}{\partial x}(t, x^*, u^*, \lambda)$
3. **极小值条件**：$H(t, x^*, u^*, \lambda) \leq H(t, x^*, u, \lambda)$（对所有$u \in U$）
4. **横截条件**：$\lambda(t_f) = \frac{\partial \phi}{\partial x}(x^*(t_f))$

其中**Hamilton函数**$H(t, x, u, \lambda) = L(t, x, u) + \lambda^T f(t, x, u)$。

*证明思路*（变分推导概要）：考虑Bolza型性能指标$J[u] = \phi(x(t_f)) + \int_{t_0}^{t_f} L(t, x, u) dt$，在动态约束$\dot{x} = f(t, x, u)$下求极小。引入Lagrange乘子（协态）$\lambda(t) \in \mathbb{R}^n$，构造增广性能指标$\tilde{J} = \phi(x(t_f)) + \int_{t_0}^{t_f} [L + \lambda^T(f - \dot{x})] dt$。定义Hamilton函数$H(t, x, u, \lambda) = L(t, x, u) + \lambda^T f(t, x, u)$，则$\tilde{J} = \phi(x(t_f)) + \int_{t_0}^{t_f} [H(t, x, u, \lambda) - \lambda^T \dot{x}] dt$。对$\tilde{J}$取一阶变分：边界项给出横截条件$\lambda(t_f) = \partial\phi/\partial x(x(t_f))$；对$\lambda$的变分恢复状态方程$\dot{x} = \partial H/\partial\lambda$；对$x$的变分经分部积分后得到**协态方程**$\dot{\lambda} = -\partial H/\partial x$；对$u$的变分要求$\partial H/\partial u = 0$（无约束情形），或在控制约束$u \in U$下有极小值条件$H(x^*, u^*, \lambda) = \min_{u \in U} H(x^*, u, \lambda)$。这就是Pontryagin极小值原理的核心：最优控制使Hamilton函数逐点取极小。∎

**例 228.1**（线性二次型最优控制）：$f = Ax + Bu$，$L = \frac{1}{2}(x^T Q x + u^T R u)$（$Q \geq 0$，$R > 0$）。由极小值原理，最优控制为状态反馈$u^* = -R^{-1} B^T P x$，其中$P$满足**代数Riccati方程**：

$$PA + A^T P - P B R^{-1} B^T P + Q = 0$$

这是线性二次型问题的最优解——最优控制是状态的线性反馈，增益矩阵由Riccati方程的解给出。

### 228.2 Hamilton-Jacobi-Bellman方程

**定义 228.2**（值函数 / Value Function）：从状态$x$和时间$t$出发的最优代价（值函数）为

$$V(t, x) = \min_{u(\cdot)} \left\{ \phi(x(t_f)) + \int_t^{t_f} L(s, x(s), u(s)) ds \right\}$$

**定理 228.2**（Bellman最优性原理，1957）：最优策略的剩余部分仍是剩余问题的最优策略。用值函数表示为

$$V(t, x) = \min_{u \in U} \left\{ L(t, x, u) \Delta t + V(t + \Delta t, x + f(t, x, u) \Delta t) \right\} + o(\Delta t)$$

**定理 228.3**（Hamilton-Jacobi-Bellman方程 / HJB方程）：若$V \in C^1$，则满足

$$-\frac{\partial V}{\partial t}(t, x) = \min_{u \in U} \left\{ L(t, x, u) + \nabla_x V(t, x)^T f(t, x, u) \right\}$$

边界条件$V(t_f, x) = \phi(x)$。HJB方程是一阶非线性偏微分方程——它是经典力学中Hamilton-Jacobi方程在最优控制背景下的推广。

**定理 228.4**（验证定理 / Verification Theorem）：若光滑函数$V(t, x)$满足HJB方程且$u^*(t, x)$达到最小值，则$u^*$是最优反馈控制。

**注 228.1**（极小值原理与HJB的关系）：极小值原理是HJB方程沿最优轨线的特征线形式。协态$\lambda(t) = \nabla_x V(t, x^*(t))$——这是Pontryagin极小值原理与动态规划之间最深刻的数学联系。

### 228.3 无限时域最优控制

**定义 228.3**（无限时域LQR）：最小化$J = \int_0^\infty (x^T Q x + u^T R u) dt$（$Q \geq 0, R > 0$）。最优控制为$u = -K x$，$K = R^{-1} B^T P$，其中$P$满足**代数Riccati方程**：

$$PA + A^T P - P B R^{-1} B^T P + Q = 0$$

**定理 228.5**（代数Riccati方程的可解性）：若$(A, B)$可镇定且$(Q^{1/2}, A)$可检测，则代数Riccati方程存在唯一正半定解$P \geq 0$，且闭环系统$A - BK$是渐近稳定的。该定理将最优控制的可解性与系统的结构性质（可控性/可观测性）联系起来。

---

---

## 第229章：随机滤波与控制
随机系统的最优估计与控制是概率论、随机分析和最优控制理论的交叉。

### 229.1 Kalman-Bucy滤波

**定义 229.1**（线性随机系统）：具有过程噪声和观测噪声的线性系统

$$\begin{cases} \dot{x}(t) = A x(t) + B u(t) + w(t) \\ y(t) = C x(t) + v(t) \end{cases}$$

其中$w(t)$是过程噪声（协方差$Q \geq 0$），$v(t)$是观测噪声（协方差$R > 0$），二者是不相关的Gauss白噪声。

**定义 229.2**（Kalman-Bucy滤波器，1960）：状态估计$\hat{x}(t)$由以下微分方程更新（连续时间Kalman-Bucy滤波器）：

$$\dot{\hat{x}} = A \hat{x} + B u + K (y - C \hat{x})$$

其中**Kalman增益**$K = P C^T R^{-1}$，且**误差协方差**$P(t) = \mathbb{E}[(x - \hat{x})(x - \hat{x})^T]$满足**滤波Riccati方程**：

$$\dot{P} = A P + P A^T - P C^T R^{-1} C P + Q$$

**定理 229.1**（Kalman滤波的最优性）：Kalman-Bucy滤波器是线性系统的最小方差无偏估计。在高斯噪声假设下，$\hat{x}(t)$是状态$x(t)$在观测$\sigma$-代数$\sigma\{y(s) : s \leq t\}$下的条件期望。该定理的数学本质是：线性Gauss系统中，条件期望由线性递推精确给出——这是正交集上投影定理（Hilbert空间理论）的随机版本。

### 229.2 随机最优控制

**定义 229.3**（随机最优控制问题）：状态方程由Itô随机微分方程$dx_t = f(t, x_t, u_t) dt + \sigma(t, x_t) dW_t$给出，$W_t$是Brown运动。性能指标为$J = \mathbb{E}[\phi(x_T) + \int_0^T L(t, x_t, u_t) dt]$。

**定理 229.2**（随机HJB方程）：值函数$V(t, x)$满足

$$-\frac{\partial V}{\partial t} = \min_{u \in U} \left\{ L(t, x, u) + f^T \nabla_x V + \frac{1}{2} \operatorname{Tr}(\sigma \sigma^T \nabla_x^2 V) \right\}$$

与确定性HJB方程相比，随机HJB方程多了二阶项$\frac{1}{2}\operatorname{Tr}(\sigma\sigma^T \nabla_x^2 V)$——这是Itô公式的直接推论，体现了扩散过程的二阶变差贡献。

**定理 229.3**（分离原理 / LQG控制）：对线性随机系统（LQG：Linear Quadratic Gaussian），最优控制$u = -K \hat{x}$分别由确定性LQR的最优增益$K$和Kalman-Bucy滤波的状态估计$\hat{x}$独立决定。分离原理将随机最优控制分解为两个独立子问题：确定性最优控制（Riccati方程）和最优状态估计（滤波Riccati方程）。

---

---

## 第230章：鲁棒控制
鲁棒控制研究系统在模型不确定性下的镇定与性能保证。其数学核心是算子理论和线性矩阵不等式。

### 230.1 小增益定理与不确定性描述

**定义 230.1**（$\mathcal{H}_\infty$范数）：稳定传递函数$G(s)$的**$\mathcal{H}_\infty$范数**为

$$\|G\|_\infty = \sup_{\omega \in \mathbb{R}} \bar{\sigma}(G(j\omega))$$

其中$\bar{\sigma}(\cdot)$是最大奇异值。$\|G\|_\infty$是$L^2$输入到$L^2$输出的诱导算子范数——它是Hardy空间$\mathcal{H}_\infty$上的范数，本质上是对系统最坏情况能量增益的度量。

**定理 230.1**（小增益定理 / Small Gain Theorem）：设$M$和$\Delta$为稳定传递函数。若$\|M \Delta\|_\infty < 1$，则反馈互联系统稳定。小增益定理是压缩映射原理在频域的体现——开环增益的$\mathcal{H}_\infty$范数小于1保证闭环映射是压缩的。

**定义 230.2**（结构奇异值 / $\mu$）：对结构化不确定性$\Delta = \operatorname{diag}(\Delta_1, \ldots, \Delta_k)$，定义

$$\mu_\Delta(M) = \frac{1}{\min\{\bar{\sigma}(\Delta) : \det(I - M\Delta) = 0\}}$$

$\mu < 1$等价于对所有允许的$\|\Delta\|_\infty \leq 1$，系统保持鲁棒稳定。$\mu$分析将结构化不确定性的鲁棒稳定性问题归约为对$\mu$函数的上界计算。

### 230.2 $\mathcal{H}_\infty$最优控制

**定义 230.3**（$\mathcal{H}_\infty$控制问题）：考虑广义被控对象

$$\begin{bmatrix} z \\ y \end{bmatrix} = \begin{bmatrix} P_{11} & P_{12} \\ P_{21} & P_{22} \end{bmatrix} \begin{bmatrix} w \\ u \end{bmatrix}$$

其中$w$是外部扰动，$u$是控制，$z$是被控输出，$y$是测量。寻找控制器$K(s)$使得闭环传递函数$T_{zw}(s)$满足$\|T_{zw}\|_\infty < \gamma$。

**定理 230.2**（Doyle-Glover-Khargonekar-Francis解法 / DGKF 1989）：$\mathcal{H}_\infty$次优控制问题可归结为两个代数Riccati方程（一个用于状态反馈，一个用于输出估计）的可解性。控制器由中心解给出。DGKF解法将$\mathcal{H}_\infty$控制统一为Riccati方程框架——与LQG问题在结构上形成精确的对应。

**定理 230.3**（有界实引理 / Bounded Real Lemma）：$\|G\|_\infty < \gamma$当且仅当Hamiltonian矩阵没有虚轴上的特征值，等价于某线性矩阵不等式（LMI）可解。有界实引理将频域范数约束转化为时域LMI条件。

### 230.3 线性矩阵不等式

**定义 230.4**（线性矩阵不等式 / LMI）：**线性矩阵不等式**形如$F(x) = F_0 + \sum_{i=1}^m x_i F_i \geq 0$（半正定），其中$F_i$为对称矩阵。LMI定义了$\mathbb{R}^m$中的凸集（半正定锥的截面）。

**定理 230.4**（LMI方法的统一性）：众多控制问题（$\mathcal{H}_\infty$控制、$\mathcal{H}_2$控制、极点配置、$\mu$-综合的上界）都可转化为LMI可行性问题。LMI是凸优化问题，可用内点法求解——这为控制理论提供了数值可处理的统一框架。

**定理 230.5**（Schur补引理）：分块对称矩阵正定当且仅当

$$\begin{bmatrix} Q & S \\ S^T & R \end{bmatrix} > 0 \iff Q > 0,\ R - S^T Q^{-1} S > 0$$

Schur补将非线性Riccati不等式转化为线性矩阵不等式——这是LMI方法能够统一处理各类控制问题的核心代数工具。

---

---

## 第231章：非线性控制
非线性控制系统的数学理论建立在Lyapunov稳定性理论和微分几何方法之上。

### 231.1 Lyapunov稳定性理论

**定理 231.1**（Lyapunov直接法）：对系统$\dot{x} = f(x)$（$f(0) = 0$），若存在$C^1$函数$V: \mathbb{R}^n \to \mathbb{R}$，满足

- $V(0) = 0$，且$V(x) > 0$（$x \neq 0$）（正定性）
- $\dot{V}(x) = \nabla V(x)^T f(x) < 0$（$x \neq 0$）（负定性）

则原点$x = 0$是渐近稳定的。$V(x)$称为**Lyapunov函数**。Lyapunov直接法的数学本质是：无需显式求解ODE，仅通过构造广义能量函数$V$即可判定稳定性——$V$沿轨线严格递减蕴含轨线收敛到原点。

**定理 231.2**（LaSalle不变原理）：若$V(x) \geq 0$且$\dot{V}(x) \leq 0$，则所有有界轨线收敛到最大不变集$M \subseteq \{x : \dot{V}(x) = 0\}$。LaSalle原理放松了负定性要求，仅需半负定即可得到收敛结论。

**定义 231.1**（控制Lyapunov函数 / CLF）：对受控系统$\dot{x} = f(x) + g(x) u$，光滑正定函数$V(x)$是**控制Lyapunov函数**，如果对所有$x \neq 0$，

$$\inf_{u} \left\{ L_f V(x) + L_g V(x) \cdot u \right\} < 0$$

其中$L_f V = \nabla V^T f$和$L_g V = \nabla V^T g$是Lie导数。CLF的存在性是系统可通过反馈镇定的充分条件——每一点都存在控制使$V$减小。

### 231.2 反馈线性化

**定义 231.2**（Lie括号与能控性分布）：向量场$f$和$g$的**Lie括号**为$[f, g] = \nabla g \cdot f - \nabla f \cdot g$。迭代Lie括号$\operatorname{ad}_f^k g = [f, \operatorname{ad}_f^{k-1} g]$（$\operatorname{ad}_f^0 g = g$）张成的分布$\Delta = \operatorname{span}\{\operatorname{ad}_f^k g : k \geq 0\}$是该仿射系统的**可达分布**。

**定理 231.3**（输入-状态反馈线性化条件）：仿射非线性系统$\dot{x} = f(x) + g(x) u$可经状态变换$z = \Phi(x)$和反馈$u = \alpha(x) + \beta(x) v$化为线性系统$\dot{z} = A z + B v$的必要条件是$\{g, \operatorname{ad}_f g, \ldots, \operatorname{ad}_f^{n-1} g\}$在$x_0$附近线性独立且对合（involutive）。对合条件$\operatorname{rank}(\operatorname{span}\{g, \ldots, \operatorname{ad}_f^{n-2}g\}) = \operatorname{rank}(\operatorname{span}\{g, \ldots, \operatorname{ad}_f^{n-1}g\})$由Frobenius定理保证可积性。

**定义 231.3**（相对阶 / Relative Degree）：系统$\dot{x} = f(x) + g(x) u$，$y = h(x)$在$x_0$具有**相对阶**$r$，如果$L_g L_f^{k} h(x) = 0$（$k = 0, \ldots, r-2$）且$L_g L_f^{r-1} h(x_0) \neq 0$。相对阶是输出$y$关于时间求导时，控制输入$u$首次显式出现的导数阶数。

### 231.3 滑模控制

**定义 231.4**（滑模控制 / Sliding Mode Control）：选择**滑动流形**$s(x) = 0$（如$s = \dot{e} + \lambda e$）。控制律设计为使系统轨线在有限时间内到达并保持在滑动流形上：

$$u = u_{\text{eq}} - k \operatorname{sgn}(s)$$

其中$u_{\text{eq}}$是等效控制（$\dot{s} = 0$的解），$-k \operatorname{sgn}(s)$是不连续开关项。

**定理 231.4**（到达条件与有限时间收敛）：若$s \dot{s} \leq -\eta |s|$（$\eta > 0$），则滑模面$s = 0$在有限时间$T \leq |s(0)|/\eta$内到达。在滑模面上的运动对满足匹配条件的不确定性具有不变性——这是滑模控制的鲁棒性数学根源。

### 231.4 反步法

**定义 231.5**（反步法 / Backstepping）：对严格反馈系统（strict-feedback form）：

$$\begin{aligned} \dot{x}_1 &= f_1(x_1) + g_1(x_1) x_2 \\ \dot{x}_2 &= f_2(x_1, x_2) + g_2(x_1, x_2) x_3 \\ &\vdots \\ \dot{x}_n &= f_n(x_1, \ldots, x_n) + g_n(x_1, \ldots, x_n) u \end{aligned}$$

反步法递归地构造Lyapunov函数$V_i(x_1, \ldots, x_i)$和虚拟控制$\alpha_i$，最终得到真实控制$u$。

**定理 231.5**（反步法的Lyapunov构造）：在第$i$步，令$z_i = x_i - \alpha_{i-1}$为误差变量。选择$V_i = V_{i-1} + \frac{1}{2} z_i^2$，设计$\alpha_i$使得$\dot{V}_i = -W_i \leq 0$。这递归地给出全局渐近稳定的控制律。反步法的本质是递归地应用积分反演（integrator backstepping），将高阶系统的镇定问题降阶为一系列一阶子系统的Lyapunov设计。

---



---

---

## 第327章（补充）
> 本卷系统阐述两个数学分支——最优化理论（线性规划对偶、整数规划的代数结构、网络流图论）和博弈论（Nash均衡的拓扑基础、合作博弈的公理化、机制设计的数学原理）。两大学科在二人零和博弈与线性规划对偶之间有着深刻的数学联系：零和博弈的极小极大定理本质上是对偶定理的特殊情形。

---

---

## 第252章：线性规划对偶与灵敏度分析
线性规划的对偶理论揭示了原问题与对偶问题之间的深刻数学结构。

### 252.1 对偶理论

**定义 252.1**（线性规划的对偶）：原问题（标准形）：
$$\min c^T x \quad \text{s.t.} \quad Ax = b,\ x \geq 0$$

其对偶问题为：$$\max b^T y \quad \text{s.t.} \quad A^T y \leq c$$

**定理 252.1**（弱对偶定理）：
若$x$是原可行解，$y$是对偶可行解，则$c^T x \geq b^T y$。原目标值始终大于等于对偶目标值。

**定理 252.2**（强对偶定理）：若原问题有有限最优解$x^*$，则对偶问题也有最优解$y^*$，且$c^T x^* = b^T y^*$。强对偶定理是线性规划理论的基石——在最优解处，对偶间隙为零。

**定理 252.3**（互补松弛条件）：$x^*$和$y^*$分别为原和对偶最优解的充要条件是：
$$x_j^* (c_j - \sum_i a_{ij} y_i^*) = 0 \quad (\forall j)$$

即若某变量为正，则对应的对偶约束为紧；若对偶约束为松，则对应的原变量为零。

**定义 252.2**（影子价格 / Shadow Price）：对偶变量$y_i$的数学含义是约束$i$右端项增加一个单位时最优值的边际变化量——即Lagrange乘子。

### 252.2 灵敏度分析

**定义 252.3**（灵敏度分析 / Sensitivity Analysis）：研究参数（$c$、$b$、$A$）变化时最优解和最优值的变化规律。

**定理 252.4**（目标系数的容许变化范围）：设$B$是最优基。非基变量$x_j$的目标系数$c_j$变化$\Delta$时，最优基保持不变当且仅当$\bar{c}_j + \Delta \geq 0$（极小化问题），其中$\bar{c}_j$是已约化成本。

**定理 252.5**（右端项的容许变化范围）：设$B^{-1} b \geq 0$（可行性条件）。$b$的分量变化允许范围为$$\max_{i: (B^{-1})_{ik} > 0} \frac{-(B^{-1}b)_i}{(B^{-1})_{ik}} \leq \Delta b_k \leq \min_{i: (B^{-1})_{ik} < 0} \frac{-(B^{-1}b)_i}{(B^{-1})_{ik}}$$。

### 252.3 网络规划与单纯形法的几何联系

**定理 252.6**（单纯形法的几何解释）：单纯形法从多面体$P = \{x : Ax = b, x \geq 0\}$的一个顶点出发，沿下降边移动到相邻顶点，直至达到最优顶点。单纯形表对应于基矩阵$B$的逆：基本解为$x_B = B^{-1} b$，非基变量为$0$。

### 252.4 非线性规划的KKT条件

线性规划是凸优化的一类特例。对一般非线性规划，Karush-Kuhn-Tucker（KKT）条件提供了最优性的必要条件（凸情形下为充要条件）。

**定理 252.7**（KKT条件，Karush 1939 / Kuhn-Tucker 1951）：考虑问题$\min f(x)$ s.t. $g_i(x) \leq 0$，$h_j(x) = 0$。设$x^*$满足约束规范（如LICQ），则存在Lagrange乘子$\mu_i \geq 0$、$\lambda_j$使得：

$$\nabla f(x^*) + \sum_i \mu_i \nabla g_i(x^*) + \sum_j \lambda_j \nabla h_j(x^*) = 0, \quad \mu_i g_i(x^*) = 0$$

KKT条件是Lagrange乘子法从等式约束到不等式约束的自然推广——互补松弛条件$\mu_i g_i(x^*) = 0$是这一推广的核心特征。

---

---

## 第253章：整数规划
整数规划的变量取值限制在整数集上，引入了离散性——这使其计算复杂性从多项式时间（线性规划）跃升为NP难。

### 253.1 整数规划基础

**定义 253.1**（整数规划 / Integer Programming / IP）：$$\min c^T x \quad \text{s.t.} \quad Ax = b,\ x \geq 0,\ x \in \mathbb{Z}^n$$

若部分变量取整，则为**混合整数规划**（MIP）。若所有变量取值$\{0, 1\}$，则为**0-1规划**。

**定义 253.2**（LP松弛与对偶间隙）：放宽整数约束得到LP松弛。LP松弛最优值$\leq$ IP最优值（极小化问题）。两者的差距称为**对偶间隙**（duality gap）。

**定理 253.1**（全幺模矩阵 / Totally Unimodular）：若约束矩阵$A$是全幺模的（每个方子阵的行列式为$0, \pm 1$），则对任意整数右端项$b$，线性规划$Ax = b, x \geq 0$的所有基可行解都是整数的。典型例子：指派问题和网络流问题。全幺模矩阵将整数规划可多项式时间求解的情形精确刻画为代数条件。

### 253.2 分枝定界与割平面法

**定义 253.3**（分枝定界法 / Branch-and-Bound）：递归地分解问题——在LP松弛解中选分数变量$x_j$，分枝为$x_j \leq \lfloor x_j \rfloor$和$x_j \geq \lceil x_j \rceil$两个子问题。用LP松弛值作为下界（极小化时），剪去不可能含最优解的枝（bounding）。

**定理 253.2**（割平面法 / Cutting Plane Method / Gomory 1958）：若LP松弛最优解非整数，则从单纯形表生成Gomory割$-\bar{f}_j x_j - \cdots \leq -\bar{f}_0$（$\bar{f}_j$为分数部分），添加此约束割去当前分数解而不损失任何整数可行解。有限次迭代后收敛到整数最优解。

*有限终止性论证*：每个Gomory割从当前LP最优解对应的单纯形表的一行导出：设基变量$x_{B_i} = \bar{b}_i - \sum_{j \in NB} \bar{a}_{ij} x_j$，其中$\bar{b}_i = \lfloor \bar{b}_i \rfloor + \bar{f}_{i0}$（$0 < \bar{f}_{i0} < 1$）。Gomory割为$\sum_{j \in NB} \bar{f}_{ij} x_j \geq \bar{f}_{i0}$（其中$\bar{f}_{ij} = \bar{a}_{ij} - \lfloor \bar{a}_{ij} \rfloor$）。添加此割后，对偶单纯形法在当前基不可行但最优的前提下，经过一次对偶迭代恢复可行性并保持最优性，目标函数值不增（极小化问题）。由于整数规划的可行域是有限个整数点的集合（有界情形），而每个割严格排除当前分数LP最优解，结合目标函数的单调性和有限整数点集，算法必然在有限步内终止于整数最优解或证明不可行。∎

**注 253.1**（分枝定界法的策略与定界方法）：分枝定界法的效率高度依赖分枝策略和定界方法。

**分枝策略**：常见策略包括（1）**最大不可行性**（maximum infeasibility）：选择与整数偏离最远的分数变量$x_j$（即$|x_j - \text{round}(x_j)|$最大的变量）；（2）**伪费用分枝**（pseudo-cost branching）：记录各变量分枝后目标函数的历史变化率，优先选择预计改善最大的变量；（3）**强分枝**（strong branching）：在分枝前试探性求解若干候选分枝的LP松弛，选择使下界上升最多的分枝。

**定界方法**：每个子节点的LP松弛值提供该子树的**下界**（极小化问题）。维护全局**上界**（当前最优整数解的目标值）。若某节点的下界$\geq$当前上界，则该节点可被**剪枝**（fathomed）。此外，若子问题的LP松弛不可行或已获得整数解，也终止该分枝。现代求解器还结合切割平面形成**分枝切割法**（branch-and-cut），在每个节点处动态添加有效不等式以收紧LP松弛。

### 253.3 背包问题

**定义 253.4**（0-1背包问题 / Knapsack Problem）：$$\max \sum_{i=1}^n v_i x_i \quad \text{s.t.} \quad \sum_{i} w_i x_i \leq W,\ x_i \in \{0, 1\}$$

其中$v_i$为物品的价值参数，$w_i$为重量参数，$W$为容量参数。

**定理 253.3**（动态规划解背包）：定义$f(i, w)$为前$i$个物品在容量$w$下的最大价值。递推：$f(i, w) = \max\{f(i-1, w), f(i-1, w-w_i) + v_i\}$（若$w \ge w_i$）。时间$O(nW)$（伪多项式）。背包问题的动态规划解是Bellman最优性原理在组合优化中的直接应用。

---

---

## 第254章：网络流理论
网络流理论研究有向图中从源到汇的流的最大化问题，其核心定理——最大流最小割定理——是线性规划强对偶定理在图论中的具体体现。

### 254.1 最大流与最小割

**定义 254.1**（流网络 / Flow Network）：有向图$G = (V, E)$，每条边$(u, v)$有容量$c(u, v) \geq 0$。源$s$，汇$t$。流$f: E \to \mathbb{R}_{\geq 0}$满足容量约束$0 \leq f(e) \leq c(e)$和守恒约束$\sum_{(u,v)\in E} f(u,v) = \sum_{(v,w)\in E} f(v,w)$（对所有$v \neq s, t$）。

**定义 254.2**（割 / Cut）：$s$-$t$割$(S, T)$（$s \in S, t \in T$）的容量为$\sum_{u \in S, v \in T} c(u, v)$。

**定理 254.1**（Ford-Fulkerson最大流最小割定理，1956）：最大流的值等于最小$s$-$t$割的容量。

$$\max |f| = \min_{S: s \in S, t \notin S} \sum_{u \in S, v \notin S} c(u, v)$$

*证明思路*：沿增广路径增加流。当无增广路径时，从源可达的节点集形成最小割。最大流最小割定理是线性规划强对偶定理的特殊情形——将最大流问题写为LP，其对偶恰好是最小割问题。∎

**定理 254.2**（Edmonds-Karp算法，1972）：使用BFS找最短增广路径，Ford-Fulkerson的复杂度为$O(|V| \cdot |E|^2)$。BFS保证每次增广路径的边数最少，从而将增广次数限制在$O(|V|\cdot|E|)$。

### 254.2 最小费用流

**定义 254.3**（最小费用流 / Min-Cost Flow）：每条边$(u, v)$有单位流费用$a(u, v)$。在满足流量需求$d$（从$s$到$t$的总流）的条件下最小化总费用$\sum_e a(e) f(e)$。

**定理 254.3**（最小费用流的最优性条件 / 负环条件）：可行流$f$是费用最小的当且仅当残量网络$G_f$中不存在负费用有向环。负环条件是线性规划最优性（对偶可行性）在图论中的等价表述。

### 254.3 匹配问题

**定义 254.4**（匹配 / Matching）：图的匹配是两两不共享公共端点的边集合。**完美匹配**覆盖所有顶点。**最大权匹配**是权和最大的匹配。

**定理 254.4**（König定理 / 二分图匹配）：在二分图中，最大匹配的边数 = 最小顶点覆盖的点数。König定理是二分图特有的min-max关系，在一般图中不成立。

**定理 254.5**（Edmonds花算法 / Blossom Algorithm，1965）：一般图的最大匹配可在多项式时间（$O(|V|^3)$）内求得。花算法的核心是收缩奇数长的交错环（花/blossom）——这是处理一般图（非二分图）中奇环对匹配问题造成困难的关键技术。

---

---

## 第257章：非合作博弈
非合作博弈研究每个参与者独立选择策略以最大化自身支付的数学理论。Nash均衡的存在性定理是非合作博弈论的核心——其证明以Kakutani不动点定理为拓扑学基础。

### 257.1 策略型博弈与Nash均衡

**定义 257.1**（策略型博弈 / Normal-Form Game）：一个$n$人**策略型博弈**$\Gamma = (N, \{S_i\}_{i \in N}, \{u_i\}_{i \in N})$由以下要素构成：
- $N = \{1, \ldots, n\}$：参与者集合
- $S_i$：参与者$i$的**纯策略**集合
- $u_i: S = \prod_{j \in N} S_j \to \mathbb{R}$：参与者$i$的**支付函数**

当参与者的选择是随机的时，**混合策略**是$S_i$上的概率分布$\sigma_i \in \Delta(S_i)$。

**定义 257.2**（Nash均衡，1950）：策略剖面$\sigma^* = (\sigma_1^*, \ldots, \sigma_n^*)$是**Nash均衡**，如果对每个参与者$i$和每个策略$\sigma_i$，

$$u_i(\sigma_i^*, \sigma_{-i}^*) \geq u_i(\sigma_i, \sigma_{-i}^*)$$

即没有参与者可以通过单方面偏离来提高自己的收益。

**定理 257.1**（Nash的存在定理，1951）：任何有限策略型博弈至少存在一个Nash均衡（可能为混合策略）。

*证明思路*：将均衡刻画为不动点。混合策略空间$\Delta = \prod_i \Delta(S_i)$是有限维单纯形的笛卡尔积，故为非空凸紧集。对每个$\sigma_{-i}$，最优反应对应$B_i(\sigma_{-i}) = \arg\max_{\sigma_i \in \Delta(S_i)} u_i(\sigma_i, \sigma_{-i})$的图为闭集（由$u_i$在混合策略下的多线性连续性），且因期望支付对$\sigma_i$为线性函数，最优反应集为某线性函数在紧凸集上的极大点集，故$B_i(\sigma_{-i})$为非空凸集。取$B(\sigma) = \prod_i B_i(\sigma_{-i})$，则$B: \Delta \to 2^\Delta$满足：值域在紧凸集$\Delta$内，图闭（上半连续），且对每个$\sigma$，$B(\sigma)$为非空凸集。由Kakutani不动点定理，$\exists \sigma^* \in B(\sigma^*)$，此即Nash均衡。∎

**例 257.1**（囚徒困境 / Prisoner's Dilemma）：两个参与者各有策略C和D。支付矩阵为

| | C | D |
|---|---|---|
| C | (-1, -1) | (-3, 0) |
| D | (0, -3) | (-2, -2) |

唯一的Nash均衡是(D, D)，但(C, C)是Pareto更优的——这是个体理性与集体理性冲突的数学例证。

### 257.2 均衡的精炼

**定义 257.3**（子博弈完美均衡 / Subgame Perfect Equilibrium，Selten 1965）：扩展型博弈（博弈树）中策略剖面$\sigma$是**子博弈完美均衡**，如果它在每个子博弈中都是Nash均衡。这排除了不可信威胁（non-credible threats）。

**定义 257.4**（颤抖手完美均衡 / Trembling Hand Perfect Equilibrium，Selten 1975）：策略剖面$\sigma^*$是**颤抖手完美均衡**，如果存在一列完全混合策略剖面$\sigma^k \to \sigma^*$，使得$\sigma_i^*$对每个$\sigma_{-i}^k$都是最优反应。

**定义 257.5**（序贯均衡 / Sequential Equilibrium，Kreps-Wilson 1982）：序贯均衡要求在信息集上的信念是通过Bayes法则从均衡策略推导出来的（一致性），且每个参与者的策略是序贯理性的。

### 257.3 贝叶斯博弈与不完全信息

**定义 257.6**（贝叶斯博弈 / Harsanyi 1967-1968）：**Bayes博弈**中每个参与者$i$有私有的**类型**$\theta_i \in \Theta_i$，类型的联合分布$p(\theta)$是共同知识。$i$的策略是函数$s_i: \Theta_i \to S_i$。

**定义 257.7**（Bayes-Nash均衡）：策略剖面$s^*$是**Bayes-Nash均衡**，如果对每个$i$和$\theta_i$，

$$\mathbb{E}_{\theta_{-i}|\theta_i} [u_i(s_i^*(\theta_i), s_{-i}^*(\theta_{-i}), \theta)] \geq \mathbb{E}_{\theta_{-i}|\theta_i}[u_i(s_i, s_{-i}^*(\theta_{-i}), \theta)]$$

### 257.4 相关均衡与通信均衡

**定义 257.8**（相关均衡 / Correlated Equilibrium，Aumann 1974）：概率分布$\mu \in \Delta(S)$是**相关均衡**，如果对所有$i$和所有映射$d_i: S_i \to S_i$，

$$\sum_{s \in S} \mu(s) u_i(s) \geq \sum_{s \in S} \mu(s) u_i(d_i(s_i), s_{-i})$$

相关均衡允许参与者根据相关信号协调选择——它是Nash均衡概念的推广。

**定理 257.2**（Aumann相关均衡定理，1974）：相关均衡集是凸紧集，包含所有Nash均衡的凸包。任何相关均衡均可通过引入有限状态的通信设备（correlation device）——即发送给各参与者的私有随机信号——来实现，使得参与者根据接收到的信号理性选择行动构成相关均衡。

---

---

## 第258章：合作博弈与核
合作博弈研究参与者可以形成联盟并通过有约束力的协议分配合作收益的情形。核与Shapley值是合作博弈论的两个核心解概念。

### 258.1 特征函数型博弈

**定义 258.1**（特征函数型博弈 / Coalitional Game）：$n$人**特征函数型博弈**$(N, v)$由特征函数$v: 2^N \to \mathbb{R}$定义，$v(S)$是联盟$S$可以保证获得的最大收益（$v(\emptyset) = 0$）。博弈是**超加性的**（superadditive），如果$v(S \cup T) \geq v(S) + v(T)$（$S \cap T = \emptyset$）。

**定义 258.2**（转归 / Imputation）：**转归**是支付向量$x = (x_1, \ldots, x_n)$满足：
- 个体理性：$x_i \geq v(\{i\})$（每个参与者至少获得单独行动的收益）
- 集体理性 / 效率：$\sum_{i=1}^n x_i = v(N)$（总收益全部分配）

### 258.2 核与稳定集

**定义 258.3**（核 / Core，Gillies 1953）：博弈$(N, v)$的**核**是满足联盟理性的转归集合：

$$C(v) = \left\{ x \in \mathbb{R}^n : \sum_{i \in N} x_i = v(N),\; \sum_{i \in S} x_i \geq v(S) \; (\forall S \subset N) \right\}$$

核中的分配不会被任何联盟通过单独行动改进——它是转归集中最稳定的子集。

**定理 258.1**（Bondareva-Shapley定理，1963）：博弈的核非空当且仅当博弈是**平衡的**（balanced）：对所有平衡权$\{\lambda_S\}_{S \subseteq N}$（$\sum_{S \ni i} \lambda_S = 1$），有$\sum_S \lambda_S v(S) \leq v(N)$。Bondareva-Shapley定理将核的非空性等价于一组线性不等式的可解性——这是合作博弈论中与线性规划对偶理论联系最紧密的定理。

**定义 258.4**（Shapley值，1953）：参与者$i$的**Shapley值**是对其边际贡献的期望：

$$\phi_i(v) = \sum_{S \subseteq N \setminus \{i\}} \frac{|S|! (n - |S| - 1)!}{n!} \left[ v(S \cup \{i\}) - v(S) \right]$$

Shapley值将大联盟的总收益按照各参与者的平均边际贡献进行分配——其组合结构是参与者加入联盟的所有可能顺序上的均匀分布。

**定理 258.2**（Shapley值的公理化）：Shapley值是满足以下公理的唯一解概念：效率（$\sum_i \phi_i(v) = v(N)$）、对称性（对等参与者获得相同支付）、虚拟参与者公理（零边际贡献的参与者获零）和可加性（$\phi(v + w) = \phi(v) + \phi(w)$）。这四条公理完全刻画了Shapley值——公理化方法是合作博弈论的核心方法论。

### 258.3 核仁与谈判集

**定义 258.5**（超额与核仁 / Nucleolus，Schmeidler 1969）：联盟$S$对分配$x$的**超额**为$e(x, S) = v(S) - \sum_{i \in S} x_i$。**核仁**是按词典序最小化超额向量（从大到小排列）的唯一分配点。核仁总是存在且唯一，且当核非空时核仁落在核内。

**定义 258.6**（谈判集 / Bargaining Set，Aumann-Maschler 1964）：谈判集是对异议的稳定性要求。若$i$对$j$提出异议（带替代联盟），$j$能提出反异议，则$x$在谈判集中。

---

---

## 第259章：机制设计与拍卖
机制设计是博弈论的"逆向"问题：给定社会目标，设计博弈规则使得参与者在追求自身利益时达到该目标。其数学核心是激励相容约束的刻画与VCG机制的构造。

### 259.1 社会选择与Gibbard-Satterthwaite定理

**定义 259.1**（社会选择函数 / SCF）：**社会选择函数**$f: \Theta \to X$将偏好剖面映射到社会结果。$\Theta_i$是参与者$i$的类型空间，$X$是备选结果集。

**定义 259.2**（激励相容 / Incentive Compatibility）：直接显示机制$(f, t)$（$t_i$是转移支付）是**激励相容**的，如果真实报告类型是Bayes-Nash均衡：对所有的$i$、$\theta_i$、$\theta_i'$，

$$\mathbb{E}_{\theta_{-i}}[u_i(f(\theta_i, \theta_{-i}), \theta_i) + t_i(\theta_i, \theta_{-i})] \geq \mathbb{E}_{\theta_{-i}}[u_i(f(\theta_i', \theta_{-i}), \theta_i) + t_i(\theta_i', \theta_{-i})]$$

**定理 259.1**（Gibbard-Satterthwaite定理，1973/1975）：若$|X| \geq 3$且$f$的值域包含至少三个结果，则任何非独裁的社会选择函数都是可操纵的（即非激励相容的）。这是社会选择理论中的核心不可能性定理——在相当一般的条件下，策略性操纵是不可避免的。

### 259.2 VCG机制与有效分配

**定义 259.3**（Vickrey-Clarke-Groves机制，1961/1971/1973）：**VCG机制**选择有效分配$x^*(\theta) = \arg\max_x \sum_i v_i(x, \theta_i)$，转移支付为

$$t_i^{\text{VCG}}(\theta) = \sum_{j \neq i} v_j(x^*(\theta), \theta_j) - \max_x \sum_{j \neq i} v_j(x, \theta_j)$$

转移支付$t_i$等于参与者$i$对其他参与者造成的**外部性**——其存在导致社会总福利的减少量。

**定理 259.2**（VCG的激励相容性）：VCG机制是策略性的（dominant-strategy incentive compatible），即真实报告是每个参与者的占优策略。这是机制设计中最重要的正可能性结果。

**定理 259.3**（Myerson-Satterthwaite不可能定理，1983）：在双边贸易中（一个买方、一个卖方），不存在同时满足激励相容、个体理性和预算平衡且事后有效的机制。该定理将Gibbard-Satterthwaite不可能性推广到含转移支付的拟线性环境。

### 259.3 最优拍卖的数学结构

**定义 259.4**（Myerson最优拍卖，1981）：买方$i$的估价$v_i$独立来自分布$F_i$。**虚拟价值函数**为$\psi_i(v_i) = v_i - \frac{1 - F_i(v_i)}{f_i(v_i)}$。最优拍卖将物品分配给虚拟价值最高的买方，保留价$r^* = \psi_i^{-1}(0)$。

**定理 259.4**（Myerson最优拍卖的推导概要）：卖方的期望收入可写为各买方虚拟剩余的期望和：

$$\mathbb{E}\left[\sum_i \psi_i(v_i) x_i(v)\right]$$

其中$x_i(v) \in \{0, 1\}$为分配规则，$\psi_i(v_i) = v_i - \frac{1-F_i(v_i)}{f_i(v_i)}$为**虚拟估值函数**。推导要点：由激励相容条件导出包络定理——买方的期望支付由其分配概率积分确定；将期望支付代入卖方目标函数后，收入仅依赖于分配规则$x_i(v)$和虚拟估值。最优分配规则为：将物品分配给$\max_i \psi_i(v_i)$的买方（若最高虚拟估值$<$卖方保留价值$0$，则物品不售出）。**保留价**$r_i^* = \psi_i^{-1}(0)$保证卖方不对虚拟估值为负的买方售出。当买方对称时，最优拍卖化简为含最优保留价的二价拍卖（Vickrey 1961）——这是收入等价定理的直接推论。Myerson的理论统一了最优拍卖、最优垄断定价和非线性定价等机制设计问题。

**定理 259.5**（收入等价定理 / Revenue Equivalence）：任何两个拍卖机制若分配函数相同且最低类型的期望支付相同，则卖方的期望收入相同。收入等价定理是激励相容约束和包络定理的直接数学推论。

---

---

## 第260章：演化博弈论
演化博弈论从动力系统的视角解释博弈均衡的形成，将均衡视为动态调整过程的稳定状态。其数学核心是复制者方程和演化稳定策略概念。

### 260.1 演化稳定策略

**定义 260.1**（演化稳定策略 / ESS，Maynard Smith-Price 1973）：在大种群中，策略$x$是**演化稳定策略**，如果对任何变异策略$y \neq x$，存在$\bar{\varepsilon} > 0$使得对所有$\varepsilon \in (0, \bar{\varepsilon})$：

$$u(x, (1-\varepsilon)x + \varepsilon y) > u(y, (1-\varepsilon)x + \varepsilon y)$$

即$x$在面对少量变异入侵时仍能维持其优势——入侵后种群的期望支付仍以$x$为严格更优。

**定理 260.1**（ESS的等价条件）：$x$是ESS当且仅当：
1. $(x, x)$是Nash均衡：$u(x, x) \geq u(y, x)$（对所有$y$）
2. 若$u(x, x) = u(y, x)$（$y$是对$x$的备选最优反应），则$u(x, y) > u(y, y)$

条件2是ESS对Nash均衡的加强：当变异策略不严格劣于现存策略时，现存策略必须在变异种群中表现得比变异策略自身更好——这是抵御入侵的稳定性条件。

### 260.2 复制者动态

**定义 260.2**（复制者方程 / Replicator Dynamics，Taylor-Jonker 1978）：设$x_i$是种群中使用纯策略$i$的比例。**复制者方程**为

$$\dot{x}_i = x_i \left( u(i, x) - \bar{u}(x) \right)$$

其中$u(i, x)$是纯策略$i$对混合策略种群$x$的期望收益，$\bar{u}(x) = \sum_j x_j u(j, x)$是平均收益。

复制者方程的基本机制是：使用收益高于平均水平的策略的比例增长，低于平均水平的策略的比例减小——其变化率与当前比例和相对收益差成正比。

**定理 260.2**（复制者动态的性质）：
- 单纯形$\Delta$是正向不变集——比例始终非负且和为1
- Nash均衡是动态系统的平衡点
- 渐近稳定的平衡点（在单纯形内部）必为ESS
- 被严格占优的策略最终被淘汰（$\lim_{t \to \infty} x_i(t) = 0$）

**定理 260.3**（演化博弈论的Folk定理）：ESS在单纯形内部是复制者动态的渐近稳定平衡点；边界ESS需要额外条件（如对进入单纯形内部的轨线具有局部吸引性）才能保证渐近稳定性。反过来，渐近稳定平衡点是Nash均衡，但不一定是ESS——渐近稳定性与ESS之间是包含而非等价关系。

### 260.3 学习动力学

**定义 260.3**（虚拟博弈 / Fictitious Play，Brown 1951）：参与者假设对手使用历史经验分布，在每步选择对过去对手策略分布的最优反应。

**定理 260.4**（零和博弈中的虚拟博弈）：在有限二人零和博弈中，虚拟博弈的对手策略经验分布收敛到Nash均衡策略。该结论将零和博弈的特殊结构与学习动力学的收敛性建立了数学联系。

**定义 260.4**（无悔学习与Regret Matching）：参与者在每轮后计算各策略的累积后悔（regret），以与正后悔成比例的概率选择策略。Hart-Mas-Colell（2000）证明了无悔学习使经验分布收敛到相关均衡集——这是将在线学习算法与博弈均衡概念联系起来的基本定理。

---

---

## 第261章：随机博弈与重复博弈
在多期博弈中，参与者可以观察过去的行为并据此调整策略。重复博弈研究长期互动中合作与均衡的可能性。

### 261.1 重复博弈与Folk定理

**定义 261.1**（无限重复博弈）：阶段博弈$G$无限重复，贴现因子$\delta \in (0, 1)$。参与者的总收益是各阶段收益的贴现和：$U_i = (1 - \delta) \sum_{t=0}^\infty \delta^t u_i(a^t)$。

**定理 261.1**（Nash Folk定理，Friedman 1971）：对无限重复博弈，任何可行且个体理性的支付向量（超过极小极大支付）都可以作为某个$\delta$充分接近$1$时的子博弈完美均衡支付。

**定理 261.2**（极限平均支付下的Folk定理 / Aumann-Shapley-Rubinstein）：在无限重复博弈中，若采用**极限平均支付准则**（$U_i = \liminf_{T \to \infty} \frac{1}{T} \sum_{t=0}^{T-1} u_i(a^t)$），则任何**可行且严格个体理性**的支付向量（超过各参与者的极小极大支付）均可作为Nash均衡实现，且对任意$\varepsilon > 0$存在子博弈完美均衡使支付$\varepsilon$-逼近该向量。证明构造：将目标支付分解为阶段博弈行动序列的凸组合，参与者相互监控对方是否遵循预定行动轨迹；一旦检测到偏离，则永久切换到极小极大惩罚阶段。极限平均准则（无贴现$\delta = 1$）下惩罚成本为零——与贴现情形（$\delta < 1$需足够大以确保惩罚可置信）相比，Folk定理的结论更强。此外，Neyman（1985/1998）证明了在有限重复博弈中，若参与者有界理性（使用有限自动机实现策略），合作可作为$\varepsilon$-均衡出现。

**定义 261.2**（触发策略 / Trigger Strategies）：**冷酷触发策略**（Grim Trigger）：对方偏离则永远合作终止。$\delta$充分大时，触发策略构成子博弈完美均衡。

### 261.2 随机博弈

**定义 261.3**（随机博弈 / Stochastic Game，Shapley 1953）：**随机博弈**由状态空间$\Omega$、各状态下的阶段博弈和状态转移概率$p(\omega' | \omega, a)$组成。贴现因子为$\delta$。

**定理 261.3**（Shapley的二人零和随机博弈）：在有限状态、有限行动的二人零和随机博弈中，存在唯一的值$v_\delta(\omega)$，且双方有最优稳定策略。值函数满足Shapley方程：

$$v(\omega) = \operatorname{Val}\left[ (1-\delta) r(\omega, a) + \delta \sum_{\omega'} p(\omega' | \omega, a) v(\omega') \right]$$

Shapley方程是Bellman最优性方程在零和博弈框架下的推广——其算子也是压缩的。

**定理 261.4**（Mertens-Neyman定理，1981）：在有限二人零和随机博弈中，对于接近$1$的贴现因子，值函数$v(\omega)$关于$\delta$一致有界。

### 261.3 重复博弈中的声誉效应

**定理 261.5**（Kreps-Wilson-Milgrom-Roberts声誉定理，1982）：在有限重复囚徒困境中，若存在小概率的不理性类型，理性参与者在博弈早期也会合作（建立声誉），直到最后几期才会背叛。这是声誉效应将有限重复博弈中的逆向归纳逻辑打破的经典结论。

**定理 261.6**（Fudenberg-Levine定理，1989）：单个长期参与者面对一系列短期参与者时，即使承诺类型概率极小，长期参与者在充分长的博弈中也能获得接近Stackelberg收益的支付。

---

*本卷系统阐述了最优化与博弈两大数学分支：最优化部分涵盖线性规划对偶定理（凸分析）、整数规划的代数结构（全幺模矩阵）和网络流的图论基础（最大流最小割定理作为线性规划对偶的特例）；博弈论部分从Nash均衡的拓扑学证明（Kakutani不动点定理）出发，建立合作博弈的公理化体系（Shapley值与核）、机制设计的数学原理（VCG与激励相容）、演化博弈的动力学理论（复制者方程与ESS）、以及随机博弈与重复博弈的不动点框架。共8章。*


*本卷基于 V2 Ch 11（线性规划初步）和 V7（线性代数），建立了线性规划、对偶理论、凸优化、非线性规划、变分法与最优控制引论、互补性问题与变分不等式、半定规划与离散凸分析、动态规划与随机规划的系统理论。补充内容将控制理论的数学结构（Kalman秩判据与可控性可观测性、Pontryagin极值原理与HJB方程、Kalman-Bucy随机滤波与分离原理、鲁棒控制的H-inf范数与LMI框架、Lyapunov稳定性与非线性控制方法）纳入优化理论的延伸框架；另行补充博弈与机制的数学理论（线性规划对偶、全单模矩阵、最大流最小割、Nash不动点、Shapley公理、VCG机制）。共 13 章。*


*卷二十六：优化理论终。*
