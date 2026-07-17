## 第289章：随机微分方程
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

---
---

## 第290章：Malliavin 分析
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

---