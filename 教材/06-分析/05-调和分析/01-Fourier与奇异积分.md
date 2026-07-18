## 第137章：Fourier 变换
Fourier 变换是调和分析最基本的工具，它将函数从物理空间映射到频率空间。本章从 $L^1$ 和 $L^2$ 理论出发，建立缓增分布上的 Fourier 变换。

### 123.1 $L^1$ 理论

**定义 123.1**（Fourier 变换）：$f \in L^1(\mathbb{R}^n)$ 的 **Fourier 变换**为

$$\hat{f}(\xi) = \mathcal{F}f(\xi) = \int_{\mathbb{R}^n} f(x) e^{-2\pi i x \cdot \xi} dx$$

**Fourier 逆变换**（形式地）：$f(x) = \int_{\mathbb{R}^n} \hat{f}(\xi) e^{2\pi i x \cdot \xi} d\xi$（在 $L^2$ 或适当条件下成立）。

**命题 123.1**（$L^1$ 理论的基本性质）：
1. $\|\hat{f}\|_\infty \leq \|f\|_1$（$\hat{f}$ 是有界连续函数）
2. $\widehat{f * g} = \hat{f} \hat{g}$（卷积的 Fourier 变换是乘积）
3. $\widehat{f(\cdot - h)}(\xi) = e^{-2\pi i h \cdot \xi} \hat{f}(\xi)$（平移）
4. $\widehat{e^{2\pi i x \cdot \eta} f(x)}(\xi) = \hat{f}(\xi - \eta)$（调制）
5. $\widehat{f(\lambda x)}(\xi) = \lambda^{-n} \hat{f}(\xi/\lambda)$（伸缩）
6. Riemann-Lebesgue 引理：$\hat{f}(\xi) \to 0$（$|\xi| \to \infty$）

**定理 123.1**（Fourier 反演公式，$L^1$ 情形）：若 $f, \hat{f} \in L^1(\mathbb{R}^n)$，则

$$f(x) = \int_{\mathbb{R}^n} \hat{f}(\xi) e^{2\pi i x \cdot \xi} d\xi \quad \text{几乎处处}$$

*证明*：使用 Gauss 核近似恒等元。$f * \varphi_\varepsilon \to f$（$\varepsilon \to 0$），其中 $\varphi_\varepsilon(x) = \varepsilon^{-n} e^{-\pi |x|^2/\varepsilon^2}$。$\hat{\varphi}_\varepsilon(\xi) = e^{-\pi \varepsilon^2 |\xi|^2}$。由 Fourier 反演对 Gauss 函数成立，取极限。∎

### 123.2 $L^2$ 理论与 Plancherel 定理

**定理 123.2**（Plancherel 定理）：Fourier 变换可以唯一延拓为 $L^2(\mathbb{R}^n)$ 上的酉算子（在归一化后）：$\|\hat{f}\|_2 = \|f\|_2$。即

$$\int_{\mathbb{R}^n} |f(x)|^2 dx = \int_{\mathbb{R}^n} |\hat{f}(\xi)|^2 d\xi$$

**推论 123.3**（Parseval 恒等式）：$\langle f, g \rangle = \langle \hat{f}, \hat{g} \rangle$，即 $\int f \bar{g} = \int \hat{f} \bar{\hat{g}}$。

**定理 123.4**（Hausdorff-Young 不等式）：对 $1 \leq p \leq 2$，$\|\hat{f}\|_{p'} \leq \|f\|_p$，其中 $1/p + 1/p' = 1$。即 Fourier 变换是 $L^p \to L^{p'}$ 的有界算子（$p \in [1, 2]$）。

### 123.3 Schwartz 空间与缓增分布

**定义 123.2**（Schwartz 空间）：**Schwartz 空间** $\mathcal{S}(\mathbb{R}^n)$ 是所有光滑函数 $\varphi$ 的集合，满足对所有多重指标 $\alpha, \beta$，

$$\sup_{x \in \mathbb{R}^n} |x^\alpha D^\beta \varphi(x)| < \infty$$

即 $\varphi$ 及其所有导数比任意多项式下降更快。

**定理 123.5**：Fourier 变换是 $\mathcal{S}(\mathbb{R}^n)$ 上的同构（双射连续线性映射）。$\mathcal{S}$ 在 Fourier 变换下的自同构性是调和分析的核心。

**定义 123.3**（缓增分布）：$\mathcal{S}(\mathbb{R}^n)$ 的对偶空间 $\mathcal{S}'(\mathbb{R}^n)$ 称为**缓增分布**空间。缓增分布 $u$ 的 **Fourier 变换** $\hat{u}$ 由对偶定义：

$$\langle \hat{u}, \varphi \rangle = \langle u, \hat{\varphi} \rangle \quad (\varphi \in \mathcal{S})$$

### 123.4 Poisson 求和公式

**定理 123.6**（Poisson 求和公式）：设 $f$ 是 Schwartz 函数。则

$$\sum_{n \in \mathbb{Z}^n} f(n) = \sum_{m \in \mathbb{Z}^n} \hat{f}(m)$$

更一般地，$\sum_{n \in \mathbb{Z}^n} f(x + n) = \sum_{m \in \mathbb{Z}^n} \hat{f}(m) e^{2\pi i m \cdot x}$（分布意义下）。

*证明*：定义 $F(x) = \sum_{n \in \mathbb{Z}^n} f(x + n)$（$\mathbb{Z}^n$-周期函数）。$F$ 的 Fourier 系数为 $\hat{f}(m)$，由 Fourier 级数理论即得。∎

---

---

---

---

---
---

## 第138章：奇异积分
奇异积分是 Calderón-Zygmund 在 20 世纪 50 年代开创的理论，它将 Hilbert 变换（一维）推广到高维，并建立了 $L^p$ 有界性的一般框架。

### 124.1 Hilbert 变换

**定义 124.1**（Hilbert 变换）：$\mathbb{R}$ 上的 **Hilbert 变换** $H$ 定义为

$$Hf(x) = \frac{1}{\pi} \operatorname{p.v.} \int_{-\infty}^\infty \frac{f(y)}{x - y} dy = \frac{1}{\pi} \lim_{\varepsilon \to 0} \int_{|x-y| > \varepsilon} \frac{f(y)}{x - y} dy$$

**命题 124.1**（Hilbert 变换的性质）：
1. $H$ 是 $L^2(\mathbb{R})$ 上的酉算子：$H^* = -H$，$H^2 = -I$
2. Fourier 乘子：$\widehat{Hf}(\xi) = -i \operatorname{sgn}(\xi) \hat{f}(\xi)$
3. $H$ 是 $L^p(\mathbb{R})$ 上的有界算子（$1 < p < \infty$）
4. $H$ 与伸缩、平移交换

**定理 124.1**（M. Riesz 定理）：Hilbert 变换在 $L^p(\mathbb{R})$ 上有界（$1 < p < \infty$）。$\|Hf\|_p \leq C_p \|f\|_p$。

### 124.2 Calderón-Zygmund 分解

**定理 124.2**（Calderón-Zygmund 分解）：设 $f \in L^1(\mathbb{R}^n)$，$f \geq 0$，$\lambda > 0$。则存在 $\mathbb{R}^n$ 的分解：$f = g + b$，其中
- $g$（"好"部分）：$|g(x)| \leq 2^n \lambda$ 几乎处处，$\|g\|_1 \leq \|f\|_1$
- $b = \sum_k b_k$（"坏"部分）：$b_k$ 支撑在不相交的二进方体 $Q_k$ 上，$\int_{Q_k} b_k = 0$，$\|b_k\|_1 \leq 2^{n+1} \lambda |Q_k|$，且 $\sum_k |Q_k| \leq \lambda^{-1} \|f\|_1$

*构造与证明概要*：将 $\mathbb{R}^n$ 划分为二进方体（dyadic cubes）。对每个二进方体 $Q$，若 $\frac{1}{|Q|}\int_Q f > \lambda$，则将其二等分为子方体并递归检查。最终选出的"坏"方体族 $\{Q_k\}$ 满足：$\frac{1}{|Q_k|}\int_{Q_k} f > \lambda$，但每个 $Q_k$ 的父方体均值 $\leq \lambda$。定义 $g(x) = f(x)$（$x \notin \bigcup Q_k$）和 $g(x) = \frac{1}{|Q_k|}\int_{Q_k} f$（$x \in Q_k$），以及 $b_k(x) = (f(x) - \frac{1}{|Q_k|}\int_{Q_k} f) \mathbf{1}_{Q_k}(x)$。于是 $|g| \leq 2^n \lambda$ 由均值有界性保证，$\sum|Q_k| \leq \lambda^{-1}\|f\|_1$ 由 Chebyshev 型估计得到。此分解是 Calderón-Zygmund 理论的基石，关键之处在于将函数分解为 $L^\infty$ 控制的好部分和均值为零且支撑在不相交二进方体上的坏部分。∎

*构造*：用二进方体分割 $\mathbb{R}^n$。对每个二进方体，若其均值 $> \lambda$，则从中提取"坏"部分。这是 Calderón-Zygmund 理论的基石。

### 124.3 奇异积分算子

**定义 124.2**（Calderón-Zygmund 核）：函数 $K: \mathbb{R}^n \setminus \{0\} \to \mathbb{C}$ 称为 **Calderón-Zygmund 核**（或标准核），如果满足：
1. $|K(x)| \leq C |x|^{-n}$（大小条件）
2. $|\nabla K(x)| \leq C |x|^{-n-1}$（光滑性条件）
3. $\int_{r < |x| < R} K(x) dx = 0$（对所有 $0 < r < R$，消去条件）

**定义 124.3**（奇异积分算子）：与核 $K$ 关联的**奇异积分算子** $T$ 定义为

$$Tf(x) = \operatorname{p.v.} \int_{\mathbb{R}^n} K(x - y) f(y) dy = \lim_{\varepsilon \to 0} \int_{|x-y| > \varepsilon} K(x - y) f(y) dy$$

**定理 124.3**（Calderón-Zygmund 定理）：若 $T$ 是奇异积分算子且在 $L^2$ 上有界，则 $T$ 在 $L^p$ 上有界（$1 < p < \infty$），且满足弱 $(1, 1)$ 型估计：

$$|\{x : |Tf(x)| > \lambda\}| \leq \frac{C}{\lambda} \|f\|_1$$

*证明思路*：使用 Calderón-Zygmund 分解。对"好"部分 $g$ 用 $L^2$ 有界性，对"坏"部分 $b$ 用核的光滑性和消去条件。弱 $(1, 1)$ 有界性 + $L^2$ 有界性 + Marcinkiewicz 插值定理 ⇒ $L^p$ 有界性（$1 < p < 2$）。对偶性处理 $p > 2$。∎

**定理 124.5**（Cotlar 引理，1955）：设 $\{T_j\}_{j \in \mathbb{Z}}$ 是 Hilbert 空间 $\mathcal{H}$ 上的一族有界算子。若存在 $\gamma: \mathbb{Z} \to \mathbb{R}_{\geq 0}$ 满足 $\sum_{k \in \mathbb{Z}} \sqrt{\gamma(k)} < \infty$，使得 $\|T_i^* T_j\| \leq \gamma(i-j)^2$ 和 $\|T_i T_j^*\| \leq \gamma(i-j)^2$ 对所有 $i, j$ 成立，则级数 $\sum_j T_j$ 在强算子拓扑下收敛，且 $\|\sum_j T_j\| \leq \sum_k \sqrt{\gamma(k)}$。Cotlar 引理是证明奇异积分算子 $L^2$ 有界性的核心工具：将核 $K$ 按频率二进分解为 $K = \sum_j K_j$，对每个分片算子 $T_j$ 验证几乎正交性条件 $\|T_i^* T_j\| \leq C 2^{-|i-j|\varepsilon}$，则级数在 $L^2$ 上收敛且有界。其应用场景包括：Hilbert 变换的 $L^2$ 有界性、Calderón 交换子、Fourier 乘子定理以及仿积算子的有界性。

### 124.4 Marcinkiewicz 插值定理

**定理 124.4**（Marcinkiewicz 插值定理）：设 $T$ 是次线性算子，满足：
- 弱 $(p_0, q_0)$ 型：$|\{|Tf| > \lambda\}| \leq (A_0 \|f\|_{p_0} / \lambda)^{q_0}$
- 弱 $(p_1, q_1)$ 型：$|\{|Tf| > \lambda\}| \leq (A_1 \|f\|_{p_1} / \lambda)^{q_1}$

其中 $1 \leq p_0 < p_1 \leq \infty$，$1 \leq q_0, q_1 \leq \infty$，$q_0 \neq q_1$。则对 $p_\theta$ 满足 $\frac{1}{p_\theta} = \frac{1-\theta}{p_0} + \frac{\theta}{p_1}$，$T$ 在 $L^{p_\theta}$ 上是强有界的（$0 < \theta < 1$）。

---

---

---

---

---
---

## 第139章：Hardy-Littlewood 极大函数
Hardy-Littlewood 极大函数是调和分析中最基本的算子之一，它控制了许多重要的算子（如奇异积分），是 Calderón-Zygmund 理论的关键工具。

### 125.1 Hardy-Littlewood 极大函数

**定义 125.1**（Hardy-Littlewood 极大函数）：$f \in L^1_{\text{loc}}(\mathbb{R}^n)$ 的 **Hardy-Littlewood 极大函数**为

$$Mf(x) = \sup_{r > 0} \frac{1}{|B(x, r)|} \int_{B(x, r)} |f(y)| dy$$

即 $f$ 在包含 $x$ 的球上的最大平均值。

**定理 125.1**（Hardy-Littlewood 极大定理）：
1. $M$ 是弱 $(1, 1)$ 型：$|\{x : Mf(x) > \lambda\}| \leq \frac{C_n}{\lambda} \|f\|_1$
2. $M$ 是强 $(p, p)$ 型：$\|Mf\|_p \leq C_{n,p} \|f\|_p$（$1 < p \leq \infty$）

*证明*（弱 $(1, 1)$ 型）：使用 Vitali 覆盖引理。对 $\{Mf > \lambda\}$ 中的每点，存在球 $B$ 使 $\int_B |f| > \lambda |B|$。由 Vitali 覆盖引理，可选出不相交的球 $B_i$ 覆盖 $\{Mf > \lambda\}$ 的缩放版本。$|\{Mf > \lambda\}| \leq C_n \sum |B_i| \leq \frac{C_n}{\lambda} \sum \int_{B_i} |f| \leq \frac{C_n}{\lambda} \|f\|_1$。∎

**定理 125.2**（Lebesgue 微分定理）：对 $f \in L^1_{\text{loc}}(\mathbb{R}^n)$，

$$\lim_{r \to 0} \frac{1}{|B(x, r)|} \int_{B(x, r)} f(y) dy = f(x) \quad \text{几乎处处}$$

*证明*：由极大函数的弱 $(1, 1)$ 有界性和连续函数在 $L^1$ 中的稠密性证明。∎

### 125.2 其他极大函数

**定义 125.2**（非中心极大函数）：$M'f(x) = \sup_{B \ni x} \frac{1}{|B|} \int_B |f(y)| dy$（上确界取遍所有包含 $x$ 的球，不要求 $x$ 是球心）。$M'$ 与 $M$ 逐点等价：$Mf \leq M'f \leq 2^n Mf$。

**定义 125.3**（锐极大函数，Sharp Maximal Function）：

$$M^\sharp f(x) = \sup_{B \ni x} \frac{1}{|B|} \int_B |f(y) - f_B| dy$$

其中 $f_B = \frac{1}{|B|} \int_B f$ 是 $f$ 在 $B$ 上的均值。$M^\sharp f$ 衡量 $f$ 的局部振荡。

**定理 125.3**（Fefferman-Stein 不等式）：对 $1 < p < \infty$，$\|f\|_p \leq C_p \|M^\sharp f\|_p$（当 $f$ 满足适当消失条件时）。

### 125.3 加权不等式

**定义 125.4**（$A_p$ 权）：非负局部可积函数 $w$ 称为 **$A_p$ 权**（$1 < p < \infty$），如果

$$\sup_B \left(\frac{1}{|B|} \int_B w(x) dx\right) \left(\frac{1}{|B|} \int_B w(x)^{-1/(p-1)} dx\right)^{p-1} < \infty$$

$A_1$ 权：$M w(x) \leq C w(x)$ 几乎处处。

**定理 125.4**（Muckenhoupt 定理）：Hardy-Littlewood 极大函数在加权 $L^p(w)$ 空间上有界当且仅当 $w \in A_p$（$1 < p < \infty$）。这给出了极大函数 $L^p$ 有界性权条件的精确刻画。

---

---

---

---

---