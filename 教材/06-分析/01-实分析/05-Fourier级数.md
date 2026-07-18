## Ch 99 Fourier 级数
### 50.1 正交系与 Bessel 不等式

**定义 50.1.1（ $L^2$ 中的规范正交系）**：$L^2([-\pi, \pi])$ 中的函数列 $\{\varphi_k\}_{k=1}^{\infty}$ 称为**规范正交系**，若

$$
\langle \varphi_i, \varphi_j \rangle = \int_{-\pi}^{\pi} \varphi_i(x) \overline{\varphi_j(x)} \, dx = \delta_{ij}
$$

**定理 50.1.1（Bessel 不等式）**：设 $\{\varphi_k\}$ 为 $L^2(E)$ 中的规范正交系，$f \in L^2(E)$。则

$$
\sum_{k=1}^{\infty} |\langle f, \varphi_k \rangle|^2 \leq \|f\|_2^2
$$

**证明**：对任意 $n$，令 $s_n = \sum_{k=1}^{n} \langle f, \varphi_k \rangle \varphi_k$。则

$$
0 \leq \|f - s_n\|_2^2 = \|f\|_2^2 - 2\langle f, s_n \rangle + \|s_n\|_2^2 = \|f\|_2^2 - 2\sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 + \sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 = \|f\|_2^2 - \sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2
$$

因此 $\sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 \leq \|f\|_2^2$。令 $n \to \infty$ 即得。$\blacksquare$

---

### 50.2 Fourier 级数的 $L^2$ 收敛

**定义 50.2.1（Fourier 系数与 Fourier 级数）**：设 $f \in L^1([-\pi, \pi])$。$f$ 的 Fourier 系数定义为

$$
a_0 = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(x) \, dx, \quad a_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \cos nx \, dx, \quad b_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \sin nx \, dx
$$

$f$ 的 Fourier 级数为

$$
f(x) \sim \frac{a_0}{2} + \sum_{n=1}^{\infty} (a_n \cos nx + b_n \sin nx)
$$

**定理 50.2.1（ $L^2$ 中 Fourier 级数的收敛性）**：设 $f \in L^2([-\pi, \pi])$。则 $f$ 的 Fourier 级数在 $L^2$ 范数下收敛到 $f$。即

$$
\lim_{N \to \infty} \left\|f - \left(\frac{a_0}{2} + \sum_{n=1}^{N} (a_n \cos nx + b_n \sin nx)\right)\right\|_2 = 0
$$

等价地，Parseval 恒等式成立：

$$
\frac{1}{\pi} \int_{-\pi}^{\pi} |f(x)|^2 \, dx = \frac{a_0^2}{2} + \sum_{n=1}^{\infty} (a_n^2 + b_n^2)
$$

**证明概要**：三角函数系在 $L^2([-\pi, \pi])$ 中是完备的规范正交系（这是 Weierstrass 逼近定理的推论——三角多项式在 $L^2$ 中稠密）。由 Hilbert 空间理论，规范正交系完备当且仅当 Parseval 恒等式成立。$\blacksquare$

---

### 50.3 Dirichlet 核与 Fejér 核

**定义 50.3.1（Dirichlet 核）**：$N$ 阶 Dirichlet 核为

$$
D_N(t) = \frac{1}{2} + \sum_{n=1}^{N} \cos nt = \frac{\sin((N + \frac{1}{2})t)}{2\sin(t/2)}
$$

Fourier 级数的部分和可表示为 $S_N f(x) = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x - t) D_N(t) \, dt$。

**定义 50.3.2（Fejér 核）**：$N$ 阶 Fejér 核为 Dirichlet 核的 Cesàro 平均：

$$
F_N(t) = \frac{1}{N+1} \sum_{k=0}^{N} D_k(t) = \frac{1}{2(N+1)} \left(\frac{\sin((N+1)t/2)}{\sin(t/2)}\right)^2
$$

Fejér 核构成**好核**：$F_N(t) \geq 0$，$\frac{1}{\pi} \int_{-\pi}^{\pi} F_N(t) dt = 1$，且对任意 $\delta > 0$，$\int_{\delta \leq |t| \leq \pi} F_N(t) dt \to 0$（$N \to \infty$）。

---

### 50.4 Fejér 定理

**定理 50.4.1（Fejér 定理）**：设 $f \in L^1([-\pi, \pi])$。则 $f$ 的 Fourier 级数的 Cesàro 平均 $\sigma_N f(x) = \frac{1}{N+1} \sum_{k=0}^{N} S_k f(x)$ 满足：

(i) 若 $f$ 在 $x$ 处连续，则 $\sigma_N f(x) \to f(x)$
(ii) 若 $f$ 在 $[-\pi, \pi]$ 上连续且 $f(-\pi) = f(\pi)$，则 $\sigma_N f \to f$ 一致收敛

**证明**：$\sigma_N f(x) = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x - t) F_N(t) dt$。由 Fejér 核是"好核"的性质，可用卷积逼近的标准论证。$\blacksquare$

**推论 50.4.2（Weierstrass 第二逼近定理）**：三角多项式在 $C([-\pi, \pi])$（周期连续函数）中关于一致范数稠密。

---

### 50.5 逐点收敛性

**定理 50.5.1（Dini 判别法）**：设 $f \in L^1([-\pi, \pi])$，$x \in [-\pi, \pi]$。若存在 $\delta > 0$ 使得

$$
\int_0^{\delta} \frac{|f(x + t) + f(x - t) - 2f(x)|}{t} \, dt < \infty
$$

则 $f$ 的 Fourier 级数在 $x$ 处收敛到 $f(x)$。特别地，若 $f$ 在 $x$ 处 Lipschitz 连续（或可导），则 Dini 条件成立。

**定理 50.5.2（Dirichlet-Jordan 判别法）**：若 $f$ 在 $x$ 的某个邻域内有界变差，则 $f$ 的 Fourier 级数在 $x$ 处收敛到 $\frac{f(x^+) + f(x^-)}{2}$。

**证明概要**（Dini 判别法）：Fourier 部分和可写为 $S_N f(x) - f(x) = \frac{1}{\pi} \int_0^{\pi} \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)} \sin((N+\frac{1}{2})t) dt$。令 $\varphi(t) = \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)}$。由 Dini 条件，$\varphi \in L^1([0, \pi])$。由 Riemann-Lebesgue 引理，$\int_0^{\pi} \varphi(t) \sin((N+\frac{1}{2})t) dt \to 0$（$N \to \infty$）。$\blacksquare$

**定理 50.5.3（Riemann-Lebesgue 引理）**：设 $f \in L^1([-\pi, \pi])$。则

$$
\lim_{|n| \to \infty} \int_{-\pi}^{\pi} f(t) e^{-int} \, dt = 0
$$

即 Fourier 系数 $a_n, b_n \to 0$（$n \to \infty$）。

**证明**：先对 $f$ 为特征函数验证（直接积分），再对简单函数，最后用 $L^1$ 中简单函数的稠密性推广到一般 $f \in L^1$。$\blacksquare$

---

**注记 50.5.1**：关于 Fourier 级数的进一步深入内容（包括分布理论、Sobolev 空间、小波分析等）将在卷十四（泛函分析）和卷二十五（调和分析）中详细展开。$\blacksquare$

---

---

---

---

---