## 第205章：Ricci 流
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

*证明概要*：运行带手术的 Ricci 流。Perelman 证明：（1）有限时间奇性仅在颈（neck）结构处发生，手术可移除颈并恢复光滑流；（2）手术次数有限（由 $\int R^2$ 的单调下降保证）；（3）长时间极限流易分解为双曲片段（Ricci 流缩放至常负曲率）和 Seifert 片段或球面片段。结合 JSJ 分解的拓扑刚性和 Mostow 刚性完成。$\blacksquare$

### 184.4 Ricci 流在复几何中的应用

**定理 184.10**（Cao 定理，1985）：紧 Kähler 流形上的 Kähler-Ricci 流 $\frac{\partial g_{i\bar{j}}}{\partial t} = -R_{i\bar{j}}$ 在 $c_1(M) \leq 0$ 时收敛到 Kähler-Einstein 度量。

*证明概要*：Kähler-Ricci 流在 Kähler 类内演化为 $\frac{\partial}{\partial t} \omega_t = -\operatorname{Ric}(\omega_t)$。若 $c_1(M)=0$，此为 Yau 的定理（Ricci 平坦度量）。若 $c_1(M)<0$，演化为 $\frac{\partial}{\partial t} \omega_t = -\operatorname{Ric}(\omega_t) - \omega_t$，通过 Aubin-Yau 连续性方法的抛物化得到指数收敛到唯一的 Kähler-Einstein 度量（$\operatorname{Ric} = -\omega$）。$\blacksquare$

**定理 184.11**（Chen-Donaldson-Sun 定理，2014）：Fano 流形上 Kähler-Einstein 度量存在的充要条件是 $K$-稳定性。这是 Yau-Tian-Donaldson 猜想的证明，使用 Kähler-Ricci 流方法。

*证明概要*：必要性由 Tian 和 Donaldson 证明（若 KE 度量存在则 $K$-稳定）。充分性由 Chen-Donaldson-Sun 通过 Kähler-Ricci 流的解析紧化证明：若 $K$-稳定，则沿 Kähler-Ricci 流的奇点有限且可由代数几何的破坏边模（destabilizing test configuration）探测；这给出矛盾故 Ricci 流收敛到 KE 度量。$\blacksquare$

### 184.5 Cheeger-Gromoll 分裂定理

Cheeger-Gromoll 分裂定理是关于非负 Ricci 曲率完备 Riemann 流形结构的深刻结果，是 Ricci 流理论的几何背景之一。

**定理 184.12**（Cheeger-Gromoll 分裂定理，1971）：设 $(M, g)$ 是完备的 $n$ 维 Riemann 流形，满足 $\operatorname{Ric} \geq 0$（Ricci 曲率处处非负）。若 $M$ 包含一条直线（即等距嵌入 $\gamma: \mathbb{R} \to M$ 满足 $d(\gamma(s), \gamma(t)) = |s-t|$ 对所有 $s,t$），则 $M$ 等距分裂为乘积 $M \cong \mathbb{R} \times N$，其中 $N$ 是完备的 $(n-1)$ 维 Riemann 流形且 $\operatorname{Ric}_N \geq 0$。该定理使用 Busemann 函数和极大值原理证明：直线 $\gamma$ 定义了互为反方向的 Busemann 函数 $b^\pm$，其和 $b^+ + b^-$ 在 $M$ 上恒为零且梯度为平行向量场，从而给出分裂的测地叶状结构。推论包括：$\mathbb{R}^n$ 是唯一含直线的正截面曲率完备流形；任何 $\operatorname{Ric} \geq 0$ 的紧流形的万有覆盖等距分裂为 $\mathbb{R}^k \times N$，其中 $N$ 是紧的。

---

---

---

---

---
---

## 第206章：Yamabe 问题与共形几何
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

---

---
---

## 第207章：几何 PDE 选讲
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

---

---