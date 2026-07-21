### 287.A Itô积分补充
> 随机分析是随机过程与数学分析的深度交叉领域，以 Itô 积分理论为核心，研究受随机扰动影响的系统。本卷建立在概率论、概率论 II 和测度论的基础上，系统建立 Itô 积分、随机微分方程（SDE）、扩散过程、Malliavin 分析和随机偏微分方程（SPDE）的理论。随机分析在现代金融数学（Black-Scholes 模型）、物理学（统计力学、量子场论）、生物学（种群动力学）和工程（信号处理）中有广泛应用。Itô 积分的核心突破在于放弃了 Riemann-Stieltjes 积分中积分点任意选取的自由，而强制在左端点取值——这一选择使得积分成为鞅，从而可以应用概率论的全部工具。Itô 公式（随机链式法则）则揭示了随机微积分与经典微积分的本质区别：二阶项不能忽略，因为 Brown 运动的二次变差非零。本章系统介绍 Brown 运动与连续鞅、Itô 积分的构造、Itô 公式、Girsanov 定理与测度变换、随机微分方程（SDE）的存在唯一性理论、Feynman-Kac 公式以及扩散过程的基本理论。

---

## 第314章：Itô 积分与随机积分

Itô 积分是随机分析的核心构造，由 Itô 在 1944 年建立。与 Riemann-Stieltjes 积分不同，被积函数在左端点取值（而非任意点），使得积分成为鞅，这在理论和应用中都至关重要。Itô 积分的构造是测度论概率论在现代数学中的典范应用：它结合了 Hilbert 空间理论（$L^2$ 空间的等距）、鞅论（Doob 的鞅不等式）和随机过程的正则性理论（Kolmogorov 连续性准则）。Itô 积分的核心应用领域包括：随机微分方程（SDE）——描述受噪声扰动的动力系统；金融数学——Black-Scholes 期权定价公式；滤波理论——Kalman-Bucy 滤波；以及随机控制——动态规划与 Hamilton-Jacobi-Bellman 方程。

### 135.1 Brown 运动与连续鞅

**定义 135.1**（Brown 运动）：随机过程 $(W_t)_{t \geq 0}$ 是**标准 Brown 运动**（Wiener 过程），如果：
（1）$W_0 = 0$ a.s.
（2）增量独立性：对 $0 \leq s < t$，$W_t - W_s$ 与 $\sigma(W_u: u \leq s)$ 独立
（3）正态增量：$W_t - W_s \sim N(0, t-s)$
（4）连续性：$t \mapsto W_t$ a.s. 连续

**定理 135.1**（Brown 运动的性质）：
- 样本路径 a.s. 连续但处处不可微（Paley-Wiener-Zygmund 定理）
- 二次变差：$[W, W]_t = \lim_{\|\Pi\| \to 0} \sum_i (W_{t_{i+1}} - W_{t_i})^2 = t$（$L^2$ 意义下）
- 尺度变换：$(c^{-1/2} W_{ct})$ 是 Brown 运动
- 时间反演：$(t W_{1/t})$（补充 $0$ at $t=0$）是 Brown 运动
- 反射原理：$\mathbb{P}(\sup_{0 \leq s \leq t} W_s \geq a) = 2\mathbb{P}(W_t \geq a)$（$a > 0$）
- 强 Markov 性：Brown 运动在停时 $\tau$ 处重新开始：$(W_{\tau + t} - W_\tau)_{t \geq 0}$ 独立于 $\mathcal{F}_\tau$ 且仍为 Brown 运动

**证明**（二次变差）：对分划 $\Pi_n = \{t_0,\ldots,t_n\}$，增量 $\Delta W_i \sim \mathcal{N}(0,\Delta t_i)$ 独立。$\mathbb{E}[(\Delta W_i)^2] = \Delta t_i$，$\operatorname{Var}((\Delta W_i)^2) = 2(\Delta t_i)^2$。$\operatorname{Var}(\sum (\Delta W_i)^2) = 2\sum (\Delta t_i)^2 \to 0$（$\|\Pi_n\| \to 0$），由 Chebyshev 不等式得 $L^2$ 收敛于 $t$。$\blacksquare$

**定理 135.2**（Kolmogorov 连续性准则）：若对某 $\alpha, \beta > 0$，$E[|X_t - X_s|^\alpha] \leq C |t-s|^{1+\beta}$，则 $X_t$ 有连续版本。对 Brown 运动，$E[(W_t - W_s)^4] = 3(t-s)^2$（$\alpha = 4, \beta = 1$）。

**证明**：设 $D \subseteq [0,T]$ 为二进有理点集。由 Chebyshev 不等式，$\mathbb{P}(|X_t - X_s| \geq |t-s|^\gamma) \leq C |t-s|^{1+\beta-\alpha\gamma}$。选取 $\gamma$ 使 $\beta - \alpha\gamma > 0$，则级数 $\sum_n \mathbb{P}(\max_k |X_{k/2^n} - X_{(k-1)/2^n}| > 2^{-n\gamma}) < \infty$。由 Borel-Cantelli，在 $D$ 上一致连续，延拓至 $[0,T]$。$\blacksquare$

**定理 135.3**（鞅性质）：以下关于 Brown 运动自然滤子 $\mathcal{F}_t = \sigma(W_s: s \leq t)$ 都是鞅：
- $W_t$（martingale）
- $W_t^2 - t$（平方变差补偿）
- $\exp(\lambda W_t - \lambda^2 t/2)$（指数鞅 / 随机指数）

**证明**：$W_t$ 为鞅：由增量独立性，$\mathbb{E}[W_t \mid \mathcal{F}_s] = W_s + \mathbb{E}[W_t - W_s \mid \mathcal{F}_s] = W_s$。$W_t^2 - t$：$\mathbb{E}[W_t^2 \mid \mathcal{F}_s] = \mathbb{E}[(W_s + (W_t - W_s))^2 \mid \mathcal{F}_s] = W_s^2 + (t-s)$。指数鞅：$\mathbb{E}[e^{\lambda W_t} \mid \mathcal{F}_s] = e^{\lambda W_s} \mathbb{E}[e^{\lambda(W_t-W_s)}] = e^{\lambda W_s} \cdot e^{\lambda^2(t-s)/2}$，故 $e^{\lambda W_t - \lambda^2 t/2}$ 为鞅。$\blacksquare$

**定义 135.1b**（Brown 运动的构造）：Brown 运动的存在性可通过以下方式证明：(1) Kolmogorov 延拓定理 + Kolmogorov 连续性准则，在 $C[0,\infty)$ 上构造 Wiener 测度；(2) Levy 的构造：取 $L^2[0,1]$ 的 Haar 正交基，将 Brown 运动展开为 Schauder 函数的随机级数；(3) 随机游走的 Donsker 不变原理：$n^{-1/2} S_{\lfloor nt \rfloor} \Rightarrow W_t$（依分布收敛）。

**定理 135.3b**（Levy 特征定理）：连续 $L^2$-鞅 $(M_t)$ 满足 $M_0 = 0$ 且 $[M, M]_t = t$（或等价地，$M_t^2 - t$ 是鞅）当且仅当 $M_t$ 是 Brown 运动。Levy 特征定理是识别 Brown 运动的最有力工具——它仅需验证鞅性和二次变差，无需检查增量分布。

### 135.2 Itô 积分的构造

**定义 135.2**（简单过程的 Itô 积分）：对简单过程 $H_t = \sum_{i=0}^{n-1} H_{t_i} 1_{[t_i, t_{i+1})}(t)$（其中 $H_{t_i}$ 是 $\mathcal{F}_{t_i}$-可测且平方可积），定义

$$I(H) = \sum_{i=0}^{n-1} H_{t_i} (W_{t_{i+1}} - W_{t_i})$$

**定理 135.4**（Itô 等距）：$$E[(I(H))^2] = E\left[\int_0^T H_t^2 dt\right]$$

*证明*：设 $\Delta W_i = W_{t_{i+1}} - W_{t_i}$。展开 $E[(I(H))^2] = E[\sum_{i,j} H_{t_i} H_{t_j} \Delta W_i \Delta W_j]$。当 $i \neq j$，不妨设 $i < j$，则 $E[H_{t_i} H_{t_j} \Delta W_i \Delta W_j] = E[H_{t_i} H_{t_j} \Delta W_i E[\Delta W_j | \mathcal{F}_{t_j}]] = 0$（因 $\Delta W_j$ 与 $\mathcal{F}_{t_j}$ 独立且均值为 0）。对角项：$E[H_{t_i}^2 (\Delta W_i)^2] = E[H_{t_i}^2 E[(\Delta W_i)^2 | \mathcal{F}_{t_i}]] = E[H_{t_i}^2 (t_{i+1} - t_i)] = E[\int_{t_i}^{t_{i+1}} H_t^2 dt]$。求和即得。∎

**定义 135.3**（一般 Itô 积分）：对满足 $\int_0^T H_t^2 dt < \infty$ a.s. 且 $H_t$ 是适应过程的 $H$，存在简单过程序列 $H^{(n)} \to H$（在 $L^2(\Omega \times [0,T])$ 中），定义

$$\int_0^T H_t dW_t = L^2\text{-}\lim_{n \to \infty} I(H^{(n)})$$

**性质 135.5**：Itô 积分 $\int_0^t H_s dW_s$ 是连续的 $L^2$-鞅，二次变差 $\left[\int H dW, \int H dW\right]_t = \int_0^t H_s^2 ds$。

**证明**：对简单过程，$\mathbb{E}[I(H) \mid \mathcal{F}_s] = \sum_{t_i < s} H_{t_i} \Delta W_i$，且由独立性，$\mathbb{E}[I(H)\Delta W_j \mid \mathcal{F}_{t_j}] = 0$，故为鞅。$L^2$ 有界性来自 Itô 等距。二次变差：$(\sum H_{t_i} \Delta W_i)^2$ 的对角项和近似 $\sum H_{t_i}^2 \Delta t_i \to \int H_s^2 ds$。一般过程由稠密性延拓。$\blacksquare$

**定理 135.5b**（Itô 积分的局部鞅性质）：若 $\int_0^T H_t^2 dt < \infty$ a.s.（而非 $L^2$ 意义下），则 $\int_0^t H_s dW_s$ 是局部鞅（而非全局鞅）。局部鞅是鞅概念的自然推广：存在停时列 $\tau_n \uparrow \infty$ 使得停止过程 $M_t^{\tau_n} = M_{t \wedge \tau_n}$ 是鞅。局部鞅性质是处理超鞅和 Itô 过程的核心工具。

**定理 135.5c**（Itô 积分与 Stratonovich 积分的关系）：Stratonovich 积分 $\int_0^t H_s \circ dW_s$ 在积分点取中点值（而非左端点），满足经典链式法则，但不是鞅。两者关系为：
$$\int_0^t H_s \circ dW_s = \int_0^t H_s dW_s + \frac{1}{2} \langle H, W \rangle_t$$
其中 $\langle H, W \rangle_t$ 为 $H$ 和 $W$ 的协变差。Stratonovich 积分在物理应用（如随机力学）中更自然，因为它保持了经典力学的形式。

### 135.3 Itô 公式

**定理 135.6**（Itô 公式，一维）：设 $f \in C^2$ 和 $X_t$ 是 Itô 过程 $dX_t = \mu_t dt + \sigma_t dW_t$。则

$$df(X_t) = f'(X_t) dX_t + \frac{1}{2} f''(X_t) \sigma_t^2 dt$$

等价地：

$$f(X_t) - f(X_0) = \int_0^t f'(X_s) dX_s + \frac{1}{2} \int_0^t f''(X_s) \sigma_s^2 ds$$

**证明**：Itô 公式的证明基于 Taylor 展开：对 $C^2$ 函数 $f$，$df(X_t)=f'(X_t)dX_t+\frac{1}{2}f''(X_t)(dX_t)^2$。关键点是 $(dW_t)^2=dt$（二次变差性质），且 $(dt)^2 = o(dt)$，$dt \cdot dW_t = o(dt)$。形式地：$\Delta f = f'(X_t)\Delta X_t + \frac{1}{2}f''(X_t)(\Delta X_t)^2 + o((\Delta X_t)^2)$。由于 $(\Delta W_t)^2 \approx \Delta t$（Brown 运动的二次变差），二阶项不能忽略。取极限 $\Delta t \to 0$，$\sum f''(X_t)(\Delta W_t)^2 \to \int f''(X_t)dt$（$L^2$ 收敛），得到 Itô 积分形式。$\blacksquare$

**定理 135.7**（Itô 公式，多维）：设 $f(t, x_1, \ldots, x_d) \in C^{1,2}$，$X^i_t$ 是 Itô 过程，$dX^i_t = \mu^i_t dt + \sum_{j=1}^m \sigma^{ij}_t dW^j_t$。则

$$df(t, X_t) = \frac{\partial f}{\partial t} dt + \sum_{i=1}^d \frac{\partial f}{\partial x_i} dX^i_t + \frac{1}{2} \sum_{i,j=1}^d \frac{\partial^2 f}{\partial x_i \partial x_j} d\langle X^i, X^j \rangle_t$$

其中 $d\langle X^i, X^j \rangle_t = \sum_{k=1}^m \sigma^{ik}_t \sigma^{jk}_t dt$。

**证明**：多维 Taylor 展开：$df = f_t dt + \sum_i f_{x_i} dX^i + \frac{1}{2}\sum_{i,j} f_{x_i x_j} dX^i dX^j$。代入 $dX^i = \mu^i dt + \sum_k \sigma^{ik} dW^k$，保留所有 $O(dt)$ 项。利用 $dW^k dW^\ell = \delta_{k\ell} dt$ 和 $(dt)^2 = o(dt)$，交叉项 $dt \cdot dW^k$ 为 $o(dt)$。合并得 $d\langle X^i, X^j \rangle_t = \sum_k \sigma^{ik} \sigma^{jk} dt$。形式化极限过程由分划逼近完成。$\blacksquare$

**命题 135.1**（Itô 公式的应用——随机指数）：设 $X_t$ 为 Itô 过程，$dX_t = \mu_t dt + \sigma_t dW_t$。定义随机指数（Doleans-Dade 指数）$\mathcal{E}(X)_t = \exp(X_t - X_0 - \frac{1}{2}[X, X]_t)$。由 Itô 公式，$d\mathcal{E}(X)_t = \mathcal{E}(X)_t dX_t$（即 $\mathcal{E}(X)_t$ 是随机微分方程 $dZ_t = Z_t dX_t$ 的解）。随机指数是 Girsanov 定理中的密度过程。

**命题 135.2**（Itô 乘积公式）：对两个 Itô 过程 $X_t, Y_t$，$d(X_t Y_t) = X_t dY_t + Y_t dX_t + d\langle X, Y \rangle_t$。这是 Itô 公式在 $f(x,y) = xy$ 上的特例，额外的协变差项 $d\langle X, Y \rangle_t$ 是随机微积分区别于经典微积分的标志。

### 135.4 Girsanov 定理与测度变换

**定理 135.8**（Girsanov 定理）：设 $\theta_t$ 是适应过程，满足 Novikov 条件 $E[\exp(\frac{1}{2} \int_0^T \theta_t^2 dt)] < \infty$。定义

$$Z_t = \exp\left(\int_0^t \theta_s dW_s - \frac{1}{2} \int_0^t \theta_s^2 ds\right)$$

在概率测度 $\tilde{P}$（$d\tilde{P}|_{\mathcal{F}_T} = Z_T dP$）下，过程

$$\tilde{W}_t = W_t - \int_0^t \theta_s ds$$

是 $\tilde{P}$-Brown 运动。

**证明**：验证 $\tilde{W}_t$ 的 Levy 特征。由 Ito 公式，$dZ_t = Z_t \theta_t dW_t$。对 $\tilde{P}$ 下任意有界 $\mathcal{F}_s$-可测函数 $F$，$\tilde{\mathbb{E}}[F(\tilde{W}_t - \tilde{W}_s)] = \mathbb{E}[Z_T F(\tilde{W}_t - \tilde{W}_s)] = \mathbb{E}[Z_s F(W_t - W_s - \int_s^t \theta_r dr)]$。由 Bayes 公式和 Novikov 条件，$\tilde{W}_t$ 的有限维分布与 Brown 运动一致，由 Levy 特征定理即为 Brown 运动。Novikov 条件保证了 Girsanov 密度 $Z_t$ 是严格正的鞅。$\blacksquare$

*应用*：Girsanov 定理是金融数学中风险中性定价的基础。它允许通过概率测度的变换消除漂移项，将任何等价测度下的 Itô 过程转化为鞅。在 Black-Scholes 模型中，股票价格 $dS_t = \mu S_t dt + \sigma S_t dW_t$ 在风险中性测度 $\tilde{P}$（$\theta = (\mu - r)/\sigma$）下变为 $dS_t = r S_t dt + \sigma S_t d\tilde{W}_t$，贴现价格 $e^{-rt} S_t$ 成为鞅，从而期权价格可表示为期望。

**定理 135.9**（鞅表示定理）：设 $M_t$ 是关于 Brown 运动滤子的 $L^2$-鞅。则存在唯一的适应过程 $H_t$（$\int_0^T H_t^2 dt < \infty$ a.s.）使得

$$M_t = M_0 + \int_0^t H_s dW_s$$

**证明**：设 $\mathcal{A} = \{\int_0^T H_s dW_s : H \in L^2(\Omega \times [0,T])\}$ 为 Itô 积分空间。$\mathcal{A}$ 是 $L^2(\Omega, \mathcal{F}_T, P)$ 的闭子空间。欲证 $\mathcal{A} = L^2(\Omega, \mathcal{F}_T, P) \ominus \mathbb{R}$（均值为 0 的全体）。若 $X \perp \mathcal{A}$，定义 $M_t = \mathbb{E}[X \mid \mathcal{F}_t]$。由 Itô 表示，$M_t$ 可表示为 $\int_0^t H_s dW_s$。正交性导出 $\mathbb{E}[X \int_0^T H_s dW_s] = 0$，继而 $X = 0$。因此 $\mathcal{A}$ 是满的。唯一性由 Itô 等距保证。$\blacksquare$

### 135.5 随机微分方程（SDE）

**定义 135.4**（随机微分方程）：**随机微分方程**（SDE）的一般形式为：
$$dX_t = b(t, X_t) dt + \sigma(t, X_t) dW_t, \quad X_0 = \xi$$
其中 $b$ 为漂移系数（drift），$\sigma$ 为扩散系数（diffusion），$W_t$ 为 $m$ 维 Brown 运动，$X_t$ 为 $n$ 维状态过程。SDE 的积分形式为：
$$X_t = \xi + \int_0^t b(s, X_s) ds + \int_0^t \sigma(s, X_s) dW_s$$

**定理 135.10**（SDE 解的存在唯一性——Itô 定理）：设 $b, \sigma$ 满足 Lipschitz 条件（$\|b(t,x)-b(t,y)\| + \|\sigma(t,x)-\sigma(t,y)\| \leq K\|x-y\|$）和线性增长条件（$\|b(t,x)\|^2 + \|\sigma(t,x)\|^2 \leq K^2(1+\|x\|^2)$）。则 SDE 存在唯一的强解（strong solution）$X_t$，且 $X_t$ 具有连续样本路径，满足 $\mathbb{E}[\sup_{0 \leq t \leq T} \|X_t\|^2] < \infty$。

**证明**：利用 Picard 迭代 $X_t^{(0)} = \xi$，$X_t^{(n+1)} = \xi + \int_0^t b(s, X_s^{(n)}) ds + \int_0^t \sigma(s, X_s^{(n)}) dW_s$。由 Lipschitz 条件，$\mathbb{E}[\sup_{0 \leq s \leq t} \|X_s^{(n+1)} - X_s^{(n)}\|^2] \leq C \int_0^t \mathbb{E}[\|X_s^{(n)} - X_s^{(n-1)}\|^2] ds$。由 Gronwall 不等式，序列在 $L^2$ 中收敛，且极限满足 SDE。唯一性由类似的 Gronwall 论证给出。$\blacksquare$

**定义 135.5**（强解与弱解）：**强解**是给定 Brown 运动 $W$ 和滤子 $\mathcal{F}_t^W$ 下的解，$X_t$ 是 $\mathcal{F}_t^W$-适应的。**弱解**是 $(X, W)$ 在某个概率空间上的联合分布满足 SDE，不要求 $X_t$ 适应于 $\mathcal{F}_t^W$。弱解的存在性条件比强解弱（仅需连续性和线性增长），且弱解在分布意义下唯一时称为弱唯一性。Yamada-Watanabe 定理（1971）指出：弱解存在 + 轨道唯一性 $\Rightarrow$ 强解存在且唯一。

**定理 135.11**（Feynman-Kac 公式）：设 $u(t, x)$ 满足抛物型 PDE：
$$\frac{\partial u}{\partial t} + \frac{1}{2} \sigma^2(x) \frac{\partial^2 u}{\partial x^2} + b(x) \frac{\partial u}{\partial x} - r(x) u + f(x) = 0, \quad u(T, x) = g(x)$$
则 $u(t, x)$ 有概率表示：
$$u(t, x) = \mathbb{E}^{t,x}\left[\int_t^T e^{-\int_t^s r(X_u) du} f(X_s) ds + e^{-\int_t^T r(X_u) du} g(X_T)\right]$$
其中 $X_t$ 是 SDE $dX_s = b(X_s) ds + \sigma(X_s) dW_s$ 的解（$X_t = x$）。Feynman-Kac 公式将 PDE 的解表示为随机过程的期望，是随机分析和偏微分方程之间的核心桥梁，也是 Monte Carlo 方法求解高维 PDE 的理论基础。

**证明**：对 $M_s = e^{-\int_t^s r(X_u) du} u(s, X_s)$ 应用 Itô 公式，利用 $u$ 满足的 PDE，得 $dM_s = -e^{-\int_t^s r du} f(X_s) ds + (\text{鞅项})$。取期望 $\mathbb{E}^{t,x}[M_T] = u(t,x) - \mathbb{E}^{t,x}[\int_t^T e^{-\int_t^s r du} f(X_s) ds]$。由终端条件 $M_T = e^{-\int_t^T r du} g(X_T)$，即得 Feynman-Kac 表示。$\blacksquare$

**定理 135.12**（Markov 性与生成元）：SDE 的解 $X_t$ 是强 Markov 过程，其无穷小生成元为：
$$\mathcal{L} f(x) = \sum_i b_i(x) \frac{\partial f}{\partial x_i} + \frac{1}{2} \sum_{i,j} (\sigma\sigma^T)_{ij}(x) \frac{\partial^2 f}{\partial x_i \partial x_j}$$

生成元 $\mathcal{L}$ 是 Itô 公式的期望形式：$\mathbb{E}^x[f(X_t)] - f(x) = \mathbb{E}^x[\int_0^t \mathcal{L}f(X_s) ds]$。Markov 过程的半群 $P_t f(x) = \mathbb{E}^x[f(X_t)]$ 满足 Kolmogorov 向后方程 $\frac{\partial}{\partial t} P_t f = \mathcal{L} P_t f$ 和向前方程（Fokker-Planck 方程）$\frac{\partial}{\partial t} p(t,x) = \mathcal{L}^* p(t,x)$（$p(t,x)$ 为转移密度）。

**定理 135.13**（Black-Scholes 公式）：在 Black-Scholes 模型中，股票价格 $dS_t = \mu S_t dt + \sigma S_t dW_t$，欧式看涨期权的价格为：
$$C(S, t) = S \Phi(d_1) - K e^{-r(T-t)} \Phi(d_2)$$
其中 $d_1 = \frac{\ln(S/K) + (r + \sigma^2/2)(T-t)}{\sigma\sqrt{T-t}}$，$d_2 = d_1 - \sigma\sqrt{T-t}$，$\Phi$ 为标准正态分布函数。

**证明**：由 Feynman-Kac 公式（或等价地，由 Girsanov 定理在风险中性测度下），$C(S,t) = e^{-r(T-t)} \mathbb{E}^{\tilde{P}}[(S_T - K)^+ \mid S_t = S]$。在 $\tilde{P}$ 下，$S_T = S \exp(\sigma \tilde{W}_{T-t} + (r - \sigma^2/2)(T-t))$。直接计算期望即得 Black-Scholes 公式。$\blacksquare$

---