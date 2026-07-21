## 第157章：Fourier 级数

Fourier 级数理论是调和分析的起点，起源于 Joseph Fourier 在 1807 年关于热传导方程的研究。Fourier 的基本洞察是：任意周期函数可以表示为三角函数的无穷级数。这一断言在当时引起了激烈争议（Lagrange、Laplace 等人怀疑其一般性），但最终导致了数学分析中一系列根本性概念的诞生——函数的概念、收敛的概念、以及积分理论的严格化。Fourier 级数理论在 $L^2$ 框架下达到最优雅的形式，而 $L^p$ 框架下的逐点收敛问题则成为 20 世纪调和分析的核心课题。

### 50.1 正交系与 Bessel 不等式

**定义 50.1.1（ $L^2$ 中的规范正交系）**：$L^2([-\pi, \pi])$ 中的函数列 $\{\varphi_k\}_{k=1}^{\infty}$ 称为**规范正交系**，若

$$
\langle \varphi_i, \varphi_j \rangle = \int_{-\pi}^{\pi} \varphi_i(x) \overline{\varphi_j(x)} \, dx = \delta_{ij}
$$

**定义 50.1.2（完备规范正交系）**：规范正交系 $\{\varphi_k\}$ 称为**完备**的，若 $\langle f, \varphi_k \rangle = 0$（对所有 $k$）蕴含 $f = 0$ a.e.。等价地，$\{\varphi_k\}$ 的有限线性张成在 $L^2$ 中稠密。

**定理 50.1.1（Bessel 不等式）**：设 $\{\varphi_k\}$ 为 $L^2(E)$ 中的规范正交系，$f \in L^2(E)$。则

$$
\sum_{k=1}^{\infty} |\langle f, \varphi_k \rangle|^2 \leq \|f\|_2^2
$$

**证明**：对任意 $n$，令 $s_n = \sum_{k=1}^{n} \langle f, \varphi_k \rangle \varphi_k$。则

$$
0 \leq \|f - s_n\|_2^2 = \|f\|_2^2 - 2\langle f, s_n \rangle + \|s_n\|_2^2 = \|f\|_2^2 - 2\sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 + \sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 = \|f\|_2^2 - \sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2
$$

因此 $\sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 \leq \|f\|_2^2$。令 $n \to \infty$ 即得。$\blacksquare$

**定理 50.1.2（Parseval 恒等式）**：设 $\{\varphi_k\}$ 为 $L^2(E)$ 中的完备规范正交系。则对任意 $f \in L^2(E)$，

$$
\sum_{k=1}^{\infty} |\langle f, \varphi_k \rangle|^2 = \|f\|_2^2
$$

且 $f = \sum_{k=1}^{\infty} \langle f, \varphi_k \rangle \varphi_k$（在 $L^2$ 范数下收敛）。

**命题 50.1.3（Riesz-Fischer 定理的 Hilbert 空间版本）**：设 $\{c_k\}$ 为满足 $\sum |c_k|^2 < \infty$ 的复数列，$\{\varphi_k\}$ 为规范正交系。则存在唯一的 $f \in \overline{\operatorname{span}}\{\varphi_k\}$ 使得 $\langle f, \varphi_k \rangle = c_k$（对所有 $k$）。

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

使用复指数形式更为简洁：令 $c_n = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(x) e^{-inx} dx$，则 $f(x) \sim \sum_{n=-\infty}^{\infty} c_n e^{inx}$。两种形式的关系为 $c_0 = a_0/2$，$c_n = (a_n - i b_n)/2$（$n \geq 1$），$c_{-n} = \overline{c_n}$。

**注记 50.2.1**：此处使用 $\sim$ 而非 $=$，因为 Fourier 级数不一定逐点收敛到 $f$——这是 Fourier 级数理论的核心问题。在 $L^2$ 框架下，级数在 $L^2$ 范数下收敛到 $f$；在逐点意义下，需要额外的正则性条件（如 Dini 条件、有界变差等）。

**定理 50.2.1（ $L^2$ 中 Fourier 级数的收敛性）**：设 $f \in L^2([-\pi, \pi])$。则 $f$ 的 Fourier 级数在 $L^2$ 范数下收敛到 $f$。即

$$
\lim_{N \to \infty} \left\|f - \left(\frac{a_0}{2} + \sum_{n=1}^{N} (a_n \cos nx + b_n \sin nx)\right)\right\|_2 = 0
$$

等价地，Parseval 恒等式成立：

$$
\frac{1}{\pi} \int_{-\pi}^{\pi} |f(x)|^2 \, dx = \frac{a_0^2}{2} + \sum_{n=1}^{\infty} (a_n^2 + b_n^2)
$$

**证明**：三角函数系 $\{\frac{1}{\sqrt{2\pi}}, \frac{\cos nx}{\sqrt{\pi}}, \frac{\sin nx}{\sqrt{\pi}}\}_{n=1}^\infty$ 在 $L^2([-\pi, \pi])$ 中是规范正交系。由 Weierstrass 第二逼近定理（推论 50.4.2），三角多项式在 $L^2$ 中稠密，故此规范正交系是完备的。由 Hilbert 空间理论，完备规范正交系中任意元素的 Fourier 展开在 $L^2$ 范数下收敛到该元素，且 Parseval 恒等式 $\|f\|_2^2 = \sum |\langle f, \varphi_k \rangle|^2$ 成立。将 $\langle f, \varphi_k \rangle$ 具体化为 Fourier 系数即得结论。$\blacksquare$

**推论 50.2.2（Fourier 系数的唯一性）**：若 $f, g \in L^1([-\pi, \pi])$ 有相同的 Fourier 系数，则 $f = g$ a.e.。特别地，若 $f \in L^2$，由 Parseval 恒等式 $\|f - g\|_2 = 0$ 即得。对 $L^1$ 情形，需用 Fejer 定理的 Cesaro 可和性。

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

**命题 50.3.1（好核的逼近性质）**：设 $\{K_N\}$ 为 $[-\pi, \pi]$ 上的好核族（即满足上述三条性质）。则对任意 $f \in L^1([-\pi, \pi])$，卷积 $K_N * f$ 在 $f$ 的每个连续点处收敛到 $f(x)$；若 $f$ 连续且周期，则收敛是一致的。

**证明**：$|K_N * f(x) - f(x)| = |\frac{1}{\pi} \int_{-\pi}^{\pi} (f(x-t) - f(x)) K_N(t) dt| \leq \frac{1}{\pi} \int_{-\pi}^{\pi} |f(x-t) - f(x)| K_N(t) dt$。将积分分为 $|t| < \delta$ 和 $|t| \geq \delta$ 两部分。第一部分由 $f$ 在 $x$ 处的连续性，$|f(x-t) - f(x)| < \varepsilon$；第二部分由好核的第三条性质，$K_N(t)$ 在 $|t| \geq \delta$ 上的积分趋于 $0$，而 $f$ 的 $L^1$ 有界性给出控制。$\blacksquare$

---

### 50.4 Fejér 定理与 Weierstrass 逼近定理

**定理 50.4.1（Fejér 定理）**：设 $f \in L^1([-\pi, \pi])$。则 $f$ 的 Fourier 级数的 Cesàro 平均 $\sigma_N f(x) = \frac{1}{N+1} \sum_{k=0}^{N} S_k f(x)$ 满足：

(i) 若 $f$ 在 $x$ 处连续，则 $\sigma_N f(x) \to f(x)$
(ii) 若 $f$ 在 $[-\pi, \pi]$ 上连续且 $f(-\pi) = f(\pi)$，则 $\sigma_N f \to f$ 一致收敛

**证明**：$\sigma_N f(x) = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x - t) F_N(t) dt$。由 Fejér 核是"好核"的性质，应用命题 50.3.1 即得结论。$\blacksquare$

**推论 50.4.2（Weierstrass 第二逼近定理）**：三角多项式在 $C([-\pi, \pi])$（周期连续函数）中关于一致范数稠密。因此，任一连续周期函数可用三角多项式一致逼近。

**注记 50.4.1**：Fejér 定理表明，虽然 Fourier 级数的部分和 $S_N f$ 可能不收敛（甚至在连续点处发散），但其 Cesàro 平均 $\sigma_N f$ 总是收敛的。这一现象是发散级数可和性理论（Cesàro 可和性）的经典例子。Fejér 定理的一个优美推论是：若 $f$ 的 Fourier 级数在某点收敛，则其和必为 $f$ 在该点的值（若 $f$ 在该点连续）。

**命题 50.4.3（Fejér 定理与 $L^p$ 收敛）**：对 $1 \leq p < \infty$，若 $f \in L^p([-\pi, \pi])$，则 $\sigma_N f \to f$ 在 $L^p$ 范数下。这由好核的 $L^p$ 逼近性质和 Minkowski 积分不等式推出。

---

### 50.5 逐点收敛性

**定理 50.5.1（Riemann-Lebesgue 引理）**：设 $f \in L^1([-\pi, \pi])$。则

$$
\lim_{|n| \to \infty} \int_{-\pi}^{\pi} f(t) e^{-int} \, dt = 0
$$

即 Fourier 系数 $a_n, b_n \to 0$（$n \to \infty$）。

**证明**：先对 $f$ 为特征函数 $\chi_{(a,b)}$ 验证：$\int_a^b e^{-int} dt = \frac{e^{-ina} - e^{-inb}}{in} \to 0$。对简单函数（特征函数的线性组合）由线性性成立。对一般 $f \in L^1$，取简单函数 $\varphi$ 使 $\|f - \varphi\|_1 < \varepsilon/2$，则 $|\int (f - \varphi) e^{-int} dt| \leq \|f - \varphi\|_1 < \varepsilon/2$，且当 $|n|$ 足够大时 $|\int \varphi e^{-int} dt| < \varepsilon/2$，故 $|\int f e^{-int} dt| < \varepsilon$。$\blacksquare$

**定理 50.5.2（Dini 判别法）**：设 $f \in L^1([-\pi, \pi])$，$x \in [-\pi, \pi]$。若存在 $\delta > 0$ 使得

$$
\int_0^{\delta} \frac{|f(x + t) + f(x - t) - 2f(x)|}{t} \, dt < \infty
$$

则 $f$ 的 Fourier 级数在 $x$ 处收敛到 $f(x)$。特别地，若 $f$ 在 $x$ 处 Lipschitz 连续（或可导），则 Dini 条件成立。

**证明**：Fourier 部分和可写为 $S_N f(x) - f(x) = \frac{1}{\pi} \int_0^{\pi} \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)} \sin((N+\frac{1}{2})t) dt$。令 $\varphi(t) = \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)}$。由 Dini 条件，$\frac{|f(x+t) + f(x-t) - 2f(x)|}{t}$ 在 $t \in (0,\delta)$ 可积。由于 $\sin(t/2) \sim t/2$（$t \to 0$），$\varphi(t)$ 在 $[0,\pi]$ 上 $L^1$ 可积。由 Riemann-Lebesgue 引理，$\int_0^{\pi} \varphi(t) \sin((N+\frac{1}{2})t) dt \to 0$（$N \to \infty$），故 $S_N f(x) \to f(x)$。$\blacksquare$

**定理 50.5.3（Dirichlet-Jordan 判别法）**：若 $f$ 在 $x$ 的某个邻域内有界变差，则 $f$ 的 Fourier 级数在 $x$ 处收敛到 $\frac{f(x^+) + f(x^-)}{2}$。

**证明**：设 $f$ 在 $[x-\delta, x+\delta]$ 上有界变差。将 $f$ 分解为两个单调函数之差：$f = g - h$，其中 $g, h$ 单调。对单调函数 $g$，$S_N g(x) - g(x) = \frac{1}{\pi} \int_0^\pi (g(x+t) + g(x-t) - 2g(x)) \frac{\sin((N+1/2)t)}{2\sin(t/2)} dt$。利用 Dirichlet 核的积分表示和 Jordan 分解，将积分分为两部分：$\int_0^\delta$ 和 $\int_\delta^\pi$。第一部分由单调性和三角函数积分的平均值性质（第二中值定理）控制，当 $N \to \infty$ 时趋于 $0$。第二部分由 Riemann-Lebesgue 引理趋于 $0$。综合得 $S_N f(x) \to \frac{f(x^+) + f(x^-)}{2}$。$\blacksquare$

**注记 50.5.1**：关于逐点收敛的最深刻结果是 Carleson 定理（1966）：若 $f \in L^2([-\pi, \pi])$，则 $f$ 的 Fourier 级数几乎处处收敛到 $f(x)$。这一定理（由 Lennart Carleson 证明，他因此获得 2006 年 Abel 奖）解决了 Lusin 在 1915 年提出的猜想，是 20 世纪分析学最伟大的成就之一。Hunt 后来将其推广到 $L^p$（$p > 1$）。Kolmogorov 在 1923 年构造了 $L^1$ 中 Fourier 级数几乎处处发散的例子，表明 $p=1$ 是 Carleson-Hunt 定理的精确边界。

---

### 50.6 Gibbs 现象与收敛性补充

**定理 50.6.1（Gibbs 现象）**：设 $f$ 在 $x_0$ 处有跳跃间断：$f(x_0^+) \neq f(x_0^-)$。则 $f$ 的 Fourier 级数的部分和 $S_N f$ 在 $x_0$ 附近会产生过冲（overshoot）——最大过冲量约为跳跃幅度的 $9\%$，即

$$\lim_{N \to \infty} \max_{x \in (x_0, x_0+\delta)} S_N f(x) - f(x_0^+) \approx 0.08949 \cdot |f(x_0^+) - f(x_0^-)|$$

且该过冲不随 $N$ 增大而消失（仅位置向 $x_0$ 收缩）。Gibbs 现象是 Fourier 级数在跳跃间断处非一致收敛的必然结果，其本质是 Dirichlet 核的振荡积分在间断处的极限行为。

**证明**：不妨设 $f$ 为符号函数 $\operatorname{sgn}$ 在 $[-\pi, \pi]$ 上的周期延拓。$S_N f(x) = \frac{2}{\pi} \int_0^x \frac{\sin((N+1/2)t)}{2\sin(t/2)} dt$。当 $N \to \infty$ 时，$S_N f(x) \to \frac{2}{\pi} \operatorname{Si}((N+1/2)x)$，其中 $\operatorname{Si}(u) = \int_0^u \frac{\sin t}{t} dt$ 为正弦积分。$\operatorname{Si}$ 在 $u = \pi$ 处取最大值 $\approx 1.8519$，故过冲为 $\frac{2}{\pi} \cdot 1.8519 - 1 \approx 0.17898 / 2$（符号函数跳跃为 $2$），相对过冲约 $8.95\%$。$\blacksquare$

Gibbs 现象不仅仅是 Fourier 级数理论中的一则数学趣闻，它在实际的信号和图像处理中有着直接的表现。当 Fourier 系数被截断（前 $N$ 项部分和）时，间断点附近的振荡不会随 $N$ 增大而消失，仅被压缩到越来越窄的区间内。这一特性意味着，单纯增加 Fourier 系数的数量并不能消除间断处的伪影，必须借助更精巧的求和策略。

**注记 50.6.1**：Gibbs 现象在信号处理中有实际意义——在图像压缩（JPEG）中，Fourier 系数的截断会在边缘处产生振铃效应（ringing artifact），这正是 Gibbs 现象的二维版本。为缓解这一问题，实践中常使用 Fejér 平均（完全消除 Gibbs 现象，但降低分辨率）或使用更光滑的求和核（如 Lanczos 核）。

---

### 50.7 Fourier 变换与 Fourier 级数的统一

**定理 50.7.1（Poisson 求和公式）**：设 $f \in \mathcal{S}(\mathbb{R})$（Schwartz 空间）。则

$$\sum_{n \in \mathbb{Z}} f(n) = \sum_{k \in \mathbb{Z}} \hat{f}(2\pi k)$$

其中 $\hat{f}(\xi) = \int_{-\infty}^\infty f(x) e^{-i x \xi} dx$ 是 Fourier 变换。Poisson 求和公式是连接 Fourier 级数（离散/周期）与 Fourier 变换（连续/非周期）的桥梁。

**证明**：定义 $F(x) = \sum_{n \in \mathbb{Z}} f(x + 2\pi n)$，则 $F$ 为 $2\pi$-周期的光滑函数。$F$ 的 Fourier 系数为 $\hat{f}(k)$（由定义直接计算）。$F$ 的 Fourier 级数在 $x=0$ 处取值得 $\sum_{n \in \mathbb{Z}} f(2\pi n) = \sum_{k \in \mathbb{Z}} \hat{f}(k)$，作变量替换 $x \mapsto 2\pi x$ 即得标准形式。$\blacksquare$

**定理 50.7.2（Fourier 反演公式的周期版本）**：设 $f \in L^1([-\pi, \pi])$ 且其 Fourier 系数满足 $\sum |c_n| < \infty$。则 $f$ 可调整为连续函数，且 Fourier 级数绝对且一致收敛到 $f(x)$：

$$
f(x) = \sum_{n=-\infty}^{\infty} c_n e^{inx}
$$

Poisson 求和公式在数论中有深远应用——它是 Riemann $\zeta$ 函数的函数方程、$\theta$ 函数的模变换性质（$\theta(-1/z) = \sqrt{z/i} \, \theta(z)$）以及 Hecke 的 Voronoi 求和公式的基础。在调和分析中，它统一了 Fourier 级数和 Fourier 变换，是局部紧 Abel 群上调和分析中 Pontryagin 对偶的离散-紧致对偶特例。$\blacksquare$

---

### 50.8 共轭函数与 Hilbert 变换

**定义 50.8.1（共轭 Fourier 级数）**：设 $f \sim \frac{a_0}{2} + \sum_{n=1}^{\infty} (a_n \cos nx + b_n \sin nx)$。$f$ 的**共轭函数** $\tilde{f}$ 的 Fourier 级数定义为

$$
\tilde{f}(x) \sim \sum_{n=1}^{\infty} (a_n \sin nx - b_n \cos nx)
$$

在复形式中，若 $f \sim \sum c_n e^{inx}$，则 $\tilde{f} \sim -i \sum_{n \neq 0} \operatorname{sgn}(n) c_n e^{inx}$。

**定理 50.8.1（M. Riesz 定理）**：对 $1 < p < \infty$，共轭函数算子 $f \mapsto \tilde{f}$ 是 $L^p([-\pi, \pi])$ 上的有界算子。对 $p=1$，该算子不是 $L^1$ 有界的，但满足弱 $(1,1)$ 型估计。

共轭函数是调和函数共轭的边界值，与 Hilbert 变换密切相关。在单位圆盘上，若 $u$ 是 $f$ 的 Poisson 积分，则 $f$ 的共轭函数 $\tilde{f}$ 是 $u$ 的调和共轭 $v$ 的边界值，满足 $u + iv$ 为全纯函数。这一联系是复分析与调和分析之间最深层的桥梁之一。

---

### 50.9 Fourier 级数的绝对收敛与 Wiener 代数

**定义 50.9.1（Wiener 代数）**：Wiener 代数 $A(\mathbb{T})$ 定义为 Fourier 系数满足 $\sum_{n=-\infty}^{\infty} |c_n| < \infty$ 的所有连续周期函数构成的空间，配以范数 $\|f\|_A = \sum |c_n|$。

Wiener 代数的引入源于这样一个自然的问题：Fourier 级数何时不仅逐点收敛，而且绝对收敛——即系数的 $\ell^1$ 范数有限？这种强收敛模式保证了 Fourier 级数一致收敛，且其和函数具有许多良好的代数性质。下面的 Wiener 引理是 Banach 代数理论的开山之作之一，它表明 $A(\mathbb{T})$ 在逐点取倒数操作下是封闭的——这在 Fourier 分析中远非显然，因为 $1/f$ 的 Fourier 系数与 $f$ 的系数之间没有简单的代数关系。

**定理 50.9.1（Wiener 引理）**：若 $f \in A(\mathbb{T})$ 且 $f(x) \neq 0$（对所有 $x$），则 $1/f \in A(\mathbb{T})$。Wiener 引理是 Banach 代数理论中谱不变性的经典结果，在 Tauber 定理和信号处理中有重要应用。

Wiener 引理解决了代数封闭性问题，但如何判断一个函数是否属于 $A(\mathbb{T})$ 仍然需要可操作的判据。光滑性是保证绝对收敛的最自然途径——直觉上，函数越光滑，其 Fourier 系数衰减越快。Bernstein 定理将这一直觉精确化为定量的 Hölder 连续性条件，给出了 $f \in A(\mathbb{T})$ 的一个充分判据。特别地，它揭示了绝对收敛与分数阶可微性之间的内在联系，是 Fourier 系数衰减估计的经典应用。

**定理 50.9.2（Bernstein 定理）**：若 $f$ 是 $\alpha$-Holder 连续的（$\alpha > 1/2$），则 $f \in A(\mathbb{T})$。更精确地，若 $f \in C^{k,\alpha}$（$k$ 阶导数 $\alpha$-Holder 连续），则 Fourier 系数满足 $|c_n| = O(|n|^{-k-\alpha})$，从而当 $k + \alpha > 1/2$ 时 Fourier 级数绝对收敛。$\blacksquare$

---

### 50.10 Fourier 级数的 $L^1$ 收敛问题与 Kolmogorov 反例

**定理 50.10.1（ $L^1$ 中 Fourier 级数的不收敛性）**：存在 $f \in L^1([-\pi, \pi])$，其 Fourier 级数的部分和 $S_N f$ 在 $L^1$ 范数下不收敛于 $f$。这一事实与 $L^p$（$p > 1$）形成鲜明对比，表明 $L^1$ 是 Fourier 级数理论的"边界情形"。

$L^1$ 中依范数收敛的失效只是一个序曲。更令人震惊的是，Kolmogorov 在年仅 19 岁时构造的例子：存在 $L^1$ 函数，其 Fourier 级数非但在 $L^1$ 范数下不收敛，而且在每一个点上都发散——这与 $L^p$（$p > 1$）中 Hunting 和 Carleson 建立的几乎处处收敛形成尖锐对照。Kolmogorov 的反例彻底埋葬了"Fourier 级数对一切可积函数都几乎处处收敛"的天真想法，确定了 $L^1$ 恰是几乎处处收敛的精确边界。

**定理 50.10.2（Kolmogorov 1923 反例）**：存在 $f \in L^1([-\pi, \pi])$，其 Fourier 级数几乎处处发散。Kolmogorov 的构造极为精巧：利用无界发散的三角级数和一个"帐篷函数"（tent function）的叠加，构造了 $L^1$ 中 Fourier 级数在每点都发散的病态函数。这一反例确立了 $L^1$ 是 Fourier 级数几乎处处收敛的精确边界——$L^p$（$p > 1$）中几乎处处收敛（Carleson-Hunt 定理），但 $L^1$ 中不成立。

Kolmogorov 的否定性结果让学界沉默了近四十年，直到 1966 年 Carleson 在 $L^2$ 情形下取得了突破性进展——他证明了 $L^2$ 函数的 Fourier 级数几乎处处收敛。这一结果被誉为 20 世纪分析学中最伟大的成就之一，其证明引入的"时频分解"技术后来被 Fefferman 系统化为相空间分析方法，完全改变了调和分析的研究范式。Carleson 定理表明，从 $L^1$ 到 $L^2$ 这一看似微小的提升，在逐点收敛的意义下却是天壤之别。

**定理 50.10.3（Carleson 定理，1966）**：若 $f \in L^2([-\pi, \pi])$，则 $f$ 的 Fourier 级数几乎处处收敛到 $f(x)$。Hunt 在 1968 年将此推广到 $L^p$（$p > 1$）。Carleson 定理的证明极为复杂（原始论文长达 22 页），核心思想是将 Carleson 极大算子 $C f(x) = \sup_N |S_N f(x)|$ 的弱 $(2,2)$ 型估计与精细的时频分析（time-frequency analysis）相结合。Fefferman 后来将 Carleson 的证明重构为"相空间分解"（phase space decomposition）的框架，这一方法成为现代调和分析中处理 Fourier 级数逐点收敛的标准工具。

Carleson 定理的完整证明虽然艰深，但有一条相对初等的路径可以通过 Hardy-Littlewood 极大函数来获得部分结果。下面这个不等式将 Fourier 级数部分和的点态行为与极大函数控制联系起来，虽不能给出最优的 $p > 1$ 结论，但提供了理解逐点收敛机制的直观几何视角——Fourier 级数的部分和本质上由函数的局部平均（极大函数）所控制。

**定理 50.10.4（Hardy-Littlewood 极大函数与 Fourier 级数）**：Hardy-Littlewood 极大函数 $Mf$ 控制 Fourier 级数的部分和：$|S_N f(x)| \leq C \cdot Mf(x)$（对 $f \in L^p$，$p > 1$ 时成立）。这一不等式表明 Fourier 级数的逐点收敛性可由极大函数的弱型估计导出，是 Carleson 定理的简化版本（仅适用于 $p > 1$ 且不给出几乎处处收敛的最优结果）。

### 50.11 Fourier 级数的多重推广与球面调和

**定义 50.11.1（多重 Fourier 级数）**：设 $f \in L^1(\mathbb{T}^n)$（$n$ 维环面）。其多重 Fourier 级数为 $f(x) \sim \sum_{k \in \mathbb{Z}^n} c_k e^{i k \cdot x}$，其中 $c_k = \frac{1}{(2\pi)^n} \int_{\mathbb{T}^n} f(x) e^{-i k \cdot x} dx$。多重 Fourier 级数的收敛性问题远比一维情形复杂——球面部分和、方形部分和和矩形部分和的行为有本质不同。Fefferman 在 1971 年证明了"圆盘乘子猜想"不成立：球面部分和的 $L^p$ 有界性在 $p \neq 2$ 时失效（$n \geq 2$），这一深刻结果揭示了高维 Fourier 分析与一维之间的本质差异。

当底空间从平坦的环面 $\mathbb{T}^n$ 转移到弯曲的球面 $S^{n-1}$ 时，Fourier 分析的基本框架发生了根本性的转变。环面上的指数函数 $e^{i k \cdot x}$ 被球面调和函数（spherical harmonics）所取代，后者是 Laplace-Beltrami 算子在球面上的特征函数族。这种推广不仅是数学上的自然延拓，更在物理中有着直接的对应——量子力学中的角动量本征态正是球面调和函数的物理化身。下面的定理描述了球面上 $L^2$ 函数的正交分解，它是 Fourier 级数在非平坦空间中的完整类比。

**定理 50.11.1（球面调和展开）**：在单位球面 $S^{n-1}$ 上，$L^2(S^{n-1})$ 可分解为球面调和函数空间 $\mathcal{H}_k$（$k$ 阶齐次调和多项式在球面上的限制）的正交直和。球面调和函数是 Laplace 算子在球面上的特征函数，其 Fourier 展开推广了圆周上的三角级数展开。球面调和理论在量子力学（角动量理论）、地球物理学（重力场展开）和计算机图形学（环境光照的球面调和表示）中有广泛应用。$\blacksquare$