## 第137章：Fourier 变换

Fourier 变换是数学物理中最伟大的发现之一，其思想根植于 Joseph Fourier 1807 年关于热传导方程的研究——他声称任何周期函数均可展为正弦波与余弦波的无穷级数。这一论断在当时引发激烈争议（Lagrange、Laplace 等人均表怀疑），却最终催生了整个调和分析学科。从现代观点看，Fourier 变换的意义在于它提供了函数分析的"对偶视角"：物理空间中的微分算子变为频率空间中的乘性算子，卷积化为逐点乘积，使偏微分方程的求解大为简化。在本书体系中，Fourier 变换是调和分析篇的总纲：奇异积分理论（第138章）是对 Fourier 乘子的有界性研究，Littlewood-Paley 理论依赖于频率的二进制分解，而拟微分算子和 Fourier 积分算子则将这一思想推广到变系数情形。与分布论（Schwartz 理论）的结合更使 Fourier 变换突破函数空间的限制，用于处理 Dirac 测度、主值分布等广义对象。本章从 $L^1$ 和 $L^2$ 理论出发，建立缓增分布上的 Fourier 变换，为后续各章提供分析基础。

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

**证明**：对 $f \in \mathcal{S}(\mathbb{R}^n)$，由 Fubini 定理 $\langle \hat{f}, \hat{g} \rangle = \langle f, \check{\hat{g}} \rangle = \langle f, g \rangle$（因 Fourier 逆变换 $\check{\cdot}$ 在 Schwartz 空间上是 $\mathcal{F}$ 的逆）。取 $g = f$ 得 $\|\hat{f}\|_2 = \|f\|_2$。由于 $\mathcal{S}$ 在 $L^2$ 中稠密，等距延拓到 $L^2$ 上。直接定义：对 $f \in L^2$，取 $\mathcal{S}$ 中序列 $f_n \to f$（$L^2$），则 $\hat{f}_n$ 为 $L^2$ 中 Cauchy 序列，其极限定义为 $\hat{f}$。此延拓是酉算子。$\blacksquare$

**推论 123.3**（Parseval 恒等式）：$\langle f, g \rangle = \langle \hat{f}, \hat{g} \rangle$，即 $\int f \bar{g} = \int \hat{f} \bar{\hat{g}}$。

**定理 123.4**（Hausdorff-Young 不等式）：对 $1 \leq p \leq 2$，$\|\hat{f}\|_{p'} \leq \|f\|_p$，其中 $1/p + 1/p' = 1$。即 Fourier 变换是 $L^p \to L^{p'}$ 的有界算子（$p \in [1, 2]$）。

**证明**：对 $p = 1$，$\|\hat{f}\|_\infty \leq \|f\|_1$（直接估计）。对 $p = 2$，Plancherel 给出 $\|\hat{f}\|_2 = \|f\|_2$。对 $1 < p < 2$，令 $\frac{1}{p} = \frac{1-\theta}{1} + \frac{\theta}{2}$（$0 < \theta < 1$），则 $\frac{1}{p'} = \frac{1-\theta}{\infty} + \frac{\theta}{2} = \frac{\theta}{2}$。由 Riesz-Thorin 插值定理，$\|\mathcal{F}\|_{L^p \to L^{p'}} \leq \|\mathcal{F}\|_{L^1 \to L^\infty}^{1-\theta} \cdot \|\mathcal{F}\|_{L^2 \to L^2}^\theta \leq 1^{1-\theta} \cdot 1^\theta = 1$，得 $\|\hat{f}\|_{p'} \leq \|f\|_p$。$\blacksquare$

### 123.3 Schwartz 空间与缓增分布

**定义 123.2**（Schwartz 空间）：**Schwartz 空间** $\mathcal{S}(\mathbb{R}^n)$ 是所有光滑函数 $\varphi$ 的集合，满足对所有多重指标 $\alpha, \beta$，

$$\sup_{x \in \mathbb{R}^n} |x^\alpha D^\beta \varphi(x)| < \infty$$

即 $\varphi$ 及其所有导数比任意多项式下降更快。

**定理 123.5**：Fourier 变换是 $\mathcal{S}(\mathbb{R}^n)$ 上的同构（双射连续线性映射）。$\mathcal{S}$ 在 Fourier 变换下的自同构性是调和分析的核心。

**证明**：取 $f \in \mathcal{S}$。由 $\widehat{D^\alpha f}(\xi) = (2\pi i \xi)^\alpha \hat{f}(\xi)$ 和 $\widehat{x^\beta f}(\xi) = (i/2\pi)^{|\beta|} D^\beta \hat{f}(\xi)$，$\hat{f}$ 光滑且对任意 $\alpha,\beta$，$\xi^\alpha D^\beta \hat{f}(\xi) = (2\pi i)^{-|\beta|} \mathcal{F}[D^\alpha(x^\beta f)](\xi)$ 有界（因 $\mathcal{F}: L^1 \to L^\infty$ 有界，且 $D^\alpha(x^\beta f) \in L^1$）。故 $\hat{f} \in \mathcal{S}$，即 $\mathcal{F}(\mathcal{S}) \subseteq \mathcal{S}$。同理 $\mathcal{F}^{-1}(\mathcal{S}) \subseteq \mathcal{S}$。由 Fourier 反演公式，$\mathcal{F}$ 是 $\mathcal{S}$ 上的双射，且关于 Schwartz 拓扑连续。$\blacksquare$

**定义 123.3**（缓增分布）：$\mathcal{S}(\mathbb{R}^n)$ 的对偶空间 $\mathcal{S}'(\mathbb{R}^n)$ 称为**缓增分布**空间。缓增分布 $u$ 的 **Fourier 变换** $\hat{u}$ 由对偶定义：

$$\langle \hat{u}, \varphi \rangle = \langle u, \hat{\varphi} \rangle \quad (\varphi \in \mathcal{S})$$

### 123.4 Poisson 求和公式

**定理 123.6**（Poisson 求和公式）：设 $f$ 是 Schwartz 函数。则

$$\sum_{n \in \mathbb{Z}^n} f(n) = \sum_{m \in \mathbb{Z}^n} \hat{f}(m)$$

更一般地，$\sum_{n \in \mathbb{Z}^n} f(x + n) = \sum_{m \in \mathbb{Z}^n} \hat{f}(m) e^{2\pi i m \cdot x}$（分布意义下）。

**证明**：定义 $F(x) = \sum_{n \in \mathbb{Z}^n} f(x + n)$（$\mathbb{Z}^n$-周期函数）。$F$ 的 Fourier 系数为 $\hat{f}(m)$，由 Fourier 级数理论即得。$\blacksquare$

---

---

---

---

---
---

## 第138章：奇异积分

奇异积分理论是现代调和分析的基石，由 Alberto Calderón 和 Antoni Zygmund 在 20 世纪 50 年代系统建立。其起源可追溯至 Hilbert 在 20 世纪初对复分析边界行为的研究——Hilbert 变换（共轭函数算子）是第一个被深入研究的奇异积分算子，其 $L^p$ 有界性由 Marcel Riesz 在 1928 年证明。Calderón 和 Zygmund 的革命性贡献在于将这一维结果推广到高维：他们发现，只要积分核满足适当的光滑性条件和消失矩条件，一类广泛的卷积型奇异积分算子在所有 $L^p$（$1 < p < \infty$）上都有界。其核心工具——Calderón-Zygmund 分解——将任意 $L^1$ 函数拆分为"好部分"（有界）和"坏部分"（集中于立方体上且均值为零），这一分解技巧在此后数十年的分析学发展中无处不在。本章与 Fourier 变换（第137章）密切呼应：Fourier 乘子理论表明奇异积分算子是 Fourier 乘子光滑性的边界情形，而 Hardy-Littlewood 极大函数（第139章）则提供了控制奇异积分的基本点态估计。

### 124.1 Hilbert 变换

**定义 124.1**（Hilbert 变换）：$\mathbb{R}$ 上的 **Hilbert 变换** $H$ 定义为

$$Hf(x) = \frac{1}{\pi} \operatorname{p.v.} \int_{-\infty}^\infty \frac{f(y)}{x - y} dy = \frac{1}{\pi} \lim_{\varepsilon \to 0} \int_{|x-y| > \varepsilon} \frac{f(y)}{x - y} dy$$

**命题 124.1**（Hilbert 变换的性质）：
1. $H$ 是 $L^2(\mathbb{R})$ 上的酉算子：$H^* = -H$，$H^2 = -I$
2. Fourier 乘子：$\widehat{Hf}(\xi) = -i \operatorname{sgn}(\xi) \hat{f}(\xi)$
3. $H$ 是 $L^p(\mathbb{R})$ 上的有界算子（$1 < p < \infty$）
4. $H$ 与伸缩、平移交换

**定理 124.1**（M. Riesz 定理）：Hilbert 变换在 $L^p(\mathbb{R})$ 上有界（$1 < p < \infty$）。$\|Hf\|_p \leq C_p \|f\|_p$。

**证明**：$p=2$ 时由 Fourier 乘子 $\widehat{Hf}(\xi) = -i\operatorname{sgn}(\xi)\hat{f}(\xi)$ 及 Plancherel 得 $\|Hf\|_2 = \|f\|_2$。对 $1 < p < 2$，利用 Calderón-Zygmund 分解将 $f$ 分解为"好"部分 $g$ 与"坏"部分 $b$。对 $g$ 用 $L^2$ 估计，对 $b$ 用核 $1/x$ 的光滑性及消去条件 $\int_{|x|>2|y|} (H b_k)(x) dx$ 控制，得弱 $(1,1)$ 估计 $|\{|Hf|>\lambda\}| \leq C\|f\|_1/\lambda$。由 Marcinkiewicz 插值定理，$H$ 在 $L^p$（$1 < p \leq 2$）有界。$p>2$ 由对偶性 $(H)^* = -H$ 推出。$\blacksquare$

### 124.2 Calderón-Zygmund 分解

**定理 124.2**（Calderón-Zygmund 分解）：设 $f \in L^1(\mathbb{R}^n)$，$f \geq 0$，$\lambda > 0$。则存在 $\mathbb{R}^n$ 的分解：$f = g + b$，其中
- $g$（"好"部分）：$|g(x)| \leq 2^n \lambda$ 几乎处处，$\|g\|_1 \leq \|f\|_1$
- $b = \sum_k b_k$（"坏"部分）：$b_k$ 支撑在不相交的二进方体 $Q_k$ 上，$\int_{Q_k} b_k = 0$，$\|b_k\|_1 \leq 2^{n+1} \lambda |Q_k|$，且 $\sum_k |Q_k| \leq \lambda^{-1} \|f\|_1$

**证明**：将 $\mathbb{R}^n$ 划分为二进方体网格 $\mathcal{D} = \bigcup_{k \in \mathbb{Z}} \mathcal{D}_k$，其中 $\mathcal{D}_k$ 为边长 $2^{-k}$ 的二进方体。对每个二进方体 $Q$，计算均值 $\frac{1}{|Q|}\int_Q f$。若 $\frac{1}{|Q|}\int_Q f > \lambda$，则选取 $Q$ 为"坏"方体。将未被选中的方体递归二分，直至所有子方体的均值 $\leq \lambda$。最终选出的极大"坏"方体族 $\{Q_k\}$ 满足：$\lambda < \frac{1}{|Q_k|}\int_{Q_k} f \leq 2^n \lambda$（由父方体的均值 $\leq \lambda$ 保证）。定义 $g(x) = f(x)$（$x \notin \bigcup Q_k$）和 $g(x) = \frac{1}{|Q_k|}\int_{Q_k} f$（$x \in Q_k$），则 $|g| \leq 2^n \lambda$ 且 $\|g\|_1 \leq \|f\|_1$。定义 $b_k = (f - \frac{1}{|Q_k|}\int_{Q_k} f)\mathbf{1}_{Q_k}$，则 $b = \sum b_k$，$\int b_k = 0$，$\|b_k\|_1 \leq 2^{n+1}\lambda|Q_k|$。由 $\sum|Q_k| \leq \lambda^{-1}\sum \int_{Q_k} f \leq \lambda^{-1}\|f\|_1$ 得所需估计。$\blacksquare$

### 124.3 奇异积分算子

**定义 124.2**（Calderón-Zygmund 核）：函数 $K: \mathbb{R}^n \setminus \{0\} \to \mathbb{C}$ 称为 **Calderón-Zygmund 核**（或标准核），如果满足：
1. $|K(x)| \leq C |x|^{-n}$（大小条件）
2. $|\nabla K(x)| \leq C |x|^{-n-1}$（光滑性条件）
3. $\int_{r < |x| < R} K(x) dx = 0$（对所有 $0 < r < R$，消去条件）

**定义 124.3**（奇异积分算子）：与核 $K$ 关联的**奇异积分算子** $T$ 定义为

$$Tf(x) = \operatorname{p.v.} \int_{\mathbb{R}^n} K(x - y) f(y) dy = \lim_{\varepsilon \to 0} \int_{|x-y| > \varepsilon} K(x - y) f(y) dy$$

**定理 124.3**（Calderón-Zygmund 定理）：若 $T$ 是奇异积分算子且在 $L^2$ 上有界，则 $T$ 在 $L^p$ 上有界（$1 < p < \infty$），且满足弱 $(1, 1)$ 型估计：

$$|\{x : |Tf(x)| > \lambda\}| \leq \frac{C}{\lambda} \|f\|_1$$

**证明**：先证 $T$ 在 $L^2$ 上有界。对任意 $f \in L^1 \cap L^2$，取 Calderón-Zygmund 分解 $f = g + b$（$\lambda > 0$），其中 $\|g\|_\infty \leq C\lambda$，$b = \sum b_k$ 支撑于不相交二进方体 $Q_k$，$\int b_k = 0$，$\sum |Q_k| \leq \|f\|_1/\lambda$。由 $L^2$ 有界性，$|\{|Tg| > \lambda/2\}| \leq C\lambda^{-2}\|g\|_2^2 \leq C\lambda^{-2}\cdot \lambda\|g\|_1 \leq C\|f\|_1/\lambda$。对 $b$ 部分，将 $Tb_k$ 限制在 $2Q_k$（二倍方体）之外，利用核的光滑性 $|\nabla K(x)| \leq C|x|^{-n-1}$ 和 $\int b_k = 0$ 得 $|Tb_k(x)| \leq C\lambda |Q_k|^{(n+1)/n}/|x-c_k|^{n+1}$（$x \notin 2Q_k$）。积分估计给出弱 $(1,1)$ 型，组合两部分即得。由 Marcinkiewicz 插值，$T$ 在 $L^p$（$1 < p \leq 2$）有界；$p > 2$ 由对偶性。$\blacksquare$

**定理 124.5**（Cotlar 引理，1955）：设 $\{T_j\}_{j \in \mathbb{Z}}$ 是 Hilbert 空间 $\mathcal{H}$ 上的一族有界算子。若存在 $\gamma: \mathbb{Z} \to \mathbb{R}_{\geq 0}$ 满足 $\sum_{k \in \mathbb{Z}} \sqrt{\gamma(k)} < \infty$，使得 $\|T_i^* T_j\| \leq \gamma(i-j)^2$ 和 $\|T_i T_j^*\| \leq \gamma(i-j)^2$ 对所有 $i, j$ 成立，则级数 $\sum_j T_j$ 在强算子拓扑下收敛，且 $\|\sum_j T_j\| \leq \sum_k \sqrt{\gamma(k)}$。

**证明**：对有限和 $S_N = \sum_{|j| \leq N} T_j$，考虑 $(S_N^* S_N)^m = \sum_{j_1,\ldots,j_{2m}} T_{j_1}^* T_{j_2} T_{j_3}^* \cdots T_{j_{2m}}$。利用几乎正交条件，对每项交替使用 $\|T_i^* T_j\|$ 和 $\|T_i T_j^*\|$ 的界，得 $\|S_N\|^{2m} = \|(S_N^* S_N)^m\| \leq (\sum_k \sqrt{\gamma(k)})^{2m}$（$m \to \infty$ 取幂根）。令 $m \to \infty$ 得 $\|S_N\| \leq \sum_k \sqrt{\gamma(k)}$，与 $N$ 无关。由 Cauchy 准则，$\sum T_j$ 强收敛。Cotlar 引理是证明奇异积分算子 $L^2$ 有界性的核心工具：将核 $K$ 按频率二进分解为 $K = \sum_j K_j$，对每个分片算子 $T_j$ 验证几乎正交性条件 $\|T_i^* T_j\| \leq C 2^{-|i-j|\varepsilon}$，则级数在 $L^2$ 上收敛且有界。其应用场景包括：Hilbert 变换的 $L^2$ 有界性、Calderón 交换子、Fourier 乘子定理以及仿积算子的有界性。$\blacksquare$

### 124.4 Marcinkiewicz 插值定理

**定理 124.4**（Marcinkiewicz 插值定理）：设 $T$ 是次线性算子，满足：
- 弱 $(p_0, q_0)$ 型：$|\{|Tf| > \lambda\}| \leq (A_0 \|f\|_{p_0} / \lambda)^{q_0}$
- 弱 $(p_1, q_1)$ 型：$|\{|Tf| > \lambda\}| \leq (A_1 \|f\|_{p_1} / \lambda)^{q_1}$

其中 $1 \leq p_0 < p_1 \leq \infty$，$1 \leq q_0, q_1 \leq \infty$，$q_0 \neq q_1$。则对 $p_\theta$ 满足 $\frac{1}{p_\theta} = \frac{1-\theta}{p_0} + \frac{\theta}{p_1}$，$T$ 在 $L^{p_\theta}$ 上是强有界的（$0 < \theta < 1$）。

**证明**：对 $f$ 作水平分解 $f^\lambda = f \mathbf{1}_{\{|f| > a\lambda\}}$，$f_\lambda = f - f^\lambda$（$a>0$ 待定）。由次可加性，$\{|Tf| > \lambda\} \subseteq \{|Tf^\lambda| > \lambda/2\} \cup \{|Tf_\lambda| > \lambda/2\}$。对 $f^\lambda$ 用弱 $(p_0,q_0)$ 界，对 $f_\lambda$ 用弱 $(p_1,q_1)$ 界。将 $\|Tf\|_{p_\theta}^{p_\theta}$ 写为层饼积分 $p_\theta \int_0^\infty \lambda^{p_\theta-1} |\{|Tf| > \lambda\}| d\lambda$，代入分布函数估计，分离 $\lambda$ 积分区域。选取最优的 $a$ 平衡两项，最终得 $\|Tf\|_{p_\theta} \leq C_{p_0,p_1,q_0,q_1,\theta} A_0^{1-\theta} A_1^\theta \|f\|_{p_\theta}$。$\blacksquare$

## Calderón-Zygmund 理论的现代发展

Calderón-Zygmund 理论自 1950 年代创立以来，已发展成为调和分析中最核心的理论框架，其影响远超奇异积分本身。**$T(1)$ 定理**（David-Journe 1984）是 Calderón-Zygmund 理论中最重要的后续发展：一个与 Calderón-Zygmund 核关联的算子 $T$ 在 $L^2$ 上有界当且仅当 $T(1)$ 和 $T^*(1)$ 属于 BMO（有界平均振荡函数空间）。该定理将 $L^2$ 有界性的判定归结为对两个特定函数（常函数 1）的检验，极大简化了奇异积分算子有界性的证明，并推广了此前 Cotlar 引理和几乎正交分解方法。**$T(b)$ 定理**（David-Journe-Semmes 1985）进一步将 $T(1)$ 定理推广到非双倍测度情形，允许用"适应性"函数 $b$（满足某种增生条件）代替常函数 1，这为 Lipschitz 曲线上 Cauchy 积分的有界性证明提供了关键工具。**Calderón 交换子**（1965）是 Calderón-Zygmund 理论的经典应用：交换子 $[A, T]f = A(Tf) - T(Af)$ 在 $L^p$ 上的有界性反映了算子 $T$ 与乘子 $A$ 的非交换性，构成了 Coifman-Rochberg-Weiss 交换子理论（1976）的基础。**Muckenhoupt 权理论**（1972）将 Calderón-Zygmund 算子的有界性推广到加权 $L^p$ 空间：$T$ 在 $L^p(w)$ 上有界当且仅当 $w \in A_p$，这为加权不等式提供了一个统一的特征刻画。**向量值奇异积分理论**（Burkholder 1980s）将奇异积分算子作用于 Banach 空间值函数，$T$ 在 $L^p(\mathbb{R}^n; X)$ 上有界当且仅当 $X$ 是 UMD 空间（无条件鞅差空间），这揭示了调和分析中奇异积分有界性与 Banach 空间几何之间的深刻联系。

---

---

## 第139章：Hardy-Littlewood 极大函数

Hardy-Littlewood 极大函数由 G. H. Hardy 和 J. E. Littlewood 于 1930 年在研究 Fourier 级数的 summability 问题时引入，是调和分析中最简单却最深刻的非线性算子。其核心思想极为朴素：对局部可积函数的每一点，取其所在任意球上的积分平均的上确界。这一运算将函数"放大"为其所有局部平均值的主导项，从而产生一个比原函数更好的"正则化版本"。极大函数的根本重要性在于它作为"控制算子"的普适性——几乎所有经典调和分析中的线性算子（包括 Hilbert 变换、Riesz 变换和各类奇异积分）都可以被 Hardy-Littlewood 极大函数逐点控制，这使得极大函数的 $L^p$ 有界性成为证明其他算子 $L^p$ 有界性的"第一道关卡"。Hardy 和 Littlewood 最初证明了一维情形下 $p > 1$ 的强型不等式，而 Wiener 在 1939 年将其推广到高维。在现代分析中，极大函数理论已被推广到一般的度量测度空间（空间 $(X,d,\mu)$ 满足 doubling 条件），成为度量测度空间上调和分析的出发点。

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

**证明**：核心是建立"好 $\lambda$ 不等式"：存在 $\gamma > 0$ 使对任意 $\lambda > 0$ 和充分小的 $\varepsilon > 0$，有 $|\{Mf > 2\lambda, M^\sharp f \leq \gamma\lambda\}| \leq C \varepsilon |\{Mf > \lambda\}|$。该估计通过 Calderón-Zygmund 分解证明：在集合 $\{Mf > \lambda\}$ 上用 Whitney 型分解，将极大函数与锐极大函数的局部平均振动关联。然后乘以 $\lambda^{p-1}$ 对 $\lambda$ 积分，利用 $\|Mf\|_p^p \approx \int \lambda^{p-1} |\{Mf > \lambda\}| d\lambda$，将 $Mf$ 的分布由 $M^\sharp f$ 控制，取 $\varepsilon$ 充分小使 $C\varepsilon < 1/2$ 即得。$\blacksquare$

### 125.3 加权不等式

**定义 125.4**（$A_p$ 权）：非负局部可积函数 $w$ 称为 **$A_p$ 权**（$1 < p < \infty$），如果

$$\sup_B \left(\frac{1}{|B|} \int_B w(x) dx\right) \left(\frac{1}{|B|} \int_B w(x)^{-1/(p-1)} dx\right)^{p-1} < \infty$$

$A_1$ 权：$M w(x) \leq C w(x)$ 几乎处处。

**定理 125.4**（Muckenhoupt 定理）：Hardy-Littlewood 极大函数在加权 $L^p(w)$ 空间上有界当且仅当 $w \in A_p$（$1 < p < \infty$）。这给出了极大函数 $L^p$ 有界性权条件的精确刻画。

**证明**：（必要性）若 $M$ 在 $L^p(w)$ 上有界，对任意球 $B$，取 $f = w^{-1/(p-1)}\mathbf{1}_B$，应用 $M$ 的有界性和 $Mf(x) \geq \frac{1}{|B|}\int_B f$（$x \in B$），得 $(\frac{1}{|B|}\int_B w)(\frac{1}{|B|}\int_B w^{-1/(p-1)})^{p-1} \leq C$，故 $w \in A_p$。（充分性）用反向 Hölder 不等式：$A_p$ 权满足对某 $\delta > 0$，$w^{1+\delta} \in A_p$。构造二进极大函数，逐层用 Calderón-Zygmund 分解获得加权弱 $(1,1)$ 估计，再由插值得加权强 $(p,p)$ 估计。$\blacksquare$

## 极大函数与调和分析的统一方法

Hardy-Littlewood 极大函数是调和分析中控制论的核心工具，其思想可以追溯到 Hardy 和 Littlewood 对 Fourier 级数求和的研究（1930）。极大函数方法的基本范式是：将复杂算子 $T$ 的逐点行为用极大函数 $Mf$ 控制，然后利用 $M$ 的 $L^p$ 有界性推导 $T$ 的 $L^p$ 有界性。**Fefferman-Stein 锐极大函数**（1972）$M^\sharp f$ 通过衡量 $f$ 的局部平均振荡，揭示了 $L^p$ 范数与 BMO 半范数之间的对偶关系：$\|f\|_p \leq C_p \|M^\sharp f\|_p$ 对于具有消失平均的 $f$ 成立。这一不等式是 Fefferman-Stein 证明 $L^p$ 中 Calderón-Zygmund 算子有界性的核心工具，避免了逐点估计的困难。**好 $\lambda$ 不等式**（good-$\lambda$ inequality, Burkholder-Gundy 1970）是极大函数方法中最重要的技术工具：$|\{Mf > 2\lambda, M^\sharp f \leq \gamma\lambda\}| \leq C\varepsilon|\{Mf > \lambda\}|$ 允许将 $Mf$ 的分布函数由 $M^\sharp f$ 控制，从而将奇异积分算子的有界性归结为极大函数的控制。**$A_\infty$ 权**是所有 $A_p$ 权的并集，由反向 Hölder 不等式刻画：$w \in A_\infty$ 当且仅当存在 $\delta > 0$ 和 $C$ 使得 $\frac{1}{|B|}\int_B w^{1+\delta} \leq C(\frac{1}{|B|}\int_B w)^{1+\delta}$。$A_\infty$ 权具有性质：若 $w \in A_\infty$，则 $w$ 赋给球 $B$ 的测度 $w(B)$ 与 $|B|$ 的关系满足 $w(E)/w(B) \leq C(|E|/|B|)^\delta$。**Rp 权**（reverse Hölder class）是 $A_\infty$ 权理论的自然延伸，在非线性调和分析（如 $p$-Laplacian 方程的梯度估计）中扮演关键角色。极大函数理论还与**非线性位势理论**（Wolff 位势）、**面积积分**（Lusin 面积积分）和**非切向极大函数**（nontangential maximal function）等构成 Hardy 空间理论的完整框架，为调和分析、偏微分方程和复分析中的边界值问题提供了统一的分析工具。