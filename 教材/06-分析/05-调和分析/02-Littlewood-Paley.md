## 第178章：Littlewood-Paley理论

Littlewood-Paley理论通过频率二进分解将函数拆分为不同频段的分量，以平方函数研究函数的$L^p$性质，是现代调和分析的核心工具。该理论起源于Littlewood和Paley在1930年代对Fourier级数二进块的研究，后经Stein、Fefferman等人的系统发展，成为处理奇异积分算子、函数空间刻画和PDE正则性估计的标准语言。其基本哲学是：与其直接研究函数$f$，不如研究其频率分量的平方和（即平方函数），后者在$L^p$理论中具有更好的行为。

### 二进分解

**定义140.1**（Littlewood-Paley二进分解）：选取光滑函数$\varphi \in C_c^\infty(\mathbb{R}^n)$，支撑于环形区域$\{\xi \in \mathbb{R}^n : 1/2 \leq |\xi| \leq 2\}$，满足对所有$\xi \neq 0$有$\sum_{j \in \mathbb{Z}} \varphi(2^{-j}\xi) = 1$。定义**Littlewood-Paley算子**
$$\Delta_j f = \mathcal{F}^{-1}\big(\varphi(2^{-j}\cdot) \hat{f}\big)$$
$\Delta_j f$为$f$在频段$|\xi| \sim 2^j$上的分量，是光滑函数。记低频算子$S_j f = \sum_{k \leq j-1} \Delta_k f$。

**构造细节**：取径向函数$\psi \in C_c^\infty(\mathbb{R}^n)$满足$0 \leq \psi(\xi) \leq 1$，$\psi(\xi) = 1$当$|\xi| \leq 1$，$\psi(\xi) = 0$当$|\xi| \geq 2$。定义$\varphi(\xi) = \psi(\xi/2) - \psi(\xi)$，则$\operatorname{supp} \varphi \subseteq \{1/2 \leq |\xi| \leq 2\}$，且$\sum_{j \in \mathbb{Z}} \varphi(2^{-j}\xi) = 1$（对$\xi \neq 0$）。低频部分由$\psi(\xi) = \sum_{j \leq 0} \varphi(2^{-j}\xi)$（$\xi \neq 0$）或引入$\Phi(\xi) = 1 - \sum_{j \geq 0} \varphi(2^{-j}\xi)$来处理。这一构造的关键在于$\varphi$的紧支性和光滑性，保证了$\Delta_j f$的快速衰减。

**性质**：$\Delta_j$的卷积核$\psi_j(x) = \mathcal{F}^{-1}[\varphi(2^{-j}\cdot)](x) = 2^{jn} \check{\varphi}(2^j x)$，其中$\check{\varphi} = \mathcal{F}^{-1}\varphi$为Schwartz函数。由$\varphi$的消失矩（$\int \varphi(\xi) d\xi = 0$，因为$\varphi$支撑远离原点），$\int \psi_j(x) dx = 0$。此外，$\|\psi_j\|_{L^1} = \|\check{\varphi}\|_{L^1}$与$j$无关，这一致有界性是Bernstein不等式和各类乘子定理的基础。

**定理140.1**（二进分解的完备性）：对$f \in \mathcal{S}'(\mathbb{R}^n)$，有$f = \sum_{j \in \mathbb{Z}} \Delta_j f$（在$\mathcal{S}'$中收敛，模去多项式）。更精确地说，该级数在$\mathcal{S}'/\mathcal{P}$中收敛，其中$\mathcal{P}$为多项式空间。若$f$的Fourier变换在原点附近为零（即$\hat{f}$在$0$的某邻域内为零），则级数在$\mathcal{S}'$中无条件收敛。

**证明**：由乘子恒等式$\sum_{j \in \mathbb{Z}} \varphi(2^{-j}\xi) = 1$（$\xi \neq 0$），对$\xi \neq 0$有$\hat{f}(\xi) = \sum_j \varphi(2^{-j}\xi) \hat{f}(\xi)$，配合Fourier逆变换即得分解。$\psi_j$的$L^1$范数由伸缩不变性得出：$\|\psi_j\|_{L^1} = \int 2^{jn}|\check{\varphi}(2^j x)| dx = \int |\check{\varphi}(y)| dy$。对$\mathcal{S}'$收敛性，有界子集上的收敛等价于对每个测试函数$\phi \in \mathcal{S}$的逐点收敛，由$\hat{f}$的缓增性和$\varphi$的紧支性保证。$\blacksquare$

**定理140.2**（Bernstein不等式）：对$0 < p \leq q \leq \infty$，存在仅依赖于$p,q,n,\varphi$的常数$C$，使得对任意$j \in \mathbb{Z}$和任意满足$\operatorname{supp} \hat{f} \subseteq \{|\xi| \leq C_0 2^j\}$的函数$f$，有
$$\|\partial^\alpha f\|_{L^q} \leq C 2^{j|\alpha| + jn(1/p - 1/q)} \|f\|_{L^p}$$
特别地，对$\Delta_j f$（其Fourier变换支撑于$|\xi| \sim 2^j$），有
$$\|\Delta_j f\|_{L^q} \leq C 2^{jn(1/p - 1/q)} \|\Delta_j f\|_{L^p} \quad (q \geq p)$$
即频段定位在$|\xi| \sim 2^j$的函数，其$L^q$范数以$2^{jn(1/p-1/q)}$倍数受$L^p$范数控制。这是频率局部化带来正则性增益的定量表达。

**证明**：将$\Delta_j f$写为$\psi_j * (\Delta_j f)$，其中$\psi_j(x) = 2^{jn}\check{\varphi}(2^j x)$如前。由Young不等式$\|\psi_j * g\|_{L^q} \leq \|\psi_j\|_{L^r} \|g\|_{L^p}$，其中$1 + 1/q = 1/r + 1/p$，即$1/r = 1 + 1/q - 1/p$。计算$\|\psi_j\|_{L^r} = 2^{jn}\left(\int |\check{\varphi}(2^j x)|^r dx\right)^{1/r} = 2^{jn(1 - 1/r)}\|\check{\varphi}\|_{L^r} \leq C 2^{jn(1/p - 1/q)}$。对于导数估计，注意到$\partial^\alpha$在Fourier变换侧对应乘子$(2\pi i\xi)^\alpha$，其$|\xi| \sim 2^j$上的模为$C 2^{j|\alpha|}$，结合Bernstein不等式即得。$\blacksquare$

**命题140.1**（Bernstein不等式的逆形式）：若$\operatorname{supp} \hat{f} \subseteq \{|\xi| \geq C_0 2^j\}$，则对$1 \leq p \leq q \leq \infty$有
$$\|f\|_{L^p} \leq C 2^{-jN} \sum_{|\alpha| = N} \|\partial^\alpha f\|_{L^p}$$
即高频函数由高阶导数控制。这是Bernstein不等式的对偶版本。

**证明**：选取$\tilde{\varphi} \in C_c^\infty$满足$\tilde{\varphi}(\xi) = 1$在$f$的支集上且$\tilde{\varphi}(0) = 0$。则$f = \tilde{\Delta}_j f$，其中$\tilde{\Delta}_j$的核为$2^{jn}\check{\tilde{\varphi}}(2^j x)$。由$\tilde{\varphi}$在原点处为零，$\check{\tilde{\varphi}}$的各阶矩为零，Taylor展开给出$\tilde{\Delta}_j f = 2^{-jN} \sum_{|\alpha|=N} \tilde{\Delta}_j^{(\alpha)} \partial^\alpha f$，其中$\tilde{\Delta}_j^{(\alpha)}$为有界于$L^p$的算子。$\blacksquare$

### 平方函数

**定义140.2**（Littlewood-Paley $g$-函数 — Poisson半群版本）：设$P_t = e^{-t\sqrt{-\Delta}}$为Poisson半群（即$P_t f = P(\cdot, t) * f$，$P(x,t) = c_n t / (|x|^2 + t^2)^{(n+1)/2}$为Poisson核）。定义Littlewood-Paley $g$-函数
$$g(f)(x) = \left( \int_0^\infty \left| \frac{\partial}{\partial t} P_t * f(x) \right|^2 t \, dt \right)^{1/2}$$

等价地，以频域二进分解定义**离散$g$-函数**：$g_d(f)(x) = \left(\sum_{j \in \mathbb{Z}} |\Delta_j f(x)|^2\right)^{1/2}$。两者在$L^p$范数下等价。

**动机**：$g$-函数的基本思想是：在Fourier变换侧，$t \frac{\partial}{\partial t} P_t$的乘子为$2\pi t|\xi| e^{-2\pi t|\xi|}$，它将$f$分解为不同频率的分量，每个分量的特征尺度为$t \sim |\xi|^{-1}$。平方积分$\int_0^\infty \cdots t dt$恰好对应于$dt/t$测度下的平均，使得不同尺度的贡献在$L^2$意义下正交。

**定义140.3**（Lusin面积积分）：对$\alpha > 0$，定义**Lusin面积积分**
$$S_\alpha(f)(x) = \left( \int_{\Gamma_\alpha(x)} |\nabla_{y,t} P_t * f(y)|^2 t^{1-n} \, dy \, dt \right)^{1/2}$$
其中$\Gamma_\alpha(x) = \{(y,t) \in \mathbb{R}^n \times (0,\infty) : |x-y| < \alpha t\}$为以$x$为顶点的锥。$S_\alpha$在锥而非仅铅垂线上平均，比$g$-函数提供更强的空间局部化信息。当$\alpha = 1$时简记为$S(f)$。

**定义140.4**（非切向极大函数）：定义Poisson积分的非切向极大函数
$$u^*(x) = \sup_{(y,t) \in \Gamma_1(x)} |P_t * f(y)|$$
它是$f$的Hardy-Littlewood极大函数的Poisson半群版本，在Hardy空间理论中起核心作用。

**定理140.3**（Littlewood-Paley定理）：对$1 < p < \infty$，存在常数$a_p, A_p > 0$使
$$a_p \|f\|_{L^p} \leq \|g_d(f)\|_{L^p} \leq A_p \|f\|_{L^p}, \quad a_p \|f\|_{L^p} \leq \|S(f)\|_{L^p} \leq A_p \|f\|_{L^p}$$
即$L^p$范数与平方函数的$L^p$范数等价。$g_d(f)$、$g(f)$与$S(f)$三者$L^p$范数相互等价。

**证明**：$p = 2$时由Plancherel定理直接得到：$\|g_d(f)\|_2^2 = \sum_j \|\Delta_j f\|_2^2$，而$\sum_j \|\Delta_j f\|_2^2 = \int \sum_j |\varphi(2^{-j}\xi)|^2 |\hat{f}(\xi)|^2 d\xi$。由$\sum_j |\varphi(2^{-j}\xi)|^2 \asymp 1$（$\xi \neq 0$），得$\|g_d(f)\|_2 \sim \|f\|_2$。

对一般$p$，使用Calderón-Zygmund向量值奇异积分理论。关键点：算子$T: f \mapsto \{\Delta_j f\}_{j \in \mathbb{Z}}$将$L^p(\mathbb{R}^n)$映射到$L^p(\mathbb{R}^n; \ell^2(\mathbb{Z}))$。在Fourier变换侧，$T$对应乘子$\{\varphi(2^{-j}\xi)\}_{j \in \mathbb{Z}}$，其取值于$\ell^2$。需要验证向量值Mikhlin乘子条件：对任意多重指标$\alpha$，
$$\sup_{\xi \neq 0} \left(|\xi|^{|\alpha|} \left\|\partial_\xi^\alpha \{\varphi(2^{-j}\xi)\}_{j}\right\|_{\ell^2}\right) < \infty$$
由$\varphi$的紧支性，对每个$\xi$，仅有有限个$j$使$\varphi(2^{-j}\xi) \neq 0$，且这些$j$满足$2^{j} \sim |\xi|$。在此条件下，$\partial_\xi^\alpha \varphi(2^{-j}\xi) = 2^{-j|\alpha|} (\partial^\alpha \varphi)(2^{-j}\xi)$，其$\ell^2$范数以$|\xi|^{-|\alpha|}$为界。向量值Calderón-Zygmund理论[Rubio de Francia, Ruiz, Torrea 1986]给出$T$的$L^p$有界性。反向不等式由对偶（$\Delta_j$的自伴性）和$\sum_j \Delta_j = I$得出。$\blacksquare$

**定理140.4**（平方函数与Sobolev空间）：对$1 < p < \infty$，$s \in \mathbb{R}$，Sobolev范数等价于
$$\|f\|_{W^{s,p}} \sim \left\| \left( \sum_{j \in \mathbb{Z}} 2^{2js} |\Delta_j f|^2 \right)^{1/2} \right\|_{L^p}$$
这是Littlewood-Paley刻画Sobolev空间的经典结果。该等价性将微分算子$(-\Delta)^{s/2}$转化为频率乘子$2^{js}$，大大简化了Sobolev空间中的估计。

**证明**：$p = 2$时由Plancherel定理：$\|f\|_{H^s}^2 = \int (1+|\xi|^2)^s |\hat{f}(\xi)|^2 d\xi \sim \sum_j 2^{2js} \|\Delta_j f\|_2^2$。对一般$p$，利用向量值乘子定理：算子$f \mapsto \{2^{js} \Delta_j f\}_j$的乘子为$\{2^{js} \varphi(2^{-j}\xi)\}_j$，验证Mikhlin条件即得$L^p(\mathbb{R}^n) \to L^p(\mathbb{R}^n; \ell^2)$的有界性。$\blacksquare$

### BMO空间与John-Nirenberg不等式

**定义140.5**（BMO空间 — 有界平均振动）：局部可积函数$f$属于**BMO**（Bounded Mean Oscillation），若
$$\|f\|_{\operatorname{BMO}} = \sup_{B} \frac{1}{|B|} \int_B |f(x) - f_B| \, dx < \infty$$
其中$B$遍历$\mathbb{R}^n$中所有球（或等价地，所有方体），$f_B = \frac{1}{|B|} \int_B f(y) dy$为$f$在$B$上的平均。模去常数后，$\|\cdot\|_{\operatorname{BMO}}$为范数。BMO包含所有有界函数以及$\log|x|$等，是$L^\infty$的自然推广。BMO空间由John和Nirenberg于1961年引入，旨在研究椭圆型偏微分方程的局部正则性。

**性质**：(i) $\|f\|_{\operatorname{BMO}} = 0$当且仅当$f$为常数（a.e.）；(ii) 若$f \in L^\infty$，则$\|f\|_{\operatorname{BMO}} \leq 2\|f\|_{L^\infty}$；(iii) $\log|x| \in \operatorname{BMO}(\mathbb{R}^n)$但$\log|x| \notin L^\infty$，说明BMO是$L^\infty$的真扩张。

**定理140.5**（John-Nirenberg不等式，1961）：存在仅依赖于维数$n$的常数$c_1, c_2 > 0$，使对任意球$B$和任意$\lambda > 0$，
$$\frac{|\{x \in B : |f(x) - f_B| > \lambda\}|}{|B|} \leq c_1 \exp\left(-c_2 \frac{\lambda}{\|f\|_{\operatorname{BMO}}}\right)$$
即BMO函数的振动呈指数衰减分布——BMO是$L^\infty$在多尺度振荡意义下的温和偏离。该不等式表明BMO函数在任意球上的大偏差测度以指数速率衰减，这一性质在任何尺度的球上一致成立。

**证明**：核心是Calderón-Zygmund分解在BMO情形的逐层应用。标准化：不妨设$\|f\|_{\operatorname{BMO}} = 1$，$B = Q_0$为单位方体。对任意$\lambda > 0$，将$Q_0$二进剖分。对每个二进方体$Q$，若$|f_Q| > \lambda$，将$Q$再剖分。由停时论证，得到一族极大二进方体$\{Q_j\}$满足$|f_{Q_j}| > \lambda$且$|f_{\tilde{Q}_j}| \leq \lambda$（$\tilde{Q}_j$为$Q_j$的父方体）。关键估计：由BMO条件，$\frac{1}{|Q_j|}\int_{Q_j}|f - f_{Q_j}| \leq 1$，结合$|f_{\tilde{Q}_j}| \leq \lambda$导出$|f_{Q_j}| \leq \lambda + C$。对每个$Q_j$，在$Q_j$上继续应用此分解，经$k$层后振动幅度以指数衰减。精确地，得到$\sum |Q_j| \leq e^{-c\lambda} |Q_0|$。取$\lambda$的任意倍即得完整指数估计。$\blacksquare$

**推论140.1**（John-Nirenberg的$L^p$版本）：对任意$1 \leq p < \infty$，存在常数$C_{p,n}$使
$$\sup_B \left(\frac{1}{|B|}\int_B |f - f_B|^p dx\right)^{1/p} \leq C_{p,n} \|f\|_{\operatorname{BMO}}$$
即BMO范数可用任意$L^p$振动刻画。这由John-Nirenberg不等式的指数衰减直接积分得到。

### Hardy空间$H^p$的原子分解

**定义140.6**（$H^p$的极大函数定义）：对$0 < p < \infty$，设$\Phi \in \mathcal{S}(\mathbb{R}^n)$满足$\int \Phi = 1$。定义径向极大函数
$$M_\Phi f(x) = \sup_{t > 0} |f * \Phi_t(x)|, \quad \Phi_t(x) = t^{-n}\Phi(x/t)$$
$f \in \mathcal{S}'(\mathbb{R}^n)$属于**Hardy空间**$H^p(\mathbb{R}^n)$，若$M_\Phi f \in L^p(\mathbb{R}^n)$，且$\|f\|_{H^p} = \|M_\Phi f\|_{L^p}$。该定义与$\Phi$的选取无关（在等价范数意义下）。当$1 < p < \infty$时，$H^p = L^p$（等价范数）；当$p = 1$时，$H^1 \subsetneq L^1$；当$0 < p < 1$时，$H^p$为完备的拟赋范空间。

**定义140.7**（$H^p$-原子）：对$0 < p \leq 1$，函数$a \in L^2(\mathbb{R}^n)$称为**$H^p$-原子**若存在球$B$使得：(i) $\operatorname{supp}(a) \subseteq B$（支撑条件）；(ii) $\|a\|_{L^\infty} \leq |B|^{-1/p}$（大小条件）；(iii) $\int_{\mathbb{R}^n} a(x) x^\alpha dx = 0$对所有$|\alpha| \leq \lfloor n(1/p - 1) \rfloor$（消失矩条件）。特别地，$H^1$-原子仅需满足零阶矩消失：$\int a = 0$。

**定理140.6**（$H^p$的原子分解 — Coifman-Weiss, 1977）：$f \in H^p(\mathbb{R}^n)$（$0 < p \leq 1$）当且仅当存在$H^p$-原子的可数族$\{a_j\}$与系数$\{\lambda_j\} \subseteq \mathbb{C}$满足$\sum_j |\lambda_j|^p < \infty$，使得$f = \sum_j \lambda_j a_j$（在分布意义下，且级数在$H^p$中收敛）。此时
$$\|f\|_{H^p} \sim \inf \left( \sum_j |\lambda_j|^p \right)^{1/p}$$
其中下确界取遍所有可能的原子分解。$H^1$的特殊性在于需要消失零阶矩即可：$\int a = 0$。

**证明**：充分性——将原子分解代入$H^p$的极大函数刻画验证范数。关键在于：对$H^p$-原子$a$（支撑于球$B$，$\|a\|_\infty \leq |B|^{-1/p}$），其极大函数$M_\Phi a$在$2B$外以$|B|^{1/p}|x - x_B|^{-n-1}$衰减，经积分得$\|M_\Phi a\|_{L^p}^p \leq C$（与$B$无关）。由$p$-三角不等式（拟范数），$\|f\|_{H^p}^p \leq \sum_j |\lambda_j|^p \|a_j\|_{H^p}^p \leq C \sum_j |\lambda_j|^p$。

必要性——对$H^p$函数的Calderón-Zygmund分解逐层拆分为原子。核心构造：对$f \in H^p$，考虑其极大函数$M_\Phi f$的水平集$\Omega_k = \{M_\Phi f > 2^k\}$。作$\Omega_k$的Whitney分解$\{Q_{k,i}\}$，定义相应的"好函数"$g_k$和"坏函数"$b_k = f - g_k$。$b_k$可分解为支撑于$Q_{k,i}$的片段的叠加，每片满足消失矩条件（由Taylor展开和$f$在$H^p$中的正则性保证）。经适当重整，每片为$H^p$-原子的常数倍，且$\ell^p$系数和受$\|f\|_{H^p}^p$控制。$\blacksquare$

### $H^1$与BMO的对偶性

**定理140.7**（Fefferman对偶定理，1971）：$\operatorname{BMO}(\mathbb{R}^n)$与$H^1(\mathbb{R}^n)$互为对偶空间：
$$\operatorname{BMO} = (H^1)^*, \quad H^1 = (\operatorname{VMO})^*$$
其中$\operatorname{VMO}$（Vanishing Mean Oscillation）为$\operatorname{BMO}$的闭子空间，由满足$\lim_{|B| \to 0} \frac{1}{|B|}\int_B |f - f_B| = 0$且$\lim_{|B| \to \infty} \frac{1}{|B|}\int_B |f - f_B| = 0$的函数构成。具体而言，$f \in \operatorname{BMO}$定义了$H^1$上的连续线性泛函$\varphi \mapsto \int f \varphi$，且$\|f\|_{\operatorname{BMO}} \sim \sup_{\|\varphi\|_{H^1} \leq 1} |\int f \varphi|$。

**证明**：一侧（BMO作用在$H^1$上）：对$H^1$原子$a$（支撑于$B$，$\int a = 0$，$\|a\|_\infty \leq 1/|B|$），
$$\left| \int f a \right| = \left| \int_B (f - f_B) a \right| \leq \|a\|_{L^\infty} \int_B |f - f_B| \leq \frac{1}{|B|} \cdot |B| \|f\|_{\operatorname{BMO}} = \|f\|_{\operatorname{BMO}}$$
由原子分解的线性性，对任意$\varphi \in H^1$，写$\varphi = \sum \lambda_j a_j$，得
$$\left|\int f \varphi\right| \leq \sum |\lambda_j| \left|\int f a_j\right| \leq \|f\|_{\operatorname{BMO}} \sum |\lambda_j| \leq C \|f\|_{\operatorname{BMO}} \|\varphi\|_{H^1}$$

另一侧（深度方向）：利用Carleson测度理论和帐篷空间。对任意$H^1$上的连续线性泛函$L$，需表示为$L(\varphi) = \int f \varphi$对某一$f \in \operatorname{BMO}$。考虑Poisson积分$u(x,t) = P_t * \varphi(x)$。关键工具：$H^1$函数可等价地由帐篷空间$T^1$刻画（$\varphi \in H^1$当且仅当$|\nabla u(x,t)| t$在锥$\Gamma(x)$上的积分属于$L^1$）。由$L$的连续性，可将其表示为某个Carleson测度$\mu$下的积分。Carleson嵌入定理：测度$\mu$为Carleson测度当且仅当存在$f \in \operatorname{BMO}$使$d\mu = |\nabla P_t * f|^2 t dx dt$。由此构造出$f$并验证$\int f \varphi = L(\varphi)$。$\blacksquare$

### Carleson测度与帐篷空间

**定义140.8**（Carleson测度）：$\mathbb{R}^{n+1}_+ = \mathbb{R}^n \times (0,\infty)$上的正Borel测度$\mu$称为**Carleson测度**，若存在常数$C$使得对任意球$B \subset \mathbb{R}^n$，
$$\mu(T(B)) \leq C |B|$$
其中$T(B) = B \times (0, r_B]$为$B$上的帐篷（$r_B$为$B$的半径）。Carleson测度的范数$\|\mu\|_{\mathcal{C}}$为满足上述不等式的最小常数$C$。

**定理140.8**（Carleson嵌入定理）：对$1 < p < \infty$，$\mu$为Carleson测度当且仅当存在常数$C_p$使得
$$\int_{\mathbb{R}^{n+1}_+} |P_t * f(x)|^p d\mu(x,t) \leq C_p \|\mu\|_{\mathcal{C}} \|f\|_{L^p}^p$$
该定理将上半空间的加权估计与边值函数的$L^p$范数联系起来，是BMO-H^1对偶理论的基础。

**证明**：充分性——取$f = \chi_B$即得Carleson条件。必要性——利用非切向极大函数的弱型估计和Marcinkiewicz插值定理，将$p=1$的弱型估计提升为$1 < p < \infty$的强型估计。$p=1$的弱型估计由Calderón-Zygmund分解和Carleson条件的几何意义保证。$\blacksquare$

### 函数空间的Littlewood-Paley统一刻画

**定义140.9**（Besov空间与Triebel-Lizorkin空间）：利用Littlewood-Paley分解定义完整函数空间尺度：

- **Besov空间** $B^s_{p,q}$（$s \in \mathbb{R}$，$0 < p, q \leq \infty$）：
  $$\|f\|_{B^s_{p,q}} = \left\| \left( 2^{js} \|\Delta_j f\|_{L^p} \right)_{j \in \mathbb{Z}} \right\|_{\ell^q}$$

- **Triebel-Lizorkin空间** $F^s_{p,q}$（$s \in \mathbb{R}$，$0 < p < \infty$，$0 < q \leq \infty$）：
  $$\|f\|_{F^s_{p,q}} = \left\| \left( \sum_{j \in \mathbb{Z}} 2^{jsq} |\Delta_j f|^q \right)^{1/q} \right\|_{L^p}$$

这两个尺度在调和分析中处于核心地位，其关键在于：Besov空间先取$L^p$范数再取$\ell^q$范数，而Triebel-Lizorkin空间先取$\ell^q$范数再取$L^p$范数。范数交换顺序的差异产生两类不同的函数空间，它们在正则性刻画中各有所长。

这些空间统一了所有经典函数空间：
- $F^s_{p,2} = W^{s,p}$（Sobolev空间，$1 < p < \infty$）
- $F^0_{p,2} = H^p$（Hardy空间，$0 < p < \infty$）
- $F^0_{\infty,2} = \operatorname{BMO}$（BMO空间）
- $B^s_{\infty,\infty} = C^s$（Hölder-Zygmund空间）
- $F^s_{2,2} = B^s_{2,2} = H^s$（$L^2$-Sobolev空间）
- $B^s_{p,p} = W^{s,p}$当$s$非整数且$1 < p < \infty$（Sobolev-Slobodeckij空间）
- $B^0_{1,\infty}$为$L^1$的"替代"（在奇异积分理论中）

**定理140.9**（Sobolev嵌入的Littlewood-Paley证明）：对$s_1 - n/p_1 \geq s_2 - n/p_2$（$s_1 \geq s_2$），有连续嵌入$B^{s_1}_{p_1,q} \hookrightarrow B^{s_2}_{p_2,q}$和$F^{s_1}_{p_1,q_1} \hookrightarrow F^{s_2}_{p_2,q_2}$。当$s_1 - n/p_1 = s_2 - n/p_2$时对应临界Sobolev嵌入，此时嵌入对$q_1 \leq q_2$在Besov情形成立，但Triebel-Lizorkin情形需更精细的条件。

**证明**：利用Bernstein不等式：$\|\Delta_j f\|_{L^{p_2}} \leq C 2^{jn(1/p_1 - 1/p_2)} \|\Delta_j f\|_{L^{p_1}}$。代入Besov范数：
$$\|f\|_{B^{s_2}_{p_2,q}} = \left\| 2^{js_2} \|\Delta_j f\|_{L^{p_2}} \right\|_{\ell^q} \leq C \left\| 2^{j(s_2 - n(1/p_1 - 1/p_2))} \cdot 2^{js_1} \|\Delta_j f\|_{L^{p_1}} \right\|_{\ell^q}$$
由于$s_2 - n/p_2 \leq s_1 - n/p_1$，即$s_2 + n/p_2 - n/p_1 \leq s_1$，故$s_2 - n(1/p_1 - 1/p_2) \leq s_1$，得$\|f\|_{B^{s_2}_{p_2,q}} \leq C \|f\|_{B^{s_1}_{p_1,q}}$。Triebel-Lizorkin情形需Minkowski不等式交换$\ell^q$和$L^p$范数，使用Fefferman-Stein向量值极大不等式。$\blacksquare$

### 仿积与Bony分解

**定义140.10**（Bony仿积分解，1981）：对两个缓增分布$f$和$g$，在适当正则性条件下，乘积$fg$的Littlewood-Paley分解可写为
$$fg = T_f g + T_g f + R(f,g)$$
其中$T_f g = \sum_{j} S_{j-3} f \cdot \Delta_j g$为**仿积**（paraproduct，$f$的低频与$g$的高频的相互作用），$R(f,g) = \sum_{|j-k| \leq 2} \Delta_j f \cdot \Delta_k g$为**共振项**（同频段相互作用）。此分解是研究非线性PDE中乘积正则性的核心工具，由Bony在其开创新工作中引入，用于处理不可压缩Euler方程和Navier-Stokes方程。

**命题140.2**（仿积的连续性）：设$s > 0$，$1 < p < \infty$。则
(i) 若$f \in L^\infty$，$g \in H^s_p$，则$T_f g \in H^s_p$且$\|T_f g\|_{H^s_p} \leq C \|f\|_{L^\infty} \|g\|_{H^s_p}$；
(ii) 若$f \in H^s_p$，$g \in L^\infty$，则$R(f,g) \in H^{s}_{p}$当$s > 0$；
(iii) 对$s_1 + s_2 > 0$，$f \in H^{s_1}_p$，$g \in H^{s_2}_p$，则$fg \in H^{\min(s_1, s_2, s_1+s_2-n/p)}_p$（乘积法则）。

**证明**：(i) 由$S_{j-3} f$的$L^\infty$有界性和$\Delta_j g$的$L^p$衰减性，$2^{js}\|S_{j-3}f \cdot \Delta_j g\|_{L^p} \leq \|f\|_{L^\infty} \cdot 2^{js}\|\Delta_j g\|_{L^p}$，$\ell^2$求和即得。(ii) 共振项仅涉及$|\xi| \sim 2^j$的频段，$2^{js}\|\sum_{|k-j|\leq 2} \Delta_j f \Delta_k g\|_{L^p} \leq C 2^{js}\|\Delta_j f\|_{L^p} \|g\|_{L^\infty}$，由$f \in H^s_p$得$\ell^2$可和性。(iii) 综合仿积和共振项估计即得。$\blacksquare$

### $T(1)$定理

**定理140.10**（David-Journé $T(1)$定理，1984）：设$T: \mathcal{S}(\mathbb{R}^n) \to \mathcal{S}'(\mathbb{R}^n)$为连续线性算子，具有标准Calderón-Zygmund核$K(x,y)$（即$K$在$x \neq y$处光滑且满足$|K(x,y)| \leq C|x-y|^{-n}$和$|\nabla_x K(x,y)| + |\nabla_y K(x,y)| \leq C|x-y|^{-n-1}$）。则$T$可延拓为$L^2(\mathbb{R}^n)$上的有界算子当且仅当满足以下三个条件：
(i) $T(1) \in \operatorname{BMO}$；
(ii) $T^*(1) \in \operatorname{BMO}$；
(iii) $T$满足弱有界性：$|\langle T f, g \rangle| \leq C R^n \|f\|_\infty \|g\|_\infty$对任意支撑于半径为$R$的球内的$f, g$成立。

**证明概要**：充分性——利用Littlewood-Paley分解和仿积技术。将$T$分解为$T = T_0 + T_1 + T_2$，其中$T_0$对应对角线附近（$\Delta_j T \Delta_k$，$|j-k| \leq C$），$T_1$对应$j \gg k$（仿积型），$T_2$对应$j \ll k$。$T(1) \in \operatorname{BMO}$控制$T_1$的有界性，$T^*(1) \in \operatorname{BMO}$控制$T_2$的有界性。必要性——由$T$在$L^2$上的有界性，$T(1)$作为$T$作用在常数函数$1$上的结果，必属于$\operatorname{BMO}$（因为$T$将$L^\infty$映射到$\operatorname{BMO}$，这是Calderón-Zygmund算子的基本性质）。$\blacksquare$

$T(1)$定理是调和分析中里程碑式的结果，它将Calderón-Zygmund算子的$L^2$有界性归结为对常数函数$1$的检验，极大地简化了奇异积分算子的有界性判别。这一思想在后续的$T(b)$定理（David-Journé-Semmes 1985）和更一般的非双倍测度空间上的Calderón-Zygmund理论中得到进一步推广。

---
*Littlewood-Paley理论以二进分解和平方函数为双翼：$g$-函数（Poisson半群版本与离散版本）和Lusin面积积分提供了频率分量的精确$L^p$控制。BMO空间经由John-Nirenberg不等式揭示了有界平均振动的指数衰减本质，Fefferman对偶定理$\operatorname{BMO} = (H^1)^*$则完成了Hardy空间理论的闭环。Carleson测度与帐篷空间为对偶性提供了几何-测度论基础。Besov与Triebel-Lizorkin空间以统一框架收纳了所有经典函数空间，是现代调和分析处理PDE正则性问题的基础语言。Bony仿积分解和$T(1)$定理则展示了Littlewood-Paley分解在非线性分析和奇异积分理论中的强大威力。*

*卷二十四：调和分析。*

---

## 第179章：Fourier 变换

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

## 第180章：奇异积分

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

### Calderón-Zygmund理论的现代发展

Calderón-Zygmund 理论自 1950 年代创立以来，已发展成为调和分析中最核心的理论框架，其影响远超奇异积分本身。**$T(1)$ 定理**（David-Journe 1984）是 Calderón-Zygmund 理论中最重要的后续发展：一个与 Calderón-Zygmund 核关联的算子 $T$ 在 $L^2$ 上有界当且仅当 $T(1)$ 和 $T^*(1)$ 属于 BMO（有界平均振荡函数空间）。该定理将 $L^2$ 有界性的判定归结为对两个特定函数（常函数 1）的检验，极大简化了奇异积分算子有界性的证明，并推广了此前 Cotlar 引理和几乎正交分解方法。**$T(b)$ 定理**（David-Journe-Semmes 1985）进一步将 $T(1)$ 定理推广到非双倍测度情形，允许用"适应性"函数 $b$（满足某种增生条件）代替常函数 1，这为 Lipschitz 曲线上 Cauchy 积分的有界性证明提供了关键工具。**Calderón 交换子**（1965）是 Calderón-Zygmund 理论的经典应用：交换子 $[A, T]f = A(Tf) - T(Af)$ 在 $L^p$ 上的有界性反映了算子 $T$ 与乘子 $A$ 的非交换性，构成了 Coifman-Rochberg-Weiss 交换子理论（1976）的基础。**Muckenhoupt 权理论**（1972）将 Calderón-Zygmund 算子的有界性推广到加权 $L^p$ 空间：$T$ 在 $L^p(w)$ 上有界当且仅当 $w \in A_p$，这为加权不等式提供了一个统一的特征刻画。**向量值奇异积分理论**（Burkholder 1980s）将奇异积分算子作用于 Banach 空间值函数，$T$ 在 $L^p(\mathbb{R}^n; X)$ 上有界当且仅当 $X$ 是 UMD 空间（无条件鞅差空间），这揭示了调和分析中奇异积分有界性与 Banach 空间几何之间的深刻联系。

---

---

## 第181章：Hardy-Littlewood 极大函数

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

### 极大函数与调和分析的统一方法

Hardy-Littlewood 极大函数是调和分析中控制论的核心工具，其思想可以追溯到 Hardy 和 Littlewood 对 Fourier 级数求和的研究（1930）。极大函数方法的基本范式是：将复杂算子 $T$ 的逐点行为用极大函数 $Mf$ 控制，然后利用 $M$ 的 $L^p$ 有界性推导 $T$ 的 $L^p$ 有界性。**Fefferman-Stein 锐极大函数**（1972）$M^\sharp f$ 通过衡量 $f$ 的局部平均振荡，揭示了 $L^p$ 范数与 BMO 半范数之间的对偶关系：$\|f\|_p \leq C_p \|M^\sharp f\|_p$ 对于具有消失平均的 $f$ 成立。这一不等式是 Fefferman-Stein 证明 $L^p$ 中 Calderón-Zygmund 算子有界性的核心工具，避免了逐点估计的困难。**好 $\lambda$ 不等式**（good-$\lambda$ inequality, Burkholder-Gundy 1970）是极大函数方法中最重要的技术工具：$|\{Mf > 2\lambda, M^\sharp f \leq \gamma\lambda\}| \leq C\varepsilon|\{Mf > \lambda\}|$ 允许将 $Mf$ 的分布函数由 $M^\sharp f$ 控制，从而将奇异积分算子的有界性归结为极大函数的控制。**$A_\infty$ 权**是所有 $A_p$ 权的并集，由反向 Hölder 不等式刻画：$w \in A_\infty$ 当且仅当存在 $\delta > 0$ 和 $C$ 使得 $\frac{1}{|B|}\int_B w^{1+\delta} \leq C(\frac{1}{|B|}\int_B w)^{1+\delta}$。$A_\infty$ 权具有性质：若 $w \in A_\infty$，则 $w$ 赋给球 $B$ 的测度 $w(B)$ 与 $|B|$ 的关系满足 $w(E)/w(B) \leq C(|E|/|B|)^\delta$。**Rp 权**（reverse Hölder class）是 $A_\infty$ 权理论的自然延伸，在非线性调和分析（如 $p$-Laplacian 方程的梯度估计）中扮演关键角色。极大函数理论还与**非线性位势理论**（Wolff 位势）、**面积积分**（Lusin 面积积分）和**非切向极大函数**（nontangential maximal function）等构成 Hardy 空间理论的完整框架，为调和分析、偏微分方程和复分析中的边界值问题提供了统一的分析工具。
