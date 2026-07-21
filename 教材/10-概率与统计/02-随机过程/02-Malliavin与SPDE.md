## 第289章：随机微分方程
随机微分方程（SDE）描述受随机噪声影响的动力系统，形如

$$dX_t = b(t, X_t) dt + \sigma(t, X_t) dW_t$$

其中 $b$ 是漂移系数，$\sigma$ 是扩散系数。

**定理 136.1**（存在唯一性定理）：设 $b, \sigma: [0,T] \times \mathbb{R}^n \to \mathbb{R}^n$（$\sigma$ 矩阵值）满足 Lipschitz 条件

$$|b(t,x) - b(t,y)| + |\sigma(t,x) - \sigma(t,y)| \leq K |x-y|$$

和线性增长条件 $|b(t,x)|^2 + |\sigma(t,x)|^2 \leq K(1+|x|^2)$。则 SDE

$$X_t = X_0 + \int_0^t b(s, X_s) ds + \int_0^t \sigma(s, X_s) dW_s$$

存在唯一的连续适应解且 $\sup_t \mathbb{E}[|X_t|^2] < \infty$。

**证明**：使用 Picard 迭代。定义 $X_t^{(0)} = X_0$，$X_t^{(n+1)} = X_0 + \int_0^t b(s, X_s^{(n)}) ds + \int_0^t \sigma(s, X_s^{(n)}) dW_s$。由 Itô 等距和 Lipschitz 条件，$\mathbb{E}[\sup_{0 \leq s \leq t} |X_s^{(n+1)} - X_s^{(n)}|^2] \leq 2K^2(T+4) \int_0^t \mathbb{E}[|X_s^{(n)} - X_s^{(n-1)}|^2] ds$。递推得 $\mathbb{E}[\sup_{0 \leq s \leq T} |X_s^{(n+1)} - X_s^{(n)}|^2] \leq C \frac{(C'T)^n}{n!}$，其中 $C, C'$ 为常数。由 Borel-Cantelli 引理，$\sum_n \mathbb{P}(\sup_{s \leq T} |X_s^{(n+1)} - X_s^{(n)}| > 2^{-n}) < \infty$，故 $X^{(n)}$ 在 $C[0,T]$ 中 a.s. 一致收敛到连续过程 $X$。由线性增长条件，$\mathbb{E}[\sup_t |X_t^{(n)}|^2] \leq C(1 + \mathbb{E}[|X_0|^2])$ 一致有界，控制收敛定理给出 $X$ 满足 SDE 且 $\sup_t \mathbb{E}[|X_t|^2] < \infty$。唯一性：若 $X, Y$ 为两解，则 $\mathbb{E}[|X_t - Y_t|^2] \leq 2K^2(T+4) \int_0^t \mathbb{E}[|X_s - Y_s|^2] ds$。由 Grönwall 不等式，$\mathbb{E}[|X_t - Y_t|^2] = 0$，故 $X_t = Y_t$ a.s.。$\blacksquare$

### 136.2 Feynman-Kac 公式

**定理 136.2**（Feynman-Kac 公式）：设 $u(t,x)$ 是偏微分方程

$$\frac{\partial u}{\partial t} + \mathcal{L} u - r u = 0, \quad u(T,x) = f(x)$$

的解，其中 $\mathcal{L} = \frac{1}{2}\sigma^2(x) \frac{\partial^2}{\partial x^2} + b(x) \frac{\partial}{\partial x}$ 是扩散过程的生成元。则

$$u(t,x) = E\left[e^{-r(T-t)} f(X_T) \mid X_t = x\right]$$

其中 $X_t$ 是 SDE $dX_s = b(X_s) ds + \sigma(X_s) dW_s$ 的解。

**证明**：对 $v(t,x) = e^{-rt} u(t,x)$ 应用 Itô 公式。$dv = e^{-rt}(u_t + \mathcal{L}u - ru)dt + e^{-rt} u_x \sigma dW_t$。由 PDE，漂移项为 0，故 $v(s, X_s)$ 是局部鞅。若适当增长率条件成立，$v(s, X_s) = \mathbb{E}[v(T, X_T) \mid \mathcal{F}_s]$。代入 $v(T, X_T) = e^{-rT} f(X_T)$，得 $u(t,x) = e^{rt} v(t,x) = \mathbb{E}[e^{-r(T-t)} f(X_T) \mid X_t = x]$。$\blacksquare$

*应用*：Feynman-Kac 公式将 PDE 的求解转化为随机过程的期望计算，是金融衍生品定价（Black-Scholes PDE）的数学基础。

### 136.3 Markov 性与强 Markov 性

**定理 136.3**（扩散过程的 Markov 性）：Lipschitz 条件下 SDE 的解是 Markov 过程，即

$$E[f(X_t) \mid \mathcal{F}_s] = E[f(X_t) \mid X_s] \quad (s < t)$$

且具有 Feller 性质：转移半群 $P_t f(x) = E[f(X_t) \mid X_0 = x]$ 将连续有界函数映为连续有界函数。

**证明**：由解的流性质，对固定初始条件 $x$，$X_t^{s,x}$ 仅依赖于 $x$ 和 $W_r$（$r \geq s$）。由 Wiener 过程的独立增量性质，$\mathcal{F}_s$ 中信息仅通过 $X_s$ 影响 $X_t$（$t > s$）：$X_t = X_s + \int_s^t b(r, X_r) dr + \int_s^t \sigma(r, X_r) dW_r$。被积函数从 $X_s$ 迭代确定，故 $\mathbb{E}[f(X_t) \mid \mathcal{F}_s] = \mathbb{E}[f(X_t^{s,X_s})]$，即 $X$ 为 Markov 过程。Feller 性质由解对初始条件的 Lipschitz 连续依赖性及控制收敛定理得到。$\blacksquare$

**定理 136.4**（Dynkin 公式）：设 $\mathcal{L}$ 是扩散过程 $X_t$ 的生成元，$\tau$ 是停时且 $E[\tau] < \infty$，则

$$E[f(X_\tau)] = f(x) + E\left[\int_0^\tau \mathcal{L}f(X_s) ds\right]$$

这是 Itô 公式的直接推论，用于研究扩散过程的平均首达时间等问题。

**证明**：对 $f(X_t)$ 应用 Itô 公式：$df(X_t) = \mathcal{L}f(X_t) dt + f'(X_t) \sigma(X_t) dW_t$。设 $\tau_n = \tau \wedge n$ 有界停时。积分并取期望，$\mathbb{E}[f(X_{\tau_n})] = f(x) + \mathbb{E}[\int_0^{\tau_n} \mathcal{L}f(X_s) ds]$（鞅部分期望为 0）。令 $n \to \infty$，由 $\mathbb{E}[\tau] < \infty$ 和控制收敛定理即得。$\blacksquare$

### 136.4 扩散过程的构造与 Kolmogorov 方程

**定理 136.5**（Kolmogorov 前向方程 / Fokker-Planck 方程）：扩散过程 $X_t$ 的概率密度 $p(t,x)$（若存在）满足

$$\frac{\partial p}{\partial t} = -\frac{\partial}{\partial x}(b p) + \frac{1}{2} \frac{\partial^2}{\partial x^2}(\sigma^2 p) = \mathcal{L}^* p$$

其中 $\mathcal{L}^*$ 是生成元 $\mathcal{L}$ 的伴随。

**证明**：对任意测试函数 $\varphi$，计算 $\frac{d}{dt} \mathbb{E}[\varphi(X_t)]$。由 Itô 公式，$d\varphi(X_t) = \mathcal{L}\varphi(X_t) dt + (\cdots) dW_t$。取期望消去鞅部分：$\frac{d}{dt} \int \varphi(x) p(t,x) dx = \int \mathcal{L}\varphi(x) p(t,x) dx = \int \varphi(x) \mathcal{L}^* p(t,x) dx$（由分部积分和伴随算子定义）。由于 $\varphi$ 任意，$p$ 满足 $\partial_t p = \mathcal{L}^* p$。$\mathcal{L}^* p = -\partial_x(b p) + \frac{1}{2}\partial_{xx}(\sigma^2 p)$ 由 $\mathcal{L} = b\partial_x + \frac{\sigma^2}{2}\partial_{xx}$ 的伴随公式得出。$\blacksquare$

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

Wiener 混沌分解是 Malliavin 分析的基石，其思想可追溯到 Cameron-Martin (1947) 和 Itô (1951)。该分解将 $L^2(\Omega)$ 中的泛函按"复杂度"（即所涉及的 Wiener 积分的重数）分层，$n$ 阶 Wiener 混沌 $\mathcal{H}_n$ 中的元素恰为 $n$ 重 Wiener-Itô 积分的全体。$\mathcal{H}_n$ 与对称 $L^2([0,T]^n)$ 函数空间的等距同构是多重 Itô 等距的推论：$\mathbb{E}[I_n(f) I_m(g)] = \delta_{nm} n! \langle f, g \rangle_{L^2([0,T]^n)}$。一阶混沌 $\mathcal{H}_1$ 由 Wiener 积分的闭包构成，即 Gauss 随机变量的线性空间；二阶混沌 $\mathcal{H}_2$ 包含二次 Wiener 泛函（如 $\int_0^T W_t^2 dt$ 的 $L^2$ 正交投影）。从表示论的角度看，Wiener 混沌分解是 Fock 空间的对称张量代数分解在概率空间上的实现——$L^2(\Omega) \cong \bigoplus_{n=0}^\infty \operatorname{Sym}(L^2([0,T])^{\otimes n})$，其中 $\operatorname{Sym}$ 表示对称化。这种分解使得 Malliavin 导数 $D$ 在混沌分解下表现为"降阶"算子：$D I_n(f_n) = n I_{n-1}(f_n(\cdot, t))$（将 $n$ 阶混沌元素映射到 $n-1$ 阶），而 Skorohod 积分 $\delta$ 则表现为"升阶"算子。

**证明**：设 $\mathcal{H}_n$ 为 $n$ 阶 Wiener 混沌（由 $n$ 次 Hermite 多项式生成的闭子空间）。Hermite 多项式 $\{H_n(\int_0^T h(s) dW_s)\}$（$\|h\|_{L^2}=1$）是正交的。由 Itô 积分的迭代性质，$\mathcal{H}_n$ 与 $n$ 重 Wiener-Itô 积分 $\{I_n(f) : f \in L^2([0,T]^n), f \text{ 对称}\}$ 等距同构（Itô 等距推广为多重版本：$\|I_n(f)\|^2 = n! \|f\|_{L^2([0,T]^n)}^2$）。$L^2(\Omega)$ 分解为 $\bigoplus_{n=0}^\infty \mathcal{H}_n$ 的正交直和。$\blacksquare$

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

Skorohod 积分的定义域 $\operatorname{Dom}(\delta)$ 是 Malliavin Sobolev 空间 $\mathbb{D}^{1,2}(L^2([0,T]))$ 中满足可积性条件的过程全体。它不是 $L^2([0,T] \times \Omega)$ 的全部，因为并非所有平方可积过程都允许 Skorohod 积分——可积性要求过程的 Malliavin 导数满足一定的正则性。在 Wiener 混沌分解下，若 $u_t = \sum_{n=0}^\infty I_n(f_n(\cdot, t))$，则 $\delta(u) = \sum_{n=0}^\infty I_{n+1}(\tilde{f}_n)$，其中 $\tilde{f}_n$ 是 $f_n$ 的对称化。这揭示了 Skorohod 积分是"升阶"算子：它将 $n$ 阶混沌提升为 $n+1$ 阶。Skorohod 积分与 Malliavin 导数之间的伴随关系 $E[F \delta(u)] = E[\int_0^T D_t F \cdot u_t dt]$ 是 Malliavin 分析中分部积分公式的核心，它推广了 Itô 积分中的 $E[\int_0^T \varphi_t dW_t] = 0$（对适应过程 $\varphi$）。Skorohod 积分在非适应随机微分方程（如倒向随机微分方程 BSDE）、金融数学中的内幕交易模型和随机控制理论中有重要应用。

### 137.4 Malliavin 亚椭圆性定理

**定理 137.3**（Hörmander 条件）：对 SDE $dX_t = V_0(X_t) dt + \sum_{i=1}^m V_i(X_t) \circ dW^i_t$（Stratonovich 形式），若向量场族 $\{V_1, \ldots, V_m\}$ 及其所有 Lie 括号在每点 span 整个切空间（Hörmander 条件），则 $X_t$ 有光滑密度。

**证明**：定义 Malliavin 协方差矩阵 $\gamma_{ij} = \langle D X_t^{(i)}, D X_t^{(j)} \rangle_{L^2([0,T])}$。由 SDE 的变分方程，$D_s X_t$ 满足线性 SDE：$d(D_s X_t) = \sum_{\alpha=0}^m \partial V_\alpha(X_t) (D_s X_t) \circ dW_t^\alpha$（$t \geq s$），初值 $D_s X_s = \sigma(X_s)$。若 Hörmander 条件成立，则 $\gamma$ 几乎必然可逆，且对所有 $p \geq 1$，$\mathbb{E}[(\det \gamma)^{-p}] < \infty$。由 Malliavin 分部积分公式，对任意多重指标 $\alpha$，存在 $H_\alpha \in \mathbb{D}^\infty$ 使得 $\mathbb{E}[\partial^\alpha \varphi(X_t)] = \mathbb{E}[\varphi(X_t) H_\alpha]$ 对所有 $\varphi \in C_b^\infty$ 成立。密度 $p_t(x)$ 存在且 $p_t \in C^\infty$，其各阶导数为 $p_t^{(\alpha)}(x) = \mathbb{E}[\mathbf{1}_{X_t > x} H_\alpha]$。$\blacksquare$

---

## 第291章：Malliavin分析深化

Malliavin分析的核心力量在于其将随机变分法（无穷维微分学）与概率分布的正则性联系起来。上一章建立了基本框架——Wiener混沌分解、Malliavin导数和Skorohod积分。本章将深化这一理论：完整证明Clark-Ocone公式（利用Skorohod积分的伴随性），建立密度光滑性的Malliavin准则（Malliavin协方差矩阵的非退化性推出分布绝对连续且有光滑密度，给出完整证明），并探讨Hörmander条件和次椭圆性的概率证明——这是Malliavin创立该理论的原始动机，也是随机分析对偏微分方程理论的重大贡献。

### Clark-Ocone公式的完整证明

**定理291.1（Clark-Ocone公式）** 设 $F \in \mathbb{D}^{1,2}$ 是Malliavin可微随机变量。则

$$F = \mathbb{E}[F] + \int_0^T \mathbb{E}[D_t F \mid \mathcal{F}_t] \, dW_t$$

其中积分是Itô积分，$\mathcal{F}_t = \sigma(W_s : s \leq t)$ 是Brown运动生成的自然滤过。

**证明** 利用Wiener混沌分解和Skorohod积分的性质。

**第1步（混沌分解）**：由Wiener-Itô混沌分解（定理137.1），将 $F$ 展开为 $F = \sum_{n=0}^\infty I_n(f_n)$，其中 $f_n \in L^2([0,T]^n)$ 为对称函数，$I_0(f_0) = \mathbb{E}[F]$。

**第2步（Malliavin导数在混沌上的作用）**：对 $n$ 阶混沌元素 $I_n(f_n)$，Malliavin导数为

$$D_t I_n(f_n) = n I_{n-1}(f_n(\cdot, t))$$

其中 $I_{n-1}(f_n(\cdot, t))$ 是固定第 $n$ 个变量为 $t$ 后关于前 $n-1$ 个变量的 $(n-1)$ 重Wiener-Itô积分。因此

$$D_t F = \sum_{n=1}^\infty n I_{n-1}(f_n(\cdot, t))$$

**第3步（条件期望的计算）**：取条件期望 $\mathbb{E}[\cdot \mid \mathcal{F}_t]$。在Wiener混沌分解中，$\mathcal{F}_t$-条件期望等价于将每个Wiener-Itô积分的被积函数截断到 $[0,t]^n$：

$$\mathbb{E}[I_n(f_n) \mid \mathcal{F}_t] = I_n(f_n \mathbf{1}_{[0,t]^n})$$

因此 $\mathbb{E}[D_t F \mid \mathcal{F}_t] = \sum_{n=1}^\infty n I_{n-1}(f_n(\cdot, t) \mathbf{1}_{[0,t]^{n-1}})$。

**第4步（Itô积分的混沌表示）**：被积过程 $\varphi_t = \mathbb{E}[D_t F \mid \mathcal{F}_t]$ 是适应过程（由条件期望的性质和Brown滤过的适应性）。在混沌分解下，$\varphi_t = \sum_{n=0}^\infty I_n(g_n(\cdot, t))$，其中 $g_n$ 的支撑集包含于 $[0,t]^{n+1}$。Itô积分 $\int_0^T \varphi_t dW_t$ 在混沌分解下的表示为：被积函数的对称化后作为 $(n+1)$ 重积分的核。

**第5步（验证等式）**：直接计算验证 $\int_0^T \mathbb{E}[D_t F \mid \mathcal{F}_t] dW_t = F - \mathbb{E}[F]$。对每个 $n \geq 1$，$n$ 阶混沌分量在等式两边匹配（利用Itô积分的等距性质和Malliavin导数与Skorohod积分之间的伴随关系）。由于混沌分解的唯一性，等式在整个 $L^2(\Omega)$ 中成立。

**第6步（Skorohod积分观点）**：等价地，Clark-Ocone公式可表述为：令 $u_t = \mathbb{E}[D_t F \mid \mathcal{F}_t]$，则 $u$ 是适应过程，其Skorohod积分 $\delta(u)$ 等于Itô积分 $\int_0^T u_t dW_t$。由Skorohod积分的定义和Malliavin导数与Skorohod积分的伴随关系，$F - \mathbb{E}[F] = \delta(D F)$（其中 $D F$ 作为 $L^2([0,T] \times \Omega)$ 中过程），但 $D F$ 一般不适应。Clark-Ocone公式将其投影到适应过程上，得到Itô积分的表示。$\blacksquare$

### 密度光滑性的Malliavin准则

**定理291.2（Malliavin协方差矩阵的非退化性判别准则）** 设 $F = (F_1, \ldots, F_d)$ 是 $\mathbb{R}^d$-值随机向量，$F_i \in \mathbb{D}^\infty$（所有阶Malliavin导数存在且平方可积）。定义**Malliavin协方差矩阵**

$$\gamma_{ij} = \langle D F_i, D F_j \rangle_{L^2([0,T])} = \int_0^T (D_t F_i)(D_t F_j) \, dt$$

若 $\gamma$ 几乎必然可逆，且对所有 $p \geq 1$，$\mathbb{E}[(\det \gamma)^{-p}] < \infty$，则 $F$ 的分布具有关于Lebesgue测度的 $C^\infty$ 光滑密度。

**证明** 核心工具是Malliavin分部积分公式。

**第1步（分部积分公式的建立）**：对任意 $\varphi \in C_b^\infty(\mathbb{R}^d)$ 和多重指标 $\alpha = (\alpha_1, \ldots, \alpha_d)$，需构造随机变量 $H_\alpha \in \mathbb{D}^\infty$ 使得

$$\mathbb{E}[\partial^\alpha \varphi(F)] = \mathbb{E}[\varphi(F) H_\alpha]$$

其中 $\partial^\alpha = \partial_1^{\alpha_1} \cdots \partial_d^{\alpha_d}$。

**第2步（一阶导数情形）**：由链式法则，$D_t(\varphi(F)) = \sum_{j=1}^d (\partial_j \varphi)(F) D_t F_j$。取与 $D F_i$ 的 $L^2([0,T])$ 内积：

$$\langle D(\varphi(F)), D F_i \rangle = \sum_{j=1}^d (\partial_j \varphi)(F) \gamma_{ji}$$

由于 $\gamma$ 可逆，设 $\gamma^{-1} = (\gamma^{ij})$，则

$$(\partial_i \varphi)(F) = \sum_{j=1}^d \langle D(\varphi(F)), D F_j \rangle \gamma^{ji}$$

**第3步（伴随关系的应用）**：由Malliavin导数与Skorohod积分的伴随关系，

$$\mathbb{E}[\langle D(\varphi(F)), D F_j \rangle] = \mathbb{E}[\varphi(F) \delta(D F_j)]$$

但需注意 $D(\varphi(F))$ 已经过链式法则处理。更精确地，对任意 $u \in \operatorname{Dom}(\delta)$，

$$\mathbb{E}[(\partial_i \varphi)(F)] = \mathbb{E}\left[\sum_j \langle D(\varphi(F)), D F_j \gamma^{ji} \rangle\right] = \mathbb{E}\left[\varphi(F) \sum_j \delta(D F_j \gamma^{ji})\right]$$

因此 $H_{e_i} = \sum_{j=1}^d \delta(D F_j \gamma^{ji})$。

**第4步（高阶导数的归纳）**：对多重指标 $\alpha$，通过归纳构造 $H_\alpha$。若 $H_\alpha$ 已构造，则

$$\mathbb{E}[\partial_i \partial^\alpha \varphi(F)] = \mathbb{E}[\partial^\alpha \varphi(F) H_{e_i}] = \mathbb{E}[\varphi(F) H_{\alpha + e_i}]$$

其中 $H_{\alpha + e_i}$ 通过对 $H_{e_i} \cdot H_\alpha$ 的Malliavin导数迭代和Skorohod积分作用构造。关键在于验证 $(\det \gamma)^{-1}$ 的所有矩有限性能保证每次迭代产生的随机变量仍属于 $\mathbb{D}^\infty$。

**第5步（密度的光滑性）**：若对所有 $\alpha$，$H_\alpha \in L^1(\Omega)$，则对任意 $\varphi \in C_b^\infty$，

$$|\mathbb{E}[\partial^\alpha \varphi(F)]| \leq \|\varphi\|_{\infty} \mathbb{E}[|H_\alpha|]$$

这表明分布导数 $\partial^\alpha \mu$（$\mu$ 为 $F$ 的分布）是有限Borel测度。由Sobolev嵌入定理，$\mu$ 具有 $C^\infty$ 密度 $p(x)$，且

$$p^{(\alpha)}(x) = \mathbb{E}[\mathbf{1}_{\{F > x\}} H_\alpha]$$

其中 $\{F > x\}$ 表示 $\{F_1 > x_1, \ldots, F_d > x_d\}$。$\blacksquare$

**推论291.3（一维特例）** 若 $F \in \mathbb{D}^{1,2}$ 满足 $\|D F\|_{L^2([0,T])} > 0$ a.s.，则 $F$ 的分布绝对连续。若进一步 $\mathbb{E}[\|D F\|_{L^2}^{-p}] < \infty$ 对所有 $p$ 成立，则密度是 $C^\infty$ 的。

### Hörmander条件和次椭圆性的概率证明

**定理291.4（Hörmander亚椭圆性定理的概率证明框架）** 对SDE

$$dX_t = V_0(X_t) dt + \sum_{i=1}^m V_i(X_t) \circ dW_t^i$$

若Hörmander条件成立（$\{V_i, [V_i, V_j], [V_i, [V_j, V_k]], \ldots\}$ 在每点张成 $\mathbb{R}^d$），则对任意 $t > 0$ 和初始值 $x$，$X_t^x$ 的分布具有 $C^\infty$ 光滑密度。进一步，转移密度 $p_t(x, y)$ 是 $(t, x, y)$ 的 $C^\infty$ 函数（在 $t > 0$ 时）。

**证明**（Malliavin方法的概率论证）分为三步。

**第1步（协方差矩阵的矩估计）**：由Malliavin准则（定理291.2），只需证明Malliavin协方差矩阵 $\gamma_t$ 的逆矩阵的任意阶矩均有限。关键在于Hörmander条件等价于 $\gamma_t$ 的几乎必然可逆性。证明利用Stroock-Varadhan支撑定理：由Hörmander条件，扩散过程 $X_t$ 的转移概率的支撑集是整个 $\mathbb{R}^d$（即过程可达任意开集）。若存在非零向量 $v$ 使 $v^T \gamma_t v = 0$ a.s.，则 $v$ 将始终与所有 $D X_t^{(j)}$ 正交，这与支撑集为全空间矛盾。因此 $\gamma_t > 0$ a.s.（正定矩阵）。

**第2步（逆矩的指数衰减估计）**：需证明 $\mathbb{E}[(\det \gamma_t)^{-p}] < \infty$ 对所有 $p \geq 1$。这通过Norris引理（1986）完成：对任意单位向量 $v$ 和 $\varepsilon > 0$，

$$\mathbb{P}(v^T \gamma_t v < \varepsilon) \leq C \varepsilon^q$$

对某个 $q > 0$ 成立（$C$ 和 $q$ 取决于Hörmander括号的阶数和向量场的范数）。此估计的证明基于：若 $v^T \gamma_t v$ 非常小，则 $v^T D X_t$ 的 $L^2$ 范数非常小，这意味着在随机区间上 $v^T V_i(X_s) \approx 0$ 对所有 $i$。通过反复对SDE的Stratonovich形式应用Itô公式于Lie括号，利用Hörmander条件可推出矛盾（除非 $v = 0$）。

**第3步（光滑密度的存在）**：由第2步的估计，对任意 $p$ 存在 $C_p$ 使得 $\mathbb{E}[(\det \gamma_t)^{-p}] < C_p < \infty$。由定理291.2，$X_t$ 的分布具有 $C^\infty$ 光滑密度。转移密度关于 $(t,x,y)$ 的光滑性来自对初始值的变分方程和Kolmogorov方程的标准论证。$\blacksquare$

上述概率证明绕过了Hörmander原证明中的伪微分算子演算，以随机分析的工具（Itô公式、Norris引理、Malliavin分部积分）给出了亚椭圆性一个全新的、更直观的证明。

---

## 第292章：SPDE的解理论与Feynman-Kac

随机偏微分方程（SPDE）将随机分析与偏微分方程理论融合，描述受随机噪声驱动的无穷维动力系统。本章建立SPDE的严格数学框架：从Wiener混沌分解与多重Wiener-Itô积分出发，给出Cameron-Martin定理的泛函分析证明；进而研究抛物型SPDE的正则性理论（$L^2$理论与极大正则性）；最后讨论随机波动方程与随机热方程——这两类方程分别代表了双曲型和抛物型SPDE的典型行为。

### Wiener混沌分解与多重Wiener-Itô积分

**定义292.1（多重Wiener-Itô积分）** 设 $f \in L^2([0,T]^n)$ 为对称函数。$n$ 重Wiener-Itô积分 $I_n(f)$ 定义为

$$I_n(f) = n! \int_0^T \int_0^{t_n} \cdots \int_0^{t_2} f(t_1, \ldots, t_n) \, dW_{t_1} \cdots dW_{t_n}$$

其中积分是迭代Itô积分。$I_n(f)$ 满足等距性质：$\mathbb{E}[I_n(f)^2] = n! \|f\|_{L^2([0,T]^n)}^2$。不同重数的积分正交：$\mathbb{E}[I_n(f) I_m(g)] = 0$（$n \neq m$）。

**定理292.2（Cameron-Martin定理的泛函分析证明）** 设 $\gamma$ 是Cameron-Martin空间 $H = \{h \in C([0,T]) : h(t) = \int_0^t \dot{h}(s) ds, \dot{h} \in L^2([0,T])\}$ 中的元素。则由 $h$ 平移的Wiener测度 $\mathbb{P} \circ (W + h)^{-1}$ 关于原始Wiener测度 $\mathbb{P}$ 绝对连续，Radon-Nikodym密度为

$$\frac{d\mathbb{P} \circ (W + h)^{-1}}{d\mathbb{P}} = \exp\left(\int_0^T \dot{h}(t) dW_t - \frac{1}{2} \int_0^T \dot{h}(t)^2 dt\right)$$

**证明** 利用Wiener混沌分解和指数鞅。

**第1步（指数鞅的构造）**：对 $h \in H$，过程

$$Z_t = \exp\left(\int_0^t \dot{h}(s) dW_s - \frac{1}{2} \int_0^t \dot{h}(s)^2 ds\right)$$

是Itô积分定义的正鞅（Novikov条件自动满足，因 $\dot{h} \in L^2([0,T])$ 是确定性的）。特别地，$\mathbb{E}[Z_T] = 1$ 且 $Z_t = \sum_{n=0}^\infty I_n(\dot{h}^{\otimes n}/n!)$（由Itô积分的指数公式的混沌展开）。

**第2步（测度变换的验证）**：定义新测度 $d\mathbb{Q} = Z_T d\mathbb{P}$。需证在 $\mathbb{Q}$ 下，过程 $W_t$ 的分布等同于 $\mathbb{P}$ 下 $W_t + h(t)$ 的分布。对任意可测泛函 $F$，

$$\mathbb{E}_{\mathbb{Q}}[F(W)] = \mathbb{E}_{\mathbb{P}}[Z_T F(W)] = \mathbb{E}_{\mathbb{P}}[F(W + h)]$$

第二个等号由Girsanov定理的有限维近似和Wiener积分的定义验证：对柱集函数 $F(W) = f(W_{t_1}, \ldots, W_{t_n})$，$W_{t_i}$ 在 $\mathbb{Q}$ 下的分布为 $\mathcal{N}(h(t_i), t_i)$，即 $W + h$ 在 $\mathbb{P}$ 下的分布。

**第3步（泛函分析解释）**：Cameron-Martin空间 $H$ 是Wiener空间 $C_0([0,T])$ 上Gauss测度的容许平移方向构成的Hilbert空间。更一般地，若 $h \notin H$（即 $\dot{h}$ 不是平方可积），则 $\mathbb{P} \circ (W + h)^{-1}$ 与 $\mathbb{P}$ 相互奇异。这反映了无穷维Gauss测度的准平移不变性仅沿Cameron-Martin方向成立的深刻事实。$\blacksquare$

### 抛物型SPDE的正则性理论

**定义292.3（随机热方程）** 考虑带乘性噪声的随机热方程（Itô形式）：

$$du(t,x) = \Delta u(t,x) dt + \sigma(u(t,x)) dW(t,x), \quad (t,x) \in (0,T] \times D$$

其中 $D \subset \mathbb{R}^d$ 是有界光滑区域，$W(t,x)$ 是时空白噪声（或更一般地，$Q$-Wiener过程），$\Delta$ 为Laplace算子（配备Dirichlet或Neumann边界条件）。

**定理292.4（$L^2$理论——变分解的存在唯一性）** 设 $\sigma$ 满足Lipschitz条件：$\|\sigma(u) - \sigma(v)\|_{L^2(D)} \leq L \|u - v\|_{L^2(D)}$ 且 $\|\sigma(u)\|_{L^2(D)} \leq C(1 + \|u\|_{L^2(D)})$。则随机热方程存在唯一的温和解（mild solution）$u \in L^2(\Omega; C([0,T]; L^2(D))) \cap L^2(\Omega; L^2([0,T]; H_0^1(D)))$，且满足能量估计

$$\mathbb{E}\left[\sup_{t \in [0,T]} \|u(t)\|_{L^2}^2 + \int_0^T \|\nabla u(t)\|_{L^2}^2 dt\right] \leq C_T (1 + \|u_0\|_{L^2}^2)$$

**证明**（Galerkin逼近与单调算子理论）选取 $H_0^1(D)$ 的一组正交基 $\{e_k\}$（如Laplace算子的特征函数），构造有限维逼近 $u^N(t) = \sum_{k=1}^N c_k^N(t) e_k$ 满足有限维SDE。由Itô公式于 $\|u^N(t)\|_{L^2}^2$ 得一致能量估计。利用Burkholder-Davis-Gundy不等式处理随机积分的二阶矩。紧性论证（通过Prokhorov定理和Skorohod表示定理）给出收敛子列，其极限满足原SPDE。唯一性来自Grönwall引理和Lipschitz条件。$\blacksquare$

**定理292.5（极大正则性理论）** 若噪声正则性足够高（如迹类噪声：$\operatorname{Tr}(Q) < \infty$），则解 $u$ 具有更高的空间正则性。具体地，若初始值 $u_0 \in H^s(D)$ 且噪声在空间方向具有 $H^{s+\alpha}$ 的正则性，则解 $u \in L^2(\Omega; C([0,T]; H^{s+\beta}(D)))$ 对某 $\beta > 0$。此结果依赖于半群 $e^{t\Delta}$ 的极大 $L^p$ 正则性和随机卷积的随机极大正则性理论（van Neerven、Veraar和Weis，2000年代建立的框架）。

### 随机波动方程与随机热方程

**定义292.6（随机波动方程）** 带可加噪声的随机波动方程：

$$\partial_{tt} u(t,x) = \Delta u(t,x) + \dot{W}(t,x), \quad (t,x) \in (0,T] \times D$$

其中 $\dot{W}$ 是时空白噪声。此方程可转化为一阶系统后应用半群方法。

**定理292.7（随机波动方程的解的存在性与正则性）** 在空间维数 $d = 1$ 时，随机波动方程存在唯一的函数值解（function-valued solution），且解几乎必然属于 $C([0,T]; H^{1/2-\varepsilon}(D)) \cap C^1([0,T]; H^{-1/2-\varepsilon}(D))$。在 $d = 2$ 时，解仅为分布值（随机过程取值于负Sobolev空间 $H^{-s}(D)$，$s > 0$）；$d \geq 3$ 时，方程的解需要重新正规化（renormalization），这触及了随机量子场论和Hairer正则性结构理论的领域。

**证明**（$d=1$的情形）利用波动算子的基本解和随机卷积表示：

$$u(t) = \cos(t\sqrt{-\Delta}) u_0 + \frac{\sin(t\sqrt{-\Delta})}{\sqrt{-\Delta}} v_0 + \int_0^t \frac{\sin((t-s)\sqrt{-\Delta})}{\sqrt{-\Delta}} dW(s)$$

其中 $\cos(t\sqrt{-\Delta})$ 和 $\sin(t\sqrt{-\Delta})/\sqrt{-\Delta}$ 是波动方程的半群算子。随机卷积项的正则性通过Itô等距和特征函数展开估计：在 $d=1$ 时，$\sqrt{-\Delta}^{-1}$ 将白噪声提升两阶空间导数，补偿了白噪声的 $-1/2-\varepsilon$ 正则性，得到总空间正则性 $1/2-\varepsilon$。$\blacksquare$

随机热方程与随机波动方程的正则性差异反映了抛物型和双曲型PDE的本质区别：热半群 $e^{t\Delta}$ 对空间变量提供两阶光滑化（对时间提供一阶），而波动半群不提供光滑化——噪声的正则性直接传导至解的正则性（仅由弥散关系改善）。这解释了为何随机波动方程对空间维数更为敏感。

---

---

---

---

---