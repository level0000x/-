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

**证明**：三角函数系 $\{\frac{1}{\sqrt{2\pi}}, \frac{\cos nx}{\sqrt{\pi}}, \frac{\sin nx}{\sqrt{\pi}}\}_{n=1}^\infty$ 在 $L^2([-\pi, \pi])$ 中是规范正交系。由 Weierstrass 第二逼近定理（推论 50.4.2），三角多项式在 $L^2$ 中稠密，故此规范正交系是完备的。由 Hilbert 空间理论，完备规范正交系中任意元素的 Fourier 展开在 $L^2$ 范数下收敛到该元素，且 Parseval 恒等式 $\|f\|_2^2 = \sum |\langle f, \varphi_k \rangle|^2$ 成立。将 $\langle f, \varphi_k \rangle$ 具体化为 Fourier 系数即得结论。$\blacksquare$

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

**证明**：设 $f$ 在 $[x-\delta, x+\delta]$ 上有界变差。将 $f$ 分解为两个单调函数之差：$f = g - h$，其中 $g, h$ 单调。对单调函数 $g$，$S_N g(x) - g(x) = \frac{1}{\pi} \int_0^\pi (g(x+t) + g(x-t) - 2g(x)) \frac{\sin((N+1/2)t)}{2\sin(t/2)} dt$。利用 Dirichlet 核的积分表示和 Jordan 分解，将积分分为两部分：$\int_0^\delta$ 和 $\int_\delta^\pi$。第一部分由单调性和三角函数积分的平均值性质（第二中值定理）控制，当 $N \to \infty$ 时趋于 $0$。第二部分由 Riemann-Lebesgue 引理趋于 $0$。综合得 $S_N f(x) \to \frac{f(x^+) + f(x^-)}{2}$。$\blacksquare$

**证明**（Dini 判别法）：Fourier 部分和可写为 $S_N f(x) - f(x) = \frac{1}{\pi} \int_0^{\pi} \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)} \sin((N+\frac{1}{2})t) dt$。令 $\varphi(t) = \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)}$。由 Dini 条件，$\frac{|f(x+t) + f(x-t) - 2f(x)|}{t}$ 在 $t \in (0,\delta)$ 可积。由于 $\sin(t/2) \sim t/2$（$t \to 0$），$\varphi(t)$ 在 $[0,\pi]$ 上 $L^1$ 可积。由 Riemann-Lebesgue 引理，$\int_0^{\pi} \varphi(t) \sin((N+\frac{1}{2})t) dt \to 0$（$N \to \infty$），故 $S_N f(x) \to f(x)$。$\blacksquare$

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