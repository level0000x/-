## 第140章：Littlewood-Paley 理论
Littlewood-Paley 理论将函数分解为不同频率的分量，通过平方函数来研究函数的 $L^p$ 性质。它是现代调和分析的核心工具，广泛应用于 PDE 和奇异积分理论。

### 126.1 二进分解

**定义 126.1**（二进分解）：选择光滑函数 $\varphi \in C_c^\infty(\mathbb{R}^n)$，支撑在 $\{1/2 \leq |\xi| \leq 2\}$，满足 $\sum_{j \in \mathbb{Z}} \varphi(2^{-j} \xi) = 1$（$\xi \neq 0$）。定义 **Littlewood-Paley 算子**：

$$\Delta_j f = \mathcal{F}^{-1}(\varphi(2^{-j} \cdot) \hat{f})$$

$\Delta_j f$ 是 $f$ 在频率 $|\xi| \sim 2^j$ 附近的分量。

**命题 126.1**（二进分解的性质）：$f = \sum_{j \in \mathbb{Z}} \Delta_j f$（在 $\mathcal{S}'$ 中，模去多项式）。$\Delta_j f$ 是光滑函数，频率集中在环形区域 $\{2^{j-1} \leq |\xi| \leq 2^{j+1}\}$。

### 126.2 平方函数

**定义 126.2**（Littlewood-Paley 平方函数）：**Littlewood-Paley $g$-函数**为

$$g(f)(x) = \left(\sum_{j \in \mathbb{Z}} |\Delta_j f(x)|^2\right)^{1/2}$$

**Lusin 面积函数**（$S$-函数）和 **Littlewood-Paley $g_\lambda^*$-函数**是 $g$-函数的变体，涉及时间和空间上的平均。

**定理 126.1**（Littlewood-Paley 定理）：对 $1 < p < \infty$，存在常数 $C_p$ 使得

$$C_p^{-1} \|f\|_p \leq \|g(f)\|_p \leq C_p \|f\|_p$$

即 $L^p$ 范数与平方函数的 $L^p$ 范数等价。平方函数允许用"频率分量的大小"来刻画函数的 $L^p$ 性质。

*证明思路*：$p = 2$ 时由 Plancherel 定理直接得到。对一般 $p$，使用 Calderón-Zygmund 理论或向量值奇异积分理论。∎

**推论 126.2**（平方函数与 Sobolev 空间）：Sobolev 范数 $\|f\|_{W^{s,p}}$ 与 $\|(\sum_{j \in \mathbb{Z}} 2^{2js} |\Delta_j f|^2)^{1/2}\|_p$ 等价（$1 < p < \infty$）。

### 126.3 Fourier 乘子

**定义 126.3**（Fourier 乘子）：函数 $m: \mathbb{R}^n \to \mathbb{C}$ 定义 **Fourier 乘子算子** $T_m$ 为

$$\widehat{T_m f}(\xi) = m(\xi) \hat{f}(\xi)$$

**定理 126.3**（Mikhlin 乘子定理）：设 $m \in C^\infty(\mathbb{R}^n \setminus \{0\})$ 满足 $|\partial^\alpha m(\xi)| \leq C_\alpha |\xi|^{-|\alpha|}$ 对所有多重指标 $\alpha$。则 $T_m$ 在 $L^p(\mathbb{R}^n)$ 上有界（$1 < p < \infty$）。

**定理 126.4**（Hörmander 乘子定理）：Mikhlin 条件的更精细版本，使用 Sobolev 空间代替逐点导数条件，允许乘子有更低的平滑性。

### 126.4 函数空间的 Littlewood-Paley 刻画

**定理 126.4**（Besov 空间与 Triebel-Lizorkin 空间）：使用 Littlewood-Paley 分解可以定义一般的函数空间尺度：
- **Besov 空间** $B^s_{p,q}$：$\|f\|_{B^s_{p,q}} = \|(2^{js} \|\Delta_j f\|_p)_{j \in \mathbb{Z}}\|_{\ell^q}$
- **Triebel-Lizorkin 空间** $F^s_{p,q}$：$\|f\|_{F^s_{p,q}} = \|(\sum_{j \in \mathbb{Z}} 2^{jsq} |\Delta_j f|^q)^{1/q}\|_p$

这些空间统一了 Sobolev 空间（$F^s_{p,2} = W^{s,p}$，$1 < p < \infty$）、Hölder 空间（$B^s_{\infty,\infty} = C^s$）、Hardy 空间（$F^0_{p,2} = H^p$）和 BMO 空间（$F^0_{\infty,2} = \operatorname{BMO}$）。

**定理 126.5**（Sobolev 嵌入的 Littlewood-Paley 证明）：使用平方函数和 Bernstein 不等式，Sobolev 嵌入定理（V18 定理 93.2）可以通过频率分解给出简洁证明。

**定义 126.5**（仿积分解，Paraproduct）：Bony 的**仿积分解**（paraproduct decomposition）将两个函数的乘积分解为低频-低频、低频-高频和高频-低频三部分：

$$fg = \pi_f(g) + \pi_g(f) + R(f, g)$$

其中 $\pi_f(g)$ 是 $f$ 对 $g$ 的仿积（低频乘以高频），$R(f, g)$ 是余项（高频乘以高频）。仿积分是研究非线性 PDE 中乘积和复合函数正则性的关键工具。

### 126.5 Hardy 空间 $H^1$ 的原子分解

**定义 126.6**（$H^1$ 原子）：函数 $a \in L^2(\mathbb{R}^n)$ 称为 **$H^1$-原子**，如果存在球 $B$ 使得：(1) $\operatorname{supp}(a) \subseteq B$；(2) $\|a\|_\infty \leq |B|^{-1}$（大小条件）；(3) $\int_{\mathbb{R}^n} a(x) dx = 0$（消失矩条件）。

**定理 126.6**（$H^1$ 的原子分解）：$f \in H^1(\mathbb{R}^n)$ 当且仅当存在 $H^1$-原子的可数族 $\{a_j\}$ 和系数 $\{\lambda_j\} \subseteq \mathbb{C}$ 满足 $\sum |\lambda_j| < \infty$，使得 $f = \sum_j \lambda_j a_j$（在分布意义下）。此时 $\|f\|_{H^1} \sim \inf \sum |\lambda_j|$。

$H^1$ 取代 $L^1$ 在奇异积分理论中的角色是因为奇异积分核的消去条件与原子消失矩条件相匹配：$L^1$ 在奇异积分下不封闭（仅满足弱 $(1,1)$ 型），但 $H^1$ 是最大的满足 Calderón-Zygmund 算子在其上有界的函数空间。$H^1$ 原子分解由 Coifman 和 Weiss 建立，为研究奇异积分的端点估计提供了基本工具。

---

---

---

---

---