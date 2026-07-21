## 第161章：Littlewood-Paley理论

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