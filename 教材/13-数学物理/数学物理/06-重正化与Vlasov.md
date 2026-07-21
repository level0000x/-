## 第372章：重正化群与重正化理论

重正化（renormalization）是量子场论中消除紫外发散的系统性方法，其核心思想在于：将裸参数重新定义为依赖于截断标度的跑动耦合常数，使得物理可观测量在移除截断后保持有限。重正化不仅是消除无穷大的技术手段，更揭示了量子场论在能量标度下的行为——不同能量标度下的物理由跑动耦合常数描述，这一深刻的物理洞察由 Wilson 的重正化群理论（1971）所阐明，并因此获得 1982 年 Nobel 物理学奖。

### 372.1 重正化的物理动机与正规化

**定义 372.1**（紫外发散）：在微扰量子场论中，对无限制动量积分出现的发散称为**紫外（UV）发散**。典型例子是 $\phi^4$ 理论中单圈自能图 $\int d^4k/(k^2+m^2)$，该积分在大动量 $|k|\to\infty$ 时二次发散。发散度（superficial degree of divergence）$\omega(G)$ 是 Feynman 图 $G$ 的圈动量积分在大动量极限下的幂次发散度，由量纲分析给出：对 $\phi^4$ 理论在四维，$\omega(G) = 4 - E$（$E$ 为外腿数），故两腿图（$E=2$）为二次发散，四腿图（$E=4$）为对数发散。

**定义 372.2**（动量截断正规化）：引入动量截断 $\Lambda>0$，将发散积分截断为有限值：
$$\int \frac{d^4k}{(2\pi)^4} \frac{1}{k^2+m^2} \;\longrightarrow\; \int_{|k|\leq\Lambda} \frac{d^4k}{(2\pi)^4} \frac{1}{k^2+m^2}$$
物理结果在 $\Lambda\to\infty$ 极限下通过重新定义耦合常数和场归一化保持有限。截断正规化直观但破坏 Lorentz 协变性和规范不变性（在非 Abel 规范理论中），因此高能物理中更常用维数正规化。

**定义 372.3**（维数正规化，'t Hooft-Veltman 1972）：在 $d=4-\varepsilon$ 维时空中计算 Feynman 积分，发散表现为 $1/\varepsilon$ 极点。对任意 Feynman 图 $G$，其维数正规化振幅为
$$\mathcal{A}_G = \mu^{2\varepsilon} \int \frac{d^dk}{(2\pi)^d} I_G(k,p_i)$$
其中 $\mu$ 为重整化标度（引入以保持耦合常数无量纲），$d\to 4$ 时 $1/\varepsilon$ 极点对应于原理论的对数发散。维数正规化的核心优势在于保持 Lorentz 协变性和规范对称性（在最小减除方案 MS 和 $\overline{\text{MS}}$ 方案中）。

**定理 372.1**（维数正规化的基本积分公式）：在 $d$ 维时空中，
$$\int \frac{d^dk}{(2\pi)^d} \frac{1}{(k^2 + 2p\cdot k + M^2)^\alpha} = \frac{i(-1)^\alpha}{(4\pi)^{d/2}} \frac{\Gamma(\alpha - d/2)}{\Gamma(\alpha)} \frac{1}{(M^2 - p^2)^{\alpha - d/2}}$$
此公式是维数正规化中计算所有 Feynman 积分的基础。$\Gamma$ 函数在 $d=4$（$\alpha=2$）时产生极点 $\Gamma(2-d/2) = \Gamma(\varepsilon/2) \sim 2/\varepsilon - \gamma_E + O(\varepsilon)$。

**证明**：利用 Schwinger 参数化：$\frac{1}{A^\alpha} = \frac{1}{\Gamma(\alpha)} \int_0^\infty dt \, t^{\alpha-1} e^{-tA}$。取 $A = k^2 + 2p\cdot k + M^2$，则积分变为 $\int \frac{d^d k}{(2\pi)^d} \frac{1}{\Gamma(\alpha)} \int_0^\infty dt \, t^{\alpha-1} \exp(-t(k^2 + 2p\cdot k + M^2))$。交换积分次序，完成平方：$k^2 + 2p\cdot k + M^2 = (k + p)^2 + M^2 - p^2$。做平移 $k' = k + p$，则动量积分化为 Gauss 积分：$\int \frac{d^d k'}{(2\pi)^d} e^{-t k'^2} = \frac{1}{(4\pi t)^{d/2}}$。于是积分 $= \frac{1}{\Gamma(\alpha)} \int_0^\infty dt \, t^{\alpha-1} \frac{1}{(4\pi t)^{d/2}} e^{-t(M^2-p^2)} = \frac{1}{(4\pi)^{d/2}\Gamma(\alpha)} \int_0^\infty dt \, t^{\alpha - d/2 - 1} e^{-t(M^2-p^2)}$。由 $\Gamma$ 函数的定义 $\int_0^\infty t^{s-1} e^{-at} dt = \Gamma(s) / a^s$，得最终结果 $\frac{i(-1)^\alpha}{(4\pi)^{d/2}} \frac{\Gamma(\alpha - d/2)}{\Gamma(\alpha)} \frac{1}{(M^2 - p^2)^{\alpha - d/2}}$。$i$ 因子来自 Wick 旋转（$k^0 \to i k^0_E$）。$\blacksquare$

**其他正规化方法**：
- **Pauli-Villars 正规化**：引入辅助大质量场以抵消发散，保持 Lorentz 协变性但在非 Abel 规范理论中破坏规范不变性；
- **格点正规化**：将时空离散化为格点 $a\mathbb{Z}^4$，动量积分截断在 $\pi/a$，保持规范不变性（Wilson 作用量）但破坏 Lorentz 协变性（在连续极限 $a\to 0$ 中恢复）；
- **函数正规化**（$\zeta$-函数正规化、热核正规化）：通过解析延拓定义发散行列式，常用于弯曲时空量子场论。

### 372.2 BPHZ重正化方案

**定义 372.4**（Zimmermann 森林公式，1969）：设 Feynman 图 $G$ 的发散子图集合为 $\mathcal{F}(G)$。$G$ 的**重正化振幅** $R_G$ 由森林公式给出
$$R_G = \sum_{U \in \mathcal{W}(\mathcal{F}(G))} \prod_{\gamma \in U} (-t_\gamma) \cdot I_G$$
其中 $\mathcal{W}(\mathcal{F}(G))$ 是 $\mathcal{F}(G)$ 的所有**森林**（两两互不重叠的连通发散子图族），$t_\gamma$ 是在子图 $\gamma$ 上定义的 Taylor 减法算子（在零外动量处展开至发散阶 $d(\gamma)$），$I_G$ 是未重整化的 Feynman 积分。

**森林公式的动机**：重整化的核心困难在于处理重叠发散（overlapping divergences）——即一个发散子图嵌套在另一个发散子图中。Zimmermann 森林公式通过系统地扣除所有发散子图及其组合，精确处理了重叠发散问题。森林（forest）的引入是为了避免重复扣除（over-subtraction），每个森林对应一组互不相交的减法操作。

**定义 372.5**（Bogoliubov $R$-操作）：$R$-操作递归定义如下：
$$\bar{R}_G = I_G + \sum_{\{\gamma_1,\ldots,\gamma_k\} \in \mathcal{F}(G)} I_{G/\{\gamma_i\}} \circ \prod_i (-t^{\gamma_i} \bar{R}_{\gamma_i})$$
其中 $\{G/\{\gamma_i\}\}$ 是将 $G$ 中所有子图 $\gamma_i$ 缩并为点的约化图。$R_G = (1-t^G)\bar{R}_G$ 为最终的重正化值。$R$-操作首先对所有真子图进行重整化（$\bar{R}_{\gamma_i}$），然后对整体散度进行最后一次减法（$(1-t^G)$）。

**定理 372.2**（BPHZ 定理，Bogoliubov-Parasiuk 1957, Hepp 1966, Zimmermann 1969）：对任意可重整的量子场论，森林公式和 $R$-操作给出的重正化振幅 $R_G$ 对所有 Feynman 图 $G$ 是有限的、Lorentz 不变的，且满足因果性和幺正性。重整化后的 Feynman 振幅对动量截断 $\Lambda\to\infty$（或 $\varepsilon\to 0$）一致收敛。

**证明**：证明分三个核心步骤。(1) 森林公式与 $R$-操作的等价性：对每个 Feynman 图 $G$，Zimmermann 森林公式对所有森林（两两互不重叠的连通发散子图族）求和，每个森林 $\gamma_1, \ldots, \gamma_k$ 对应一组减法操作 $(-t_{\gamma_1})\cdots(-t_{\gamma_k})$。Bogoliubov $R$-操作递归定义 $\bar{R}_G = I_G + \sum I_{G/\{\gamma_i\}} \circ \prod_i (-t^{\gamma_i} \bar{R}_{\gamma_i})$，两者通过森林与子图缩并的对应关系等价。(2) Hepp 的收敛定理：对每个已被适当减除的 Feynman 积分，将积分区域（$\mathbb{R}^d$ 中的圈动量）剖分为 Hepp 扇区。在每个扇区中，动量按大小排序，积分可写为迭代积分。Taylor 减法算子 $t_\gamma$ 精确消除了所有扇区中的发散子积分——在子图 $\gamma$ 的动量趋于无穷时，$t_\gamma$ 减去了 $I_\gamma$ 的 Taylor 展开（至发散阶 $d(\gamma)$），使得减除后的积分在 $\Lambda \to \infty$ 下绝对收敛。每种扇区中的收敛性由幂次计数（power counting）保证：减除后有效发散度 $\omega_{\text{eff}}(\gamma) < 0$。(3) 幺正性和因果性：重正化后的 $S$ 矩阵满足 $S^\dagger S = 1$ 等价于 Cutkosky 切割规则在重正化后成立。重正化不改变 $S$ 矩阵的解析结构（极点位置和留数），因此保持幺正性。因果性由 Bogoliubov-Shirkov 因果条件保证，重正化操作保持微扰展开的因果结构。$\blacksquare$

**定义 372.6**（重整化方案）：不同重整化方案对应不同的减法条件：
- **在壳方案**（on-shell）：减除在物理质量壳上 $p^2 = m_{\text{phys}}^2$ 处进行，参数直接对应物理可观测量；
- **最小减除方案**（MS）：在维数正规化中仅减除 $1/\varepsilon$ 极点，结果与重整化标度 $\mu$ 有关；
- **$\overline{\text{MS}}$ 方案**（修正最小减除）：减除 $1/\varepsilon - \gamma_E + \ln 4\pi$，便于消除 $\Gamma$ 函数展开中的常数项，是微扰 QCD 计算的标准方案。

不同重整化方案之间的转换由有限的重整化常数（finite renormalization）联系，物理预言（如 $S$ 矩阵元）在方案转换下不变。

### 372.3 Callan-Symanzik方程与$\beta$-函数

**定义 372.7**（跑动耦合常数与 $\beta$-函数）：设 $g(\mu)$ 为重整化标度 $\mu$ 处的有效耦合常数。**$\beta$-函数**定义为
$$\beta(g) \equiv \mu \frac{\partial g}{\partial \mu}$$
在微扰论中，$\beta(g) = \beta_0 g^3 + \beta_1 g^5 + O(g^7)$，其中 $\beta_0, \beta_1$ 是方案无关的普适系数（前两阶系数）。$\beta$-函数描述了耦合常数随能量标度的流动：若 $\beta(g) > 0$，耦合常数随 $\mu$ 增大而增大（如 QED）；若 $\beta(g) < 0$，耦合常数随 $\mu$ 增大而减小——**渐近自由**（如 QCD）。

**定理 372.3**（Callan-Symanzik 方程，1970）：设 $\Gamma^{(n)}(p_i; g, \mu)$ 是 $n$ 点单粒子不可约（1PI）Green 函数，$\gamma(g)$ 为反常量纲（描述场算符的标度维数偏离经典值）。则
$$\left[\mu\frac{\partial}{\partial\mu} + \beta(g)\frac{\partial}{\partial g} + n\gamma(g)\right]\Gamma^{(n)}(p_i; g, \mu) = 0$$
Callan-Symanzik 方程是重整化群方程，表达了物理 Green 函数在重整化标度改变下的不变性（裸 Green 函数不依赖 $\mu$）。

**证明**：由重整化群不变性，裸 Green 函数 $\Gamma^{(n)}_B(p_i; g_0, \Lambda)$ 不依赖于 $\mu$。利用 $g_0 = Z_g(g, \mu/\Lambda) g \mu^{\varepsilon}$ 和场重整化常数 $Z_\phi$（$\Gamma^{(n)} = Z_\phi^{n/2} \Gamma^{(n)}_B$），对 $\mu$ 求导：
$$\mu\frac{d}{d\mu}\Gamma^{(n)}_B = 0 \Rightarrow \left(\mu\frac{\partial}{\partial\mu} + \mu\frac{\partial g}{\partial\mu}\frac{\partial}{\partial g} + \frac{n}{2}\mu\frac{\partial\ln Z_\phi}{\partial\mu}\right)\Gamma^{(n)} = 0$$
定义 $\beta(g) = \mu\frac{\partial g}{\partial\mu}$ 和 $\gamma(g) = \frac{1}{2}\mu\frac{\partial\ln Z_\phi}{\partial\mu}$，即得 CS 方程。$\blacksquare$

**定理 372.4**（渐近自由与 Gross-Wilczek-Politzer 定理，1973）：$SU(N)$ 规范理论（无标量场或费米子数有限）是渐近自由的：$\beta(g) < 0$ 对小 $g$ 成立。具体地，对 $SU(N)$ 规范理论与 $N_f$ 味 Dirac 费米子，
$$\beta_0 = -\frac{1}{(4\pi)^2}\left(\frac{11}{3}N - \frac{2}{3}N_f\right)$$
当 $N_f < 11N/2$ 时 $\beta_0 < 0$，理论为渐近自由。QCD（$N=3, N_f=6$）满足此条件，解释了高能实验中夸克表现为几乎自由粒子的现象（渐近自由）。Gross、Wilczek 和 Politzer 因此获得 2004 年 Nobel 物理学奖。

**证明**：$\beta$ 函数的单圈系数 $\beta_0$ 由三个贡献之和给出：规范场自相互作用（胶子圈）、鬼场圈（Faddeev-Popov 鬼）和费米子圈。在 $SU(N)$ 规范理论中，规范场对 $\beta_0$ 的贡献为 $-\frac{11}{3}N$（来自三胶子和四胶子顶点的单圈修正），费米子（$N_f$ 味）的贡献为 $+\frac{2}{3}N_f$（来自费米子圈的真空极化）。具体计算：$\beta(g) = -\frac{g^3}{(4\pi)^2} \beta_0 + O(g^5)$，其中 $\beta_0 = \frac{11}{3}C_2(G) - \frac{4}{3}T(R)N_f$，对 $SU(N)$ 有 $C_2(G) = N$，$T(R) = 1/2$（基础表示），故 $\beta_0 = \frac{11}{3}N - \frac{2}{3}N_f$。当 $N_f < 11N/2$ 时 $\beta_0 > 0$，但 $\beta(g) = -\beta_0 g^3/(4\pi)^2 + \cdots$，故 $\beta(g) < 0$（渐近自由）。$\blacksquare$

### 372.4 Wilson重正化群流

**定义 372.8**（Kadanoff 分块自旋变换，1966）：在临界现象中，将 $d$ 维格点系统分组为边长为 $b$ 的超块，每个超块内的自旋取平均（粗粒化），再重新标度长度 $x \to x/b$ 和场变量 $\phi \to b^{\Delta}\phi$。此操作定义了相空间上的**重正化群变换** $\mathcal{R}_b$。

**Wilson 重正化群的动机**：传统的 Gell-Mann-Low 重整化群仅关注 Green 函数随动量标度的变化，而 Wilson 的重正化群则是将 Kadanoff 的实空间粗粒化思想推广到连续场论。Wilson 的核心见解是：在临界点附近，关联长度发散，系统在所有尺度上都有涨落，因此必须同时处理所有尺度上的自由度。重正化群通过在动量空间中逐层积分掉高动量模式（$\Lambda/b < |k| < \Lambda$），研究有效作用量随尺度 $b$ 的变化。

**定理 372.5**（重正化群不动点与普适类）：重正化群变换 $\mathcal{R}_b$ 在耦合常数空间 $\{g_i\}$ 中定义了一个流（RG flow）：$\frac{dg_i}{d\ln b} = \beta_i(g)$。RG 不动点 $g^*$ 满足 $\beta_i(g^*) = 0$。在 $g^*$ 附近线性化：
$$\frac{d}{d\ln b}(g_i - g_i^*) = \sum_j M_{ij}(g_j - g_j^*), \quad M_{ij} = \left.\frac{\partial\beta_i}{\partial g_j}\right|_{g^*}$$
$M$ 的特征值 $\lambda_\alpha$ 分类了参数空间中的方向：
- $\lambda_\alpha > 0$（相关方向，relevant）：参数在 RG 流下增大，最终远离不动点；
- $\lambda_\alpha < 0$（无关方向，irrelevant）：参数在 RG 流下减小，最终趋近不动点；
- $\lambda_\alpha = 0$（边缘方向，marginal）：需考虑高阶修正。

所有流向同一不动点的理论构成一个**普适类**（universality class），具有相同的临界指数（由相关方向的特征值决定）。普适类解释了为什么截然不同的微观物理系统（如液体-气体相变与铁磁相变）在临界点附近表现出相同的标度行为。

**证明**：RG 变换 $\mathcal{R}_b$ 将耦合常数 $\{g_i\}$ 映射为 $\{g_i(b)\}$。$\beta$ 函数 $\beta_i(g) = dg_i/d\ln b$ 控制 RG 流。在不动点 $g^*$ 处线性化即得上述线性 RG 方程。相关方向的特征值 $\lambda_\alpha = b^{y_\alpha}$（$y_\alpha > 0$）对应临界指数：例如，温度场的相关指数 $y_t = 1/\nu$（$\nu$ 为关联长度临界指数），磁场场的相关指数 $y_h = \beta\delta/\nu$。无关方向在长波极限下消失，解释了普适性——微观细节不影响临界行为。$\blacksquare$

**Wilson 精确重正化群方程**：在连续场论中，Wilson 引入有效作用量 $S_\Lambda[\phi]$（仅包含动量 $|k| < \Lambda$ 的模式），通过积分掉动量壳层 $\Lambda/b < |k| < \Lambda$ 中的模式，得到低能有效作用量 $S_{\Lambda/b}[\phi]$。在无穷小壳层极限下，这给出 Polchinski 精确 RG 方程或 Wetterich 方程：
$$\partial_t \Gamma_k = \frac{1}{2}\operatorname{Tr}\left[(\Gamma_k^{(2)} + R_k)^{-1} \partial_t R_k\right]$$
其中 $t = \ln(k/\Lambda)$，$\Gamma_k$ 为尺度 $k$ 处的有效平均作用量，$R_k$ 为红外截断函数。该方程是精确的（非微扰），在统计物理和量子场论中广泛应用。

---
## 第373章：Vlasov方程的数学理论

Vlasov 方程描述无碰撞等离子体或自引力系统中粒子分布函数在相空间中的演化。它是 Boltzmann 方程在碰撞项消失时的极限，属于平均场动力学方程。Vlasov 方程在等离子体物理、天体物理（恒星动力学）和加速器物理中具有核心地位。其数学理论涉及 PDE 的适定性、弱解的紧性方法、以及 Landau 阻尼的严格证明。

### 373.1 Vlasov方程与Vlasov-Poisson系统

**定义 373.1**（Vlasov 方程）：设 $f(t,x,v) \geq 0$ 为时刻 $t$ 在位置 $x \in \mathbb{R}^d_x$、速度 $v \in \mathbb{R}^d_v$ 处的粒子分布函数。粒子所受平均场力为 $F(t,x)$，则**Vlasov 方程**为
$$\partial_t f + v\cdot\nabla_x f + F\cdot\nabla_v f = 0$$
该方程表达了相空间体积的 Liouville 守恒：沿特征线 $\dot{x}=v,\;\dot{v}=F(t,x)$，$f$ 为常数（$f(t, X(t), V(t)) = f_0(x, v)$ 其中 $(X(t), V(t))$ 为特征线）。Vlasov 方程是输运方程在相空间中的特例，其对初始条件的依赖完全由特征线决定。

**定义 373.2**（Vlasov-Poisson 系统）：当力场 $F$ 由自洽 Poisson 方程确定时，得到**Vlasov-Poisson 系统**：
$$\begin{cases}
\partial_t f + v\cdot\nabla_x f + F\cdot\nabla_v f = 0 \\[4pt]
F = -\nabla_x \Phi, \quad \Delta_x \Phi = \gamma_d \int_{\mathbb{R}^d_v} f(t,x,v)\,dv
\end{cases}$$
其中对等离子体情形 $\gamma_d=1$（静电势，$\Delta\Phi = -\rho$ 归入符号约定），对自引力情形 $\gamma_d = -4\pi G$（引力势，$G$ 为引力常数）。系统的总能量
$$\mathcal{E}(t) = \frac{1}{2}\iint |v|^2 f\,dx\,dv + \frac{1}{2}\int |\nabla\Phi|^2\,dx$$
是形式守恒量。对于等离子体（$\gamma_d = 1$），能量正定；对于引力（$\gamma_d = -4\pi G$），能量无下界，这导致引力系统的 rich 现象（如引力塌缩和 Jeans 不稳定性）。

**定义 373.3**（Vlasov-Maxwell 系统）：当电磁场由 Maxwell 方程决定时，得到 Vlasov-Maxwell（相对论）系统：
$$\partial_t f + \hat{v}\cdot\nabla_x f + (E + \hat{v}\times B)\cdot\nabla_p f = 0$$
$\partial_t E = \nabla\times B - j$，$\partial_t B = -\nabla\times E$，$\nabla\cdot E = \rho$，$\nabla\cdot B = 0$，其中 $\hat{v} = p/\sqrt{1+|p|^2}$（相对论速度），$\rho = \int f dp$，$j = \int \hat{v} f dp$。Vlasov-Maxwell 系统在 $d=3$ 时的全局适定性仍是开放问题（仅对小初值或在某些对称性假设下已知）。

### 373.2 弱解的存在性：DiPerna-Lions理论

**定义 373.4**（重正规化解，DiPerna-Lions 1989）：设 $f_0\in L^1\cap L^\infty(\mathbb{R}^d_x\times\mathbb{R}^d_v)$ 非负且有有限动能。分布函数 $f\in L^\infty([0,T];L^1\cap L^\infty)$ 称为 Vlasov-Poisson 系统的**重正规化解**，若对任意 $\beta\in C^1(\mathbb{R})\cap L^\infty(\mathbb{R})$ 满足 $\beta(0)=0$ 和 $|\beta'(t)|\leq C(1+|t|^p)$，有
$$\partial_t \beta(f) + v\cdot\nabla_x \beta(f) + F\cdot\nabla_v \beta(f) = 0$$
在分布意义下成立。重正规化条件补偿了缺乏 $W^{1,1}$ 正则性的困难，使得乘积 $F\cdot\nabla_v f$ 有定义（通过 $\beta(f)$ 的链式法则）。

**重正规化解的动机**：当 $f$ 仅为 $L^\infty$ 时，$F\cdot\nabla_v f$ 在经典意义下未必有定义（$F$ 可能仅在 $L^p$ 中，$\nabla_v f$ 可能仅为测度）。DiPerna-Lions 的关键洞察是：虽然 $f$ 本身可能不满足链式法则，但 $\beta(f)$ 的输运方程在分布意义下成立，这足以保证解的适定性。

**定理 373.1**（DiPerna-Lions 全局存在性定理，1989）：设 $f_0 \geq 0$，$f_0 \in L^1 \cap L^\infty(\mathbb{R}^6)$，且 $\iint |v|^2 f_0\,dx\,dv < \infty$。则 Vlasov-Poisson 系统存在全局重正规化解 $f \in L^\infty([0,\infty); L^1 \cap L^\infty)$。若进一步 $f_0 \in C^1$，则该解为经典解。

**证明**：构造正则化系统：对力场 $E$ 进行磨光（卷积光滑核 $\rho_\varepsilon$），得到逼近序列 $(f^\varepsilon, E^\varepsilon)$ 满足 $\partial_t f^\varepsilon + v \cdot \nabla_x f^\varepsilon + E^\varepsilon \cdot \nabla_v f^\varepsilon = 0$，$E^\varepsilon = \nabla_x \Delta_x^{-1}(\int f^\varepsilon dv * \rho_\varepsilon)$。由特征线法，$f^\varepsilon$ 沿特征线为常数，最大模 $\|f^\varepsilon\|_{L^\infty} \leq \|f_0\|_{L^\infty}$。利用速度矩估计和能量守恒：
$$\frac{d}{dt} \iint \left(\frac{1}{2}|v|^2 f^\varepsilon + \frac{1}{2}|E^\varepsilon|^2\right) dx dv = 0$$
得到关于 $\varepsilon$ 一致的速度矩界。通过速度平均引理（velocity averaging lemma，Golse-Lions-Perthame-Sentis 1988）：对输运方程的解，速度矩 $\int f^\varepsilon \psi(v) dv$ 在 $H^s$ 中紧（$s \in (0, 1/2)$）。这给出 $\{f^\varepsilon\}$ 的强紧性（不计 $\varepsilon$）。取极限 $\varepsilon \to 0$，得到 $f \in L^\infty([0, T]; L^1 \cap L^\infty)$ 且 $\iint |v|^2 f < \infty$。在分布意义下，$f$ 满足 $(\partial_t + v \cdot \nabla_x + E \cdot \nabla_v) \beta(f) = 0$（对所有 $\beta \in C^1$）。由重正规化技巧（DiPerna-Lions），此即重正规化解。若 $f_0 \in C^1$，则解为经典解。$\blacksquare$

**定理 373.2**（Pfaffelmoser 经典解，1992）：对 $C^1$ 且紧支撑的初值 $f_0$，Vlasov-Poisson 系统在 $d=3$ 时存在全局经典解。Pfaffelmoser 证明的关键在于沿特征线估计速度的最大增长，证明了 $|V(t)| \leq C(1+t)^{1+\varepsilon}$，从而防止了有限时间爆破。

**证明**：由特征线法，$f(t, X(t), V(t)) = f_0(x, v)$ 沿特征线 $\dot{X} = V$，$\dot{V} = E(t, X)$ 为常数。电场 $E(t, x) = \frac{x}{|x|^3} * \rho(t, x)$（Coulomb 力）。关键估计：对任意粒子，$|V(t)| \leq C (1+t)^{2/3} \log(2+t)$。Pfaffelmoser 将相空间按速度大小分层，对每层粒子分别估计其对电场的贡献。设 $f_0$ 支撑在 $|v| \leq R$ 内。对 $t$ 时刻速度 $|V(t)| \geq R$ 的粒子，其对应的初始位置在 $|x| \leq R t + O(1)$ 内。将此区域的电荷分布分解为"近场"和"远场"贡献，利用 Poisson 方程和 Newton 位势的衰减性质，证明 $|E(t, X(t))| \leq C (1+t)^{-2/3+o(1)}$。积分 $\dot{V} = E$ 得 $|V(t)| \leq C (1+t)^{1/3+o(1)}$，更精细的 bootstrap 论证将此改进为 $|V(t)| \leq C (1+t)^{1+\varepsilon}$（对任意 $\varepsilon > 0$）。由于特征线全局存在，解 $f$ 全局存在且保持 $C^1$ 正则性。$\blacksquare$

### 373.3 Landau阻尼的线性理论

**定理 373.3**（线性 Landau 阻尼，Landau 1946）：考虑空间均匀平衡态 $f_0(v)$（$d=1$ 情形）上的线性化 Vlasov-Poisson 系统。对扰动 $f_1(t,x,v) = g(t,v)e^{ikx}$，电场 $E(t,x) = \hat{E}(t)e^{ikx}$。由 Laplace 变换分析，当 $t\to\infty$ 时，
$$\hat{E}(t) \sim C e^{-i\omega_p t - \gamma t}, \quad \gamma = \frac{\pi}{2}\frac{\omega_p^3}{k^2} f_0'\left(\frac{\omega_p}{k}\right)$$
其中 $\omega_p$ 为等离子体频率，由色散关系 $\varepsilon(k,\omega)=1-\frac{\omega_p^2}{k^2}\int \frac{f_0'(v)}{v-\omega/k}dv=0$ 确定。若 $f_0'(\omega_p/k)<0$（Penrose 稳定性条件），则 $\gamma>0$，电场呈指数衰减——此即 Landau 阻尼。

**Landau 阻尼的物理机制**：衰减源于波-粒子共振导致的相位混合（phase mixing）。速度为 $v \approx \omega/k$ 的粒子与波共振，从波中吸收能量。若速度分布 $f_0$ 在共振速度处具有负斜率（$f_0'(\omega/k) < 0$），则加速的粒子多于减速的粒子，粒子从波中净吸收能量，波衰减。反之（$f_0'(\omega/k) > 0$），则发生 Landau 增长（逆 Landau 阻尼，如束-等离子体不稳定性）。这一过程在无碰撞系统中发生，体现了 Vlasov 方程的不可逆行为——尽管方程本身是时间可逆的（Liouville 定理），但线性化系统的连续谱导致扰动在弱意义下衰减。

**证明**：线性化 Vlasov-Poisson 系统：$\partial_t f_1 + v\cdot\nabla_x f_1 + E\cdot\nabla_v f_0 = 0$，$\nabla\cdot E = \int f_1 dv$。Fourier-Laplace 变换（对 $t$ 作 Laplace 变换，对 $x$ 作 Fourier 变换）得 $f_1$ 的表达式，代入 Poisson 方程得色散关系 $\varepsilon(k,\omega) = 1 - \frac{1}{k^2}\int \frac{k\cdot\nabla_v f_0}{\omega - k\cdot v} dv = 0$。对稳定的 $f_0$（单峰分布），$\varepsilon(k,\omega)$ 在上半平面解析且在实轴下方有零点，对应 $\operatorname{Im}\omega = -\gamma < 0$。Laplace 逆变换的围道积分通过变形至实轴下方，留数贡献给出 $E(t) \sim e^{-i\omega_r t - \gamma t}$。$\blacksquare$

**定理 373.4**（Mouhot-Villani 非线性 Landau 阻尼，2011）：对充分光滑（Gevrey 类）且小振幅的初值扰动，非线性 Vlasov-Poisson 系统（$d \geq 1$，周期边界条件或全空间）的解在 $t\to\infty$ 时以几乎多项式速率（$O(t^{-N})$ 对任意 $N$）衰减至空间均匀态，验证了非线性稳定性和 Landau 阻尼在非线性水平上的严格成立。

**证明**：Mouhot-Villani 使用 Newton 迭代和正则化方法，分三个核心步骤。(1) 线性 Landau 阻尼：在线性层面，对空间均匀平衡态 $f_0(v)$ 的扰动，Vlasov 方程的线性化算子 $L = -v\cdot\nabla_x - E[f_1]\cdot\nabla_v f_0$ 具有连续谱。Gevrey 类正则性假设下，扰动 $f_1(t,x,v)$ 的 Fourier 模 $\hat{f}_1(k,v,t)$ 满足 $\hat{f}_1(k,v,t) \sim e^{-ik v t} \hat{f}_1(k,v,0) + \text{Landau 阻尼项}$，后者以 $e^{-\lambda|k|^{1/(1+s)} t}$ 衰减（$s$ 为 Gevrey 指数）。在线性层面，这给出指数衰减。(2) 非线性响应的级数展开：将非线性解写为 $f = f_0 + \sum_{n\geq 1} f^{(n)}$，其中 $f^{(n)}$ 为 $n$ 阶非线性贡献。关键挑战是控制等离子体回波（plasma echo）：不同波数 $k, k'$ 间的非线性相互作用产生共振项 $\sim e^{i(k-k')v t}$，这些共振项可能随 $t$ 增长，破坏衰减。Mouhot-Villani 证明，在 Gevrey 正则性下，不同波数间回波的叠加相互抵消——即回波链（echo chain）的估计在长时间尺度上保持可控。这一抵消机制是通过分析 Fourier 模式在复平面中的解析延拓实现的，其中不同波数间的非线性相互作用导致围道积分中的相消。(3) 在 Gevrey 类函数空间中建立一致估计：通过 Newton 迭代，在适当的加权范数下证明解的全局存在性，且扰动以几乎多项式速率 $O(t^{-N})$ 衰减至零。关键是将非线性项视为线性化问题的扰动，利用线性估计的指数衰减在迭代中控制非线性项的增长。$\blacksquare$

### 373.4 引力Vlasov-Poisson系统与稳定性

**定义 373.5**（引力 Vlasov-Poisson 系统与 Jeans 不稳定性）：引力情形（$\gamma_d = -4\pi G$）的平衡态为球对称静态解 $f_0(r, v) = F(E, L)$（$E = |v|^2/2 + \Phi_0(r)$ 为能量，$L = |x\times v|$ 为角动量），满足自洽 Poisson 方程。引力系统的稳定性与等离子体有本质不同：由于引力总是吸引的，系统可能经历 Jeans 不稳定性——密度扰动在引力作用下增长，导致引力塌缩。引力 Vlasov-Poisson 系统的非线性稳定性仍是开放问题，与星系动力学和暗物质晕的形成密切相关。

---
*重正化群从消除紫外发散的技术需求出发，经由 BPHZ 定理的严格森林公式和 $R$-操作，建立了微扰量子场论重整化的数学基础。Callan-Symanzik 方程和 $\beta$-函数描述了跑动耦合常数，渐近自由（Gross-Wilczek-Politzer）为 QCD 提供了理论基础。Wilson 重正化群从 Kadanoff 分块自旋变换出发，将临界现象的普适性与 RG 不动点理论联系起来，精确 RG 方程则为非微扰计算提供了系统框架。Vlasov 方程方面，DiPerna-Lions 的重正规化解理论和速度平均引理建立了弱解的存在性，Pfaffelmoser 给出了经典解的全局结果。Landau 阻尼的线性理论揭示了无碰撞等离子体中的不可逆现象，Mouhot-Villani 的非线性 Landau 阻尼定理（2011）是此领域里程碑式的突破。*

*卷三十一：数学物理。*