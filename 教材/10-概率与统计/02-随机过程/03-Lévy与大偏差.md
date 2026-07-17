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