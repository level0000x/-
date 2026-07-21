## 第230章：Ricci 流

Ricci 流方程 $\partial_t g = -2\operatorname{Ric}(g)$ 由 Richard Hamilton 在 1982 年引入，是 20 世纪几何分析最重大的创见之一——其基本想法是将 Ricci 曲率视为度量张量的"热扩散"驱动力，使得曲率在演化过程中趋于均匀，从而实现微分几何与抛物方程理论在最高层次上的统一。Hamilton 本人证明了正 Ricci 曲率的三维流形在 Ricci 流下必然收缩为球面（从而证明此类流形必微分同胚于 $S^3/\Gamma$），并在 1980 年代和 1990 年代发展了 Ricci 流的奇点分析、Harnack 不等式和紧致性定理。Perelman 在 2002-2003 年的三篇著名预印本（后由多位数学家证实）引入了熵泛函 $\mathcal{W}$、约化体积和 $\kappa$-解的关键概念，成功克服了奇点处"外科手术"的技术困难，从而完成了 Thurston 几何化猜想的完整证明——这不仅蕴含了 Poincare 猜想，还给出了任意闭三维流形的标准几何分解。在本书体系中，Ricci 流与 Yamabe 问题（第206章）共享共形几何的理论渊源：Yamabe 问题的变分结构事实上是 Ricci 流在共形类内的"静态"版本。

### 184.1 Ricci 流方程

**定义 184.1**（Ricci 流）：Riemann 度量 $g(t)$ 的 **Ricci 流**方程为

$$\frac{\partial g_{ij}}{\partial t} = -2 \operatorname{Ric}_{ij}$$

这是度量的非线性扩散方程，类似热方程：曲率在正曲率区域减小，在负曲率区域增大。

**无量纲化 Ricci 流**（保持体积）：$\frac{\partial g_{ij}}{\partial t} = -2 \operatorname{Ric}_{ij} + \frac{2}{n} \bar{R} g_{ij}$，其中 $\bar{R}$ 是平均标量曲率。

**命题 184.1**（曲率演化方程）：在 Ricci 流下，曲率张量满足

$$\frac{\partial R_{ijkl}}{\partial t} = \Delta R_{ijkl} + 2(B_{ijkl} - B_{ijlk} + B_{ikjl} - B_{iljk})$$

其中 $B_{ijkl} = g^{pq} g^{rs} R_{pijr} R_{qkls}$。标量曲率满足 $\frac{\partial R}{\partial t} = \Delta R + 2|\operatorname{Ric}|^2$。

### 184.2 Hamilton 的定理

**定理 184.1**（Hamilton 短时间存在性，1982）：对任意紧 Riemann 流形，Ricci 流在短时间 $[0, T)$ 上存在唯一解。


**证明**：将 Ricci 流方程 $\partial_t g = -2\operatorname{Ric}(g)$ 视为非线性抛物型 PDE 系统。作 DeTurck 技巧：引入背景联络 $\tilde{\nabla}$ 并考虑修正流 $\partial_t g = -2\operatorname{Ric}(g) + \mathcal{L}_W g$，其中 $W^k = g^{ij}(\Gamma_{ij}^k - \tilde{\Gamma}_{ij}^k)$。修正后方程变为严格抛物型 $\partial_t g_{ij} = g^{kl}\tilde{\nabla}_k\tilde{\nabla}_l g_{ij} + \text{低阶项}$。由标准抛物型 PDE 的短时间存在性理论（线性化加非线性迭代），存在 $T>0$ 和唯一光滑解 $g(t)$。DeTurck 向量场 $W$ 对应时间依赖的微分同胚，原 Ricci 流等价地短时间存在。唯一性由 Hamilton 的能量估计和最大值原理保证。$\blacksquare$

**定理 184.2**（Hamilton 的 3 维正 Ricci 曲率定理，1982）：设 $M^3$ 是紧 3 维流形，初始度量具有正 Ricci 曲率。则 Ricci 流（经归一化）收敛到常正截面曲率度量。因此 $M^3$ 微分同胚于球面空间形式 $S^3 / \Gamma$。

**证明**：设初始度量 $\operatorname{Ric} > 0$。在归一化 Ricci 流 $\partial_t g = -2\operatorname{Ric} + \frac{2}{3}\bar{R}g$ 下，体积保持。由曲率张量演化方程和张量最大值原理，$\operatorname{Ric} > 0$ 在演化中保持。Hamilton 证明曲率夹逼（pinching）估计：$\frac{|\operatorname{Ric} - \frac{1}{3}Rg|^2}{R^2} \leq C R^{-\delta}$ 沿流单调递减至零。取缩放极限，曲率趋于常正截面曲率。由 Bishop-Gromov 体积比较和 Myers 定理，缩放极限的万有覆盖为 $S^3$。故 $M^3$ 微分同胚于 $S^3/\Gamma$。$\blacksquare$

*意义*：这是 Hamilton 开创 Ricci 流的动因——证明 3 维 Poincaré 猜想在正 Ricci 曲率下的特例。Hamilton 获 2011 年 Shaw 奖。

Hamilton 的正 Ricci 曲率定理（1982）首次展示了 Ricci 流作为几何化工具的潜力。然而，若要处理一般情形的奇异性，仅仅依赖曲率张量的点态估计是不够的——需要沿 Ricci 流演变的不变量来控制曲率的时空行为。这便是 Hamilton 在 1993 年引入微分 Harnack 不等式的动机。

**定理 184.3**（Hamilton 的 Harnack 不等式，1993）：对 Ricci 流的正曲率算子解，存在微分 Harnack 不等式，控制曲率的时间演化。

**证明**：设曲率算子 $\operatorname{Rm} \geq 0$。定义 Harnack 量 $Z_{ijkl} = \Delta R_{ijkl} + 2(B_{ijkl} - B_{ijlk} + B_{ikjl} - B_{iljk}) + \frac{1}{t}R_{ijkl}$。Hamilton 证明对任意向量场 $U, V$，二次型 $Z(U, V) \geq 0$。引入 Lie 导数沿梯度方向的时间导数，构造 Hamilton 矩阵型 Harnack 表达式 $P_{ijk} = \nabla_i R_{jk} - \nabla_j R_{ik}$，并证明 $P$ 满足抛物型不等式。由最大值原理得时空梯度估计 $\frac{|\nabla R|}{R} \leq \frac{C}{\sqrt{t}}$，继而控制曲率的时间演化，等价于 $t \cdot \partial_t R + R \geq 0$ 沿所有方向。$\blacksquare$

**定理 184.4**（Hamilton 的紧致性定理）：Ricci 流解序列在一定的曲率、直径和内射半径有界条件下，具有光滑收敛的子序列。

**证明**：设 $(M_k, g_k(t))$ 为完备 Ricci 流解序列，$t \in [0, T]$，满足 $|\operatorname{Rm}| \leq C$，$\operatorname{diam} \leq D$，$\operatorname{inj} \geq \iota > 0$。由 Cheeger-Gromov 紧致性定理，对每个 $t$，$(M_k, g_k(t))$ 在 Cheeger-Gromov 意义下子列收敛到光滑极限流形。Shi 的局部导数估计 $\|\nabla^m \operatorname{Rm}\| \leq C_m t^{-m/2}$ 给出 $C^\infty$ 有界性。由 Arzela-Ascoli 定理（在各时间片的 $C^\infty$ 拓扑下），对角论证得子列在 $C^\infty$ 中时空收敛。极限满足 Ricci 流方程（连续性）。$\blacksquare$

Hamilton 的 Harnack 不等式和紧致性定理为分析 Ricci 流的奇点结构提供了关键技术基础，但它们本身不足以处理奇点形成时流形的"塌缩"问题。Perelman 在 2002 年的突破正是从这一点切入的——他引入了一系列沿 Ricci 流单调的熵泛函，成功排除了塌缩现象。

### 184.3 Perelman 的工作与 Poincaré 猜想（概述，详见 V13）

下面给出 Perelman 在 2002-2003 年三篇里程碑式预印本中的核心定义和定理陈述。Grigory Perelman 的贡献是使用 Ricci 流（带手术）证明了 Thurston 几何化猜想（从而 Poincaré 猜想作为推论）。

Perelman 首次引入 $W$-熵泛函（2002 年的预印本中 §3），旨在利用 $W$-熵的单调性来控制沿 Ricci 流的有界熵推导出**紧性**（compactness），从而对任何极限中的奇点模型进行分类。$W$-熵的单调性是 Perelman 工作体系中最根本的分析工具：它确保了在 Ricci 流奇点处取缩放极限时，极限流形不会发生"塌缩"——即内射半径下有正下界控制。

**定理 184.5**（Perelman 的 $\mathcal{F}$-泛函与 $\mathcal{W}$-泛函，2002）：Perelman 引入两个关键泛函：

$$\mathcal{F}(g, f) = \int_M (R + |\nabla f|^2) e^{-f} \, dV$$

$$\mathcal{W}(g, f, \tau) = \int_M [\tau(R + |\nabla f|^2) + f - n] (4\pi\tau)^{-n/2} e^{-f} \, dV$$

$\mathcal{F}$ 沿 Ricci 流（与共轭热方程耦合）单调不减。$\mathcal{W}$ 沿 Ricci 流（与 $\tau$ 的适当演化耦合）单调不减。

**证明**：$\mathcal{F}$ 沿 Ricci 流 $\partial_t g = -2\operatorname{Ric}$ 和共轭热方程 $\partial_t f = -\Delta f + |\nabla f|^2 - R$ 的演化：$\frac{d}{dt}\mathcal{F}(g,f) = 2\int_M |\operatorname{Ric} + \nabla^2 f|^2 e^{-f} dV \geq 0$。$\mathcal{W}$ 沿 Ricci 流和 $\partial_t\tau = -1$ 以及 $\partial_t f = -\Delta f + |\nabla f|^2 - R + \frac{n}{2\tau}$ 的演化：$\frac{d}{dt}\mathcal{W} = 2\tau\int_M |\operatorname{Ric} + \nabla^2 f - \frac{1}{2\tau}g|^2 (4\pi\tau)^{-n/2}e^{-f}dV \geq 0$。单调性分别由 $\mu(g,\tau) = \inf\{\mathcal{W}(g,f,\tau) : \int (4\pi\tau)^{-n/2}e^{-f}dV = 1\}$ 和 $\lambda(g) = \inf\{\mathcal{F}(g,f) : \int e^{-f}dV = 1\}$ 的定义得到。$\blacksquare$

**定理 184.6**（非塌缩定理）：Perelman 证明在 Ricci 流下，曲率有界的区域体积非塌缩（内射半径有下界）。这排除了 Cheeger-Gromov 意义下的"塌缩"现象。

**证明**：设 $(M, g(t))$ 为 Ricci 流解，$p \in M$，$r > 0$ 满足 $|\operatorname{Rm}| \leq r^{-2}$ 在 $B_t(p, r)$ 上。Perelman 利用 $\mathcal{W}$-泛函的单调性：选取 $f$ 近似于 $\mathcal{W}$-极小化函数，定义约化体积 $\tilde{V}(t) = \int_M (4\pi\tau)^{-n/2} e^{-f} dV$。$\mathcal{W}$ 单调性蕴含 $\tilde{V}$ 在倒向时间下单调递减，导出 $t=0$ 处 $B_0(p, r)$ 的体积有下界 $V \geq c r^n$（$c>0$ 为万有常数）。由 Bishop-Gromov 体积比较，内射半径 $\operatorname{inj}(p) \geq c' r$。$\blacksquare$

非塌缩定理排除了 Ricci 流奇点分析中最棘手的障碍：它确保了在奇点处缩放后所得的规范模型（canonical models）具有正的内射半径，从而可以被有效地分类。在建立了奇点模型的分类型论之后，下一步自然是在 Ricci 流遇到奇点时执行几何手术——切除高曲率区域并粘贴标准帽，使得流可以继续光滑演化。

**定理 184.7**（Ricci 流的手术理论，2003）：当曲率在局部区域趋向无穷时，Perelman 的手术（surgery）程序切除高曲率区域，粘贴标准帽（standard cap），然后继续 Ricci 流的演化。手术次数有限。

**证明**：在 Ricci 流演化中，当曲率在点 $p$ 处满足 $|\operatorname{Rm}|(p) \geq \Theta$（手术阈值）时，检查 $p$ 的邻域是否为 $\varepsilon$-颈（$\varepsilon$-neck）。若为 $\varepsilon$-颈，在其狭窄处切断，粘贴标准解（standard solution，即 $S^2\times\mathbb{R}$ 上的旋转对称 Ricci 流解）。手术参数 $\varepsilon, \Theta$ 经精细选取确保：(1) 手术后的度量保持 Ricci 流初始条件；(2) 每次手术消耗一定量的 $\mathcal{W}$-熵，但 $\mathcal{W}$ 有下界（由拓扑决定），故手术仅发生有限次；(3) 手术后的 Ricci 流可继续演化至下一次手术或消失。$\blacksquare$

**定理 184.8**（Poincaré 猜想，Perelman 2002-2003）：任何单连通闭 3 维流形同胚于 $S^3$。

**证明**：任取 $M^3$ 上的初始度量，运行 Ricci 流（带手术）。Perelman 证明手术后的 Ricci 流在有限时间内消失（extinction），这意味着 $M^3$ 是连通和 $S^3 / \Gamma_i$ 的连通和。由基本群条件，$M^3 \cong S^3$。∎

**定理 184.9**（Thurston 几何化猜想，Perelman 2003）：任何闭 3 维流形可沿球面和环面分解为具有 8 种 Thurston 几何之一的片段。

*意义*：Perelman 因证明 Poincaré 猜想获 2006 年 Fields 奖（但拒绝领奖），是 21 世纪数学第一个重大突破。

**证明**：运行带手术的 Ricci 流。Perelman 证明：（1）有限时间奇性仅在颈（neck）结构处发生，手术可移除颈并恢复光滑流；（2）手术次数有限（由 $\int R^2$ 的单调下降保证）；（3）长时间极限流易分解为双曲片段（Ricci 流缩放至常负曲率）和 Seifert 片段或球面片段。结合 JSJ 分解的拓扑刚性和 Mostow 刚性完成。$\blacksquare$

### 184.4 Ricci 流在复几何中的应用

**定理 184.10**（Cao 定理，1985）：紧 Kähler 流形上的 Kähler-Ricci 流 $\frac{\partial g_{i\bar{j}}}{\partial t} = -R_{i\bar{j}}$ 在 $c_1(M) \leq 0$ 时收敛到 Kähler-Einstein 度量。

**证明**：Kähler-Ricci 流在 Kähler 类内演化为 $\frac{\partial}{\partial t} \omega_t = -\operatorname{Ric}(\omega_t)$。若 $c_1(M)=0$，此为 Yau 的定理（Ricci 平坦度量）。若 $c_1(M)<0$，演化为 $\frac{\partial}{\partial t} \omega_t = -\operatorname{Ric}(\omega_t) - \omega_t$，通过 Aubin-Yau 连续性方法的抛物化得到指数收敛到唯一的 Kähler-Einstein 度量（$\operatorname{Ric} = -\omega$）。$\blacksquare$

Cao 定理将 Ricci 流的应用从实几何扩展到了复几何框架。当 $c_1(M)>0$（即 Fano 流形情形）时，问题变得更加微妙——Kähler-Ricci 流的收敛性等价于流形的 $K$-稳定性，这是一个代数几何概念。这一深刻的联系由 Chen-Donaldson-Sun 在 2014 年完整证明，完成了 Yau-Tian-Donaldson 猜想的最后一环。

**定理 184.11**（Chen-Donaldson-Sun 定理，2014）：Fano 流形上 Kähler-Einstein 度量存在的充要条件是 $K$-稳定性。这是 Yau-Tian-Donaldson 猜想的证明，使用 Kähler-Ricci 流方法。

**证明**：必要性由 Tian 和 Donaldson 证明（若 KE 度量存在则 $K$-稳定）。充分性由 Chen-Donaldson-Sun 通过 Kähler-Ricci 流的解析紧化证明：若 $K$-稳定，则沿 Kähler-Ricci 流的奇点有限且可由代数几何的破坏边模（destabilizing test configuration）探测；这给出矛盾故 Ricci 流收敛到 KE 度量。$\blacksquare$

### 184.5 Cheeger-Gromoll 分裂定理

Cheeger-Gromoll 分裂定理是关于非负 Ricci 曲率完备 Riemann 流形结构的深刻结果，是 Ricci 流理论的几何背景之一。

**定理 184.12**（Cheeger-Gromoll 分裂定理，1971）：设 $(M, g)$ 是完备的 $n$ 维 Riemann 流形，满足 $\operatorname{Ric} \geq 0$（Ricci 曲率处处非负）。若 $M$ 包含一条直线（即等距嵌入 $\gamma: \mathbb{R} \to M$ 满足 $d(\gamma(s), \gamma(t)) = |s-t|$ 对所有 $s,t$），则 $M$ 等距分裂为乘积 $M \cong \mathbb{R} \times N$，其中 $N$ 是完备的 $(n-1)$ 维 Riemann 流形且 $\operatorname{Ric}_N \geq 0$。该定理使用 Busemann 函数和极大值原理证明：直线 $\gamma$ 定义了互为反方向的 Busemann 函数 $b^\pm$，其和 $b^+ + b^-$ 在 $M$ 上恒为零且梯度为平行向量场，从而给出分裂的测地叶状结构。推论包括：$\mathbb{R}^n$ 是唯一含直线的正截面曲率完备流形；任何 $\operatorname{Ric} \geq 0$ 的紧流形的万有覆盖等距分裂为 $\mathbb{R}^k \times N$，其中 $N$ 是紧的。


**证明**：设 $\gamma:\mathbb{R}\to M$ 为直线（单位速度测地线，其任意子段均极小）。对每个 $t\in\mathbb{R}$，定义 Busemann 函数 $b^+(x)=\lim_{t\to+\infty}(d(x,\gamma(t))-t)$ 和 $b^-(x)=\lim_{t\to-\infty}(d(x,\gamma(t))+t)$。由 Ric$\ge 0$ 和 Laplacian 比较定理，$b^+$ 和 $b^-$ 均为调和函数（$\Delta b^\pm = 0$），且 $b^++b^-=0$。其梯度 $\nabla b^+$ 为平行向量场，故 $M$ 局部裂为 $\mathbb{R}\times N$。完备性确保全局分裂：$M\cong\mathbb{R}\times N$ 为等距，其中 $N$ 是满足 Ric$\ge 0$ 的完备流形。$\blacksquare$

---

---

---

---

---
---

## 第231章：Yamabe 问题与共形几何

Yamabe 问题是最具历史深度的几何分析问题之一：给定紧 Riemann 流形 $(M^n, g)$（$n \geq 3$），在度量 $g$ 的共形类 $[g]$ 中是否存在常标量曲率度量？这一问题由 Yamabe Hidehiko 在 1960 年提出，给出的证明包含一个深刻错误（被 Neil Trudinger 在 1968 年发现），最终由 Thierry Aubin（1976 年，对于非共形平坦且 $n \geq 6$ 的情形）和 Richard Schoen（1984 年，通过正质量定理完成剩余情形）彻底解决。从分析角度看，Yamabe 问题等价于求解半线性椭圆方程 $-\Delta_g u + \frac{n-2}{4(n-1)} R_g u = \lambda u^{\frac{n+2}{n-2}}$（共形 Laplace/Yamabe 方程），其非线性指数 $\frac{n+2}{n-2}$ 恰是 Sobolev 嵌入的临界指数——这使得变分问题失去了紧性，需要 Aubin 和 Schoen 发展的集中紧性原理和爆破分析技巧。在几何学中，Yamabe 不变的符号是度量共形类的核心分类数据：正 Yamabe 不变量的流形容许正标量曲率度量（与正质量定理和广义相对论中的正能量条件密切相关），而零和负的 Yamabe 不变量则通向非紧致流形的共形几何。本章与 Ricci 流（第205章）之间的关系是：Ricci 流方程在共形类内取定标量曲率常值的"静态解"，恰好对应于 Yamabe 问题的极值度量。

### 185.1 Yamabe 问题

**定义 185.1**（Yamabe 问题）：设 $(M^n, g)$ 是紧 Riemann 流形（$n \geq 3$）。在 $g$ 的共形类 $[g] = \{u^{4/(n-2)} g : u > 0, u \in C^\infty(M)\}$ 中，是否存在常标量曲率的度量？

**共形变换下的标量曲率**：若 $\tilde{g} = u^{4/(n-2)} g$，则

$$\tilde{R} = u^{-(n+2)/(n-2)} \left(Ru - \frac{4(n-1)}{n-2} \Delta_g u\right)$$

令 $\tilde{R} = \text{const}$，得到共形 Yamabe 方程：

$$-\frac{4(n-1)}{n-2} \Delta_g u + Ru = \lambda u^{(n+2)/(n-2)}$$

这是临界 Sobolev 指数的半线性椭圆 PDE。

**定义 185.2**（Yamabe 不变量）：度量 $g$ 的共形类的 **Yamabe 不变量**（Yamabe 商）为

$$Y(g) = \inf_{u \in C^\infty, u > 0} \frac{\int_M (\frac{4(n-1)}{n-2}|\nabla u|^2 + Ru^2) dV_g}{(\int_M u^{2n/(n-2)} dV_g)^{(n-2)/n}}$$

### 185.2 Yamabe 问题的解决

**定理 185.1**（Yamabe 定理 / Trudinger-Aubin-Schoen 定理）：对任何紧 Riemann 流形 $(M^n, g)$（$n \geq 3$），共形类 $[g]$ 中存在常标量曲率度量。

*历史*：Yamabe（1960）声称证明但有错误——他在证明中未正确处理临界 Sobolev 嵌入的紧性缺失。Trudinger（1968）通过对 Yamabe 泛函的精细分析，证明了当 $Y(g) \leq 0$ 时极小化序列的紧性成立，从而解决了此情形。Aubin（1976）引入局部化方法，证明当 $Y(g) < Y(S^n)$（$Y(S^n)$ 为标准球面的 Yamabe 不变量）时，极小化泛函的紧性恢复，并完成了 $n \geq 6$ 且 $(M,g)$ 非局部共形平坦情形的证明。剩余的临界情形——特别是 $Y(g)=Y(S^n)$ 以及低维的情形——则需要排除"气泡"的形成。Schoen（1984）使用**正质量定理**（Positive Mass Theorem）证明了在剩余所有情形中均有 $Y(g) < Y(S^n)$（除非 $(M,g)$ 共形等价于 $S^n$），从而彻底解决了 Yamabe 问题。该问题的完整解决历时 24 年，涉及几何分析、临界 Sobolev 理论和广义相对论中正质量猜想的深刻交汇。

**定理 185.1$^*$**（正质量定理，Schoen-Yau 1979, Witten 1981）：设 $(M^n, g)$ 是渐近平坦 Riemann 流形（$3 \leq n \leq 7$），满足主导能量条件（$R_g \geq 0$ 在主方向上）。则 ADM 质量 $m_{\operatorname{ADM}} \geq 0$，且 $m_{\operatorname{ADM}} = 0$ 当且仅当 $(M, g)$ 等距于 $\mathbb{R}^n$。

**证明**（Schoen-Yau方法）：假设 $m_{\text{ADM}} < 0$。构造极小曲面 $\Sigma \subset M$ 为面积泛函的极小化序列的极限。由第二变分公式，$\Sigma$ 的稳定性给出 $\int_\Sigma |A|^2 + \operatorname{Ric}_M(\nu,\nu) \leq 0$。利用 Gauss 方程将 $\operatorname{Ric}_M(\nu,\nu)$ 表为 $\Sigma$ 的内蕴曲率，得 $\int_\Sigma R_\Sigma - |A|^2 \geq 0$。由 Gauss-Bonnet 和 Gauss 曲率积分估计，导出矛盾（当 $n=3$ 时 $\Sigma$ 为极小曲面，面积泛函的渐近行为与 ADM 质量符号冲突）。故 $m_{\text{ADM}} \geq 0$。若 $m_{\text{ADM}} = 0$，则 $M$ 为 Ricci 平坦且渐近平坦，由刚性定理必为 $\mathbb{R}^n$。$\blacksquare$

**证明**：当 Yamabe 不变量 $Y(g) < Y(S^n)$ 时，极小化序列的紧性成立（Sobolev 嵌入的临界指数困难通过 Aubin 的局部化方法克服）。Schoen 使用正质量定理证明 $Y(g) \leq Y(S^n)$ 且等号成立当且仅当 $(M, g)$ 共形等价于 $S^n$。∎

### 185.3 预定标量曲率

**定义 185.3**（预定标量曲率问题 / Nirenberg 问题）：给定 $S^2$ 上的函数 $K(x)$，是否存在 $S^2$ 上共形于标准度量的度量，其 Gauss 曲率为 $K(x)$？

Yamabe 问题的解决回答了"是否存在常标量曲率度量"这一存在性问题；而 Nirenberg 问题更进一步——它要求度量上的标量曲率恰好取为给定的函数 $K(x)$。这是一个本质上更为困难的反问题，其可解性不仅取决于 $K$ 的正则性，还受到深刻的拓扑障碍制约。

**定理 185.2**（Kazdan-Warner 障碍，1974）：$S^2$ 上存在 Gauss 曲率 $K$ 的必要条件是：对任何一阶球谐函数 $\psi$，$\int_{S^2} \nabla K \cdot \nabla \psi \, dV = 0$。这给出了 $S^2$ 上预定 Gauss 曲率问题的拓扑障碍。


**证明**：$S^2$ 上的共形 Gauss 曲率方程 $\Delta u + K e^{2u} = 1$（$K$ 为预定曲率）。对任意一阶球谐函数 $\psi$（即 $\Delta_{S^2}\psi = -2\psi$），将方程两端乘 $\nabla\psi$ 并在 $S^2$ 上积分：$\int \Delta u \nabla\psi + \int K e^{2u} \nabla\psi = \int \nabla\psi$。分部积分并利用 $\nabla\psi$ 与共形因子的相容性，得 $\int \nabla K \cdot \nabla\psi \, e^{2u} dV = 0$。因 $e^{2u}>0$，这等价于 $\int \nabla K\cdot\nabla\psi \, d\sigma = 0$（标准球面测度下），即 $K$ 必须与所有一阶球谐函数正交。此为 $S^2$ 上 Nirenberg 问题的著名障碍条件。$\blacksquare$

Kazdan-Warner 障碍条件表明，并非每个光滑正函数都可以实现为 $S^2$ 上某个度量的 Gauss 曲率——这是一个纯分析的 PDE 问题中存在全局拓扑障碍的典型案例。在排除了这些障碍之后，能否给出充分条件保证解的存在性？Chang 和 Yang 的工作正是沿着这一方向给出了一组较为一般的充分条件。

**定理 185.3**（Chang-Yang 解，1987）：$S^2$ 上的 Nirenberg 问题在 $K(x)$ 为正函数且满足某些非退化条件时解决。


**证明**：Chang-Yang 方法基于 Kazdan-Warner 条件的充分性证明。当 $K>0$ 且满足非退化条件（$\nabla^2 K$ 在临界点处非退化），用变分方法在 H¹ 空间中构造能量泛函 $J(u)=\frac{1}{2}\int|\nabla u|^2 + \int u - \frac{1}{2}\log\int K e^{2u}$ 的临界点。Moser-Trudinger 不等式保证 $J$ 在约束条件下满足 Palais-Smale 条件（排除边界发散和集中紧性缺失）。通过 min-max 和 Morse 理论，临界点数目由 $K$ 的拓扑信息（临界点 Morse 指标）决定，保证解的存在性。$\blacksquare$

---

---

---

---

---
---

## 第232章：几何 PDE 选讲

本章补充介绍几何分析中与 Ricci 流和 Yamabe 问题并列的其他核心几何偏微分方程。平均曲率流（mean curvature flow，MCF）是超曲面在外法向方向以平均曲率速度演化的几何热流——其方程 $\partial_t X = -H \mathbf{n}$ 是 Ricci 流在余维数大于 1 情形的自然类比，在曲面论的 Grayson 定理、Huisken 的凸性理论和 Brakke 的 varifold 弱解理论中产生了深刻结果。Yang-Mills 方程则源于规范场论：联络 $A$ 的 Yang-Mills 泛函 $\|F_A\|_{L^2}^2$ 的 Euler-Lagrange 方程 $D_A^* F_A = 0$ 是四维流形 Donaldson 理论（第193章）的出发点，其 anti-self-dual 解（瞬子）在低维拓扑的 Floer 同调（第192章）和四维光滑结构分类中发挥了核心作用。调和映射热流则将映射间的能量泛函极小化问题转化为梯度流，在 Eells-Sampson 关于非正截面曲率存在性定理和 Sacks-Uhlenbeck 的泡泡分析中具有里程碑意义。这三类 PDE 共享的数学结构——能量泛函极小化、单调性公式和奇点形成-分析的正则化——构成了几何分析中"变分法 + 热流"范式的教科书示例。

### 186.1 平均曲率流

**定义 186.1**（平均曲率流）：$n$ 维超曲面 $M_t \subset \mathbb{R}^{n+1}$ 的**平均曲率流**（MCF）为

$$\frac{\partial \mathbf{x}}{\partial t} = -H \mathbf{n}$$

其中 $\mathbf{x}$ 是位置向量，$H$ 是平均曲率，$\mathbf{n}$ 是单位法向量。MCF 是面积泛函的梯度流：$\frac{d}{dt} \operatorname{Area}(M_t) = -\int_{M_t} H^2 dV \leq 0$。

**定理 186.1**（Huisken 定理，1984）：$\mathbb{R}^{n+1}$ 中的紧凸超曲面在平均曲率流下保持凸性，并在有限时间内收缩为一点（"round point"）。经归一化后收敛到标准球面。


**证明**：设 $M_t\subset\mathbb{R}^{n+1}$ 为平均曲率流下的紧凸超曲面。凸性保持：由第二基本形式 $h_{ij}$ 的演化方程 $\partial_t h_{ij} = \Delta h_{ij} + |A|^2 h_{ij} - 2H h_{ik}h_{kj}$ 和 Hamilton 的张量最大值原理，$h_{ij}\ge 0$ 在演化中保持。当曲率趋于无穷时缩放极限为自相似收缩解。Huisken 通过单调性公式分析高斯密度，证明收缩极限为球面——因球面是唯一紧致自相似收缩凸超曲面（由 Huisken 的分类定理）。归一化后沿 $S^n$ 球面形状收敛。$\blacksquare$

**定理 186.2**（Grayson 定理，1987）：$\mathbb{R}^2$ 中任何嵌入闭曲线在曲线缩短流（平均曲率流的 1 维情形）下变为凸曲线，然后收缩为一点。


**证明**：平面曲线缩短流（CSF）：曲线 $\gamma(s,t)$ 满足 $\partial_t\gamma = \kappa N$（$\kappa$ 为曲率）。Gage-Hamilton 证明凸曲线在 CSF 下保持凸性并收缩为圆。Grayson 证明非凸嵌入闭曲线的曲率在有限时间后处处变号仅有限次，最终变为处处正——利用 Sturm 零点比较定理分析曲率零点的演化，每次零点的消失对应曲线的自交消除。一旦变为凸曲线，由 Gage-Hamilton 结果知曲线收缩为一点。$\blacksquare$

**定理 186.3**（Huisken-Sinestrari 手术理论，1999）：对 2-凸平均曲率流（$\lambda_1 + \lambda_2 > 0$），可以通过手术理论处理奇点形成。


**证明**：2-凸（$\lambda_1+\lambda_2>0$）平均曲率流的手术：当第二基本形式在某区域超过某阈值 $H_{\max}$ 时，识别高曲率区域（$\varepsilon$-颈状或帽状）。手术步骤：切除高曲率颈部，粘贴标准解（如旋转对称收缩孤子）。关键估计：(1) 凸性估计确保 $\lambda_1+\lambda_2>0$ 保持；(2) 梯度估计控制奇点附近的几何形状；(3) $\varepsilon$-正则性定理确保低于阈值区域光滑。手术仅发生有限次，每次手术后的流在拓扑上简化——最终拓扑为若干球面的连通和。$\blacksquare$

### 186.2 Yang-Mills 方程

**定义 186.2**（Yang-Mills 泛函）：设 $P \to M$ 是主 $G$-丛，$A$ 是联络。**Yang-Mills 泛函**为

$$\mathcal{YM}(A) = \int_M \|F_A\|^2 \, dV$$

其中 $F_A = dA + A \wedge A$ 是曲率 2-形式。**Yang-Mills 方程**是

$$D_A^* F_A = 0$$

（$D_A$ 是协变外微分）。Yang-Mills 联络是 Yang-Mills 泛函的临界点。

**定理 186.4**（Uhlenbeck 的可去奇点定理，1982）：设 $A$ 是 $B^4 \setminus \{0\}$ 上的 Yang-Mills 联络，具有有限 Yang-Mills 作用量。则 $A$ 可光滑延拓到整个 $B^4$。


**证明**：设 $A$ 是 $B^4\setminus\{0\}$ 上的 Yang-Mills 联络，能量 $\int_{B^4}|F_A|^2<\infty$。选取规范使 $A$ 满足 Coulomb 规范条件 $d^*A=0$。在此规范下，Yang-Mills 方程变为椭圆型：$\Delta A = \text{低阶项}$。由能量有界性和椭圆正则性（Morrey 估计），$A$ 在原点上具有可去奇点——可光滑延拓过 $0$。关键技术：Uhlenbeck 的 Coulomb 规范构造在小球上存在且唯一（模去紧规范群的常值作用），提供了获得正则性的合适坐标系。$\blacksquare$

**定理 186.5**（Donaldson 定理，1983）：单连通光滑 4 维流形上 Yang-Mills 瞬子（自对偶 Yang-Mills 联络）的模空间给出了微分同胚不变量（Donaldson 不变量），揭示了 4 维拓扑的奇异性质。


**证明**：在单连通光滑 4 维流形 $X$ 上研究 $\operatorname{SU}(2)$-瞬子（反自对偶 Yang-Mills 联络）的模空间 $\mathcal{M}_k$。Atiyah-Hitchin-Singer 指标定理给出模空间维数 $\dim\mathcal{M}_k=8k-3(1-b_1+b_2^+)$。Uhlenbeck 紧致性定理给出模空间紧化，其边界由理想瞬子构成。在适当维数下，$\mathcal{M}_k$ 的光滑部分为有限维流形，定义其基本类的杯积结构得 Donaldson 多项式不变量。这些不变量在微分同胚下不变，但可区分同胚但非微分同胚的 4 维流形，揭示 4 维微分拓扑的非凡复杂性。$\blacksquare$

**定理 186.6**（Uhlenbeck 紧致性定理，1982）：Yang-Mills 联络序列在 Yang-Mills 作用量有界条件下，除有限个奇点外，弱收敛到 Yang-Mills 联络（模去规范变换）。


**证明**：设 $\{A_n\}$ 为 $B^4$ 上 Yang-Mills 联络序列，满足 $\int_{B^4}|F_{A_n}|^2\le C<\infty$。选取 Coulomb 规范，由弱紧致性（$W^{1,2}$ 中有界）得子列弱收敛到弱 Yang-Mills 联络 $A_\infty$。利用 $\varepsilon$-正则性：若某点处曲率密度小于某阈值 $\varepsilon_0$，则该点邻域内 $A_\infty$ 光滑。曲率可集中在有限个孤立点——这些点处曲率密度超过阈值，其总曲率有正下界，由能量界知奇点有限。在光滑区域，$A_n$ 强收敛到光滑联络 $A_\infty$。$\blacksquare$

### 186.3 调和映射热流

调和映射热流是 Eells-Sampson 关于调和映射存在性理论的自然抛物化。从变分角度看，调和映射是 Dirichlet 能量的临界点，而热流则是沿此能量的最速下降方向寻找临界点的动力学过程。这一思想与 Ricci 流（面积/体积泛函的梯度流）和平均曲率流（面积泛函的梯度流）一脉相承，共同构成了几何热流理论的三大支柱。

**定义 186.3**（调和映射热流）：调和映射的热流方程为

$$\frac{\partial f_t}{\partial t} = \tau(f_t)$$

其中 $\tau(f_t)$ 是 $f_t$ 的张力场。这是能量泛函的梯度流。

**定理 186.7**（Struwe 定理，1985）：从紧 Riemann 面到紧 Riemann 流形的调和映射热流，在有限个奇点处形成"气泡"（bubble）后，继续光滑演化。全局弱解存在。


**证明**：调和映射热流 $\partial_t u = \tau(u)$（$\tau$ 为张力场）的全局弱解存在。Struwe 构造时间离散的变分逼近：在每个时间步 $t_{k+1}=t_k+h$ 解最小化问题 $\min \int|\nabla u|^2 + \frac{1}{2h}\int d(u,u_k)^2$。当气泡（能量集中）形成时，在奇点处移除气泡（对应该处调和球面 $S^2\to N$ 的生成），在气泡移除后的区域流继续光滑演化。气泡生成仅有限次（因每次消耗最少能量 $\varepsilon_0$）。全局弱解在气泡处连续但不一定光滑。$\blacksquare$

**定理 186.8**（气泡分析，Sacks-Uhlenbeck 1981）：调和映射序列的紧性缺失由气泡现象（bubbling）描述：能量在孤立点处集中，形成非平凡的调和球面 $S^2 \to N$。


**证明**：设 $\{u_n\}$ 为从 Riemann 面 $\Sigma$ 到紧 Riemann 流形 $N$ 的调和映射序列，能量有界。气泡分析的结论：(1) $u_n$ 光滑收敛到光滑调和映射 $u_\infty$，除有限个气泡点外；(2) 在每个气泡点 $p$ 处，重新缩放（放大）$u_n$ 在 $p$ 附近的限制，得到非平凡调和球面 $S^2\to N$（即气泡）；(3) 能量等式：$\lim E(u_n)=E(u_\infty)+\sum \text{（各气泡的能量）}$；(4) 气泡间形成气泡树（bubble tree）结构——连接气泡的 neck 区域能量在极限下消失。$\blacksquare$

---

---

---

---

---