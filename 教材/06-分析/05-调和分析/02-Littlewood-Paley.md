## 第140章：Littlewood-Paley理论

Littlewood-Paley理论通过频率二进分解将函数拆分为不同频段的分量，以平方函数研究函数的$L^p$性质，是现代调和分析的核心工具。

### 二进分解

**定义140.1**（Littlewood-Paley二进分解）：选取光滑函数$\varphi \in C_c^\infty(\mathbb{R}^n)$，支撑于环形区域$\{1/2 \leq |\xi| \leq 2\}$，满足对所有$\xi \neq 0$有$\sum_{j \in \mathbb{Z}} \varphi(2^{-j}\xi) = 1$。定义**Littlewood-Paley算子**
$$\Delta_j f = \mathcal{F}^{-1}\big(\varphi(2^{-j}\cdot) \hat{f}\big)$$
$\Delta_j f$为$f$在频段$|\xi| \sim 2^j$上的分量，是光滑函数。记低频算子$S_j f = \sum_{k \leq j-1} \Delta_k f$。

**定理140.1**（二进分解的完备性）：对$f \in \mathcal{S}'(\mathbb{R}^n)$，有$f = \sum_{j \in \mathbb{Z}} \Delta_j f$（在$\mathcal{S}'$中，模去多项式）。$\Delta_j$的卷积核$\psi_j(x) = 2^{jn} \check{\varphi}(2^j x)$满足$\|\psi_j\|_1 = \|\check{\varphi}\|_1$一致有界。

**证明**：由乘子恒等式$\sum \varphi(2^{-j}\xi) = 1$（$\xi \neq 0$）配合Fourier逆变换即得分解。$\psi_j$的$L^1$范数由伸缩不变性得出。$\blacksquare$

**定理140.2**（Bernstein不等式）：对$0 < p \leq \infty$，
$$\|\Delta_j f\|_{L^q} \leq C 2^{jn(1/p - 1/q)} \|\Delta_j f\|_{L^p} \quad (q \geq p)$$
即频段定位在$|\xi| \sim 2^j$的函数，其$L^q$范数以$2^{jn(1/p-1/q)}$倍数受$L^p$范数控制。

**证明**：将$\Delta_j f$写为$\psi_j * (\Delta_j f)$。由Young不等式$\|\psi_j * g\|_q \leq \|\psi_j\|_r \|g\|_p$（$1 + 1/q = 1/r + 1/p$），且$\|\psi_j\|_r \leq C 2^{jn/r'}$，即得估计。$\blacksquare$

### 平方函数

**定义140.2**（Littlewood-Paley $g$-函数 — Poisson半群版本）：设$P_t = e^{-t\sqrt{-\Delta}}$为Poisson半群（即$P_t f = P(\cdot, t) * f$，$P(x,t) = c_n t / (|x|^2 + t^2)^{(n+1)/2}$为Poisson核）。定义Littlewood-Paley $g$-函数
$$g(f)(x) = \left( \int_0^\infty \left| \frac{\partial}{\partial t} P_t * f(x) \right|^2 t \, dt \right)^{1/2}$$

等价地，以频域二进分解定义**离散$g$-函数**：$g_d(f)(x) = (\sum_{j \in \mathbb{Z}} |\Delta_j f(x)|^2)^{1/2}$。两者在$L^p$范数下等价。

**定义140.3**（Lusin面积积分）：对$\alpha > 0$，定义**Lusin面积积分**
$$S_\alpha(f)(x) = \left( \int_{\Gamma_\alpha(x)} |\nabla_{y,t} P_t * f(y)|^2 t^{1-n} \, dy \, dt \right)^{1/2}$$
其中$\Gamma_\alpha(x) = \{(y,t) \in \mathbb{R}^n \times (0,\infty) : |x-y| < \alpha t\}$为以$x$为顶点的锥。$S_\alpha$在锥而非仅铅垂线上平均，比$g$-函数提供更强的空间局部化信息。当$\alpha = 1$时简记为$S(f)$。

**定理140.3**（Littlewood-Paley定理）：对$1 < p < \infty$，存在常数$a_p, A_p > 0$使
$$a_p \|f\|_{L^p} \leq \|g_d(f)\|_{L^p} \leq A_p \|f\|_{L^p}, \quad a_p \|f\|_{L^p} \leq \|S(f)\|_{L^p} \leq A_p \|f\|_{L^p}$$
即$L^p$范数与平方函数的$L^p$范数等价。$g_d(f)$、$g(f)$与$S(f)$三者$L^p$范数相互等价。

**证明**：$p = 2$时由Plancherel定理直接得到（$\|g_d(f)\|_2^2 = \sum \|\Delta_j f\|_2^2 = \|f\|_2^2$乘以$\sum \varphi^2(2^{-j}\xi) \asymp 1$因子）。对一般$p$，使用Calderón-Zygmund向量值奇异积分理论——算子$f \mapsto \{\Delta_j f\}_{j \in \mathbb{Z}}$对应$\ell^2$-值Fourier乘子，由Mikhlin乘子定理验证乘子条件即得$L^p$有界性。反向不等式由对偶（$\Delta_j$的自伴性）得出。$\blacksquare$

**定理140.4**（平方函数与Sobolev空间）：对$1 < p < \infty$，$s \in \mathbb{R}$，Sobolev范数等价于
$$\|f\|_{W^{s,p}} \sim \left\| \left( \sum_{j \in \mathbb{Z}} 2^{2js} |\Delta_j f|^2 \right)^{1/2} \right\|_{L^p}$$
这是Littlewood-Paley刻画Sobolev空间的经典结果。

### BMO空间与John-Nirenberg不等式

**定义140.4**（BMO空间 — 有界平均振动）：局部可积函数$f$属于**BMO**（Bounded Mean Oscillation），若
$$\|f\|_{\operatorname{BMO}} = \sup_{B} \frac{1}{|B|} \int_B |f(x) - f_B| \, dx < \infty$$
其中$B$遍历$\mathbb{R}^n$中所有球，$f_B = \frac{1}{|B|} \int_B f(y) dy$为$f$在$B$上的平均。模去常数后，$\|\cdot\|_{\operatorname{BMO}}$为范数。BMO包含所有有界函数以及$\log|x|$等，是$L^\infty$的自然推广。

**定理140.5**（John-Nirenberg不等式，1961）：存在仅依赖于维数$n$的常数$c_1, c_2$，使对任意球$B$和$\lambda > 0$，
$$\frac{|\{x \in B : |f(x) - f_B| > \lambda\}|}{|B|} \leq c_1 e^{-c_2 \lambda / \|f\|_{\operatorname{BMO}}}$$
即BMO函数的振动呈指数衰减分布——BMO是$L^\infty$在多尺度振荡意义下的温和偏离。

**证明**：核心是Calderón-Zygmund分解在BMO情形的逐层应用。对任意球$B$，若$f$在$B$上平均振动大，将$B$二进剖分，利用停时论证得振动分布指数衰减。具体：对$\lambda > \|f\|_{\operatorname{BMO}}$，构造$B$的Whitney型剖分，每层振动以$\|f\|_{\operatorname{BMO}}$控制，叠加得指数尾估计。$\blacksquare$

### Hardy空间$H^p$的原子分解

**定义140.5**（$H^p$-原子）：对$0 < p \leq 1$，函数$a \in L^2(\mathbb{R}^n)$称为**$H^p$-原子**若存在球$B$使得：(i) $\operatorname{supp}(a) \subseteq B$；(ii) $\|a\|_\infty \leq |B|^{-1/p}$（大小条件）；(iii) $\int_{\mathbb{R}^n} a(x) x^\alpha dx = 0$对所有$|\alpha| \leq \lfloor n(1/p - 1) \rfloor$（消失矩条件）。

**定理140.6**（$H^p$的原子分解 — Coifman-Weiss）：$f \in H^p(\mathbb{R}^n)$（$0 < p \leq 1$）当且仅当存在$H^p$-原子的可数族$\{a_j\}$与系数$\{\lambda_j\} \subseteq \mathbb{C}$满足$\sum |\lambda_j|^p < \infty$，使得$f = \sum_j \lambda_j a_j$（在分布意义下）。此时
$$\|f\|_{H^p} \sim \inf \left( \sum_j |\lambda_j|^p \right)^{1/p}$$
其中下确界取遍所有可能的原子分解。$H^1$的特殊性在于需要消失零阶矩即可：$\int a = 0$。

**证明**：充分性——将原子分解代入$H^p$的极大函数刻画或平方函数刻画验证范数。必要性——对$H^p$函数的Calderón-Zygmund分解逐层拆分为原子，每层的振动由停时论证控制，消失矩条件由Taylor展开保证。$\blacksquare$

### $H^1$与BMO的对偶性

**定理140.7**（Fefferman对偶定理，1971）：$\operatorname{BMO}(\mathbb{R}^n)$与$H^1(\mathbb{R}^n)$互为对偶空间：
$$\operatorname{BMO} = (H^1)^*, \quad H^1 = (\operatorname{VMO})^*$$
具体而言，$f \in \operatorname{BMO}$定义了$H^1$上的连续线性泛函$\varphi \mapsto \int f \varphi$，且$\|f\|_{\operatorname{BMO}} \sim \sup_{\|\varphi\|_{H^1} \leq 1} |\int f \varphi|$。

**证明**：一侧：对$H^1$原子$a$（支撑于$B$，$\int a = 0$，$\|a\|_\infty \leq 1/|B|$），
$$\left| \int f a \right| = \left| \int_B (f - f_B) a \right| \leq \|a\|_\infty \int_B |f - f_B| \leq \frac{1}{|B|} \cdot |B| \|f\|_{\operatorname{BMO}} = \|f\|_{\operatorname{BMO}}$$
由原子分解的线性性，得$\int f \varphi \leq C\|f\|_{\operatorname{BMO}} \|\varphi\|_{H^1}$。

另一侧（深度方向）：利用Carleson测度理论和帐篷空间。$\operatorname{BMO}$函数的非切向极大函数产生Carleson测度，反之Carleson测度对应$\operatorname{BMO}$函数。通过Poisson积分的帐篷空间表征构造泛函表示。$\blacksquare$

### 函数空间的Littlewood-Paley统一刻画

**定义140.6**（Besov空间与Triebel-Lizorkin空间）：利用Littlewood-Paley分解定义完整函数空间尺度：

- **Besov空间** $B^s_{p,q}$（$s \in \mathbb{R}$，$0 < p, q \leq \infty$）：
  $$\|f\|_{B^s_{p,q}} = \left\| \left( 2^{js} \|\Delta_j f\|_{L^p} \right)_{j \in \mathbb{Z}} \right\|_{\ell^q}$$

- **Triebel-Lizorkin空间** $F^s_{p,q}$（$s \in \mathbb{R}$，$0 < p < \infty$，$0 < q \leq \infty$）：
  $$\|f\|_{F^s_{p,q}} = \left\| \left( \sum_{j \in \mathbb{Z}} 2^{jsq} |\Delta_j f|^q \right)^{1/q} \right\|_{L^p}$$

这些空间统一了所有经典函数空间：
- $F^s_{p,2} = W^{s,p}$（Sobolev空间，$1 < p < \infty$）
- $F^0_{p,2} = H^p$（Hardy空间，$0 < p < \infty$）
- $F^0_{\infty,2} = \operatorname{BMO}$（BMO空间）
- $B^s_{\infty,\infty} = C^s$（Hölder-Zygmund空间）
- $F^s_{2,2} = B^s_{2,2} = H^s$（$L^2$-Sobolev空间）

**定理140.8**（Sobolev嵌入的Littlewood-Paley证明）：对$s_1 - n/p_1 \geq s_2 - n/p_2$（$s_1 \geq s_2$），有连续嵌入$B^{s_1}_{p_1,q} \hookrightarrow B^{s_2}_{p_2,q}$和$F^{s_1}_{p_1,q_1} \hookrightarrow F^{s_2}_{p_2,q_2}$。当$s_1 - n/p_1 = s_2 - n/p_2$时对应临界Sobolev嵌入。

**证明**：利用Bernstein不等式：$\|\Delta_j f\|_{L^{p_2}} \leq C 2^{jn(1/p_1 - 1/p_2)} \|\Delta_j f\|_{L^{p_1}}$。代入Besov范数得$\|f\|_{B^{s_2}_{p_2,q}} \leq C \|f\|_{B^{s_1}_{p_1,q}}$当$s_2 - n/p_2 \leq s_1 - n/p_1$。Triebel-Lizorkin情形需Minkowski不等式交换$\ell^q$和$L^p$范数。$\blacksquare$

---
*Littlewood-Paley理论以二进分解和平方函数为双翼：$g$-函数（Poisson半群版本与离散版本）和Lusin面积积分提供了频率分量的精确$L^p$控制。BMO空间经由John-Nirenberg不等式揭示了有界平均振动的指数衰减本质，Fefferman对偶定理$\operatorname{BMO} = (H^1)^*$则完成了Hardy空间理论的闭环。Besov与Triebel-Lizorkin空间以统一框架收纳了所有经典函数空间，是现代调和分析处理PDE正则性问题的基础语言。*

*卷二十四：调和分析终。*
