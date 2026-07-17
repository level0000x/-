# 卷二十三：随机过程与统计力学

## 第239章：自由概率论
自由概率论（Free Probability Theory）由 Voiculescu（1985-1990）创立，为随机矩阵提供了独立的非交换概率框架。

### 268.1 非交换概率空间

**定义 268.1**（非交换概率空间 / $C^*$-概率空间）：非交换概率空间是 $(\mathcal{A}, \tau)$，其中 $\mathcal{A}$ 是单位 $C^*$-代数，$\tau: \mathcal{A} \to \mathbb{C}$ 是单位保迹的线性泛函，满足 $\tau(1) = 1$ 且 $\tau(a^*a) \geq 0$（正性）。

**定义 268.2**（自由独立 / Free Independence）：$\mathcal{A}$ 的子代数族 $\{\mathcal{A}_i\}_{i \in I}$ 是**自由独立的**，如果对任意满足 $\tau(a_k) = 0$ 的非交换多项式 $a_1 \in \mathcal{A}_{i_1}, \ldots, a_k \in \mathcal{A}_{i_k}$（相邻指标不同 $i_1 \neq i_2 \neq \cdots \neq i_k$），有 $\tau(a_1 a_2 \cdots a_k) = 0$。

**定理 268.1**（自由独立 = 独立矩阵的极限行为，Voiculescu 1991）：若 $A_N$ 和 $B_N$ 是独立（经典意义上的独立）的 Wigner 矩阵序列，则它们在 $N \to \infty$ 极限下是自由独立的（在非交换概率空间中）。

### 268.2 自由卷积与 R-变换

**定义 268.3**（自由加法卷积 / Free Additive Convolution **$\boxplus$**）：若 $a, b$ 自由独立，其边缘分布的加法卷积 $\mu_a \boxplus \mu_b$ 定义为 $a+b$ 的分布。

**定义 268.4**（R-变换 / $R$-transform，Voiculescu 1986）：对概率测度 $\mu$，定义其 Cauchy 变换 $G_\mu(z) = \int \frac{d\mu(x)}{z - x}$（$z \in \mathbb{C}^+$）。$K_\mu(z) = G_\mu^{-1}(z)$（函数逆）。**R-变换**为
$$R_\mu(z) = K_\mu(z) - \frac{1}{z}$$

**定理 268.2**（R-变换的线性化性质）：若 $\mu = \mu_1 \boxplus \mu_2$，则
$$R_\mu(z) = R_{\mu_1}(z) + R_{\mu_2}(z)$$

即**自由卷积对应 R-变换的加法**——这是自由概率论的核心结果，类比经典卷积对应特征函数的乘积。对数 Fourier 变换的角色在此被 R-变换取代。

**例 268.1**（半圆律的 R-变换）：半圆律 $R(z) = z$。因此 $n$ 个自由独立的半圆律的 $\boxplus$ 卷积仍为半圆律（方差放大 $n$ 倍）——这解释了为什么 i.i.d. Wigner 矩阵之和的特征值分布可解析计算。

### 268.3 自由乘法卷积与 S-变换

**定义 268.5**（自由乘法卷积 / Free Multiplicative Convolution **$\boxtimes$**）：对正算子 $a, b$ 自由独立，$\mu_a \boxtimes \mu_b$ 定义为 $a^{1/2} b a^{1/2}$（或等价的 $ab$）的分布。

**定义 268.6**（S-变换 / S-transform）：对具有非零均值的正测度 $\mu$，$S_\mu(z)$ 满足 $\chi_\mu(z S_\mu(z)) = z$，其中 $\chi_\mu$ 是矩母函数的相关函数。自由乘法卷积对应 S-变换的乘法：$S_{\mu_1 \boxtimes \mu_2}(z) = S_{\mu_1}(z) S_{\mu_2}(z)$。

### 268.4 自由熵与自由 Fisher 信息

**定义 268.7**（自由熵 / Free Entropy，Voiculescu 1993-1998）：非交换随机变量 $X$ 的**自由熵** $\chi(X)$ 类比于经典 Shannon 微分熵，定义为近似矩阵模型的「微观态计数」的大偏差极限。自由熵满足自由信息论中的最大化原理：自由半圆变量最大化自由熵（给定方差约束）。

---

---

---

---

---

## 第240章：Tracy-Widom 分布与边缘统计
Tracy-Widom 分布是最大的随机矩阵特征值在适当尺度缩放下的极限分布，是随机矩阵理论中最重要的「新分布」之一。

### 269.1 Gaussian 系综

**定义 269.1**（Gaussian 系综 / GOE、GUE、GSE）：
- **GOE**（Gaussian Orthogonal Ensemble）：实对称矩阵 $H = H^T$，$h_{ii} \sim \mathcal{N}(0, 2)$，$h_{ij} \sim \mathcal{N}(0, 1)$（$i < j$）
- **GUE**（Gaussian Unitary Ensemble）：复 Hermitian 矩阵 $H = H^\dagger$，$\Re h_{ij}, \Im h_{ij} \sim \mathcal{N}(0, 1/2)$
- **GSE**（Gaussian Symplectic Ensemble）：描述自旋-轨道耦合系统

**定理 269.1**（GUE 的联合特征值分布）：GUE 矩阵的特征值联合概率密度为

$$p(\lambda_1, \ldots, \lambda_N) = \frac{1}{Z_N} \prod_{i < j} |\lambda_i - \lambda_j|^2 \prod_{i=1}^N e^{-\lambda_i^2 / 2}$$

其中 $|\lambda_i - \lambda_j|^2$ 是 Vandermonde 行列式的平方——表示特征值之间存在「排斥」效应（level repulsion）。

### 269.2 最大特征值与 Tracy-Widom 分布

**定理 269.2**（Tracy-Widom 分布，1994-1996）：设 $\lambda_{\max}$ 是 GUE（或 GOE/GSE）矩阵的最大特征值。经过适当缩放（中心化和标准化）后：

$$\frac{\lambda_{\max} - 2\sqrt{N}}{N^{-1/6}} \xrightarrow{d} F_\beta$$

其中 $F_\beta$ 是**Tracy-Widom 分布**（$\beta = 1$ 为 GOE，$\beta = 2$ 为 GUE，$\beta = 4$ 为 GSE）。$F_2$ 由 Painlevé II 方程的解定义：
$$F_2(s) = \exp\left( -\int_s^\infty (x - s) q^2(x) dx \right)$$

其中 $q(x)$ 满足 $\ddot{q} = x q + 2 q^3$（Painlevé II），边界条件 $q(x) \sim \operatorname{Ai}(x)$（$x \to \infty$）。

**定理 269.3**（Tracy-Widom 的普遍性）：最大特征值的 Tracy-Widom 极限对矩阵元素分布不敏感——只要元素的四阶矩是有限的（Soshnikov 1999，Erdos-Yau 等人的工作）。这是随机矩阵边缘普遍性（edge universality）的最重要结果。

### 269.3 Tracy-Widom 的惊人出现

Tracy-Widom 分布在随机矩阵理论之外也出现：
- 最长递增子序列的长度分布（Baik-Deift-Johansson 1999）：Ulam 问题的解
- KPZ 普适类（Kardar-Parisi-Zhang）：$(1+1)$ 维随机生长界面的涨落
- ASEP（非对称简单排它过程）中的涨落（Tracy-Widom 2007-2009）
- 二维渗流和随机三角剖分的极限界面形状

---

---

---

---

---

## 第241章：随机矩阵与自由概率的应用
随机矩阵理论在多个学科中有深刻应用——从数论到机器学习。

### 270.1 数论与 Riemann $\zeta$ 函数

**定理 270.1**（Montgomery 的 pair correlation 猜想，1973 / Odlyzko 数值验证 1987）：Riemann $\zeta$ 函数非平凡零点的配对相关函数（pair correlation function）与 GUE 随机矩阵特征值的配对相关函数一致：
$$R_2(\beta, x) = 1 - \left( \frac{\sin(\pi x)}{\pi x} \right)^2$$

这是 Hilbert-Pólya 猜想的证据——Riemann $\zeta$ 函数的零点可能是某个 Hermitian 算子的特征值。

**猜想 270.2**（Keating-Snaith 猜想，2000）：$L$-函数的矩与随机矩阵特征多项式的矩在 $T \to \infty$ 下一致，预测了 Riemann $\zeta$ 函数在临界线上 $\log|\zeta(1/2 + it)|$ 的高斯分布性质。

### 270.2 无线通信与高维统计

**定义 270.1**（MIMO 系统的信道容量，Telatar 1999 / Foschini 1996）：在 $n_t$ 发射天线、$n_r$ 接收天线的 MIMO 信道 $Y = H X + N$ 中（$H$ 为信道矩阵），当 $H$ 的元素为 i.i.d. Gauss，信道的遍历容量为
$$C = \mathbb{E}_H [\log \det(I + \rho H H^\dagger)]$$

其中 $\rho$ 是信噪比。Marchenko-Pastur 律给出了当 $n_t, n_r \to \infty$ 时信道容量近似。

**定义 270.2**（高维协方差估计 / 随机矩阵在统计中的应用）：对样本数 $n$ ≈ 维数 $p$ 的高维数据，Marchenko-Pastur 律描述了样本协方差矩阵特征值的分布偏差。这对主成分分析（PCA）的可靠性有直接影响——高维下的特征值估计不能用传统低维理论。

### 270.3 量子混沌与核物理

**定义 270.3**（Bohigas-Giannoni-Schmit 猜想，1984）：量子混沌系统的能级统计统计（nearest-neighbor spacing distribution）遵循适当对称类（GOE/GUE/GSE）的随机矩阵特征值间距分布（Wigner 猜忌 / Wigner surmise）：
$$P_{\text{GUE}}(s) = \frac{32}{\pi^2} s^2 e^{-4s^2 / \pi}$$

（$s$ 为间距除以平均间距）。

### 270.4 自由概率在算子代数中的应用

**定理 270.3**（Voiculescu 的自由群因子同构问题，1990s）：使用自由概率论，Voiculescu 证明了自由群 von Neumann 代数 $L(\mathbb{F}_n)$ 与 $L(\mathbb{F}_m)$（$n \neq m$）的非同构性在自由熵框架下可被区分。这解决了 von Neumann 代数领域的一个重大未解问题。

---

---

---

---

---

## 第242章：随机矩阵的现代发展
随机矩阵理论近二十年的突破集中在普遍性定理的严格证明（Erdos-Schlein-Yau 等人）和机器学习中的应用。

### 271.1 普遍性定理的严格证明

**定义 271.1**（Dyson Brown 运动与局部平衡）：将 Wigner 矩阵 $H$ 的特征值 $\lambda_i(t)$ 视为时间演化的 Dyson Brown 运动（$\lambda_i$ 间对数排斥力 + 噪声）。关键：Dyson Brown 运动在短时间达到局部平衡（local equilibrium），使得特征值间距的短距离统计普遍。

**定理 271.1**（Erdos-Schlein-Yau 的 Wigner-Dyson-Mehta 普遍性，2010-2013）：对任何满足适当矩条件的广义 Wigner 矩阵，其特征值的**局部统计**（local statistics）——包括相邻间距分布和 $k$-点相关函数——与 GUE/GOE 的对应统计在极限下一致。即 Tracy-Widom 边缘分布和 Wigner-Dyson 体（bulk）统计具有普遍性。

**定理 271.2**（Dyson 猜想 / 边缘隙分布，2020s）：对于矩阵边缘的最大特征值，Tracy-Widom 分布是普遍的。对于次最大特征值的隙分布也有类似的普遍性结果。

### 271.2 随机矩阵与机器学习

**定义 271.2**（随机神经网络 / Random Matrix Theory of Deep Learning）：深度神经网络的权值矩阵（随机初始化）的特征值分布影响梯度传播和训练动力学。Gaussian 权值网络的 Hessian 矩阵和 Fisher 信息矩阵的谱可用随机矩阵理论分析（Pennington-Worah 2017，Pennington-Schoenholz-Ganguli 2017-2018）。

**定理 271.3**（双下降现象 / Double Descent，Belkin-Hsu-Ma-Mandal 2019 / 随机矩阵解释）：当模型参数数超过训练样本数时，测试误差出现双下降（插值阈值后再次下降）。随机矩阵理论解释了这一现象——过参数化后的最小范数解（伪逆）比恰好在插值阈值处的解具有更小的方差。

### 271.3 稀疏随机矩阵与稀疏 Wigner

**定义 271.3**（稀疏 Wigner 矩阵 / Erdős-Rényi 矩阵）：Wigner 矩阵的每个元素以概率 $p = d/N$ 非零（$d$ 为平均度）。当 $d \to \infty$ 但 $d/N \to 0$ 时，谱分布偏离半圆律，边缘出现离群特征值。

**定理 271.4**（稀疏 Wigner 谱的过渡）：稀疏 Wigner 矩阵的谱在 $d \gg 1$ 时接近半圆，在 $d$ 有限时呈现更尖锐的峰。存在从稀疏谱到稠密半圆谱的连续过渡。

---

---

---

---

---

## 第243章：圆律与Stieltjes变换方法
Wigner 半圆律刻画了对称（自伴）随机矩阵的谱极限。对于非 Hermitian 随机矩阵（元素独立，矩阵不对称），谱的极限分布完全不同——所有特征值在复平面上均匀分布在单位圆盘内。这就是**圆律**（Circular Law）。Stieltjes 变换方法是研究随机矩阵谱分布的严格解析框架。

### 272.1 非Hermitian矩阵与圆律

**定义 272.1**（i.i.d. 矩阵系综）：设 $X_N$ 是 $N \times N$ 复矩阵，所有元素 $x_{ij}$ 是 i.i.d. 复随机变量，满足 $\mathbb{E}[x_{ij}] = 0$，$\mathbb{E}[|x_{ij}|^2] = 1/N$。$X_N$ 的特征值 $\lambda_i \in \mathbb{C}$（复数，一般不对称）的经验谱分布是 $\mu_N = \frac{1}{N} \sum_{i=1}^N \delta_{\lambda_i}$。

**定理 272.1**（圆律，Girko 1984 / Bai 1997 / Tao-Vu 2010 完全证明）：对上述非 Hermitian i.i.d. 矩阵（方差 $1/N$），当 $N \to \infty$ 时，经验谱分布 $\mu_N$ 几乎必然弱收敛到复平面单位圆盘上的均匀分布：
$$d\mu_{\text{circ}}(z) = \frac{1}{\pi} \mathbf{1}_{|z| \leq 1} \, dx \, dy \quad (z = x + iy)$$

*历史与证明的演进*：Girko（1984）提出了圆律的 Hermitization 方法——将非 Hermitian 矩阵 $X_N$ 的研究转化为研究 Hermitian 矩阵 $\begin{pmatrix} 0 & X_N - zI \\ X_N^* - \bar{z}I & 0 \end{pmatrix}$ 的谱，但其证明存在漏洞。Bai（1997）在元素四阶矩有限条件下完成了严格证明。Tao-Vu（2010）用随机矩阵理论的普遍性方法将条件减弱到二阶矩有限，完成了圆律的"普遍性"证明（即不依赖元素分布细节）。

### 272.2 Stieltjes变换与Hermitization方法

**定义 272.2**（Stieltjes 变换）：对 $\mathbb{R}$ 上的概率测度 $\mu$，其 **Stieltjes 变换**（或称 Cauchy 变换）定义为
$$s_\mu(z) = \int_{\mathbb{R}} \frac{d\mu(x)}{x - z}, \quad z \in \mathbb{C}^+ = \{z : \Im z > 0\}$$

Stieltjes 变换是研究谱分布的基本解析工具，其关键性质如下。

**命题 272.1**（Stieltjes 变换的基本性质）：
1. $s_\mu(z)$ 在 $\mathbb{C}^+$ 上解析，且 $\Im s_\mu(z) \geq 0$（Nevanlinna 函数）
2. **反演公式**（Stieltjes-Perron）：$\mu$ 可经 $s_\mu$ 恢复：$\mu((a,b)) = \lim_{\epsilon \to 0^+} \frac{1}{\pi} \int_a^b \Im s_\mu(x + i\epsilon) \, dx$（$\mu$ 的密度是 $\frac{1}{\pi} \Im s_\mu(x + i0)$）
3. 设 $\mu_N$ 弱收敛到 $\mu$，当且仅当对所有 $z \in \mathbb{C}^+$，$s_{\mu_N}(z) \to s_\mu(z)$

**定理 272.2**（半圆律的 Stieltjes 变换推导）：对 Wigner 矩阵 $H_N$，谱分布 $\mu_N$ 的 Stieltjes 变换 $s_N(z) = \frac{1}{N} \operatorname{Tr}((H_N - zI)^{-1})$ 在 $N \to \infty$ 下满足自洽方程（self-consistent equation）：
$$s(z) = -\frac{1}{z + s(z)}$$
解得 $s(z) = \frac{-z + \sqrt{z^2 - 4}}{2}$（平方根分支取使 $\Im s(z) > 0$ 者），其反演给出半圆律密度。这比矩法更简洁——无需计算 Catalan 数。

### 272.3 自由概率论与Stieltjes变换

**定义 272.3**（Stieltjes 变换与 R-变换的关系）：$R_\mu(z) = K_\mu(z) - 1/z$，其中 $K_\mu$ 是 $G_\mu(z) = -s_\mu(z)$ 的泛函逆。R-变换在自由卷积下的线性性使 Stieltjes 变换成为计算独立随机矩阵之和（在自由独立极限下）的谱分布的基本工具。

**定理 272.3**（圆律的 Hermitization 证明概要）：对非 Hermitian $X_N$，定义 $2N \times 2N$ Hermitian 矩阵
$$H^z_N = \begin{pmatrix} 0 & X_N - zI_N \\ (X_N - zI_N)^* & 0 \end{pmatrix}$$
其 Stieltjes 变换满足与 $z$ 相关的矩阵方程。通过 Stieltjes 变换的偏微分方程，可以将 $\mu_N$ 的复对数势（logarithmic potential）与 $H^z_N$ 的 Stieltjes 变换联系起来。取极限 $N \to \infty$，对数势在单位圆盘内满足 Poisson 方程 $\Delta \Phi = -4$（圆盘外 $\Delta \Phi = 0$），由唯一性给出圆盘上的均匀分布（圆律）。

---

---

---

---

---

## 第244章：行列式点过程与$\beta$系综
随机矩阵的特征值构成具有排斥相互作用的经典粒子系统。**行列式点过程**（Determinantal Point Process, DPP）框架统一了经典 Gaussian 系综的相关函数结构，而 **$\beta$系综**（$\beta$-ensemble）推广到任意排斥强度——将随机矩阵从经典值 $\beta = 1, 2, 4$ 拓展为一般的逆温度参数。

### 273.1 行列式点过程

**定义 273.1**（行列式点过程）：$\mathbb{R}$ 上具有相关核 $K(x, y)$ 的**行列式点过程**是一个点过程（随机点集），其 $k$-点相关函数（joint intensity）为
$$\rho_k(x_1, \ldots, x_k) = \det[K(x_i, x_j)]_{1 \leq i,j \leq k}$$

**定理 273.1**（GUE 是行列式点过程）：GUE 矩阵的特征值构成一个行列式点过程，其相关核为
$$K_N(x, y) = \sum_{k=0}^{N-1} \varphi_k(x) \varphi_k(y)$$
其中 $\varphi_k(x) = \frac{1}{\sqrt{2^k k! \sqrt{\pi}}} H_k(x) e^{-x^2/2}$ 是归一化 Hermite 函数（$H_k$ 为 Hermite 多项式）。由 Christoffel-Darboux 公式：
$$K_N(x, y) = \sqrt{N} \frac{\varphi_N(x) \varphi_{N-1}(y) - \varphi_{N-1}(x) \varphi_N(y)}{x - y}$$

**推论 273.1**（间距分布与 Fredholm 行列式）：GUE 特征值在一个区间内没有点的概率（gap probability）为
$$\mathbb{P}(I \text{ 内无特征值}) = \det(I - K_N|_I)$$
其中 $\det(I - K_N|_I)$ 是 $L^2(I)$ 上积分算子 $K_N|_I$ 的 Fredholm 行列式。这是 Tracy-Widom 分布可通过 Painlevé II 表达的核心原因——Fredholm 行列式与完全可积系统有深刻的联系（Its-Izergin-Korepin-Slavnov 方法）。

**定理 273.2**（Sine 核普遍性，Gaudin-Mehta / Erdos-Yau 严格化）：GUE 特征值在体（bulk）极限下的局部相关核收敛到 **Sine 核**：
$$K_{\text{sine}}(x, y) = \frac{\sin(\pi(x - y))}{\pi(x - y)}$$
GUE 的体间距分布由 Sine 核的 Fredholm 行列式给出（Gaudin 分布）。

**定义 273.2**（Airy 核与 Tracy-Widom 的 Fredholm 行列式表示）：在谱的边缘（最大特征值附近），缩放后的相关核收敛到 **Airy 核**：
$$K_{\text{Airy}}(x, y) = \frac{\operatorname{Ai}(x) \operatorname{Ai}'(y) - \operatorname{Ai}'(x) \operatorname{Ai}(y)}{x - y}$$
Tracy-Widom 分布 $F_2(s)$ 由 Airy 核在 $(s, \infty)$ 上的 Fredholm 行列式给出：
$$F_2(s) = \det(I - K_{\text{Airy}}|_{(s, \infty)})$$

### 273.2 $\beta$系综与对数气体

**定义 273.3**（$\beta$系综 / 对数气体）：$\mathbb{R}$ 上 $N$ 个粒子的 **$\beta$系综**（$\beta$-ensemble）概率密度为
$$p(\lambda_1, \ldots, \lambda_N) = \frac{1}{Z_{N, \beta}} \prod_{i < j} |\lambda_i - \lambda_j|^\beta \prod_{i=1}^N e^{-N V(\lambda_i)}$$
其中 $V$ 是势函数（confining potential），$\beta > 0$ 是逆温度参数：
- $\beta = 1$：对应于实对称（GOE）特征值
- $\beta = 2$：对应于复 Hermitian（GUE）特征值
- $\beta = 4$：对应于辛（GSE）特征值
- $\beta$ 为一般值：不再对应具体矩阵系综，但作为对数相互作用的粒子系统仍具有良好的数学结构

**定理 273.3**（$\beta$系综的宏观极限分布，Ben Arous-Guionnet 1997 / 大偏差理论）：$\beta$系综的经验测度 $\mu_N = \frac{1}{N} \sum \delta_{\lambda_i}$ 在 $N \to \infty$ 下几乎必然收敛到势 $V$ 决定的平衡测度 $\mu_V$（极小化能量泛函 $\mathcal{E}(\mu) = \iint \log|x-y|^{-1} d\mu(x) d\mu(y) + \int V(x) d\mu(x)$）。当 $V(x) = x^2/2$（Gauss 势），$\mu_V$ 是半圆律；此结果对任意 $\beta > 0$ 成立，不限于经典值。

**定理 273.4**（$\beta$系综的 Tracy-Widom 普遍性，Ramirez-Rider-Virág 2011 / Bourgade-Erdos-Yau 2014）：对任意固定的 $\beta > 0$，$\beta$系综的最大特征值（经适当缩放）收敛到 **$\beta$-Tracy-Widom 分布** $F_\beta$。其边界条件为随机 Schrödinger 算子（随机 Airy 算子 $\mathcal{A}_\beta = -\frac{d^2}{dx^2} + x + \frac{2}{\sqrt{\beta}} B'(x)$，其中 $B(x)$ 是标准 Brown 运动）的基态能量的分布。

**定理 273.5**（对数气体与 Selberg 积分）：$\beta$系综的配分函数 $Z_{N, \beta}$ 是（当势 $V$ 为某类特殊函数时）可精确计算的。经典结果：**Selberg 积分**
$$\int_{[0,1]^N} \prod_{i<j} |t_i - t_j|^{2\gamma} \prod_{i=1}^N t_i^{\alpha-1} (1-t_i)^{\beta-1} dt_i = \prod_{j=0}^{N-1} \frac{\Gamma(\alpha + j\gamma) \Gamma(\beta + j\gamma) \Gamma(1 + (j+1)\gamma)}{\Gamma(\alpha + \beta + (N+j-1)\gamma) \Gamma(1 + \gamma)}$$
Selberg 积分是 $\beta$系综和随机矩阵理论中许多精确公式的源头。

### 273.3 随机矩阵的普遍性层级

**定理 273.6**（普遍性层级总结）：随机矩阵谱统计的普遍性分三个层级：
1. **宏观普遍性**（global / macroscopic）：极限谱分布（如半圆律）对元素分布不敏感——只需二阶矩有限
2. **体普遍性**（bulk universality）：局部相关函数在谱的内部收敛到 Sine 核——需要四阶矩有限（Erdos-Schlein-Yau）
3. **边缘普遍性**（edge universality）：最大特征值的 Tracy-Widom 极限——需要四阶矩有限（Soshnikov 1999，Tao-Vu 2010）

所有三个层级现已被严格证明，构成了随机矩阵理论最深刻的结构定理。

---

*本卷在概率论 II（V21）和线性代数（V7）的基础上，系统建立了 Wigner 半圆律与普遍性、自由概率论、Tracy-Widom 分布与边缘统计、随机矩阵跨学科应用和现代发展的数学理论。共 7 章。*

---

---

---

---

---

## 第245章（补充）
> 随机分析是随机过程与数学分析的深度交叉领域，以 Itô 积分理论为核心，研究受随机扰动影响的系统。本卷建立在概率论（V6）、概率论 II（V21）和测度论（V9）的基础上，系统建立 Itô 积分、随机微分方程（SDE）、扩散过程、Malliavin 分析和随机偏微分方程（SPDE）的理论。随机分析在现代金融数学（Black-Scholes 模型）、物理学（统计力学、量子场论）、生物学（种群动力学）和工程（信号处理）中有广泛应用。

---

---

---

---

---

## 第246章：Itô 积分与随机积分
Itô 积分是随机分析的核心构造，由 Itô 在 1944 年建立。与 Riemann-Stieltjes 积分不同，被积函数在左端点取值（而非任意点），使得积分成为鞅，这在理论和应用中都至关重要。

### 135.1 Brown 运动与连续鞅

**定义 135.1**（Brown 运动）：随机过程 $(W_t)_{t \geq 0}$ 是**标准 Brown 运动**（Wiener 过程），如果：
（1）$W_0 = 0$ a.s.
（2）增量独立性：对 $0 \leq s < t$，$W_t - W_s$ 与 $\sigma(W_u: u \leq s)$ 独立
（3）正态增量：$W_t - W_s \sim N(0, t-s)$
（4）连续性：$t \mapsto W_t$ a.s. 连续

**定理 135.1**（Brown 运动的性质）：
- 样本路径 a.s. 连续但处处不可微
- 二次变差：$[W, W]_t = \lim_{\|\Pi\| \to 0} \sum_i (W_{t_{i+1}} - W_{t_i})^2 = t$
- 尺度变换：$(c^{-1/2} W_{ct})$ 是 Brown 运动
- 时间反演：$(t W_{1/t})$（补充 $0$ at $t=0$）是 Brown 运动

**定理 135.2**（Kolmogorov 连续性准则）：若对某 $\alpha, \beta > 0$，$E[|X_t - X_s|^\alpha] \leq C |t-s|^{1+\beta}$，则 $X_t$ 有连续版本。对 Brown 运动，$E[(W_t - W_s)^4] = 3(t-s)^2$（$\alpha = 4, \beta = 1$）。

**定理 135.3**（鞅性质）：以下关于 Brown 运动自然滤子 $\mathcal{F}_t = \sigma(W_s: s \leq t)$ 都是鞅：
- $W_t$（martingale）
- $W_t^2 - t$（平方变差补偿）
- $\exp(\lambda W_t - \lambda^2 t/2)$（指数鞅）

### 135.2 Itô 积分的构造

**定义 135.2**（简单过程的 Itô 积分）：对简单过程 $H_t = \sum_{i=0}^{n-1} H_{t_i} 1_{[t_i, t_{i+1})}(t)$（其中 $H_{t_i}$ 是 $\mathcal{F}_{t_i}$-可测且平方可积），定义

$$I(H) = \sum_{i=0}^{n-1} H_{t_i} (W_{t_{i+1}} - W_{t_i})$$

**定理 135.4**（Itô 等距）：$$E[(I(H))^2] = E\left[\int_0^T H_t^2 dt\right]$$

*证明*：设 $\Delta W_i = W_{t_{i+1}} - W_{t_i}$。展开 $E[(I(H))^2] = E[\sum_{i,j} H_{t_i} H_{t_j} \Delta W_i \Delta W_j]$。当 $i \neq j$，不妨设 $i < j$，则 $E[H_{t_i} H_{t_j} \Delta W_i \Delta W_j] = E[H_{t_i} H_{t_j} \Delta W_i E[\Delta W_j | \mathcal{F}_{t_j}]] = 0$（因 $\Delta W_j$ 与 $\mathcal{F}_{t_j}$ 独立且均值为 0）。对角项：$E[H_{t_i}^2 (\Delta W_i)^2] = E[H_{t_i}^2 E[(\Delta W_i)^2 | \mathcal{F}_{t_i}]] = E[H_{t_i}^2 (t_{i+1} - t_i)] = E[\int_{t_i}^{t_{i+1}} H_t^2 dt]$。求和即得。∎

**定义 135.3**（一般 Itô 积分）：对满足 $\int_0^T H_t^2 dt < \infty$ a.s. 且 $H_t$ 是适应过程的 $H$，存在简单过程序列 $H^{(n)} \to H$（在 $L^2(\Omega \times [0,T])$ 中），定义

$$\int_0^T H_t dW_t = L^2\text{-}\lim_{n \to \infty} I(H^{(n)})$$

**性质 135.5**：Itô 积分 $\int_0^t H_s dW_s$ 是连续的 $L^2$-鞅，二次变差 $\left[\int H dW, \int H dW\right]_t = \int_0^t H_s^2 ds$。

### 135.3 Itô 公式

**定理 135.6**（Itô 公式，一维）：设 $f \in C^2$ 和 $X_t$ 是 Itô 过程 $dX_t = \mu_t dt + \sigma_t dW_t$。则

$$df(X_t) = f'(X_t) dX_t + \frac{1}{2} f''(X_t) \sigma_t^2 dt$$

等价地：

$$f(X_t) - f(X_0) = \int_0^t f'(X_s) dX_s + \frac{1}{2} \int_0^t f''(X_s) \sigma_s^2 ds$$

*证明概要*：对 $f(X_{t_{i+1}}) - f(X_{t_i})$ 做 Taylor 展开至二阶：
$$f(X_{t_{i+1}}) - f(X_{t_i}) = f'(X_{t_i}) \Delta X_i + \frac{1}{2} f''(X_{t_i}) (\Delta X_i)^2 + o((\Delta X_i)^2)$$
求和取极限。关键点是 $(\Delta X_i)^2 \approx \sigma_{t_i}^2 \Delta t_i$（因为 $(dW_t)^2 = dt$），而 $(\Delta t_i)^2$ 和 $(\Delta t_i)(\Delta W_i)$ 在极限下消失。∎

**定理 135.7**（Itô 公式，多维）：设 $f(t, x_1, \ldots, x_d) \in C^{1,2}$，$X^i_t$ 是 Itô 过程，$dX^i_t = \mu^i_t dt + \sum_{j=1}^m \sigma^{ij}_t dW^j_t$。则

$$df(t, X_t) = \frac{\partial f}{\partial t} dt + \sum_{i=1}^d \frac{\partial f}{\partial x_i} dX^i_t + \frac{1}{2} \sum_{i,j=1}^d \frac{\partial^2 f}{\partial x_i \partial x_j} d\langle X^i, X^j \rangle_t$$

其中 $d\langle X^i, X^j \rangle_t = \sum_{k=1}^m \sigma^{ik}_t \sigma^{jk}_t dt$。

**例 135.1**（几何 Brown 运动）：对 $dS_t = \mu S_t dt + \sigma S_t dW_t$（$S_0 > 0$），取 $f(x) = \log x$，$f'(x) = 1/x$，$f''(x) = -1/x^2$。由 Itô 公式：

$$d(\log S_t) = \frac{1}{S_t} dS_t - \frac{1}{2} \frac{1}{S_t^2} \sigma^2 S_t^2 dt = (\mu - \sigma^2/2) dt + \sigma dW_t$$

积分得 $S_t = S_0 \exp((\mu - \sigma^2/2)t + \sigma W_t)$。

### 135.4 Girsanov 定理与测度变换

**定理 135.8**（Girsanov 定理）：设 $\theta_t$ 是适应过程，满足 Novikov 条件 $E[\exp(\frac{1}{2} \int_0^T \theta_t^2 dt)] < \infty$。定义

$$Z_t = \exp\left(\int_0^t \theta_s dW_s - \frac{1}{2} \int_0^t \theta_s^2 ds\right)$$

在概率测度 $\tilde{P}$（$d\tilde{P}|_{\mathcal{F}_T} = Z_T dP$）下，过程

$$\tilde{W}_t = W_t - \int_0^t \theta_s ds$$

是 $\tilde{P}$-Brown 运动。

*应用*：Girsanov 定理是金融数学中风险中性定价的基础。它允许通过概率测度的变换消除漂移项，将任何等价测度下的 Itô 过程转化为鞅。

**定理 135.9**（鞅表示定理）：设 $M_t$ 是关于 Brown 运动滤子的 $L^2$-鞅。则存在唯一的适应过程 $H_t$（$\int_0^T H_t^2 dt < \infty$ a.s.）使得

$$M_t = M_0 + \int_0^t H_s dW_s$$

---

---

---

---

---

## 第247章：随机微分方程
随机微分方程（SDE）描述受随机噪声影响的动力系统，形如

$$dX_t = b(t, X_t) dt + \sigma(t, X_t) dW_t$$

其中 $b$ 是漂移系数，$\sigma$ 是扩散系数。

**定理 136.1**（存在唯一性定理）：设 $b, \sigma: [0,T] \times \mathbb{R}^n \to \mathbb{R}^n$（$\sigma$ 矩阵值）满足 Lipschitz 条件

$$|b(t,x) - b(t,y)| + |\sigma(t,x) - \sigma(t,y)| \leq K |x-y|$$

和线性增长条件 $|b(t,x)|^2 + |\sigma(t,x)|^2 \leq K(1+|x|^2)$。则 SDE

$$X_t = X_0 + \int_0^t b(s, X_s) ds + \int_0^t \sigma(s, X_s) dW_s$$

存在唯一的连续适应解且 $\sup_t E[|X_t|^2] < \infty$。

*证明思路*：使用 Picard 迭代 $X^{(0)}_t = X_0$，$X^{(n+1)}_t = X_0 + \int_0^t b(s, X^{(n)}_s) ds + \int_0^t \sigma(s, X^{(n)}_s) dW_s$。利用 Itô 等距和 Lipschitz 条件证明 $E[\sup_s |X^{(n+1)}_s - X^{(n)}_s|^2] \leq C T^n/n!$，由 Banach 不动点定理得证。∎

### 136.2 Feynman-Kac 公式

**定理 136.2**（Feynman-Kac 公式）：设 $u(t,x)$ 是偏微分方程

$$\frac{\partial u}{\partial t} + \mathcal{L} u - r u = 0, \quad u(T,x) = f(x)$$

的解，其中 $\mathcal{L} = \frac{1}{2}\sigma^2(x) \frac{\partial^2}{\partial x^2} + b(x) \frac{\partial}{\partial x}$ 是扩散过程的生成元。则

$$u(t,x) = E\left[e^{-r(T-t)} f(X_T) \mid X_t = x\right]$$

其中 $X_t$ 是 SDE $dX_s = b(X_s) ds + \sigma(X_s) dW_s$ 的解。

*应用*：Feynman-Kac 公式将 PDE 的求解转化为随机过程的期望计算，是金融衍生品定价（Black-Scholes PDE）的数学基础。

### 136.3 Markov 性与强 Markov 性

**定理 136.3**（扩散过程的 Markov 性）：Lipschitz 条件下 SDE 的解是 Markov 过程，即

$$E[f(X_t) \mid \mathcal{F}_s] = E[f(X_t) \mid X_s] \quad (s < t)$$

且具有 Feller 性质：转移半群 $P_t f(x) = E[f(X_t) \mid X_0 = x]$ 将连续有界函数映为连续有界函数。

**定理 136.4**（Dynkin 公式）：设 $\mathcal{L}$ 是扩散过程 $X_t$ 的生成元，$\tau$ 是停时且 $E[\tau] < \infty$，则

$$E[f(X_\tau)] = f(x) + E\left[\int_0^\tau \mathcal{L}f(X_s) ds\right]$$

这是 Itô 公式的直接推论，用于研究扩散过程的平均首达时间等问题。

### 136.4 扩散过程的构造与 Kolmogorov 方程

**定理 136.5**（Kolmogorov 前向方程 / Fokker-Planck 方程）：扩散过程 $X_t$ 的概率密度 $p(t,x)$（若存在）满足

$$\frac{\partial p}{\partial t} = -\frac{\partial}{\partial x}(b p) + \frac{1}{2} \frac{\partial^2}{\partial x^2}(\sigma^2 p) = \mathcal{L}^* p$$

其中 $\mathcal{L}^*$ 是生成元 $\mathcal{L}$ 的伴随。

---

---

---

---

---

## 第248章：Malliavin 分析
Malliavin 分析（Malliavin 计算）是无穷维空间上的微分分析，由 Paul Malliavin 在 1970 年代建立，其初始动机是证明 Hörmander 亚椭圆性定理的概率方法。它在随机分析中的地位相当于 Sobolev 理论在 PDE 中的地位。

### 137.1 Wiener 混沌分解

**定理 137.1**（Wiener-Itô 混沌分解）：任意 $L^2(\Omega, \mathcal{F}, P)$ 的泛函 $F$（其中 $\mathcal{F} = \sigma(W_t: t \in  [0,T])$）可唯一分解为正交和：

$$F = \sum_{n=0}^{\infty} I_n(f_n)$$

其中 $I_n$ 是 $n$ 重 Itô-Wiener 积分（关于 Brown 运动），$f_n \in L^2([0,T]^n)$ 是对称函数。

### 137.2 Malliavin 导数

**定义 137.2**（Malliavin 导数）：对光滑随机变量 $F = f(W_{t_1}, \ldots, W_{t_n})$（$f \in C_p^\infty(\mathbb{R}^n)$——光滑且多项式增长），其 Malliavin 导数为

$$D_t F = \sum_{i=1}^n \frac{\partial f}{\partial x_i}(W_{t_1}, \ldots, W_{t_n}) 1_{[0, t_i)}(t)$$

它是 $L^2([0,T] \times \Omega)$ 中取值的过程。

**定义 137.3**（Sobolev 空间 $\mathbb{D}^{1,2}$）：通过闭包

$$\|F\|_{\mathbb{D}^{1,2}}^2 = E[|F|^2] + E\left[\int_0^T |D_t F|^2 dt\right]$$

定义的完备化空间。

**命题 137.2**（基本性质）：
- **链式法则**：$D_t(\varphi(F)) = \varphi'(F) D_t F$（$\varphi \in C^1$）
- **分部积分**（Skorohod 积分的伴随性）：$E[F \delta(u)] = E[\int_0^T D_t F \cdot u_t dt]$
- **Clark-Ocone 公式**：$F = E[F] + \int_0^T E[D_t F \mid \mathcal{F}_t] dW_t$

### 137.3 Skorohod 积分

**定义 137.4**（Skorohod 积分）：$u \in L^2([0,T] \times \Omega)$ 的 Skorohod 积分 $\delta(u)$ 是 Malliavin 导数 $D$ 的伴随算子：

$$E[\langle D F, u \rangle_{L^2([0,T])}] = E[F \delta(u)]$$

Skorohod 积分是 Itô 积分的推广：当 $u$ 是适应过程时，$\delta(u) = \int_0^T u_t dW_t$（Itô 积分）；当 $u$ 不是适应过程（例如可预期/anticipating 积分）时，Skorohod 积分给出有意义的推广。

### 137.4 Malliavin 亚椭圆性定理

**定理 137.3**（Hörmander 条件）：对 SDE $dX_t = V_0(X_t) dt + \sum_{i=1}^m V_i(X_t) \circ dW^i_t$（Stratonovich 形式），若向量场族 $\{V_1, \ldots, V_m\}$ 及其所有 Lie 括号在每点 span 整个切空间（Hörmander 条件），则 $X_t$ 有光滑密度。

*Malliavin 证明的思路*：将密度的光滑性归结为 Malliavin 协方差矩阵 $\gamma_{ij} = \langle D X_t^{(i)}, D X_t^{(j)} \rangle_{L^2([0,T])}$ 的矩的衰减，进而通过分部积分公式建立密度的正则性。

---

---

---

---

---

## 第249章：随机偏微分方程（SPDE）
随机偏微分方程研究受随机扰动影响的无穷维动力系统，是随机分析与 PDE 理论的交叉前沿。

### 138.1 基本概念与分类

**定义 138.1**（SPDE 的一般形式）：

$$\frac{\partial u}{\partial t} = \mathcal{L} u + f(u) + \sigma(u) \xi(t,x)$$

其中 $\mathcal{L}$ 是（椭圆）空间微分算子，$\xi(t,x)$ 是时空白噪声（$\delta$-相关）。SPDE 的分类：（1）**半线性**——$\sigma(u)$ 不依赖于导数；（2）**拟线性**——噪声系数依赖于导数；（3）**完全非线性**——最高阶导数进入噪声项。

### 138.2 时空白噪声与随机卷积

**定义 138.2**（时空白噪声）：$\mathbb{R}_+ \times \mathbb{R}^d$ 上的 Gauss 随机场 $\xi(t,x)$，满足

$$E[\xi(t,x)] = 0, \quad E[\xi(t,x)\xi(s,y)] = \delta(t-s)\delta(x-y)$$

当 $d \geq 2$ 时，$\xi$ 不能定义在经典的函数空间上——它是 Schwartz 分布而非函数。这是 SPDE 理论复杂性的根本来源。

**定理 138.1**（随机卷积）：对线性 SPDE $\partial_t u = \Delta u + \xi$，其温和解为

$$u(t,x) = \int_{\mathbb{R}^d} G(t, x-y) u_0(y) dy + \int_0^t \int_{\mathbb{R}^d} G(t-s, x-y) \xi(s,y) dy ds$$

其中 $G$ 是热核。当 $d=1$ 时，$u(t, \cdot)$ 是 a.s. 连续函数（Hölder $\alpha < 1/2$）；$d=2$ 时是 a.s. 连续分布（Hölder $\alpha < 0$）；$d \geq 3$ 时需要用重整化。

### 138.3 Hairer 的正则性结构理论

Martin Hairer 在 2014 年以正则性结构理论获得 Fields 奖，该理论为驱动是非正则噪声（如时空白噪声）的非线性 SPDE 提供了系统化的分析框架。

**定理 138.2**（KPZ 方程的适定性）：Kardar-Parisi-Zhang 方程

$$\partial_t h = \partial_x^2 h + (\partial_x h)^2 + \xi$$

在 Hairer 的正则性结构框架下是局部适定的。这一结果解决了 KPZ 方程自 1986 年提出以来长期悬而未决的数学适定性问题。

**核心思想**：正则性结构将非线性 SPDE 的解表示为正则性结构中的模型作用在"装饰树"（decorated trees）的展开式上；通过重整化消除发散（类似于量子场论中的 Wilson 重整化），建立解的正则性估计和连续性。

---

---

---

---

---

## 第250章：随机几何与 Lévy 过程
### 139.1 Schramm-Loewner 演化（SLE）

**定义 139.1**（Loewner 方程）：设 $\gamma: [0,\infty) \to \overline{\mathbb{H}}$（上半平面）是简单曲线，$\gamma(0)=0$。令 $g_t: \mathbb{H} \setminus \gamma[0,t] \to \mathbb{H}$ 是 Riemann 映照（标准化为 $g_t(z) \sim z + 2a_t/z + \cdots$）。$g_t$ 满足 Loewner 方程：

$$\frac{\partial}{\partial t} g_t(z) = \frac{2}{g_t(z) - U_t}$$

其中 $U_t = g_t(\gamma(t))$ 是驱动函数。

**定义 139.2**（SLE$_\kappa$）：当驱动函数取为 $U_t = \sqrt{\kappa} W_t$（Brown 运动的缩放）时，对应的随机曲线称为 SLE$_\kappa$（Schramm-Loewner Evolution）。

**定理 139.1**（SLE 的相变）：
- $0 < \kappa \leq 4$：曲线是简单的且不自交（dilute 相）
- $4 < \kappa < 8$：曲线自交但不填充平面（dense 相）
- $\kappa \geq 8$：曲线是空间填充的

**定理 139.2**（SLE 与统计物理的关系）：SLE 被推测（许多已被证明）描述了平面统计力学模型在临界点处的缩放极限：
- SLE$_2$：loop-erased random walk
- SLE$_3$：Ising 模型的界面（critical Ising）
- SLE$_4$：Gaussian 自由场的等值线（level lines），对应调和探索
- SLE$_6$：三角格子上的 critical percolation 界面（Smirnov 2001，Fields 奖获奖工作）
- SLE$_8/3$：self-avoiding walk（推测，Lawler-Schramm-Werner）
- SLE$_8$：均匀生成树的 Peano 曲线

### 139.2 Lévy 过程

Lévy 过程是具有独立平稳增量的随机过程，Brown 运动和 Poisson 过程是最经典的例子。

**定理 139.3**（Lévy-Khintchine 公式）：Lévy 过程 $X_t$ 的特征函数为

$$E[e^{i\theta X_t}] = e^{t \psi(\theta)}$$

其中

$$\psi(\theta) = i b \theta - \frac{1}{2} \sigma^2 \theta^2 + \int_{\mathbb{R}} (e^{i\theta x} - 1 - i\theta x 1_{|x|<1}) \nu(dx)$$

$(b, \sigma^2, \nu)$ 称为 Lévy 三元组：$b$ 是漂移，$\sigma^2$ 是 Gauss 部分方差，$\nu$ 是 Lévy 测度（跃度测度）。

**定理 139.4**（Lévy-Itô 分解）：任何 Lévy 过程可分解为

$$X_t = b t + \sigma W_t + \int_0^t \int_{|x|<1} x \tilde{N}(ds, dx) + \int_0^t \int_{|x| \geq 1} x N(ds, dx)$$

其中 $N$ 是跃度测度的 Poisson 随机测度，$\tilde{N}$ 是补偿 Poisson 随机测度。

**重要例子**：
- **$\alpha$-稳定过程**：Lévy 测度 $\nu(dx) = c_\pm |x|^{-1-\alpha} dx$（$0 < \alpha < 2$）
- **Gamma 过程**：非负 Lévy 过程，增量服从 Gamma 分布，用于金融（方差 Gamma 模型）和可靠性理论
- **逆 Gauss 过程**：增量服从逆 Gauss 分布，常用于首达时间建模

### 139.3 测度值过程

**定义 139.3**（超过程 / Superprocess）：超过程是取测度为值的 Markov 过程，由分支粒子系统的缩放极限产生。超 Brown 运动 $X_t$ 是测度值过程，满足鞅问题

$$M_t(\varphi) = \langle X_t, \varphi \rangle - \langle X_0, \varphi \rangle - \int_0^t \langle X_s, \Delta \varphi \rangle ds, \quad \varphi \in \mathcal{D}(\Delta)$$

**Fleming-Viot 过程**是另一类测度值过程，描述无灭绝种群遗传学中基因类型的频率演化（Wright-Fisher 模型的缩放极限），其生成元涉及 Dirichlet 形式。

---

---

---

---

---

## 第251章：大偏差理论与集中不等式
大偏差理论估计罕见事件概率的指数衰减速率，是统计力学（熵最大化原理）、信息论（Sanov 定理）和风险管理的基础工具。

### 140.1 Cramér 定理

**定理 140.1**（Cramér 定理，1938）：设 $X_1, X_2, \ldots$ 是 i.i.d. 随机变量，矩母函数 $\Lambda(\lambda) = \log E[e^{\lambda X_1}] < \infty$ 对某区间 $\lambda \in [-\varepsilon, \varepsilon]$ 成立。则样本均值 $\bar{X}_n = \frac{1}{n} \sum_{i=1}^n X_i$ 满足大偏差原理（LDP），速率函数为 Legendre 变换

$$I(x) = \sup_{\lambda \in \mathbb{R}} \{\lambda x - \Lambda(\lambda)\}$$

即：对开集 $G$，$\liminf_n \frac{1}{n} \log P(\bar{X}_n \in G) \geq -\inf_{x \in G} I(x)$；对闭集 $F$，$\limsup_n \frac{1}{n} \log P(\bar{X}_n \in F) \leq -\inf_{x \in F} I(x)$。

**Corollary 140.2**（Chernoff 界）：$P(\bar{X}_n \geq a) \leq e^{-n I(a)}$（对 $a > E[X_1]$）。

### 140.2 Schilder 定理与 Freidlin-Wentzell 理论

**定理 140.3**（Schilder 定理）：Brown 运动 $W_t$（$t \in [0,1]$）经缩放 $\sqrt{\varepsilon} W_t$ 满足参数 $\varepsilon \to 0$ 的 LDP，速率函数为 Cameron-Martin 范数：

$$I(\varphi) = \begin{cases} \frac{1}{2} \int_0^1 |\dot{\varphi}(t)|^2 dt & \varphi \in H^1([0,1]), \varphi(0)=0 \\ \infty & \text{否则} \end{cases}$$

**定理 140.4**（Freidlin-Wentzell 理论）：SDE $dX^\varepsilon_t = b(X^\varepsilon_t) dt + \sqrt{\varepsilon} \sigma(X^\varepsilon_t) dW_t$ 的样本路径的 LDP 速率函数为

$$I(\varphi) = \frac{1}{2} \int_0^T (\dot{\varphi} - b(\varphi))^T (\sigma \sigma^T)^{-1}(\varphi) (\dot{\varphi} - b(\varphi)) dt$$

### 140.3 集中不等式

**定理 140.5**（Hoeffding 不等式）：设 $X_1, \ldots, X_n$ 是独立随机变量，$a_i \leq X_i \leq b_i$ a.s.，则对 $t > 0$，

$$P\left(\sum_{i=1}^n (X_i - E[X_i]) \geq t\right) \leq \exp\left(-\frac{2t^2}{\sum_{i=1}^n (b_i - a_i)^2}\right)$$

**定理 140.6**（McDiarmid 不等式—有界差异不等式）：设 $f: \mathbb{R}^n \to \mathbb{R}$ 对每个坐标满足有界差异性质 $|f(x_1, \ldots, x_i, \ldots, x_n) - f(x_1, \ldots, x'_i, \ldots, x_n)| \leq c_i$，$X_1, \ldots, X_n$ 独立。则

$$P(f(X_1, \ldots, X_n) - E[f] \geq t) \leq \exp\left(-\frac{2t^2}{\sum_{i=1}^n c_i^2}\right)$$

**定理 140.7**（Talagrand 集中不等式）：在乘积空间 $\Omega = \prod \Omega_i$ 上配备乘积概率测度，任意凸 1-Lipschitz 函数 $f$ 满足 Gauss 型集中：

$$P(|f - M_f| \geq t) \leq C e^{-t^2/C}$$

其中 $M_f$ 是 $f$ 的中位数。这一不等式通过 Marton 的信息传输方法和 Bobkov-Götze 条件建立。

### 140.4 经验过程与一致大数定律

**定理 140.8**（Glivenko-Cantelli 定理）：设 $F$ 是 VC 类（Vapnik-Chervonenkis 类），则经验分布函数按 $\|\cdot\|_\infty$ 一致收敛于真实分布 a.s.

**定理 140.9**（Donsker 定理—经验过程的泛函中心极限定理）：在适当的函数类上，经验过程 $\sqrt{n}(\mathbb{P}_n - P)$ 弱收敛于 $P$-Brown 桥（均值为零、协方差为 $C(f,g) = P(fg) - P(f)P(g)$ 的 Gauss 过程）。

---

*本卷在概率论 II（V21）的基础上，建立了随机分析的核心理论：Itô 随机积分构造与 Girsanov 定理、Feynman-Kac 公式、Malliavin 分析的分部积分公式与亚椭圆性定理、随机偏微分方程的正则性结构理论、Schramm-Loewner 演化（SLE）与统计物理的联系，以及 Lévy 过程的 Lévy-Khintchine 表示与大偏差理论。共 7 章。*

---

*本卷在初等概率论（V6）和测度论（V9）的基础上，建立了概率论的严格分析基础：Kolmogorov 公理体系将概率论纳入测度论框架；大数定律和中心极限定理揭示了随机现象中的确定性规律；条件期望和鞅论提供了处理信息的强大工具；Markov 链理论为随机过程建模提供了基本框架；Brown 运动和 Itô 积分开创了随机分析，为金融数学（Black-Scholes 模型）和随机微分方程奠定了基础。为后续数理统计（V22）提供了概率论基础。**补充部分一**将概率论极限理论应用于统计力学：Gibbs 测度理论建立了平衡态统计力学的概率论基础，相变理论通过配分函数的非解析性揭示了临界现象，重整化群方法从不动点理论出发统一了临界指数的普适性。**补充部分二**引入了随机矩阵理论：Wigner半圆律与普遍性、自由概率论（Voiculescu的R-变换与S-变换）、Tracy-Widom分布与边缘统计、圆律与Stieltjes变换方法、行列式点过程与$\beta$系综，以及随机矩阵在数论（Riemann $\zeta$零点）、高维统计与机器学习中的现代应用。**补充部分三**建立了随机分析的完整体系：Itô积分深化与Girsanov定理、随机微分方程（SDE）解的存在唯一性与Feynman-Kac公式、Malliavin分析与Hörmander条件、随机偏微分方程（SPDE）与正则性结构、随机几何与SLE理论、Lévy过程与测度值过程、大偏差理论（Cramér定理、Schilder定理）与经验过程理论。*


*卷二十：概率论 II终。*


*卷二十：概率论 II终。*


*卷二十：概率论 II终。*


*卷二十三：随机过程与统计力学终。*
