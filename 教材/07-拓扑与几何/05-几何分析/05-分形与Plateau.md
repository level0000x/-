## 第214章：Plateau 问题与极小曲面
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

---

---
---

## 第215章：变分法的几何测度论
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

---

---
---

## 第216章（补充）
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


*卷三十五：几何分析终。*


*卷三十二：几何分析终。*