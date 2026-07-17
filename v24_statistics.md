# 卷二十四：统计学

## 第252章：估计理论
估计理论是统计推断的基础，研究如何从样本中估计未知参数。本章讨论无偏估计、Fisher 信息、Cramér-Rao 下界和极大似然估计。

### 109.1 统计模型与充分统计量

**定义 109.1**（参数统计模型）：**参数统计模型**是一族概率分布 $\{P_\theta : \theta \in \Theta\}$，其中 $\Theta \subseteq \mathbb{R}^k$ 是参数空间。样本 $X_1, \ldots, X_n$ 是 i.i.d. 来自 $P_\theta$。

**定义 109.2**（统计量）：**统计量** $T = T(X_1, \ldots, X_n)$ 是样本的可测函数（不依赖于未知参数 $\theta$）。

**定义 109.3**（充分统计量）：统计量 $T$ 称为关于 $\theta$ **充分**的，如果 $X$ 在 $T$ 给定下的条件分布不依赖于 $\theta$。即 $T$ 包含了样本中关于 $\theta$ 的所有信息。

**定理 109.1**（Fisher-Neyman 因子分解定理）：设 $\{P_\theta\}$ 有密度（或概率质量函数）$f(x \mid \theta)$。$T$ 是充分的当且仅当

$$f(x_1, \ldots, x_n \mid \theta) = g(T(x_1, \ldots, x_n), \theta) \cdot h(x_1, \ldots, x_n)$$

其中 $g$ 依赖于 $\theta$ 和 $T$，$h$ 不依赖于 $\theta$。

*证明*：离散情形。若 $T$ 充分，定义 $g(t, \theta) = P_\theta(T = t)$，$h(x) = P(X = x \mid T = t) / P_\theta(T = t)$（后者不依赖于 $\theta$）。反之亦然。∎

**例 109.1**：对正态分布 $X_i \sim \mathcal{N}(\mu, \sigma^2)$，$(\bar{X}, S^2)$（样本均值和方差）是 $(\mu, \sigma^2)$ 的充分统计量。对 $\mathcal{N}(\mu, 1)$，$\bar{X}$ 是 $\mu$ 的充分统计量。

### 109.2 点估计

**定义 109.4**（估计量）：参数 $\theta$（或 $g(\theta)$）的**估计量** $\hat{\theta}_n = \hat{\theta}_n(X_1, \ldots, X_n)$ 是样本的统计量。

**定义 109.5**（无偏性）：$\hat{\theta}_n$ 称为 **无偏**的，如果 $\mathbb{E}_\theta[\hat{\theta}_n] = \theta$（对所有 $\theta \in \Theta$）。其偏差为 $\operatorname{Bias}_\theta(\hat{\theta}_n) = \mathbb{E}_\theta[\hat{\theta}_n] - \theta$。

**定义 109.6**（均方误差，MSE）：$\operatorname{MSE}_\theta(\hat{\theta}_n) = \mathbb{E}_\theta[(\hat{\theta}_n - \theta)^2] = \operatorname{Var}_\theta(\hat{\theta}_n) + (\operatorname{Bias}_\theta(\hat{\theta}_n))^2$。

**定义 109.7**（相合性）：$\hat{\theta}_n$ 称为**相合**的（一致的），如果 $\hat{\theta}_n \xrightarrow{\mathbb{P}_\theta} \theta$（对所有 $\theta$）。强相合：$\hat{\theta}_n \xrightarrow{\text{a.s.}} \theta$。

### 109.3 Fisher 信息与 Cramér-Rao 下界

**定义 109.8**（得分函数与 Fisher 信息）：设模型 $\{f(x \mid \theta) : \theta \in \Theta\}$（$\Theta \subseteq \mathbb{R}$）满足正则条件。**得分函数**为 $S(\theta, x) = \frac{\partial}{\partial \theta} \log f(x \mid \theta)$。单个观测的 **Fisher 信息**为

$$I(\theta) = \mathbb{E}_\theta\left[\left(\frac{\partial}{\partial \theta} \log f(X \mid \theta)\right)^2\right] = -\mathbb{E}_\theta\left[\frac{\partial^2}{\partial \theta^2} \log f(X \mid \theta)\right]$$

$n$ 个 i.i.d. 观测的 Fisher 信息为 $n I(\theta)$。

**定理 109.2**（Cramér-Rao 下界）：设 $\hat{\theta}_n$ 是 $g(\theta)$ 的无偏估计量。在正则条件下，

$$\operatorname{Var}_\theta(\hat{\theta}_n) \geq \frac{(g'(\theta))^2}{n I(\theta)}$$

特别地，对 $\theta$ 的无偏估计，$\operatorname{Var}_\theta(\hat{\theta}_n) \geq 1/(n I(\theta))$。

*证明思路*：使用 Cauchy-Schwarz 不等式。$\operatorname{Cov}_\theta(\hat{\theta}_n, S_n) = g'(\theta)$，其中 $S_n$ 是总得分函数。$|\operatorname{Cov}|^2 \leq \operatorname{Var}(\hat{\theta}_n) \cdot \operatorname{Var}(S_n)$，而 $\operatorname{Var}(S_n) = n I(\theta)$。∎

**定义 109.9**（有效估计量）：达到 Cramér-Rao 下界的无偏估计量称为**有效**的。有效估计量存在当且仅当分布属于指数族。大多数常用分布（正态、二项、Poisson、Gamma、Beta 等）属于指数族，但并非所有分布都如此（如 Cauchy 分布、均匀分布不属于指数族）。

### 109.4 极大似然估计

**定义 109.10**（似然函数）：**似然函数** $L(\theta \mid x) = f(x \mid \theta)$（将 $\theta$ 视为变量）。**对数似然** $\ell(\theta \mid x) = \log L(\theta \mid x)$。

**定义 109.11**（极大似然估计，MLE）：**极大似然估计量** $\hat{\theta}_{\text{MLE}}$ 最大化 $L(\theta \mid X)$（或等价地 $\ell(\theta \mid X)$）：

$$\hat{\theta}_{\text{MLE}} = \arg\max_{\theta \in \Theta} L(\theta \mid X)$$

**定理 109.3**（MLE 的渐近性质）：在正则条件下：
1. **相合性**：$\hat{\theta}_{\text{MLE}} \xrightarrow{\mathbb{P}} \theta_0$（真值）
2. **渐近正态性**：$\sqrt{n}(\hat{\theta}_{\text{MLE}} - \theta_0) \xrightarrow{d} \mathcal{N}(0, I(\theta_0)^{-1})$
3. **渐近有效性**：MLE 渐近达到 Cramér-Rao 下界

*证明思路*：$\hat{\theta}$ 满足 $\ell'(\hat{\theta}) = 0$。Taylor 展开：$0 = \ell'(\theta_0) + \ell''(\theta_0)(\hat{\theta} - \theta_0) + \cdots$。$\sqrt{n}(\hat{\theta} - \theta_0) \approx -\ell'(\theta_0)/\ell''(\theta_0) \cdot \sqrt{n}$。由 CLT，$\ell'(\theta_0)/\sqrt{n} \xrightarrow{d} \mathcal{N}(0, I(\theta_0))$，由大数定律，$\ell''(\theta_0)/n \to -I(\theta_0)$。由 Slutsky 定理得证。∎

**定理 109.4**（MLE 的不变性）：若 $\hat{\theta}$ 是 $\theta$ 的 MLE，$g$ 是任意函数，则 $g(\hat{\theta})$ 是 $g(\theta)$ 的 MLE。

---

---

---

---

---

## 第253章：假设检验
假设检验是统计推断的另一个核心，用于判断数据是否支持某一假设。本章介绍 Neyman-Pearson 引理和一致最优势检验。

### 110.1 假设检验的基本概念

**定义 110.1**（假设检验）：**假设检验**问题中，**原假设** $H_0: \theta \in \Theta_0$ 与**备择假设** $H_1: \theta \in \Theta_1$（$\Theta_0 \cap \Theta_1 = \varnothing$）。

**定义 110.2**（检验函数与拒绝域）：**检验函数** $\varphi(x) \in [0, 1]$ 是拒绝 $H_0$ 的概率（给定数据 $x$）。**拒绝域** $R = \{x : \varphi(x) = 1\}$。若 $\varphi(x) \in \{0, 1\}$，称为**非随机化检验**。

**定义 110.3**（两类错误）：
- **第一类错误**（假阳性）：$H_0$ 为真但被拒绝。概率 $\alpha(\theta) = \mathbb{E}_\theta[\varphi(X)]$（$\theta \in \Theta_0$）
- **第二类错误**（假阴性）：$H_1$ 为真但未被拒绝。概率 $\beta(\theta) = 1 - \mathbb{E}_\theta[\varphi(X)]$（$\theta \in \Theta_1$）

**定义 110.4**（检验水平与功效）：检验 $\varphi$ 的**水平**（size）为 $\alpha = \sup_{\theta \in \Theta_0} \mathbb{E}_\theta[\varphi(X)]$。**功效函数**（power）为 $\pi(\theta) = \mathbb{E}_\theta[\varphi(X)]$（$\theta \in \Theta_1$）。

### 110.2 Neyman-Pearson 引理

**定理 110.1**（Neyman-Pearson 引理）：考虑简单假设检验 $H_0: \theta = \theta_0$ vs $H_1: \theta = \theta_1$。设 $f_0, f_1$ 分别是 $H_0$ 和 $H_1$ 下的密度。则水平 $\alpha$ 的**最优势检验**（最大功效）由似然比检验给出：

$$\varphi(x) = \begin{cases} 1 & \text{若 } \frac{f_1(x)}{f_0(x)} > c \\ \gamma & \text{若 } \frac{f_1(x)}{f_0(x)} = c \\ 0 & \text{若 } \frac{f_1(x)}{f_0(x)} < c \end{cases}$$

其中 $c$ 和 $\gamma$ 选择使得 $\mathbb{E}_{\theta_0}[\varphi(X)] = \alpha$。

*证明*：设 $\varphi^*$ 是 Neyman-Pearson 检验，$\varphi$ 是任意其他水平 $\leq \alpha$ 的检验。则 $(\varphi^* - \varphi)(f_1 - c f_0) \geq 0$ 逐点。积分得 $\mathbb{E}_{\theta_1}[\varphi^*] - \mathbb{E}_{\theta_1}[\varphi] \geq 0$。∎

**推论 110.2**（单调似然比）：若 $\{f_\theta\}$ 关于统计量 $T(x)$ 有单调似然比（即 $f_{\theta_1}(x)/f_{\theta_0}(x)$ 是 $T(x)$ 的非降函数，$\theta_1 > \theta_0$），则对 $H_0: \theta \leq \theta_0$ vs $H_1: \theta > \theta_0$，存在一致最优势（UMP）检验，拒绝域为 $T(x) > c$。

### 110.3 似然比检验

**定义 110.5**（广义似然比检验，GLRT）：对复合假设 $H_0: \theta \in \Theta_0$ vs $H_1: \theta \in \Theta \setminus \Theta_0$，**似然比统计量**为

$$\Lambda(X) = \frac{\sup_{\theta \in \Theta_0} L(\theta \mid X)}{\sup_{\theta \in \Theta} L(\theta \mid X)}$$

拒绝域为 $\Lambda(X) \leq c$（$0 \leq c \leq 1$）。

**定理 110.3**（Wilks 定理）：在 $H_0$ 下（正则条件），$-2 \log \Lambda(X) \xrightarrow{d} \chi^2_{\nu}$，其中 $\nu = \dim \Theta - \dim \Theta_0$（自由度等于被检验的参数个数）。

**例 110.1**（$t$ 检验）：对正态均值 $\mu$ 的检验 $H_0: \mu = \mu_0$ vs $H_1: \mu \neq \mu_0$（$\sigma^2$ 未知），$t$ 统计量 $T = \sqrt{n}(\bar{X} - \mu_0)/S \sim t_{n-1}$（在 $H_0$ 下）。拒绝域：$|T| > t_{n-1, \alpha/2}$。

**例 110.2**（$\chi^2$ 拟合优度检验）：检验样本是否来自某个分布。Pearson $\chi^2$ 统计量 $\sum (O_i - E_i)^2 / E_i \xrightarrow{d} \chi^2_{k-1}$（在 $H_0$ 下）。

---

---

---

---

---

## 第254章：置信区间与贝叶斯方法
本章讨论区间估计和置信区间，以及贝叶斯推断的基本框架。

### 111.1 置信区间

**定义 111.1**（置信区间）：参数 $\theta$ 的 $1 - \alpha$ **置信区间**（或置信集）是只依赖于样本的随机集合 $C(X)$，满足

$$\mathbb{P}_\theta(\theta \in C(X)) \geq 1 - \alpha \quad \text{对所有 } \theta \in \Theta$$

$1 - \alpha$ 称为**置信水平**（或覆盖概率）。

**定义 111.2**（枢轴量）：随机量 $Q(X, \theta)$ 称为**枢轴量**（pivotal quantity），如果其分布不依赖于 $\theta$。由 $\mathbb{P}(a \leq Q(X, \theta) \leq b) = 1 - \alpha$ 可解出 $\theta$ 的置信区间。

**例 111.1**（正态均值的置信区间）：
- $\sigma^2$ 已知：$\bar{X} \pm z_{\alpha/2} \sigma / \sqrt{n}$（$z_{\alpha/2}$ 是标准正态分位数）
- $\sigma^2$ 未知：$\bar{X} \pm t_{n-1, \alpha/2} S / \sqrt{n}$（$t$ 分布分位数）

**定理 111.1**（置信区间与假设检验的对偶）：$\theta$ 的 $1 - \alpha$ 置信集是所有不被水平 $\alpha$ 检验拒绝的 $\theta_0$ 的集合。反之，水平 $\alpha$ 的检验可通过检查 $\theta_0$ 是否在置信区间内构造。

### 111.2 贝叶斯方法

**定义 111.3**（贝叶斯模型）：在贝叶斯框架中，参数 $\theta$ 被视为随机变量，具有**先验分布** $\pi(\theta)$。给定 $\theta$，数据 $X$ 的分布为 $f(x \mid \theta)$。

**定理 111.2**（贝叶斯定理）：**后验分布**为

$$\pi(\theta \mid x) = \frac{f(x \mid \theta) \pi(\theta)}{\int_\Theta f(x \mid \theta) \pi(\theta) d\theta} \propto f(x \mid \theta) \pi(\theta)$$

即后验 $\propto$ 似然 $\times$ 先验。

**定义 111.4**（共轭先验）：先验族 $\mathcal{F}$ 称为关于似然 $f(x \mid \theta)$**共轭**的，如果后验分布也属于 $\mathcal{F}$。

**例 111.2**（常见共轭先验）：
- Beta-Binomial：$\theta \sim \operatorname{Beta}(\alpha, \beta)$，$X \mid \theta \sim \operatorname{Binomial}(n, \theta)$，后验 $\theta \mid X \sim \operatorname{Beta}(\alpha + X, \beta + n - X)$
- Normal-Normal：$\theta \sim \mathcal{N}(\mu_0, \tau_0^2)$，$X_i \mid \theta \sim \mathcal{N}(\theta, \sigma^2)$（$\sigma^2$ 已知），后验 $\theta \mid X \sim \mathcal{N}(\mu_n, \tau_n^2)$
- Gamma-Poisson：$\lambda \sim \operatorname{Gamma}(\alpha, \beta)$，$X_i \mid \lambda \sim \operatorname{Poisson}(\lambda)$，后验 $\lambda \mid X \sim \operatorname{Gamma}(\alpha + \sum X_i, \beta + n)$

**定义 111.5**（贝叶斯估计）：常用贝叶斯估计包括：
- **后验均值**：$\hat{\theta}_{\text{Bayes}} = \mathbb{E}[\theta \mid X]$（最小化平方误差损失）
- **后验中位数**：$\hat{\theta}_{\text{med}}$（最小化绝对误差损失）
- **最大后验（MAP）**：$\hat{\theta}_{\text{MAP}} = \arg\max_\theta \pi(\theta \mid X)$（最小化 0-1 损失）

**定理 111.3**（Bernstein-von Mises 定理）：在正则条件下，当样本量 $n \to \infty$ 时，后验分布渐近为正态分布 $\mathcal{N}(\hat{\theta}_{\text{MLE}}, (n I(\hat{\theta}_{\text{MLE}}))^{-1})$，且与先验分布无关（先验的影响随 $n \to \infty$ 消失）。

**例 111.3**（Jeffreys 先验）：无信息先验的经典选择是 **Jeffreys 先验**：$\pi(\theta) \propto \sqrt{I(\theta)}$（$I(\theta)$ 是 Fisher 信息）。Jeffreys 先验在参数变换下不变。

---

---

---

---

---

## 第255章：线性模型
线性模型是统计中最广泛使用的模型框架，包括回归、方差分析（ANOVA）和协方差分析。本章讨论最小二乘估计、Gauss-Markov 定理和方差分析。

### 112.1 线性回归模型

**定义 112.1**（线性模型）：**线性模型**为

$$\mathbf{Y} = \mathbf{X}\boldsymbol{\beta} + \boldsymbol{\varepsilon}$$

其中 $\mathbf{Y} \in \mathbb{R}^n$ 是响应向量，$\mathbf{X} \in \mathbb{R}^{n \times p}$ 是设计矩阵（已知），$\boldsymbol{\beta} \in \mathbb{R}^p$ 是未知回归系数，$\boldsymbol{\varepsilon}$ 是误差向量，满足 $\mathbb{E}[\boldsymbol{\varepsilon}] = \mathbf{0}$，$\operatorname{Cov}(\boldsymbol{\varepsilon}) = \sigma^2 \mathbf{I}_n$。

**定义 112.2**（最小二乘估计，OLS）：$\boldsymbol{\beta}$ 的**最小二乘估计**为

$$\hat{\boldsymbol{\beta}} = \arg\min_{\boldsymbol{\beta}} \|\mathbf{Y} - \mathbf{X}\boldsymbol{\beta}\|^2 = (\mathbf{X}^\top \mathbf{X})^{-1} \mathbf{X}^\top \mathbf{Y}$$

（假设 $\mathbf{X}^\top \mathbf{X}$ 可逆，即 $\mathbf{X}$ 满列秩）。

**定理 112.1**（Gauss-Markov 定理）：在 $\mathbb{E}[\boldsymbol{\varepsilon}] = \mathbf{0}$，$\operatorname{Cov}(\boldsymbol{\varepsilon}) = \sigma^2 \mathbf{I}_n$ 的假设下，$\hat{\boldsymbol{\beta}}$ 是 $\boldsymbol{\beta}$ 的**最佳线性无偏估计**（BLUE）：对所有 $c \in \mathbb{R}^p$，$c^\top \hat{\boldsymbol{\beta}}$ 在 $c^\top \boldsymbol{\beta}$ 的所有线性无偏估计中方差最小。

*证明*：设 $\tilde{\boldsymbol{\beta}} = \mathbf{C}\mathbf{Y}$ 是任意线性无偏估计。$\mathbb{E}[\tilde{\boldsymbol{\beta}}] = \mathbf{C}\mathbf{X}\boldsymbol{\beta} = \boldsymbol{\beta}$ 对所有 $\boldsymbol{\beta}$ 成立，故 $\mathbf{C}\mathbf{X} = \mathbf{I}$。$\operatorname{Cov}(\tilde{\boldsymbol{\beta}}) = \sigma^2 \mathbf{C}\mathbf{C}^\top$。$\operatorname{Cov}(\hat{\boldsymbol{\beta}}) = \sigma^2 (\mathbf{X}^\top \mathbf{X})^{-1}$。需证 $\mathbf{C}\mathbf{C}^\top - (\mathbf{X}^\top \mathbf{X})^{-1}$ 半正定，这等价于 $(\mathbf{C} - (\mathbf{X}^\top \mathbf{X})^{-1}\mathbf{X}^\top)(\mathbf{C} - (\mathbf{X}^\top \mathbf{X})^{-1}\mathbf{X}^\top)^\top \succeq 0$。∎

**定理 112.2**（正态误差下的推断）：若进一步 $\boldsymbol{\varepsilon} \sim \mathcal{N}(\mathbf{0}, \sigma^2 \mathbf{I}_n)$，则
1. $\hat{\boldsymbol{\beta}} \sim \mathcal{N}(\boldsymbol{\beta}, \sigma^2 (\mathbf{X}^\top \mathbf{X})^{-1})$
2. $\hat{\sigma}^2 = \|\mathbf{Y} - \mathbf{X}\hat{\boldsymbol{\beta}}\|^2 / (n - p)$ 是 $\sigma^2$ 的无偏估计，$(n-p)\hat{\sigma}^2/\sigma^2 \sim \chi^2_{n-p}$
3. $\hat{\beta}_j / (\hat{\sigma} \sqrt{(\mathbf{X}^\top \mathbf{X})^{-1}_{jj}}) \sim t_{n-p}$（用于 $H_0: \beta_j = 0$ 的检验）

### 112.2 方差分析

**定义 112.3**（一元方差分析，ANOVA）：**一元方差分析**比较 $k$ 个总体的均值：

$$H_0: \mu_1 = \mu_2 = \cdots = \mu_k \quad \text{vs} \quad H_1: \text{至少两个均值不同}$$

**定义 112.4**（平方和分解）：

$$\underbrace{\sum_{i=1}^k \sum_{j=1}^{n_i} (Y_{ij} - \bar{Y}_{\cdot\cdot})^2}_{\text{SST (总平方和)}} = \underbrace{\sum_{i=1}^k n_i (\bar{Y}_{i\cdot} - \bar{Y}_{\cdot\cdot})^2}_{\text{SSB (组间平方和)}} + \underbrace{\sum_{i=1}^k \sum_{j=1}^{n_i} (Y_{ij} - \bar{Y}_{i\cdot})^2}_{\text{SSW (组内平方和)}}$$

**定理 112.3**（ANOVA $F$ 检验）：在 $H_0$ 下（正态性、等方差假设），

$$F = \frac{\text{SSB} / (k-1)}{\text{SSW} / (n-k)} \sim F_{k-1, n-k}$$

拒绝域：$F > F_{k-1, n-k, \alpha}$。

**定义 112.5**（多元线性回归的 $F$ 检验）：对 $H_0: \beta_{q+1} = \cdots = \beta_p = 0$（嵌套模型比较），

$$F = \frac{(\text{SSE}_{\text{reduced}} - \text{SSE}_{\text{full}}) / (p - q)}{\text{SSE}_{\text{full}} / (n - p)} \sim F_{p-q, n-p}$$

其中 SSE 是残差平方和。

### 112.3 模型诊断与选择

**定义 112.6**（决定系数）：$R^2 = 1 - \frac{\text{SSE}}{\text{SST}}$ 是模型解释的变异比例。调整 $R^2$：$R^2_{\text{adj}} = 1 - \frac{\text{SSE}/(n-p)}{\text{SST}/(n-1)}$。

**定义 112.7**（AIC 与 BIC）：模型选择准则：
- **AIC**（Akaike 信息准则）：$\text{AIC} = -2 \log L + 2p$
- **BIC**（贝叶斯信息准则）：$\text{BIC} = -2 \log L + p \log n$

选择 AIC/BIC 最小的模型。BIC 对复杂模型的惩罚更重（当 $n \geq 8$）。

---

---

---

---

---

## 第256章：多元分析
多元分析处理多个响应变量同时观测的情形。本章介绍多元正态分布、主成分分析（PCA）和判别分析。

### 113.1 多元正态分布

**定义 113.1**（多元正态分布）：$\mathbb{R}^p$ 上的随机向量 $\mathbf{X} \sim \mathcal{N}_p(\boldsymbol{\mu}, \boldsymbol{\Sigma})$（$\boldsymbol{\Sigma} \succ 0$）的密度为

$$f(\mathbf{x}) = \frac{1}{(2\pi)^{p/2} |\boldsymbol{\Sigma}|^{1/2}} \exp\left(-\frac{1}{2} (\mathbf{x} - \boldsymbol{\mu})^\top \boldsymbol{\Sigma}^{-1} (\mathbf{x} - \boldsymbol{\mu})\right)$$

**命题 113.1**（多元正态的性质）：
1. 线性变换：$\mathbf{A}\mathbf{X} + \mathbf{b} \sim \mathcal{N}(\mathbf{A}\boldsymbol{\mu} + \mathbf{b}, \mathbf{A}\boldsymbol{\Sigma}\mathbf{A}^\top)$
2. 边缘分布：$\mathbf{X}$ 的任意子向量也是多元正态
3. 条件分布：$\mathbf{X}_1 \mid \mathbf{X}_2 = \mathbf{x}_2$ 是正态，均值 $\boldsymbol{\mu}_1 + \boldsymbol{\Sigma}_{12}\boldsymbol{\Sigma}_{22}^{-1}(\mathbf{x}_2 - \boldsymbol{\mu}_2)$
4. 独立性：$\mathbf{X}_1$ 与 $\mathbf{X}_2$ 独立当且仅当 $\boldsymbol{\Sigma}_{12} = \mathbf{0}$

**定理 113.1**（Wishart 分布）：设 $\mathbf{X}_1, \ldots, \mathbf{X}_n$ i.i.d. $\sim \mathcal{N}_p(\mathbf{0}, \boldsymbol{\Sigma})$。则 $\mathbf{W} = \sum_{i=1}^n \mathbf{X}_i \mathbf{X}_i^\top$ 服从 **Wishart 分布** $W_p(n, \boldsymbol{\Sigma})$（多元 $\chi^2$ 的推广）。

**定理 113.2**（Hotelling $T^2$ 检验）：对 $H_0: \boldsymbol{\mu} = \boldsymbol{\mu}_0$（多元均值检验），

$$T^2 = n(\bar{\mathbf{X}} - \boldsymbol{\mu}_0)^\top \mathbf{S}^{-1} (\bar{\mathbf{X}} - \boldsymbol{\mu}_0)$$

在 $H_0$ 下，$\frac{n-p}{p(n-1)} T^2 \sim F_{p, n-p}$。$T^2$ 是 $t$ 检验的多元推广。

### 113.2 主成分分析

**定义 113.2**（主成分分析，PCA）：PCA 寻找数据方差最大的方向。设 $\mathbf{X}$ 的协方差矩阵为 $\boldsymbol{\Sigma}$（或样本协方差矩阵 $\mathbf{S}$）。

**定理 113.3**（PCA 的推导）：设 $\boldsymbol{\Sigma}$ 的特征分解为 $\boldsymbol{\Sigma} = \mathbf{V}\boldsymbol{\Lambda}\mathbf{V}^\top$，其中 $\boldsymbol{\Lambda} = \operatorname{diag}(\lambda_1, \ldots, \lambda_p)$，$\lambda_1 \geq \cdots \geq \lambda_p \geq 0$。则第 $k$ 个**主成分**为 $Y_k = \mathbf{v}_k^\top \mathbf{X}$（$\mathbf{v}_k$ 是 $\lambda_k$ 对应的特征向量）。

*证明*：$\max_{\|\mathbf{a}\|=1} \operatorname{Var}(\mathbf{a}^\top \mathbf{X}) = \max_{\|\mathbf{a}\|=1} \mathbf{a}^\top \boldsymbol{\Sigma} \mathbf{a} = \lambda_1$（由 Rayleigh 商），达到于 $\mathbf{a} = \mathbf{v}_1$。第 $k$ 个主成分在与前 $k-1$ 个正交的约束下最大化方差。∎

**命题 113.2**（PCA 的性质）：
1. $\operatorname{Var}(Y_k) = \lambda_k$
2. $\sum_{k=1}^p \lambda_k = \operatorname{tr}(\boldsymbol{\Sigma})$（总方差）
3. 前 $k$ 个主成分解释的方差比例为 $\sum_{i=1}^k \lambda_i / \sum_{i=1}^p \lambda_i$

### 113.3 判别分析

**定义 113.3**（线性判别分析，LDA）：假设各类服从 $\mathcal{N}_p(\boldsymbol{\mu}_k, \boldsymbol{\Sigma})$（等协方差矩阵）。LDA 将 $\mathbf{x}$ 分类到使后验概率最大的类：

$$\delta_k(\mathbf{x}) = \mathbf{x}^\top \boldsymbol{\Sigma}^{-1} \boldsymbol{\mu}_k - \frac{1}{2} \boldsymbol{\mu}_k^\top \boldsymbol{\Sigma}^{-1} \boldsymbol{\mu}_k + \log \pi_k$$

其中 $\pi_k$ 是第 $k$ 类的先验概率。分类规则：$\hat{k} = \arg\max_k \delta_k(\mathbf{x})$。

**定义 113.4**（二次判别分析，QDA）：若各类协方差矩阵不同（$\boldsymbol{\Sigma}_k$），判别函数为

$$\delta_k(\mathbf{x}) = -\frac{1}{2} \log |\boldsymbol{\Sigma}_k| - \frac{1}{2} (\mathbf{x} - \boldsymbol{\mu}_k)^\top \boldsymbol{\Sigma}_k^{-1} (\mathbf{x} - \boldsymbol{\mu}_k) + \log \pi_k$$

**定理 113.4**（Fisher 判别分析）：Fisher 线性判别寻找投影方向 $\mathbf{a}$ 最大化组间方差与组内方差之比：

$$\max_{\mathbf{a}} \frac{\mathbf{a}^\top \mathbf{B} \mathbf{a}}{\mathbf{a}^\top \mathbf{W} \mathbf{a}}$$

其中 $\mathbf{B}$ 是组间散布矩阵，$\mathbf{W}$ 是组内散布矩阵。$\mathbf{a}$ 是 $\mathbf{W}^{-1}\mathbf{B}$ 的最大特征值对应的特征向量。这与 LDA（等协方差时）等价。

---

---

---

---

---

## 第257章：信息几何
信息几何由Amari和Chentsov在1980年代系统建立，将参数化概率分布族$\mathcal{M} = \{p(x \mid \theta) : \theta \in \Theta\}$视为统计流形，赋予Fisher信息度量$g_{ij}(\theta) = \mathbb{E}[\partial_i \ell \cdot \partial_j \ell]$（其中$\ell = \log p$）的Riemann几何结构。这一度量在参数变换下协变且由Chentsov定理唯一确定。进一步引入$\alpha$-联络$\Gamma_{ijk}^{(\alpha)} = \mathbb{E}[(\partial_i\partial_j\ell + \frac{1-\alpha}{2}\partial_i\ell \cdot \partial_j\ell)\partial_k\ell]$，$\alpha = \pm 1$分别对应指数联络和混合联络，两者关于Fisher度量对偶。Amari-Chentsov张量$T_{ijk} = \mathbb{E}[\partial_i\ell \cdot \partial_j\ell \cdot \partial_k\ell]$度量了统计流形的非平坦性。信息几何在机器学习中为自然梯度下降和EM算法的几何解释提供了理论基础，在神经网络的信息瓶颈原理和深度学习的流形学习中也有重要应用。

---

---

---

---

---

## 第258章：试验设计
试验设计（DOE）由Fisher在1920年代创立，其核心是Fisher三原则：(1)随机化——将实验单元随机分配以消除系统偏差；(2)重复——通过多次观测估计实验误差；(3)区组化——将同质单元分组以控制已知变异源。拉丁方设计通过行列双重区组控制两个干扰因素，与Greco-Latin方推广到多个因素。因子设计系统考察多个因素的主效应和交互效应，$2^k$因子设计是最基本的类型；当实验次数不可行时，采用分数因子设计以$2^{k-p}$次实验估计主要效应。响应面方法（RSM）由Box和Wilson于1951年提出，通过拟合二次响应曲面模型$y = \beta_0 + \sum \beta_i x_i + \sum \beta_{ij}x_i x_j + \sum \beta_{ii}x_i^2 + \varepsilon$，使用最速上升法寻优，是工业过程优化的核心工具。

---

---

---

---

---

## 第259章：抽样方法与调查设计（Sampling Methods）
抽样理论是统计学从有限总体中选取子集进行推断的方法论。**基本抽样方案**：（1）**简单随机抽样（SRS）**——每个大小为 $n$ 的子集等概率抽取，均值 $\bar{y}$ 是总体均值 $\bar{Y}$ 的无偏估计，方差为 $(1 - \frac{n}{N}) \frac{S^2}{n}$（有限总体修正因子 $1 - \frac{n}{N}$）；（2）**分层抽样**——将总体分为 $H$ 层，在各层内独立抽样，通过 Neyman 最优分配 $n_h \propto N_h S_h$ 最小化估计量的方差；（3）**系统抽样**——按固定间隔选取，当排序与变量相关时可显著提高精度；（4）**整群抽样**——在难以获取总体完整名单时，随机选取群（cluster）后调查群内全部个体；（5）**多阶段抽样**——先抽初级单元，再在选中单元内抽次级单元，逐级构造。**比值估计与回归估计**利用辅助变量提高精度：当辅助变量 $x$ 与目标变量 $y$ 高度线性相关时，比值估计 $\hat{Y}_R = \frac{\bar{y}}{\bar{x}} X$ 或回归估计 $\hat{Y}_{\text{reg}} = \bar{y} + \hat{\beta}(X - \bar{x})$ 可在大样本下显著降低方差。**Horvitz-Thompson 估计量**：$\hat{Y}_{HT} = \sum_{i \in \mathcal{S}} \frac{y_i}{\pi_i}$（$\pi_i$ 为个体 $i$ 的人样概率）对所有不等概率抽样设计一致有效。

---

---

---

---

---

## 第260章：时间序列分析（Time Series Analysis）
时间序列分析研究依时间顺序观测的随机过程 $\{X_t\}_{t \in \mathbb{Z}}$，其核心问题是建模、预测和推断动态依赖结构。

### 117.1 线性时间序列模型

**定义 117.1**（平稳过程）：时间序列 $\{X_t\}$ 称为**（弱）平稳**的，如果 $\mathbb{E}[X_t] = \mu$（常数），且自协方差函数 $\gamma(h) = \operatorname{Cov}(X_t, X_{t+h})$ 仅依赖于时滞 $h$。严平稳要求任意有限维联合分布平移不变。

**定义 117.2**（白噪声 / White Noise）：过程 $\{\varepsilon_t\}$ 称为**白噪声**，记作 $\varepsilon_t \sim \text{WN}(0, \sigma^2)$，若 $\mathbb{E}[\varepsilon_t] = 0$，$\operatorname{Var}(\varepsilon_t) = \sigma^2$，且 $\operatorname{Cov}(\varepsilon_t, \varepsilon_s) = 0$（$t \neq s$）。

**定义 117.3**（ARMA(p,q) 模型 / 自回归滑动平均）：

$$X_t = \sum_{i=1}^p \phi_i X_{t-i} + \varepsilon_t + \sum_{j=1}^q \theta_j \varepsilon_{t-j}$$

其中 $\{\varepsilon_t\}$ 为白噪声。AR（自回归）部分的平稳性由特征方程 $\Phi(z) = 1 - \phi_1 z - \cdots - \phi_p z^p = 0$ 的根在单位圆外的条件给出；MA（滑动平均）部分本身即平稳。ARMA 过程的**自相关函数**（ACF）在 MA 部分截尾、AR 部分拖尾，是模型识别的关键工具。

**定义 117.4**（ARIMA(p,d,q) 模型 / Box-Jenkins, 1970）：若 $\{X_t\}$ 经 $d$ 次差分后成为平稳的 ARMA 过程，即 $(1-B)^d X_t$ 服从 ARMA(p,q)（$B$ 为后移算子 $B X_t = X_{t-1}$），则称 $\{X_t\}$ 为 ARIMA(p,d,q) 过程。这是处理含趋势的非平稳时间序列的标准方法。

**定义 117.5**（季节性 ARIMA / SARIMA）：$\Phi_P(B^s) \phi_p(B) (1-B)^d (1-B^s)^D X_t = \Theta_Q(B^s) \theta_q(B) \varepsilon_t$，其中 $s$ 为季节周期（如 $s = 12$ 为月数据），$P, D, Q$ 为季节阶数。

**定义 117.6**（GARCH(p,q) 模型 / 广义自回归条件异方差，Engle 1982 / Bollerslev 1986）：

$$\begin{aligned} X_t &= \sigma_t Z_t, \quad Z_t \sim \text{i.i.d.}(0,1) \\ \sigma_t^2 &= \omega + \sum_{i=1}^p \alpha_i X_{t-i}^2 + \sum_{j=1}^q \beta_j \sigma_{t-j}^2 \end{aligned}$$

GARCH 模型捕捉金融时间序列中波动率聚类（volatility clustering）——大幅波动倾向于跟随大幅波动。Engle 因提出 ARCH 模型（1982）获 2003 年 Nobel 经济学奖。

### 117.2 谱分析与频域方法

**定义 117.7**（谱密度 / Spectral Density）：平稳时间序列的**谱密度**为自协方差函数的 Fourier 变换

$$f(\omega) = \frac{1}{2\pi} \sum_{h=-\infty}^\infty \gamma(h) e^{-i\omega h}, \quad \omega \in [-\pi, \pi]$$

其中 $\gamma(h) = \operatorname{Cov}(X_t, X_{t+h})$。反演公式为 $\gamma(h) = \int_{-\pi}^\pi e^{i\omega h} f(\omega) d\omega$。$f(\omega) \geq 0$ 对 $\omega$ 的积分等于 $\operatorname{Var}(X_t)$，刻画了方差在频率域的分布。

**定义 117.8**（周期图 / Periodogram）：$n$ 个观测的**周期图**为

$$I_n(\omega) = \frac{1}{2\pi n} \left|\sum_{t=1}^n X_t e^{-i\omega t}\right|^2$$

周期图 $I_n(\omega)$ 是谱密度 $f(\omega)$ 的渐近无偏估计，但非相合（其方差在 $n \to \infty$ 时不趋于零）。通过**窗口平滑**（如 Daniell 窗口、Bartlett 窗口）可得到相合估计 $\hat{f}(\omega) = \sum W_h I_n(\omega_h)$。

**定理 117.1**（Whittle 似然 / Whittle Likelihood）：在频域中，Gaussian 平稳过程的负对数似然近似为

$$-\ell(\theta) \approx \frac{1}{2\pi} \int_{-\pi}^\pi \left( \log f_\theta(\omega) + \frac{I_n(\omega)}{f_\theta(\omega)} \right) d\omega$$

这是频域 ARMA 参数估计（Whittle 估计）的基础，可通过快速 Fourier 变换高效计算。

---


---

---

---

---

---

## 第261章（补充）
> 本卷从概率论、泛函分析和优化理论的视角，系统阐述统计学习理论的核心数学结构——PAC可学性、一致收敛、函数逼近和随机优化。内容涵盖PAC学习与VC维（概率论与组合数学）、神经网络的通用逼近定理（泛函分析中稠密性定理的特例）、随机梯度下降的收敛理论（非凸优化）、以及最优传输（Monge-Kantorovich问题与Brenier定理）。

---

---

---

---

---

## 第262章：统计学习理论
统计学习理论研究从有限样本中学习的数学可能性和极限，由Vapnik和Chervonenkis在1970年代创立。其核心问题是：在什么条件下，有限样本足以保证学习算法具有泛化能力？VC维为此提供了精确的刻画。

### 187.1 PAC学习框架

**定义 187.1**（PAC学习，Probably Approximately Correct，Valiant 1984）：设$\mathcal{H}$是假设类，$\mathcal{D}$是未知分布。算法$\mathcal{A}$从i.i.d.样本$S \sim \mathcal{D}^m$中输出$h_S \in \mathcal{H}$。$\mathcal{H}$是**PAC可学习**的，如果存在函数$m_{\mathcal{H}}: (0,1)^2 \to \mathbb{N}$和算法$\mathcal{A}$，对任意$\epsilon, \delta \in (0,1)$和任意分布$\mathcal{D}$，当$m \geq m_{\mathcal{H}}(\epsilon, \delta)$时，

$$\mathbb{P}_{S \sim \mathcal{D}^m}[L_{\mathcal{D}}(h_S) \leq \min_{h \in \mathcal{H}} L_{\mathcal{D}}(h) + \epsilon] \geq 1 - \delta$$

其中$L_{\mathcal{D}}(h) = \mathbb{P}_{(x,y) \sim \mathcal{D}}[h(x) \neq y]$是泛化误差。

**定义 187.2**（样本复杂度）：$m_{\mathcal{H}}(\epsilon, \delta)$是$\mathcal{H}$的**样本复杂度**——达到$(\epsilon, \delta)$-PAC学习所需的最小样本数。

**定理 187.1**（有限假设类的PAC可学习性）：若$\mathcal{H}$有限，则$m_{\mathcal{H}}(\epsilon, \delta) \leq \frac{\log |\mathcal{H}| + \log(1/\delta)}{\epsilon^2}$。即$\mathcal{H}$是PAC可学习的，样本复杂度为$O(\epsilon^{-2} \log |\mathcal{H}|)$。

*证明*：使用Hoeffding不等式和联合界。对每个$h \in \mathcal{H}$，$|L_{\mathcal{D}}(h) - L_S(h)| \leq \epsilon$的概率$\geq 1 - 2e^{-2m\epsilon^2}$。联合界给出$\mathbb{P}[\exists h: |L_{\mathcal{D}}(h) - L_S(h)| > \epsilon] \leq 2|\mathcal{H}| e^{-2m\epsilon^2}$。令此概率$\leq \delta$，解出$m \geq \frac{\log(2|\mathcal{H}|) + \log(1/\delta)}{2\epsilon^2} = O(\epsilon^{-2} \log |\mathcal{H}|)$。∎

### 187.2 VC维

**定义 187.3**（VC维，Vapnik-Chervonenkis维数）：二分类假设类$\mathcal{H}$的**VC维**$\operatorname{VCdim}(\mathcal{H})$是能被$\mathcal{H}$打散（shatter）的最大点集的大小。即存在$d$个点，$\mathcal{H}$在这$d$个点上能实现所有$2^d$种标注方式。

**例 187.1**（VC维的例子）：
- $\mathbb{R}$上的区间：$\operatorname{VCdim} = 2$
- $\mathbb{R}^d$中的超平面：$\operatorname{VCdim} = d+1$
- 正弦函数类$\{x \mapsto \sin(\omega x) : \omega \in \mathbb{R}\}$：$\operatorname{VCdim} = \infty$

**定理 187.2**（VC维基本定理 / Vapnik-Chervonenkis定理）：假设类$\mathcal{H}$是PAC可学习的当且仅当其VC维有限。此时样本复杂度为

$$m_{\mathcal{H}}(\epsilon, \delta) = O\left(\frac{\operatorname{VCdim}(\mathcal{H}) + \log(1/\delta)}{\epsilon^2}\right)$$

*注*：VC维是判断假设类可学习性的精确刻画。有限VC维等价于一致大数定律成立。

**定理 187.3**（Sauer引理）：设$\operatorname{VCdim}(\mathcal{H}) = d$。则$\mathcal{H}$在$m$个点上的增长函数满足

$$\Pi_{\mathcal{H}}(m) \leq \sum_{i=0}^d \binom{m}{i} \leq \left(\frac{em}{d}\right)^d$$

Sauer引理是VC维有限$\Rightarrow$PAC可学习这一方向的关键组合工具。

### 187.3 Rademacher复杂度

**定义 187.4**（经验Rademacher复杂度）：给定样本$S = (z_1, \ldots, z_m)$，函数类$\mathcal{F}$的**经验Rademacher复杂度**为

$$\widehat{\mathcal{R}}_S(\mathcal{F}) = \mathbb{E}_{\sigma} \left[\sup_{f \in \mathcal{F}} \frac{1}{m} \sum_{i=1}^m \sigma_i f(z_i)\right]$$

其中$\sigma_i \sim \operatorname{Uniform}(\{-1, +1\})$是独立Rademacher随机变量。Rademacher复杂度衡量函数类拟合随机噪声的能力。

**定理 187.4**（Rademacher复杂度泛化界）：对任意$\delta > 0$，以概率至少$1 - \delta$，

$$\sup_{f \in \mathcal{F}} \left|\mathbb{E}[f(Z)] - \frac{1}{m} \sum_{i=1}^m f(z_i)\right| \leq 2 \mathcal{R}_m(\mathcal{F}) + \sqrt{\frac{\log(2/\delta)}{2m}}$$

其中$\mathcal{R}_m(\mathcal{F}) = \mathbb{E}_S[\widehat{\mathcal{R}}_S(\mathcal{F})]$是Rademacher复杂度。Rademacher复杂度给出了比VC维更精细的泛化界，因为它依赖于数据分布。

**定理 187.5**（Massart有限类引理）：对有限函数类$\mathcal{F}$，$\mathcal{R}_m(\mathcal{F}) \leq \sqrt{2 \log |\mathcal{F}| / m}$。

### 187.4 偏差-方差分解

**定义 187.5**（偏差-方差分解）：对平方损失，期望泛化误差分解为

$$\mathbb{E}[(h_S(x) - y)^2] = \underbrace{(\mathbb{E}[h_S(x)] - \mathbb{E}[y|x])^2}_{\text{偏差}^2} + \underbrace{\operatorname{Var}(h_S(x))}_{\text{方差}} + \underbrace{\operatorname{Var}(y|x)}_{\text{不可约误差}}$$

偏差-方差权衡是理解过拟合与欠拟合的核心数学框架。偏差度量学习算法对真实函数的系统性偏离，方差度量算法对训练样本随机波动的敏感度。

**定理 187.6**（双重下降现象，Belkin et al. 2019）：在过参数化模型中，测试误差随模型复杂度呈现"双重下降"：先下降（经典偏差-方差权衡），再上升（过拟合），然后再次下降（过参数化区域）。这一现象表明经典偏差-方差权衡在过参数化体制下需要修正，其数学根源在于插值估计量的隐式正则化性质。

---

---

---

---

---

## 第263章：神经网络逼近理论
神经网络逼近理论研究有限宽度和深度的神经网络作为函数逼近器的表达能力。从泛函分析的视角，核心问题是：由特定激活函数生成的函数空间在目标函数空间中的稠密性及逼近速率。

### 188.1 通用逼近定理

**定理 188.1**（Cybenko通用逼近定理，1989）：设$\sigma$是连续的非多项式激活函数。则单隐层神经网络$\sum_{i=1}^N a_i \sigma(w_i^\top x + b_i)$在$C([0,1]^d)$中稠密（在一致范数下）。

*证明思路*：使用泛函分析的Hahn-Banach定理和Radon测度。若闭包不是整个空间，则存在非零线性泛函在其中消失，由Riesz表示定理导出矛盾。∎

**定理 188.2**（Barron定理，1993）：具有Fourier表示的函数$f(x) = \int_{\mathbb{R}^d} e^{i\omega \cdot x} \tilde{f}(\omega) d\omega$，若$\int \|\omega\| |\tilde{f}(\omega)| d\omega \leq C$，则可用$N$个隐层神经元的网络以$O(N^{-1/2})$的速率逼近（在$L^2$范数下），与输入维数$d$无关。

**定义 188.1**（Barron空间）：**Barron空间**$\mathcal{B}$由满足$\|f\|_{\mathcal{B}} = \int_{\mathbb{R}^d} \|\omega\| |\tilde{f}(\omega)| d\omega < \infty$的函数组成。神经网络在Barron空间上具有$O(N^{-1/2})$的逼近速率，该速率与输入维数$d$无关——这是克服维数灾难的关键数学性质。

### 188.2 深度的优势

**定理 188.3**（深度分离定理，Telgarsky 2016, Eldan-Shamir 2016）：存在可由深度为$L$、宽度为多项式大小的ReLU网络表示的函数，但任何深度为$L-1$的网络需要指数级宽度才能达到相同的逼近精度。这从数学上证明了深层网络在表达能力上对浅层网络具有超多项式优势。

**定理 188.4**（Poggio等，2017）：深度ReLU网络可以指数级更高效地表示某些函数。具体地，函数$f(x_1, \ldots, x_d) = \prod_{i=1}^d x_i$可由深度$O(\log d)$的ReLU网络表示，但浅层网络需要指数级宽度。

**定理 188.5**（Yarotsky定理，2017）：深度$L$的ReLU网络逼近$C^s$函数的最优速率为$O(L^{-2s/d})$。深度网络通过组合性实现高效逼近——函数的层次化复合结构对应网络的逐层表示。

### 188.3 神经正切核

**定义 188.2**（神经正切核，Neural Tangent Kernel，Jacot et al. 2018）：考虑参数为$\theta$的神经网络$f(x; \theta)$。**神经正切核**定义为

$$\Theta(x, x') = \mathbb{E}_{\theta \sim \mathcal{N}(0, I)} \left[\nabla_\theta f(x; \theta)^\top \nabla_\theta f(x'; \theta)\right]$$

在无限宽度极限下，NTK在训练过程中保持不变——这是理解神经网络梯度下降动力学的核心数学工具。

**定理 188.6**（NTK极限下的梯度下降，Jacot et al. 2018）：在无限宽度极限下，梯度下降训练神经网络等价于关于NTK的核回归：

$$f_t(x) \approx \Theta(x, X)^\top \Theta(X, X)^{-1} (I - e^{-t \Theta(X, X)}) Y$$

其中$\Theta(X, X)_{ij} = \Theta(x_i, x_j)$。这给出了神经网络训练的精确解析描述，将非凸神经网络优化问题转化为线性核方法。

**定理 188.7**（NTK的谱性质）：NTK的特征值衰减速率决定了神经网络的学习速度。在均匀分布数据上，NTK的特征值随频率增加而衰减，因此梯度下降倾向于先学习低频函数——这一频谱偏差现象由NTK的Mercer特征分解自然导出。

---

---

---

---

---

## 第264章：深度学习的优化理论
深度学习中的优化问题定义在高维非凸参数空间上，但随机梯度下降在实践中表现出令人意外的收敛性质。本章从非凸优化的数学理论出发，讨论SGD的收敛性保证和损失景观的几何结构。

### 189.1 随机梯度下降的收敛理论

**定义 189.1**（随机梯度下降，SGD）：设$\ell(\theta) = \mathbb{E}_{z \sim \mathcal{D}}[\ell(\theta; z)]$是期望风险。SGD更新为

$$\theta_{t+1} = \theta_t - \eta_t \nabla_\theta \ell(\theta_t; z_t)$$

其中$z_t \sim \mathcal{D}$是随机采样的样本，$\eta_t$是步长。

**定理 189.1**（SGD的收敛性，凸情形）：若$\ell(\theta)$是凸函数且梯度有界，$\eta_t = 1/\sqrt{t}$，则

$$\mathbb{E}\left[\ell\left(\frac{1}{T}\sum_{t=1}^T \theta_t\right)\right] - \ell(\theta^*) \leq O\left(\frac{\log T}{\sqrt{T}}\right)$$

**定理 189.2**（SGD的收敛性，非凸情形）：若$\ell(\theta)$光滑（$L$-光滑），则SGD收敛到驻点：

$$\frac{1}{T} \sum_{t=1}^T \mathbb{E}[\|\nabla \ell(\theta_t)\|^2] \leq O\left(\frac{1}{\sqrt{T}}\right)$$

在非凸情形下，SGD保证梯度的平均范数趋于零，但收敛到的驻点可能是鞍点而非局部极小值。

### 189.2 损失景观的几何结构

**定义 189.2**（损失景观，Loss Landscape）：深度神经网络的损失函数$\ell(\theta)$在高维参数空间中的几何结构。关键数学特征包括鞍点的分布、局部极小值的质量、以及全局极小值的连通性。

**定理 189.3**（Choromanska等，2015的随机矩阵模型）：在大规模随机神经网络中，利用随机矩阵理论可以证明：损失景观的局部极小值集中在全局极小值附近，且高损失的局部极小值随网络规模增大以指数概率消失。

**定理 189.4**（Kawaguchi定理，2016）：深度线性网络（无激活函数）的每个局部极小值都是全局极小值。对于非线性网络，该性质在过参数化区域中近似成立——这一结果的证明依赖于对Hessian矩阵谱结构在过参数化极限下的分析。

**定理 189.5**（Freeman-Bruna定理，2017）：在过参数化条件下，深度ReLU网络的损失景观在全局极小值附近是连通的（mode connectivity），即任意两个全局极小值可以通过损失值不显著升高的路径相连。

### 189.3 隐式正则化的数学分析

**定义 189.3**（隐式正则化，Implicit Regularization）：SGD本身（无显式正则化）倾向于收敛到具有特定数学结构的解——这一现象的数学分析构成了隐式正则化理论。

**定理 189.6**（Soudry等，2018的隐式偏差）：在可分离数据的线性分类中，梯度下降（带指数尾损失）在极限下收敛到最大间隔分类器，等价于硬间隔SVM的解。这从数学上证明了梯度下降隐式地执行了$\ell_2$正则化。

**定理 189.7**（Gunasekar等，2017）：在矩阵分解问题中，梯度下降隐式地最小化核范数，从而倾向于低秩解。这一结论将梯度下降的隐式偏差与迹范数正则化建立了精确的数学联系。

**定理 189.8**（Arora等，2019）：在深度线性网络中，梯度下降隐式地倾向于低秩解，且收敛方向与初始化相关。对于深度矩阵分解，梯度下降在参数空间的轨迹可由特定的Riemannian梯度流近似。

---

---

---

---

---

## 第265章：最优传输理论
最优传输理论起源于Monge（1781）提出的土壤搬运问题，经Kantorovich（1942）赋予线性规划形式，如今已成为连接偏微分方程、概率论和几何的深刻数学理论。本章聚焦于Monge-Kantorovich问题、Brenier定理及其与Monge-Ampère方程的联系。

### 190.1 Monge问题与Kantorovich松弛

**定义 190.1**（Monge最优传输问题，1781）：给定概率测度$\mu, \nu$在$\mathbb{R}^d$上，**Monge问题**寻求代价最小的传输映射$T$：

$$\min_{T: T_\#\mu = \nu} \int_{\mathbb{R}^d} c(x, T(x)) d\mu(x)$$

其中$T_\#\mu = \nu$表示$T$将$\mu$推前（push-forward）为$\nu$。对二次代价$c(x,y) = \|x-y\|^2$，称为**二次最优传输问题**。

**定义 190.2**（Kantorovich松弛，1942）：Monge问题的Kantorovich松弛将确定性的传输映射推广为概率耦合：

$$\min_{\gamma \in \Pi(\mu, \nu)} \int_{\mathbb{R}^d \times \mathbb{R}^d} c(x, y) d\gamma(x, y)$$

其中$\Pi(\mu, \nu)$是所有边缘分布分别为$\mu$和$\nu$的联合分布（耦合）的集合。这是Monge问题的凸松弛——将非凸约束$T_\#\mu = \nu$替换为凸约束$\gamma \in \Pi(\mu, \nu)$。

**定理 190.1**（Kantorovich对偶定理）：Kantorovich问题具有以下对偶形式：

$$\min_{\gamma \in \Pi(\mu, \nu)} \int c(x,y) d\gamma = \sup_{\varphi, \psi} \left\{\int \varphi d\mu + \int \psi d\nu : \varphi(x) + \psi(y) \leq c(x,y)\right\}$$

对二次代价$c(x,y) = \|x-y\|^2$，对偶问题可化为：

$$W_2^2(\mu, \nu) = \sup_{\varphi \text{ convex}} \left\{\int \varphi^* d\nu - \int \varphi d\mu\right\}$$

其中$\varphi^*(y) = \sup_x \{\langle x, y \rangle - \varphi(x)\}$是$\varphi$的Legendre-Fenchel共轭。

### 190.2 Brenier定理与Monge-Ampère方程

**定理 190.2**（Brenier定理，1991）：设$\mu, \nu$是$\mathbb{R}^d$上的概率测度，$\mu$关于Lebesgue测度绝对连续，且其二阶矩有限。则对二次代价$c(x,y) = \|x-y\|^2$：

1. 存在唯一的（$\mu$-几乎处处）最优传输映射$T = \nabla\varphi$，其中$\varphi: \mathbb{R}^d \to \mathbb{R}$是凸函数（Brenier势）。
2. $T$是Monge问题和Kantorovich问题的共同最优解。
3. $\nabla\varphi$关于$\mu$几乎处处是单值的。

Brenier定理将最优传输问题归约为寻找凸函数$\varphi$的问题——$\varphi$满足**Monge-Ampère方程**（在适当的意义下）：

$$\det(D^2 \varphi(x)) = \frac{d\mu}{d\nu \circ \nabla\varphi}(x)$$

当$\mu$和$\nu$都有密度$f$和$g$时，若$\nabla\varphi$是$C^1$微分同胚，则形式上有：

$$\det(D^2 \varphi(x)) \cdot g(\nabla\varphi(x)) = f(x)$$

这是一类完全非线性椭圆型偏微分方程（Monge-Ampère型），其正则性理论（Caffarelli 1990-1996）是现代偏微分方程研究的重大成果。

### 190.3 Wasserstein距离的几何

**定义 190.3**（$p$-Wasserstein距离）：对$p \geq 1$，概率测度$\mu, \nu$之间的**$p$-Wasserstein距离**（地球移动距离）定义为

$$W_p(\mu, \nu) = \left(\min_{\gamma \in \Pi(\mu, \nu)} \int \|x - y\|^p d\gamma(x, y)\right)^{1/p}$$

Wasserstein距离在具有有限$p$阶矩的概率测度空间$\mathcal{P}_p(\mathbb{R}^d)$上定义了度量，使$(\mathcal{P}_p(\mathbb{R}^d), W_p)$成为测地空间——其测地线与经典的Riemannian几何测地线不同，由位移插值（McCann插值）给出。

**定理 190.3**（Kantorovich-Rubinstein对偶，$p=1$）：$W_1$距离具有以下对偶表示：

$$W_1(\mu, \nu) = \sup_{\|f\|_{\text{Lip}} \leq 1} \left\{\int f d\mu - \int f d\nu\right\}$$

这是Wasserstein-1距离的Kantorovich-Rubinstein对偶定理，将最优传输问题转化为在1-Lipschitz函数空间上的优化问题。

**定理 190.4**（Sinkhorn算法与熵正则化，Cuturi 2013）：加熵正则化的最优传输问题（Sinkhorn距离）：

$$W_\varepsilon(\mu, \nu) = \min_{\gamma \in \Pi(\mu, \nu)} \int \|x - y\|^2 d\gamma + \varepsilon \operatorname{KL}(\gamma \| \mu \otimes \nu)$$

可通过Sinkhorn迭代求解，复杂度$O(n^2)$，远优于精确最优传输的$O(n^3 \log n)$。熵正则化使问题在计算上可处理，同时保持了Wasserstein度量的核心几何性质。

---

---

---

---

---

## 第266章：序列决策的数学理论
马尔可夫决策过程为序列决策提供了公理化数学框架。本章建立MDP的Bellman方程体系，并讨论信息瓶颈原理——从信息论视角理解表示学习中的数据压缩与信息保留权衡。

### 191.1 马尔可夫决策过程与Bellman方程

**定义 191.1**（马尔可夫决策过程，MDP）：**MDP**由五元组$(\mathcal{S}, \mathcal{A}, P, R, \gamma)$定义：
- $\mathcal{S}$：状态空间（可测空间）
- $\mathcal{A}$：动作空间
- $P(s'|s, a)$：转移概率核
- $R(s, a)$：即时奖励函数
- $\gamma \in [0, 1)$：折扣因子

MDP是受控Markov过程的数学抽象：在每个时间步，决策者观察状态$s$，选择动作$a$，获得奖励$R(s,a)$，系统按$P(\cdot|s,a)$转移到新状态。

**定义 191.2**（价值函数与Q函数）：策略$\pi(a|s)$的**状态价值函数**和**动作价值函数**为

$$V^\pi(s) = \mathbb{E}_\pi\left[\sum_{t=0}^\infty \gamma^t R(s_t, a_t) \mid s_0 = s\right]$$

$$Q^\pi(s, a) = \mathbb{E}_\pi\left[\sum_{t=0}^\infty \gamma^t R(s_t, a_t) \mid s_0 = s, a_0 = a\right]$$

**定理 191.1**（Bellman期望方程）：$V^\pi$和$Q^\pi$满足以下不动点方程：

$$V^\pi(s) = \mathbb{E}_{a \sim \pi(\cdot|s)}[R(s, a) + \gamma \mathbb{E}_{s' \sim P}[V^\pi(s')]]$$

$$Q^\pi(s, a) = R(s, a) + \gamma \mathbb{E}_{s' \sim P}[\mathbb{E}_{a' \sim \pi}[Q^\pi(s', a')]]$$

Bellman方程表明价值函数是Bellman算子的唯一不动点，折扣因子$\gamma$保证了算子的压缩性（Banach不动点定理）。

**定理 191.2**（Bellman最优性方程）：最优价值函数$V^*(s) = \sup_\pi V^\pi(s)$满足

$$V^*(s) = \max_{a \in \mathcal{A}} \left[R(s, a) + \gamma \mathbb{E}_{s' \sim P}[V^*(s')]\right]$$

最优Bellman算子也是$\gamma$-压缩的（在一致范数下），因此$V^*$存在且唯一，相应的贪心策略即为最优策略。

### 191.2 策略梯度定理

**定义 191.3**（策略梯度定理，Sutton et al. 1999）：参数化策略$\pi_\theta$的性能$J(\theta) = \mathbb{E}_{s_0 \sim \rho}[V^{\pi_\theta}(s_0)]$的梯度为

$$\nabla_\theta J(\theta) = \mathbb{E}_{\pi_\theta}\left[\nabla_\theta \log \pi_\theta(a|s) \cdot Q^{\pi_\theta}(s, a)\right]$$

策略梯度定理将期望回报对策略参数的梯度表达为对数策略梯度的加权期望，其数学基础是测度变换下的Score Function恒等式：$\nabla_\theta \pi_\theta = \pi_\theta \nabla_\theta \log \pi_\theta$。

### 191.3 信息瓶颈原理

**定义 191.4**（信息瓶颈，Tishby et al. 1999）：**信息瓶颈原理**寻求输入随机变量$X$的压缩表示$T$，使$T$保留关于目标变量$Y$的最大信息：

$$\min_{p(t|x)} I(X; T) - \beta I(T; Y)$$

其中$I(\cdot; \cdot)$是互信息，$\beta \geq 0$控制压缩与保留的权衡。当$\beta \to \infty$时，$T$是$Y$的充分统计量；当$\beta \to 0$时，$T$是$X$的极小充分表示。

**定理 191.4**（信息瓶颈与表示学习，Tishby-Zaslavsky 2015）：深度神经网络的学习过程可被理解为信息瓶颈的迭代优化——隐层逐步压缩输入信息（减少$I(X; T)$），同时保留关于标签的信息（维持$I(T; Y)$）。这一信息论视角为深度网络的泛化能力提供了基于互信息的数学解释。

**定理 191.5**（互信息的Donsker-Varadhan表示，Belghazi et al. 2018）：互信息可通过以下变分表示来估计：

$$I(X; Z) = \sup_{f: \Omega \to \mathbb{R}} \mathbb{E}_{P_{XZ}}[f(x, z)] - \log \mathbb{E}_{P_X \otimes P_Z}[e^{f(x, z)}]$$

这是Donsker-Varadhan对KL散度的变分表示的直接推论，将互信息的估计转化为可微函数的优化问题。

---

*本卷从概率论、泛函分析和优化理论的统一视角，系统阐述了统计学习理论的核心数学结构：PAC可学性与VC维提供了学习的可能性边界（概率论与组合数学）；神经网络逼近理论揭示了有限参数网络的表达能力（泛函分析中的稠密性与逼近速率）；SGD收敛理论和损失景观分析解释了非凸优化的训练动力学；最优传输理论（Monge-Kantorovich-Brenier）建立了概率测度空间上的几何结构；MDP的Bellman方程体系为序列决策提供了不动点理论框架；信息瓶颈原理从信息论角度统一了表示学习的压缩-保留权衡。共5章。*

*本卷在初等统计（V6）和概率论 II（V20）的基础上，建立了数理统计的严格理论框架：估计理论（无偏性、相合性、Cramér-Rao 下界、MLE 的渐近最优性）为参数估计提供了理论基础；Neyman-Pearson 引理和似然比检验为假设检验提供了最优性准则；置信区间与假设检验的对偶关系揭示了统计推断的统一结构；贝叶斯方法通过先验分布融合先验信息，后验分布的渐近正态性（Bernstein-von Mises 定理）保证了与频率学派方法的一致性；线性模型（Gauss-Markov 定理、ANOVA）是应用最广泛的统计工具；多元分析（PCA、LDA）是处理高维数据的标准方法。**补充部分**将统计推断理论推广至机器学习：PAC学习理论建立了从有限样本到泛化误差的概率界限，VC维理论刻画了假设空间的复杂度，SGD收敛性分析为大规模优化提供了理论保证，Wasserstein距离统一了分布间的最优传输与生成模型，Markov决策过程的Bellman方程与策略梯度定理为强化学习提供了数学基础。*


*卷二十一：统计 II终。*


*卷二十一：统计 II终。*


*卷二十一：统计 II终。*


*卷二十四：统计学终。*
