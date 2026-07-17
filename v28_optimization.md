# 卷二十八：最优化理论

## 第313章：线性规划与单纯形法
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

---

## 第314章：对偶理论与灵敏度分析
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




### 252.3 网络规划与单纯形法的几何联系

**定理 252.6**（单纯形法的几何解释）：单纯形法从多面体$P = \{x : Ax = b, x \geq 0\}$的一个顶点出发，沿下降边移动到相邻顶点，直至达到最优顶点。单纯形表对应于基矩阵$B$的逆：基本解为$x_B = B^{-1} b$，非基变量为$0$。

### 252.4 非线性规划的KKT条件

线性规划是凸优化的一类特例。对一般非线性规划，Karush-Kuhn-Tucker（KKT）条件提供了最优性的必要条件（凸情形下为充要条件）。

**定理 252.7**（KKT条件，Karush 1939 / Kuhn-Tucker 1951）：考虑问题$\min f(x)$ s.t. $g_i(x) \leq 0$，$h_j(x) = 0$。设$x^*$满足约束规范（如LICQ），则存在Lagrange乘子$\mu_i \geq 0$、$\lambda_j$使得：

$$\nabla f(x^*) + \sum_i \mu_i \nabla g_i(x^*) + \sum_j \lambda_j \nabla h_j(x^*) = 0, \quad \mu_i g_i(x^*) = 0$$

KKT条件是Lagrange乘子法从等式约束到不等式约束的自然推广——互补松弛条件$\mu_i g_i(x^*) = 0$是这一推广的核心特征。


---

---

---

## 第315章：凸优化
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

---

## 第316章：非线性规划
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

---

## 第317章：变分法与最优控制引论
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

---

## 第318章：互补性问题与变分不等式
互补性问题是优化理论中的一个重要分支，其核心是线性互补问题$\operatorname{LCP}(q, M)$：给定向量$q \in \mathbb{R}^n$和矩阵$M \in \mathbb{R}^{n \times n}$，求$z \in \mathbb{R}^n$使得$z \geq 0$，$Mz + q \geq 0$，且$z^T(Mz + q) = 0$。$\operatorname{LCP}$与多个数学领域紧密关联：二次规划$\min\{\frac{1}{2}x^TQx + c^Tx : Ax \geq b, x \geq 0\}$的KKT条件即为$\operatorname{LCP}$；双矩阵博弈的Nash均衡也可化为$\operatorname{LCP}$。求解$\operatorname{LCP}$的经典算法是Lemke算法（1965），通过引入人工变量$z_0$构造几乎互补基，沿射线进行主元迭代直到$z_0$出基。Lemke算法在$M$为P-矩阵（所有主子式为正）时保证收敛。变分不等式$\operatorname{VI}(K, F)$求$x^* \in K$使$\langle F(x^*), x - x^* \rangle \geq 0$对所有$x \in K$成立，是$\operatorname{LCP}$的无穷维推广，在均衡分析和交通分配中有广泛应用。


---

---

---

## 第319章：半定规划与离散凸分析
### 137.1 半定规划

半定规划（Semidefinite Programming, SDP）是在线性矩阵不等式约束下极小化线性目标函数的凸优化问题：

$$\min \; \mathbf{c}^T \mathbf{x} \quad \text{s.t.} \quad F_0 + \sum_{i=1}^n x_i F_i \succeq 0$$

其中 $F_i$ 为 $m \times m$ 对称矩阵，$X \succeq 0$ 表示 $X$ 半正定。SDP 包含线性规划（LP, $F_i$ 为对角矩阵时）和二阶锥规划（SOCP）作为特例，严格包含关系为 $\text{LP} \subset \text{SOCP} \subset \text{SDP}$。内点法可在多项式时间内求解 SDP（至给定精度）。在组合优化中 SDP 松弛有重要突破：Goemans-Williamson（1995）将 MAX-CUT 问题表示为整数二次规划，通过 SDP 松弛（$X \succeq 0$ 代替 $X = \mathbf{v}\mathbf{v}^T$）并使用随机超平面舍入，获得了约 0.878 的近似比——这是基于 SDP 的第一个突破性近似算法，极大地推动了半定规划在近似算法设计中的应用。

### 137.2 离散凸分析

离散凸分析由室田一雄（Murota）于 1990 年代建立，将凸分析推广到离散格点 $\mathbb{Z}^n$。核心概念包括两类互为共轭的函数族：（1）**L$^\natural$-凸函数**——满足离散中点凸性 $f(x) + f(y) \geq f(\lfloor\frac{x+y}{2}\rfloor) + f(\lceil\frac{x+y}{2}\rceil)$，其水平集为 L$^\natural$-凸集；（2）**M$^\natural$-凸函数**——基于交换性质的组合凸性，函数满足 $f(x) + f(y) \geq f(x - \mathbf{1}_A) + f(y + \mathbf{1}_A)$ 类型的交换不等式。它们分别是连续凸分析中凸函数对不同离散结构的适配，且通过 Legendre-Fenchel 变换互为共轭。应用涵盖经济学中不可分商品的竞争均衡存在性（Kelso-Crawford 的劳动市场模型）和运筹学中的资源配置与库存管理。


---

---

---

## 第320章：动态规划与随机规划
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

---

## 第321章（补充）
> 本卷研究由工程控制问题抽象出的数学理论——线性系统的代数结构、最优控制的变分方法、动态规划的HJB方程、以及Lyapunov稳定性理论。内容本质上是线性代数、常微分方程和变分法的深化专题。


---

---


*卷二十八：最优化理论终。*
