# 卷三十五：几何分析

> 几何分析是微分几何与偏微分方程交汇的前沿领域，用PDE方法研究几何问题，同时从几何中提取PDE的深刻结构。本卷从极小曲面和调和映射出发，深入讨论 Ricci 流（Perelman 证明 Poincaré 猜想的伟大工具）、Yamabe 问题（共形几何的核心），以及平均曲率流和 Yang-Mills 方程等几何 PDE。

---

## 第363章：极小曲面
极小曲面是局部面积极小的曲面，是几何变分问题最经典的例子。Plateau 问题（1840年代提出）是极小曲面理论的起源。

### 182.1 极小曲面方程

**定义 182.1**（面积泛函）：曲面 $\Sigma$ 的参数化 $\mathbf{r}: U \to \mathbb{R}^3$ 的**面积**为

$$A(\mathbf{r}) = \int_U \sqrt{EG - F^2} \, du \, dv$$

其中 $E, F, G$ 是第一基本形式的系数。**极小曲面**是面积泛函的临界点。

**定义 182.2**（平均曲率）：曲面 $\Sigma$ 的**平均曲率** $H = \frac{1}{2}(\kappa_1 + \kappa_2)$（主曲率的平均值）。极小曲面满足 $H \equiv 0$。

**定理 182.1**（极小曲面方程）：非参数化曲面 $z = u(x, y)$ 是极小曲面的充要条件是

$$\operatorname{div}\left(\frac{\nabla u}{\sqrt{1 + |\nabla u|^2}}\right) = 0$$

即

$$(1 + u_y^2)u_{xx} - 2u_x u_y u_{xy} + (1 + u_x^2)u_{yy} = 0$$

这是二阶拟线性椭圆型偏微分方程。

**定理 182.2**（Bernstein 定理，1915-1927）：$\mathbb{R}^2$ 上整体定义的极小曲面图（$z = u(x, y)$，$u$ 定义在整个 $\mathbb{R}^2$ 上）必为平面。即 $\mathbb{R}^3$ 中整体定义的极小曲面图只能是平面。

*注*：Bernstein 定理在 $\mathbb{R}^n$（$n \leq 7$）中成立，在 $\mathbb{R}^8$ 中不成立（Bombieri-De Giorgi-Giusti, 1969）。这是极小曲面理论与几何测度论的深刻联系。

### 182.2 Plateau 问题

**定义 182.3**（Plateau 问题）：给定 $\mathbb{R}^3$ 中的闭曲线 $\Gamma$，求以 $\Gamma$ 为边界的面积最小的曲面。

**定理 182.3**（Douglas-Radó 解，1930-1931）：对任意可求长 Jordan 曲线 $\Gamma$，存在以 $\Gamma$ 为边界的极小曲面（可能带有分支点）。Douglas 因此获首届 Fields 奖（1936）。

*方法*：Douglas 将问题转化为 Dirichlet 积分（能量泛函）的极小化：

$$E(\mathbf{r}) = \frac{1}{2} \int_U (|\mathbf{r}_u|^2 + |\mathbf{r}_v|^2) \, du \, dv$$

在共形参数化下，$E(\mathbf{r}) = A(\mathbf{r})$，极小曲面等价于调和映射。

**定理 182.4**（共形表示定理）：任何极小曲面 $\Sigma \subset \mathbb{R}^3$ 存在等温坐标（共形参数化），使得 $\mathbf{r}: U \to \Sigma$ 满足 $\mathbf{r}_{uu} + \mathbf{r}_{vv} = 0$（即分量是调和函数）且 $|\mathbf{r}_u| = |\mathbf{r}_v|$，$\mathbf{r}_u \cdot \mathbf{r}_v = 0$。

### 182.3 极小曲面的例子

**例 182.1**（经典极小曲面）：
- **平面**：$H = 0$（平凡极小曲面）
- **悬链面**（catenoid）：$x^2 + y^2 = \cosh^2 z$（唯一的旋转极小曲面，除平面外）
- **螺旋面**（helicoid）：$x \sin z = y \cos z$（与悬链面通过等距形变相关联）
- **Enneper 曲面**：带自交的完备极小曲面
- **Scherk 曲面**：$z = \log(\cos x / \cos y)$（周期极小曲面）
- **Costa 曲面**（1982）：亏格 1 的完备嵌入极小曲面（有 3 个端）

**定理 182.5**（Costa-Hoffman-Meeks 定理）：存在任意高亏格的完备嵌入极小曲面。

### 182.4 几何测度论方法

**定义 182.4**（整变分流）：**整变分流**（integral varifold）是几何测度论中广义曲面的概念，允许奇点存在。变分流是面积泛函的临界点。

**定理 182.6**（Allard 正则性定理）：变分流在几乎处处意义下是光滑的极小曲面。奇点集是闭的且 Hausdorff 维数不超过 $n-7$（$n$ 为外围空间的维数）。

**定理 182.7**（Almgren 大正则性定理，1983）：面积最小化整变分流在开稠密集上是光滑的。

---

---

---

## 第364章：调和映射
调和映射是 Riemann 流形之间的映射，极小化能量泛函。它是极小曲面（调和函数）在流形间的推广。

### 183.1 能量泛函与调和映射方程

**定义 183.1**（能量泛函）：Riemann 流形 $(M, g)$ 到 $(N, h)$ 的光滑映射 $f: M \to N$ 的**能量**（Dirichlet 能量）为

$$E(f) = \frac{1}{2} \int_M \|df\|^2 \, dV_g$$

其中 $\|df\|^2 = \operatorname{tr}_g(f^*h)$ 是映射的 Hilbert-Schmidt 范数。

**定义 183.2**（调和映射）：**调和映射**是能量泛函 $E(f)$ 的临界点。在局部坐标下，调和映射方程（Eells-Sampson 方程）为

$$\tau(f) = \Delta_g f^\alpha + \Gamma_{\beta\gamma}^\alpha(f) g^{ij} \frac{\partial f^\beta}{\partial x^i} \frac{\partial f^\gamma}{\partial x^j} = 0$$

其中 $\tau(f)$ 是**张力场**（tension field），$\Gamma_{\beta\gamma}^\alpha$ 是 $N$ 的 Christoffel 符号。

**例 183.1**（调和映射的例子）：
- $N = \mathbb{R}$：调和映射是调和函数（$\Delta f = 0$）
- $M = S^1$：调和映射是 $N$ 中的闭测地线
- 等距浸入：若 $f$ 是极小浸入则 $f$ 是共形调和映射
- 全测地映射：$\nabla df = 0$ 是调和映射的特例

### 183.2 Eells-Sampson 定理

**定理 183.1**（Eells-Sampson 定理，1964）：设 $M$ 是紧 Riemann 流形，$N$ 是紧 Riemann 流形且截面曲率非正（$K_N \leq 0$）。则任何连续映射 $f: M \to N$ 同伦于一个调和映射，且该调和映射在同伦类中极小化能量。

*证明思路*：使用热流方法。考虑演化方程 $\frac{\partial f_t}{\partial t} = \tau(f_t)$。当 $K_N \leq 0$ 时，能量沿热流单调递减，且解的导数有界（Bochner 技术）。热流收敛到调和映射。∎

**定理 183.2**（Bochner 公式，调和映射情形）：对调和映射 $f: M \to N$，

$$\frac{1}{2} \Delta \|df\|^2 = \|\nabla df\|^2 + \sum_i \langle df(\operatorname{Ric}^M(e_i)), df(e_i) \rangle - \sum_{i,j} \langle R^N(df(e_i), df(e_j))df(e_j), df(e_i) \rangle$$

当 $M$ 的 Ricci 曲率非负且 $N$ 的截面曲率非正时，$\|df\|^2$ 是下调和的，从而调和映射的能量极小。

### 183.3 调和映射的存在性与障碍

**定理 183.3**（Sacks-Uhlenbeck 定理，1981）：设 $M$ 是紧 Riemann 面，$\pi_2(N) = 0$。则任何连续映射 $f: M \to N$ 同伦于一个能量极小调和映射。

*方法*：引入 $\alpha$-能量 $E_\alpha(f) = \int_M (1 + \|df\|^2)^\alpha \, dV$（$\alpha > 1$），通过 $\alpha \to 1$ 的极限获得调和映射。这种方法克服了 Sobolev 嵌入 $W^{1,2} \not\subset L^\infty$ 的困难。

**定理 183.4**（Siu 刚性定理，1980）：紧 Kähler 流形之间的调和映射在适当的曲率条件下必为全纯或反全纯的。这是强刚性定理的几何分析证明。

---

---

---

## 第365章：Ricci 流
Ricci 流是 Ricci 曲率驱动的几何演化方程，由 Hamilton 在 1982 年引入，Perelman 在 2002-2003 年用它证明了 Poincaré 猜想和 Thurston 几何化猜想。

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

**定理 184.2**（Hamilton 的 3 维正 Ricci 曲率定理，1982）：设 $M^3$ 是紧 3 维流形，初始度量具有正 Ricci 曲率。则 Ricci 流（经归一化）收敛到常正截面曲率度量。因此 $M^3$ 微分同胚于球面空间形式 $S^3 / \Gamma$。

*意义*：这是 Hamilton 开创 Ricci 流的动因——证明 3 维 Poincaré 猜想在正 Ricci 曲率下的特例。Hamilton 获 2011 年 Shaw 奖。

**定理 184.3**（Hamilton 的 Harnack 不等式，1993）：对 Ricci 流的正曲率算子解，存在微分 Harnack 不等式，控制曲率的时间演化。

**定理 184.4**（Hamilton 的紧致性定理）：Ricci 流解序列在一定的曲率、直径和内射半径有界条件下，具有光滑收敛的子序列。

### 184.3 Perelman 的工作与 Poincaré 猜想

**定理 184.5**（Perelman 的 $\mathcal{F}$-泛函与 $\mathcal{W}$-泛函，2002）：Perelman 引入两个关键泛函：

$$\mathcal{F}(g, f) = \int_M (R + |\nabla f|^2) e^{-f} \, dV$$

$$\mathcal{W}(g, f, \tau) = \int_M [\tau(R + |\nabla f|^2) + f - n] (4\pi\tau)^{-n/2} e^{-f} \, dV$$

$\mathcal{F}$ 沿 Ricci 流（与共轭热方程耦合）单调不减。$\mathcal{W}$ 沿 Ricci 流（与 $\tau$ 的适当演化耦合）单调不减。这给出了 Ricci 流的不变量。

**定理 184.6**（非塌缩定理）：Perelman 证明在 Ricci 流下，曲率有界的区域体积非塌缩（内射半径有下界）。这排除了 Cheeger-Gromov 意义下的"塌缩"现象。

**定理 184.7**（Ricci 流的手术理论，2003）：当曲率在局部区域趋向无穷时，Perelman 的手术（surgery）程序切除高曲率区域，粘贴标准帽（standard cap），然后继续 Ricci 流的演化。手术次数有限。

**定理 184.8**（Poincaré 猜想，Perelman 2002-2003）：任何单连通闭 3 维流形同胚于 $S^3$。

*证明概要*：任取 $M^3$ 上的初始度量，运行 Ricci 流（带手术）。Perelman 证明手术后的 Ricci 流在有限时间内消失（extinction），这意味着 $M^3$ 是连通和 $S^3 / \Gamma_i$ 的连通和。由基本群条件，$M^3 \cong S^3$。∎

**定理 184.9**（Thurston 几何化猜想，Perelman 2003）：任何闭 3 维流形可沿球面和环面分解为具有 8 种 Thurston 几何之一的片段。

*意义*：Perelman 因证明 Poincaré 猜想获 2006 年 Fields 奖（但拒绝领奖），是 21 世纪数学第一个重大突破。

### 184.4 Ricci 流在复几何中的应用

**定理 184.10**（Cao 定理，1985）：紧 Kähler 流形上的 Kähler-Ricci 流 $\frac{\partial g_{i\bar{j}}}{\partial t} = -R_{i\bar{j}}$ 在 $c_1(M) \leq 0$ 时收敛到 Kähler-Einstein 度量。

**定理 184.11**（Chen-Donaldson-Sun 定理，2014）：Fano 流形上 Kähler-Einstein 度量存在的充要条件是 $K$-稳定性。这是 Yau-Tian-Donaldson 猜想的证明，使用 Kähler-Ricci 流方法。

### 184.5 Cheeger-Gromoll 分裂定理

Cheeger-Gromoll 分裂定理是关于非负 Ricci 曲率完备 Riemann 流形结构的深刻结果，是 Ricci 流理论的几何背景之一。

**定理 184.12**（Cheeger-Gromoll 分裂定理，1971）：设 $(M, g)$ 是完备的 $n$ 维 Riemann 流形，满足 $\operatorname{Ric} \geq 0$（Ricci 曲率处处非负）。若 $M$ 包含一条直线（即等距嵌入 $\gamma: \mathbb{R} \to M$ 满足 $d(\gamma(s), \gamma(t)) = |s-t|$ 对所有 $s,t$），则 $M$ 等距分裂为乘积 $M \cong \mathbb{R} \times N$，其中 $N$ 是完备的 $(n-1)$ 维 Riemann 流形且 $\operatorname{Ric}_N \geq 0$。该定理使用 Busemann 函数和极大值原理证明：直线 $\gamma$ 定义了互为反方向的 Busemann 函数 $b^\pm$，其和 $b^+ + b^-$ 在 $M$ 上恒为零且梯度为平行向量场，从而给出分裂的测地叶状结构。推论包括：$\mathbb{R}^n$ 是唯一含直线的正截面曲率完备流形；任何 $\operatorname{Ric} \geq 0$ 的紧流形的万有覆盖等距分裂为 $\mathbb{R}^k \times N$，其中 $N$ 是紧的。

---

---

---

## 第366章：Yamabe 问题与共形几何
Yamabe 问题是在给定 Riemann 度量的共形类中寻找常标量曲率度量的问题。它的解决是几何分析的一大里程碑。

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

**定理 185.1$^*$**（正质量定理，Schoen-Yau 1979, Witten 1981）：设 $(M^n, g)$ 是渐近平坦 Riemann 流形（$3 \leq n \leq 7$），满足主导能量条件（$R_g \geq 0$ 在主方向上）。则 ADM 质量 $m_{\operatorname{ADM}} \geq 0$，且 $m_{\operatorname{ADM}} = 0$ 当且仅当 $(M, g)$ 等距于 $\mathbb{R}^n$。Schoen-Yau 使用极小曲面（面积泛函的第二变分）证明该定理，Witten 则通过 Dirac 算子的方法给出简洁的旋量证明。此定理是 Schoen 完成 Yamabe 问题证明的关键工具。

*证明思想*：当 Yamabe 不变量 $Y(g) < Y(S^n)$ 时，极小化序列的紧性成立（Sobolev 嵌入的临界指数困难通过 Aubin 的局部化方法克服）。Schoen 使用正质量定理证明 $Y(g) \leq Y(S^n)$ 且等号成立当且仅当 $(M, g)$ 共形等价于 $S^n$。∎

### 185.3 预定标量曲率

**定义 185.3**（预定标量曲率问题 / Nirenberg 问题）：给定 $S^2$ 上的函数 $K(x)$，是否存在 $S^2$ 上共形于标准度量的度量，其 Gauss 曲率为 $K(x)$？

**定理 185.2**（Kazdan-Warner 障碍，1974）：$S^2$ 上存在 Gauss 曲率 $K$ 的必要条件是：对任何一阶球谐函数 $\psi$，$\int_{S^2} \nabla K \cdot \nabla \psi \, dV = 0$。这给出了 $S^2$ 上预定 Gauss 曲率问题的拓扑障碍。

**定理 185.3**（Chang-Yang 解，1987）：$S^2$ 上的 Nirenberg 问题在 $K(x)$ 为正函数且满足某些非退化条件时解决。

---

---

---

## 第367章：几何 PDE 选讲
本章介绍几何分析中其他重要的几何 PDE：平均曲率流、Yang-Mills 方程和调和映射热流。

### 186.1 平均曲率流

**定义 186.1**（平均曲率流）：$n$ 维超曲面 $M_t \subset \mathbb{R}^{n+1}$ 的**平均曲率流**（MCF）为

$$\frac{\partial \mathbf{x}}{\partial t} = -H \mathbf{n}$$

其中 $\mathbf{x}$ 是位置向量，$H$ 是平均曲率，$\mathbf{n}$ 是单位法向量。MCF 是面积泛函的梯度流：$\frac{d}{dt} \operatorname{Area}(M_t) = -\int_{M_t} H^2 dV \leq 0$。

**定理 186.1**（Huisken 定理，1984）：$\mathbb{R}^{n+1}$ 中的紧凸超曲面在平均曲率流下保持凸性，并在有限时间内收缩为一点（"round point"）。经归一化后收敛到标准球面。

**定理 186.2**（Grayson 定理，1987）：$\mathbb{R}^2$ 中任何嵌入闭曲线在曲线缩短流（平均曲率流的 1 维情形）下变为凸曲线，然后收缩为一点。

**定理 186.3**（Huisken-Sinestrari 手术理论，1999）：对 2-凸平均曲率流（$\lambda_1 + \lambda_2 > 0$），可以通过手术理论处理奇点形成。

### 186.2 Yang-Mills 方程

**定义 186.2**（Yang-Mills 泛函）：设 $P \to M$ 是主 $G$-丛，$A$ 是联络。**Yang-Mills 泛函**为

$$\mathcal{YM}(A) = \int_M \|F_A\|^2 \, dV$$

其中 $F_A = dA + A \wedge A$ 是曲率 2-形式。**Yang-Mills 方程**是

$$D_A^* F_A = 0$$

（$D_A$ 是协变外微分）。Yang-Mills 联络是 Yang-Mills 泛函的临界点。

**定理 186.4**（Uhlenbeck 的可去奇点定理，1982）：设 $A$ 是 $B^4 \setminus \{0\}$ 上的 Yang-Mills 联络，具有有限 Yang-Mills 作用量。则 $A$ 可光滑延拓到整个 $B^4$。

**定理 186.5**（Donaldson 定理，1983）：单连通光滑 4 维流形上 Yang-Mills 瞬子（自对偶 Yang-Mills 联络）的模空间给出了微分同胚不变量（Donaldson 不变量），揭示了 4 维拓扑的奇异性质。

**定理 186.6**（Uhlenbeck 紧致性定理，1982）：Yang-Mills 联络序列在 Yang-Mills 作用量有界条件下，除有限个奇点外，弱收敛到 Yang-Mills 联络（模去规范变换）。

### 186.3 调和映射热流

**定义 186.3**（调和映射热流）：调和映射的热流方程为

$$\frac{\partial f_t}{\partial t} = \tau(f_t)$$

其中 $\tau(f_t)$ 是 $f_t$ 的张力场。这是能量泛函的梯度流。

**定理 186.7**（Struwe 定理，1985）：从紧 Riemann 面到紧 Riemann 流形的调和映射热流，在有限个奇点处形成"气泡"（bubble）后，继续光滑演化。全局弱解存在。

**定理 186.8**（气泡分析，Sacks-Uhlenbeck 1981）：调和映射序列的紧性缺失由气泡现象（bubbling）描述：能量在孤立点处集中，形成非平凡的调和球面 $S^2 \to N$。

---

---

---

## 第368章：Plateau 问题（变分视角）
Plateau问题源于十九世纪比利时物理学家Plateau的肥皂膜实验：给定空间中的闭曲线$\Gamma$，求以$\Gamma$为边界的极小曲面。数学表述为在$C^1$参数化$X: D \to \mathbb{R}^3$（$D$为单位圆盘）的约束$X(\partial D) = \Gamma$下，最小化面积泛函$\mathcal{A}[X] = \iint_D |X_u \times X_v| du dv$。Douglas（1931）和Radó（1930）独立地使用变分方法证明了任何可求长Jordan曲线$\Gamma$都存在以它为边界的极小曲面，并获得了1936年首届Fields奖。其核心步骤为：(i)将面积泛函转化为Dirichlet能量$\mathcal{E}[X] = \frac{1}{2}\iint_D (|X_u|^2 + |X_v|^2) du dv$（极值下两者等价）；(ii)在Sobolev空间$H^1(D, \mathbb{R}^3)$中极小化，利用下半连续性和紧性得到弱解；(iii)证明弱解的光滑性。几何测度论将Plateau问题推广为：求整流传（integer multiplicity current）$T$使得$\partial T = \Gamma$且质量$\mathbf{M}(T)$极小，Federer-Fleming的闭包定理和紧性定理为此提供了严格的框架。

---

---

---

## 第369章：谱几何
谱几何研究 Riemann 流形上 Laplace 算子的特征值谱与流形几何之间的深刻关系。"能否听到鼓的形状？"（Kac, 1966）是谱几何的核心问题：流形的 Laplace 谱在多大程度上决定了流形的几何（和拓扑）？

### 188.1 Laplace算子与热核

**定义 188.1**（Laplace-Beltrami 算子）：紧 Riemann 流形 $(M, g)$ 上的 **Laplace-Beltrami 算子** $\Delta_g = -\operatorname{div} \circ \nabla = -g^{ij} \nabla_i \nabla_j$ 是 $L^2(M)$ 上的正定自伴椭圆算子。其谱 $\{0 = \lambda_0 < \lambda_1 \leq \lambda_2 \leq \cdots\}$ 是离散的，每个特征值的重数有限，且特征函数构成 $L^2(M)$ 的标准正交基。

**定义 188.2**（热核）：热方程 $\partial_t u + \Delta_g u = 0$ 的基本解 $K(t, x, y)$（热核）的迹给出了谱函数：
$$\operatorname{Tr}(e^{-t\Delta_g}) = \sum_{j=0}^{\infty} e^{-t\lambda_j} = \int_M K(t, x, x) dV_g$$

**定理 188.1**（热核渐近展开，Minakshisundaram-Pleijel 1949）：当 $t \to 0^+$，热核有以下渐近展开：
$$K(t, x, x) \sim \frac{1}{(4\pi t)^{n/2}} \sum_{k=0}^{\infty} a_k(x) t^k$$
其中 $a_k(x)$ 是局部 Riemann 不变量（曲率及其协变导数的多项式）。前几项为：$a_0(x) = 1$，$a_1(x) = \frac{1}{6} R(x)$（标量曲率），$a_2(x) = \frac{1}{360}(12\Delta R + 5R^2 - 2|\operatorname{Ric}|^2 + 2|Rm|^2)$。

**推论 188.1**（谱不变量）：迹 $\operatorname{Tr}(e^{-t\Delta_g})$ 的渐近展开系数是谱不变量。积分 $\int_M a_k(x) dV_g$ 由谱完全确定。特别地：
- $\operatorname{Vol}(M)$ 由谱确定（Weyl 渐近律）
- $\int_M R dV_g$（总标量曲率）由谱确定（对曲面，即 Gauss-Bonnet 定理的 Euler 示性数）

**定理 188.2**（Weyl 渐近律，1911）：特征值的计数函数 $N(\lambda) = \#\{j : \lambda_j \leq \lambda\}$ 满足
$$N(\lambda) \sim \frac{\omega_n \operatorname{Vol}(M)}{(2\pi)^n} \lambda^{n/2} \quad (\lambda \to \infty)$$
其中 $\omega_n$ 是 $\mathbb{R}^n$ 中单位球的体积。Weyl 律表明流形的体积是谱不变量，且特征值的渐近增长率仅依赖于维数和体积。

### 188.2 等谱问题与反谱问题

**定理 188.3**（等谱非等距的流形，Gordon-Webb-Wolpert 1992）：存在一对 2 维平坦环面（16 维环面的商），它们是等谱的（所有特征值相同）但不等距——从而对 Kac 的"能否听到鼓的形状"给出了否定答案。构造使用了数论中的 Sunada 方法（群论等谱判据）。

**定理 188.4**（Tanno 定理，1974）：球面 $S^n$ 是唯一满足 $\lambda_1 = n$（即 $\lambda_1$ 达到 Lichnerowicz-Obata 上界）的紧 Riemann 流形。特征值的极值性质可用于刻画标准几何。

**猜想 188.1**（Bérard-Besson-Gallot 刚性猜想）：某些谱数据（如热核迹的前几个系数和 $\lambda_1$ 的极值性质）在适当曲率条件下可以唯一确定流形的等距类。谱刚性（spectral rigidity）是谱几何的核心研究方向。

### 188.3 特征值估计

**定理 188.5**（Lichnerowicz 定理，1958）：设 $(M^n, g)$ 是紧 Riemann 流形，满足 $\operatorname{Ric} \geq (n-1)K > 0$（Ricci 曲率有正下界）。则第一个非零特征值满足
$$\lambda_1 \geq nK$$
$S^n$ 上 $\lambda_1 = n$（当 $K=1$）达到等号（Obata 1962 证明仅有球面达到）。

**定理 188.6**（Cheeger 不等式，1970）：设 $h(M) = \inf_{A} \frac{\operatorname{Area}(\partial A)}{\min(\operatorname{Vol}(A), \operatorname{Vol}(M \setminus A))}$ 是 Cheeger 等周常数。则
$$\lambda_1 \geq \frac{h(M)^2}{4}$$
这个不等式将几何量（等周常数）与分析量（第一特征值）联系起来，是谱几何中最基本的不等式之一。

**定理 188.7**（Zhong-Yang 和 Hang-Wang 的特征值比较，1984）：对 $\operatorname{Ric} \geq (n-1)K$ 的紧 $n$ 维流形，$\lambda_1 \leq \bar{\lambda}_1(K, d)$，其中 $\bar{\lambda}_1$ 是相同 Ricci 下界和直径上界的模型空间（空间形式）的 $\lambda_1$。这说明 $\lambda_1$ 的上界由曲率和直径控制。

**定理 188.8**（谱 $\zeta$ 函数与行列式）：**谱 $\zeta$ 函数** $\zeta_\Delta(s) = \sum_{j=1}^\infty \lambda_j^{-s}$ 在 $\Re(s) > n/2$ 收敛，可亚纯延拓到整个复平面（在 $s=0$ 处正则）。**行列式** $\det \Delta$ 由 $\zeta_\Delta'(0)$ 定义（经 $\zeta$ 正则化）。行列式是重要的谱不变量，与 Ray-Singer 解析挠率（analytic torsion）等价（Cheeger-Müller 定理）。

---

---

---

## 第370章：等周不等式与几何不等式
等周不等式是几何学中最古老的不等式之一——给定固定体积（面积），最小表面积（周长）由球面（圆）达到。本章从经典等周不等式出发，推广到 Riemann 流形上的 Lévy-Gromov 等不等式和 Brunn-Minkowski 理论。

### 189.1 经典等周不等式

**定理 189.1**（$\mathbb{R}^n$ 中的等周不等式）：设 $\Omega \subset \mathbb{R}^n$ 是有界域，具有光滑边界（或有限周长）。则
$$\frac{\operatorname{Vol}(\partial \Omega)}{\operatorname{Vol}(\Omega)^{(n-1)/n}} \geq \frac{\operatorname{Vol}(S^{n-1})}{\operatorname{Vol}(B^n)^{(n-1)/n}} = n \omega_n^{1/n}$$
其中 $\omega_n$ 是 $\mathbb{R}^n$ 中单位球的体积，等号成立当且仅当 $\Omega$ 是球。

**推论 189.1**（等周不等式的最优常数与 Sobolev 不等式）：等周不等式等价于嵌入 $BV(\mathbb{R}^n) \hookrightarrow L^{n/(n-1)}(\mathbb{R}^n)$ 的 Sobolev 不等式（等周型 Sobolev 不等式）。事实上，面积与体积的极小化问题通过余面积公式与函数的 $L^1$ 梯度范数关联。

### 189.2 曲率与等周不等式

**定理 189.2**（Lévy-Gromov 等周不等式，Gromov 1980（推广 Lévy 1951 的结果））：设 $(M^n, g)$ 是紧 Riemann 流形，$\operatorname{Ric} \geq (n-1)K > 0$。则 $M$ 满足与 Ricci 曲率为 $(n-1)K$ 的球面 $S^n$ 比较的等周不等式：
$$\frac{\operatorname{Area}(\partial \Omega)}{\operatorname{Vol}(M)} \geq \frac{\operatorname{Area}(\partial B)}{\operatorname{Vol}(S^n)}$$
其中 $B \subset S^n$ 是具有相同归一化体积的球冠，$\Omega \subset M$ 是充分光滑的区域。即正 Ricci 曲率下界使得流形的等周剖面被球面控制。

*证明概要*：核心工具是 Gromov 的等周测度比较。对任意 Borel 集 $A \subset M$，Minkowski 边界面积 $\operatorname{Area}^+(\partial A) = \lim_{\epsilon \to 0} \frac{\operatorname{Vol}(A_\epsilon) - \operatorname{Vol}(A)}{\epsilon}$ 满足关于 Bishop-Gromov 体积比较的微分不等式。将体积比转化为模型空间的对应量即得等周不等式的比较形式。

### 189.3 Brunn-Minkowski 不等式

**定理 189.3**（Brunn-Minkowski 不等式）：设 $A, B \subset \mathbb{R}^n$ 是紧集。则
$$\operatorname{Vol}(A + B)^{1/n} \geq \operatorname{Vol}(A)^{1/n} + \operatorname{Vol}(B)^{1/n}$$
其中 $A + B = \{a + b : a \in A, b \in B\}$ 是 Minkowski 和。等号成立当且仅当 $A$ 和 $B$ 是相似凸集（或 $A, B$ 之一是点）。

*证明思路*：当 $A, B$ 是坐标方体（boxes）时平凡成立。对一般情形，使用压缩映射 $\Phi_t(x) = (1-t)x_0 + t x$ 将 $A$ 收缩并结合几何测度论中 Brunn 的凹性原理。等号情形由等周不等式的最优性分析得到。

**推论 189.2**（等周不等式作为 Brunn-Minkowski 的极限）：取 $B = \epsilon B^n$（半径 $\epsilon$ 的小球），则 $\operatorname{Vol}(A + \epsilon B^n)^{1/n} \gtrsim \operatorname{Vol}(A)^{1/n} + \epsilon \omega_n^{1/n}$，令 $\epsilon \to 0$ 即得等周不等式（Minkowski 边界面积公式）。

**定理 189.4**（Prékopa-Leindler 不等式，函数形式的 Brunn-Minkowski）：设 $f, g, h: \mathbb{R}^n \to [0, \infty)$ 可测，满足 $h((1-t)x + ty) \geq f(x)^{1-t} g(y)^t$ 对所有 $x, y$。则
$$\int_{\mathbb{R}^n} h \geq \left(\int_{\mathbb{R}^n} f\right)^{1-t} \left(\int_{\mathbb{R}^n} g\right)^t$$
此函数形式蕴含 Brunn-Minkowski 不等式，且是证明 Borell-Brascamp-Lieb 浓度不等式的基本工具。

### 189.4 等周不等式在几何分析中的应用

**定理 189.5**（Bérard-Meyer 特征值比较，1982）：结合 Cheeger 不等式和 Lévy-Gromov 等周不等式，得到带 Ricci 曲率下界的流形 $\lambda_1$ 的显式下界估计。这推广了 Lichnerowicz 估计——允许通过等周剖面获得更精细的特征值信息。

**定理 189.6**（等周不等式与 Poincaré 不等式）：在 $\operatorname{Ric} \geq 0$ 的完备非紧流形上，等周不等式等价于 $L^1$-Poincaré 不等式 $\int |f - \bar{f}_B| \leq C r \int |\nabla f|$。这建立了等周剖面与流形的 Sobolev 不等式的等价关系。

**定理 189.7**（Milman 的推论，1988）：Lévy-Gromov 等周不等式隐含紧 Riemann 流形（$\operatorname{Ric} \geq (n-1)K > 0$）的 $1$-Lipschitz 函数满足 Gaussian 型浓度不等式（类似于球面）。这给出了球面上 Lévy 族的测度集中现象的 Riemann 推广。

---



---

---

---

## 第371章（补充）
> 分形几何（Fractal Geometry）由 Benoît Mandelbrot 在 1970 年代系统建立，研究处处不可微的、具有自相似结构的「粗糙」集合。几何测度论（Geometric Measure Theory）由 De Giorgi、Federer、Fleming 等人在 1960-1970 年代发展，使用测度论工具研究 $\mathbb{R}^n$ 中「广义曲面」的几何与拓扑性质，特别是 Plateau 问题（存在以给定曲线为边界的极小面积曲面）的严格数学解。两个领域都处理传统光滑微分几何无法描述的「奇异」几何对象，在现代分析、变分法和图像处理中有深刻应用。本卷在实分析（V9）、测度论（V9 Ch 65）和泛函分析（V14）的基础上，建立 Hausdorff 测度、分形维数、整流与电流、Plateau 问题和变分法的几何测度论基础。

---

---

---

## 第372章：Hausdorff 测度与分形维数
分形几何的核心概念是用非整数维数来度量集合的「粗糙度」。Hausdorff 测度和 Hausdorff 维数是最基本的工具。

### 247.1 Hausdorff 测度

**定义 247.1**（$s$-维 Hausdorff 测度）：对 $s \geq 0$ 和 $A \subset \mathbb{R}^n$，定义

$$\mathcal{H}^s(A) = \lim_{\delta \to 0} \mathcal{H}^s_\delta(A)$$

其中

$$\mathcal{H}^s_\delta(A) = \inf \left\{ \sum_{i=1}^\infty (\operatorname{diam} U_i)^s : A \subset \bigcup_i U_i,\ \operatorname{diam} U_i \leq \delta \right\}$$

$\mathcal{H}^s$ 是 $\mathbb{R}^n$ 上的外测度（实际上是 Borel 测度）。

**命题 247.1**（Hausdorff 测度的基本性质）：
- $\mathcal{H}^0$ 是计数测度
- $\mathcal{H}^n$ 在 $\mathbb{R}^n$ 上与 Lebesgue 测度相差常数因子：$\mathcal{H}^n = c_n \mathcal{L}^n$（$c_n$ 是 $n$ 维单位球的体积相关常数）
- 对 $s > n$，$\mathcal{H}^s(\mathbb{R}^n) = 0$
- 若 $f$ 是 Lipschitz 映射，则 $\mathcal{H}^s(f(A)) \leq (\operatorname{Lip}(f))^s \mathcal{H}^s(A)$

**定理 247.1**（Hausdorff 测度的行为）：函数 $s \mapsto \mathcal{H}^s(A)$ 在某个唯一的 $s_0$ 处从 $\infty$ 跳到 $0$。即在 $s < s_0$ 时 $\mathcal{H}^s(A) = \infty$，$s > s_0$ 时 $\mathcal{H}^s(A) = 0$（$\mathcal{H}^{s_0}(A)$ 可能为 $0$、正有限或无穷）。

*证明概要*（Hausdorff维数的基本性质）：设 $\mathcal{H}^t(A) < \infty$，对任意 $s > t$ 和 $\delta$-覆盖 $\{U_i\}$，$\sum (\operatorname{diam} U_i)^s \leq \delta^{s-t} \sum (\operatorname{diam} U_i)^t$，取 $\delta \to 0$ 得 $\mathcal{H}^s(A) = 0$。故 $\mathcal{H}^s$ 至多在一个临界值处从 $\infty$ 跳到 $0$。**可数稳定性**：$\mathcal{H}^s(\bigcup_n A_n) \leq \sum_n \mathcal{H}^s(A_n)$ 由测度的可数次可加性直接得到。**Lipschitz不变性**：$\mathcal{H}^s(f(A)) \leq (\operatorname{Lip}(f))^s \mathcal{H}^s(A)$，证：每个 $\delta$-覆盖 $\{U_i\}$ 在 $f$ 下变为 $\operatorname{Lip}(f)\delta$-覆盖 $\{f(U_i)\}$，取和即得。这些性质使得Hausdorff维数成为刻画分形粗糙度的最基本工具。∎

### 247.2 分形维数

**定义 247.2**（Hausdorff 维数）：集合 $A \subset \mathbb{R}^n$ 的**Hausdorff 维数**为

$$\dim_H A = \sup\{s \geq 0 : \mathcal{H}^s(A) = \infty\} = \inf\{s \geq 0 : \mathcal{H}^s(A) = 0\}$$

Hausdorff 维数可以是任意非负实数。

**定义 247.3**（盒维数 / Box-Counting Dimension）：设 $N_\delta(A)$ 是覆盖 $A$ 所需的直径为 $\delta$ 的集合的最少数目。**下盒维数**和**上盒维数**分别为

$$\underline{\dim}_B A = \liminf_{\delta \to 0} \frac{\log N_\delta(A)}{-\log \delta}, \quad \overline{\dim}_B A = \limsup_{\delta \to 0} \frac{\log N_\delta(A)}{-\log \delta}$$

若上下盒维数相等，则 $\dim_B A$ 是**盒维数**（也称 Minkowski 维数）。一般 $\dim_H A \leq \underline{\dim}_B A \leq \overline{\dim}_B A$。

**注 247.1**（Hausdorff 维数与盒维数的关系）：不等式 $\dim_H A \leq \underline{\dim}_B A$ 成立的原因是：盒维数使用固定大小的覆盖（所有覆盖集直径 $\leq \delta$），而 Hausdorff 维数允许任意尺寸的覆盖（各覆盖集直径可不同），故 Hausdorff 测度更"精细"，维数更低。严格不等式的典型例子：$\mathbb{Q} \cap [0,1]$ 作为可数集满足 $\dim_H = 0$，但因稠密性其盒维数 $\dim_B = 1$。另一个经典例子是 $\{1, 1/2, 1/3, \ldots\} \cup \{0\}$：$\dim_H = 0$ 但盒维数为 $1/2$。这些例子表明盒维数对"可数个点的极限密度"敏感，而 Hausdorff 维数对于可数集恒为零。对"好"的自相似分形（如 Cantor 集、Sierpiński 三角形），二者通常相等。

**例 247.1**（经典分形集的维数）：
- Cantor 三分集 $C$：$\dim_H C = \dim_B C = \frac{\log 2}{\log 3} \approx 0.631$
- Sierpiński 三角形：$\dim_H = \frac{\log 3}{\log 2} \approx 1.585$
- Koch 雪花曲线边界：$\dim_H = \frac{\log 4}{\log 3} \approx 1.262$
- Menger 海绵：$\dim_H = \frac{\log 20}{\log 3} \approx 2.727$

### 247.3 自相似集与迭代函数系

**定义 247.4**（迭代函数系 / IFS）：**迭代函数系**是一族收缩映射 $\{f_1, \ldots, f_m\}$（$f_i: \mathbb{R}^n \to \mathbb{R}^n$，$\operatorname{Lip}(f_i) < 1$）。IFS 的**吸引子**（或不变集）$K$ 是满足 $K = \bigcup_{i=1}^m f_i(K)$ 的唯一非空紧致集合。

**定理 247.2**（Hutchinson 定理，1981）：设 $\{f_i\}$ 是相似比为 $c_i$ 的相似压缩。若开集条件（OSC）成立（存在非空有界开集 $V$ 使得 $f_i(V) \subset V$ 且 $f_i(V)$ 两两不交），则吸引子的 Hausdorff 维数 $s$ 满足**Moran 方程**：

$$\sum_{i=1}^m c_i^s = 1$$

且 $0 < \mathcal{H}^s(K) < \infty$。

*证明概要*（Moran-Hutchinson公式）：设 $K$ 为IFS吸引子，则 $K = \bigcup_i f_i(K)$。由Hausdorff测度的性质：$\mathcal{H}^s(K) \leq \sum c_i^s \mathcal{H}^s(K)$。上界估计：对 $K$ 构造由压缩迭代生成的覆盖，使用开集条件保证覆盖不重叠，得 $\sum c_i^s \leq 1$，故维数不超过 Moran 方程的根。下界估计：利用开集 $V$ 上分布的质量（规范测度）和能量积分方法，证明 $\mathcal{H}^s(K) > 0$，从而 $\sum c_i^s \geq 1$。结合得 $s$ 满足 $\sum c_i^s = 1$。OSC确保压缩像不重叠，使得维数计算可分离为各压缩映射的贡献之和。∎

**例 247.2**（Moran 方程的应用）：
- Cantor 三分集：$m = 2$，$c_1 = c_2 = 1/3$，$2 \cdot (1/3)^s = 1 \Rightarrow s = \log_3 2$
- Sierpiński 三角形：$m = 3$，$c_i = 1/2$，$3 \cdot (1/2)^s = 1 \Rightarrow s = \log_2 3$

---

---

---

## 第373章：分形结构的自相似与多重分形
许多分形不能仅由一个维数完全描述——它们具有多层次的分形结构，需要**多重分形分析**（multifractal analysis）来刻画。

### 248.1 自仿射分形与随机分形

**定义 248.1**（自仿射分形 / Self-Affine Fractal）：由仿射压缩 $f_i(x) = A_i x + b_i$（$A_i$ 是收缩矩阵，各方向收缩比不同）组成的 IFS 的吸引子。与自相似分形不同，自仿射分形的不同方向有不同的伸缩行为。

**例 248.1**（分数 Brown 运动 / FBM）：Hurst 指数 $H \in (0, 1)$ 的分数 Brown 运动 $B_H(t)$ 是自仿射的：$B_H(ct)$ 与 $c^H B_H(t)$ 同分布。$B_H$ 的图的 Hausdorff 维数和盒维数为 $2 - H$。

**定义 248.2**（随机分形与 DLA）：**扩散限制聚集**（DLA / Diffusion-Limited Aggregation，Witten-Sander 1981）通过随机粒子沿 Brown 运动轨迹黏附生长的过程产生随机分形。DLA 团簇的维数约为 $1.71$（二维）。

### 248.2 多重分形分析

**定义 248.3**（多重分形谱 / Multifractal Spectrum）：对测度 $\mu$ 上的奇异性分析，定义局部 Hölder 指数 $\alpha(x) = \lim_{r \to 0} \frac{\log \mu(B(x, r))}{\log r}$。**多重分形谱** $f(\alpha)$ 是满足 $\alpha(x) = \alpha$ 的点的 Hausdorff 维数。

**定义 248.4**（Rényi 维数与配分函数）：定义配分函数 $Z_q(\delta) = \sum_i \mu(B_i)^q$（$B_i$ 是边长 $\delta$ 的网格覆盖）。广义维数 $D_q$ 满足 $Z_q(\delta) \sim \delta^{(q-1)D_q}$（$\delta \to 0$）。通过 Legendre 变换：$f(\alpha) = \inf_q (q \alpha - \tau(q))$，$\tau(q) = (q-1)D_q$。

**定理 248.1**（多重分形形式论 / Frisch-Parisi 猜想，1985）：在湍流和许多其他物理系统中，多重分形谱 $f(\alpha)$ 是 $\cap$ 形的，$f(\alpha)$ 的最大值为信息维数 $D_1$，$D_0$ 是测度支撑的盒维数。

### 248.3 渗流与分形

**定义 248.5**（渗流模型 / Percolation Model）：在二维网格上，每条边以概率 $p$ 被「打开」（可通行）。当 $p$ 超过临界概率 $p_c = 1/2$ 时，存在无穷大连通分量。

**定理 248.2**（渗流团簇的分形维数，Stanley 1977）：在 $p = p_c$ 时，渗流团簇是分形。二维临界渗流团簇的 Hausdorff 维数为 $91/48 \approx 1.896$。团簇的化学维数（沿团簇测量的最短路径距离）为 $d_{\min} \approx 1.13$。

---

---

---

## 第374章：整流与电流
几何测度论使用**整流**和**电流**（rectifiable sets and currents）的概念精密地研究奇异曲面和变分问题。

### 249.1 可整流集

**定义 249.1**（$k$-维可整流集 / Rectifiable Set）：Borel 集 $E \subset \mathbb{R}^n$ 是**可数 $\mathcal{H}^k$-可整流的**，如果存在可数多个 Lipschitz 映射 $f_i: \mathbb{R}^k \to \mathbb{R}^n$ 使得

$$\mathcal{H}^k\left(E \setminus \bigcup_i f_i(\mathbb{R}^k)\right) = 0$$

即可整流集几乎被 Lipschitz 参数化的 $k$ 维曲面覆盖。

**定理 249.1**（可整流集的结构定理）：$k$-维可整流集 $E$ 在 $\mathcal{H}^k$-几乎处处有 $k$ 维近似切空间 $\operatorname{Tan}^k(E, x)$。即对 $\mathcal{H}^k$-a.e. $x \in E$，

$$\lim_{r \to 0} \frac{\mathcal{H}^k(E \cap B(x, r))}{r^k} = 1$$

（在适当的旋转下，$E$ 的放大极限是一个 $k$ 维平面）。

**定义 249.2**（纯不可整流集 / Purely Unrectifiable Set）：Borel 集 $E$ 是**纯不可整流的**，如果对每个 $k$-维可整流集 $F$，$\mathcal{H}^k(E \cap F) = 0$。Besicovitch 证明了二维中存在纯一维不可整流集。

### 249.2 整系数整流链

**定义 249.3**（整系数 $k$-维整流链 / Integral Rectifiable $k$-Current）：**整系数 $k$-维整流链** $T$ 是分布意义下的 $k$-维「定向曲面」，由可整流的 $k$ 维集合 $E$、整数重数 $\theta: E \to \mathbb{Z}$ 和定向 $k$-向量 $\xi$ 组成，作为一般 $k$-形式 $\omega$ 上的线性泛函：

$$T(\omega) = \int_E \langle \omega(x), \xi(x) \rangle \theta(x) \, d\mathcal{H}^k(x)$$

**定义 249.4**（质量与边界 / Mass and Boundary）：整流链 $T$ 的**质量**为 $\mathbf{M}(T) = \int_E |\theta(x)| d\mathcal{H}^k(x)$。$T$ 的**边界** $\partial T$ 是对 $(k-1)$-形式 $\omega$ 定义的分布：$\partial T(\omega) = T(d\omega)$。

**定义 249.5**（整系数平坦链 / Integral Flat Chain）：整系数平坦链是整系数整流链和边界为整流链的整系数整流链之和的 $L^1_{\text{loc}}$ 极限。整系数平坦链空间对于变分法非常重要（适合取极限）。

### 249.3 等周不等式与 Sobolev 不等式

**定理 249.2**（De Giorgi 等周不等式，1958）：对任何 $n$ 维（$n \geq 2$）整系数整流链 $T$ 满足 $\partial T = 0$ 且紧支撑，存在 $n+1$ 维整系数整流链 $S$ 满足 $\partial S = T$ 且
$$\mathbf{M}(S)^{n/(n+1)} \leq C_n \mathbf{M}(T)$$
其中 $C_n$ 是仅依赖于 $n$ 的常数。

更精确的等周不等式的几何测度论版本是 Plateau 问题解的基础。

**定理 249.3**（Federer-Fleming 等周不等式）：对 $n$ 维整系数整流链 $T$ 满足 $\partial T = 0$ 且紧支撑，存在 $n+1$ 维整系数整流链 $S$ 满足 $\partial S = T$ 且

$$\mathbf{M}(S)^{n/(n+1)} \leq \gamma \mathbf{M}(T)$$

其中 $\gamma$ 是仅依赖于 $n$ 的常数。

**定理 249.4**（面积公式 / Area Formula）：设 $f: \mathbb{R}^m \to \mathbb{R}^n$ 是 Lipschitz 映射（$m \leq n$），则对任意 $\mathcal{L}^m$-可测集 $A \subset \mathbb{R}^m$，
$$\int_A J_m f(x) \, d\mathcal{L}^m(x) = \int_{\mathbb{R}^n} \mathcal{H}^0(A \cap f^{-1}(y)) \, d\mathcal{H}^m(y)$$
其中 $J_m f(x) = \sqrt{\det((Df(x))^T Df(x))}$ 是 $m$-维 Jacobian。

**定理 249.5**（余面积公式 / Coarea Formula）：设 $f: \mathbb{R}^n \to \mathbb{R}^m$ 是 Lipschitz 映射（$n \geq m$），则对任意 $\mathcal{L}^n$-可测集 $A \subset \mathbb{R}^n$，
$$\int_A J_m f(x) \, d\mathcal{L}^n(x) = \int_{\mathbb{R}^m} \mathcal{H}^{n-m}(A \cap f^{-1}(y)) \, d\mathcal{L}^m(y)$$

*证明概要*（面积/余面积公式）：面积公式的证明基于线性代数中的极分解：对线性映射 $L: \mathbb{R}^m \to \mathbb{R}^n$，Jac($L$) 是 $L$ 将 $m$-维体积放大的倍数。对Lipschitz映射，利用Rademacher定理（几乎处处可微），对仿射近似局部化。通过Vitali覆盖引理将整体积分分解为局部仿射贡献的和。余面积公式是面积公式在对偶维数情形下的推广：将 $f$ 的等高面的 $\mathcal{H}^{n-m}$ 测度关于水平集积分。核心工具是Fubini定理的几何版本——将空间分解为水平集。这两个公式是几何测度论中最核心的积分公式，推广了经典的变量替换公式。∎

---

---

---

## 第375章：Plateau 问题与极小曲面
Plateau 问题（求以给定闭曲线为边界的极小面积曲面）是变分法的古典问题。几何测度论用电流理论给出了第一个完全严格的解。

### 250.1 经典 Plateau 问题

**定义 250.1**（Plateau 问题 / 几何测度论形式）：给定 $\mathbb{R}^3$ 中的（可整流）闭曲线 $\Gamma$（一维整系数整流链满足 $\partial \Gamma = 0$）。求二维整系数整流链 $T$ 满足：
- $\partial T = \Gamma$（$T$ 以 $\Gamma$ 为边界）
- $\mathbf{M}(T) \leq \mathbf{M}(S)$（对所有满足 $\partial S = \Gamma$ 的 $S$）

**定理 250.1**（Douglas-Radó 解法，1931/1930）：任何 $\mathbb{R}^3$ 中的可整流 Jordan 曲线都张成某个极小面积曲面（参数化圆盘映射）。Douglas 因此获得首届 Fields 奖（1936）。

**定理 250.2**（Federer-Fleming 解法 / 几何测度论中的 Plateau 问题解，1960）：对任何一维整系数整流链 $\Gamma$ 满足 $\partial \Gamma = 0$ 且紧支撑，存在二维整系数整流链 $T$ 实现极小质量。

*证明思路*：取质量最小化序列 $\{T_i\}$。用等周不等式控制边界，用紧致性定理（Federer-Fleming 紧致性定理）提取子列收敛到整系数平坦链。由下半连续性（质量在平坦范数下是下半连续的），极限链是最小的。用正则性理论证明极限是整系数整流链。∎

### 250.2 极小曲面的正则性

**定理 250.3**（De Giorgi 正则性定理，1961）：质量最小化的二维整系数整流链 $T$ 在 $\mathbb{R}^n$ 中除了孤立奇点外是光滑解析曲面。在三维中，$T$ 是嵌入曲面（无奇点）。

**定理 250.4**（Allard 正则性定理，1972）：质量最小的整系数 $k$ 维整流链在 $\mathbb{R}^n$ 中具有解析的 Hausdorff 维数 $k$ 的支撑，除一个 $\mathcal{H}^{k-2}$ 维的闭奇异集外。

**定义 250.2**（奇异集的维数）：$k$ 维面积最小化整系数整流链的奇异集 $\operatorname{Sing}(T)$ 满足 $\dim_H \operatorname{Sing}(T) \leq k - 7$（对超曲面 $k = n-1$）。特别是，在 $\mathbb{R}^8$ 以下维数中无奇异点。

### 250.3 自由边界问题与毛细曲面

**定义 250.3**（自由边界 Plateau 问题）：极小曲面不仅张成给定曲线，还要与某固定曲面 $W$（如容器壁）以自由边界条件相交。极小曲面与 $W$ 沿边界以垂直角度相交。

**定理 250.5**（自由边界问题的存在性与正则性）：在适当的条件下，自由边界 Plateau 问题有质量最小化解，其在内部光滑，在自由边界处（除特定维数的奇异集）光滑。

**定义 250.4**（毛细曲面与 Gauss 自由能）：毛细曲面满足均值曲率与高度成比例的方程（Young-Laplace 方程）。Gauss 自由能泛函结合了面积和重力势能。

---

---

---

## 第376章：变分法的几何测度论
几何测度论为变分法中的许多经典问题提供了严格的数学基础，包括集合的边界变分（Caccioppoli 集）和具有奇异性的最小化子。

### 251.1 Caccioppoli 集与有限周长集

**定义 251.1**（有限周长集 / Caccioppoli 集）：Borel 集 $E \subset \mathbb{R}^n$ 是**有限周长集**（Caccioppoli 集），如果其特征函数 $\chi_E$ 是有界变差函数（$BV$），即分布导数 $D\chi_E$ 是有限 Radon 测度。周长定义为 $\operatorname{Per}(E) = \int |D\chi_E|$。

**定理 251.1**（De Giorgi 结构定理）：有限周长集 $E$ 的约化边界 $\partial^* E$ 是 $\mathcal{H}^{n-1}$-可整流的，且 $D\chi_E = \nu_E \mathcal{H}^{n-1} \llcorner \partial^* E$（$\nu_E$ 是广义外法向量）。即周长等于约化边界的 Hausdorff 面积。

**定理 251.2**（等周不等式的几何测度论证明）：$\operatorname{Per}(E) \geq n \omega_n^{1/n} (\mathcal{L}^n(E))^{1 - 1/n}$，等号成立当且仅当 $E$ 是球（模去零测集）。

### 251.2 $BV$ 函数与总变差

**定义 251.2**（有界变差函数 / $BV$ 函数）：$u \in L^1(\Omega)$ 属于 $BV(\Omega)$，如果其分布导数 $Du$ 是有限 Radon 测度。总变差为 $|Du|(\Omega)$。$BV$ 空间是 Sobolev 空间 $W^{1,1}$ 的自然推广（允许跳跃间断）。

**定理 251.3**（$BV$ 函数的紧致性 / $BV$ 紧嵌入定理）：若有界开集 $\Omega$ 具有 Lipschitz 边界且 $\{u_k\} \subset BV(\Omega)$ 满足 $\sup_k \|u_k\|_{BV} < \infty$，则存在子列在 $L^1(\Omega)$ 中强收敛到 $u \in BV(\Omega)$。

**定理 251.4**（$BV$ 函数的精细结构 / Federer-Vol'pert 定理）：$u \in BV(\Omega)$ 关于 $\mathcal{H}^{n-1}$-可整流的跳跃集 $J_u$ 具有近似极限和跳跃。$Du$ 可分解为绝对连续部分、跳跃部分和 Cantor 部分。

*证明概要*（Federer-Vol'pert分解）：$BV$函数 $u$ 的分布导数 $Du$ 是Radon测度，由Radon-Nikodym定理可分解为三部分：$Du = D^a u + D^j u + D^c u$。绝对连续部分 $D^a u = \nabla u \, d\mathcal{L}^n$（$\nabla u$ 是近似梯度）。跳跃部分 $D^j u = (u^+ - u^-) \nu_u \mathcal{H}^{n-1} \llcorner J_u$，其中 $J_u$ 是跳跃集（$\mathcal{H}^{n-1}$-可整流），$u^\pm$ 是沿法向 $\nu_u$ 的近似极限。Cantor部分 $D^c u$ 与 $\mathcal{L}^n$ 奇异且无原子（如Cantor函数的导数）。关键工具是Blaschke选择定理和Besicovitch覆盖引理，用于建立 $BV$ 函数的近似极限和跳跃的测度论结构。此定理完整刻画了 $BV$ 函数的不光滑性来源。∎

### 251.3 图像处理中的变分方法

**定义 251.3**（Mumford-Shah 泛函 / 图像分割，1989）：

$$E(u, K) = \int_{\Omega \setminus K} |\nabla u|^2 dx + \alpha \mathcal{H}^{n-1}(K) + \beta \int_{\Omega} (u - g)^2 dx$$

其中 $u$ 是分段光滑的分割，$K$ 是边界跳跃集，$g$ 是观测到的噪声图像。

**定义 251.4**（Rudin-Osher-Fatemi 模型 / 全变差去噪，1992）：

$$\min_u \left\{ \int_{\Omega} |Du| + \frac{\lambda}{2} \int_{\Omega} (u - g)^2 dx \right\}$$

全变差正则化保持图像边缘（不模糊跳跃），是现代图像处理的基石。

**定理 251.5**（ROF 模型的解的性质）：ROF 模型的解 $u$ 是 $g$ 的「全变差流」在尺度 $\lambda^{-1}$ 下的结果。大尺度结构被保留，小尺度振荡被滤除。

### 251.4 集中紧致性原理与 Gamma 收敛

**定义 251.5**（Gamma 收敛 / $\Gamma$-收敛，De Giorgi 1970s）：泛函序列 $F_n$ **$\Gamma$-收敛**到 $F$（$F_n \overset{\Gamma}{\to} F$），如果：
- **下界**：对任何 $x_n \to x$，$\liminf F_n(x_n) \geq F(x)$
- **上界**：对任何 $x$，存在收敛到 $x$ 的序列 $x_n$，使得 $\limsup F_n(x_n) \leq F(x)$

**定理 251.6**（$\Gamma$-收敛与最小化子的收敛）：若 $F_n \overset{\Gamma}{\to} F$ 且 $x_n$ 是 $F_n$ 的最小化子，则 $x_n$ 的每个聚点是 $F$ 的最小化子。

**定理 251.7**（Modica-Mortola 定理 / Allen-Cahn 泛函的 $\Gamma$-收敛）：Allen-Cahn 泛函

$$F_\varepsilon(u) = \int_{\Omega} \left( \frac{\varepsilon}{2} |\nabla u|^2 + \frac{1}{\varepsilon} W(u) \right) dx$$

（$W(u) = \frac{1}{4}(1-u^2)^2$ 是双井势）$\Gamma$-收敛到周长泛函 $\sigma \operatorname{Per}(\{u = 1\})$（模去常数），其中 $\sigma = \int_{-1}^1 \sqrt{2W(s)} ds$。

---

---

---

## 第377章（补充）
高维渐近凸几何（Asymptotic Convex Geometry / Local Theory of Banach Spaces）研究高维凸体在大维数极限下的渐近行为。它以 Dvoretzky 定理（1971）和 Milman 的浓度现象为核心，连接泛函分析、概率论和组合数学。Princeton Companion 将其列为独立数学分支。

### 252.1 Dvoretzky定理

**定理 252.1**（Dvoretzky定理，1971）：对任意 $\varepsilon > 0$ 和正整数 $k$，存在 $N = N(k, \varepsilon)$ 使得：对任意维数 $n \geq N$ 的 Banach 空间 $X$（赋予任意范数），存在 $X$ 的 $k$ 维子空间 $E$，其在 Banach-Mazur 距离 $d_{\mathrm{BM}}(E, \ell_2^k)$ 意义下是近似 Euclid 的：
$$d_{\mathrm{BM}}(E, \ell_2^k) \leq 1 + \varepsilon$$
其中 $d_{\mathrm{BM}}(X, Y) = \inf \{\|T\| \cdot \|T^{-1}\| : T: X \to Y \text{ 线性同构}\}$。

*意义*：Dvoretzky 定理声称：每个充分高维的 Banach 空间都包含任意维数的近似 Euclid 子空间——无论原空间的几何多么"非欧"（如 $\ell_\infty^n$ 的单位球是立方体，其中也包含近似球形的截面）。这是"高维凸体总有近似球截面"的深刻陈述。

**Milman的简短证明**（1971，5页）：核心工具是 Lévy 族的测度集中现象——球面 $S^{n-1}$ 上的 Haar 测度高度集中在赤道附近。用等周不等式和 Lipschitz 函数的浓度估计证明：任意高维凸体的 Minkowski 泛函在大部分方向上近似常数，从而存在高维近似 Euclid 截面。

### 252.2 John椭球与Banach-Mazur距离

**定义 252.1**（John椭球 / 最大体积内切椭球）：$\mathbb{R}^n$ 中凸体 $K$ 的 **John 椭球** $\mathcal{E}_{\max}(K)$ 是含于 $K$ 的具有最大体积的椭球（唯一）。若 $K$ 是中心对称的，则 $n^{-1/2} \mathcal{E}_{\max}(K) \subset K \subset \mathcal{E}_{\max}(K)$。

**定理 252.2**（John定理，1948）：对 $\mathbb{R}^n$ 中任意中心对称凸体 $K$，存在以原点为中心的椭球 $\mathcal{E}$ 满足
$$\mathcal{E} \subset K \subset \sqrt{n} \cdot \mathcal{E}$$
等价地，任何 $n$ 维 Banach 空间到 $\ell_2^n$ 的 Banach-Mazur 距离不超过 $\sqrt{n}$：$d_{\mathrm{BM}}(X, \ell_2^n) \leq \sqrt{n}$。这个上界是紧的（$\ell_\infty^n$ 达到 $\sqrt{n}$）。

**推论 252.1**（Banach-Mazur紧致性）：所有 $n$ 维 Banach 空间的等距类构成的 Banach-Mazur 紧致度量空间 $\mathcal{B}_n$ 的直径为 $O(\sqrt{n})$。

### 252.3 凸体的渐近浓度现象

**定理 252.3**（Milman的浓度现象，1971）：设 $\mu$ 是 $S^{n-1}$ 上的归一化 Haar 测度（旋转不变概率测度）。对任意 1-Lipschitz 函数 $f: S^{n-1} \to \mathbb{R}$（$|f(x) - f(y)| \leq \|x - y\|$），有
$$\mu\left(\{x : |f(x) - M_f| \geq t\}\right) \leq C e^{-c n t^2}$$
其中 $M_f$ 是 $f$ 的中位数（或均值），$C, c > 0$ 是万有常数。*注：高维球面上的 Lipschitz 函数高度集中在其中位数附近——偏离的测度指数衰减于维数。*

**定理 252.4**（Blaschke-Santaló不等式）：中心对称凸体 $K \subset \mathbb{R}^n$ 的极体 $K^\circ = \{y : \langle x, y \rangle \leq 1, \forall x \in K\}$ 满足
$$\operatorname{Vol}(K) \cdot \operatorname{Vol}(K^\circ) \leq \operatorname{Vol}(B_2^n)^2$$
其中 $B_2^n$ 是 Euclid 单位球。等号当且仅当 $K$ 是椭球（Santaló 1949，等价性由 Saint-Raymond 1981 证明）。

**定义 252.2**（Mahler猜想，1939）：对中心对称凸体 $K$，$\operatorname{Vol}(K) \cdot \operatorname{Vol}(K^\circ) \geq 4^n / n!$，且极值由立方体 $[-1, 1]^n$ 及其极体（$\ell_1^n$ 球 × 交叉多胞体）达到。该猜想刚被部分解决（Iriyeh-Shibata 2020, 3维情形）。

**定理 252.5**（等周不等式与 Brunn-Minkowski 的联系）：经典的 Brunn-Minkowski 不等式 $\operatorname{Vol}(A + B)^{1/n} \geq \operatorname{Vol}(A)^{1/n} + \operatorname{Vol}(B)^{1/n}$ 蕴含了 $\mathbb{R}^n$ 中的等周不等式和所有函数形式的 Borell-Brascamp-Lieb 不等式——这是测度集中的分析基础。

### 252.4 各向同性常数与切片问题

**定义 252.3**（各向同性凸体 / 各向同性常数）：凸体 $K \subset \mathbb{R}^n$（体积为 1）称为**各向同性**的，若其重心在原点且其惯性矩阵是对角的：$\int_K x_i x_j dx = L_K^2 \delta_{ij}$。参数 $L_K$ 是 $K$ 的**各向同性常数**。

**切片问题**（Bourgain的切片问题 / 超平面猜想，1986）：是否存在万有常数 $C > 0$，使得对任意 $n$ 和任意体积为 1 的中心对称凸体 $K \subset \mathbb{R}^n$，存在超平面截面 $K \cap H$ 的 $(n-1)$ 维体积至少为 $C$？等价于 $L_K \leq C$ 是否对所有各向同性凸体成立？该问题被 Klartag（2006）和 Chen（2021）证明 $L_K \leq C$（万有常数存在）——这是高维凸几何近年的重大突破。

**定理 252.6**（薄壳不等式 / Thin Shell，Klartag 2007）：各向同性凸体 $K$（体积 1）上的均匀测度集中在距原点约 $\sqrt{n} L_K$ 的薄球壳上。更精确地，$\operatorname{Var}_K(\|x\|) \leq C L_K^2$（方差不随维数增长）。

---

*本卷在实分析（V9）和泛函分析（V14）的基础上，系统建立了 Hausdorff 测度与分形维数、自相似与多重分形分析、整流与电流（Federer 理论）、Plateau 问题（Douglas 解与正则性）和几何测度论变分法（Caccioppoli 集、BV 函数、$\Gamma$-收敛）的理论体系。全书以分形几何的「无限精细结构」和几何测度论的「广义曲面」收尾，展示了数学处理非光滑几何对象的强大能力。共 5 章。*


*本卷建立了几何分析的核心框架：极小曲面（面积泛函、Plateau 问题、Bernstein 定理）是几何变分问题最经典的范例；调和映射（能量泛函、Eells-Sampson 定理、气泡分析）将调和函数推广到流形间的映射；Ricci 流（Hamilton 方程、Perelman 的非塌缩和手术理论、Poincaré 猜想的证明）是 21 世纪数学最伟大的成就之一；Yamabe 问题（共形几何、临界 Sobolev 指数、正质量定理）揭示了共形不变量的深层结构；平均曲率流和 Yang-Mills 方程将几何 PDE 的方法推广到更广泛的几何演化问题；补充部分将分形几何与几何测度论（Hausdorff 测度与维数、自相似与多重分形、整流与电流理论、Plateau 问题的测度论解、Caccioppoli 集与 BV 函数、Γ-收敛）纳入本卷框架。几何分析是当代数学最活跃的前沿领域之一。*


*卷三十五：几何分析终。*


*卷三十五：几何分析终。*
