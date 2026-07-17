# 卷二十：概率论 II

> 概率论 II 在初等概率论（V6 Ch 29）和实分析（V9 测度论）的基础上，建立概率论的测度论基础。本卷从 Kolmogorov 公理出发，精确定义概率空间、随机变量和期望，然后建立大数定律、中心极限定理、条件期望、鞅论和 Markov 链的严格理论。

---

## 第224章：测度论概率基础
Kolmogorov 在 1933 年将概率论建立在测度论之上，使概率论成为数学分析的一个分支。本章从概率空间出发，用测度论语言严格定义随机变量、分布、期望和独立性。

### 104.1 概率空间

**定义 104.1**（概率空间）：一个**概率空间** $(\Omega, \mathcal{F}, \mathbb{P})$ 由以下组成：
- $\Omega$：样本空间（所有可能结果的集合）
- $\mathcal{F}$：$\Omega$ 上的 $\sigma$-代数（事件域）
- $\mathbb{P}: \mathcal{F} \to [0, 1]$：概率测度，满足 $\mathbb{P}(\Omega) = 1$ 和可数可加性

**定义 104.2**（$\sigma$-代数）：$\Omega$ 的子集族 $\mathcal{F}$ 称为 $\sigma$**-代数**，如果：
1. $\Omega \in \mathcal{F}$
2. $A \in \mathcal{F} \Rightarrow A^c \in \mathcal{F}$（对补集封闭）
3. $A_1, A_2, \ldots \in \mathcal{F} \Rightarrow \bigcup_{n=1}^\infty A_n \in \mathcal{F}$（对可数并封闭）

**定义 104.3**（Borel $\sigma$-代数）：$\mathbb{R}$ 上的 **Borel $\sigma$-代数** $\mathcal{B}(\mathbb{R})$ 是包含所有开集的最小 $\sigma$-代数。$\mathcal{B}(\mathbb{R}^n)$ 类似定义。

**命题 104.1**（概率测度的基本性质）：
1. $\mathbb{P}(\varnothing) = 0$
2. 有限可加性：若 $A_1, \ldots, A_n$ 互不相交，则 $\mathbb{P}(\bigcup_{i=1}^n A_i) = \sum_{i=1}^n \mathbb{P}(A_i)$
3. 单调性：$A \subseteq B \Rightarrow \mathbb{P}(A) \leq \mathbb{P}(B)$
4. 连续性：$A_n \uparrow A$（单调解）$\Rightarrow \mathbb{P}(A_n) \uparrow \mathbb{P}(A)$；$A_n \downarrow A \Rightarrow \mathbb{P}(A_n) \downarrow \mathbb{P}(A)$
5. 次可加性：$\mathbb{P}(\bigcup_{n=1}^\infty A_n) \leq \sum_{n=1}^\infty \mathbb{P}(A_n)$

*证明*：直接由测度的一般性质（V9 Ch 65）推导。∎

### 104.2 随机变量与分布

**定义 104.4**（随机变量）：$(\Omega, \mathcal{F}, \mathbb{P})$ 上的**随机变量** $X$ 是可测函数 $X: \Omega \to \mathbb{R}$（即对每个 Borel 集 $B \in \mathcal{B}(\mathbb{R})$，$X^{-1}(B) \in \mathcal{F}$）。

$n$ 维**随机向量** $\mathbf{X} = (X_1, \ldots, X_n)$ 是可测函数 $\mathbf{X}: \Omega \to \mathbb{R}^n$。

**定义 104.5**（分布）：随机变量 $X$ 的**分布**（或**律**）$\mu_X$ 是 $\mathbb{R}$ 上的概率测度，定义为 $\mu_X(B) = \mathbb{P}(X \in B) = \mathbb{P}(X^{-1}(B))$。

**定义 104.6**（分布函数）：$X$ 的**累积分布函数**（CDF）为 $F_X(x) = \mathbb{P}(X \leq x) = \mu_X((-\infty, x])$。$F_X$ 是非降右连续函数，满足 $\lim_{x \to -\infty} F_X(x) = 0$，$\lim_{x \to \infty} F_X(x) = 1$。

**定义 104.7**（概率密度函数）：若存在非负可测函数 $f_X$ 使得 $\mu_X(B) = \int_B f_X(x) dx$，则 $f_X$ 称为 $X$ 的**概率密度函数**（PDF）。此时 $X$ 称为**绝对连续**的。

### 104.3 期望的测度论定义

**定义 104.8**（期望）：随机变量 $X$ 的**期望**（或**均值**）定义为 Lebesgue 积分：

$$\mathbb{E}[X] = \int_\Omega X(\omega) d\mathbb{P}(\omega)$$

若 $\mathbb{E}[|X|] < \infty$，则称 $X$ **可积**。

**命题 104.2**（期望的转化公式）：$\mathbb{E}[X] = \int_{\mathbb{R}} x \, d\mu_X(x)$。更一般地，对可测函数 $g$，$\mathbb{E}[g(X)] = \int_{\mathbb{R}} g(x) d\mu_X(x)$。若 $X$ 有密度 $f_X$，则 $\mathbb{E}[g(X)] = \int_{\mathbb{R}} g(x) f_X(x) dx$。

**定义 104.9**（方差与矩）：$X$ 的**方差** $\operatorname{Var}(X) = \mathbb{E}[(X - \mathbb{E}[X])^2] = \mathbb{E}[X^2] - (\mathbb{E}[X])^2$。$k$ 阶矩 $\mathbb{E}[X^k]$，$k$ 阶中心矩 $\mathbb{E}[(X - \mathbb{E}[X])^k]$。

**定理 104.3**（Jensen 不等式）：若 $\varphi$ 是凸函数且 $X$ 可积，则 $\varphi(\mathbb{E}[X]) \leq \mathbb{E}[\varphi(X)]$（假设 $\mathbb{E}[\varphi(X)]$ 存在）。

*证明*：凸函数 $\varphi$ 存在支撑线：$\varphi(x) \geq \varphi(x_0) + a(x - x_0)$。取 $x_0 = \mathbb{E}[X]$，两边求期望。∎

**定理 104.4**（Hölder 不等式）：$\mathbb{E}[|XY|] \leq (\mathbb{E}[|X|^p])^{1/p} (\mathbb{E}[|Y|^q])^{1/q}$，其中 $1/p + 1/q = 1$（$p, q > 1$）。

**推论 104.5**（Cauchy-Schwarz 不等式）：$\mathbb{E}[|XY|] \leq \sqrt{\mathbb{E}[X^2] \mathbb{E}[Y^2]}$（$p = q = 2$）。

### 104.4 独立性

**定义 104.10**（独立事件）：事件 $A_1, \ldots, A_n \in \mathcal{F}$ 称为**独立**的，如果对任意子集 $\{i_1, \ldots, i_k\}$，

$$\mathbb{P}(A_{i_1} \cap \cdots \cap A_{i_k}) = \mathbb{P}(A_{i_1}) \cdots \mathbb{P}(A_{i_k})$$

**定义 104.11**（独立 $\sigma$-代数）：$\sigma$-子代数 $\mathcal{G}_1, \ldots, \mathcal{G}_n \subseteq \mathcal{F}$ 称为**独立**的，如果对任意 $A_i \in \mathcal{G}_i$，$A_1, \ldots, A_n$ 独立。

**定义 104.12**（独立随机变量）：随机变量 $X_1, \ldots, X_n$ 称为**独立**的，如果它们生成的 $\sigma$-代数 $\sigma(X_1), \ldots, \sigma(X_n)$ 独立。等价地，$\mathbb{P}(X_1 \in B_1, \ldots, X_n \in B_n) = \prod_{i=1}^n \mathbb{P}(X_i \in B_i)$ 对所有 Borel 集 $B_i$ 成立。

**命题 104.6**：若 $X_1, \ldots, X_n$ 独立且可积，则 $\mathbb{E}[X_1 \cdots X_n] = \mathbb{E}[X_1] \cdots \mathbb{E}[X_n]$。若两两不相关（$\operatorname{Cov}(X_i, X_j) = 0$），则 $\operatorname{Var}(\sum X_i) = \sum \operatorname{Var}(X_i)$。

---

---

---

---

## 第225章：大数定律与中心极限定理
大数定律（LLN）和中心极限定理（CLT）是概率论的两大基石。LLN 表明样本均值收敛于期望，CLT 描述了围绕均值的波动行为。

### 105.1 大数定律

**定理 105.1**（弱大数定律，Khinchine）：设 $X_1, X_2, \ldots$ 是独立同分布（i.i.d.）且 $\mathbb{E}[|X_1|] < \infty$。令 $\mu = \mathbb{E}[X_1]$。则样本均值 $\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i$ 依概率收敛于 $\mu$：

$$\bar{X}_n \xrightarrow{\mathbb{P}} \mu \quad (n \to \infty)$$

*证明*：使用特征函数。$\varphi_{\bar{X}_n}(t) = \varphi_{X_1}(t/n)^n \to e^{i\mu t}$（由 $\varphi_{X_1}(t) = 1 + i\mu t + o(t)$）。由连续性定理，$\bar{X}_n \xrightarrow{d} \mu$（常数），故依概率收敛。∎

**定理 105.2**（强大数定律，Kolmogorov）：设 $X_1, X_2, \ldots$ 是 i.i.d. 且 $\mathbb{E}[|X_1|] < \infty$。则

$$\bar{X}_n \xrightarrow{\text{a.s.}} \mu \quad \text{几乎必然}$$

即 $\mathbb{P}(\lim_{n \to \infty} \bar{X}_n = \mu) = 1$。

*证明思路*（Kolmogorov 截断法）：(1) 不损失一般性，设 $\mu = 0$。对 $X_n$ 做截断：$Y_n = X_n \mathbf{1}_{\{|X_n| \leq n\}}$，$Z_n = X_n - Y_n$。由 $\mathbb{E}[|X_1|] < \infty$ 得 $\sum \mathbb{P}(|X_n| > n) = \sum \mathbb{P}(|X_1| > n) < \infty$，故 Borel-Cantelli 引理保证几乎必然仅有有限个 $n$ 满足 $Z_n \neq 0$，从而 $\frac{1}{n}\sum Z_k \to 0$ a.s.。只需证 $\frac{1}{n}\sum (Y_k - \mathbb{E}[Y_k]) \to 0$ a.s.。(2) 计算截断后的方差：$\operatorname{Var}(Y_k) \leq \mathbb{E}[Y_k^2] \leq k \mathbb{E}[|X_1| \mathbf{1}_{\{|X_1| \leq k\}}]$，可得 $\sum_{k=1}^\infty \frac{\operatorname{Var}(Y_k)}{k^2} < \infty$。(3) 由 Kolmogorov 不等式和 Kronecker 引理，$\frac{1}{n}\sum_{k=1}^n (Y_k - \mathbb{E}[Y_k]) \to 0$ a.s.。又 $\mathbb{E}[Y_k] = \mathbb{E}[X_1 \mathbf{1}_{\{|X_1| \leq k\}}] \to \mathbb{E}[X_1] = 0$（控制收敛定理），故其 Cesàro 均值也趋于 0。综合得 $\bar{X}_n \to 0$ a.s.。∎

**定理 105.3**（Kolmogorov 0-1 律）：设 $X_1, X_2, \ldots$ 独立。尾 $\sigma$-代数 $\mathcal{T} = \bigcap_{n=1}^\infty \sigma(X_n, X_{n+1}, \ldots)$ 中的每个事件概率为 $0$ 或 $1$。特别地，$\limsup \bar{X}_n$ 是常数（几乎必然）。

### 105.2 中心极限定理

**定理 105.4**（Lindeberg-Lévy 中心极限定理）：设 $X_1, X_2, \ldots$ 是 i.i.d.，$\mathbb{E}[X_1] = \mu$，$\operatorname{Var}(X_1) = \sigma^2 \in (0, \infty)$。则

$$\frac{\sqrt{n}(\bar{X}_n - \mu)}{\sigma} \xrightarrow{d} \mathcal{N}(0, 1) \quad (n \to \infty)$$

即标准化样本均值依分布收敛于标准正态分布。

*证明*：使用特征函数。$\varphi_{Z_n}(t) = \varphi_{X_1-\mu}\left(\frac{t}{\sigma\sqrt{n}}\right)^n$。由 Taylor 展开，$\varphi_{X_1-\mu}(s) = 1 - \frac{\sigma^2 s^2}{2} + o(s^2)$。故 $\varphi_{Z_n}(t) \to e^{-t^2/2}$，即 $\mathcal{N}(0, 1)$ 的特征函数。∎

**定理 105.5**（Lindeberg-Feller CLT，三角阵列）：设对每个 $n$，$X_{n,1}, \ldots, X_{n, k_n}$ 独立，$\mathbb{E}[X_{n,i}] = 0$，$\sum_{i=1}^{k_n} \operatorname{Var}(X_{n,i}) = 1$。若 **Lindeberg 条件**成立：

$$\lim_{n \to \infty} \sum_{i=1}^{k_n} \mathbb{E}[X_{n,i}^2 \mathbf{1}_{\{|X_{n,i}| > \varepsilon\}}] = 0 \quad (\forall \varepsilon > 0)$$

则 $\sum_{i=1}^{k_n} X_{n,i} \xrightarrow{d} \mathcal{N}(0, 1)$。Lindeberg 条件保证了没有单个变量主导和的行为。

**定理 105.6**（Berry-Esseen 界）：在上述 i.i.d. CLT 条件下，若 $\mathbb{E}[|X_1|^3] < \infty$，则

$$\sup_{x \in \mathbb{R}} \left| \mathbb{P}\left(\frac{\sqrt{n}(\bar{X}_n - \mu)}{\sigma} \leq x\right) - \Phi(x) \right| \leq \frac{C \mathbb{E}[|X_1 - \mu|^3]}{\sigma^3 \sqrt{n}}$$

其中 $\Phi$ 是标准正态分布函数，$C \leq 0.4748$（已知最优常数）。

### 105.3 特征函数

**定义 105.1**（特征函数）：随机变量 $X$ 的**特征函数**为 $\varphi_X(t) = \mathbb{E}[e^{itX}] = \int_{\mathbb{R}} e^{itx} d\mu_X(x)$。特征函数是 Fourier 变换（或 Fourier-Stieltjes 变换）。

**命题 105.7**（特征函数的性质）：
1. $|\varphi_X(t)| \leq 1$，$\varphi_X(0) = 1$
2. $\varphi_X$ 一致连续
3. $\varphi_{aX+b}(t) = e^{itb} \varphi_X(at)$
4. 若 $X, Y$ 独立，则 $\varphi_{X+Y}(t) = \varphi_X(t) \varphi_Y(t)$
5. 若 $\mathbb{E}[|X|^k] < \infty$，则 $\varphi_X^{(k)}(0) = i^k \mathbb{E}[X^k]$

**定理 105.8**（Lévy 连续性定理）：设 $X_n$ 是随机变量序列，$\varphi_n$ 是其特征函数。若 $\varphi_n(t) \to \varphi(t)$ 逐点，且 $\varphi$ 在 $0$ 连续，则 $\varphi$ 是某个随机变量的特征函数，且 $X_n \xrightarrow{d} X$（$\varphi_X = \varphi$）。

---

---

---

---

## 第226章：条件期望与鞅
条件期望是概率论中最重要的概念之一，它将 "已知部分信息下的平均" 精确化。鞅是 Doob 引入的强大工具，在随机过程、金融数学和统计推断中有广泛应用。

### 106.1 条件期望

**定义 106.1**（条件期望）：设 $X$ 是可积随机变量，$\mathcal{G} \subseteq \mathcal{F}$ 是子 $\sigma$-代数。$X$ 在 $\mathcal{G}$ 下的**条件期望** $\mathbb{E}[X \mid \mathcal{G}]$ 是唯一的 $\mathcal{G}$-可测随机变量 $Y$，满足

$$\int_A Y d\mathbb{P} = \int_A X d\mathbb{P} \quad \text{对所有 } A \in \mathcal{G}$$

（由 Radon-Nikodym 定理保证存在唯一性）。

**定义 106.2**（给定随机变量的条件期望）：$\mathbb{E}[X \mid Y] = \mathbb{E}[X \mid \sigma(Y)]$。存在 Borel 函数 $g$ 使得 $\mathbb{E}[X \mid Y] = g(Y)$，记 $g(y) = \mathbb{E}[X \mid Y = y]$。

**命题 106.1**（条件期望的基本性质）：
1. $\mathbb{E}[\mathbb{E}[X \mid \mathcal{G}]] = \mathbb{E}[X]$（全期望律）
2. 若 $X$ 是 $\mathcal{G}$-可测，则 $\mathbb{E}[X \mid \mathcal{G}] = X$
3. 若 $X$ 与 $\mathcal{G}$ 独立（即 $\sigma(X)$ 与 $\mathcal{G}$ 独立），则 $\mathbb{E}[X \mid \mathcal{G}] = \mathbb{E}[X]$
4. $\mathbb{E}[aX + bY \mid \mathcal{G}] = a \mathbb{E}[X \mid \mathcal{G}] + b \mathbb{E}[Y \mid \mathcal{G}]$（线性）
5. 若 $Z$ 是 $\mathcal{G}$-可测且有界，则 $\mathbb{E}[ZX \mid \mathcal{G}] = Z \mathbb{E}[X \mid \mathcal{G}]$
6. **塔性质**：$\mathbb{E}[\mathbb{E}[X \mid \mathcal{G}] \mid \mathcal{H}] = \mathbb{E}[X \mid \mathcal{H}]$（当 $\mathcal{H} \subseteq \mathcal{G}$）
7. 条件 Jensen 不等式：$\varphi(\mathbb{E}[X \mid \mathcal{G}]) \leq \mathbb{E}[\varphi(X) \mid \mathcal{G}]$（$\varphi$ 凸）

### 106.2 鞅的定义与基本性质

**定义 106.3**（滤过）：**滤过** $\{\mathcal{F}_n\}_{n \geq 0}$ 是 $\mathcal{F}$ 的递增子 $\sigma$-代数序列：$\mathcal{F}_0 \subseteq \mathcal{F}_1 \subseteq \cdots \subseteq \mathcal{F}$。$\mathcal{F}_n$ 表示时刻 $n$ 可用的信息。

**定义 106.4**（鞅）：随机过程 $\{M_n\}_{n \geq 0}$ 称为关于 $\{\mathcal{F}_n\}$ 的**鞅**（martingale），如果
1. $M_n$ 是 $\mathcal{F}_n$-可测（适应于滤过）
2. $\mathbb{E}[|M_n|] < \infty$（对所有 $n$）
3. $\mathbb{E}[M_{n+1} \mid \mathcal{F}_n] = M_n$（对所有 $n$）

若 $\mathbb{E}[M_{n+1} \mid \mathcal{F}_n] \geq M_n$（下鞅，submartingale）或 $\leq M_n$（上鞅，supermartingale），则称为**下鞅**或**上鞅**。

**例 106.1**（鞅的例子）：
- 独立零均值随机变量的部分和：$S_n = \sum_{i=1}^n X_i$（$\mathbb{E}[X_i] = 0$）
- 独立随机变量的乘积：$M_n = \prod_{i=1}^n X_i$（$\mathbb{E}[X_i] = 1$）
- 条件期望过程：$M_n = \mathbb{E}[X \mid \mathcal{F}_n]$（对固定 $X$）

### 106.3 鞅收敛定理

**定理 106.2**（Doob 上穿不等式）：设 $\{X_n\}$ 是下鞅。对 $a < b$，在 $n$ 步内 $X_n$ 从 $a$ 以下穿到 $b$ 以上的次数 $U_n(a, b)$ 满足

$$\mathbb{E}[U_n(a, b)] \leq \frac{\mathbb{E}[(X_n - a)^+]}{b - a}$$

**定理 106.3**（鞅收敛定理，Doob）：设 $\{M_n\}$ 是下鞅且 $\sup_n \mathbb{E}[|M_n|] < \infty$（或 $\sup_n \mathbb{E}[M_n^+] < \infty$）。则 $M_n$ 几乎必然收敛到某个可积随机变量 $M_\infty$。

*证明思路*：使用上穿不等式。若 $\{M_n\}$ 不收敛，则存在 $a < b$ 使得上穿次数无穷多。上穿不等式给出 $\mathbb{E}[U_n(a, b)] \leq (\mathbb{E}[M_n^+] + |a|)/(b - a)$ 有界，与无穷多次上穿矛盾。∎

**定理 106.4**（$L^p$ 鞅收敛定理）：若 $\{M_n\}$ 是鞅且 $\sup_n \mathbb{E}[|M_n|^p] < \infty$（$p > 1$），则 $M_n \to M_\infty$ 在 $L^p$ 中收敛。

### 106.4 可选停止定理

**定义 106.5**（停时）：随机变量 $\tau: \Omega \to \mathbb{N} \cup \{\infty\}$ 称为关于 $\{\mathcal{F}_n\}$ 的**停时**，如果 $\{\tau = n\} \in \mathcal{F}_n$（对所有 $n$）。即"是否停止"仅依赖于当前和过去的信息。

**定理 106.5**（可选停止定理，Doob）：设 $\{M_n\}$ 是鞅，$\tau$ 是停时。若以下条件之一成立：
1. $\tau$ 有界（$\tau \leq N$ 几乎必然）
2. $\{M_n\}$ 有界且 $\tau < \infty$ 几乎必然
3. $\mathbb{E}[\tau] < \infty$ 且 $|M_n - M_{n-1}| \leq C$（有界增量）

则 $\mathbb{E}[M_\tau] = \mathbb{E}[M_0]$。

*证明*：对情形 1，$M_{\tau \wedge N} = \sum_{n=0}^{N-1} M_n \mathbf{1}_{\{\tau = n\}} + M_N \mathbf{1}_{\{\tau \geq N\}}$ 是鞅，故 $\mathbb{E}[M_\tau] = \mathbb{E}[M_{\tau \wedge N}] = \mathbb{E}[M_0]$。∎

**定理 106.6**（Wald 等式）：设 $X_1, X_2, \ldots$ 是 i.i.d.，$\mathbb{E}[|X_1|] < \infty$，$\mu = \mathbb{E}[X_1]$。$\tau$ 是关于 $\{X_n\}$ 的停时，$\mathbb{E}[\tau] < \infty$。则 $\mathbb{E}[\sum_{i=1}^\tau X_i] = \mu \mathbb{E}[\tau]$。

---

---

---

---

## 第227章：Markov 链
Markov 链是"无记忆"的随机过程，其未来状态仅依赖于当前状态。本章讨论离散时间、可数状态空间的 Markov 链，包括转移概率、平稳分布和遍历定理。

### 107.1 Markov 链的定义

**定义 107.1**（Markov 链）：状态空间 $S$（可数集）上的随机过程 $\{X_n\}_{n \geq 0}$ 称为 **Markov 链**，如果满足 Markov 性：

$$\mathbb{P}(X_{n+1} = j \mid X_n = i, X_{n-1}, \ldots, X_0) = \mathbb{P}(X_{n+1} = j \mid X_n = i)$$

**定义 107.2**（时齐 Markov 链）：若 $\mathbb{P}(X_{n+1} = j \mid X_n = i) = p_{ij}$（与 $n$ 无关），则称链是**时齐**的。矩阵 $P = (p_{ij})_{i,j \in S}$ 称为**转移矩阵**（每行和为 $1$）。

**定义 107.3**（$n$ 步转移概率）：$p_{ij}^{(n)} = \mathbb{P}(X_n = j \mid X_0 = i) = (P^n)_{ij}$。由 Chapman-Kolmogorov 方程：$p_{ij}^{(n+m)} = \sum_{k \in S} p_{ik}^{(n)} p_{kj}^{(m)}$。

**命题 107.1**：Markov 链的分布由初始分布 $\pi_0$（$\pi_0(i) = \mathbb{P}(X_0 = i)$）和转移矩阵 $P$ 完全确定：$\pi_n = \pi_0 P^n$。

### 107.2 状态的分类

**定义 107.4**（可达与互通）：$j$ 从 $i$ **可达**（$i \to j$）如果存在 $n \geq 0$ 使得 $p_{ij}^{(n)} > 0$。$i$ 和 $j$ 互通（$i \leftrightarrow j$）如果 $i \to j$ 且 $j \to i$。互通是等价关系，等价类称为**互通类**。

**定义 107.5**（常返与瞬时）：状态 $i$ 称为**常返**的，如果 $\mathbb{P}(X_n = i \text{ 无穷多次} \mid X_0 = i) = 1$。否则称为**瞬时**的。

**定理 107.2**（常返性的判别）：$i$ 常返当且仅当 $\sum_{n=1}^\infty p_{ii}^{(n)} = \infty$。$i$ 瞬时当且仅当 $\sum_{n=1}^\infty p_{ii}^{(n)} < \infty$。

**定义 107.6**（正常返与零常返）：常返状态 $i$ 称为**正常返**的，如果 $\mathbb{E}[T_i \mid X_0 = i] < \infty$（$T_i = \inf\{n \geq 1 : X_n = i\}$ 是首次返回时间）。否则称为**零常返**。

**定义 107.7**（不可约）：Markov 链称为**不可约**的，如果所有状态互通（只有一个互通类）。

**定理 107.3**：对不可约 Markov 链，所有状态同时为瞬时、零常返或正常返（固态性）。

### 107.3 平稳分布

**定义 107.8**（平稳分布）：概率分布 $\pi = (\pi(i))_{i \in S}$ 称为**平稳分布**（或不变测度），如果 $\pi = \pi P$（即 $\pi(j) = \sum_{i \in S} \pi(i) p_{ij}$）。若 $\pi_0 = \pi$，则 $\pi_n = \pi$ 对所有 $n$。

**定理 107.4**（平稳分布的存在性）：不可约 Markov 链有平稳分布当且仅当它是正常返的。此时平稳分布唯一，且 $\pi(i) = 1 / \mathbb{E}[T_i \mid X_0 = i]$。

**定理 107.5**（Markov 链遍历定理）：设不可约正常返 Markov 链有平稳分布 $\pi$。则

$$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} \mathbf{1}_{\{X_k = j\}} = \pi(j) \quad \text{几乎必然}$$

即时间平均收敛于空间平均。若链是非周期的，则 $\lim_{n \to \infty} p_{ij}^{(n)} = \pi(j)$（分布收敛）。

**定义 107.9**（周期）：状态 $i$ 的**周期** $d(i) = \gcd\{n \geq 1 : p_{ii}^{(n)} > 0\}$。若 $d(i) = 1$，则 $i$ 非周期。不可约链中所有状态周期相同。

### 107.4 可逆性与细致平衡

**定义 107.10**（细致平衡）：概率分布 $\pi$ 满足**细致平衡条件**（detailed balance），如果 $\pi(i) p_{ij} = \pi(j) p_{ji}$（对所有 $i, j$）。此时 $\pi$ 是平稳分布，链称为**可逆**的。

**定理 107.6**（MCMC 的基本原理）：若目标分布 $\pi$ 难以直接抽样，可构造 Markov 链使其平稳分布为 $\pi$。Metropolis-Hastings 算法和 Gibbs 抽样是构造满足细致平衡的转移矩阵的标准方法。

---

---

---

---

## 第228章：Brown 运动与随机过程
Brown 运动（Wiener 过程）是最重要的连续时间随机过程，是随机分析的基础。本章给出 Brown 运动的构造、基本性质，并简要介绍连续时间鞅和 Itô 积分。

### 108.1 Brown 运动的定义与构造

**定义 108.1**（Brown 运动 / Wiener 过程）：随机过程 $\{B_t\}_{t \geq 0}$ 称为**标准 Brown 运动**（或 Wiener 过程），如果
1. $B_0 = 0$ 几乎必然
2. 独立增量：对 $0 \leq t_1 < t_2 < \cdots < t_n$，$B_{t_2} - B_{t_1}, \ldots, B_{t_n} - B_{t_{n-1}}$ 独立
3. 平稳增量：$B_t - B_s \sim \mathcal{N}(0, t - s)$（$0 \leq s < t$）
4. 样本路径 $t \mapsto B_t$ 几乎必然连续

**定理 108.1**（Brown 运动的存在性，Wiener 1923）：Brown 运动存在。可通过以下方式构造：
- 在 $C[0, \infty)$ 上定义 Wiener 测度（Kolmogorov 扩张定理）
- 或使用 Lévy-Ciesielski 构造（Schauder 基上的随机 Fourier 级数）

**命题 108.1**（Brown 运动的性质）：
1. 尺度不变性：$\{c^{-1/2} B_{ct}\}$ 也是 Brown 运动
2. 时间反演：$\{t B_{1/t}\}$（$t > 0$，$B_0 = 0$）是 Brown 运动
3. 反射原理：$\mathbb{P}(\max_{0 \leq s \leq t} B_s \geq a) = 2\mathbb{P}(B_t \geq a)$（$a > 0$）
4. 样本路径几乎必然无处可微（Paley-Wiener-Zygmund 定理）
5. 样本路径在 $[0, t]$ 上的变差无穷大（几乎必然），但二次变差为 $t$

### 108.2 Brown 运动的 Markov 性与强 Markov 性

**定理 108.2**（Markov 性）：Brown 运动是 Markov 过程：对 $s > 0$，$\{B_{t+s} - B_s\}_{t \geq 0}$ 是 Brown 运动且与 $\sigma(B_u, u \leq s)$ 独立。

**定理 108.3**（强 Markov 性）：设 $\tau$ 是关于 Brown 运动自然滤过的停时（$\tau < \infty$ 几乎必然）。则 $\{B_{\tau + t} - B_\tau\}_{t \geq 0}$ 是 Brown 运动且与 $\mathcal{F}_\tau$ 独立。

**定理 108.4**（Blumenthal 0-1 律）：设 $\mathcal{F}_{0^+} = \bigcap_{t > 0} \mathcal{F}_t$。则对 $A \in \mathcal{F}_{0^+}$，$\mathbb{P}(A) \in \{0, 1\}$。特别地，$\mathbb{P}(\sup_{[0, \varepsilon]} B_t > 0) = 1$（Brown 运动在原点附近立即取正值和负值）。

### 108.3 连续时间鞅

**定义 108.2**（连续时间鞅）：过程 $\{M_t\}_{t \geq 0}$ 关于滤过 $\{\mathcal{F}_t\}$ 是**鞅**，如果 $\mathbb{E}[|M_t|] < \infty$ 且 $\mathbb{E}[M_t \mid \mathcal{F}_s] = M_s$（$s < t$）。

**命题 108.2**（Brown 运动生成的鞅）：
1. $B_t$ 是鞅
2. $B_t^2 - t$ 是鞅
3. $\exp(\theta B_t - \theta^2 t/2)$ 是鞅（指数鞅）

**定理 108.5**（Doob 不等式，连续时间）：设 $\{M_t\}$ 是右连续下鞅。则

$$\mathbb{P}\left(\sup_{0 \leq s \leq t} |M_s| \geq \lambda\right) \leq \frac{\mathbb{E}[|M_t|]}{\lambda}$$

若 $M_t$ 是鞅且 $p > 1$，则 $\mathbb{E}[\sup_{0 \leq s \leq t} |M_s|^p] \leq \left(\frac{p}{p-1}\right)^p \mathbb{E}[|M_t|^p]$。

### 108.4 Itô 积分简介

**定义 108.3**（Itô 积分，启发式）：对适应过程 $H_s$，Itô 积分 $\int_0^t H_s dB_s$ 定义为

$$\int_0^t H_s dB_s = \lim_{\|\Pi\| \to 0} \sum_{i} H_{t_i} (B_{t_{i+1}} - B_{t_i})$$

（在 $L^2$ 意义下），其中被积函数在区间左端点取值（非预见性）。

**定理 108.6**（Itô 公式）：设 $f(t, x)$ 是 $C^{1,2}$ 函数。则

$$df(t, B_t) = \frac{\partial f}{\partial t}(t, B_t) dt + \frac{\partial f}{\partial x}(t, B_t) dB_t + \frac{1}{2} \frac{\partial^2 f}{\partial x^2}(t, B_t) dt$$

最后一项是 Itô 修正项，来源于 Brown 运动的非零二次变差。

**例 108.1**（Itô 公式的应用）：
- $f(x) = x^2$：$d(B_t^2) = 2B_t dB_t + dt$（几何 Brown 运动的基础）
- $f(x) = e^x$：$d(e^{B_t}) = e^{B_t} dB_t + \frac{1}{2} e^{B_t} dt$

---


---

---

---

---

## 第229章（补充）
> 统计力学的数学基础涵盖概率论、泛函分析和算子代数方法。本卷从 Gibbs 测度的概率论表述出发，讨论热力学极限下的测度非唯一性及其与奇点理论的联系，建立重整化群的抽象数学结构，研究精确可解模型的组合数学与代数方法，最后涉及非平衡态的概率描述。

> **卷序说明**：本章节号（Ch 282-216）反映其在全书逻辑链中的位置。本卷位于V53，作为概率论与数学物理方法的交叉专题卷。

---

---

---

---

## 第230章：Gibbs 测度、热力学极限与相变
本章建立 Gibbs 测度的概率论基础，讨论无穷体积极限下测度的收敛性与非唯一性，并给出 Ising 模型中测度非唯一性（相变）的 Peierls 组合论证。

### 213.1 Gibbs 测度与配分函数

**定义 213.1**（有限体积 Gibbs 测度）：设 $\Lambda \subset \mathbb{Z}^d$ 为有限区域，边界条件为 $\omega \in \Omega_{\Lambda^c}$。定义 $\Lambda$ 上的 Hamilton 量 $H_\Lambda^\omega(\sigma)$（$\sigma \in \Omega_\Lambda$）。给定参数 $\beta > 0$，**有限体积 Gibbs 测度**为 $\Omega_\Lambda$ 上的概率测度：
$$\mu_{\Lambda, \beta}^\omega(\sigma) = \frac{1}{Z_{\Lambda, \beta}^\omega} \exp(-\beta H_\Lambda^\omega(\sigma))$$
其中**配分函数**（partition function）为归一化常数
$$Z_{\Lambda, \beta}^\omega = \sum_{\sigma \in \Omega_\Lambda} \exp(-\beta H_\Lambda^\omega(\sigma))$$

**定义 213.2**（自由能泛函）：有限体积**自由能**定义为配分函数的对数生成函数：
$$F_{\Lambda, \beta}^\omega = -\frac{1}{\beta} \log Z_{\Lambda, \beta}^\omega$$

自由能关于参数 $\beta$ 的导数给出各阶累积量。

**定义 213.3**（无穷体积 Gibbs 测度 / DLR 方程，Dobrushin-Lanford-Ruelle 1968-1970）：无穷体积 **Gibbs 测度** $\mu_\beta$ 是 $\Omega = \Omega_{\mathbb{Z}^d}$ 上的概率测度，满足对任意有限区域 $\Lambda$，条件分布 $\mu_\beta(\cdot \mid \omega_{\Lambda^c})$ 由有限体积 Gibbs 测度给出（DLR 相容性条件）。Gibbs 测度的全体记为 $\mathcal{G}(\beta)$。

### 213.2 热力学极限

**定义 213.4**（热力学极限）：令 $\Lambda_n \uparrow \mathbb{Z}^d$（如 $\Lambda_n = [-n, n]^d \cap \mathbb{Z}^d$）。若自由能密度
$$f(\beta) = \lim_{n \to \infty} \frac{1}{|\Lambda_n|} F_{\Lambda_n, \beta}^\omega$$
存在且与边界条件 $\omega$ 的选取无关，则称 Gibbs 测度族具有良定义的**热力学极限**。$f(\beta)$ 为自由能密度。

**定理 213.1**（热力学极限的存在性 / Ruelle-Fisher 定理）：对具有有限程相互作用的平移不变格点系统，热力学极限存在。具体而言，对于有限程势 $\Phi$ 满足 $\sum_{X \ni 0} \|\Phi_X\|_\infty < \infty$，自由能密度 $f(\beta)$ 是良定义的连续函数。

### 213.3 Ising 模型与相变的 Peierls 论证

**定义 213.4**（Ising 模型）：$d$ 维**Ising 模型**是定义在格点 $\mathbb{Z}^d$ 上的随机过程，每个格点 $i$ 处变量 $\sigma_i \in \{-1, +1\}$。Hamilton 量为
$$H_\Lambda(\sigma) = -J \sum_{\langle i, j \rangle \cap \Lambda \neq \emptyset} \sigma_i \sigma_j - h \sum_{i \in \Lambda} \sigma_i$$
其中 $\langle i, j \rangle$ 表示最近邻对，$J, h \in \mathbb{R}$ 为耦合参数。

**定义 213.5**（相变——测度非唯一性）：称 Gibbs 测度族在 $\beta$ 处发生**相变**，若 $|\mathcal{G}(\beta)| \geq 2$（即无穷体积 Gibbs 测度不唯一）。由定义 213.3，测度非唯一性等价于 DLR 方程有多于一组的解。在热力学极限下，相变点对应于自由能密度 $f(\beta)$ 的非解析性（奇点）。

**定理 213.2**（Peierls 论证：Ising 模型的测度非唯一性，Peierls 1936，严格化 Griffiths 1964）：对 $d \geq 2$ 维零场（$h = 0$）Ising 模型，存在临界参数 $\beta_c(d) > 0$ 使得：
- $\beta > \beta_c$ 时，$|\mathcal{G}(\beta)| \geq 2$：存在至少两个不同的平移不变 Gibbs 测度 $\mu_\beta^+$ 和 $\mu_\beta^-$。
- $\beta < \beta_c$ 时，Gibbs 测度唯一：$|\mathcal{G}(\beta)| = 1$。

*Peierls 论证概要*：考虑正边界条件。对格点 $i$，若 $\sigma_i = -1$，其周围形成**Peierls 轮廓**（contour）——围绕 $-1$ 区域的闭合路径。每条轮廓 $\gamma$ 的权重为 $\exp(-2\beta J |\gamma|)$（$|\gamma|$ 为轮廓长度）。对轮廓的 Peierls 估计表明，当 $\beta J$ 充分大时，长轮廓的概率被指数压制，$-1$ 变量不能渗透整个系统。零场下 $+$ 和 $-$ 边界条件给出不同 Gibbs 测度，测度非唯一性得证。

**推论 213.1**（$d=1$ 唯一性）：一维 Ising 模型中 Peierls 论证失效（轮廓为单个点）。对 $d=1$，任意 $\beta > 0$ 下 $|\mathcal{G}(\beta)| = 1$。

**评注 213.1**：Peierls 论证的核心在于利用几何-组合方法（轮廓展开）将测度非唯一性问题转化为轮廓系统的低密度展开。这一方法后来发展为 **Pirogov-Sinai 理论**（1975-1976），系统研究了低温相图的普适结构。

---

---

---

---

## 第231章：重整化群的数学结构
重整化群（RG）是 Wilson（1971）引入的用于分析多尺度系统的数学框架，其核心是 Hamilton 量参数空间上的半群作用及不动点的谱分析。

### 214.1 重整化群变换

**定义 214.1**（重整化群变换 / Kadanoff 块自旋变换）：**重整化群变换** $\mathcal{R}$ 是作用在 Hamilton 量参数空间上的变换，将 Hamilton 量 $H$ 映射到粗粒化后的有效 Hamilton 量 $H' = \mathcal{R}(H)$：

1. 将格点系统分组为 $b^d$ 个变量组成的块
2. 每个块以块变量代替
3. 对短程涨落取条件期望，得到块变量的有效 Hamilton 量

在参数空间中，$\mathcal{R}$ 构成半群（一般不可逆）。

**定义 214.2**（RG 不动点与临界曲面）：参数空间中的**不动点** $H^*$ 满足 $\mathcal{R}(H^*) = H^*$。临界曲面是流向不动点的 Hamilton 量集合。不动点的稳定性由 Fréchet 导数 $D\mathcal{R}(H^*)$ 的谱决定。

**定理 214.1**（RG 不动点的谱分类）：
- **无关方向**（特征值 $|\lambda| < 1$）：流向不动点
- **相关方向**（特征值 $|\lambda| > 1$）：流离不动点
- 相关方向的个数决定了独立临界指数的个数

**定理 214.2**（RG 与临界指数）：若相关方向的本征值为 $\lambda_t = b^{y_t}$，$\lambda_h = b^{y_h}$，则临界指数为

$$\nu = \frac{1}{y_t}, \quad \eta = d + 2 - 2y_h, \quad \alpha = 2 - \frac{d}{y_t}, \quad \beta = \frac{d - y_h}{y_t}, \quad \gamma = \frac{2y_h - d}{y_t}$$

### 214.2 $\varepsilon$-展开

**定理 214.3**（Wilson-Fisher 不动点与 $\varepsilon$-展开，Wilson 1972）：在 $d = 4 - \varepsilon$ 维（$\varepsilon \ll 1$）的 $\phi^4$ 场论中，RG 不动点在 $\varepsilon$ 阶处存在（Wilson-Fisher 不动点）。临界指数可展开为 $\varepsilon$ 的渐近级数：

$$\eta = \frac{\varepsilon^2}{54} + O(\varepsilon^3), \quad \nu = \frac{1}{2} + \frac{\varepsilon}{12} + \frac{7\varepsilon^2}{162} + O(\varepsilon^3)$$

**定理 214.4**（上临界维数）：$d_c = 4$ 是 Ising 普适类的**上临界维数**。$d \geq 4$ 时，Gauss 不动点稳定，平均场临界指数精确。$d < 4$ 时，系统流向 Wilson-Fisher 不动点。

### 214.3 共形场论与临界现象

**定理 214.5**（Polyakov 共形不变性假说，1970）：在临界点，系统具有尺度不变性及更丰富的共形对称性。$d=2$ 维的临界系统由**共形场论**（CFT）描述。

**定理 214.6**（BPZ 分类定理，Belavin-Polyakov-Zamolodchikov 1984）：$d=2$ 维共形场论由 Virasoro 代数（中心荷 $c$）的酉表示完全分类。$c < 1$ 的酉极小模型有离散系列：

$$c = 1 - \frac{6}{m(m+1)} \quad (m = 3, 4, 5, \ldots)$$

Ising 模型对应 $m = 3$（$c = 1/2$），三临界 Ising 对应 $m = 4$（$c = 7/10$）。

---

---

---

---

## 第232章：精确可解模型
精确可解模型提供了临界现象的非微扰数学理解。二维 Ising 模型的 Onsager 解是组合数学与算子代数的经典应用。

### 215.1 二维 Ising 模型的 Onsager 解

**定理 215.1**（Onsager 精确解，1944）：$d=2$ 维零场 Ising 模型的自由能密度为

$$-\beta f = \log 2 + \frac{1}{2\pi^2} \int_0^\pi \int_0^\pi \log[\cosh(2\beta J_x) \cosh(2\beta J_y) - \sinh(2\beta J_x) \cos \omega_1 - \sinh(2\beta J_y) \cos \omega_2] \, d\omega_1 d\omega_2$$

（在各向同性情形 $J_x = J_y = J$ 下）。

**定理 215.2**（临界点与对数奇异性）：临界耦合由方程 $\sinh(2\beta_c J) = 1$ 确定。自由能在 $\beta_c$ 处有对数奇异性：

$$C \sim -\log|\beta - \beta_c| \quad (\beta \to \beta_c)$$

即 $\alpha = 0$（对数发散）。

**定理 215.3**（自发磁化，杨振宁 1952）：$\beta > \beta_c$ 时，二维 Ising 模型的自发磁化为

$$m^* = (1 - \sinh^{-4}(2\beta J))^{1/8}$$

临界指数 $\beta = 1/8$。$\beta \to \beta_c^+$ 时 $m^* \sim (\beta - \beta_c)^{1/8}$。

**方法概要**：Onsager 使用转移矩阵方法将配分函数化为 $2^N \times 2^N$ 矩阵的迹，通过 Clifford 代数的表示论将问题转化为自由费米子问题，使用 Jordan-Wigner 变换和 Bogoliubov 变换对角化。其数学核心是 Clifford 代数的表示论与 Toeplitz 行列式的渐近分析（Szegő 极限定理）。

### 215.2 Bethe 拟设

**定义 215.1**（Bethe 拟设，Bethe 1931）：**Bethe 拟设**是求解一维量子多体系统的方法。一维 Heisenberg 自旋链（XXX 模型，$J_x = J_y = J_z$）的 Hamilton 量为

$$H = -J \sum_{i=1}^N (\sigma_i^x \sigma_{i+1}^x + \sigma_i^y \sigma_{i+1}^y + \sigma_i^z \sigma_{i+1}^z)$$

**定理 215.4**（Bethe 拟设解，Bethe 1931）：一维 Heisenberg 反铁磁链的基态可通过 Bethe 拟设严格求解。$N$ 个位点的 Bethe 波函数为

$$\psi(x_1, \ldots, x_M) = \sum_{P \in S_M} A_P e^{i \sum_{j=1}^M k_{P_j} x_j}$$

其中波数 $k_j$ 满足**Bethe 拟设方程**：

$$e^{i k_j N} = \prod_{\ell \neq j}^M \frac{\sin(k_j - k_\ell + 2i\eta)}{\sin(k_j - k_\ell - 2i\eta)}$$

**定理 215.5**（Yang-Baxter 方程，杨振宁 1967, Baxter 1972）：Bethe 拟设可解性的代数本质是 Yang-Baxter 方程：

$$R_{12}(u) R_{13}(u+v) R_{23}(v) = R_{23}(v) R_{13}(u+v) R_{12}(u)$$

其中 $R_{ij} \in \text{End}(V_i \otimes V_j)$。Yang-Baxter 方程是可积性的核心代数条件，与量子群和辫子群表示论有深刻联系。

### 215.3 六顶角模型与八顶角模型

**定义 215.2**（六顶角模型）：**六顶角模型**（6-vertex model）是二维格点上每顶点有 6 种允许配置的格点模型。配分函数可通过 Bethe 拟设求解。

**定理 215.6**（Lieb 解，1967）：六顶角模型的自由能和极化率由 Lieb 使用 Bethe 拟设方法精确求解。

**定理 215.7**（Baxter 八顶角模型解，1972）：八顶角模型（8-vertex model）是带有对角相互作用的最一般二维可解格点模型。Baxter 使用 Yang-Baxter 方程和转移矩阵的交换性，给出了自由能的参数化精确解。

---

---

---

---

## 第233章：非平衡态的概率描述
非平衡态的概率描述研究 Markov 过程、随机微分方程与涨落关系的数学结构。

### 216.1 Boltzmann 方程与 H 定理

**定义 216.1**（Boltzmann 方程，1872）：定义在相空间上的分布函数 $f(x, v, t)$ 满足

$$\frac{\partial f}{\partial t} + v \cdot \nabla_x f = \left(\frac{\partial f}{\partial t}\right)_{\text{coll}}$$

其中碰撞项为

$$\left(\frac{\partial f}{\partial t}\right)_{\text{coll}} = \int_{\mathbb{R}^3} \int_{S^2} [f(v') f(v_*') - f(v) f(v_*)] B(v - v_*, \omega) \, d\omega \, dv_*$$

（Boltzmann 碰撞算子）。$B$ 是碰撞核，由二体相互作用势决定。

**定理 216.1**（Boltzmann H 定理，1872）：定义**H 泛函** $H(t) = \int f(x, v, t) \log f(x, v, t) \, dx \, dv$。则 $dH/dt \leq 0$，且 $dH/dt = 0$ 当且仅当 $f$ 是局部 Maxwell 分布：

$$f_{\text{eq}}(v) = \frac{n}{(2\pi \theta)^{3/2}} \exp\left(-\frac{|v - u|^2}{2\theta}\right)$$

其中 $n, u, \theta$ 为分布参数。

**定理 216.2**（Cercignani 猜想 / 收敛速率，Desvillettes-Villani 2005）：对 Maxwell 分子（$B$ 仅依赖于散射角），Boltzmann 方程的解以指数速率收敛到 Maxwell 分布：$H(t) - H_{\text{eq}} \leq C e^{-t/\tau}$。

### 216.2 涨落耗散定理

**定理 216.3**（涨落耗散定理，Callen-Welton 1951, Kubo 1957）：线性响应函数 $\chi(t)$ 与平衡涨落的关系：

$$\chi(t) = -\beta \frac{d}{dt} \langle A(t) A(0) \rangle_{\text{eq}} \quad (t > 0)$$

其中 $\langle A(t) A(0) \rangle$ 是可观测量 $A$ 的平衡时间关联函数，$\beta > 0$ 为模型参数。

**定理 216.4**（Green-Kubo 公式，1954, 1957）：输运系数由平衡关联函数的时间积分给出：

$$D = \frac{1}{d} \int_0^\infty \langle v(t) \cdot v(0) \rangle_{\text{eq}} \, dt$$

**定理 216.5**（Onsager 倒易关系，1931）：输运系数矩阵 $L_{ij}$ 对称：$L_{ij} = L_{ji}$。这是微观动力学可逆性的宏观推论。

### 216.3 涨落定理

**定理 216.6**（涨落定理，Evans-Cohen-Morriss 1993, Gallavotti-Cohen 1995）：在非平衡稳态中，熵产生率 $\Sigma_t$ 满足

$$\frac{\mathbb{P}(\Sigma_t = A)}{\mathbb{P}(\Sigma_t = -A)} = e^{A t}$$

即正熵产生的概率指数地大于负熵产生的概率。

**定理 216.7**（Jarzynski 等式，1997）：对非平衡过程，功 $W$ 的分布满足

$$\langle e^{-\beta W} \rangle = e^{-\beta \Delta F}$$

其中 $\Delta F$ 是自由能差。该等式允许从非平衡观测中提取平衡态信息。

### 216.4 Fokker-Planck 方程与 Langevin 动力学

**定义 216.2**（Fokker-Planck 方程）：**Fokker-Planck 方程**（Smoluchowski 方程）描述扩散过程 $X_t$ 的概率密度 $p(x, t)$ 的演化：

$$\frac{\partial p}{\partial t} = -\frac{\partial}{\partial x}[\mu(x) p] + \frac{1}{2} \frac{\partial^2}{\partial x^2}[D(x) p]$$

其中 $\mu(x)$ 是漂移系数，$D(x)$ 是扩散系数。

**定理 216.8**（Fokker-Planck 与 Langevin 的等价性）：Langevin 方程 $dX_t = \mu(X_t) dt + \sigma(X_t) dW_t$ 的概率密度满足 Fokker-Planck 方程（$\mu$ 和 $D = \sigma^2$ 的对应关系由 Stratonovich 或 Itô 积分解释确定）。

**定理 216.9**（Kramers 逃逸问题，1940）：Fokker-Planck 方程中，粒子从势阱中逃逸的平均首次通过时间为

$$\tau \sim e^{\beta \Delta E}$$

其中 $\Delta E$ 是势垒高度。

---

*本卷建立了统计力学的核心数学框架：Gibbs 测度与 DLR 理论将平衡态问题放在严格的概率论基础上，相变表现为热力学极限下 Gibbs 测度的非唯一性；Ising 模型的 Peierls 论证利用组合几何方法严格证明了测度非唯一性；重整化群提供了多尺度系统的统一数学结构（参数空间上的半群作用、不动点的谱分析、$\varepsilon$-展开）；精确可解模型（Onsager 解的 Clifford 代数与 Toeplitz 行列式、Bethe 拟设与 Yang-Baxter 方程）给出了强关联系统的非微扰精确结果；非平衡态的概率描述（Boltzmann 方程、涨落耗散定理、涨落定理）将不可逆性纳入概率论框架。统计力学的数学结构是概率论、泛函分析和算子代数的重要交汇领域。*

---

---

---

---

---

## 第234章（补充）
> 随机矩阵理论（Random Matrix Theory / RMT）研究元素为随机变量的矩阵的谱性质（特征值分布）。它起源于 Wishart（1928）在多元统计中的工作和 Wigner（1955）在核物理中的应用，现已发展成连接数论（Riemann $\zeta$ 函数零点）、高维统计、机器学习、无线通信、量子混沌和自由概率论的统一数学框架。Wigner 半圆律是「随机矩阵的普遍性」的典范——大量随机矩阵的宏观特征值分布不依赖于微观分布细节。本卷在概率论 II（V21）、线性代数（V7）和泛函分析（V14）的基础上，建立 Wigner 半圆律、自由概率论、Tracy-Widom 分布和随机矩阵现代应用的理论体系。

---

---

---

---

## 第235章：Wigner 半圆律
Wigner 半圆律是随机矩阵理论的基本定理，断言一大类对称（或 Hermitian）随机矩阵的极限特征值分布为半圆形。

### 267.1 经典 Wigner 矩阵

**定义 267.1**（Wigner 矩阵）：**Wigner 矩阵** $H = (h_{ij})_{1 \leq i,j \leq N}$ 是 $N \times N$ 随机 Hermitian（或实对称）矩阵，满足：
- 对角线元素 $h_{ii}$ 是 i.i.d. 实随机变量（均值 $0$，方差 $\sigma^2$）
- 非对角线元素 $h_{ij}$（$i < j$）是 i.i.d. 复（或实）随机变量（均值 $0$，方差 $1/N$，独立于对角线元素）
- $h_{ji} = \overline{h_{ij}}$

**定义 267.2**（经验谱分布 / ESD）：矩阵 $H$ 的**经验谱分布**（Empirical Spectral Distribution）为经验测度
$$\mu_H = \frac{1}{N} \sum_{i=1}^N \delta_{\lambda_i}$$

其中 $\lambda_1 \leq \cdots \leq \lambda_N$ 是 $H$ 的特征值。

**定理 267.1**（Wigner 半圆律，1955-1958）：设 $H$ 是 Wigner 矩阵（矩阵元素方差适当缩放）。以概率 $1$（几乎必然），当 $N \to \infty$ 时，经验谱分布 $\mu_H$ 弱收敛到半圆律：
$$d\mu_{sc}(x) = \frac{1}{2\pi} \sqrt{4 - x^2} \, \mathbf{1}_{[-2, 2]}(x) \, dx$$

半圆律的 Stieltjes 变换为 $s(z) = \frac{-z + \sqrt{z^2 - 4}}{2}$（$z \in \mathbb{C}^+$），满足方程 $s(z) + \frac{1}{z + s(z)} = 0$。

*证明思路*（矩法）：对 $k$ 为偶数（奇次矩为零，由对称性），计算
$$\mathbb{E}\left[\frac{1}{N} \operatorname{Tr}(H^k)\right] = \frac{1}{N} \sum_{i_1, \ldots, i_k=1}^N \mathbb{E}[h_{i_1 i_2} h_{i_2 i_3} \cdots h_{i_k i_1}]$$
将期望展开，每个项对应一个闭合的指标序列 $(i_1, i_2, \ldots, i_k, i_1)$（可视作边标记图）。由于矩阵元素独立且均值为零，期望非零仅当每个 $h_{ij}$ 在乘积中出现偶数次——即指标序列中的每条边出现恰好两次，形成"配对"（pairing）。在 $N \to \infty$ 极限下，主导贡献来自不会产生交叉的**非交叉配对**（non-crossing / planar pairings）——因为交叉配对导致独立指标求和时每多一个交叉损失因子 $1/N$。$k$ 个顶点的非交叉配对数目恰由 Catalan 数 $C_{k/2} = \frac{1}{k/2+1}\binom{k}{k/2}$ 给出。因此
$$\lim_{N \to \infty} \mathbb{E}\left[\frac{1}{N} \operatorname{Tr}(H^k)\right] = \begin{cases} C_{k/2}, & k \text{ 为偶数} \\ 0, & k \text{ 为奇数} \end{cases}$$
Catalan 数正是半圆律矩序列。由矩方法（moment method），矩唯一确定紧支撑概率分布，方差估计进一步证明几乎必然收敛到半圆律。∎

**定理 267.2**（半圆律的普遍性 / Universality）：Wigner 半圆律对矩阵元素的分布不敏感——只要元素满足有限的矩条件（如四阶矩有限），极限谱分布就是半圆的。这是随机矩阵理论「普遍性」（universality）的第一个表现。

### 267.2 矩法与自由独立

**定义 267.3**（Catalan 数与半圆律的矩）：半圆律的 $2k$ 阶矩（奇阶矩为零）为**Catalan 数** $C_k$：
$$\int x^{2k} d\mu_{sc}(x) = C_k = \frac{1}{k+1} \binom{2k}{k}$$

$k=1$ 时 $C_1=1$，$k=2$ 时 $C_2=2$，$k=3$ 时 $C_3=5$。Catalan 数计数了「非交叉配对」的数量。

**定理 267.3**（矩法的核心估计）：在 Wigner 矩阵中，$\mathbb{E}[\operatorname{Tr}(H^k)]/N$ 的主导贡献来自矩阵指标序列的「非交叉配对」（non-crossing / planar pairings），交叉配对的贡献被 $1/N^2$ 压制。

### 267.3 Wishart 矩阵与 Marchenko-Pastur 律

**定义 267.4**（Wishart / 样本协方差矩阵）：$X$ 是 $p \times n$ 矩阵，元素为 i.i.d.（均值 $0$，方差 $1$）。**样本协方差矩阵**为 $S = \frac{1}{n} X X^T$（$p \times p$）。

**定理 267.4**（Marchenko-Pastur 律，1967）：设 $p, n \to \infty$ 且 $p/n \to \gamma \in (0, \infty)$。$S$ 的经验谱分布收敛到 **Marchenko-Pastur 分布**：
$$d\mu_{MP}(x) = \frac{\sqrt{(x - a_-)(a_+ - x)}}{2\pi \gamma x} \mathbf{1}_{[a_-, a_+]}(x) dx + (1 - \gamma^{-1})_+ \delta_0(dx)$$

其中 $a_\pm = (1 \pm \sqrt{\gamma})^2$。

---

---

---

---

## 第236章：自由概率论
自由概率论（Free Probability Theory）由 Voiculescu（1985-1990）创立，为随机矩阵提供了独立的非交换概率框架。

### 268.1 非交换概率空间

**定义 268.1**（非交换概率空间 / $C^*$-概率空间）：非交换概率空间是 $(\mathcal{A}, \tau)$，其中 $\mathcal{A}$ 是单位 $C^*$-代数，$\tau: \mathcal{A} \to \mathbb{C}$ 是单位保迹的线性泛函，满足 $\tau(1) = 1$ 且 $\tau(a^*a) \geq 0$（正性）。

**定义 268.2**（自由独立 / Free Independence）：$\mathcal{A}$ 的子代数族 $\{\mathcal{A}_i\}_{i \in I}$ 是**自由独立的**，如果对任意满足 $\tau(a_k) = 0$ 的非交换多项式 $a_1 \in \mathcal{A}_{i_1}, \ldots, a_k \in \mathcal{A}_{i_k}$（相邻指标不同 $i_1 \neq i_2 \neq \cdots \neq i_k$），有 $\tau(a_1 a_2 \cdots a_k) = 0$。

**定理 268.1**（自由独立 = 独立矩阵的极限行为，Voiculescu 1991）：若 $A_N$ 和 $B_N$ 是独立（经典意义上的独立）的 Wigner 矩阵序列，则它们在 $N \to \infty$ 极限下是自由独立的（在非交换概率空间中）。

### 268.2 自由卷积与 R-变换

**定义 268.3**（自由加法卷积 / Free Additive Convolution **$\boxplus$**）：若 $a, b$ 自由独立，其边缘分布的加法卷积 $\mu_a \boxplus \mu_b$ 定义为 $a+b$ 的分布。

**定义 268.4**（R-变换 / $R$-transform，Voiculescu 1986）：对概率测度 $\mu$，定义其 Cauchy 变换 $G_\mu(z) = \int \frac{d\mu(x)}{z - x}$（$z \in \mathbb{C}^+$）。$K_\mu(z) = G_\mu^{-1}(z)$（函数逆）。**R-变换**为
$$R_\mu(z) = K_\mu(z) - \frac{1}{z}$$

**定理 268.2**（R-变换的线性化性质）：若 $\mu = \mu_1 \boxplus \mu_2$，则
$$R_\mu(z) = R_{\mu_1}(z) + R_{\mu_2}(z)$$

即**自由卷积对应 R-变换的加法**——这是自由概率论的核心结果，类比经典卷积对应特征函数的乘积。对数 Fourier 变换的角色在此被 R-变换取代。

**例 268.1**（半圆律的 R-变换）：半圆律 $R(z) = z$。因此 $n$ 个自由独立的半圆律的 $\boxplus$ 卷积仍为半圆律（方差放大 $n$ 倍）——这解释了为什么 i.i.d. Wigner 矩阵之和的特征值分布可解析计算。

### 268.3 自由乘法卷积与 S-变换

**定义 268.5**（自由乘法卷积 / Free Multiplicative Convolution **$\boxtimes$**）：对正算子 $a, b$ 自由独立，$\mu_a \boxtimes \mu_b$ 定义为 $a^{1/2} b a^{1/2}$（或等价的 $ab$）的分布。

**定义 268.6**（S-变换 / S-transform）：对具有非零均值的正测度 $\mu$，$S_\mu(z)$ 满足 $\chi_\mu(z S_\mu(z)) = z$，其中 $\chi_\mu$ 是矩母函数的相关函数。自由乘法卷积对应 S-变换的乘法：$S_{\mu_1 \boxtimes \mu_2}(z) = S_{\mu_1}(z) S_{\mu_2}(z)$。

### 268.4 自由熵与自由 Fisher 信息

**定义 268.7**（自由熵 / Free Entropy，Voiculescu 1993-1998）：非交换随机变量 $X$ 的**自由熵** $\chi(X)$ 类比于经典 Shannon 微分熵，定义为近似矩阵模型的「微观态计数」的大偏差极限。自由熵满足自由信息论中的最大化原理：自由半圆变量最大化自由熵（给定方差约束）。

---

---

---

---

## 第237章：Tracy-Widom 分布与边缘统计
Tracy-Widom 分布是最大的随机矩阵特征值在适当尺度缩放下的极限分布，是随机矩阵理论中最重要的「新分布」之一。

### 269.1 Gaussian 系综

**定义 269.1**（Gaussian 系综 / GOE、GUE、GSE）：
- **GOE**（Gaussian Orthogonal Ensemble）：实对称矩阵 $H = H^T$，$h_{ii} \sim \mathcal{N}(0, 2)$，$h_{ij} \sim \mathcal{N}(0, 1)$（$i < j$）
- **GUE**（Gaussian Unitary Ensemble）：复 Hermitian 矩阵 $H = H^\dagger$，$\Re h_{ij}, \Im h_{ij} \sim \mathcal{N}(0, 1/2)$
- **GSE**（Gaussian Symplectic Ensemble）：描述自旋-轨道耦合系统

**定理 269.1**（GUE 的联合特征值分布）：GUE 矩阵的特征值联合概率密度为

$$p(\lambda_1, \ldots, \lambda_N) = \frac{1}{Z_N} \prod_{i < j} |\lambda_i - \lambda_j|^2 \prod_{i=1}^N e^{-\lambda_i^2 / 2}$$

其中 $|\lambda_i - \lambda_j|^2$ 是 Vandermonde 行列式的平方——表示特征值之间存在「排斥」效应（level repulsion）。

### 269.2 最大特征值与 Tracy-Widom 分布

**定理 269.2**（Tracy-Widom 分布，1994-1996）：设 $\lambda_{\max}$ 是 GUE（或 GOE/GSE）矩阵的最大特征值。经过适当缩放（中心化和标准化）后：

$$\frac{\lambda_{\max} - 2\sqrt{N}}{N^{-1/6}} \xrightarrow{d} F_\beta$$

其中 $F_\beta$ 是**Tracy-Widom 分布**（$\beta = 1$ 为 GOE，$\beta = 2$ 为 GUE，$\beta = 4$ 为 GSE）。$F_2$ 由 Painlevé II 方程的解定义：
$$F_2(s) = \exp\left( -\int_s^\infty (x - s) q^2(x) dx \right)$$

其中 $q(x)$ 满足 $\ddot{q} = x q + 2 q^3$（Painlevé II），边界条件 $q(x) \sim \operatorname{Ai}(x)$（$x \to \infty$）。

**定理 269.3**（Tracy-Widom 的普遍性）：最大特征值的 Tracy-Widom 极限对矩阵元素分布不敏感——只要元素的四阶矩是有限的（Soshnikov 1999，Erdos-Yau 等人的工作）。这是随机矩阵边缘普遍性（edge universality）的最重要结果。

### 269.3 Tracy-Widom 的惊人出现

Tracy-Widom 分布在随机矩阵理论之外也出现：
- 最长递增子序列的长度分布（Baik-Deift-Johansson 1999）：Ulam 问题的解
- KPZ 普适类（Kardar-Parisi-Zhang）：$(1+1)$ 维随机生长界面的涨落
- ASEP（非对称简单排它过程）中的涨落（Tracy-Widom 2007-2009）
- 二维渗流和随机三角剖分的极限界面形状

---

---

---

---

## 第238章：随机矩阵与自由概率的应用
随机矩阵理论在多个学科中有深刻应用——从数论到机器学习。

### 270.1 数论与 Riemann $\zeta$ 函数

**定理 270.1**（Montgomery 的 pair correlation 猜想，1973 / Odlyzko 数值验证 1987）：Riemann $\zeta$ 函数非平凡零点的配对相关函数（pair correlation function）与 GUE 随机矩阵特征值的配对相关函数一致：
$$R_2(\beta, x) = 1 - \left( \frac{\sin(\pi x)}{\pi x} \right)^2$$

这是 Hilbert-Pólya 猜想的证据——Riemann $\zeta$ 函数的零点可能是某个 Hermitian 算子的特征值。

**猜想 270.2**（Keating-Snaith 猜想，2000）：$L$-函数的矩与随机矩阵特征多项式的矩在 $T \to \infty$ 下一致，预测了 Riemann $\zeta$ 函数在临界线上 $\log|\zeta(1/2 + it)|$ 的高斯分布性质。

### 270.2 无线通信与高维统计

**定义 270.1**（MIMO 系统的信道容量，Telatar 1999 / Foschini 1996）：在 $n_t$ 发射天线、$n_r$ 接收天线的 MIMO 信道 $Y = H X + N$ 中（$H$ 为信道矩阵），当 $H$ 的元素为 i.i.d. Gauss，信道的遍历容量为
$$C = \mathbb{E}_H [\log \det(I + \rho H H^\dagger)]$$

其中 $\rho$ 是信噪比。Marchenko-Pastur 律给出了当 $n_t, n_r \to \infty$ 时信道容量近似。

**定义 270.2**（高维协方差估计 / 随机矩阵在统计中的应用）：对样本数 $n$ ≈ 维数 $p$ 的高维数据，Marchenko-Pastur 律描述了样本协方差矩阵特征值的分布偏差。这对主成分分析（PCA）的可靠性有直接影响——高维下的特征值估计不能用传统低维理论。

### 270.3 量子混沌与核物理

**定义 270.3**（Bohigas-Giannoni-Schmit 猜想，1984）：量子混沌系统的能级统计统计（nearest-neighbor spacing distribution）遵循适当对称类（GOE/GUE/GSE）的随机矩阵特征值间距分布（Wigner 猜忌 / Wigner surmise）：
$$P_{\text{GUE}}(s) = \frac{32}{\pi^2} s^2 e^{-4s^2 / \pi}$$

（$s$ 为间距除以平均间距）。

### 270.4 自由概率在算子代数中的应用

**定理 270.3**（Voiculescu 的自由群因子同构问题，1990s）：使用自由概率论，Voiculescu 证明了自由群 von Neumann 代数 $L(\mathbb{F}_n)$ 与 $L(\mathbb{F}_m)$（$n \neq m$）的非同构性在自由熵框架下可被区分。这解决了 von Neumann 代数领域的一个重大未解问题。

---

---

---

---

## 第239章：随机矩阵的现代发展
随机矩阵理论近二十年的突破集中在普遍性定理的严格证明（Erdos-Schlein-Yau 等人）和机器学习中的应用。

### 271.1 普遍性定理的严格证明

**定义 271.1**（Dyson Brown 运动与局部平衡）：将 Wigner 矩阵 $H$ 的特征值 $\lambda_i(t)$ 视为时间演化的 Dyson Brown 运动（$\lambda_i$ 间对数排斥力 + 噪声）。关键：Dyson Brown 运动在短时间达到局部平衡（local equilibrium），使得特征值间距的短距离统计普遍。

**定理 271.1**（Erdos-Schlein-Yau 的 Wigner-Dyson-Mehta 普遍性，2010-2013）：对任何满足适当矩条件的广义 Wigner 矩阵，其特征值的**局部统计**（local statistics）——包括相邻间距分布和 $k$-点相关函数——与 GUE/GOE 的对应统计在极限下一致。即 Tracy-Widom 边缘分布和 Wigner-Dyson 体（bulk）统计具有普遍性。

**定理 271.2**（Dyson 猜想 / 边缘隙分布，2020s）：对于矩阵边缘的最大特征值，Tracy-Widom 分布是普遍的。对于次最大特征值的隙分布也有类似的普遍性结果。

### 271.2 随机矩阵与机器学习

**定义 271.2**（随机神经网络 / Random Matrix Theory of Deep Learning）：深度神经网络的权值矩阵（随机初始化）的特征值分布影响梯度传播和训练动力学。Gaussian 权值网络的 Hessian 矩阵和 Fisher 信息矩阵的谱可用随机矩阵理论分析（Pennington-Worah 2017，Pennington-Schoenholz-Ganguli 2017-2018）。

**定理 271.3**（双下降现象 / Double Descent，Belkin-Hsu-Ma-Mandal 2019 / 随机矩阵解释）：当模型参数数超过训练样本数时，测试误差出现双下降（插值阈值后再次下降）。随机矩阵理论解释了这一现象——过参数化后的最小范数解（伪逆）比恰好在插值阈值处的解具有更小的方差。

### 271.3 稀疏随机矩阵与稀疏 Wigner

**定义 271.3**（稀疏 Wigner 矩阵 / Erdős-Rényi 矩阵）：Wigner 矩阵的每个元素以概率 $p = d/N$ 非零（$d$ 为平均度）。当 $d \to \infty$ 但 $d/N \to 0$ 时，谱分布偏离半圆律，边缘出现离群特征值。

**定理 271.4**（稀疏 Wigner 谱的过渡）：稀疏 Wigner 矩阵的谱在 $d \gg 1$ 时接近半圆，在 $d$ 有限时呈现更尖锐的峰。存在从稀疏谱到稠密半圆谱的连续过渡。

---

---

---

---

## 第240章：圆律与Stieltjes变换方法
Wigner 半圆律刻画了对称（自伴）随机矩阵的谱极限。对于非 Hermitian 随机矩阵（元素独立，矩阵不对称），谱的极限分布完全不同——所有特征值在复平面上均匀分布在单位圆盘内。这就是**圆律**（Circular Law）。Stieltjes 变换方法是研究随机矩阵谱分布的严格解析框架。

### 272.1 非Hermitian矩阵与圆律

**定义 272.1**（i.i.d. 矩阵系综）：设 $X_N$ 是 $N \times N$ 复矩阵，所有元素 $x_{ij}$ 是 i.i.d. 复随机变量，满足 $\mathbb{E}[x_{ij}] = 0$，$\mathbb{E}[|x_{ij}|^2] = 1/N$。$X_N$ 的特征值 $\lambda_i \in \mathbb{C}$（复数，一般不对称）的经验谱分布是 $\mu_N = \frac{1}{N} \sum_{i=1}^N \delta_{\lambda_i}$。

**定理 272.1**（圆律，Girko 1984 / Bai 1997 / Tao-Vu 2010 完全证明）：对上述非 Hermitian i.i.d. 矩阵（方差 $1/N$），当 $N \to \infty$ 时，经验谱分布 $\mu_N$ 几乎必然弱收敛到复平面单位圆盘上的均匀分布：
$$d\mu_{\text{circ}}(z) = \frac{1}{\pi} \mathbf{1}_{|z| \leq 1} \, dx \, dy \quad (z = x + iy)$$

*历史与证明的演进*：Girko（1984）提出了圆律的 Hermitization 方法——将非 Hermitian 矩阵 $X_N$ 的研究转化为研究 Hermitian 矩阵 $\begin{pmatrix} 0 & X_N - zI \\ X_N^* - \bar{z}I & 0 \end{pmatrix}$ 的谱，但其证明存在漏洞。Bai（1997）在元素四阶矩有限条件下完成了严格证明。Tao-Vu（2010）用随机矩阵理论的普遍性方法将条件减弱到二阶矩有限，完成了圆律的"普遍性"证明（即不依赖元素分布细节）。

### 272.2 Stieltjes变换与Hermitization方法

**定义 272.2**（Stieltjes 变换）：对 $\mathbb{R}$ 上的概率测度 $\mu$，其 **Stieltjes 变换**（或称 Cauchy 变换）定义为
$$s_\mu(z) = \int_{\mathbb{R}} \frac{d\mu(x)}{x - z}, \quad z \in \mathbb{C}^+ = \{z : \Im z > 0\}$$

Stieltjes 变换是研究谱分布的基本解析工具，其关键性质如下。

**命题 272.1**（Stieltjes 变换的基本性质）：
1. $s_\mu(z)$ 在 $\mathbb{C}^+$ 上解析，且 $\Im s_\mu(z) \geq 0$（Nevanlinna 函数）
2. **反演公式**（Stieltjes-Perron）：$\mu$ 可经 $s_\mu$ 恢复：$\mu((a,b)) = \lim_{\epsilon \to 0^+} \frac{1}{\pi} \int_a^b \Im s_\mu(x + i\epsilon) \, dx$（$\mu$ 的密度是 $\frac{1}{\pi} \Im s_\mu(x + i0)$）
3. 设 $\mu_N$ 弱收敛到 $\mu$，当且仅当对所有 $z \in \mathbb{C}^+$，$s_{\mu_N}(z) \to s_\mu(z)$

**定理 272.2**（半圆律的 Stieltjes 变换推导）：对 Wigner 矩阵 $H_N$，谱分布 $\mu_N$ 的 Stieltjes 变换 $s_N(z) = \frac{1}{N} \operatorname{Tr}((H_N - zI)^{-1})$ 在 $N \to \infty$ 下满足自洽方程（self-consistent equation）：
$$s(z) = -\frac{1}{z + s(z)}$$
解得 $s(z) = \frac{-z + \sqrt{z^2 - 4}}{2}$（平方根分支取使 $\Im s(z) > 0$ 者），其反演给出半圆律密度。这比矩法更简洁——无需计算 Catalan 数。

### 272.3 自由概率论与Stieltjes变换

**定义 272.3**（Stieltjes 变换与 R-变换的关系）：$R_\mu(z) = K_\mu(z) - 1/z$，其中 $K_\mu$ 是 $G_\mu(z) = -s_\mu(z)$ 的泛函逆。R-变换在自由卷积下的线性性使 Stieltjes 变换成为计算独立随机矩阵之和（在自由独立极限下）的谱分布的基本工具。

**定理 272.3**（圆律的 Hermitization 证明概要）：对非 Hermitian $X_N$，定义 $2N \times 2N$ Hermitian 矩阵
$$H^z_N = \begin{pmatrix} 0 & X_N - zI_N \\ (X_N - zI_N)^* & 0 \end{pmatrix}$$
其 Stieltjes 变换满足与 $z$ 相关的矩阵方程。通过 Stieltjes 变换的偏微分方程，可以将 $\mu_N$ 的复对数势（logarithmic potential）与 $H^z_N$ 的 Stieltjes 变换联系起来。取极限 $N \to \infty$，对数势在单位圆盘内满足 Poisson 方程 $\Delta \Phi = -4$（圆盘外 $\Delta \Phi = 0$），由唯一性给出圆盘上的均匀分布（圆律）。

---

---

---

---

## 第241章：行列式点过程与$\beta$系综
随机矩阵的特征值构成具有排斥相互作用的经典粒子系统。**行列式点过程**（Determinantal Point Process, DPP）框架统一了经典 Gaussian 系综的相关函数结构，而 **$\beta$系综**（$\beta$-ensemble）推广到任意排斥强度——将随机矩阵从经典值 $\beta = 1, 2, 4$ 拓展为一般的逆温度参数。

### 273.1 行列式点过程

**定义 273.1**（行列式点过程）：$\mathbb{R}$ 上具有相关核 $K(x, y)$ 的**行列式点过程**是一个点过程（随机点集），其 $k$-点相关函数（joint intensity）为
$$\rho_k(x_1, \ldots, x_k) = \det[K(x_i, x_j)]_{1 \leq i,j \leq k}$$

**定理 273.1**（GUE 是行列式点过程）：GUE 矩阵的特征值构成一个行列式点过程，其相关核为
$$K_N(x, y) = \sum_{k=0}^{N-1} \varphi_k(x) \varphi_k(y)$$
其中 $\varphi_k(x) = \frac{1}{\sqrt{2^k k! \sqrt{\pi}}} H_k(x) e^{-x^2/2}$ 是归一化 Hermite 函数（$H_k$ 为 Hermite 多项式）。由 Christoffel-Darboux 公式：
$$K_N(x, y) = \sqrt{N} \frac{\varphi_N(x) \varphi_{N-1}(y) - \varphi_{N-1}(x) \varphi_N(y)}{x - y}$$

**推论 273.1**（间距分布与 Fredholm 行列式）：GUE 特征值在一个区间内没有点的概率（gap probability）为
$$\mathbb{P}(I \text{ 内无特征值}) = \det(I - K_N|_I)$$
其中 $\det(I - K_N|_I)$ 是 $L^2(I)$ 上积分算子 $K_N|_I$ 的 Fredholm 行列式。这是 Tracy-Widom 分布可通过 Painlevé II 表达的核心原因——Fredholm 行列式与完全可积系统有深刻的联系（Its-Izergin-Korepin-Slavnov 方法）。

**定理 273.2**（Sine 核普遍性，Gaudin-Mehta / Erdos-Yau 严格化）：GUE 特征值在体（bulk）极限下的局部相关核收敛到 **Sine 核**：
$$K_{\text{sine}}(x, y) = \frac{\sin(\pi(x - y))}{\pi(x - y)}$$
GUE 的体间距分布由 Sine 核的 Fredholm 行列式给出（Gaudin 分布）。

**定义 273.2**（Airy 核与 Tracy-Widom 的 Fredholm 行列式表示）：在谱的边缘（最大特征值附近），缩放后的相关核收敛到 **Airy 核**：
$$K_{\text{Airy}}(x, y) = \frac{\operatorname{Ai}(x) \operatorname{Ai}'(y) - \operatorname{Ai}'(x) \operatorname{Ai}(y)}{x - y}$$
Tracy-Widom 分布 $F_2(s)$ 由 Airy 核在 $(s, \infty)$ 上的 Fredholm 行列式给出：
$$F_2(s) = \det(I - K_{\text{Airy}}|_{(s, \infty)})$$

### 273.2 $\beta$系综与对数气体

**定义 273.3**（$\beta$系综 / 对数气体）：$\mathbb{R}$ 上 $N$ 个粒子的 **$\beta$系综**（$\beta$-ensemble）概率密度为
$$p(\lambda_1, \ldots, \lambda_N) = \frac{1}{Z_{N, \beta}} \prod_{i < j} |\lambda_i - \lambda_j|^\beta \prod_{i=1}^N e^{-N V(\lambda_i)}$$
其中 $V$ 是势函数（confining potential），$\beta > 0$ 是逆温度参数：
- $\beta = 1$：对应于实对称（GOE）特征值
- $\beta = 2$：对应于复 Hermitian（GUE）特征值
- $\beta = 4$：对应于辛（GSE）特征值
- $\beta$ 为一般值：不再对应具体矩阵系综，但作为对数相互作用的粒子系统仍具有良好的数学结构

**定理 273.3**（$\beta$系综的宏观极限分布，Ben Arous-Guionnet 1997 / 大偏差理论）：$\beta$系综的经验测度 $\mu_N = \frac{1}{N} \sum \delta_{\lambda_i}$ 在 $N \to \infty$ 下几乎必然收敛到势 $V$ 决定的平衡测度 $\mu_V$（极小化能量泛函 $\mathcal{E}(\mu) = \iint \log|x-y|^{-1} d\mu(x) d\mu(y) + \int V(x) d\mu(x)$）。当 $V(x) = x^2/2$（Gauss 势），$\mu_V$ 是半圆律；此结果对任意 $\beta > 0$ 成立，不限于经典值。

**定理 273.4**（$\beta$系综的 Tracy-Widom 普遍性，Ramirez-Rider-Virág 2011 / Bourgade-Erdos-Yau 2014）：对任意固定的 $\beta > 0$，$\beta$系综的最大特征值（经适当缩放）收敛到 **$\beta$-Tracy-Widom 分布** $F_\beta$。其边界条件为随机 Schrödinger 算子（随机 Airy 算子 $\mathcal{A}_\beta = -\frac{d^2}{dx^2} + x + \frac{2}{\sqrt{\beta}} B'(x)$，其中 $B(x)$ 是标准 Brown 运动）的基态能量的分布。

**定理 273.5**（对数气体与 Selberg 积分）：$\beta$系综的配分函数 $Z_{N, \beta}$ 是（当势 $V$ 为某类特殊函数时）可精确计算的。经典结果：**Selberg 积分**
$$\int_{[0,1]^N} \prod_{i<j} |t_i - t_j|^{2\gamma} \prod_{i=1}^N t_i^{\alpha-1} (1-t_i)^{\beta-1} dt_i = \prod_{j=0}^{N-1} \frac{\Gamma(\alpha + j\gamma) \Gamma(\beta + j\gamma) \Gamma(1 + (j+1)\gamma)}{\Gamma(\alpha + \beta + (N+j-1)\gamma) \Gamma(1 + \gamma)}$$
Selberg 积分是 $\beta$系综和随机矩阵理论中许多精确公式的源头。

### 273.3 随机矩阵的普遍性层级

**定理 273.6**（普遍性层级总结）：随机矩阵谱统计的普遍性分三个层级：
1. **宏观普遍性**（global / macroscopic）：极限谱分布（如半圆律）对元素分布不敏感——只需二阶矩有限
2. **体普遍性**（bulk universality）：局部相关函数在谱的内部收敛到 Sine 核——需要四阶矩有限（Erdos-Schlein-Yau）
3. **边缘普遍性**（edge universality）：最大特征值的 Tracy-Widom 极限——需要四阶矩有限（Soshnikov 1999，Tao-Vu 2010）

所有三个层级现已被严格证明，构成了随机矩阵理论最深刻的结构定理。

---

*本卷在概率论 II（V21）和线性代数（V7）的基础上，系统建立了 Wigner 半圆律与普遍性、自由概率论、Tracy-Widom 分布与边缘统计、随机矩阵跨学科应用和现代发展的数学理论。共 7 章。*

---

---

---

---

## 第242章（补充）
> 随机分析是随机过程与数学分析的深度交叉领域，以 Itô 积分理论为核心，研究受随机扰动影响的系统。本卷建立在概率论（V6）、概率论 II（V21）和测度论（V9）的基础上，系统建立 Itô 积分、随机微分方程（SDE）、扩散过程、Malliavin 分析和随机偏微分方程（SPDE）的理论。随机分析在现代金融数学（Black-Scholes 模型）、物理学（统计力学、量子场论）、生物学（种群动力学）和工程（信号处理）中有广泛应用。

---

---

---

---

## 第243章：Itô 积分与随机积分
Itô 积分是随机分析的核心构造，由 Itô 在 1944 年建立。与 Riemann-Stieltjes 积分不同，被积函数在左端点取值（而非任意点），使得积分成为鞅，这在理论和应用中都至关重要。

### 135.1 Brown 运动与连续鞅

**定义 135.1**（Brown 运动）：随机过程 $(W_t)_{t \geq 0}$ 是**标准 Brown 运动**（Wiener 过程），如果：
（1）$W_0 = 0$ a.s.
（2）增量独立性：对 $0 \leq s < t$，$W_t - W_s$ 与 $\sigma(W_u: u \leq s)$ 独立
（3）正态增量：$W_t - W_s \sim N(0, t-s)$
（4）连续性：$t \mapsto W_t$ a.s. 连续

**定理 135.1**（Brown 运动的性质）：
- 样本路径 a.s. 连续但处处不可微
- 二次变差：$[W, W]_t = \lim_{\|\Pi\| \to 0} \sum_i (W_{t_{i+1}} - W_{t_i})^2 = t$
- 尺度变换：$(c^{-1/2} W_{ct})$ 是 Brown 运动
- 时间反演：$(t W_{1/t})$（补充 $0$ at $t=0$）是 Brown 运动

**定理 135.2**（Kolmogorov 连续性准则）：若对某 $\alpha, \beta > 0$，$E[|X_t - X_s|^\alpha] \leq C |t-s|^{1+\beta}$，则 $X_t$ 有连续版本。对 Brown 运动，$E[(W_t - W_s)^4] = 3(t-s)^2$（$\alpha = 4, \beta = 1$）。

**定理 135.3**（鞅性质）：以下关于 Brown 运动自然滤子 $\mathcal{F}_t = \sigma(W_s: s \leq t)$ 都是鞅：
- $W_t$（martingale）
- $W_t^2 - t$（平方变差补偿）
- $\exp(\lambda W_t - \lambda^2 t/2)$（指数鞅）

### 135.2 Itô 积分的构造

**定义 135.2**（简单过程的 Itô 积分）：对简单过程 $H_t = \sum_{i=0}^{n-1} H_{t_i} 1_{[t_i, t_{i+1})}(t)$（其中 $H_{t_i}$ 是 $\mathcal{F}_{t_i}$-可测且平方可积），定义

$$I(H) = \sum_{i=0}^{n-1} H_{t_i} (W_{t_{i+1}} - W_{t_i})$$

**定理 135.4**（Itô 等距）：$$E[(I(H))^2] = E\left[\int_0^T H_t^2 dt\right]$$

*证明*：设 $\Delta W_i = W_{t_{i+1}} - W_{t_i}$。展开 $E[(I(H))^2] = E[\sum_{i,j} H_{t_i} H_{t_j} \Delta W_i \Delta W_j]$。当 $i \neq j$，不妨设 $i < j$，则 $E[H_{t_i} H_{t_j} \Delta W_i \Delta W_j] = E[H_{t_i} H_{t_j} \Delta W_i E[\Delta W_j | \mathcal{F}_{t_j}]] = 0$（因 $\Delta W_j$ 与 $\mathcal{F}_{t_j}$ 独立且均值为 0）。对角项：$E[H_{t_i}^2 (\Delta W_i)^2] = E[H_{t_i}^2 E[(\Delta W_i)^2 | \mathcal{F}_{t_i}]] = E[H_{t_i}^2 (t_{i+1} - t_i)] = E[\int_{t_i}^{t_{i+1}} H_t^2 dt]$。求和即得。∎

**定义 135.3**（一般 Itô 积分）：对满足 $\int_0^T H_t^2 dt < \infty$ a.s. 且 $H_t$ 是适应过程的 $H$，存在简单过程序列 $H^{(n)} \to H$（在 $L^2(\Omega \times [0,T])$ 中），定义

$$\int_0^T H_t dW_t = L^2\text{-}\lim_{n \to \infty} I(H^{(n)})$$

**性质 135.5**：Itô 积分 $\int_0^t H_s dW_s$ 是连续的 $L^2$-鞅，二次变差 $\left[\int H dW, \int H dW\right]_t = \int_0^t H_s^2 ds$。

### 135.3 Itô 公式

**定理 135.6**（Itô 公式，一维）：设 $f \in C^2$ 和 $X_t$ 是 Itô 过程 $dX_t = \mu_t dt + \sigma_t dW_t$。则

$$df(X_t) = f'(X_t) dX_t + \frac{1}{2} f''(X_t) \sigma_t^2 dt$$

等价地：

$$f(X_t) - f(X_0) = \int_0^t f'(X_s) dX_s + \frac{1}{2} \int_0^t f''(X_s) \sigma_s^2 ds$$

*证明概要*：对 $f(X_{t_{i+1}}) - f(X_{t_i})$ 做 Taylor 展开至二阶：
$$f(X_{t_{i+1}}) - f(X_{t_i}) = f'(X_{t_i}) \Delta X_i + \frac{1}{2} f''(X_{t_i}) (\Delta X_i)^2 + o((\Delta X_i)^2)$$
求和取极限。关键点是 $(\Delta X_i)^2 \approx \sigma_{t_i}^2 \Delta t_i$（因为 $(dW_t)^2 = dt$），而 $(\Delta t_i)^2$ 和 $(\Delta t_i)(\Delta W_i)$ 在极限下消失。∎

**定理 135.7**（Itô 公式，多维）：设 $f(t, x_1, \ldots, x_d) \in C^{1,2}$，$X^i_t$ 是 Itô 过程，$dX^i_t = \mu^i_t dt + \sum_{j=1}^m \sigma^{ij}_t dW^j_t$。则

$$df(t, X_t) = \frac{\partial f}{\partial t} dt + \sum_{i=1}^d \frac{\partial f}{\partial x_i} dX^i_t + \frac{1}{2} \sum_{i,j=1}^d \frac{\partial^2 f}{\partial x_i \partial x_j} d\langle X^i, X^j \rangle_t$$

其中 $d\langle X^i, X^j \rangle_t = \sum_{k=1}^m \sigma^{ik}_t \sigma^{jk}_t dt$。

**例 135.1**（几何 Brown 运动）：对 $dS_t = \mu S_t dt + \sigma S_t dW_t$（$S_0 > 0$），取 $f(x) = \log x$，$f'(x) = 1/x$，$f''(x) = -1/x^2$。由 Itô 公式：

$$d(\log S_t) = \frac{1}{S_t} dS_t - \frac{1}{2} \frac{1}{S_t^2} \sigma^2 S_t^2 dt = (\mu - \sigma^2/2) dt + \sigma dW_t$$

积分得 $S_t = S_0 \exp((\mu - \sigma^2/2)t + \sigma W_t)$。

### 135.4 Girsanov 定理与测度变换

**定理 135.8**（Girsanov 定理）：设 $\theta_t$ 是适应过程，满足 Novikov 条件 $E[\exp(\frac{1}{2} \int_0^T \theta_t^2 dt)] < \infty$。定义

$$Z_t = \exp\left(\int_0^t \theta_s dW_s - \frac{1}{2} \int_0^t \theta_s^2 ds\right)$$

在概率测度 $\tilde{P}$（$d\tilde{P}|_{\mathcal{F}_T} = Z_T dP$）下，过程

$$\tilde{W}_t = W_t - \int_0^t \theta_s ds$$

是 $\tilde{P}$-Brown 运动。

*应用*：Girsanov 定理是金融数学中风险中性定价的基础。它允许通过概率测度的变换消除漂移项，将任何等价测度下的 Itô 过程转化为鞅。

**定理 135.9**（鞅表示定理）：设 $M_t$ 是关于 Brown 运动滤子的 $L^2$-鞅。则存在唯一的适应过程 $H_t$（$\int_0^T H_t^2 dt < \infty$ a.s.）使得

$$M_t = M_0 + \int_0^t H_s dW_s$$

---

---

---

---

## 第244章：随机微分方程
随机微分方程（SDE）描述受随机噪声影响的动力系统，形如

$$dX_t = b(t, X_t) dt + \sigma(t, X_t) dW_t$$

其中 $b$ 是漂移系数，$\sigma$ 是扩散系数。

**定理 136.1**（存在唯一性定理）：设 $b, \sigma: [0,T] \times \mathbb{R}^n \to \mathbb{R}^n$（$\sigma$ 矩阵值）满足 Lipschitz 条件

$$|b(t,x) - b(t,y)| + |\sigma(t,x) - \sigma(t,y)| \leq K |x-y|$$

和线性增长条件 $|b(t,x)|^2 + |\sigma(t,x)|^2 \leq K(1+|x|^2)$。则 SDE

$$X_t = X_0 + \int_0^t b(s, X_s) ds + \int_0^t \sigma(s, X_s) dW_s$$

存在唯一的连续适应解且 $\sup_t E[|X_t|^2] < \infty$。

*证明思路*：使用 Picard 迭代 $X^{(0)}_t = X_0$，$X^{(n+1)}_t = X_0 + \int_0^t b(s, X^{(n)}_s) ds + \int_0^t \sigma(s, X^{(n)}_s) dW_s$。利用 Itô 等距和 Lipschitz 条件证明 $E[\sup_s |X^{(n+1)}_s - X^{(n)}_s|^2] \leq C T^n/n!$，由 Banach 不动点定理得证。∎

### 136.2 Feynman-Kac 公式

**定理 136.2**（Feynman-Kac 公式）：设 $u(t,x)$ 是偏微分方程

$$\frac{\partial u}{\partial t} + \mathcal{L} u - r u = 0, \quad u(T,x) = f(x)$$

的解，其中 $\mathcal{L} = \frac{1}{2}\sigma^2(x) \frac{\partial^2}{\partial x^2} + b(x) \frac{\partial}{\partial x}$ 是扩散过程的生成元。则

$$u(t,x) = E\left[e^{-r(T-t)} f(X_T) \mid X_t = x\right]$$

其中 $X_t$ 是 SDE $dX_s = b(X_s) ds + \sigma(X_s) dW_s$ 的解。

*应用*：Feynman-Kac 公式将 PDE 的求解转化为随机过程的期望计算，是金融衍生品定价（Black-Scholes PDE）的数学基础。

### 136.3 Markov 性与强 Markov 性

**定理 136.3**（扩散过程的 Markov 性）：Lipschitz 条件下 SDE 的解是 Markov 过程，即

$$E[f(X_t) \mid \mathcal{F}_s] = E[f(X_t) \mid X_s] \quad (s < t)$$

且具有 Feller 性质：转移半群 $P_t f(x) = E[f(X_t) \mid X_0 = x]$ 将连续有界函数映为连续有界函数。

**定理 136.4**（Dynkin 公式）：设 $\mathcal{L}$ 是扩散过程 $X_t$ 的生成元，$\tau$ 是停时且 $E[\tau] < \infty$，则

$$E[f(X_\tau)] = f(x) + E\left[\int_0^\tau \mathcal{L}f(X_s) ds\right]$$

这是 Itô 公式的直接推论，用于研究扩散过程的平均首达时间等问题。

### 136.4 扩散过程的构造与 Kolmogorov 方程

**定理 136.5**（Kolmogorov 前向方程 / Fokker-Planck 方程）：扩散过程 $X_t$ 的概率密度 $p(t,x)$（若存在）满足

$$\frac{\partial p}{\partial t} = -\frac{\partial}{\partial x}(b p) + \frac{1}{2} \frac{\partial^2}{\partial x^2}(\sigma^2 p) = \mathcal{L}^* p$$

其中 $\mathcal{L}^*$ 是生成元 $\mathcal{L}$ 的伴随。

---

---

---

---

## 第245章：Malliavin 分析
Malliavin 分析（Malliavin 计算）是无穷维空间上的微分分析，由 Paul Malliavin 在 1970 年代建立，其初始动机是证明 Hörmander 亚椭圆性定理的概率方法。它在随机分析中的地位相当于 Sobolev 理论在 PDE 中的地位。

### 137.1 Wiener 混沌分解

**定理 137.1**（Wiener-Itô 混沌分解）：任意 $L^2(\Omega, \mathcal{F}, P)$ 的泛函 $F$（其中 $\mathcal{F} = \sigma(W_t: t \in  [0,T])$）可唯一分解为正交和：

$$F = \sum_{n=0}^{\infty} I_n(f_n)$$

其中 $I_n$ 是 $n$ 重 Itô-Wiener 积分（关于 Brown 运动），$f_n \in L^2([0,T]^n)$ 是对称函数。

### 137.2 Malliavin 导数

**定义 137.2**（Malliavin 导数）：对光滑随机变量 $F = f(W_{t_1}, \ldots, W_{t_n})$（$f \in C_p^\infty(\mathbb{R}^n)$——光滑且多项式增长），其 Malliavin 导数为

$$D_t F = \sum_{i=1}^n \frac{\partial f}{\partial x_i}(W_{t_1}, \ldots, W_{t_n}) 1_{[0, t_i)}(t)$$

它是 $L^2([0,T] \times \Omega)$ 中取值的过程。

**定义 137.3**（Sobolev 空间 $\mathbb{D}^{1,2}$）：通过闭包

$$\|F\|_{\mathbb{D}^{1,2}}^2 = E[|F|^2] + E\left[\int_0^T |D_t F|^2 dt\right]$$

定义的完备化空间。

**命题 137.2**（基本性质）：
- **链式法则**：$D_t(\varphi(F)) = \varphi'(F) D_t F$（$\varphi \in C^1$）
- **分部积分**（Skorohod 积分的伴随性）：$E[F \delta(u)] = E[\int_0^T D_t F \cdot u_t dt]$
- **Clark-Ocone 公式**：$F = E[F] + \int_0^T E[D_t F \mid \mathcal{F}_t] dW_t$

### 137.3 Skorohod 积分

**定义 137.4**（Skorohod 积分）：$u \in L^2([0,T] \times \Omega)$ 的 Skorohod 积分 $\delta(u)$ 是 Malliavin 导数 $D$ 的伴随算子：

$$E[\langle D F, u \rangle_{L^2([0,T])}] = E[F \delta(u)]$$

Skorohod 积分是 Itô 积分的推广：当 $u$ 是适应过程时，$\delta(u) = \int_0^T u_t dW_t$（Itô 积分）；当 $u$ 不是适应过程（例如可预期/anticipating 积分）时，Skorohod 积分给出有意义的推广。

### 137.4 Malliavin 亚椭圆性定理

**定理 137.3**（Hörmander 条件）：对 SDE $dX_t = V_0(X_t) dt + \sum_{i=1}^m V_i(X_t) \circ dW^i_t$（Stratonovich 形式），若向量场族 $\{V_1, \ldots, V_m\}$ 及其所有 Lie 括号在每点 span 整个切空间（Hörmander 条件），则 $X_t$ 有光滑密度。

*Malliavin 证明的思路*：将密度的光滑性归结为 Malliavin 协方差矩阵 $\gamma_{ij} = \langle D X_t^{(i)}, D X_t^{(j)} \rangle_{L^2([0,T])}$ 的矩的衰减，进而通过分部积分公式建立密度的正则性。

---

---

---

---

## 第246章：随机偏微分方程（SPDE）
随机偏微分方程研究受随机扰动影响的无穷维动力系统，是随机分析与 PDE 理论的交叉前沿。

### 138.1 基本概念与分类

**定义 138.1**（SPDE 的一般形式）：

$$\frac{\partial u}{\partial t} = \mathcal{L} u + f(u) + \sigma(u) \xi(t,x)$$

其中 $\mathcal{L}$ 是（椭圆）空间微分算子，$\xi(t,x)$ 是时空白噪声（$\delta$-相关）。SPDE 的分类：（1）**半线性**——$\sigma(u)$ 不依赖于导数；（2）**拟线性**——噪声系数依赖于导数；（3）**完全非线性**——最高阶导数进入噪声项。

### 138.2 时空白噪声与随机卷积

**定义 138.2**（时空白噪声）：$\mathbb{R}_+ \times \mathbb{R}^d$ 上的 Gauss 随机场 $\xi(t,x)$，满足

$$E[\xi(t,x)] = 0, \quad E[\xi(t,x)\xi(s,y)] = \delta(t-s)\delta(x-y)$$

当 $d \geq 2$ 时，$\xi$ 不能定义在经典的函数空间上——它是 Schwartz 分布而非函数。这是 SPDE 理论复杂性的根本来源。

**定理 138.1**（随机卷积）：对线性 SPDE $\partial_t u = \Delta u + \xi$，其温和解为

$$u(t,x) = \int_{\mathbb{R}^d} G(t, x-y) u_0(y) dy + \int_0^t \int_{\mathbb{R}^d} G(t-s, x-y) \xi(s,y) dy ds$$

其中 $G$ 是热核。当 $d=1$ 时，$u(t, \cdot)$ 是 a.s. 连续函数（Hölder $\alpha < 1/2$）；$d=2$ 时是 a.s. 连续分布（Hölder $\alpha < 0$）；$d \geq 3$ 时需要用重整化。

### 138.3 Hairer 的正则性结构理论

Martin Hairer 在 2014 年以正则性结构理论获得 Fields 奖，该理论为驱动是非正则噪声（如时空白噪声）的非线性 SPDE 提供了系统化的分析框架。

**定理 138.2**（KPZ 方程的适定性）：Kardar-Parisi-Zhang 方程

$$\partial_t h = \partial_x^2 h + (\partial_x h)^2 + \xi$$

在 Hairer 的正则性结构框架下是局部适定的。这一结果解决了 KPZ 方程自 1986 年提出以来长期悬而未决的数学适定性问题。

**核心思想**：正则性结构将非线性 SPDE 的解表示为正则性结构中的模型作用在"装饰树"（decorated trees）的展开式上；通过重整化消除发散（类似于量子场论中的 Wilson 重整化），建立解的正则性估计和连续性。

---

---

---

---

## 第247章：随机几何与 Lévy 过程
### 139.1 Schramm-Loewner 演化（SLE）

**定义 139.1**（Loewner 方程）：设 $\gamma: [0,\infty) \to \overline{\mathbb{H}}$（上半平面）是简单曲线，$\gamma(0)=0$。令 $g_t: \mathbb{H} \setminus \gamma[0,t] \to \mathbb{H}$ 是 Riemann 映照（标准化为 $g_t(z) \sim z + 2a_t/z + \cdots$）。$g_t$ 满足 Loewner 方程：

$$\frac{\partial}{\partial t} g_t(z) = \frac{2}{g_t(z) - U_t}$$

其中 $U_t = g_t(\gamma(t))$ 是驱动函数。

**定义 139.2**（SLE$_\kappa$）：当驱动函数取为 $U_t = \sqrt{\kappa} W_t$（Brown 运动的缩放）时，对应的随机曲线称为 SLE$_\kappa$（Schramm-Loewner Evolution）。

**定理 139.1**（SLE 的相变）：
- $0 < \kappa \leq 4$：曲线是简单的且不自交（dilute 相）
- $4 < \kappa < 8$：曲线自交但不填充平面（dense 相）
- $\kappa \geq 8$：曲线是空间填充的

**定理 139.2**（SLE 与统计物理的关系）：SLE 被推测（许多已被证明）描述了平面统计力学模型在临界点处的缩放极限：
- SLE$_2$：loop-erased random walk
- SLE$_3$：Ising 模型的界面（critical Ising）
- SLE$_4$：Gaussian 自由场的等值线（level lines），对应调和探索
- SLE$_6$：三角格子上的 critical percolation 界面（Smirnov 2001，Fields 奖获奖工作）
- SLE$_8/3$：self-avoiding walk（推测，Lawler-Schramm-Werner）
- SLE$_8$：均匀生成树的 Peano 曲线

### 139.2 Lévy 过程

Lévy 过程是具有独立平稳增量的随机过程，Brown 运动和 Poisson 过程是最经典的例子。

**定理 139.3**（Lévy-Khintchine 公式）：Lévy 过程 $X_t$ 的特征函数为

$$E[e^{i\theta X_t}] = e^{t \psi(\theta)}$$

其中

$$\psi(\theta) = i b \theta - \frac{1}{2} \sigma^2 \theta^2 + \int_{\mathbb{R}} (e^{i\theta x} - 1 - i\theta x 1_{|x|<1}) \nu(dx)$$

$(b, \sigma^2, \nu)$ 称为 Lévy 三元组：$b$ 是漂移，$\sigma^2$ 是 Gauss 部分方差，$\nu$ 是 Lévy 测度（跃度测度）。

**定理 139.4**（Lévy-Itô 分解）：任何 Lévy 过程可分解为

$$X_t = b t + \sigma W_t + \int_0^t \int_{|x|<1} x \tilde{N}(ds, dx) + \int_0^t \int_{|x| \geq 1} x N(ds, dx)$$

其中 $N$ 是跃度测度的 Poisson 随机测度，$\tilde{N}$ 是补偿 Poisson 随机测度。

**重要例子**：
- **$\alpha$-稳定过程**：Lévy 测度 $\nu(dx) = c_\pm |x|^{-1-\alpha} dx$（$0 < \alpha < 2$）
- **Gamma 过程**：非负 Lévy 过程，增量服从 Gamma 分布，用于金融（方差 Gamma 模型）和可靠性理论
- **逆 Gauss 过程**：增量服从逆 Gauss 分布，常用于首达时间建模

### 139.3 测度值过程

**定义 139.3**（超过程 / Superprocess）：超过程是取测度为值的 Markov 过程，由分支粒子系统的缩放极限产生。超 Brown 运动 $X_t$ 是测度值过程，满足鞅问题

$$M_t(\varphi) = \langle X_t, \varphi \rangle - \langle X_0, \varphi \rangle - \int_0^t \langle X_s, \Delta \varphi \rangle ds, \quad \varphi \in \mathcal{D}(\Delta)$$

**Fleming-Viot 过程**是另一类测度值过程，描述无灭绝种群遗传学中基因类型的频率演化（Wright-Fisher 模型的缩放极限），其生成元涉及 Dirichlet 形式。

---

---

---

---

## 第248章：大偏差理论与集中不等式
大偏差理论估计罕见事件概率的指数衰减速率，是统计力学（熵最大化原理）、信息论（Sanov 定理）和风险管理的基础工具。

### 140.1 Cramér 定理

**定理 140.1**（Cramér 定理，1938）：设 $X_1, X_2, \ldots$ 是 i.i.d. 随机变量，矩母函数 $\Lambda(\lambda) = \log E[e^{\lambda X_1}] < \infty$ 对某区间 $\lambda \in [-\varepsilon, \varepsilon]$ 成立。则样本均值 $\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i$ 满足大偏差原理（LDP），速率函数为 Legendre 变换

$$I(x) = \sup_{\lambda \in \mathbb{R}} \{\lambda x - \Lambda(\lambda)\}$$

即：对开集 $G$，$\liminf_n \frac{1}{n} \log P(\bar{X}_n \in G) \geq -\inf_{x \in G} I(x)$；对闭集 $F$，$\limsup_n \frac{1}{n} \log P(\bar{X}_n \in F) \leq -\inf_{x \in F} I(x)$。

**Corollary 140.2**（Chernoff 界）：$P(\bar{X}_n \geq a) \leq e^{-n I(a)}$（对 $a > E[X_1]$）。

### 140.2 Schilder 定理与 Freidlin-Wentzell 理论

**定理 140.3**（Schilder 定理）：Brown 运动 $W_t$（$t \in [0,1]$）经缩放 $\sqrt{\varepsilon} W_t$ 满足参数 $\varepsilon \to 0$ 的 LDP，速率函数为 Cameron-Martin 范数：

$$I(\varphi) = \begin{cases} \frac{1}{2} \int_0^1 |\dot{\varphi}(t)|^2 dt & \varphi \in H^1([0,1]), \varphi(0)=0 \\ \infty & \text{否则} \end{cases}$$

**定理 140.4**（Freidlin-Wentzell 理论）：SDE $dX^\varepsilon_t = b(X^\varepsilon_t) dt + \sqrt{\varepsilon} \sigma(X^\varepsilon_t) dW_t$ 的样本路径的 LDP 速率函数为

$$I(\varphi) = \frac{1}{2} \int_0^T (\dot{\varphi} - b(\varphi))^T (\sigma \sigma^T)^{-1}(\varphi) (\dot{\varphi} - b(\varphi)) dt$$

### 140.3 集中不等式

**定理 140.5**（Hoeffding 不等式）：设 $X_1, \ldots, X_n$ 是独立随机变量，$a_i \leq X_i \leq b_i$ a.s.，则对 $t > 0$，

$$P\left(\sum_{i=1}^n (X_i - E[X_i]) \geq t\right) \leq \exp\left(-\frac{2t^2}{\sum_{i=1}^n (b_i - a_i)^2}\right)$$

**定理 140.6**（McDiarmid 不等式—有界差异不等式）：设 $f: \mathbb{R}^n \to \mathbb{R}$ 对每个坐标满足有界差异性质 $|f(x_1, \ldots, x_i, \ldots, x_n) - f(x_1, \ldots, x'_i, \ldots, x_n)| \leq c_i$，$X_1, \ldots, X_n$ 独立。则

$$P(f(X_1, \ldots, X_n) - E[f] \geq t) \leq \exp\left(-\frac{2t^2}{\sum_{i=1}^n c_i^2}\right)$$

**定理 140.7**（Talagrand 集中不等式）：在乘积空间 $\Omega = \prod \Omega_i$ 上配备乘积概率测度，任意凸 1-Lipschitz 函数 $f$ 满足 Gauss 型集中：

$$P(|f - M_f| \geq t) \leq C e^{-t^2/C}$$

其中 $M_f$ 是 $f$ 的中位数。这一不等式通过 Marton 的信息传输方法和 Bobkov-Götze 条件建立。

### 140.4 经验过程与一致大数定律

**定理 140.8**（Glivenko-Cantelli 定理）：设 $F$ 是 VC 类（Vapnik-Chervonenkis 类），则经验分布函数按 $\|\cdot\|_\infty$ 一致收敛于真实分布 a.s.

**定理 140.9**（Donsker 定理—经验过程的泛函中心极限定理）：在适当的函数类上，经验过程 $\sqrt{n}(\mathbb{P}_n - P)$ 弱收敛于 $P$-Brown 桥（均值为零、协方差为 $C(f,g) = P(fg) - P(f)P(g)$ 的 Gauss 过程）。

---

*本卷在概率论 II（V21）的基础上，建立了随机分析的核心理论：Itô 随机积分构造与 Girsanov 定理、Feynman-Kac 公式、Malliavin 分析的分部积分公式与亚椭圆性定理、随机偏微分方程的正则性结构理论、Schramm-Loewner 演化（SLE）与统计物理的联系，以及 Lévy 过程的 Lévy-Khintchine 表示与大偏差理论。共 7 章。*

---

*本卷在初等概率论（V6）和测度论（V9）的基础上，建立了概率论的严格分析基础：Kolmogorov 公理体系将概率论纳入测度论框架；大数定律和中心极限定理揭示了随机现象中的确定性规律；条件期望和鞅论提供了处理信息的强大工具；Markov 链理论为随机过程建模提供了基本框架；Brown 运动和 Itô 积分开创了随机分析，为金融数学（Black-Scholes 模型）和随机微分方程奠定了基础。为后续数理统计（V22）提供了概率论基础。**补充部分一**将概率论极限理论应用于统计力学：Gibbs 测度理论建立了平衡态统计力学的概率论基础，相变理论通过配分函数的非解析性揭示了临界现象，重整化群方法从不动点理论出发统一了临界指数的普适性。**补充部分二**引入了随机矩阵理论：Wigner半圆律与普遍性、自由概率论（Voiculescu的R-变换与S-变换）、Tracy-Widom分布与边缘统计、圆律与Stieltjes变换方法、行列式点过程与$\beta$系综，以及随机矩阵在数论（Riemann $\zeta$零点）、高维统计与机器学习中的现代应用。**补充部分三**建立了随机分析的完整体系：Itô积分深化与Girsanov定理、随机微分方程（SDE）解的存在唯一性与Feynman-Kac公式、Malliavin分析与Hörmander条件、随机偏微分方程（SPDE）与正则性结构、随机几何与SLE理论、Lévy过程与测度值过程、大偏差理论（Cramér定理、Schilder定理）与经验过程理论。*


*卷二十：概率论 II终。*


*卷二十：概率论 II终。*


*卷二十：概率论 II终。*
