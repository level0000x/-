## 第287章（补充）
> 随机分析是随机过程与数学分析的深度交叉领域，以 Itô 积分理论为核心，研究受随机扰动影响的系统。本卷建立在概率论（V6）、概率论 II（V21）和测度论（V9）的基础上，系统建立 Itô 积分、随机微分方程（SDE）、扩散过程、Malliavin 分析和随机偏微分方程（SPDE）的理论。随机分析在现代金融数学（Black-Scholes 模型）、物理学（统计力学、量子场论）、生物学（种群动力学）和工程（信号处理）中有广泛应用。

---

---

---

---

---
---

## 第288章：Itô 积分与随机积分
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

**证明**（二次变差）：对分划 $\Pi_n = \{t_0,\ldots,t_n\}$，增量 $\Delta W_i \sim \mathcal{N}(0,\Delta t_i)$ 独立。$\mathbb{E}[(\Delta W_i)^2] = \Delta t_i$，$\operatorname{Var}((\Delta W_i)^2) = 2(\Delta t_i)^2$。$\operatorname{Var}(\sum (\Delta W_i)^2) = 2\sum (\Delta t_i)^2 \to 0$（$\|\Pi_n\| \to 0$），由 Chebyshev 不等式得 $L^2$ 收敛于 $t$。$\blacksquare$

**定理 135.2**（Kolmogorov 连续性准则）：若对某 $\alpha, \beta > 0$，$E[|X_t - X_s|^\alpha] \leq C |t-s|^{1+\beta}$，则 $X_t$ 有连续版本。对 Brown 运动，$E[(W_t - W_s)^4] = 3(t-s)^2$（$\alpha = 4, \beta = 1$）。

**证明**：设 $D \subseteq [0,T]$ 为二进有理点集。由 Chebyshev 不等式，$\mathbb{P}(|X_t - X_s| \geq |t-s|^\gamma) \leq C |t-s|^{1+\beta-\alpha\gamma}$。选取 $\gamma$ 使 $\beta - \alpha\gamma > 0$，则级数 $\sum_n \mathbb{P}(\max_k |X_{k/2^n} - X_{(k-1)/2^n}| > 2^{-n\gamma}) < \infty$。由 Borel-Cantelli，在 $D$ 上一致连续，延拓至 $[0,T]$。$\blacksquare$

**定理 135.3**（鞅性质）：以下关于 Brown 运动自然滤子 $\mathcal{F}_t = \sigma(W_s: s \leq t)$ 都是鞅：
- $W_t$（martingale）
- $W_t^2 - t$（平方变差补偿）
- $\exp(\lambda W_t - \lambda^2 t/2)$（指数鞅）

**证明**：$W_t$ 为鞅：由增量独立性，$\mathbb{E}[W_t \mid \mathcal{F}_s] = W_s + \mathbb{E}[W_t - W_s \mid \mathcal{F}_s] = W_s$。$W_t^2 - t$：$\mathbb{E}[W_t^2 \mid \mathcal{F}_s] = \mathbb{E}[(W_s + (W_t - W_s))^2 \mid \mathcal{F}_s] = W_s^2 + (t-s)$。指数鞅：$\mathbb{E}[e^{\lambda W_t} \mid \mathcal{F}_s] = e^{\lambda W_s} \mathbb{E}[e^{\lambda(W_t-W_s)}] = e^{\lambda W_s} \cdot e^{\lambda^2(t-s)/2}$，故 $e^{\lambda W_t - \lambda^2 t/2}$ 为鞅。$\blacksquare$

### 135.2 Itô 积分的构造

**定义 135.2**（简单过程的 Itô 积分）：对简单过程 $H_t = \sum_{i=0}^{n-1} H_{t_i} 1_{[t_i, t_{i+1})}(t)$（其中 $H_{t_i}$ 是 $\mathcal{F}_{t_i}$-可测且平方可积），定义

$$I(H) = \sum_{i=0}^{n-1} H_{t_i} (W_{t_{i+1}} - W_{t_i})$$

**定理 135.4**（Itô 等距）：$$E[(I(H))^2] = E\left[\int_0^T H_t^2 dt\right]$$

*证明*：设 $\Delta W_i = W_{t_{i+1}} - W_{t_i}$。展开 $E[(I(H))^2] = E[\sum_{i,j} H_{t_i} H_{t_j} \Delta W_i \Delta W_j]$。当 $i \neq j$，不妨设 $i < j$，则 $E[H_{t_i} H_{t_j} \Delta W_i \Delta W_j] = E[H_{t_i} H_{t_j} \Delta W_i E[\Delta W_j | \mathcal{F}_{t_j}]] = 0$（因 $\Delta W_j$ 与 $\mathcal{F}_{t_j}$ 独立且均值为 0）。对角项：$E[H_{t_i}^2 (\Delta W_i)^2] = E[H_{t_i}^2 E[(\Delta W_i)^2 | \mathcal{F}_{t_i}]] = E[H_{t_i}^2 (t_{i+1} - t_i)] = E[\int_{t_i}^{t_{i+1}} H_t^2 dt]$。求和即得。∎

**定义 135.3**（一般 Itô 积分）：对满足 $\int_0^T H_t^2 dt < \infty$ a.s. 且 $H_t$ 是适应过程的 $H$，存在简单过程序列 $H^{(n)} \to H$（在 $L^2(\Omega \times [0,T])$ 中），定义

$$\int_0^T H_t dW_t = L^2\text{-}\lim_{n \to \infty} I(H^{(n)})$$

**性质 135.5**：Itô 积分 $\int_0^t H_s dW_s$ 是连续的 $L^2$-鞅，二次变差 $\left[\int H dW, \int H dW\right]_t = \int_0^t H_s^2 ds$。

**证明**：对简单过程，$\mathbb{E}[I(H) \mid \mathcal{F}_s] = \sum_{t_i < s} H_{t_i} \Delta W_i$，且由独立性，$\mathbb{E}[I(H)\Delta W_j \mid \mathcal{F}_{t_j}] = 0$，故为鞅。$L^2$ 有界性来自 Itô 等距。二次变差：$(\sum H_{t_i} \Delta W_i)^2$ 的对角项和近似 $\sum H_{t_i}^2 \Delta t_i \to \int H_s^2 ds$。一般过程由稠密性延拓。$\blacksquare$

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

**证明**：多维 Taylor 展开：$df = f_t dt + \sum_i f_{x_i} dX^i + \frac{1}{2}\sum_{i,j} f_{x_i x_j} dX^i dX^j$。代入 $dX^i = \mu^i dt + \sum_k \sigma^{ik} dW^k$，保留所有 $O(dt)$ 项。利用 $dW^k dW^\ell = \delta_{k\ell} dt$ 和 $(dt)^2 = o(dt)$，交叉项 $dt \cdot dW^k$ 为 $o(dt)$。合并得 $d\langle X^i, X^j \rangle_t = \sum_k \sigma^{ik} \sigma^{jk} dt$。形式化极限过程由分划逼近完成。$\blacksquare$

### 135.4 Girsanov 定理与测度变换

**定理 135.8**（Girsanov 定理）：设 $\theta_t$ 是适应过程，满足 Novikov 条件 $E[\exp(\frac{1}{2} \int_0^T \theta_t^2 dt)] < \infty$。定义

$$Z_t = \exp\left(\int_0^t \theta_s dW_s - \frac{1}{2} \int_0^t \theta_s^2 ds\right)$$

在概率测度 $\tilde{P}$（$d\tilde{P}|_{\mathcal{F}_T} = Z_T dP$）下，过程

$$\tilde{W}_t = W_t - \int_0^t \theta_s ds$$

是 $\tilde{P}$-Brown 运动。

**证明**：验证 $\tilde{W}_t$ 的 Levy 特征。由 Ito 公式，$dZ_t = Z_t \theta_t dW_t$。对 $\tilde{P}$ 下任意有界 $\mathcal{F}_s$-可测函数 $F$，$\tilde{\mathbb{E}}[F(\tilde{W}_t - \tilde{W}_s)] = \mathbb{E}[Z_T F(\tilde{W}_t - \tilde{W}_s)] = \mathbb{E}[Z_s F(W_t - W_s - \int_s^t \theta_r dr)]$。由 Bayes 公式和 Novikov 条件，$\tilde{W}_t$ 的有限维分布与 Brown 运动一致，由 Levy 特征定理即为 Brown 运动。Novikov 条件保证了 Girsanov 密度 $Z_t$ 是严格正的鞅。$\blacksquare$

*应用*：Girsanov 定理是金融数学中风险中性定价的基础。它允许通过概率测度的变换消除漂移项，将任何等价测度下的 Itô 过程转化为鞅。

**定理 135.9**（鞅表示定理）：设 $M_t$ 是关于 Brown 运动滤子的 $L^2$-鞅。则存在唯一的适应过程 $H_t$（$\int_0^T H_t^2 dt < \infty$ a.s.）使得

$$M_t = M_0 + \int_0^t H_s dW_s$$

**证明**：设 $\mathcal{A} = \{\int_0^T H_s dW_s : H \in L^2(\Omega \times [0,T])\}$ 为 Itô 积分空间。$\mathcal{A}$ 是 $L^2(\Omega, \mathcal{F}_T, P)$ 的闭子空间。欲证 $\mathcal{A} = L^2(\Omega, \mathcal{F}_T, P) \ominus \mathbb{R}$（均值为 0 的全体）。若 $X \perp \mathcal{A}$，定义 $M_t = \mathbb{E}[X \mid \mathcal{F}_t]$。由 Itô 表示，$M_t$ 可表示为 $\int_0^t H_s dW_s$。正交性导出 $\mathbb{E}[X \int_0^T H_s dW_s] = 0$，继而 $X = 0$。因此 $\mathcal{A}$ 是满的。唯一性由 Itô 等距保证。$\blacksquare$

---

---

---

---

---