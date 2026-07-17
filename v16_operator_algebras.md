# 卷十六：算子代数与积分方程

## 第142章：因子的 Murray-von Neumann 分类
Murray 和 von Neumann（1936-1943）完成了因子的完整分类，依据是投影的维数函数的值域。这一分类是算子代数理论最辉煌的成就之一。

### 214.1 维数函数与迹

**定义 214.1**（维数函数）：设 $\mathcal{M}$ 是因子。定义映射 $D: \operatorname{Proj}(\mathcal{M}) \to [0, \infty]$ 满足：
- $D(p) = D(q) \iff p \sim q$
- $D(p+q) = D(p) + D(q)$（若 $p \perp q$）
- $D(0) = 0$

$D(p)$ 可视为投影 $p$ 的"相对维数"。$D$ 的存在性和值域决定了因子的类型。

**定义 214.2**（有限/无限/半有限投影）：
- 投影 $p$ 是**有限**的：若 $p \sim q \leq p \implies q = p$（即不存在真子投影等价于自身）
- 投影 $p$ 是**无限**的：若 $p \sim q < p$（存在真子投影等价于自身）
- 投影 $p$ 是**纯无限**的：$p$ 不含非零有限子投影
- 投影 $p$ 是**半有限**的：$p$ 不含非零有限子投影？不——半有限指 $p$ 可写为相互正交的有限投影的和

### 214.2 因子类型

**定义 214.3**（因子的 Murray-von Neumann 分类）：
- **I 型**：含极小投影的因子。$I_n$：$D$ 的值域 = $\{0, 1, 2, \ldots, n\}$（$n = 1, 2, \ldots, \infty$）
  - $I_1$：$B(H)$ 上无其他因子的情况（$\dim H = 1$）
  - $I_n$：$B(H) \cong M_n(\mathbb{C})$（$\dim H = n$）
  - $I_\infty$：$B(H)$ 且 $\dim H = \infty$
- **II 型**：无极小投影但含非零有限投影的因子
  - **II$_1$ 型**：$I$ 本身是有限投影（即 $D(I) < \infty$）。值域 $D(\operatorname{Proj}(\mathcal{M})) = [0, 1]$
  - **II$_\infty$ 型**：$I$ 是纯无限投影但含有限投影。值域 = $[0, \infty]$
- **III 型**：所有非零投影都是无限投影的因子。值域 = $\{0, \infty\}$

**定理 214.1**（II$_1$ 型因子的迹）：在 II$_1$ 型因子 $\mathcal{M}$ 上存在唯一的忠实正规迹 $\tau: \mathcal{M} \to \mathbb{C}$ 满足：
- $\tau(xy) = \tau(yx)$
- $\tau(x^*x) \geq 0$（正性）
- $\tau(I) = 1$（归一化）
- $\tau$ 是正规的（对弱收敛连续）

且 $D(p) = \tau(p)$ 给出维数函数。

### 214.3 具体实现与例子

**定义 214.4**（群 von Neumann 代数）：设 $\Gamma$ 是离散群。$\Gamma$ 的**群 von Neumann 代数** $\mathcal{L}(\Gamma)$ 是左正则表示 $\lambda: \Gamma \to B(\ell^2(\Gamma))$（$\lambda_g \delta_h = \delta_{gh}$）的像的 WOT 闭包。

$$\mathcal{L}(\Gamma) = \lambda(\Gamma)'' \subseteq B(\ell^2(\Gamma))$$

**定理 214.2**（Murray-von Neumann, 1943）：
- $\mathcal{L}(\Gamma)$ 是 II$_1$ 型因子当且仅当 $\Gamma$ 是无限可分共轭类群（ICC 群）
- $\tau(x) = \langle x \delta_e, \delta_e \rangle$ 是 $\mathcal{L}(\Gamma)$ 上的规范忠实正规迹
- 典型例子：$\mathcal{L}(\mathbb{F}_2)$（自由群 $n \geq 2$ 个生成元）、$\mathcal{L}(S_\infty)$（有限置换群的归并）

**问题 214.1**（自由群因子同构问题）：$\mathcal{L}(\mathbb{F}_m) \cong \mathcal{L}(\mathbb{F}_n)$ 对 $m \neq n$ 是否成立？这是 von Neumann 代数理论中长期未解决的著名问题之一（与自由概率论和 Voiculescu 的微观状态方法相关）。

**例 214.1**（超有限 II$_1$ 型因子）：$\mathcal{R}$ 是通过矩阵代数的归并极限获得的 II$_1$ 型因子：

$$\mathcal{R} = \overline{\bigcup_{n} M_{2^n}(\mathbb{C})}^{\text{SOT}}$$

Murray 和 von Neumann 证明 $\mathcal{R}$ 是唯一的超有限 II$_1$ 型因子（同构意义下）。

**定义 214.5**（超有限因子 / Approximately Finite Dimensional, AFD）：因子 $\mathcal{M}$ 称为**超有限**的，如果 $\mathcal{M}$ 可由有限维子代数递增序列的并生成（在强算子拓扑下）。

**定理 214.3**（Murray-von Neumann, 1943）：存在唯一（同构意义下）的超有限 II$_1$ 型因子，记作 $\mathcal{R}$。

**推论 214.4**：$\mathcal{R} \cong \mathcal{L}(S_\infty) \cong \overline{\bigotimes}_{n} M_2(\mathbb{C})$（无限张量积）。

### 214.4 Powers 因子与 III 型分类的序曲

**定义 214.6**（Powers 因子，1967）：Powers 构造了连续族的互不同构的 III 型因子 $R_\lambda$（$0 < \lambda < 1$），通过对超有限 II$_1$ 型因子 $\mathcal{R}$ 作 $\lambda$-自同构迭代。这些因子可由无穷张量积构造：

$$R_\lambda = \overline{\bigotimes}_{n=1}^\infty (M_2(\mathbb{C}), \phi_\lambda)$$

其中 $\phi_\lambda$ 是 $M_2(\mathbb{C})$ 上的非迹状态。

这一工作揭示了 III 型因子的丰富性，为 Connes 的分类铺平了道路。

---

---

---

---

---

## 第143章：Tomita-Takesaki 模理论
Tomita-Takesaki 模理论（1967-1970）是 von Neumann 代数理论中最重要的结构定理之一。它从给定的 von Neumann 代数和其上一个忠实的正规半有限权出发，构造了一个单参数自同构群——模自同构群（modular automorphism group）——并建立了正锥与模算子的理论。

### 215.1 权的基本理论

**定义 215.1**（权 / Weight）：von Neumann 代数 $\mathcal{M}$ 上的**权** $\varphi$ 是映射 $\varphi: \mathcal{M}_+ \to [0, \infty]$，满足
- $\varphi(x + y) = \varphi(x) + \varphi(y)$
- $\varphi(\lambda x) = \lambda \varphi(x)$（$\lambda \geq 0$，约定 $0 \cdot \infty = 0$）

权是迹和状态的推广。有限权（$\varphi(I) < \infty$）可标准化为状态。

**定义 215.2**（半有限/忠实/正规权）：
- $\varphi$ 是**忠实**的：$\varphi(x) = 0 \implies x = 0$（$x \in \mathcal{M}_+$）
- $\varphi$ 是**半有限**的：$\{x \in \mathcal{M}_+ : \varphi(x) < \infty\}$ 在 $\mathcal{M}_+$ 中稠密
- $\varphi$ 是**正规**的：对 $\mathcal{M}_+$ 中任意递增网 $x_\alpha \uparrow x$，$\varphi(x_\alpha) \uparrow \varphi(x)$

**定理 215.1**（权的基本事实）：任何 von Neumann 代数都容纳一个忠实的正规半有限权（fns weight）。这一结果依赖于 Hahn-Banach 定理和 von Neumann 代数的预对偶性质。

### 215.2 GNS 构造与 Tomita 算子

**定理 215.2**（GNS 构造 / Gelfand-Naimark-Segal, 1943）：设 $\varphi$ 是 $\mathcal{M}$ 上的忠实正规半有限权。则存在 Hilbert 空间 $L^2(\mathcal{M}, \varphi)$ 和忠实正规 \* -表示 $\pi_\varphi: \mathcal{M} \to B(L^2(\mathcal{M}, \varphi))$，使得 $\pi_\varphi(\mathcal{M})$ 是 von Neumann 代数，且有循环和分离向量。

**定义 215.3**（Tomita 算子）：给定 von Neumann 代数 $\mathcal{M}$ 和循环分离向量 $\Omega$，定义 **Tomita 算子** $S$：

$$S_0(x\Omega) = x^*\Omega, \quad x \in \mathcal{M}$$

$S_0$ 是稠定的共轭线性算子。其闭包 $S = \overline{S_0}$ 称为 Tomita 算子。

**定理 215.3**（极分解）：$S$ 有极分解 $S = J \Delta^{1/2}$，其中：
- $J$ 是共轭线性等距（$J^2 = I$，$J = J^*$），称为**模共轭**（modular conjugation）
- $\Delta = S^*S$ 是正的自伴算子，称为**模算子**（modular operator）

### 215.3 Tomita-Takesaki 定理

**定理 215.4**（Tomita-Takesaki 定理）：设 $\mathcal{M} \subseteq B(H)$ 是 von Neumann 代数，$\Omega$ 是循环分离向量。则：

1. $J \mathcal{M} J = \mathcal{M}'$（模共轭将 $\mathcal{M}$ 映为其换位）

2. $\Delta^{it} \mathcal{M} \Delta^{-it} = \mathcal{M}$ 对所有 $t \in \mathbb{R}$（模自同构群保持 $\mathcal{M}$）

3. **模自同构群** $\sigma_t^\varphi(x) = \Delta^{it} x \Delta^{-it}$（$t \in \mathbb{R}$）是 $\mathcal{M}$ 的单参数自同构群

4. **KMS 条件**：对任意 $x, y \in \mathcal{M}$，存在有界连续函数 $F(z)$ 在条带 $\{z : 0 \leq \Im(z) \leq 1\}$ 上解析，边界值为
   $$F(t) = \varphi(\sigma_t^\varphi(x) y), \quad F(t+i) = \varphi(y \sigma_t^\varphi(x))$$

*证明概要*：核心是证明 $S = J\Delta^{1/2}$ 满足以上性质。(1) 源于 $S$ 和 $F$（$F(x\Omega) = x^*\Omega$ 在 $\mathcal{M}'$ 上）的关系。$J\mathcal{M}J \subseteq \mathcal{M}'$ 通过 $S$ 与 $\mathcal{M}$ 和 $\mathcal{M}'$ 之间的代数关系论证。(2) 利用 Stone 定理构造 $\Delta^{it}$ 的单参数酉群，通过 KMS 条件的解析延拓证明 $\Delta^{it}\mathcal{M}\Delta^{-it} \subseteq \mathcal{M}$。(3-4) KMS 条件的证明依赖于复分析中的三线定理和 Phragmén-Lindelöf 原理。∎

**推论 215.5**：对任意忠实正规半有限权 $\varphi$，存在唯一的一参数自同构群 $\sigma_t^\varphi$ 满足 KMS 条件。这称为 $\varphi$ 的**模自同构群**。

### 215.4 Connes 的余循环定理与 III 型分类

**定理 215.6**（Connes 余循环定理，1973）：设 $\varphi, \psi$ 是 $\mathcal{M}$ 上的两个忠实正规半有限权。则模自同构群 $\sigma_t^\varphi$ 和 $\sigma_t^\psi$ 是余循环等价的：存在连续映射 $u: \mathbb{R} \to \mathcal{U}(\mathcal{M})$ 满足 $u_{t+s} = u_t \sigma_t^\varphi(u_s)$，使得

$$\sigma_t^\psi(x) = u_t \sigma_t^\varphi(x) u_t^*$$

**定理 215.7**（Connes 的 III 型分类定理，1973）：设 $\mathcal{M}$ 是 III 型因子。定义

$$S(\mathcal{M}) = \bigcap_{\varphi} \operatorname{Sp}(\Delta_\varphi) \subseteq [0, \infty)$$

其中 $\Delta_\varphi$ 是权 $\varphi$ 的模算子，$\operatorname{Sp}$ 表示谱。Connes 的分类：

- **III$_0$ 型**：$S(\mathcal{M}) = \{0, 1\}$
- **III$_\lambda$ 型**（$0 < \lambda < 1$）：$S(\mathcal{M}) = \{0\} \cup \{\lambda^n : n \in \mathbb{Z}\}$
- **III$_1$ 型**：$S(\mathcal{M}) = [0, \infty)$

这些因子互不同构。Haagerup（1987）证明了 III$_1$ 型因子的唯一性。

### 215.5 流与 Connes 的 T-不变量

**定义 215.7**（非平凡流 / Flow of Weights, Connes-Takesaki）：对 III 型因子 $\mathcal{M}$，Connes 和 Takesaki 构造了 III 型因子的**权流**（flow of weights）：一个 $\mathbb{R}$ 作用在可交换 von Neumann 代数上的遍历流。对 III$_\lambda$ 型因子（$\lambda \neq 0$），此流是周期的（周期 $T = -2\pi/\ln\lambda$）。

**定义 215.8**（$T$-不变量）：III 型因子的 $T$-集定义为

$$T(\mathcal{M}) = \{t \in \mathbb{R} : \sigma_t^\varphi \text{ 是内自同构}\}$$

$T(\mathcal{M})$ 是 $\mathbb{R}$ 的子群，不依赖于 $\varphi$ 的选择。对 III$_\lambda$ 型因子，$T(\mathcal{M}) = (2\pi/\ln\lambda)\mathbb{Z}$。

---

---

---

---

---

## 第144章：自由概率论与随机矩阵
自由概率论由 Voiculescu（1985）创立，是 von Neumann 代数理论和随机矩阵理论相结合的产物。它为 II$_1$ 型因子的研究提供了强大的新工具。

### 216.1 非交换概率空间

**定义 216.1**（非交换概率空间）：**非交换概率空间** $(\mathcal{A}, \varphi)$ 由单位元 \* -代数 $\mathcal{A}$ 和忠实的正线性泛函 $\varphi: \mathcal{A} \to \mathbb{C}$（$\varphi(1) = 1$，状态）组成。

- **经典概率**：$(\mathcal{A}, \varphi) = (L^\infty(X, \mu), \mathbb{E}_\mu)$
- **自由概率**：$(\mathcal{A}, \varphi) = (\mathcal{M}, \tau)$，其中 $\mathcal{M}$ 是 II$_1$ 型因子，$\tau$ 是忠实的正规迹

### 216.2 自由独立性

**定义 216.2**（自由独立性 / Freeness）：设 $(\mathcal{A}, \varphi)$ 是非交换概率空间。子代数族 $\mathcal{A}_1, \ldots, \mathcal{A}_n \subseteq \mathcal{A}$ 是**自由独立**的，如果对任意 $a_j \in \mathcal{A}_{i_j}$（$i_1 \neq i_2 \neq \cdots \neq i_k$，即相邻指标不同）且 $\varphi(a_j) = 0$，有

$$\varphi(a_1 a_2 \cdots a_k) = 0$$

**定义 216.3**（自由卷积）：若随机变量 $a, b$ 关于 $\varphi$ 的分布在解析意义下已知，且 $a, b$ 是自由独立的，则 $a+b$ 的分布由**自由加性卷积** $\mu \boxplus \nu$ 给出。

**定理 216.1**（自由中心极限定理）：设 $a_1, a_2, \ldots$ 是自由独立且同分布的随机变量，$\varphi(a_i) = 0$，$\varphi(a_i^2) = 1$。则

$$S_n = \frac{1}{\sqrt{n}} \sum_{i=1}^n a_i$$

在分布意义下收敛于**半圆律**：$\mu_{SC}(dx) = \frac{1}{2\pi} \sqrt{4 - x^2} \, dx$（$|x| \leq 2$）。

**推论 216.2**：半圆律在自由概率论中的地位类似于高斯分布（正态分布）在经典概率论中的地位。

### 216.3 自由概率论的算子代数应用

**定理 216.3**（Voiculescu, 1990-1995）：自由群因子 $\mathcal{L}(\mathbb{F}_n)$ 的微观状态方法：
- $\mathcal{L}(\mathbb{F}_n)$ 可嵌入超有限 II$_1$ 型因子的超积中
- 由此获得 $\mathcal{L}(\mathbb{F}_n)$ 中生成元的自由独立性和渐近自由性
- 自由群因子同构问题可通过自由熵 $\chi^*(X_1, \ldots, X_n)$ 研究

进一步：Dykema（1994）和 Radulescu（1994）独立证明了压缩自由群因子 $L(\mathbb{F}_n)_t$（$t > 0$ 连续参数）的理论，将其推广为连续参数的族。更一般地，Voiculescu 的自由维数（自由熵）发展为 $L^2$-Betti 数和 Atiyah 问题的关键工具。

**定义 216.4**（自由熵 / Free Entropy）：Voiculescu 引入了微状态自由熵 $\chi(X_1, \ldots, X_n)$，度量 von Neumann 代数生成元集的"自由度"。自由熵与 $L^2$-Betti 数有深刻的联系，并在自由群因子同构问题的研究中起关键作用。

---

---

---

---

---

## 第145章（补充）
> 积分方程是未知函数出现在积分号下的方程，是泛函分析、数学物理和工程数学的经典交汇领域。本卷系统建立 Fredholm 积分方程、Volterra 积分方程、奇异性积分方程和 Wiener-Hopf 积分方程的理论及其数值方法。积分方程理论是 Hilbert 空间算子理论的直接应用，也是谱理论、紧算子和变分方法的经典范例。

---

---

---

---

---

## 第146章：Fredholm 积分方程
Fredholm 积分方程形如

$$u(x) - \lambda \int_a^b K(x,y) u(y) dy = f(x)$$

或其特征值问题 $\int_a^b K(x,y) u(y) dy = \mu u(x)$。这是一类由 Fredholm（1903）系统研究的积分方程，其理论与紧算子的谱理论完全对应。

### 217.1 Fredholm 择一定理

**定义 217.1**（Fredholm 积分算子）：在 $L^2([a,b])$ 上定义积分算子

$$(Ku)(x) = \int_a^b K(x,y) u(y) dy$$

若 $K \in L^2([a,b] \times [a,b])$，则 $K$ 是 Hilbert-Schmidt 算子，从而是紧算子。

**定理 217.1**（Fredholm 择一定理）：对 Fredholm 积分方程 $(I - \lambda K)u = f$，以下二者恰有一者成立：
- （第一择一）对任意 $f$，方程有唯一解 $u = (I - \lambda K)^{-1} f$
- （第二择一）齐次方程 $(I - \lambda K)u = 0$ 有非零解，此时非齐次方程有解当且仅当 $f \in (\ker(I - \lambda K^*))^\perp$

这是紧算子理论中谱的基本性质：紧算子的非零谱点必为特征值，且 $\lambda^{-1}$ 是 $K$ 的特征值当且仅当 $\lambda$ 是 $(I - \lambda K)^{-1}$ 的奇点。

### 217.2 Fredholm 行列式

**定义 217.2**（Fredholm 行列式）：对核为 $K(x,y)$ 的 Fredholm 积分方程，Fredholm 行列式定义为

$$D(\lambda) = \sum_{n=0}^{\infty} \frac{(-\lambda)^n}{n!} \int_a^b \cdots \int_a^b \det(K(x_i, x_j))_{i,j=1}^n dx_1 \cdots dx_n$$

**定理 217.2**：$D(\lambda)$ 是 $\lambda$ 的整函数，其零点恰为 $K$ 的特征值的倒数 $\lambda = 1/\mu$（重数对应）。预解核

$$R(x,y;\lambda) = \frac{D(x,y;\lambda)}{D(\lambda)}$$

其中 $D(x,y;\lambda)$ 是 Fredholm 一阶子式行列式。

### 217.3 对称核与 Hilbert-Schmidt 定理

**定理 217.3**（Hilbert-Schmidt 展开定理）：若 $K(x,y)$ 是实对称且平方可积的核（$K(x,y) = K(y,x)$，$\iint |K|^2 < \infty$），则

$$K(x,y) = \sum_{n=1}^{\infty} \mu_n u_n(x) u_n(y)$$

其中 $\{\mu_n\}$ 是 $K$ 的非零特征值（每个按重数列出），$\{u_n\}$ 是对应的标准正交特征函数。级数在 $L^2$ 意义下收敛；若 $K$ 连续且正定，则收敛是绝对且一致的（Mercer 定理）。

**定理 217.4**（Mercer 定理）：若 $K$ 是连续对称正定核（即对任意 $f$，$\iint K(x,y)f(x)f(y)dx dy \geq 0$），则特征值 $\mu_n \geq 0$，且

$$K(x,y) = \sum_{n=1}^{\infty} \mu_n u_n(x) u_n(y)$$

收敛是绝对且一致的。特别地，迹公式 $\sum \mu_n = \int K(x,x) dx$ 成立。

**应用**：Mercer 定理是核方法（kernel methods）——包括支持向量机（SVM）和高斯过程回归——的数学基础，将正定核表征为特征映射的内积。

### 217.4 弱奇异性核

**定义 217.3**（弱奇异核）：形如 $K(x,y) = H(x,y) / |x-y|^\alpha$ 的核（$\alpha < d$，其中 $d$ 是空间维数）虽然在对角线上奇异，但在 $L^2$ 中仍定义紧算子——奇异性由 Hardy-Littlewood-Sobolev 不等式控制。

**定理 217.5**：若 $K(x,y)$ 满足 $\int |K(x,y)|^2 dy < \infty$ a.e. 且 $\int |K(x,y)|^2 dx < \infty$ a.e.，则 $K$ 在 $L^2$ 上是紧算子。Fredholm 择一定理和 Hilbert-Schmidt 定理均成立，且迭代预解核给出级数解。

---

---

---

---

---

## 第147章：Volterra 积分方程
Volterra 积分方程的特征是积分上限为变量 $x$ 而非固定值：

$$u(x) - \lambda \int_a^x K(x,y) u(y) dy = f(x)$$

（第二类 Volterra 方程）或 $\int_a^x K(x,y) u(y) dy = f(x)$（第一类）。

### 218.1 逐次逼近与 Neumann 级数

**定理 218.1**（Volterra 方程的可解性）：若核 $K(x,y)$ 在 $a \leq y \leq x \leq b$ 上连续，则对任意 $\lambda$ 和连续 $f$，Volterra 方程 $(I - \lambda V)u = f$ 有唯一连续解。且 Neumann 级数

$$u(x) = f(x) + \sum_{n=1}^{\infty} \lambda^n (V^n f)(x)$$

对任意 $\lambda$ 收敛（$V$ 的谱半径为零——拟幂零算子）。

*证明思路*：由归纳法，$|(V^n f)(x)| \leq \|K\|_\infty^n \|f\|_\infty (x-a)^n / n!$。由于 $(x-a)^n / n! \to 0$ 对任意 $x$，级数绝对一致收敛。Volterra 算子是紧算子且谱仅含 $\{0\}$（拟幂零性）。∎

### 218.2 Volterra 方程与常微分方程

**定理 218.2**（ODE 初值问题的 Volterra 表示）：$n$ 阶线性 ODE 初值问题

$$y^{(n)}(x) + a_{n-1}(x) y^{(n-1)}(x) + \cdots + a_0(x) y(x) = g(x)$$

及初值条件 $y(a) = y_0, \ldots, y^{(n-1)}(a) = y_{n-1}$ 等价于 Volterra 积分方程

$$y(x) = f(x) + \lambda \int_a^x K(x,s) y(s) ds$$

其中 $f(x)$ 由非齐次项和初值条件决定。这一等价性将 ODE 的存在唯一性理论转化为积分算子的不动点问题。

**推论 218.3**：Picard-Lindelöf 定理（Lipschitz 条件下 ODE 解的存在唯一性）是 Volterra 算子压缩性的特例。

### 218.3 Abel 积分方程

**定义 218.4**（Abel 积分方程）：第一类 Volterra 方程

$$\int_0^x \frac{u(y)}{(x-y)^\alpha} dy = f(x), \quad 0 < \alpha < 1$$

（当 $\alpha = 1/2$ 时等时线问题——tautochrone problem）。

**定理 218.4**（Abel 反演公式）：

$$u(x) = \frac{\sin(\pi \alpha)}{\pi} \frac{d}{dx} \int_0^x \frac{f(y)}{(x-y)^{1-\alpha}} dy$$

这可以理解为分数阶导数的 Abel 反演：$D^{-\alpha} u = f \implies u = D^\alpha f$，其中 $D^\alpha$ 是 Riemann-Liouville 分数阶微积分中的分数阶导数。

---

---

---

---

---

## 第148章：奇异性积分方程
奇异性积分方程含非可积的核（如 Cauchy 核 $1/(x-y)$），积分需要理解为主值积分。此类方程是复分析和偏微分方程边值问题的核心工具。

### 219.1 Cauchy 核与 Plemelj 公式

**定义 219.1**（Cauchy 主值积分）：定义在曲线 $\Gamma$ 上的 Cauchy 主值积分为

$$(\mathcal{H} u)(x) = \text{p.v.} \int_\Gamma \frac{u(y)}{y-x} dy = \lim_{\varepsilon \to 0} \int_{\Gamma \setminus B_\varepsilon(x)} \frac{u(y)}{y-x} dy$$

**定理 219.1**（Plemelj-Sokhotski 公式）：对 Hölder 连续函数 $u$ 在光滑曲线 $\Gamma$ 上，Cauchy 型积分

$$\Phi(z) = \frac{1}{2\pi i} \int_\Gamma \frac{u(y)}{y-z} dy \quad (z \notin \Gamma)$$

在跨越 $\Gamma$ 时的边值为

$$\Phi^\pm(x) = \pm \frac{1}{2} u(x) + \frac{1}{2\pi i} \text{p.v.} \int_\Gamma \frac{u(y)}{y-x} dy$$

即 $\Phi^+(x) - \Phi^-(x) = u(x)$ 和 $\Phi^+(x) + \Phi^-(x) = \frac{1}{\pi i} \text{p.v.} \int \frac{u(y)}{y-x} dy$。

### 219.2 Riemann-Hilbert 问题

**定义 219.2**（标量 Riemann-Hilbert 问题）：求在 $\Gamma$ 分割的区域内解析的函数 $\Phi(z)$，满足边界条件

$$\Phi^+(x) = G(x) \Phi^-(x) + g(x), \quad x \in \Gamma$$

其中 $G(x)$ 是跃度函数，$g(x)$ 是给定函数。

**定理 219.2**（标量 RHP 的可解性）：若 $G(x) \neq 0$ 且 $\Gamma$ 是简单闭曲线，令 $\kappa = \frac{1}{2\pi} [\arg G]_\Gamma$（$G$ 的指标 / winding number）。则：
- $\kappa \geq 0$：齐次问题（$g \equiv 0$）有 $\kappa$ 个线性无关解；非齐次问题对任意 $g$ 可解
- $\kappa < 0$：齐次问题仅有零解；非齐次问题可解需满足 $-\kappa$ 个相容性条件

**应用**：Riemann-Hilbert 方法（又名非线性 steepest descent 方法，Deift-Zhou 1993）是求解可积系统——KdV 方程、非线性 Schrödinger 方程、Painlevé 方程等——的长期渐近和普适性结果的核心工具。该方法还严格证明了随机矩阵理论中的 Tracy-Widom 分布公式。

### 219.3 奇异积分算子的有界性

**定理 219.3**（Calderón-Zygmund 理论）：Cauchy 奇异积分算子 $\mathcal{H}$（Hilbert 变换）在 $L^p(\mathbb{R})$（$1 < p < \infty$）上有界，且在 BMO 空间上有界（$L^\infty \to \text{BMO}$ 代替）。

*意义*：奇异积分算子的 $L^p$ 有界性是调和分析和 PDE 理论的基石，为 Mihlin-Hörmander 乘子定理和伪微分算子的 $L^p$ 连续性提供了统一的技术基础。

---

---

---

---

---

## 第149章：Wiener-Hopf 积分方程与 Wiener-Hopf 方法
Wiener-Hopf 积分方程形如

$$u(x) - \lambda \int_0^\infty K(x-y) u(y) dy = f(x), \quad x \geq 0$$

核仅依赖于差 $x-y$。这类方程出现在衍射理论、断裂力学、排队论和随机过程中。

**定理 220.1**（Wiener-Hopf 分解）：设 $K \in L^1(\mathbb{R})$ 且 Fourier 变换 $\hat{K}(\xi) = \int_{-\infty}^{\infty} K(x) e^{-i\xi x} dx$ 满足 $1 - \lambda \hat{K}(\xi) \neq 0$ 对所有 $\xi \in \mathbb{R}$。则存在分解

$$1 - \lambda \hat{K}(\xi) = \frac{\hat{K}_+(\xi)}{\hat{K}_-(\xi)}$$

其中 $\hat{K}_+$（$\hat{K}_-$）在上下半平面解析且非零。

**Wiener-Hopf 方法**：通过 Fourier 变换将积分方程转化为 Wiener-Hopf 函数方程，利用上半/下半平面解析性与 Liuville 定理进行因式分解，最终求解。该方法将积分方程转化为复平面上的解析函数因子化问题。

**定理 220.2**（Krein 推广）：对向量值 Wiener-Hopf 方程，存在算子值符号的 Wiener-Hopf 分解，其指标与 Toeplitz 算子的 Fredholm 性质密切相关。

---

---

---

---

---

## 第150章：积分方程的数值方法
积分方程的离散化产生线性方程组，可用直接方法或迭代方法求解。本章介绍四种基本的离散化方法。

### 221.1 Galerkin 法与配置法

**Galerkin 法**：在有限维子空间 $V_n = \operatorname{span}\{\varphi_1, \ldots, \varphi_n\}$ 中寻求 $u_n$，使得残差与所有测试函数 $\psi_i$ 正交：

$$(u_n - \lambda K u_n - f, \psi_i) = 0$$

得到线性系统 $\sum_{j=1}^n c_j (\varphi_j - \lambda K \varphi_j, \psi_i) = (f, \psi_i)$。

**配置法**（Collocation）：要求在配置点 $\{x_i\}$ 处精确满足方程：

$$u_n(x_i) - \lambda \int K(x_i, y) u_n(y) dy = f(x_i)$$

这是 Galerkin 法取 $\psi_i = \delta_{x_i}$ 的特例。

**定理 221.1**（Galerkin 法的收敛性）：若 $K$ 是紧算子且 $I - \lambda K$ 可逆，则对充分大的 $n$，Galerkin 近似 $u_n$ 唯一存在且 $\|u - u_n\| \leq C \inf_{v \in V_n} \|u - v\|$（Céa 引理的对偶）。

### 221.2 Nyström 法

**Nyström 法**直接在求积规则上离散化积分：

$$\int K(x_i, y) u(y) dy \approx \sum_{j=1}^n w_j K(x_i, y_j) u(y_j)$$

得到线性系统 $(I - \lambda K_n) u_n = f_n$，其中 $(K_n)_{ij} = w_j K(x_i, y_j)$。

**定理 221.2**：若求积规则对连续函数收敛，则 Nyström 法在紧算子框架下是收敛的（逐点且按范数）。收敛阶等于求积误差阶。

### 221.3 退化核逼近

若核可近似为分离核 $K(x,y) \approx \sum_{i=1}^m a_i(x) b_i(y)$（如 Karhunen-Loève 展开），则积分方程退化为线性方程组。这正是低秩逼近在积分方程中的应用。

### 221.4 不适定问题与正则化

**定义 221.1**（不适定问题）：第一类积分方程 $\int K(x,y) u(y) dy = f(x)$ 在 $L^2$ 中是不适定的（Hadamard 意义下）：$K$ 的紧性使其逆无界，数据的小误差可能导致解的剧烈变化。

**Tikhonov 正则化**：用正则化泛函

$$u_\alpha = \arg\min_u \left\{ \|K u - f\|_{L^2}^2 + \alpha \|u\|_{L^2}^2 \right\}$$

代替原问题，其中 $\alpha > 0$ 是正则化参数。等价于求解

$$(K^* K + \alpha I) u_\alpha = K^* f$$

**定理 221.3**（正则化的收敛性）：若 $\alpha \to 0$ 且 $\alpha$ 以适当速率（依赖于噪声水平 $\delta = \|f - f^\delta\|$）趋于零，则 Tikhonov 解 $u_\alpha^\delta$ 当 $\delta \to 0$ 时收敛于真正解（Morozov 偏差原理给出 $\alpha$ 的选取准则）。

---

---

---

---

---

## 第151章：积分方程在数学物理中的应用
积分方程方法是数学物理问题的三大解法之一（另两种为微分方程方法和变分方法）。

**定理 222.1**（位势理论与边界积分方程）：Laplace 方程 $\Delta u = 0$ 的 Dirichlet 边值问题 $u|_{\partial \Omega} = g$ 等价于边界积分方程

$$\frac{1}{2} \sigma(x) + \int_{\partial \Omega} \frac{\partial G}{\partial n_y}(x,y) \sigma(y) dS_y = g(x)$$

（双层位势表示）。对应的边界积分算子在 $L^2(\partial \Omega)$ 上是紧的（当 $\partial \Omega$ 光滑时），Fredholm 择一定理给出 Dirichlet 问题解的存在唯一性。

**电磁散射理论**：Maxwell 方程的外问题可化为积分方程（电场/磁场积分方程 EFIE/MFIE）；量子力学中 Lippmann-Schwinger 方程 $|\psi\rangle = |\psi_0\rangle + G_0 V |\psi\rangle$ 是散射理论的 Fredholm 积分方程。

**积分-微分方程**：辐射输运方程（Boltzmann 方程的特殊形式）同时含积分和微分算子，通常用离散纵坐标法（$S_N$ 法）加源迭代求解。

---

*本卷建立了积分方程理论的完整体系：Fredholm 积分方程（Fredholm择一定理、Hilbert-Schmidt展开与Mercer定理）、Volterra 积分方程（Neumann级数与拟幂零性、Abel反演公式）、奇异性积分方程（Cauchy主值积分、Plemelj-Sokhotski公式、Riemann-Hilbert问题与非线性陡降方法）、Wiener-Hopf 积分方程与Wiener-Hopf分解，以及Galerkin法、Nyström法、Tikhonov正则化等数值方法。共 6 章。*

---

---

---

---

---

## 第152章（补充）
拓扑向量空间（Topological Vector Space, TVS）是 Bourbaki 单独成卷的核心分析分支。它推广了 Banach 和 Hilbert 空间的框架，容纳了分布理论（Schwartz）、解析函数空间（Montel空间）和 PDE 中常见的非可赋范空间。

### 拓扑向量空间基础

**定义**（拓扑向量空间）：域 $\mathbb{K}$（$\mathbb{R}$ 或 $\mathbb{C}$）上的**拓扑向量空间** $E$ 是一向量空间，装备了 Hausdorff 拓扑，使得加法 $E \times E \to E$ 和数乘 $\mathbb{K} \times E \to E$ 连续。

**定义**（局部凸空间）：若 $E$ 的原点有由凸集组成的邻域基，则 $E$ 是**局部凸空间**（LCS）。等价地，其拓扑可由一族半范数 $\{p_\alpha\}_{\alpha \in A}$ 生成。Banach 空间是局部凸的（单个范数），$C^\infty(\mathbb{R})$ 也是（半范数族 $p_{K,n}(f) = \sup_{x \in K} |f^{(n)}(x)|$，$K$ 紧）。

**定理**（Kolmogorov可赋范准则）：TVS $E$ 是可赋范的当且仅当它是局部凸的且其原点具有有界邻域（即存在原点的邻域 $U$ 使得对任何邻域 $V$，有 $t > 0$ 使 $U \subset tV$）。这解释了为什么许多函数空间需要比范数拓扑更精细的结构。

**定义**（桶空间）：$E$ 中的**桶**（barrel）是吸收所有点的、绝对凸的闭子集。**桶空间**（barrelled space）是每个桶都是原点的邻域的局部凸空间。所有 Fréchet 空间是桶空间。**配对引理**（Banach-Steinhaus 定理的 TVS 推广）：在桶空间中，逐点有界的连续线性算子族是等度连续的。

**定理**（Mackey-Arens 定理）：设 $(E, F)$ 是对偶配对（即 $F \subset E^*$ 分离 $E$ 的点）。$E$ 上所有与 $F$ 相容的（即对偶空间恰为 $F$ 的）局部凸拓扑中，最弱的是弱拓扑 $\sigma(E, F)$，最强的是 Mackey 拓扑 $\tau(E, F)$（由 $F$ 中所有 $\sigma(F, E)$-紧绝对凸集的极生成）。这两者之间的所有相容局部凸拓扑给出相同的连续对偶。

### Fréchet 空间与 LF 空间

**定义**（Fréchet 空间）：**Fréchet 空间**是完全的可度量化局部凸空间。等价地，其拓扑可由一列递增的半范数 $\{p_n\}$ 生成且在此半范数列下完备。例子：$C^\infty[0, 1]$、$\mathcal{S}(\mathbb{R}^n)$（Schwartz 速降函数空间）、全纯函数空间 $\mathcal{O}(U)$。

**定理**（开映射定理的Fréchet推广）：Fréchet空间之间的连续线性满射必定是开的。特别地，连续线性双射自动是同胚（有界逆定理）。

**定理**（闭图像定理的Fréchet推广）：从桶空间到Fréchet空间的线性映射若其图像是闭的，则连续。这在PDE的闭算子理论中至关重要。

**定义**（LF空间）：**LF空间**（严格归纳极限）是一列 Fréchet 空间 $E_1 \subset E_2 \subset \cdots$（每个嵌入是紧的或等距的）的归纳极限，装备使所有嵌入连续的最终局部凸拓扑。例子：紧支撑光滑函数空间 $\mathcal{D}(U) = C_c^\infty(U)$、紧支撑分布空间 $\mathcal{E}'(U)$。$\mathcal{D}(U)$ 不是可度量化的——这是 LF 空间区别于 Fréchet 空间的关键。

### Krein-Milman 定理与 Choquet 理论

**定理**（Krein-Milman定理）：局部凸空间中的紧凸集 $K$ 是其端点集的闭凸包：$K = \overline{\operatorname{conv}}(\operatorname{ext}(K))$。每个紧凸集中的点都是端点的"积分"。

**定理**（Choquet定理 / Choquet-Bishop-de Leeuw 积分表示）：设 $K$ 是局部凸空间中的紧凸集。对任意 $x \in K$，存在 $K$ 的端点集 $\operatorname{ext}(K)$ 上的概率测度 $\mu$（Choquet测度），使得对任意连续仿射函数 $f: K \to \mathbb{R}$，有 $f(x) = \int_{\operatorname{ext}(K)} f \, d\mu$。此即每个点可表示为端点的重心。

*意义*：Krein-Milman 和 Choquet 理论是泛函分析"几何"面的顶峰——将凸集的几何结构（端点）与测度论表示（重心测度）联系起来，在量子力学的 C*-代数态空间表示和遍历理论中极为重要。

---

---

---

---

---

## 第153章（补充）
Bourbaki 将谱理论单独成卷。但教材中紧算子的谱理论（第131章）向无界算子的推广是量子力学数学基础的必要部分。

### 谱测度与谱积分

**定义**（谱测度 / 恒等分解）：Hilbert 空间 $H$ 上的**谱测度**（projection-valued measure）$E$ 是将 Borel 集 $\Delta \subset \mathbb{R}$ 映为 $H$ 上的正交投影 $E(\Delta)$ 的映射，满足：
1. $E(\varnothing) = 0$，$E(\mathbb{R}) = I$
2. $E(\Delta_1 \cap \Delta_2) = E(\Delta_1) E(\Delta_2)$
3. 对互不相交的 $\{\Delta_n\}$，$E(\bigcup \Delta_n) = \sum E(\Delta_n)$（强算子拓扑收敛）

**定理**（谱定理——无界自伴算子，von Neumann 1929）：对 Hilbert 空间 $H$ 上的任意（可能无界的）自伴算子 $A: \mathcal{D}(A) \to H$（$\mathcal{D}(A)$ 稠密），存在唯一的谱测度 $E$ 使得
$$A = \int_{\mathbb{R}} \lambda \, dE(\lambda)$$
积分在 $\mathcal{D}(A) = \{x \in H : \int \lambda^2 \, d\langle E(\lambda)x, x\rangle < \infty\}$ 上理解。这是有限维对角化的无限维推广——自伴算子"被谱测度对角化"。

**定义**（谱积分 / 算子的函数演算）：对 Borel 可测函数 $f: \mathbb{R} \to \mathbb{C}$，定义
$$f(A) = \int_{\mathbb{R}} f(\lambda) \, dE(\lambda)$$
（定义域为 $\{x : \int |f|^2 d\langle E x, x\rangle < \infty\}$）。这给出了 $A$ 的函数演算。特别地，$e^{itA}$（由 $f(\lambda) = e^{it\lambda}$）定义了酉群。

**定理**（Stone定理，1932）：Hilbert 空间上的强连续单参数酉群 $\{U(t)\}_{t \in \mathbb{R}}$ 与（可能无界的）自伴算子 $A$ 一一对应（经 $U(t) = e^{itA}$）。这是量子力学中"能量算子=时间平移生成元"的数学表述。

### 谱重数与本质谱

**定义**（谱重数 / 重数函数）：自伴算子 $A$ 的谱重数函数 $m(\lambda)$ 是在 $\lambda$ 附近谱测度的"秩"。等价于：选取与 $A$ 交换的极大 Abel 代数中的循环向量，将其作为 $L^2(\sigma(A), d\mu)$ 上的乘法算子表示。若 $m(\lambda) \equiv 1$（几乎处处），$A$ 称为具有**单谱**。

**定义**（本质谱与Weyl定理）：$A$ 的**本质谱** $\sigma_{\text{ess}}(A)$ 是去除了有限重数孤立特征值后的剩余谱。**Weyl准则**：$\lambda \in \sigma_{\text{ess}}(A)$ 当且仅当存在 Weyl 序列 $(x_n) \subset \mathcal{D}(A)$ 满足 $\|x_n\| = 1$，$x_n \rightharpoonup 0$（弱收敛）且 $\|(A - \lambda I)x_n\| \to 0$。本质谱在紧摄动下不变（Weyl定理）。

**定理**（Fredholm算子与本质谱）：$A - \lambda I$ 是 Fredholm 算子（核有限维、值域闭、余核有限维）当且仅当 $\lambda \notin \sigma_{\text{ess}}(A)$。Fredholm 指标 $\operatorname{ind}(A - \lambda I) = \dim \ker - \dim \operatorname{coker}$ 在 $\sigma_{\text{ess}}(A)$ 的连通分支上为常数。

---

---

---

---

---

## 第154章（补充）
分布理论（Distribution Theory / Generalized Functions）由 Laurent Schwartz 于 1945-1951 年创立（获 1950 年 Fields 奖），将"函数"概念推广为线性泛函，使得诸如 Dirac δ 函数、函数的广义导数、局部可积函数的弱导数等获得严格意义。它统一了 PDE 理论、调和分析和泛函分析。

### Schwartz空间与缓增分布

**定义**（速降函数空间 / Schwartz 空间）：$\mathbb{R}^n$ 上的 **Schwartz 空间** $\mathcal{S}(\mathbb{R}^n)$ 是所有光滑函数 $f \in C^\infty(\mathbb{R}^n)$ 的集合，满足对任意多重指标 $\alpha, \beta$，
$$\sup_{x \in \mathbb{R}^n} |x^\alpha D^\beta f(x)| < \infty$$
即 $f$ 及其所有导数在无穷远处比任何多项式的倒数下降得更快。$\mathcal{S}(\mathbb{R}^n)$ 是 Fréchet 空间（由可数族半范数 $\|f\|_{k, m} = \sup_{|\alpha| \leq k, |\beta| \leq m} |x^\alpha D^\beta f|$ 生成）。

**定义**（缓增分布 / tempered distribution）：**缓增分布**是 $\mathcal{S}(\mathbb{R}^n)$ 上的连续线性泛函。集合 $\mathcal{S}'(\mathbb{R}^n)$（缓增分布空间）装备弱-*拓扑。缓增分布包含了所有 $L^p(\mathbb{R}^n)$ 函数（$1 \leq p \leq \infty$）、所有多项式、缓增测度和 Dirac δ 函数列。

**命题**（嵌入与运算）：
- $L^p(\mathbb{R}^n) \subset \mathcal{S}'(\mathbb{R}^n)$：通过 $T_f(\varphi) = \int f \varphi \, dx$ 嵌入（局部可积的缓增增长函数）
- **分布的导数**：对 $T \in \mathcal{S}'$，定义 $\langle D^\alpha T, \varphi \rangle = (-1)^{|\alpha|} \langle T, D^\alpha \varphi \rangle$。每阶分布导数都存在——这是分布理论的核心：所有分布无穷次可微
- **Fourier变换**：$\mathcal{S}$ 上的 Fourier 变换 $\mathcal{F}$ 是同构，经对偶扩展到 $\mathcal{S}'$：$\langle \mathcal{F}T, \varphi \rangle = \langle T, \mathcal{F}\varphi \rangle$

**例**：$T = \delta$（Dirac δ）：$\langle \delta, \varphi \rangle = \varphi(0)$。其导数为 $\langle \delta', \varphi \rangle = -\varphi'(0)$。Heaviside阶梯函数 $H(x) = \mathbf{1}_{[0,\infty)}(x)$ 的分布导数是 δ：$H' = \delta$。

### 分布的局部理论与紧支撑分布

**定义**（分布空间 / 一般分布）：$\mathbb{R}^n$ 上的（一般）**分布**空间 $\mathcal{D}'(\mathbb{R}^n)$ 是紧支撑光滑函数空间 $\mathcal{D}(\mathbb{R}^n) = C_c^\infty(\mathbb{R}^n)$（装备 LF 空间拓扑）上的连续线性泛函。任何局部可积函数通过 $T_f(\varphi) = \int f \varphi \, dx$ 定义分布。

**定理**（分布的局部结构定理）：每个分布 $T \in \mathcal{D}'(\Omega)$ 在局部上是某连续函数的导数：对任意紧集 $K \subset \Omega$，存在多重指标 $\alpha$ 和连续函数 $g$ 使得 $T|_K = D^\alpha g$。

**定义**（紧支撑分布 / $\mathcal{E}'$）：有紧支撑的分布全体记为 $\mathcal{E}'(\mathbb{R}^n)$，它是光滑函数空间 $C^\infty(\mathbb{R}^n)$ 上具有紧支撑连续性（即对每个紧集 $K$ 存在 $C_K$ 使得 $|\langle T, \varphi \rangle| \leq C_K \|\varphi\|_{C^m(K)}$）的线性泛函全体。

**定理**（Paley-Wiener-Schwartz）：$\mathcal{E}'(\mathbb{R}^n)$ 中分布的 Fourier 变换是 $\mathbb{R}^n$ 上的实解析函数，且是多项式增长的。

### 分布的卷积与基本解

**定义**（分布的卷积）：若 $T \in \mathcal{D}'$ 和 $\varphi \in \mathcal{D}$，定义 $(T * \varphi)(x) = \langle T, \varphi(x - \cdot) \rangle$。对于两个分布 $S, T$，当至少一个有紧支撑时可定义 $S * T$。卷积是结合的、交换的，且 $D^\alpha(S * T) = (D^\alpha S) * T = S * (D^\alpha T)$。

**定义**（基本解 / fundamental solution）：常系数线性偏微分算子 $P(D) = \sum_{|\alpha| \leq m} a_\alpha D^\alpha$ 的**基本解**是分布 $E \in \mathcal{D}'$ 满足
$$P(D) E = \delta$$
基本解给出非齐次方程 $P(D)u = f$ 的一个特解 $u = E * f$（当 $f$ 有紧支撑时）。

**定理**（Malgrange-Ehrenpreis 定理，1954-1955）：任意非零常系数线性偏微分算子都有基本解。

**例**：Laplace算子的基本解：$\mathbb{R}^n$（$n \geq 3$）中 $E(x) = c_n |x|^{2-n}$ 满足 $\Delta E = \delta$；$\mathbb{R}^2$ 中 $E(x) = \frac{1}{2\pi} \log |x|$。热方程的基本解（热核）：$E(x, t) = \frac{\mathbf{1}_{[0,\infty)}(t)}{(4\pi t)^{n/2}} e^{-|x|^2/4t}$。

### Sobolev空间的分布定义

**定义**（Sobolev 空间 / Sobolev 空间 $H^s(\mathbb{R}^n)$）：使用 Fourier 变换和分布定义 **Sobolev 空间** $H^s(\mathbb{R}^n)$（$s \in \mathbb{R}$）：
$$H^s(\mathbb{R}^n) = \{u \in \mathcal{S}'(\mathbb{R}^n) : (1 + |\xi|^2)^{s/2} \mathcal{F}u(\xi) \in L^2(\mathbb{R}^n)\}$$
范数为 $\|u\|_{H^s} = \|(1 + |\xi|^2)^{s/2} \mathcal{F}u\|_{L^2}$。当 $s = k \in \mathbb{Z}_{\geq 0}$ 时，这就是经典的"直到 $k$ 阶导数在 $L^2$ 中"的 Sobolev 空间。$H^{-s}$ 包含 Dirac δ 等（$n/2 < s$）奇异对象。

**定理**（Sobolev 嵌入定理 / Sobolev 引理）：若 $s > n/2$，则 $H^s(\mathbb{R}^n) \subset C^0(\mathbb{R}^n)$（嵌入连续函数空间）。更一般地，若 $s > k + n/2$，则 $H^s \subset C^k$。这种"正则性提升"是 PDE 研究中用 Sobolev 空间消除奇异性的基本工具。

---

*本卷建立了算子代数理论的核心框架：C*-代数（GNS 构造、Gelfand 变换、交换 C*-代数的函数表示）、Hilbert C*-模（Kasparov KK-理论）、完全正映射（Stinespring 扩张、Arveson 扩张）与核 C*-代数、KMS 态与非交换遍历论，以及 Banach 代数与调和分析的统一观点。补充内容涵盖 von Neumann 代数（W*-代数、因子的 Murray-von Neumann 分类（I/II$_1$/II$_\infty$/III 型）、Tomita-Takesaki 模理论、Connes 的 III 型因子分类）和自由概率论（自由独立性、自由卷积、半圆律、自由熵）。**补充部分二**建立了积分方程理论的完整体系：Fredholm积分方程（Fredholm行列式、预解核、Fredholm择一定理、Hilbert-Schmidt展开与Mercer定理）、Volterra积分方程（逐次逼近与Neumann级数、与ODE的等价性、拟幂零性）、奇异积分方程（Cauchy核与Plemelj公式、Riemann-Hilbert问题、Abel反演公式）、Wiener-Hopf积分方程（Wiener-Hopf分解与Fourier变换方法）及数值方法（Galerkin法、Nyström法、退化核逼近、不适定问题的Tikhonov正则化）。共 31 章。*

---


*卷十三：泛函分析终。*


*卷十三：泛函分析终。*


*卷十三：泛函分析终。*


*卷十六：算子代数与积分方程终。*
