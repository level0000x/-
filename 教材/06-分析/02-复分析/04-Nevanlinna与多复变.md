## Ch 108 值分布理论（Nevanlinna 理论）

Nevanlinna理论由R. Nevanlinna于1925年创立，将Picard定理从定性陈述提升为精密的定量理论，是复分析中亚纯函数值分布的核心框架。

**定义108.1**（Poisson-Jensen公式与特征函数）：设$f$为$\mathbb{C}$上非常数亚纯函数。对$r > 0$，命$f$在$|z| \leq r$中的零点为$a_\mu$（计重数）、极点为$b_\nu$（计重数）。**Poisson-Jensen公式**给出
$$\log|f(z)| = \frac{1}{2\pi} \int_0^{2\pi} \log|f(re^{i\theta})| \frac{r^2 - |z|^2}{|re^{i\theta} - z|^2} d\theta - \sum_\mu \log\left|\frac{r(z - a_\mu)}{r^2 - \bar{a}_\mu z}\right| + \sum_\nu \log\left|\frac{r(z - b_\nu)}{r^2 - \bar{b}_\nu z}\right|$$

取$z = 0$，可得**Jensen公式**：$\log|f(0)| = \frac{1}{2\pi}\int_0^{2\pi} \log|f(re^{i\theta})| d\theta - \sum_{|a_\mu| < r} \log\frac{r}{|a_\mu|} + \sum_{|b_\nu| < r} \log\frac{r}{|b_\nu|}$。

定义**靠近函数**$m(r, f) = \frac{1}{2\pi} \int_0^{2\pi} \log^+ |f(re^{i\theta})| d\theta$（$\log^+ x = \max(\log x, 0)$），**计数函数**$N(r, f) = \int_0^r \frac{n(t, f) - n(0, f)}{t} dt + n(0, f) \log r$（$n(t, f)$为$f$在$|z| \leq t$中的极点数）。**Nevanlinna特征函数**定义为
$$T(r, f) = m(r, f) + N(r, f)$$
$T(r, f)$衡量$f$的整体增长率——有理函数时$T(r, f) = O(\log r)$，超越亚纯函数时$T(r, f)/\log r \to \infty$。

**定理108.1**（Nevanlinna第一基本定理）：对任意$a \in \mathbb{C} \cup \{\infty\}$，
$$T\left(r, \frac{1}{f-a}\right) = T(r, f) + O(1) \quad (r \to \infty)$$
即$m(r, a, f) + N(r, a, f) = T(r, f) + O(1)$，表明特征函数在Möbius变换下几乎不变。

**证明**：由Poisson-Jensen公式取$z = 0$，配合$\log^+$与$\log$的关系，将$\log|f(0) - a|$表为$m(r, 1/(f-a)) - N(r, 1/(f-a))$与有限的$f(0)$项之和。正负部分拆分即得$T(r, f - a) = T(r, f) + O(1)$，再由$T$的Möbius不变性完成。$\blacksquare$

**定理108.2**（Nevanlinna第二基本定理）：对互异的$a_1, \ldots, a_q \in \mathbb{C} \cup \{\infty\}$（$q \geq 2$），
$$\sum_{j=1}^q m(r, a_j, f) \leq 2T(r, f) - N_1(r) + S(r, f)$$
其中$N_1(r)$为$f$的分支点修正项（$f'$的零点计数，不计重数），$S(r, f) = O(\log r T(r, f))$为误差项（在$r \to \infty$除去一个有限线性测度集外成立）。等价形式：$(q-2) T(r, f) \leq \sum_{j=1}^q \overline{N}(r, a_j, f) + S(r, f)$（$\overline{N}$为不计重数的计数函数）。

**证明**：核心引理是对数导数的估计（Nevanlinna 1930 年代）：对于亚纯函数 $f$，
$$\int_0^{2\pi} \log^+ \left|\frac{f'(re^{i\theta})}{f(re^{i\theta})}\right| d\theta = o(T(r, f)) \quad (r \to \infty, \; r \notin E),$$
其中 $E$ 为有限线性测度集。选取互异值 $a_1, \ldots, a_q \in \mathbb{C} \cup \{\infty\}$。考虑辅助函数 $F = \prod_{j=1}^q (f - a_j)$（若某 $a_j = \infty$，则将其从乘积中略去）。由 Jensen 公式和第一基本定理，$m(r, F) = \sum_j m(r, a_j, f) + O(1)$。另一方面，导数 $F'/F = \sum_j f'/(f - a_j)$ 的逼近函数可由对数导数引理控制：$m(r, F'/F) = o(T(r, f))$。将 $F'/F$ 与各个 $f'/(f - a_j)$ 的逼近函数建立不等式关系，并利用 $m(r, f'/(f - a_j))$ 的上界，最终导出 $\sum_j m(r, a_j, f) \leq 2T(r, f) - N_1(r) + S(r, f)$。换用计数函数即得 $(q-2)T(r, f) \leq \sum_j \overline{N}(r, a_j, f) + S(r, f)$。$\blacksquare$

**推论108.3**（Picard小定理作为推论）：若整函数$f$避开两个有穷值，则第二基本定理给出$(2-2)T(r, f) \leq 0 + S(r, f)$，与$f$为超越整函数时$T(r, f)/\log r \to \infty$矛盾。因此$f$必为常数——Picard小定理得证。

---

## Ch 109 拟共形映射与Teichmüller空间
### 拟共形映射

拟共形映射是共形映射的自然推广，允许有界的角度畸变。其解析定义基于**Beltrami方程**：
$$f_{\bar{z}} = \mu(z) f_z$$
其中$\mu(z)$为**Beltrami系数**（复值可测函数），满足$\|\mu\|_\infty = \operatorname{ess\,sup} |\mu(z)| < 1$。当$\mu \equiv 0$时方程退化为Cauchy-Riemann方程；$\mu \neq 0$时$f$将无穷小圆映为椭圆，偏心率由$|\mu|$决定。拟共形映射的几何定义更为直观：一个同胚 $f$ 是 $K$-拟共形的（$K \geq 1$），如果它将无穷小圆映为偏心率不超过 $K$ 的椭圆。具体地，$f$ 在点 $z$ 处的**伸缩商**（dilatation）为 $D_f(z) = \frac{|f_z| + |f_{\bar{z}}|}{|f_z| - |f_{\bar{z}}|} = \frac{1 + |\mu(z)|}{1 - |\mu(z)|}$，而 $K = \|D_f\|_\infty$。$K = 1$ 时恢复共形映射。拟共形映射的基本性质包括：它们是几乎处处可微的、绝对连续的（在 ACL 意义下）、且满足 Beltrami 方程几乎处处。在几何上，拟共形映射将测度零集映为测度零集（Lusin 性质），且是 Hölder 连续的（指数为 $1/K$）。这一正则性理论是 Morrey（1938）和 Ahlfors（1954）发展的，其核心是 Calderón-Zygmund 型奇异积分估计在 Beltrami 方程中的应用。拟共形映射的复合和逆仍为拟共形映射，且在相差一个共形映射的意义下，拟共形映射由 Beltrami 系数唯一确定。核心结果**可测Riemann映射定理**（Morrey, 1938; Ahlfors-Bers, 1960）断言：对$\mathbb{C}$上任意$\|\mu\|_\infty < 1$的可测Beltrami系数$\mu$，存在唯一的拟共形同胚$f^\mu : \hat{\mathbb{C}} \to \hat{\mathbb{C}}$满足Beltrami方程且固定$0, 1, \infty$。该定理将经典 Riemann 映射定理推广到可测情形，是 Teichmüller 空间理论和复动力系统（如 Sullivan 的"无游荡域定理"）的基础。拟共形映射在偏微分方程中也有重要应用：平面椭圆型方程组的解可通过 Beltrami 方程转化为拟共形映射，从而利用拟共形映射的几何性质研究 PDE 的正则性。

### Teichmüller空间

**Teichmüller空间**$\mathcal{T}_g$是亏格$g$的紧Riemann面复结构的形变空间。对$g \geq 2$，$\mathcal{T}_g$是$3g-3$维复流形（实维$6g-6$）。其标准定义利用拟共形映射：取定标记Riemann面$S_g$，令
$$\mathcal{T}_g = \{(X, f) \mid f : S_g \to X \text{ 为拟共形同胚}\} / \sim$$
其中$(X, f) \sim (Y, g)$若$g \circ f^{-1} : X \to Y$同伦于共形映射。Teichmüller 空间的维数 $3g-3$ 源于 Riemann-Roch 定理：亏格 $g$ 的 Riemann 面上全纯二次微分的空间维数为 $3g-3$，而全纯二次微分恰为余切空间 $T_{[X]}^* \mathcal{T}_g$ 的元素。Teichmüller 度量（Teichmüller 距离）$d_T([X], [Y]) = \frac{1}{2} \inf \log K(f)$（$f$ 取遍 $X$ 到 $Y$ 的拟共形同胚，$K(f)$ 为 $f$ 的最大伸缩商）赋予 $\mathcal{T}_g$ 完备的 Finsler 度量结构。这一度量是 Kobayashi 度量的特例，反映了 $\mathcal{T}_g$ 作为复流形的内在双曲性。Bers 嵌入定理（1960）将 $\mathcal{T}_g$ 实现为 $\mathbb{C}^{3g-3}$ 中的有界域：通过将每个 Riemann 面 $X$ 的万有覆叠（即上半平面 $\mathbb{H}$）上的 Fuchs 群 $\Gamma_X$ 的 Bers 拟共形形变，可以将 $\mathcal{T}_g$ 单射入全纯二次微分的空间 $\mathcal{Q}(\Gamma_X) \cong \mathbb{C}^{3g-3}$。这一嵌入不仅是拓扑的，而且是全纯的，使得 $\mathcal{T}_g$ 上的复结构变得清晰可见。模空间$\mathcal{M}_g = \mathcal{T}_g / \mathrm{MCG}(S_g)$为$3g-3$维复轨道空间，其中 $\mathrm{MCG}(S_g)$ 是 $S_g$ 的映射类群（mapping class group）。$\mathcal{M}_g$ 不是紧致的，但其 Deligne-Mumford 紧化 $\overline{\mathcal{M}}_g$ 是一个射影代数簇，是现代代数几何中模空间理论的核心对象。Teichmüller 空间与 Thurston 的几何化猜想、复动力系统（如 Mandelbrot 集与 Teichmüller 空间的类比）、以及弦论中的模空间紧化问题有深刻联系。

---

## Ch 110：Siegel区域与对称域

Siegel区域理论是经典多复变函数论的核心部分。**Siegel上半空间**$\mathcal{H}_n = \{ Z \in \mathbb{C}^{n \times n} : Z^{\mathsf{T}} = Z, \; \operatorname{Im}(Z) \succ 0 \}$是$\operatorname{Sp}(2n,\mathbb{R})$的作用空间。一般**Siegel区域**为$\{ (z,w) \in \mathbb{C}^{m} \times \mathbb{C}^{n} : \operatorname{Im}(z) - F(w,w) \in \Omega \}$，其中$F$为Hermite形式，$\Omega \subset \mathbb{R}^m$为自对偶锥。Elie Cartan (1935)将不可约有界对称域分为四大类经典域和两个例外域（16维和27维）。Siegel模形式（$\operatorname{Sp}(2n,\mathbb{Z})$作用下变换的全纯函数）推广了经典椭圆模形式，在志村簇和弦论中有深刻应用。

---

## Ch 111：多复变函数论导引

多复变函数论研究$\mathbb{C}^n$（$n \geq 2$）上的全纯函数，与单复变有本质区别：孤立奇点可去、单位球与多圆柱不全纯等价。

### 全纯域与Hartogs延拓

**定义111.1**（全纯域）：开集$\Omega \subset \mathbb{C}^n$称为**全纯域**（Domain of Holomorphy），若存在$\Omega$上的全纯函数$f$，使得$f$不能全纯延拓到$\Omega$外任何点。即对任意点$p \in \partial\Omega$和任意邻域$U \ni p$，不存在$F \in \mathcal{O}(\Omega \cup U)$使$F|_\Omega = f$。

**定理111.1**（Hartogs延拓定理，1906）：设$n \geq 2$，$\Omega \subset \mathbb{C}^n$为开集，$K \subset \Omega$为紧子集使得$\Omega \setminus K$连通。则$\Omega \setminus K$上的任意全纯函数可唯一地全纯延拓到整个$\Omega$。特别地，$\mathbb{C}^n$的孤立奇点（$n \geq 2$）总是可去的。

**证明**：利用Cauchy积分公式在"管状"区域上构造延拓。设$f \in \mathcal{O}(\Omega \setminus K)$。取充分大的开球$B$使$K \subset B \subset\subset \Omega$，定义
$$\tilde{f}(z) = \frac{1}{2\pi i} \int_{|\zeta| = R} \frac{f(\zeta, z')}{\zeta - z_1} d\zeta$$
其中$z = (z_1, z')$且积分路径在$K$之外。由于$n \geq 2$，在复余一维的子簇上可绕过$K$选择积分围道。$\tilde{f}$在$B$上定义且全纯，且在$B \setminus K$上与$f$一致。由唯一性定理，$\tilde{f}$即为所求延拓。$\blacksquare$

**推论111.2**（孤立奇点可去）：对$n \geq 2$，若$f$在$B(0,R) \setminus \{0\}$上全纯，则$f$自动延拓为$B(0,R)$上的全纯函数。因此$\mathbb{C}^n$（$n \geq 2$）中不存在类似单变量的极点和本性奇点。

**定理111.1'**（Hartogs基本定理 — 全纯性的变量分离判别）：函数$f : \Omega \subset \mathbb{C}^n \to \mathbb{C}$全纯当且仅当$f$对每个变量单独全纯（无需连续性假设）。

**证明**：单独全纯推出局部有界性（Osgood引理配合Hartogs延拓），再由Cauchy积分公式对每个变量展开可得联合连续性，最终导出联合全纯性。$\blacksquare$

---

## Ch 112：多复变核心定理
### Stein流形与Cartan-Thullen定理

**定义112.1**（Stein流形）：复流形$X$为**Stein流形**若：(1) $X$为Hausdorff且第二可数；(2) 全纯函数分离点；(3) 全纯函数给出局部坐标；(4) $X$是全纯凸的——对任意紧集$K \subset X$，其全纯凸包$\hat{K} = \{x \in X : |f(x)| \leq \sup_K |f|, \forall f \in \mathcal{O}(X)\}$为紧。

**定理112.1**（Cartan-Thullen定理，1932）：对$\mathbb{C}^n$中的域$\Omega$，以下等价：
(i) $\Omega$是全纯域；
(ii) $\Omega$是全纯凸域：对任意紧集$K \subset \Omega$，其全纯凸包$\hat{K}_\Omega = \{z \in \Omega : |f(z)| \leq \sup_K |f|, \forall f \in \mathcal{O}(\Omega)\}$为$\Omega$中紧集且$\operatorname{dist}(\hat{K}_\Omega, \partial\Omega) = \operatorname{dist}(K, \partial\Omega)$；
(iii) $\Omega$是Stein流形；
(iv) $-\log \operatorname{dist}(z, \partial\Omega)$为多次调和函数（即$\Omega$是伪凸的）。

**证明**：(i) $\Rightarrow$ (ii)：若$\Omega$为全纯域，设$f$不能延拓过$\partial\Omega$，其极点集迫使全纯凸包远离边界。(ii) $\Rightarrow$ (iii)：全纯凸性配合全纯函数分离点的性质（通过构造适当全纯函数证明）。(iii) $\Rightarrow$ (i)：Stein流形上存在不可延拓的全纯函数可由Cousin问题解的存在性保证。(iii) $\Leftrightarrow$ (iv)：这是Oka (1942) 对Levi问题的解答——伪凸性等价于全纯凸性等价于Stein性。$\blacksquare$

**定理112.2**（Oka-Weil逼近定理）：若$X$为Stein流形，$K \subset X$为全纯凸紧集，则$K$某邻域上的任意全纯函数可由$X$上全纯函数一致逼近。

**证明**：利用Stein流形上的Cousin I问题解构造具指定极点的亚纯函数，再转化为全纯函数的逼近——核心是Runge型逼近在Stein流形上的推广。$\blacksquare$

### $\bar{\partial}$-问题与$L^2$估计

**定义112.2**（$\bar{\partial}$-问题）：设$\Omega \subset \mathbb{C}^n$为开集，$f$为$(0,1)$-形式（即$f = \sum_{j=1}^n f_j d\bar{z}_j$）满足可积条件$\bar{\partial} f = 0$（即$\partial f_j / \partial \bar{z}_k = \partial f_k / \partial \bar{z}_j$）。$\bar{\partial}$-问题是求函数$u$使
$$\bar{\partial} u = f, \quad \text{即} \quad \frac{\partial u}{\partial \bar{z}_j} = f_j \quad (j = 1,\dots,n)$$
这是多复变理论的核心技术问题——其可解性等价于域的伪凸性。

**定理112.3**（Hörmander $L^2$估计，1965）：设$\Omega \subset \mathbb{C}^n$为伪凸域（即存在光滑严格多次调和穷竭函数），$\varphi \in C^2(\Omega)$为多次调和函数。则对任意满足$\bar{\partial}f = 0$的$(0,1)$-形式$f$，存在$u$满足$\bar{\partial} u = f$且
$$\int_\Omega |u|^2 e^{-\varphi} dV \leq \int_\Omega \sum_{j,k} \varphi^{j\bar{k}} f_j \overline{f_k} e^{-\varphi} dV$$
其中$\varphi^{j\bar{k}}$为复Hessian矩阵$(\partial^2\varphi/\partial z_j \partial \bar{z}_k)$的逆。特别地，取$\varphi = 0$在$\mathbb{C}^n$的有界伪凸域上，得$\|u\|_{L^2} \leq C(\Omega) \|f\|_{L^2}$。

**证明**：核心为加权$L^2$空间上的$\bar{\partial}$-Neumann算子的Hörmander-Morrey估计。对于光滑$\varphi$，定义Hilbert空间$L^2(\Omega, e^{-\varphi})$中的闭稠定算子$\bar{\partial}$，形式伴随$T^*$，对任意$C_c^\infty$函数$u$成立Morrey-Kohn恒等式
$$\|\bar{\partial}u\|^2 + \|\bar{\partial}^*_\varphi u\|^2 = \sum_{j,k} \int_\Omega \frac{\partial^2\varphi}{\partial z_j \partial \bar{z}_k} u_j \overline{u_k} e^{-\varphi} + \sum_{j,k} \int_\Omega \left|\frac{\partial u_j}{\partial \bar{z}_k}\right|^2 e^{-\varphi}$$
其中$\bar{\partial}^*_\varphi$为加权的形式伴随。当$\varphi$为多次调和时漏掉部分非负，得$\|\bar{\partial}^*_\varphi u\|^2 \geq \sum\int \varphi_{j\bar{k}} u_j \overline{u_k} e^{-\varphi}$。通过Hahn-Banach与Riesz表示定理将不等式转化为满射性，即$\bar{\partial}$的像包含$\ker\bar{\partial}$的正交补，故对$\bar{\partial}$-闭形式$f$方程可解。$\blacksquare$

**定理112.4**（$\bar{\partial}$-Neumann问题的正则性）：在伪凸域$\Omega$上，若$f$光滑且满足$\bar{\partial}f = 0$，则规范解$u = \bar{\partial}^* N f$（$N$为$\bar{\partial}$-Neumann算子）是光滑的，且与$\Omega$边界性质相容。特别地，在强伪凸域上，$\bar{\partial}$-Neumann算子为紧算子，$\bar{\partial}$-问题具有最优的正则性估计。

**证明**：基于$\bar{\partial}$-Neumann算子的椭圆正则性理论（Kohn, 1963-1964）。在强伪凸边界条件下，$\Box = \bar{\partial}\bar{\partial}^* + \bar{\partial}^*\bar{\partial}$为次椭圆算子，满足$1/2$阶Garding型估计，其逆$N$将Sobolev空间$H^s$映射到$H^{s+1}$（在$\Omega$内部增益$2$阶，在边界处增益$1$阶）。$\blacksquare$

---
*Nevanlinna理论以Poisson-Jensen公式为出发点，经特征函数与两个基本定理揭示了亚纯函数值分布的深层结构。多复变方面，Hartogs延拓定理彰显了$n \geq 2$时全纯函数的刚性——全纯域的概念由此自然引入。Cartan-Thullen定理建立了全纯域-全纯凸-Stein流形-伪凸域的四重等价。$\bar{\partial}$-问题及其$L^2$估计（Hörmander）则为多复变正则性理论提供了核心技术工具。*

*卷十：复分析终。*
