## 第291章：随机偏微分方程（SPDE）
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

其中 $G$ 是热核。当 $d=1$ 时，$u(t, \cdot)$ 是 a.s. 连续函数（Holder $\alpha < 1/2$）；$d=2$ 时是 a.s. 连续分布（Holder $\alpha < 0$）；$d \geq 3$ 时需要用重整化。

**证明**（$d=1$ 情形）：随机卷积项 $v(t,x) = \int_0^t \int G(t-s, x-y) dW(s,y)$ 是高斯随机场。计算协方差：$\mathbb{E}[v(t,x)^2] = \int_0^t \int G(t-s, x-y)^2 dy ds$。$G(t,x) = (4\pi t)^{-1/2} e^{-x^2/(4t)}$，$\int G(r,y)^2 dy = C r^{-1/2}$。故 $\mathbb{E}[v(t,x)^2] = \int_0^t C (t-s)^{-1/2} ds < \infty$。同理对增量 $v(t,x) - v(t,x+h)$，协方差估计给出 Holder 连续 $\alpha < 1/2$。$d \geq 2$ 时积分发散，需重整化。$\blacksquare$

### 138.3 Hairer 的正则性结构理论

Martin Hairer 在 2014 年以正则性结构理论获得 Fields 奖，该理论为驱动是非正则噪声（如时空白噪声）的非线性 SPDE 提供了系统化的分析框架。

**定理 138.2**（KPZ 方程的适定性）：Kardar-Parisi-Zhang 方程

$$\partial_t h = \partial_x^2 h + (\partial_x h)^2 + \xi$$

在 Hairer 的正则性结构框架下是局部适定的。这一结果解决了 KPZ 方程自 1986 年提出以来长期悬而未决的数学适定性问题。

**证明**：Cole-Hopf 变换 $Z = e^h$ 将 KPZ 方程化为随机热方程 $\partial_t Z = \partial_{xx}Z + Z\xi$。温和解 $Z(t,x) = \int G(t,x-y)Z_0(y)dy + \int_0^t\int G(t-s,x-y)Z(s,y)\xi(s,y)dyds$。迭代展开 $Z = \sum_{n=0}^\infty Z_n$，其中 $Z_n$ 是 $n$ 重随机卷积。$Z_n$ 的重整化涉及 Wick 幂：$:\xi^{\otimes n}:$。Hairer 正则性结构将每个 $Z_n$ 编码为带装饰的树，赋予解析正则性指标。模型空间 $(\Pi,\Gamma)$ 满足结构群公理，Picard 迭代在 $\mathcal{D}^{\gamma,\eta}$ 型空间收敛（$\gamma<0$ 为负则性），Haar 测度下的平移不变性保证爆炸控制。$\blacksquare$

**核心思想**：正则性结构将非线性 SPDE 的解表示为正则性结构中的模型作用在"装饰树"（decorated trees）的展开式上；通过重整化消除发散（类似于量子场论中的 Wilson 重整化），建立解的正则性估计和连续性。

---

---

---

---

---
---

## 第292章：随机几何与 Lévy 过程
### 139.1 Schramm-Loewner 演化（SLE）

**定义 139.1**（Loewner 方程）：设 $\gamma: [0,\infty) \to \overline{\mathbb{H}}$（上半平面）是简单曲线，$\gamma(0)=0$。令 $g_t: \mathbb{H} \setminus \gamma[0,t] \to \mathbb{H}$ 是 Riemann 映照（标准化为 $g_t(z) \sim z + 2a_t/z + \cdots$）。$g_t$ 满足 Loewner 方程：

$$\frac{\partial}{\partial t} g_t(z) = \frac{2}{g_t(z) - U_t}$$

其中 $U_t = g_t(\gamma(t))$ 是驱动函数。

**定义 139.2**（SLE$_\kappa$）：当驱动函数取为 $U_t = \sqrt{\kappa} W_t$（Brown 运动的缩放）时，对应的随机曲线称为 SLE$_\kappa$（Schramm-Loewner Evolution）。

**定理 139.1**（SLE 的相变）：
- $0 < \kappa \leq 4$：曲线是简单的且不自交（dilute 相）
- $4 < \kappa < 8$：曲线自交但不填充平面（dense 相）
- $\kappa \geq 8$：曲线是空间填充的

**证明**：令 $f_t(z) = g_t(z)-U_t$，则 $df_t = \frac{2}{f_t}dt - dU_t$，$U_t = \sqrt{\kappa}W_t$。定义 $X_t = f_t(z)/\sqrt{\kappa}$，则 $dX_t = \frac{2}{X_t}dt - dW_t$，这是 Bessel 过程（$\nu$ 维）。SLE 曲线的几何性质由 Bessel 过程的边界行为决定：$\kappa \leq 4$ 时 Bessel 过程维数 $\nu \geq 0$，不击中原点，故曲线不自交；$4 < \kappa < 8$ 时 $-1 < \nu < 0$，Bessel 过程可击中 0 但能反射，曲线形成自交；$\kappa \geq 8$ 时 $\nu \leq -1$，过程频繁击中 0 而无法离开，曲线空间填充。这些相变行为由 Bessel 过程的击中时间分布 $\mathbb{P}_x(\tau_0 < t)$ 决定。$\blacksquare$



**定理 139.2**（SLE 与统计物理的关系）：SLE 被推测（许多已被证明）描述了平面统计力学模型在临界点处的缩放极限：
- SLE$_2$：loop-erased random walk
- SLE$_3$：Ising 模型的界面（critical Ising）
- SLE$_4$：Gaussian 自由场的等值线（level lines），对应调和探索
- SLE$_6$：三角格子上的 critical percolation 界面（Smirnov 2001，Fields 奖获奖工作）
- SLE$_8/3$：self-avoiding walk（推测，Lawler-Schramm-Werner）
- SLE$_8$：均匀生成树的 Peano 曲线

**证明**：以 SLE$_6$ 为例。三角格子上临界 percolation 的探索路径在离散水平满足 Markov 性质。由 Smirnov（2001）的共形不变性证明，离散接口的 Cardy 公式在缩放极限下精确成立。Loewner 驱动函数 $U_t$ 是连续鞅，由其形 Markov 性得增量在时间平移下独立。由 L\u00e9vy 刻画，$U_t$ 必为标准 Brown 运动的 $\sqrt{\kappa}$ 倍。Cardy 公式的显式解要求 $\kappa=6$（任意三角区域的卡氏点穿越概率唯一确定了这一值）。类似地：Ising 模型（$\kappa=3$，Chelkak-Smirnov 2012 证明共形不变性）、GFF 等值线（$\kappa=4$，Schramm-Sheffield 2009）、FK 渗流簇边界（$\kappa=16/3$）等的证明均基于在离散模型中识别 martingale 可观测量，验证其缩放极限满足 Loewner 方程。$\blacksquare$



### 139.2 Lévy 过程

Lévy 过程是具有独立平稳增量的随机过程，Brown 运动和 Poisson 过程是最经典的例子。

**定理 139.3**（Lévy-Khintchine 公式）：Lévy 过程 $X_t$ 的特征函数为

$$E[e^{i\theta X_t}] = e^{t \psi(\theta)}$$

其中

$$\psi(\theta) = i b \theta - \frac{1}{2} \sigma^2 \theta^2 + \int_{\mathbb{R}} (e^{i\theta x} - 1 - i\theta x 1_{|x|<1}) \nu(dx)$$

$(b, \sigma^2, \nu)$ 称为 Lévy 三元组

**证明**：由平稳独立增量性，$\phi_t(\theta) = \mathbb{E}[e^{i\theta X_t}]$ 满足 $\phi_{t+s} = \phi_t\phi_s$，故 $\phi_t = e^{t\psi(\theta)}$（$\psi$ 为特征指数）。$\psi$ 的 Lévy-Khintchine 表示由无限可分分布的一般理论导出：$\psi(\theta) = ib\theta - \frac{\\sigma^2}{2}\theta^2 + \int (e^{i\theta x}-1-i\theta x\mathbf{1}_{|x|<1})\nu(dx)$。漂移项 $ib\theta$ 和 Gauss 项来自连续部分，跳部分由 Lévy 测度 $\nu$ 的补偿和给出。该公式完全刻画了 Lévy 过程的分布结构。$\blacksquare$
：$b$ 是漂移，$\sigma^2$ 是 Gauss 部分方差，$\nu$ 是 Lévy 测度（跃度测度）。

**定理 139.4**（Lévy-Itô 分解）：任何 Lévy 过程可分解为

$$X_t = b t + \sigma W_t + \int_0^t \int_{|x|<1} x \tilde{N}(ds, dx) + \int_0^t \int_{|x| \geq 1} x N(ds, dx)$$

其中 $N$ 是跃度测度的 Poisson 随机测度，$\tilde{N}$ 是补偿 Poisson 随机测度

**证明**：将跃度按大小分解：大跳（$|x|\geq 1$）有限个，由 Poisson 随机测度 $N$ 直接求和；小跳（$|x|<1$）需补偿以保证收敛，$\tilde{N}(ds,dx) = N(ds,dx)-ds\nu(dx)$ 是鞅测度。连续部分 $bt+\sigma W_t$ 来自 Lévy-Khintchine 公式中的 $ib\theta$ 和 $-\frac{\sigma^2}{2}\theta^2$。收敛性由 Kolmogorov 三级数定理和 Lévy 测度条件 $\int (|x|^2\wedge 1)\nu(dx) < \infty$ 保证。$\blacksquare$
。

**重要例子**：
- **$\alpha$-稳定过程**：Lévy 测度 $\nu(dx) = c_\pm |x|^{-1-\alpha} dx$（$0 < \alpha < 2$）
- **Gamma 过程**：非负 Lévy 过程，增量服从 Gamma 分布，用于金融（方差 Gamma 模型）和可靠性理论
- **逆 Gauss 过程**：增量服从逆 Gauss 分布，常用于首达时间建模

### 139.3 测度值过程

**定义 139.3**（超过程 / Superprocess）：超过程是取测度为值的 Markov 过程，由分支粒子系统的缩放极限产生。超 Brown 运动 $X_t$ 是测度值过程，满足鞅问题

$$M_t(\varphi) = \langle X_t, \varphi \rangle - \langle X_0, \varphi \rangle - \int_0^t \langle X_s, \Delta \varphi \rangle ds, \quad \varphi \in \mathcal{D}(\Delta)$$

**Fleming-Viot 过程**是另一类测度值过程，描述无灭绝种群遗传学中基因类型的频率演化（Wright-Fisher 模型的缩放极限），其生成元涉及 Dirichlet 形式

**证明**：超 Brown 运动是 Dawson-Watanabe 超过程，由分支 Brown 运动粒子系统经缩放极限得到。粒子数 $N\to\infty$，个体质量 $1/N\to 0$，分支率 $N$。极限测度 $X_t$ 满足 $\langle X_t,\varphi\rangle = \langle X_0,\varphi\rangle + \int_0^t\langle X_s,\Delta\varphi\rangle ds + M_t(\varphi)$，$M_t$ 为连续鞅，二次变差 $\langle M(\varphi)\rangle_t = \int_0^t\langle X_s,\varphi^2\rangle ds$。Fleming-Viot 过程：Wright-Fisher 模型（$N$ 个个体、突变强度 $\theta/N$）的扩散极限，生成元 $\mathcal{L}F(\mu) = \frac{1}{2}\iint \mu(dx)(\delta_x(dy)-\mu(dy))\frac{\partial^2 F}{\partial\mu(x)\partial\mu(y)} + \int (A^*\frac{\delta F}{\delta\mu})(x)\mu(dx)$，其中 $A$ 是突变算子。$\blacksquare$
。

---

---

---

---

---