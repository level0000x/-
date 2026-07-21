## 第230章：Plateau 问题与极小曲面
Plateau 问题（求以给定闭曲线为边界的极小面积曲面）是变分法的古典问题。几何测度论用电流理论给出了第一个完全严格的解。

### 250.1 经典 Plateau 问题

**定义 250.1**（Plateau 问题 / 几何测度论形式）：给定 $\mathbb{R}^3$ 中的（可整流）闭曲线 $\Gamma$（一维整系数整流链满足 $\partial \Gamma = 0$）。求二维整系数整流链 $T$ 满足：
- $\partial T = \Gamma$（$T$ 以 $\Gamma$ 为边界）
- $\mathbf{M}(T) \leq \mathbf{M}(S)$（对所有满足 $\partial S = \Gamma$ 的 $S$）

**定理 250.1**（Douglas-Radó 解法，1931/1930）：任何 $\mathbb{R}^3$ 中的可整流 Jordan 曲线都张成某个极小面积曲面（参数化圆盘映射）。Douglas 因此获得首届 Fields 奖（1936）。

**证明**（Douglas 的能量极小化方法）：设 $\Gamma$ 为 $\mathbb{R}^3$ 中的 Jordan 曲线。考虑所有从单位圆盘 $D$ 到 $\mathbb{R}^3$ 的 Sobolev 映射 $u \in W^{1,2}(D, \mathbb{R}^3)$，满足 $u|_{\partial D}$ 为 $\partial D$ 到 $\Gamma$ 的单调参数化。定义 Dirichlet 能量 $E(u) = \frac{1}{2} \int_D |\nabla u|^2$。由面积-能量不等式，$A(u) \leq E(u)$，等号当且仅当 $u$ 为共形映射。取能量极小化序列 $\{u_n\}$，由 Courant-Lebesgue 引理，$u_n$ 在 $\partial D$ 上等度连续。由 Banach-Alaoglu 定理和 Rellich-Kondrachov 紧嵌入，存在子列弱收敛到 $u \in W^{1,2}(D, \mathbb{R}^3)$，且 $u|_{\partial D}$ 为 $\Gamma$ 的连续参数化。由 Dirichlet 能量的弱下半连续性，$E(u) \leq \liminf E(u_n)$，故 $u$ 为能量极小元。由 Courant 的边界条件稳定性，$u$ 的参数化是单调的。最后，由共形不变性，可调整 $u$ 使其为共形映射，此时 $A(u) = E(u)$ 且 $u$ 为极小曲面。$\blacksquare$

**定理 250.2**（Federer-Fleming 解法 / 几何测度论中的 Plateau 问题解，1960）：对任何一维整系数整流链 $\Gamma$ 满足 $\partial \Gamma = 0$ 且紧支撑，存在二维整系数整流链 $T$ 实现极小质量。

**证明**：取质量最小化序列 $\{T_i\}$。用等周不等式控制边界，用紧致性定理（Federer-Fleming 紧致性定理）提取子列收敛到整系数平坦链。由下半连续性（质量在平坦范数下是下半连续的），极限链是最小的。用正则性理论证明极限是整系数整流链。∎

### 250.2 极小曲面的正则性

Douglas 和 Radó 的存在性定理保证了极小曲面作为某种变分问题的解总是存在的，但它们留下了一个关键问题：这些解在几何上到底有多"光滑"？De Giorgi 在 1961 年给出的正则性定理是几何测度论早期最辉煌的成就之一——它证明了质量最小化的整系数整流链在低余维情形中几乎处处光滑，奇点至多是孤立点。

**定理 250.3**（De Giorgi 正则性定理，1961）：质量最小化的二维整系数整流链 $T$ 在 $\mathbb{R}^n$ 中除了孤立奇点外是光滑解析曲面。在三维中，$T$ 是嵌入曲面（无奇点）。


**证明**：设 $T$ 为 $\mathbb{R}^n$ 中质量最小的 2 维整系数整流链。由 Morrey 的 Dirichlet 能量增长估计和 epiperimetric 不等式，$T$ 的支撑在 $\mathcal{H}^2$-几乎处处具有 $C^{1,\alpha}$ 正则性。De Giorgi 证明在 3 维中奇点完全消失：因 2 维最小曲面在 3 维中仅容许可去孤立奇点（由 Bernstein 型定理保证），而最小性迫使这些点正则。高维中奇集为孤立离散点，由 Schoen-Simon-Yau 的维数约化论证给出。$\blacksquare$

De Giorgi 的正则性理论聚焦于二维整流链（余维数为 1），而 Allard 在 1972 年将正则性理论推广到任意维数和余维数的情形，建立了以单调解（monotonicity）公式和 $\varepsilon$-正则性为核心的普适框架。这一推广使得极小曲面的正则性理论能够处理高维和高余维的几何变分问题。

**定理 250.4**（Allard 正则性定理，1972）：质量最小的整系数 $k$ 维整流链在 $\mathbb{R}^n$ 中具有解析的 Hausdorff 维数 $k$ 的支撑，除一个 $\mathcal{H}^{k-2}$ 维的闭奇异集外。

**定义 250.2**（奇异集的维数）：$k$ 维面积最小化整系数整流链的奇异集 $\operatorname{Sing}(T)$ 满足 $\dim_H \operatorname{Sing}(T) \leq k - 7$（对超曲面 $k = n-1$）。特别是，在 $\mathbb{R}^8$ 以下维数中无奇异点。


**证明**：设 $T$ 为 $k$ 维质量最小整系数整流链。Allard 的单调解（monotonicity）公式：质量比 $r^{-k}\mathbf{M}(T\llcorner B_r(x))$ 关于 $r$ 单调非减。该公式将切锥的存在性（Blow-up 极限）与 $T$ 的局部行为关联。Allard 的 $\varepsilon$-正则性定理：若某点处质量密度充分接近 $1$（或某平面密度），则该点正则。由此奇集为闭集且 Hausdorff 维数至多 $k-2$（如 $k=2$ 时奇集为 0 维）。解析性在正则点由标准的椭圆局部理论得出。$\blacksquare$

### 250.3 自由边界问题与毛细曲面

经典 Plateau 问题的边界是事先固定的闭曲线。然而在物理应用中（如液体与容器壁的接触），极小曲面的边界可以沿一个给定的支撑曲面"自由滑动"。这种自由边界条件在数学上引入了额外的复杂性——极小曲面与支撑曲面必须以垂直角度相交——但同时也催生了丰富的几何正则性理论。

**定义 250.3**（自由边界 Plateau 问题）：极小曲面不仅张成给定曲线，还要与某固定曲面 $W$（如容器壁）以自由边界条件相交。极小曲面与 $W$ 沿边界以垂直角度相交。

**定理 250.5**（自由边界问题的存在性与正则性）：在适当的条件下，自由边界 Plateau 问题有质量最小化解，其在内部光滑，在自由边界处（除特定维数的奇异集）光滑。

**定义 250.4**（毛细曲面与 Gauss 自由能）：毛细曲面满足均值曲率与高度成比例的方程（Young-Laplace 方程）。Gauss 自由能泛函结合了面积和重力势能。


**证明**：自由边界 Plateau 问题：在给定边界 $\Gamma$ 和自由曲面 $\Sigma$（沿某约束流形 $N$ 自由滑动）条件下寻找面积最小曲面。存在性由紧致性（整流链在质量有界条件下的闭性）和下半连续性（质量泛函的 $\Gamma$-收敛）保证。内部正则性由 Allard 定理给出。自由边界处的正则性需额外的反射原理：沿 $N$ 反射将自由边界曲面偶延拓为无约束最小曲面，应用内部正则性得边界光滑性。奇集分析类似固定边界情形但包含边界奇点（维数至多 $k-2$）。$\blacksquare$

---

---

---

---

---
---

## 第231章：变分法的几何测度论
几何测度论为变分法中的许多经典问题提供了严格的数学基础，包括集合的边界变分（Caccioppoli 集）和具有奇异性的最小化子。

### 251.1 Caccioppoli 集与有限周长集

经典变分法中极小曲面由光滑参数化定义，但在处理奇点和一般的存在性问题时，光滑范畴的局限性变得明显。De Giorgi 引入的 Caccioppoli 集（即有限周长集）是几何测度论对变分法最根本的贡献之一：它将集合的"边界面积"概念推广到仅需分布导数有意义的一般 Borel 集，而不要求边界的任何光滑性。

**定义 251.1**（有限周长集 / Caccioppoli 集）：Borel 集 $E \subset \mathbb{R}^n$ 是**有限周长集**（Caccioppoli 集），如果其特征函数 $\chi_E$ 是有界变差函数（$BV$），即分布导数 $D\chi_E$ 是有限 Radon 测度。周长定义为 $\operatorname{Per}(E) = \int |D\chi_E|$。

**定理 251.1**（De Giorgi 结构定理）：有限周长集 $E$ 的约化边界 $\partial^* E$ 是 $\mathcal{H}^{n-1}$-可整流的，且 $D\chi_E = \nu_E \mathcal{H}^{n-1} \llcorner \partial^* E$（$\nu_E$ 是广义外法向量）。即周长等于约化边界的 Hausdorff 面积。


**证明**：对有限周长集 $E$（$\chi_E\in BV(\mathbb{R}^n)$），分布导数 $D\chi_E$ 为 Radon 测度。约化边界 $\partial^*E$ 定义为具有外法向量的点集（即存在单位向量 $\nu_E(x)$ 使测度密度满足 $\lim_{r\to 0} D\chi_E(B_r(x))/|D\chi_E|(B_r(x))=\nu_E(x)$）。De Giorgi 证明 $\partial^*E$ 的 $\mathcal{H}^{n-1}$-可整流性由 blow-up 分析给出：在每个 $x\in\partial^*E$ 处 blow-up 极限为半空间（超平面），这等价于 $\partial^*E$ 具有 $\mathcal{H}^{n-1}$-a.e. 的 $n-1$ 维切空间。Gauss-Green 公式 $\int_E \operatorname{div}\varphi = \int_{\partial^*E} \varphi\cdot\nu_E d\mathcal{H}^{n-1}$ 成立。$\blacksquare$

**定理 251.2**（等周不等式的几何测度论证明）：$\operatorname{Per}(E) \geq n \omega_n^{1/n} (\mathcal{L}^n(E))^{1 - 1/n}$，等号成立当且仅当 $E$ 是球（模去零测集）。


**证明**：对有限周长集 $E$，周长 $\operatorname{Per}(E)=\mathcal{H}^{n-1}(\partial^*E)$。余面积公式用于距离函数：设 $u(x)=d(x,E^c)$（或光滑化 $u_\varepsilon\approx\chi_E$）。对 $BV$ 函数的 Sobolev 不等式（Gagliardo-Nirenberg）：$\|u\|_{L^{n/(n-1)}}\le c_n\|Du\|(\mathbb{R}^n)$。取 $u=\chi_E$，$\|\chi_E\|_{n/(n-1)}=|E|^{(n-1)/n}$，$\|D\chi_E\|=\operatorname{Per}(E)$，得 $|E|^{(n-1)/n}\le c_n\operatorname{Per}(E)$。$c_n=n^{-1}\omega_n^{-1/n}$ 由容斥球论证和 Brunn-Minkowski 不等式推导。等号仅当 $E$ 为球（由等周极值刚性定理）。$\blacksquare$

### 251.2 $BV$ 函数与总变差

Caccioppoli 集的理论建立在特征函数上，而 $BV$ 函数空间将这一框架从集合推广到一般函数。$BV$（有界变差）空间是 Sobolev 空间 $W^{1,1}$ 的最自然的推广——它允许函数具有跳跃间断，同时保留了足以进行变分分析的正则性结构（如紧嵌入和下半连续性）。

**定义 251.2**（有界变差函数 / $BV$ 函数）：$u \in L^1(\Omega)$ 属于 $BV(\Omega)$，如果其分布导数 $Du$ 是有限 Radon 测度。总变差为 $|Du|(\Omega)$。$BV$ 空间是 Sobolev 空间 $W^{1,1}$ 的自然推广（允许跳跃间断）。

**定理 251.3**（$BV$ 函数的紧致性 / $BV$ 紧嵌入定理）：若有界开集 $\Omega$ 具有 Lipschitz 边界且 $\{u_k\} \subset BV(\Omega)$ 满足 $\sup_k \|u_k\|_{BV} < \infty$，则存在子列在 $L^1(\Omega)$ 中强收敛到 $u \in BV(\Omega)$。


**证明**：$BV(\Omega)$ 紧嵌入 $L^1(\Omega)$（$\Omega$ 为 Lipschitz 有界域）。证明：(1) $BV$ 有界序列 $\|u_k\|_{BV}\le C$ 蕴含 $\|u_k\|_{L^1}$ 有界和 $\|Du_k\|(\Omega)$ 有界。(2) 光滑逼近：用磨光核 $\rho_\varepsilon$ 卷积得光滑函数 $u_k^\varepsilon$，其在 $W^{1,1}$ 中有界。(3) Rellich-Kondrachov：$W^{1,1}\hookrightarrow L^1$ 紧，得子列在 $L^1$ 中收敛。(4) 对角论证：取 $\varepsilon\to 0$ 得原序列子列在 $L^1$ 中收敛。极限函数属于 $BV$ 由下半连续性 $\|D u_\infty\|\le\liminf\|D u_{k_j}\|$ 保证。$\blacksquare$

**定理 251.4**（$BV$ 函数的精细结构 / Federer-Vol'pert 定理）：$u \in BV(\Omega)$ 关于 $\mathcal{H}^{n-1}$-可整流的跳跃集 $J_u$ 具有近似极限和跳跃。$Du$ 可分解为绝对连续部分、跳跃部分和 Cantor 部分。

**证明**：$u \in BV(\Omega)$ 的分布导数 $Du$ 是有限 Radon 测度。由 Radon-Nikodym 定理，$Du$ 可唯一分解为：$Du = D^a u + D^j u + D^c u$。绝对连续部分 $D^a u = \nabla u \, d\mathcal{L}^n$，其中 $\nabla u$ 是 $u$ 的近似梯度（由 $L^1$ 密度的 Lebesgue 微分定理给出）。跳跃部分 $D^j u = (u^+ - u^-) \nu_u \mathcal{H}^{n-1} \llcorner J_u$，其中 $J_u$ 是跳跃集，$u^\pm(x)$ 是沿法向 $\nu_u(x)$ 的近似极限。Federer 证明了 $J_u$ 是 $\mathcal{H}^{n-1}$-可整流的，这通过 blow-up 分析：在 $\mathcal{H}^{n-1}$-几乎每个 $x \in J_u$ 处，缩放极限 $u_{x,r}(y) = u(x+ry)$ 当 $r \to 0$ 时收敛到 Heaviside 阶梯函数。Cantor 部分 $D^c u$ 与 $\mathcal{L}^n$ 和 $\mathcal{H}^{n-1}$ 均奇异，无原子部分，如 Cantor-Vitali 函数的导数。关键工具包括 Besicovitch 覆盖引理和 Blaschke 选择定理。$\blacksquare$

### 251.3 图像处理中的变分方法

**定义 251.3**（Mumford-Shah 泛函 / 图像分割，1989）：

$$E(u, K) = \int_{\Omega \setminus K} |\nabla u|^2 dx + \alpha \mathcal{H}^{n-1}(K) + \beta \int_{\Omega} (u - g)^2 dx$$

其中 $u$ 是分段光滑的分割，$K$ 是边界跳跃集，$g$ 是观测到的噪声图像。

**定义 251.4**（Rudin-Osher-Fatemi 模型 / 全变差去噪，1992）：

$$\min_u \left\{ \int_{\Omega} |Du| + \frac{\lambda}{2} \int_{\Omega} (u - g)^2 dx \right\}$$

全变差正则化保持图像边缘（不模糊跳跃），是现代图像处理的基石。

**定理 251.5**（ROF 模型的解的性质）：ROF 模型的解 $u$ 是 $g$ 的「全变差流」在尺度 $\lambda^{-1}$ 下的结果。大尺度结构被保留，小尺度振荡被滤除。


**证明**：ROF 模型 $\min_u \|u-g\|_{L^2}^2 + \lambda\|Du\|(\Omega)$ 的解 $u$ 是 $g$ 的全变差流在尺度 $\lambda^{-1}$ 下的演化结果。由最优性条件（Euler-Lagrange 包含关系）：$u-g\in\lambda\partial\|Du\|$（次微分）。当 $\lambda$ 增大时，$u$ 趋向于 $g$ 的局部中位数（或几何中值）。在区域内部 $u$ 为分段常数（staircasing 效应）——这源于全变差正则化项惩罚振荡但不惩罚常数平移——大尺度特征（如边缘和纹理区域）被保留，而尺度小于 $\lambda$ 的振荡（如噪声、纹理）被滤除。该性质使 ROF 模型成为图像去噪的基准方法。$\blacksquare$

### 251.4 集中紧致性原理与 Gamma 收敛

**定义 251.5**（Gamma 收敛 / $\Gamma$-收敛，De Giorgi 1970s）：泛函序列 $F_n$ **$\Gamma$-收敛**到 $F$（$F_n \overset{\Gamma}{\to} F$），如果：
- **下界**：对任何 $x_n \to x$，$\liminf F_n(x_n) \geq F(x)$
- **上界**：对任何 $x$，存在收敛到 $x$ 的序列 $x_n$，使得 $\limsup F_n(x_n) \leq F(x)$

**定理 251.6**（$\Gamma$-收敛与最小化子的收敛）：若 $F_n \overset{\Gamma}{\to} F$ 且 $x_n$ 是 $F_n$ 的最小化子，则 $x_n$ 的每个聚点是 $F$ 的最小化子。


**证明**：设 $F_n\overset{\Gamma}{\to}F$（即下界不等式 $F(x)\le\liminf F_n(x_n)$ 对所有 $x_n\to x$，以及恢复序列的存在性：对每个 $x$ 存在 $x_n\to x$ 使 $F(x)\ge\limsup F_n(x_n)$）。若 $x_n$ 是 $F_n$ 的最小化子（$F_n(x_n)=\min F_n$），取子列 $x_{n_k}\to x$。对任意 $y$，取恢复序列 $y_n\to y$，由 $\Gamma$-收敛下界：$F(x)\le\liminf F_{n_k}(x_{n_k})\le\liminf F_{n_k}(y_{n_k})\le\limsup F_{n_k}(y_{n_k})\le F(y)$。故 $F(x)\le F(y)$ 对所有 $y$ 成立，即 $x$ 为 $F$ 的最小化子。$\blacksquare$

**定理 251.7**（Modica-Mortola 定理 / Allen-Cahn 泛函的 $\Gamma$-收敛）：Allen-Cahn 泛函

$$F_\varepsilon(u) = \int_{\Omega} \left( \frac{\varepsilon}{2} |\nabla u|^2 + \frac{1}{\varepsilon} W(u) \right) dx$$

（$W(u) = \frac{1}{4}(1-u^2)^2$ 是双井势）$\Gamma$-收敛到周长泛函 $\sigma \operatorname{Per}(\{u = 1\})$（模去常数），其中 $\sigma = \int_{-1}^1 \sqrt{2W(s)} ds$。


**证明**：Allen-Cahn 泛函 $F_\varepsilon(u)=\int_\Omega(\varepsilon|\nabla u|^2+\frac{1}{\varepsilon}W(u))dx$（$W$ 为双井位势，如 $W(u)=u^2(1-u)^2$）在 $L^1$ 拓扑下 $\Gamma$-收敛于 $c_W\cdot\operatorname{Per}(\{u=1\})$（$BV$ 泛函）。下界不等式：对 $u_\varepsilon\to \chi_E$（$L^1$），$\liminf F_\varepsilon(u_\varepsilon)\ge c_W\operatorname{Per}(E)$ 由 Modica 的梯度下界估计 $\varepsilon|\nabla u_\varepsilon|^2+\frac{1}{\varepsilon}W(u_\varepsilon)\ge 2\sqrt{W(u_\varepsilon)}|\nabla u_\varepsilon|$ 和 coarea 公式结合推出。恢复序列：取 $u_\varepsilon(x)=q(d(x,\partial E)/\varepsilon)$（$q$ 为 $W$ 的一维异宿轨道，$q'=\sqrt{2W}$），直接验证 $F_\varepsilon(u_\varepsilon)\to c_W\operatorname{Per}(E)$。$\blacksquare$

---

---

---

---

---
---


**第216章（补充）**

高维渐近凸几何（Asymptotic Convex Geometry / Local Theory of Banach Spaces）研究高维凸体在大维数极限下的渐近行为。它以 Dvoretzky 定理（1971）和 Milman 的浓度现象为核心，连接泛函分析、概率论和组合数学。Princeton Companion 将其列为独立数学分支。

### 252.1 Dvoretzky定理

**定理 252.1**（Dvoretzky定理，1971）：对任意 $\varepsilon > 0$ 和正整数 $k$，存在 $N = N(k, \varepsilon)$ 使得：对任意维数 $n \geq N$ 的 Banach 空间 $X$（赋予任意范数），存在 $X$ 的 $k$ 维子空间 $E$，其在 Banach-Mazur 距离 $d_{\mathrm{BM}}(E, \ell_2^k)$ 意义下是近似 Euclid 的：
$$d_{\mathrm{BM}}(E, \ell_2^k) \leq 1 + \varepsilon$$
其中 $d_{\mathrm{BM}}(X, Y) = \inf \{\|T\| \cdot \|T^{-1}\| : T: X \to Y \text{ 线性同构}\}$。

*意义*：Dvoretzky 定理声称：每个充分高维的 Banach 空间都包含任意维数的近似 Euclid 子空间——无论原空间的几何多么"非欧"（如 $\ell_\infty^n$ 的单位球是立方体，其中也包含近似球形的截面）。这是"高维凸体总有近似球截面"的深刻陈述。

**Milman的简短证明**（1971，5页）：核心工具是 Lévy 族的测度集中现象——球面 $S^{n-1}$ 上的 Haar 测度高度集中在赤道附近。用等周不等式和 Lipschitz 函数的浓度估计证明：任意高维凸体的 Minkowski 泛函在大部分方向上近似常数，从而存在高维近似 Euclid 截面。


**证明**：$n$ 维 Banach 空间 $(\mathbb{R}^n,\|\cdot\|)$ 的高维截面几乎为 Euclid 空间。证明：(1) 利用 $S^{n-1}$ 上范数的集中现象（由 Lévy 引理）：$\|\cdot\|$ 的 $1$-Lipschitz 函数中位数为 $M$，则 $\mu(\{|\|x\|-M|>\varepsilon\})\le 2e^{-c\varepsilon^2 n}$。(2) 取 $k$ 维随机子空间 $E$（按 Haar 测度），则该子空间单位球面上的范数几乎处处接近常数。(3) 三角不等式与 John 椭球结合给出子空间 $E$ 上的范数与 Euclid 范数的 $(1+\varepsilon)$-等价性。$N(k,\varepsilon)$ 的存在性来自 $n$ 足够大时集中现象的支配作用（$n\gtrsim C k/\varepsilon^2$）。$\blacksquare$

### 252.2 John椭球与Banach-Mazur距离

**定义 252.1**（John椭球 / 最大体积内切椭球）：$\mathbb{R}^n$ 中凸体 $K$ 的 **John 椭球** $\mathcal{E}_{\max}(K)$ 是含于 $K$ 的具有最大体积的椭球（唯一）。若 $K$ 是中心对称的，则 $n^{-1/2} \mathcal{E}_{\max}(K) \subset K \subset \mathcal{E}_{\max}(K)$。

**定理 252.2**（John定理，1948）：对 $\mathbb{R}^n$ 中任意中心对称凸体 $K$，存在以原点为中心的椭球 $\mathcal{E}$ 满足
$$\mathcal{E} \subset K \subset \sqrt{n} \cdot \mathcal{E}$$
等价地，任何 $n$ 维 Banach 空间到 $\ell_2^n$ 的 Banach-Mazur 距离不超过 $\sqrt{n}$：$d_{\mathrm{BM}}(X, \ell_2^n) \leq \sqrt{n}$。这个上界是紧的（$\ell_\infty^n$ 达到 $\sqrt{n}$）。

**推论 252.1**（Banach-Mazur紧致性）：所有 $n$ 维 Banach 空间的等距类构成的 Banach-Mazur 紧致度量空间 $\mathcal{B}_n$ 的直径为 $O(\sqrt{n})$。


**证明**：对中心对称凸体 $K\subset\mathbb{R}^n$，John 椭球 $\mathcal{E}$ 是 $K$ 的最大体积内切椭球。设 $\mathcal{E}=B_2^n$（单位球），则 $K\subset\sqrt{n}B_2^n$ 由接触点处的极值性质导出：存在接触点 $x_i\in\partial K\cap\partial B_2^n$ 和正数 $c_i>0$ 使 $\sum c_i x_i\otimes x_i = I_n$（Fritz John 分解）。取极体 $K^\circ$，同理得 $B_2^n/\sqrt{n}\subset K$。该定理给出任意有限维赋范空间与 Euclid 空间之间距离的普适量级上界（$\sqrt{n}$），是最优的——$\ell_\infty^n$ 的 John 椭球为 $B_2^n$ 且比值精确为 $\sqrt{n}$。$\blacksquare$

### 252.3 凸体的渐近浓度现象

浓度现象是高维几何中最引人注目的特征之一：在高维空间中，Lipschitz 函数在概率意义下几乎为常数，偏离中位数的测度以维数的指数速率衰减。这一现象由 Milman 在 1971 年作为 Dvoretzky 定理证明的核心工具引入，它从根本上解释了为什么高维 Banach 空间必然包含近 Euclid 截面——范数作为 $S^{n-1}$ 上的 Lipschitz 函数，在高维下几乎处处集中在其中位值附近。

**定理 252.3**（Milman的浓度现象，1971）：设 $\mu$ 是 $S^{n-1}$ 上的归一化 Haar 测度（旋转不变概率测度）。对任意 1-Lipschitz 函数 $f: S^{n-1} \to \mathbb{R}$（$|f(x) - f(y)| \leq \|x - y\|$），有
$$\mu\left(\{x : |f(x) - M_f| \geq t\}\right) \leq C e^{-c n t^2}$$
其中 $M_f$ 是 $f$ 的中位数（或均值），$C, c > 0$ 是万有常数。*注：高维球面上的 Lipschitz 函数高度集中在其中位数附近——偏离的测度指数衰减于维数。*


**证明**：对 $S^{n-1}$ 上 $1$-Lipschitz 函数 $f$，设 $M$ 为其中位数（$\mu(\{f\le M\})\ge 1/2$ 且 $\mu(\{f\ge M\})\ge 1/2$）。由 Lévy 等周不等式：$S^{n-1}$ 上子集 $A$ 的 $\varepsilon$-展开 $A_\varepsilon$ 满足 $\mu(A_\varepsilon)\ge 1-e^{-c\varepsilon^2 n}$（若 $\mu(A)\ge 1/2$）。取 $A=\{f\le M\}$，$A_\varepsilon\subset\{f\le M+\varepsilon\}$（因 $f$ 为 $1$-Lipschitz），故 $\mu(\{f>M+\varepsilon\})\le e^{-c\varepsilon^2 n}$。对称地 $\mu(\{f<M-\varepsilon\})\le e^{-c\varepsilon^2 n}$，联立得 Gaussian 浓度。该现象说明高维球面上 Lipschitz 函数几乎为常数。$\blacksquare$

**定理 252.4**（Blaschke-Santaló不等式）：中心对称凸体 $K \subset \mathbb{R}^n$ 的极体 $K^\circ = \{y : \langle x, y \rangle \leq 1, \forall x \in K\}$ 满足
$$\operatorname{Vol}(K) \cdot \operatorname{Vol}(K^\circ) \leq \operatorname{Vol}(B_2^n)^2$$
其中 $B_2^n$ 是 Euclid 单位球。等号当且仅当 $K$ 是椭球（Santaló 1949，等价性由 Saint-Raymond 1981 证明）。

**定义 252.2**（Mahler猜想，1939）：对中心对称凸体 $K$，$\operatorname{Vol}(K) \cdot \operatorname{Vol}(K^\circ) \geq 4^n / n!$，且极值由立方体 $[-1, 1]^n$ 及其极体（$\ell_1^n$ 球 × 交叉多胞体）达到。该猜想刚被部分解决（Iriyeh-Shibata 2020, 3维情形）。


**证明**：对中心对称凸体 $K$，极体 $K^\circ=\{y:\langle x,y\rangle\le 1,\forall x\in K\}$ 满足 $|K||K^\circ|\le\omega_n^2$。Bourgain-Milman 证明了反向不等式：$|K||K^\circ|\ge c^n\omega_n^2$（$c>0$ 为绝对常数）。Blaschke-Santaló 的证明使用仿射等周不等式：通过 $\operatorname{SL}(n)$ 变换将 $K$ 置于"各向同性位置"（使惯性矩阵正比于单位矩阵），此时 $K$ 的体积与极体体积达到平衡。Santaló 点（使 $|K^\circ|$ 最小的内点）处的临界条件给出最优上界 $\omega_n^2$，等号成立当且仅当 $K$ 为以原点为中心的椭球。$\blacksquare$

**定理 252.5**（等周不等式与 Brunn-Minkowski 的联系）：经典的 Brunn-Minkowski 不等式 $\operatorname{Vol}(A + B)^{1/n} \geq \operatorname{Vol}(A)^{1/n} + \operatorname{Vol}(B)^{1/n}$ 蕴含了 $\mathbb{R}^n$ 中的等周不等式和所有函数形式的 Borell-Brascamp-Lieb 不等式——这是测度集中的分析基础。


**证明**：Brunn-Minkowski 不等式：$|A+B|^{1/n}\ge |A|^{1/n}+|B|^{1/n}$（$A,B$ 为 $\mathbb{R}^n$ 中紧致子集）。取 $A$ 为区域 $E$，$B=\varepsilon B_2^n$（小半径球体），则 $A+B$ 为 $E$ 的 $\varepsilon$-管状邻域 $E_\varepsilon$。展开：$|E+\varepsilon B_2^n| = |E| + \varepsilon\operatorname{Per}(E) + o(\varepsilon)$（Minkowski 内容公式）。代入 Brunn-Minkowski：$(|E|+\varepsilon\operatorname{Per}(E))^{1/n}\ge |E|^{1/n}+\varepsilon\omega_n^{1/n}$。Taylor 展开得 $\operatorname{Per}(E)\ge n\omega_n^{1/n}|E|^{(n-1)/n}$（等周不等式）。反向地，等周不等式通过积分给出 Brunn-Minkowski，故两者等价。$\blacksquare$

### 252.4 各向同性常数与切片问题

**定义 252.3**（各向同性凸体 / 各向同性常数）：凸体 $K \subset \mathbb{R}^n$（体积为 1）称为**各向同性**的，若其重心在原点且其惯性矩阵是对角的：$\int_K x_i x_j dx = L_K^2 \delta_{ij}$。参数 $L_K$ 是 $K$ 的**各向同性常数**。

**切片问题**（Bourgain的切片问题 / 超平面猜想，1986）：是否存在万有常数 $C > 0$，使得对任意 $n$ 和任意体积为 1 的中心对称凸体 $K \subset \mathbb{R}^n$，存在超平面截面 $K \cap H$ 的 $(n-1)$ 维体积至少为 $C$？等价于 $L_K \leq C$ 是否对所有各向同性凸体成立？该问题被 Klartag（2006）和 Chen（2021）证明 $L_K \leq C$（万有常数存在）——这是高维凸几何近年的重大突破。

**定理 252.6**（薄壳不等式 / Thin Shell，Klartag 2007）：各向同性凸体 $K$（体积 1）上的均匀测度集中在距原点约 $\sqrt{n} L_K$ 的薄球壳上。更精确地，$\operatorname{Var}_K(\|x\|) \leq C L_K^2$（方差不随维数增长）。


**证明**：各向同性凸体 $K$（$|K|=1$，重心在原点，惯性矩阵正比于单位阵）上的均匀测度，其范数方差 $\sigma_K^2=\operatorname{Var}_K(\|x\|)$ 称为薄壳宽度。Klartag 证明 $\sigma_K\le C n^{-1/3}$（$C$ 为普适常数），后经 Eldan 和 Lee-Vempala 改进至 $\sigma_K\le C L_K n^{-1/2}$（$L_K$ 为各向同性常数）。该不等式说明高维各向同性凸体上的均匀测度集中在半径约 $\sqrt{n}L_K$ 的薄球壳上，其厚度相对于半径趋于零。这是中心极限定理在各向同性凸体类上的概率极限定理形式。$\blacksquare$

---

*本卷在实分析（V9）和泛函分析（V14）的基础上，系统建立了 Hausdorff 测度与分形维数、自相似与多重分形分析、整流与电流（Federer 理论）、Plateau 问题（Douglas 解与正则性）和几何测度论变分法（Caccioppoli 集、BV 函数、$\Gamma$-收敛）的理论体系。全书以分形几何的「无限精细结构」和几何测度论的「广义曲面」收尾，展示了数学处理非光滑几何对象的强大能力。共 5 章。*


*本卷建立了几何分析的核心框架：极小曲面（面积泛函、Plateau 问题、Bernstein 定理）是几何变分问题最经典的范例；调和映射（能量泛函、Eells-Sampson 定理、气泡分析）将调和函数推广到流形间的映射；Ricci 流（Hamilton 方程、Perelman 的非塌缩和手术理论、Poincaré 猜想的证明）是 21 世纪数学最伟大的成就之一；Yamabe 问题（共形几何、临界 Sobolev 指数、正质量定理）揭示了共形不变量的深层结构；平均曲率流和 Yang-Mills 方程将几何 PDE 的方法推广到更广泛的几何演化问题；补充部分将分形几何与几何测度论（Hausdorff 测度与维数、自相似与多重分形、整流与电流理论、Plateau 问题的测度论解、Caccioppoli 集与 BV 函数、Γ-收敛）纳入本卷框架。几何分析是当代数学最活跃的前沿领域之一。*


*卷三十五：几何分析终。*


*卷三十五：几何分析终。*


*卷三十五：几何分析终。*


*卷三十二：几何分析终。*

---

### 210.A 几何测度论补充
> 分形几何（Fractal Geometry）由 Benoît Mandelbrot 在 1970 年代系统建立，研究处处不可微的、具有自相似结构的「粗糙」集合。几何测度论（Geometric Measure Theory）由 De Giorgi、Federer、Fleming 等人在 1960-1970 年代发展，使用测度论工具研究 $\mathbb{R}^n$ 中「广义曲面」的几何与拓扑性质，特别是 Plateau 问题（存在以给定曲线为边界的极小面积曲面）的严格数学解。两个领域都处理传统光滑微分几何无法描述的「奇异」几何对象，在现代分析、变分法和图像处理中有深刻应用。本卷在实分析（V9）、测度论（V9 Ch 65）和泛函分析（V14）的基础上，建立 Hausdorff 测度、分形维数、整流与电流、Plateau 问题和变分法的几何测度论基础。

---

---

---

---

---
---

## 第232章：Hausdorff 测度与分形维数
分形几何的核心概念是用非整数维数来度量集合的「粗糙度」。Hausdorff 测度和 Hausdorff 维数是最基本的工具。

### 247.1 Hausdorff 测度

**定义 247.1**（$s$-维 Hausdorff 测度）：对 $s \geq 0$ 和 $A \subset \mathbb{R}^n$，定义

$$\mathcal{H}^s(A) = \lim_{\delta \to 0} \mathcal{H}^s_\delta(A)$$

其中

$$\mathcal{H}^s_\delta(A) = \inf \left\{ \sum_{i=1}^\infty (\operatorname{diam} U_i)^s : A \subset \bigcup_i U_i,\ \operatorname{diam} U_i \leq \delta \right\}$$

$\mathcal{H}^s$ 是 $\mathbb{R}^n$ 上的外测度（实际上是 Borel 测度）。

Hausdorff 测度的定义核心是一族可变直径的覆盖，这与 Lebesgue 测度使用立方体覆盖的刚性结构形成了对比——Hausdorff 的灵活性使得它可以测量任意维数 $s \geq 0$ 的集合，包括那些对 Lebesgue 测度而言"零测"的分形集。在深入讨论维数之前，首先需要确认 $\mathcal{H}^s$ 确实是一个良定义的测度，满足我们所期望的测度论基本性质。下面的命题汇集了 $\mathcal{H}^s$ 最常用的测度论属性，其中距离集可加性——间隔为正距离的两个集合的 Hausdorff 测度具有可加性——是区分 Hausdorff 测度与一般 Borel 测度的关键特征。

**命题 247.1**（Hausdorff 测度）：$\mathcal{H}^s$ 是 $\mathbb{R}^n$ 上的 Borel 正则外测度，满足：（1）单调性：$A \subset B \Rightarrow \mathcal{H}^s(A) \leq \mathcal{H}^s(B)$；（2）可数次可加性：$\mathcal{H}^s(\bigcup_n A_n) \leq \sum_n \mathcal{H}^s(A_n)$；（3）距离集可加性：若 $\operatorname{dist}(A,B) > 0$，则 $\mathcal{H}^s(A \cup B) = \mathcal{H}^s(A) + \mathcal{H}^s(B)$。特别地，$\mathcal{H}^0$ 为计数测度，$\mathcal{H}^n$ 与 $\mathcal{L}^n$ 仅差一个常数因子。

**证明**：（1）单调性：若 $A \subset B$，则 $A$ 的每个 $\delta$-覆盖也是 $B$ 的 $\delta$-覆盖，取 $\delta \to 0$ 得 $\mathcal{H}^s(A) \leq \mathcal{H}^s(B)$。（2）可数次可加性：设 $\varepsilon > 0$，对每个 $A_n$ 取 $\delta$-覆盖 $\{U_{n,i}\}$ 使 $\sum_i (\operatorname{diam} U_{n,i})^s \leq \mathcal{H}^s_\delta(A_n) + \varepsilon/2^n$，则 $\{U_{n,i}\}_{n,i}$ 是 $\bigcup_n A_n$ 的 $\delta$-覆盖，$\mathcal{H}^s_\delta(\bigcup_n A_n) \leq \sum_n \mathcal{H}^s_\delta(A_n) + \varepsilon$，取 $\delta \to 0$ 和 $\varepsilon \to 0$ 即得。（3）距离集性质：当 $\operatorname{dist}(A,B) > 0$ 时，取 $\delta < \operatorname{dist}(A,B)/2$，则任何 $\delta$-覆盖无法同时覆盖 $A$ 和 $B$ 中的点，故 $\mathcal{H}^s_\delta(A \cup B) = \mathcal{H}^s_\delta(A) + \mathcal{H}^s_\delta(B)$，取 $\delta \to 0$ 得可加性。$\blacksquare$

Hausdorff 测度最引人注目的行为是它作为维数 $s$ 的函数具有一个非常特殊的性质：对固定的集合 $A$，$\mathcal{H}^s(A)$ 在某个临界值 $s_0$ 处从无穷跳跃到零。这一"跳跃"现象正是 Hausdorff 维数定义的基础——它表明每个集合都有一个唯一的维数阈值，在此阈值之下测度为无穷（表示覆盖"太细"），在此之上测度为零（表示覆盖"太粗"）。下面的定理精确地刻画了这一跳跃行为及其关键推论。

**定理 247.1**（Hausdorff 测度的行为）：函数 $s \mapsto \mathcal{H}^s(A)$ 在某个唯一的 $s_0$ 处从 $\infty$ 跳到 $0$。即在 $s < s_0$ 时 $\mathcal{H}^s(A) = \infty$，$s > s_0$ 时 $\mathcal{H}^s(A) = 0$（$\mathcal{H}^{s_0}(A)$ 可能为 $0$、正有限或无穷）。

**证明**：设 $\mathcal{H}^t(A) < \infty$，对任意 $s > t$ 和 $\delta$-覆盖 $\{U_i\}$，$\sum (\operatorname{diam} U_i)^s \leq \delta^{s-t} \sum (\operatorname{diam} U_i)^t$。取 $\delta \to 0$，若 $\mathcal{H}^t(A) < \infty$ 则 $\mathcal{H}^s(A) = 0$。故函数 $s \mapsto \mathcal{H}^s(A)$ 至多在一个临界值 $s_0$ 处从 $\infty$ 跳到 $0$。可数稳定性由外测度的可数次可加性直接得到。Lipschitz 不变性：对 Lipschitz 映射 $f$，每个 $\delta$-覆盖 $\{U_i\}$ 在 $f$ 下的像 $\{f(U_i)\}$ 是 $\operatorname{Lip}(f)\delta$-覆盖，故 $\mathcal{H}^s_{\operatorname{Lip}(f)\delta}(f(A)) \leq \sum (\operatorname{diam} f(U_i))^s \leq (\operatorname{Lip}(f))^s \sum (\operatorname{diam} U_i)^s$，取 $\delta \to 0$ 得 $\mathcal{H}^s(f(A)) \leq (\operatorname{Lip}(f))^s \mathcal{H}^s(A)$。$\blacksquare$

### 247.2 分形维数

**定义 247.2**（Hausdorff 维数）：集合 $A \subset \mathbb{R}^n$ 的**Hausdorff 维数**为

$$\dim_H A = \sup\{s \geq 0 : \mathcal{H}^s(A) = \infty\} = \inf\{s \geq 0 : \mathcal{H}^s(A) = 0\}$$

Hausdorff 维数可以是任意非负实数。

**定义 247.3**（盒维数 / Box-Counting Dimension）：设 $N_\delta(A)$ 是覆盖 $A$ 所需的直径为 $\delta$ 的集合的最少数目。**下盒维数**和**上盒维数**分别为

$$\underline{\dim}_B A = \liminf_{\delta \to 0} \frac{\log N_\delta(A)}{-\log \delta}, \quad \overline{\dim}_B A = \limsup_{\delta \to 0} \frac{\log N_\delta(A)}{-\log \delta}$$

若上下盒维数相等，则 $\dim_B A$ 是**盒维数**（也称 Minkowski 维数）。一般 $\dim_H A \leq \underline{\dim}_B A \leq \overline{\dim}_B A$。

**注 247.1**（Hausdorff 维数与盒维数的关系）：不等式 $\dim_H A \leq \underline{\dim}_B A$ 成立的原因是：盒维数使用固定大小的覆盖（所有覆盖集直径 $\leq \delta$），而 Hausdorff 维数允许任意尺寸的覆盖（各覆盖集直径可不同），故 Hausdorff 测度更"精细"，维数更低。严格不等式的典型例子：$\mathbb{Q} \cap [0,1]$ 作为可数集满足 $\dim_H = 0$，但因稠密性其盒维数 $\dim_B = 1$。另一个经典例子是 $\{1, 1/2, 1/3, \ldots\} \cup \{0\}$：$\dim_H = 0$ 但盒维数为 $1/2$。这些例子表明盒维数对"可数个点的极限密度"敏感，而 Hausdorff 维数对于可数集恒为零。对"好"的自相似分形（如 Cantor 集、Sierpiński 三角形），二者通常相等。

### 247.3 自相似集与迭代函数系

**定义 247.4**（迭代函数系 / IFS）：**迭代函数系**是一族收缩映射 $\{f_1, \ldots, f_m\}$（$f_i: \mathbb{R}^n \to \mathbb{R}^n$，$\operatorname{Lip}(f_i) < 1$）。IFS 的**吸引子**（或不变集）$K$ 是满足 $K = \bigcup_{i=1}^m f_i(K)$ 的唯一非空紧致集合。

迭代函数系（IFS）是构造自相似分形的最通用的框架。每个收缩映射 $f_i$ 对应一个"副本"变换，将这些副本的并集取不动点即得整个分形。Hutchinson 在 1981 年给出了这一构造的严格数学基础，并证明了吸引子的存在唯一性。然而，仅知道吸引子的存在还不够——我们还需要知道它的维数。当各个变换 $f_i$ 是相似比已知的相似压缩时，Hutchinson 进一步发现了一种极为优美的事实：在开集条件（确保变换的像不重叠太多）下，维数由一条简单的代数方程——Moran 方程——精确确定。这条方程将纯几何的维数问题转化为解一个多项式的根，是分形维数计算中最经典也最实用的工具。

**定理 247.2**（Hutchinson 定理，1981）：设 $\{f_i\}$ 是相似比为 $c_i$ 的相似压缩。若开集条件（OSC）成立（存在非空有界开集 $V$ 使得 $f_i(V) \subset V$ 且 $f_i(V)$ 两两不交），则吸引子的 Hausdorff 维数 $s$ 满足**Moran 方程**：

$$\sum_{i=1}^m c_i^s = 1$$

且 $0 < \mathcal{H}^s(K) < \infty$。

**证明**：设 $K$ 为 IFS 吸引子，$K = \bigcup_{i=1}^m f_i(K)$。由 Hausdorff 测度的 Lipschitz 性质，$\mathcal{H}^s(K) \leq \sum_i c_i^s \mathcal{H}^s(K)$。若 $\mathcal{H}^s(K) < \infty$，则必须 $\sum c_i^s \geq 1$。上界：对 $K$ 构造由迭代 $f_{i_1} \circ \cdots \circ f_{i_k}$ 生成的 $\delta$-覆盖，利用 OSC 保证覆盖元素不重叠，得 $\mathcal{H}^s(K) \leq C \sum c_{i_1}^s \cdots c_{i_k}^s = C (\sum c_i^s)^k \to 0$ 当 $\sum c_i^s < 1$ 且 $k \to \infty$，故 $s > \dim_H K$ 时 $\mathcal{H}^s(K) = 0$。下界：利用 OSC 中开集 $V$ 上分布的自相似测度（质量分布原理），构造概率测度 $\mu$ 使其满足 $\mu(f_{i_1} \circ \cdots \circ f_{i_k}(K)) = c_{i_1}^s \cdots c_{i_k}^s$ 且 $\mu(B(x,r)) \leq C r^s$，由 Frostman 引理得 $\mathcal{H}^s(K) > 0$。故 $\dim_H K = s$ 为 Moran 方程 $\sum c_i^s = 1$ 的唯一解，且 $0 < \mathcal{H}^s(K) < \infty$。$\blacksquare$

---

---

---

---

---
---

## 第233章：分形结构的自相似与多重分形
许多分形不能仅由一个维数完全描述——它们具有多层次的分形结构，需要**多重分形分析**（multifractal analysis）来刻画。

### 248.1 自仿射分形与随机分形

自仿射分形是自相似分形的重要推广，由仿射压缩组成 IFS 的吸引子。与自相似分形（各方向等比例收缩）不同，自仿射分形允许不同方向有不同的收缩比，这使得其几何结构更加丰富——例如，自仿射分形在不同方向上的 Hausdorff 维数可以不同，且其维数一般不能由简单的 Moran 方程给出。自仿射分形的维数计算通常需要强有力的工具，如 Falconer 的奇异值函数方法（singular value function method）和 Bedford-McMullen 对自仿射地毯的显式计算。随机分形是另一类重要的分形对象，它们不是由确定性规则生成，而是由随机过程定义。**扩散限制聚集**（DLA / Diffusion-Limited Aggregation，Witten-Sander 1981）是最经典的随机分形模型之一，其生成过程为：随机粒子沿 Brown 运动轨迹从远处扩散，当遇到已有团簇时黏附。DLA 团簇展现出极其复杂的枝晶状结构，其分形维数在二维情形下约为 $1.71$，且团簇的外部分支是多重分形的。DLA 的数学分析极度困难——其 Laplace 生长方程（粒子的扩散满足 Laplace 方程 $\Delta u = 0$，边界条件为团簇表面 $u = 0$ 和无穷远处 $u = 1$）与自由边界问题密切相关，至今没有严格的数学理论能完全解释 DLA 的枝晶形态。随机分形还出现在许多自然现象中——如河网的形状、闪电的路径、肺部支气管树的分布——这些自然分形结构通常既具有统计自相似性，又展现出随机性，是分形几何与统计物理交叉的重要研究对象。

**定义 248.1**（自仿射分形 / Self-Affine Fractal）：由仿射压缩 $f_i(x) = A_i x + b_i$（$A_i$ 是收缩矩阵，各方向收缩比不同）组成的 IFS 的吸引子。与自相似分形不同，自仿射分形的不同方向有不同的伸缩行为。

**定义 248.2**（随机分形与 DLA）：**扩散限制聚集**（DLA / Diffusion-Limited Aggregation，Witten-Sander 1981）通过随机粒子沿 Brown 运动轨迹黏附生长的过程产生随机分形。DLA 团簇的维数约为 $1.71$（二维）。

### 248.2 多重分形分析

**定义 248.3**（多重分形谱 / Multifractal Spectrum）：对测度 $\mu$ 上的奇异性分析，定义局部 Hölder 指数 $\alpha(x) = \lim_{r \to 0} \frac{\log \mu(B(x, r))}{\log r}$。**多重分形谱** $f(\alpha)$ 是满足 $\alpha(x) = \alpha$ 的点的 Hausdorff 维数。

单一分形维数（如 Hausdorff 维数）描述的是集合的整体几何，但对于承载了一个测度 $\mu$ 的分形——例如 Cantor 集上不均匀分布的质量——单维数无法区分"测度集中的区域"和"测度稀薄的区域"。多重分形分析正是在这一背景下引入的：它将集合按局部奇异性强度 $\alpha$ 分层，计算每层的 Hausdorff 维数 $f(\alpha)$，从而得到一族而非单个维数。在实际计算中，$f(\alpha)$ 的直接估计极为困难，但通过引入 Rényi 维数 $D_q$ 和配分函数 $Z_q$，可以借助统计力学中的 Legendre 变换将局部信息转化为全局矩的渐近行为，从而使多重分形分析成为可计算的工具。

**定义 248.4**（Rényi 维数与配分函数）：定义配分函数 $Z_q(\delta) = \sum_i \mu(B_i)^q$（$B_i$ 是边长 $\delta$ 的网格覆盖）。广义维数 $D_q$ 满足 $Z_q(\delta) \sim \delta^{(q-1)D_q}$（$\delta \to 0$）。通过 Legendre 变换：$f(\alpha) = \inf_q (q \alpha - \tau(q))$，$\tau(q) = (q-1)D_q$。

Rényi 维数族 $\{D_q\}$ 通过参数 $q$ 给测度的不同矩赋予不同的权重：$q=0$ 恢复分形支持的盒维数，$q=1$ 给出信息维数（Shannon 熵的标度行为），$q=2$ 给出关联维数。当 $q$ 遍历实数时，Legendre 变换建立了 $D_q$ 与 $f(\alpha)$ 之间的对偶关系——这是统计力学中配分函数与熵之间的对偶在分形理论中的直接对应。Frisch 和 Parisi 在 1985 年提出了一个著名的猜想：在充分发展的湍流中，能量耗散率的空间分布具有多重分形结构，其 $f(\alpha)$ 谱给出了湍流间歇性的完整表征。下面的定理总结了多重分形形式论的核心结论。

**定理 248.1**（多重分形形式论 / Frisch-Parisi 猜想，1985）：在湍流和许多其他物理系统中，多重分形谱 $f(\alpha)$ 是 $\cap$ 形的，$f(\alpha)$ 的最大值为信息维数 $D_1$，$D_0$ 是测度支撑的盒维数。


**证明**：将分形测度 $\mu$ 的支集按局部 Holder 指数 $\alpha(x)=\lim_{r\to 0}\log\mu(B_r(x))/\log r$ 分层。令 $E_\alpha=\{x:\alpha(x)=\alpha\}$，$f(\alpha)=\dim_H E_\alpha$ 为多重分形谱。大偏差原理给出 Legendre 变换关系：$\tau(q)=\inf_\alpha(q\alpha-f(\alpha))$，其中 $\tau(q)$ 为相关指数（partition function 的标度指数）。$f(\alpha)$ 为 $\cap$-形曲线，最大值 $f(\alpha_{\max})=D_0$（盒维数），$f(\alpha_{\text{info}})=D_1$（信息维数）。Frisch-Parisi 猜想将湍流能量耗散的间歇性归因于多重分形结构。$\blacksquare$

### 248.3 渗流与分形

**定义 248.5**（渗流模型 / Percolation Model）：在二维网格上，每条边以概率 $p$ 被「打开」（可通行）。当 $p$ 超过临界概率 $p_c = 1/2$ 时，存在无穷大连通分量。

渗流模型简洁的定义——独立地以概率 $p$ 打开每条边——背后蕴藏着极为丰富的相变和分形现象。当 $p$ 从 $0$ 增加到 $1$ 时，系统先后经历无长程连通（亚临界）和出现无穷大连通分量（超临界）两个截然不同的相，相变恰好发生在 $p = p_c = 1/2$。正是在这个临界点上，连通团簇展现出精确的分形结构：团簇的质量与线性尺度满足幂律关系 $M \sim L^{D_f}$，其 Hausdorff 维数 $D_f$ 可以用共形场论和 Schramm-Loewner 演化（SLE）严格计算。下面的定理汇集了临界渗流团簇在二维情形下的主要维数结果。

**定理 248.2**（渗流团簇的分形维数，Stanley 1977）：在 $p = p_c$ 时，渗流团簇是分形。二维临界渗流团簇的 Hausdorff 维数为 $91/48 \approx 1.896$。团簇的化学维数（沿团簇测量的最短路径距离）为 $d_{\min} \approx 1.13$。


**证明**：二维临界点渗流（$p=p_c=1/2$）的最大团簇为分形。团簇质量 $M$ 与线性尺度 $L$ 的关系 $M\sim L^{D_f}$ 给出 Hausdorff 维数 $D_f=91/48$（由共形场论和 SLE 过程严格推导）。化学维数 $d_{\min}$ 描述沿团簇内部路径的最短距离：$\ell\sim R^{d_{\min}}$（$R$ 为欧氏端到端距离），二维 $d_{\min}\approx 1.130$。这些维数通过渗流的共形不变性（Cardy 公式、SLE₆ 过程）与统计物理中的 Coulomb 气体映射建立联系。$\blacksquare$

---

---

---

---

---
---

## 第234章：整流与电流
几何测度论使用**整流**和**电流**（rectifiable sets and currents）的概念精密地研究奇异曲面和变分问题。

### 249.1 可整流集

**定义 249.1**（$k$-维可整流集 / Rectifiable Set）：Borel 集 $E \subset \mathbb{R}^n$ 是**可数 $\mathcal{H}^k$-可整流的**，如果存在可数多个 Lipschitz 映射 $f_i: \mathbb{R}^k \to \mathbb{R}^n$ 使得

$$\mathcal{H}^k\left(E \setminus \bigcup_i f_i(\mathbb{R}^k)\right) = 0$$

即可整流集几乎被 Lipschitz 参数化的 $k$ 维曲面覆盖。

**定理 249.1**（可整流集的结构定理）：$k$-维可整流集 $E$ 在 $\mathcal{H}^k$-几乎处处有 $k$ 维近似切空间 $\operatorname{Tan}^k(E, x)$。即对 $\mathcal{H}^k$-a.e. $x \in E$，

$$\lim_{r \to 0} \frac{\mathcal{H}^k(E \cap B(x, r))}{r^k} = 1$$

（在适当的旋转下，$E$ 的放大极限是一个 $k$ 维平面）。

**定义 249.2**（纯不可整流集 / Purely Unrectifiable Set）：Borel 集 $E$ 是**纯不可整流的**，如果对每个 $k$-维可整流集 $F$，$\mathcal{H}^k(E \cap F) = 0$。Besicovitch 证明了二维中存在纯一维不可整流集。


**证明**：$E$ 为 $k$-维可整流集意味着 $E$ 几乎处处可由 $k$ 维 Lipschitz 映射参数化：存在可数多个 $k$ 维 Lipschitz 片 $f_i:\mathbb{R}^k\to\mathbb{R}^n$ 使得 $\mathcal{H}^k(E\setminus\bigcup f_i(\mathbb{R}^k))=0$。对 $\mathcal{H}^k$-a.e. $x\in E$，近似切空间 $\operatorname{Tan}^k(E,x)$ 的存在性由 Rademacher 定理和 Lebesgue 密度定理联合给出：将局部坐标拉伸到尺度 $r^{-1}$，Lipschitz 片的像在缩放极限下趋于 $f_i$ 在 $f_i^{-1}(x)$ 处的切空间（作为 $\mathbb{R}^n$ 的 $k$ 维子空间）。该极限不依赖于 Lipschitz 表示的选择。$\blacksquare$

### 249.2 整系数整流链

整系数整流链（integral rectifiable currents）是几何测度论中描述"广义定向曲面"的核心概念，由 Federer 和 Fleming（1960）在解决 Plateau 问题的过程中引入。一个 $k$-维整系数整流链 $T$ 由三个要素定义：一个 $k$-维可整流集 $E$（即几乎处处有 $k$ 维近似切空间）、一个整数重数函数 $\theta: E \to \mathbb{Z}$（$|theta|$ 表示曲面的"层数"）和一个定向 $k$-向量场 $\xi$。作为 $k$-形式 $\omega$ 上的线性泛函，$T(\omega) = \int_E \langle \omega(x), \xi(x) \rangle \theta(x) d\mathcal{H}^k(x)$。整系数整流链空间记作 $\mathcal{R}_k(\mathbb{R}^n)$。整流链的关键性质包括：（1）紧致性定理（Federer-Fleming）：质量有界且边界质量有界的整流链序列有子列在平坦范数（flat norm）下收敛到一个整系数整流链；（2）边界 $\partial T$ 定义为分布 $\partial T(\omega) = T(d\omega)$，且 $\partial T$ 是 $(k-1)$-维整流链；（3）**变形定理**（deformation theorem）：任何整流链可以通过径向投影和 CW 结构变形为标准网格上的胞腔链，且质量受控。变形定理是等周不等式的证明核心——它将连续几何问题转化为组合问题。整系数整流链的"整系数"条件至关重要：它保证了重数 $\theta$ 取整数值，从而在变分问题中防止了"面积可以无限细分"的悖论。整系数平坦链（integral flat chains）是整系数整流链及其边界的 $L^1$ 极限，构成了适合变分法的完备空间。这一框架的成功标志是：Federer-Fleming 使用整系数整流链理论严格证明了任意维数的 Plateau 问题——对任意 $(k-1)$-维整系数整流链边界 $T$，存在 $k$-维整系数整流链 $S$（$\partial S = T$）使得 $\mathbf{M}(S)$ 极小化。这是 20 世纪数学分析最重大的成就之一。

**定义 249.4**（质量与边界 / Mass and Boundary）：整流链 $T$ 的**质量**为 $\mathbf{M}(T) = \int_E |\theta(x)| d\mathcal{H}^k(x)$。$T$ 的**边界** $\partial T$ 是对 $(k-1)$-形式 $\omega$ 定义的分布：$\partial T(\omega) = T(d\omega)$。

**定义 249.5**（整系数平坦链 / Integral Flat Chain）：整系数平坦链是整系数整流链和边界为整流链的整系数整流链之和的 $L^1_{\text{loc}}$ 极限。整系数平坦链空间对于变分法非常重要（适合取极限）。

### 249.3 等周不等式与 Sobolev 不等式

**定理 249.2**（De Giorgi 等周不等式，1958）：对任何 $n$ 维（$n \geq 2$）整系数整流链 $T$ 满足 $\partial T = 0$ 且紧支撑，存在 $n+1$ 维整系数整流链 $S$ 满足 $\partial S = T$ 且
$$\mathbf{M}(S)^{n/(n+1)} \leq C_n \mathbf{M}(T)$$
其中 $C_n$ 是仅依赖于 $n$ 的常数。

更精确的等周不等式的几何测度论版本是 Plateau 问题解的基础。


**证明**：设 $T$ 为 $n$ 维整系数整流链，$\partial T=0$。De Giorgi 使用 $T$ 的锥构造：对 $T$ 的支撑集中任意点 $p$，作锥 $C_p(T)=\bigcup_{x\in\operatorname{spt} T}[p,x]$。$\partial C_p(T)=T$（模去删去含 $p$ 的退化部分）。Federer-Fleming 证明 $\mathbf{M}(C_p(T))\le \frac{R}{n+1}\mathbf{M}(T)$，其中 $R=\operatorname{spt}(T)$ 的直径。这是 De Giorgi 等周不等式的核心估计：对于支撑直径为 $R$ 的 $n$-圈 $T$，存在 $S$ 填充 $T$（$\partial S=T$）满足 $\mathbf{M}(S)\le c_n \mathbf{M}(T)^{(n+1)/n}$，常数 $c_n$ 仅依赖 $n$。$\blacksquare$

De Giorgi 的等周不等式是几何测度论中第一个一般性结果，它给出了以任意整系数整流链为边界的广义曲面面积的下界。然而，De Giorgi 的证明依赖于锥构造技术，其常数并非最优。Federer 和 Fleming 随后引入了一种全新的证明策略——变形定理——从根本上改进了等周不等式的证明。变形定理的关键思想是将连续几何问题离散化：通过径向投影和 CW 结构，将任意整系数整流链挤压到网格骨架上，化为组合等周问题，再利用组合不等式得到最优常数 $\gamma_n = n^{-1} \omega_n^{-1/n}$。

**定理 249.3**（Federer-Fleming 等周不等式）：对 $n$ 维整系数整流链 $T$ 满足 $\partial T = 0$ 且紧支撑，存在 $n+1$ 维整系数整流链 $S$ 满足 $\partial S = T$ 且

$$\mathbf{M}(S)^{n/(n+1)} \leq \gamma \mathbf{M}(T)$$

其中 $\gamma$ 是仅依赖于 $n$ 的常数。


**证明**：Federer-Fleming 的证明使用变形定理（deformation theorem）：将 $T$ 挤压到某个胞腔复形的 $n$-骨架上，化为组合等周问题。变形过程中的质量控制由距离函数的径向投影实现。对挤压后的组合链应用离散等周不等式（每个 $n$-胞腔由其 $(n+1)$-胞腔填充），其解编码了几何等周常数。最优常数 $\gamma_{n}=n^{-1}\omega_n^{-1/n}$ 由等周不等式的球面极值情形给出（球是最优填充区域）。该不等式等价于 Sobolev 不等式 $\|f\|_{n/(n-1)}\le \gamma_n^{-1}\|\nabla f\|_1$ 的对偶形式。$\blacksquare$

等周不等式的变形定理证明漂亮地展示了离散化策略的威力，但它并未穷尽等周不等式与函数空间嵌入之间的关系。Federer-Fleming 等周不等式实际上等价于最优 Sobolev 嵌入不等式 $\|f\|_{L^{n/(n-1)}} \leq \gamma_n^{-1} \|\nabla f\|_{L^1}$。这一等价性的建立依赖于几何测度论的另一个基石——面积公式。面积公式将 Lipschitz 映射在低维曲面上的"拉伸"（Jacobian）与映射纤维的计数联系起来，本质上是积分变元替换公式在非一一映射和非满维情形下的推广。它是余面积公式的对偶，两者一起构成了几何测度论中坐标变换分析的基本工具。

**定理 249.4**（面积公式 / Area Formula）：设 $f: \mathbb{R}^m \to \mathbb{R}^n$ 是 Lipschitz 映射（$m \leq n$），则对任意 $\mathcal{L}^m$-可测集 $A \subset \mathbb{R}^m$，
$$\int_A J_m f(x) \, d\mathcal{L}^m(x) = \int_{\mathbb{R}^n} \mathcal{H}^0(A \cap f^{-1}(y)) \, d\mathcal{H}^m(y)$$
其中 $J_m f(x) = \sqrt{\det((Df(x))^T Df(x))}$ 是 $m$-维 Jacobian。


**证明**：对 Lipschitz 映射 $f:\mathbb{R}^m\to\mathbb{R}^n$（$m\le n$），$m$ 维 Jacobian $J_m f(x)=\sqrt{\det(Df(x)^T Df(x))}$（$Df$ 的 Rademacher 导数几乎处处存在）。将 $\mathbb{R}^m$ 按 $f$ 的纤维分层，在每个法纤维上使用 $m$ 维面积的参数化定义：$\mathcal{H}^m(f(A))=\int_A J_m f(x) d\mathcal{L}^m(x) + \mathcal{H}^m(\{y:|f^{-1}(y)\cap A|>1\})$（含重数）。当 $f$ 单射时简化为 $\int_A J_m f d\mathcal{L}^m$。将 $f$ 限制在 $\{x\in A: J_m f(x)>0\}$ 上并应用 Vitali 覆盖引理和 Lipschitz 常数的积分表示，得完整面积公式。$\blacksquare$

**定理 249.5**（余面积公式 / Coarea Formula）：设 $f: \mathbb{R}^n \to \mathbb{R}^m$ 是 Lipschitz 映射（$n \geq m$），则对任意 $\mathcal{L}^n$-可测集 $A \subset \mathbb{R}^n$，
$$\int_A J_m f(x) \, d\mathcal{L}^n(x) = \int_{\mathbb{R}^m} \mathcal{H}^{n-m}(A \cap f^{-1}(y)) \, d\mathcal{L}^m(y)$$

**证明**：对 Lipschitz 映射 $f: \mathbb{R}^n \to \mathbb{R}^m$（$n \geq m$），$m$ 维 Jacobian $J_m f(x) = \sqrt{\det(Df(x) Df(x)^T)}$ 由 Rademacher 定理几乎处处存在。核心思路：将 $f$ 分解为坐标分量，逐次应用 Fubini 定理。对 $C^1$ 映射，余面积公式为标准变量替换：$\int_A J_m f \, d\mathcal{L}^n = \int_{\mathbb{R}^m} \mathcal{H}^{n-m}(A \cap f^{-1}(y)) \, d\mathcal{L}^m(y)$。对 Lipschitz 映射，用光滑函数逼近 $f_\varepsilon \to f$，由面积公式保证 $J_m f_\varepsilon \to J_m f$ 在 $L^1$ 中，且 $\mathcal{H}^{n-m}$ 测度沿水平集的连续性（Federer 的余面积不等式）保证收敛。关键步骤：Lipschitz 函数的水平集 $\mathcal{H}^{n-m}$-可测性由 Whitney 延拓定理和 Sard 型定理保证。该公式是几何测度论中最通用的积分换元工具，推广了经典微积分中的变量替换公式。$\blacksquare$

---

---

---

---

---
