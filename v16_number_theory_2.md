# 卷十六：数论 II

> 数论 II 从初等数论（V1 Ch 5）和代数数论（V12 Ch 71）出发，引入解析方法（Dirichlet 级数、Riemann zeta 函数）、模形式理论和椭圆曲线，建立现代数论的核心工具链。本卷以素数定理的完整证明、模形式的 Hecke 理论、椭圆曲线的 Mordell-Weil 定理和类域论初步为目标。

---

## 第187章：解析数论
解析数论用复分析（V9）和 Fourier 分析（V8）的工具研究整数问题。本章的核心是 Dirichlet 级数、Riemann zeta 函数和素数定理的完整证明。

### 85.1 算术函数与 Dirichlet 卷积

**定义 85.1**（算术函数）：**算术函数**是 $f: \mathbb{N}^+ \to \mathbb{C}$ 的函数。常用的算术函数包括：
- $\mathbf{1}(n) = 1$（常数函数）
- $\operatorname{id}(n) = n$（恒等函数）
- $\mu(n)$：Möbius 函数（$\mu(1) = 1$；若 $n$ 有平方因子则 $\mu(n) = 0$；否则 $\mu(n) = (-1)^k$，$k$ 为素因子个数）
- $\varphi(n)$：Euler $\varphi$ 函数（Euler  totient 函数，$\varphi(n) = n \prod_{p \mid n} (1 - 1/p)$）
- $\Lambda(n)$：von Mangoldt 函数（$\Lambda(n) = \log p$ 若 $n = p^k$；否则 $\Lambda(n) = 0$）
- $\tau(n)$：除数函数（$n$ 的正因子个数）
- $\sigma(n)$：除数和函数（$n$ 的正因子之和）

**定义 85.2**（Dirichlet 卷积）：两个算术函数 $f, g$ 的 **Dirichlet 卷积** 为

$$(f * g)(n) = \sum_{d \mid n} f(d) g(n/d)$$

**命题 85.1**：Dirichlet 卷积满足：
1. 结合律：$(f * g) * h = f * (g * h)$
2. 交换律：$f * g = g * f$
3. 单位元 $\delta$（$\delta(1) = 1$，$\delta(n) = 0$ 对 $n > 1$）
4. $f$ 可逆当且仅当 $f(1) \neq 0$

*证明*：1 和 2 由和号重排验证。3 显然。4：构造 $g(n) = -\frac{1}{f(1)} \sum_{d \mid n, d < n} f(n/d) g(d)$ 归纳定义。∎

**命题 85.2**（Möbius 反演）：$\mathbf{1} * \mu = \delta$。即 $\sum_{d \mid n} \mu(d) = 0$（$n > 1$）。等价地，$f(n) = \sum_{d \mid n} g(d)$ 当且仅当 $g(n) = \sum_{d \mid n} \mu(d) f(n/d)$。

*证明*：$\mathbf{1} * \mu$ 在素数幂 $p^k$ 上的值为 $1 - 1 = 0$（$k \geq 1$）。由积性，一般 $n$ 也成立。∎

### 85.2 Dirichlet 级数与 Euler 乘积

**定义 85.3**（Dirichlet 级数）：算术函数 $f$ 的 **Dirichlet 级数** 为

$$D_f(s) = \sum_{n=1}^\infty \frac{f(n)}{n^s}$$

其中 $s = \sigma + it \in \mathbb{C}$。若 $f(n) = O(n^\alpha)$，则 $D_f(s)$ 在 $\Re(s) > \alpha + 1$ 内绝对收敛。

**命题 85.3**（Dirichlet 卷积与级数乘积）：$(f * g)(n)$ 的 Dirichlet 级数是 $D_f(s) D_g(s)$。

*证明*：$D_f(s) D_g(s) = \sum_{a=1}^\infty \frac{f(a)}{a^s} \sum_{b=1}^\infty \frac{g(b)}{b^s} = \sum_{n=1}^\infty \frac{\sum_{ab=n} f(a) g(b)}{n^s} = D_{f*g}(s)$。∎

**定义 85.4**（Euler 乘积）：若 $f$ 是**积性函数**（$f(mn) = f(m)f(n)$ 当 $\gcd(m, n) = 1$），则

$$D_f(s) = \prod_{p \text{ 素数}} \left(1 + \frac{f(p)}{p^s} + \frac{f(p^2)}{p^{2s}} + \cdots\right)$$

若 $f$ 是完全积性函数，则 $D_f(s) = \prod_p \left(1 - \frac{f(p)}{p^s}\right)^{-1}$。

### 85.3 Riemann zeta 函数

**定义 85.5**（Riemann zeta 函数）：对 $\Re(s) > 1$，

$$\zeta(s) = \sum_{n=1}^\infty \frac{1}{n^s}$$

**定理 85.4**（Euler 乘积公式）：对 $\Re(s) > 1$，

$$\zeta(s) = \prod_{p \text{ 素数}} \frac{1}{1 - p^{-s}}$$

*证明*：$\mathbf{1}$ 是完全积性函数，由 Euler 乘积公式即得。∎

**定理 85.5**（$\zeta(s)$ 的解析延拓）：$\zeta(s)$ 可解析延拓为整个复平面上的亚纯函数，仅在 $s = 1$ 处有一个单极点（留数为 $1$）。函数方程：

$$\zeta(s) = 2^s \pi^{s-1} \sin\left(\frac{\pi s}{2}\right) \Gamma(1-s) \zeta(1-s)$$

或等价地，令 $\xi(s) = \frac{1}{2} s(s-1) \pi^{-s/2} \Gamma(s/2) \zeta(s)$，则 $\xi(s) = \xi(1-s)$ 且 $\xi(s)$ 是整函数。

*证明思路*：从 $\zeta(s)$ 的积分表示 $\zeta(s) = \frac{1}{\Gamma(s)} \int_0^\infty \frac{x^{s-1}}{e^x - 1} dx$ 出发，利用 $\theta$ 函数的模性质（Poisson 求和公式）得到函数方程。∎

**定义 85.6**（$\zeta(s)$ 的零点）：
- **平凡零点**：$s = -2, -4, -6, \ldots$（由 $\sin(\pi s/2)$ 项产生）
- **非平凡零点**：$0 < \Re(s) < 1$（临界带）内的零点

**Riemann 猜想**（未证明）：$\zeta(s)$ 的所有非平凡零点都满足 $\Re(s) = 1/2$（临界线）。

### 85.4 素数定理

**定理 85.6**（素数定理）：设 $\pi(x) = \#\{p \leq x : p \text{ 素数}\}$。则

$$\pi(x) \sim \frac{x}{\log x} \quad (x \to \infty)$$

即 $\lim_{x \to \infty} \frac{\pi(x)}{x / \log x} = 1$。

*证明思路*（Hadamard 和 de la Vallée Poussin，1896）：

1. 定义 Chebyshev $\psi$ 函数：$\psi(x) = \sum_{n \leq x} \Lambda(n)$。素数定理等价于 $\psi(x) \sim x$。

2. 由 Perron 公式：$\psi(x) = \frac{1}{2\pi i} \int_{c - i\infty}^{c + i\infty} \left(-\frac{\zeta'(s)}{\zeta(s)}\right) \frac{x^s}{s} ds$（$c > 1$）。

3. 将积分线向左平移，穿越 $s = 1$ 处的极点（贡献 $x$）和 $\zeta(s)$ 的零点。需要证明 $\zeta(s)$ 在 $\Re(s) = 1$ 上无零点（即 $\zeta(1 + it) \neq 0$）。

4. $\zeta(1 + it) \neq 0$ 的证明：使用三角不等式 $3 + 4\cos\theta + \cos 2\theta = 2(1 + \cos\theta)^2 \geq 0$。若 $\zeta(1 + it_0) = 0$，考虑 $\log \zeta(s)$ 的展开，推出矛盾。

5. 零点密度估计：证明 $\psi(x) - x$ 的误差项为 $o(x)$，从而 $\psi(x) \sim x$。∎

**定理 85.7**（素数定理的误差项）：若 Riemann 猜想成立，则 $\pi(x) = \operatorname{Li}(x) + O(\sqrt{x} \log x)$，其中 $\operatorname{Li}(x) = \int_2^x \frac{dt}{\log t}$。

**定理 85.8**（等差数列中的素数定理，Dirichlet）：若 $\gcd(a, q) = 1$，则等差数列 $a, a+q, a+2q, \ldots$ 中包含无穷多个素数。且

$$\pi(x; q, a) \sim \frac{1}{\varphi(q)} \frac{x}{\log x} \quad (x \to \infty)$$

*证明思路*：引入 Dirichlet 特征 $\chi$（模 $q$ 的群同态 $(\mathbb{Z}/q\mathbb{Z})^\times \to \mathbb{C}^\times$），构造 Dirichlet $L$-函数 $L(s, \chi) = \sum_{n=1}^\infty \frac{\chi(n)}{n^s} = \prod_{p \nmid q} (1 - \chi(p)p^{-s})^{-1}$（$L$-函数的 Euler 乘积）。关键三步：(1) 利用特征的正交性 $\frac{1}{\varphi(q)} \sum_\chi \overline{\chi(a)} \chi(n) = \mathbf{1}_{n \equiv a \pmod q}$，将算术级数中的素数计数函数 $\psi(x; q, a)$ 表示为所有 $L$-函数对数导数的线性组合：$\psi(x; q, a) \sim \frac{1}{\varphi(q)} \sum_\chi \overline{\chi(a)} \sum_{n \leq x} \chi(n)\Lambda(n)$。(2) 证明对非主特征 $\chi$，$L(1, \chi) \neq 0$：若 $\chi$ 是复特征（$\chi^2 \neq \chi_0$），利用乘积 $L(s, \chi_0)^3 |L(s, \chi)|^4 |L(s, \chi^2)|^2$ 在 $s=1$ 附近的零点阶数分析导出矛盾；若 $\chi$ 是实特征，需更精细的 Dirichlet 类数公式。(3) 对每个特征 $\chi$，用 Perron 公式和围道积分类似素数定理的证明：$L(s, \chi)$ 在 $\Re(s) = 1$ 上无零点（由 (2) 保证），从而得到 $\sum_{n \leq x} \chi(n)\Lambda(n) = o(x)$（$\chi \neq \chi_0$）和 $\sum_{n \leq x} \chi_0(n)\Lambda(n) \sim x$（主特征），代入特征反演公式即得 $\psi(x; q, a) \sim x/\varphi(q)$。∎

### 85.5 堆垒数论

堆垒数论（Additive Number Theory）研究将整数表示为特定类型整数之和的经典问题。两个核心问题是：（1）**Goldbach猜想**：每个大于2的偶数可表为两个素数之和。陈景润于1966年证明了"1+2"——每个充分大的偶数可表为一个素数和一个至多两个素数乘积的数之和，这是迄今为止最好的结果。Helfgott于2013年完整证明了三素数定理：每个大于5的奇数可表为三个素数之和。（2）**Waring问题**（1770年）：对每个正整数$k$，存在$g(k)$使得每个正整数可表为至多$g(k)$个$k$次幂之和。Lagrange四平方和定理即$g(2)=4$。记$G(k)$为充分大整数所需的最少$k$次幂个数，已知$G(2)=4$，而$G(k)$的确切值对$k \geq 3$仍是重大未解问题。处理这类问题的核心工具是**圆法**（Hardy-Littlewood-Ramanujan，1920年代），其基本思想是将计数函数表示为单位圆上的积分，利用有理点附近的主项渐近展开与余项的三角和估计得到结果。

### 85.6 连分数理论

实数$x$的**简单连分数**展开为

$$x = a_0 + \cfrac{1}{a_1 + \cfrac{1}{a_2 + \cdots}} = [a_0; a_1, a_2, \ldots]$$

其中$a_0 \in \mathbb{Z}$，$a_i \in \mathbb{N}^+$（$i \geq 1$）。若展开有限，则$x \in \mathbb{Q}$；反之亦然。**Lagrange定理**（1770年）：二次无理数（有理系数二次方程的根）的连分数展开是最终周期的，这一性质刻画了二次无理数。收敛子$p_n/q_n = [a_0; a_1, \ldots, a_n]$是$x$的**最佳有理逼近**，满足$|q x - p| < |q' x - p'|$对所有分母$q' \leq q$且$p'/q' \neq p_n/q_n$成立。连分数与**Pell方程**$x^2 - Dy^2 = \pm 1$的自然联系是：$\sqrt{D}$的连分数周期$r$给出了基本解$(x_1, y_1) = (p_{r-1}, q_{r-1})$（当$r$为偶数时）或$(p_{2r-1}, q_{2r-1})$（当$r$为奇数时）。

### 85.7 数的几何

**数的几何**（Geometry of Numbers）由Minkowski于1896年创立，用几何方法研究格点分布与数论问题。设$\Lambda \subseteq \mathbb{R}^n$是**格**（discrete subgroup），即$\Lambda = \{\sum a_i v_i : a_i \in \mathbb{Z}\}$，其协体积$\operatorname{covol}(\Lambda) = |\det(v_1, \ldots, v_n)|$。**Minkowski第一定理**：若$K \subseteq \mathbb{R}^n$是中心对称凸体且$\operatorname{vol}(K) > 2^n \operatorname{covol}(\Lambda)$，则$K \cap (\Lambda \setminus \{0\}) \neq \varnothing$。**Minkowski第二定理**：对中心对称凸体$K$，其连续极小$\lambda_1 \leq \cdots \leq \lambda_n$满足$\frac{2^n}{n!} \operatorname{covol}(\Lambda) \leq \lambda_1 \cdots \lambda_n \cdot \operatorname{vol}(K) \leq 2^n \operatorname{covol}(\Lambda)$。经典应用包括：（1）Dirichlet单位定理的几何证明——对数嵌入$\ell: \mathcal{O}_K^\times \to \mathbb{R}^{r_1+r_2}$将单位群映为秩$r_1+r_2-1$的格；（2）Minkowski判别式界——$|\operatorname{disc}(K)| \geq (\pi/4)^{2r_2} (n^n/n!)^2$，由此可推出$\mathbb{Q}$不存在非平凡的无处分歧扩张。

---

---

---

## 第188章：模形式导论
模形式是全纯函数，在模群 $\operatorname{SL}_2(\mathbb{Z})$ 的作用下具有优美的变换性质。它们是连接数论、表示论和代数几何的桥梁。

### 86.1 模群与上半平面

**定义 86.1**（上半平面）：**上半平面** $\mathbb{H} = \{z \in \mathbb{C} : \Im(z) > 0\}$。

**定义 86.2**（模群）：**模群** $\operatorname{SL}_2(\mathbb{Z}) = \left\{\begin{pmatrix} a & b \\ c & d \end{pmatrix} : a, b, c, d \in \mathbb{Z}, ad - bc = 1\right\}$。模群通过分式线性变换作用于 $\mathbb{H}$：

$$\gamma \cdot z = \frac{az + b}{cz + d}, \quad \gamma = \begin{pmatrix} a & b \\ c & d \end{pmatrix} \in \operatorname{SL}_2(\mathbb{Z})$$

**定义 86.3**（基本域）：$\operatorname{SL}_2(\mathbb{Z})$ 在 $\mathbb{H}$ 上的作用的基本域为

$$\mathcal{F} = \left\{z \in \mathbb{H} : |z| \geq 1, |\Re(z)| \leq \frac{1}{2}\right\}$$

$\operatorname{SL}_2(\mathbb{Z})$ 由 $S = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}$（$z \mapsto -1/z$）和 $T = \begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}$（$z \mapsto z + 1$）生成。

### 86.2 模形式的定义

**定义 86.4**（权 $k$ 的因子）：对 $\gamma = \begin{pmatrix} a & b \\ c & d \end{pmatrix} \in \operatorname{SL}_2(\mathbb{Z})$，定义**自守因子** $j(\gamma, z) = cz + d$。

**定义 86.5**（权 $k$ 模形式）：全纯函数 $f: \mathbb{H} \to \mathbb{C}$ 称为 $\operatorname{SL}_2(\mathbb{Z})$ 上的**权 $k$ 模形式**（$k$ 为偶数），如果

1. $f(\gamma \cdot z) = (cz + d)^k f(z)$ 对所有 $\gamma \in \operatorname{SL}_2(\mathbb{Z})$
2. $f$ 在无穷远处全纯（即 $f(z)$ 在 $\Im(z) \to \infty$ 时有 Fourier 展开 $f(z) = \sum_{n=0}^\infty a_n q^n$，$q = e^{2\pi i z}$，无负指数项）

若 $a_0 = 0$，则 $f$ 称为**尖点形式**（cusp form）。

**定义 86.6**（模形式空间）：记 $M_k(\operatorname{SL}_2(\mathbb{Z}))$ 为权 $k$ 模形式构成的 $\mathbb{C}$-向量空间，$S_k(\operatorname{SL}_2(\mathbb{Z}))$ 为权 $k$ 尖点形式构成的子空间。

**定理 86.1**（模形式空间的维数）：

$$\dim M_k(\operatorname{SL}_2(\mathbb{Z})) = \begin{cases} \lfloor k/12 \rfloor & k \equiv 2 \pmod{12} \\ \lfloor k/12 \rfloor + 1 & k \not\equiv 2 \pmod{12} \end{cases}$$

对 $k \geq 4$ 偶。$M_0(\operatorname{SL}_2(\mathbb{Z})) = \mathbb{C}$（常数函数），$M_2(\operatorname{SL}_2(\mathbb{Z})) = 0$（没有权 $2$ 的非零模形式）。

### 86.3 Eisenstein 级数

**定义 86.7**（Eisenstein 级数）：对偶数 $k \geq 4$，权 $k$ 的 **Eisenstein 级数** 为

$$G_k(z) = \sum_{(m,n) \in \mathbb{Z}^2 \setminus \{(0,0)\}} \frac{1}{(mz + n)^k}$$

归一化 Eisenstein 级数：$E_k(z) = \frac{1}{2\zeta(k)} G_k(z)$。

**命题 86.2**（Eisenstein 级数的 Fourier 展开）：

$$E_k(z) = 1 - \frac{2k}{B_k} \sum_{n=1}^\infty \sigma_{k-1}(n) q^n$$

其中 $B_k$ 是 Bernoulli 数，$\sigma_{k-1}(n) = \sum_{d \mid n} d^{k-1}$。

*证明*：使用 Poisson 求和公式（或 Lipschitz 求和公式）展开 $G_k(z)$。∎

**定理 86.3**（模形式环的结构）：$M_*(\operatorname{SL}_2(\mathbb{Z})) = \bigoplus_{k \geq 0} M_k$ 是 $\mathbb{C}$ 上的多项式环，由 $E_4$ 和 $E_6$ 生成：

$$M_*(\operatorname{SL}_2(\mathbb{Z})) \cong \mathbb{C}[E_4, E_6]$$

其中 $E_4$ 和 $E_6$ 代数无关。$E_4$ 的权为 $4$，$E_6$ 的权为 $6$。

**例 86.1**：判别式模形式 $\Delta(z) = \frac{E_4(z)^3 - E_6(z)^2}{1728} = q \prod_{n=1}^\infty (1 - q^n)^{24}$ 是权 $12$ 的尖点形式。$\Delta(z)$ 的 Fourier 系数 $\tau(n)$（Ramanujan $\tau$ 函数）满足著名的 Ramanujan 猜想（Deligne 证明，1974）：$|\tau(p)| \leq 2p^{11/2}$。

### 86.4 Hecke 算子

**定义 86.8**（Hecke 算子）：对正整数 $n$，权 $k$ 模形式上的 **Hecke 算子** $T_n$ 定义为

$$(T_n f)(z) = n^{k-1} \sum_{ad = n} \frac{1}{d^k} \sum_{b=0}^{d-1} f\left(\frac{az + b}{d}\right)$$

**命题 86.4**（Hecke 算子的性质）：
1. $T_n: M_k \to M_k$ 和 $T_n: S_k \to S_k$ 是线性算子
2. $T_m T_n = T_n T_m$（交换）
3. 若 $\gcd(m, n) = 1$，则 $T_m T_n = T_{mn}$
4. 对素数 $p$，$T_{p^{r+1}} = T_p T_{p^r} - p^{k-1} T_{p^{r-1}}$

**定义 86.9**（Hecke 特征形式）：若 $f \in S_k$ 是所有 $T_n$ 的共同特征向量，则称 $f$ 为 **Hecke 特征形式**。若进一步 $a_1 = 1$，则 $f$ 是**正规化 Hecke 特征形式**，此时 $T_n f = a_n f$，且 $a_n$ 满足 $a_m a_n = \sum_{d \mid \gcd(m,n)} d^{k-1} a_{mn/d^2}$。

**定理 86.5**（Hecke 特征形式的 $L$-函数）：对正规化 Hecke 特征形式 $f(z) = \sum_{n=1}^\infty a_n q^n$，其 $L$-函数

$$L(s, f) = \sum_{n=1}^\infty \frac{a_n}{n^s}$$

有 Euler 乘积：$L(s, f) = \prod_p \frac{1}{1 - a_p p^{-s} + p^{k-1-2s}}$。且 $L(s, f)$ 可解析延拓为整函数，满足函数方程。

---

---

---

## 第189章：椭圆曲线
椭圆曲线是亏格 $1$ 的光滑射影曲线（带有一个指定基点），其上的点构成 Abel 群。椭圆曲线是连接数论、代数几何和模形式的中心对象。

### 87.1 椭圆曲线的定义与群结构

**定义 87.1**（椭圆曲线）：域 $K$（$\operatorname{char} K \neq 2, 3$）上的**椭圆曲线** $E$ 是 Weierstrass 方程

$$E: y^2 = x^3 + ax + b$$

定义的光滑射影曲线（判别式 $\Delta = -16(4a^3 + 27b^2) \neq 0$），加上无穷远点 $\mathcal{O}$。椭圆曲线是亏格 $1$ 的曲线。

**定义 87.2**（群结构）：$E(K)$ 上的群运算定义为：对 $P, Q \in E(K)$，过 $P$ 和 $Q$ 的直线与 $E$ 交于第三点 $R$，定义 $P + Q$ 为 $R$ 关于 $x$ 轴的对称点。$\mathcal{O}$ 是单位元。群运算是交换的。

**命题 87.1**（群运算的显式公式）：设 $P = (x_1, y_1)$，$Q = (x_2, y_2)$，$P \neq \pm Q$。则 $P + Q = (x_3, y_3)$，其中

$$x_3 = \lambda^2 - x_1 - x_2, \quad y_3 = \lambda(x_1 - x_3) - y_1, \quad \lambda = \frac{y_2 - y_1}{x_2 - x_1}$$

若 $P = Q$（倍点），则 $\lambda = \frac{3x_1^2 + a}{2y_1}$。

*证明*：由直线与三次曲线的交点关系导出。使用 Vieta 公式计算第三个交点。∎

### 87.2 有限域上的椭圆曲线

**定理 87.2**（Hasse 定理）：设 $E$ 是有限域 $\mathbb{F}_q$（$q = p^n$）上的椭圆曲线。则

$$| \#E(\mathbb{F}_q) - (q + 1) | \leq 2\sqrt{q}$$

**定义 87.3**（$L$-函数）：$E/\mathbb{F}_q$ 的 **zeta 函数** 为

$$Z(E/\mathbb{F}_q, T) = \exp\left(\sum_{n=1}^\infty \#E(\mathbb{F}_{q^n}) \frac{T^n}{n}\right) = \frac{1 - a_q T + q T^2}{(1 - T)(1 - qT)}$$

其中 $a_q = q + 1 - \#E(\mathbb{F}_q)$。$1 - a_q T + q T^2 = (1 - \alpha T)(1 - \beta T)$，$|\alpha| = |\beta| = \sqrt{q}$（Hasse 定理的等价形式）。

**定理 87.3**（椭圆曲线的挠群，陈述）：设 $E$ 是 $\mathbb{Q}$ 上的椭圆曲线。则 $E(\mathbb{Q})_{\text{tors}}$（有理挠群）同构于以下 15 个群之一：

$$\mathbb{Z}/n\mathbb{Z} \quad (1 \leq n \leq 10, n = 12), \quad \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2n\mathbb{Z} \quad (n = 1, 2, 3, 4)$$

（Mazur 定理，1977）。

### 87.3 Mordell-Weil 定理

**定理 87.4**（Mordell-Weil 定理）：设 $E$ 是数域 $K$ 上的椭圆曲线。则 $E(K)$ 是有限生成 Abel 群：

$$E(K) \cong \mathbb{Z}^r \oplus E(K)_{\text{tors}}$$

其中 $r = \operatorname{rank} E(K)$ 是 **Mordell-Weil 秩**（有限但计算困难），$E(K)_{\text{tors}}$ 是有限挠子群。

*证明思路*（Weil 的证明，1928）：
1. 弱 Mordell-Weil 定理：$E(K)/2E(K)$ 是有限群。
2. 在 $E(K)$ 上定义**高度函数**（height function）$h: E(K) \to \mathbb{R}_{\geq 0}$，满足：$h(2P) = 4h(P) + O(1)$，且 $\{P : h(P) \leq C\}$ 有限。
3. 由有限下降法（infinite descent）：$E(K)/2E(K)$ 有限 + 高度函数的性质 ⇒ $E(K)$ 有限生成。∎

**定义 87.4**（高度函数）：对 $P = (x, y) \in E(\mathbb{Q})$，$x = a/b$（最简分数），定义**朴素高度** $H(P) = \max(|a|, |b|)$，**对数高度** $h(P) = \log H(P)$。**典范高度**（Néron-Tate 高度）$\hat{h}(P) = \lim_{n \to \infty} \frac{h(2^n P)}{4^n}$。

**命题 87.5**（典范高度的性质）：
1. $\hat{h}(P) = 0$ 当且仅当 $P$ 是挠点
2. $\hat{h}(mP) = m^2 \hat{h}(P)$
3. $\hat{h}(P + Q) + \hat{h}(P - Q) = 2\hat{h}(P) + 2\hat{h}(Q)$（平行四边形律）

### 87.4 Birch 和 Swinnerton-Dyer 猜想

**定义 87.5**（$E/\mathbb{Q}$ 的 Hasse-Weil $L$-函数）：设 $E/\mathbb{Q}$ 是椭圆曲线。对素数 $p$，令 $a_p = p + 1 - \#E(\mathbb{F}_p)$。$E$ 的 $L$-函数为

$$L(E, s) = \prod_{p \text{ 好约化}} \frac{1}{1 - a_p p^{-s} + p^{1-2s}} \cdot \prod_{p \text{ 坏约化}} \frac{1}{1 - a_p p^{-s}}$$

其中 $a_p$ 在坏约化时取 $0, 1, -1$（取决于约化类型）。$L(E, s)$ 在 $\Re(s) > 3/2$ 内绝对收敛。

**定理 87.6**（模性定理，Wiles 等，1995-2001）：$\mathbb{Q}$ 上的每条椭圆曲线都是模的：存在权 $2$ 的 Hecke 特征形式 $f$（其 Fourier 系数 $a_n$ 为整数），使得 $L(E, s) = L(s, f)$。

特别地，$L(E, s)$ 可解析延拓为整个复平面上的整函数，满足函数方程。

**BSD 猜想**（Birch 和 Swinnerton-Dyer，1965）：
1. $\operatorname{ord}_{s=1} L(E, s) = \operatorname{rank} E(\mathbb{Q})$（$L$-函数在 $s=1$ 处的零点阶数等于秩）
2. $L(E, s)$ 在 $s=1$ 处的 Taylor 展开首项系数由 $E$ 的算术不变量（Tate-Shafarevich 群、挠群、调节子等）精确给出

BSD 猜想是 Clay 数学研究所七大千禧年问题之一，目前仅对秩 $0$ 和 $1$ 的椭圆曲线部分证明。

---

---

---

## 第190章：类域论初步
类域论是代数数论的最高成就，描述了数域（或局部域）的 Abel 扩张与其理想类群（或乘性群）之间的深刻对应。

### 88.1 局部域

**定义 88.1**（局部域）：**局部域**是连通局部紧的拓扑域。包括：
- **Archimedean 局部域**：$\mathbb{R}$ 和 $\mathbb{C}$
- **非 Archimedean 局部域**：$\mathbb{Q}_p$（$p$-进数域）的有限扩张

**定义 88.2**（$p$-进数域）：$\mathbb{Q}_p$ 是 $\mathbb{Q}$ 在 $p$-进度量 $|x|_p = p^{-v_p(x)}$ 下的完备化，其中 $v_p(x)$ 是 $x$ 的 $p$-进赋值。$\mathbb{Z}_p = \{x \in \mathbb{Q}_p : |x|_p \leq 1\}$ 是 $p$-进整数环。

**命题 88.1**：$\mathbb{Q}_p$ 的每个有限扩张 $K$ 带有一个离散赋值 $v_K$，剩余域为 $\mathbb{F}_q$（$q = p^f$）。$\mathcal{O}_K = \{x \in K : v_K(x) \geq 0\}$ 是 $K$ 的整数环，$\mathfrak{p}_K = \{x : v_K(x) > 0\}$ 是极大理想。

### 88.2 局部类域论

**定义 88.3**（局部域上的 Weil 群）：设 $K$ 是局部域，$K^{\text{ab}}$ 是 $K$ 的极大 Abel 扩张。局部类域论的核心是**局部互反映射**（local reciprocity map）

$$\rho_K: K^\times \to \operatorname{Gal}(K^{\text{ab}}/K)$$

**定理 88.1**（局部互反律）：存在自然的连续同态 $\rho_K: K^\times \to \operatorname{Gal}(K^{\text{ab}}/K)$，满足：
1. $\rho_K$ 的像是稠密的，核为 $K^\times$ 中范数子群的交
2. 对有限 Abel 扩张 $L/K$，$\rho_K$ 诱导同构 $K^\times / N_{L/K}(L^\times) \cong \operatorname{Gal}(L/K)$
3. 若 $K = \mathbb{Q}_p$，则 $\rho_K$ 限制在 $\mathbb{Z}_p^\times$ 上是 $\operatorname{Gal}(\mathbb{Q}_p^{\text{unr}}/\mathbb{Q}_p)$ 上的 Frobenius 自同构

**推论 88.2**：局部域 $K$ 的有限 Abel 扩张与 $K^\times$ 的有限指数开子群（范数子群）一一对应。

### 88.3 整体类域论

**定义 88.4**（Adèle 环与 Idèle 群）：数域 $K$ 的 **Adèle 环** $\mathbb{A}_K$ 是所有完备化 $\prod_v' K_v$ 的限制直积。**Idèle 群** $\mathbb{I}_K = \mathbb{A}_K^\times$ 是 Adèle 环的乘法群。

**定理 88.3**（整体互反律，Artin 互反律）：设 $K$ 是数域，$K^{\text{ab}}$ 是 $K$ 的极大 Abel 扩张。存在自然的连续同态（整体互反映射）

$$\rho_K: \mathbb{I}_K \to \operatorname{Gal}(K^{\text{ab}}/K)$$

满足：
1. $\rho_K$ 是满射，核为 $K^\times$ 在 $\mathbb{I}_K$ 中的闭包（连通分支的乘积）
2. 对有限 Abel 扩张 $L/K$，$\rho_K$ 诱导同构 $\mathbb{I}_K / K^\times N_{L/K}(\mathbb{I}_L) \cong \operatorname{Gal}(L/K)$
3. $\rho_K$ 与局部互反映射兼容：对每个位 $v$，$\rho_K|_{K_v^\times} = \rho_{K_v}$

**推论 88.4**（理想类群的类域论解释）：设 $H_K$ 是 $K$ 的 Hilbert 类域（$K$ 的极大无处分歧 Abel 扩张）。则 Artin 映射诱导同构

$$\operatorname{Cl}(K) \cong \operatorname{Gal}(H_K/K)$$

其中 $\operatorname{Cl}(K)$ 是 $K$ 的理想类群。这解释了理想类群的 Galois 意义。

**定理 88.5**（Kronecker-Weber 定理）：$\mathbb{Q}$ 的每个有限 Abel 扩张都包含在某个分圆域 $\mathbb{Q}(\zeta_n)$ 中。等价地，$\mathbb{Q}^{\text{ab}} = \bigcup_{n \geq 1} \mathbb{Q}(\zeta_n)$。

*证明*：这是类域论的特殊情形。由 $\mathbb{Q}$ 的类数公式和局部-整体原理可得。∎

**定理 88.6**（虚二次域的复乘理论，陈述）：设 $K$ 是虚二次域。$K$ 的极大 Abel 扩张 $K^{\text{ab}}$ 由 $K$ 上的椭圆曲线的挠点和特殊值生成（复乘理论 / Kronecker 的青春之梦）。这是类域论的显式构造。

---

---

---

## 第191章：岩泽理论
岩泽理论（Iwasawa Theory）由岩泽健吉于1950年代末创立，是研究数域无限扩域中理想类群和Galois模结构的深刻理论。设$K$为数域，取定素数$p$，考虑$K$的$\mathbb{Z}_p$-扩张$K_\infty/K$——即Galois群同构于加法群$\mathbb{Z}_p$的无限扩张。记$K_n$为中间域（$[K_n:K]=p^n$），$A_n$为$K_n$的理想类群的$p$-Sylow子群。岩泽发现逆向极限$X = \varprojlim A_n$上的Galois作用赋予$X$一个$\Lambda = \mathbb{Z}_p[[T]]$（岩泽代数）的模结构，且$X$是有限生成挠$\Lambda$-模。由结构定理，$X$对应一个特征多项式（岩泽不变量$\mu, \lambda, \nu$）。**岩泽主猜想**（Iwasawa Main Conjecture）断言：$X$的特征理想由$p$-adic $L$-函数生成——即$p$-adic解析对象与代数对象之间的精确等式。**Mazur-Wiles证明**（1984年）：利用模曲线和Galois表示的几何方法，对$\mathbb{Q}$的Abel扩张证明了主猜想，获1995年Cole奖。**Skinner-Urban的进展**（2010年代）：将主猜想推广至$GL(2)$自守形式情形，证明了更多一般代数自守表示对应的岩泽主猜想，是Langlands纲领与岩泽理论交叉的前沿成果。

---

---

---

## 第192章：自守形式
自守形式（Automorphic Forms）是模形式向一般约化代数群$G$的推广，是Langlands纲领的核心研究对象。对$G = GL(2)$，自守形式回到上半平面上的经典模形式；对$G = GL(n)$（$n \geq 3$），自守形式是定义在商空间$GL(n, \mathbb{Z}) \backslash GL(n, \mathbb{R}) / O(n)$上的光滑函数，满足缓增性、$K$-有限性和$Z(\mathfrak{g})$-有限性条件。每个尖点自守表示$\pi$对应一个**自守$L$-函数**$L(s, \pi) = \prod_p L_p(s, \pi_p)$，其中$L_p$为局部Langlands对应的Euler因子（如$GL(n)$情形下$L_p(s, \pi_p) = \prod_{i=1}^n (1 - \alpha_i(p) p^{-s})^{-1}$）。**Langlands函子性猜想**断言：若存在$L$-群之间的同态${}^L H \to {}^L G$，则$H$的自守表示可通过函子性提升为$G$的自守表示。**谷山-志村-韦伊猜想**（每条$\mathbb{Q}$上的椭圆曲线是模的，即对应于权2的$GL(2)$自守表示）正是Langlands函子性在$GL(2)$的特例。Wiles于1995年证明了该猜想的半稳定情形，从而奠定了费马大定理的证明；Breuil-Conrad-Diamond-Taylor于2001年完全证明了该猜想，这是Langlands纲领迄今为止最辉煌的成果。

---

---

---

## 第193章：Shimura 簇
Shimura 簇是 Shimura Goro（志村五郎）于 1960 年代引入、由 Deligne 于 1970 年代系统公理化的一类特殊代数簇，它们是模曲线的高维推广。Shimura 簇携带丰富的算术结构，是现代自守形式理论、Langlands 纲领和算术几何的核心几何对象——通过其上同调，自守表示与 Galois 表示（motivic $L$-函数）之间建立了精确的对应。

### 91.1 Shimura 数据与 Shimura 簇的构造

**定义 91.1**（Shimura 数据）：一个 **Shimura 数据**（Shimura datum）是一个对 $(G, X)$，其中：

- $G$ 是 $\mathbb{Q}$ 上的连通简约代数群；
- $X$ 是 $G(\mathbb{R})$ 在其上可逆作用的齐次空间（Hermite 对称域），满足以下 Deligne 公理（SV1-SV6）：

**(SV1)** $G(\mathbb{R})$ 在 $X$ 上的作用是传递的，且对某点 $x \in X$，稳定子群 $K_x = \operatorname{Stab}_{G(\mathbb{R})}(x)$ 是 $G(\mathbb{R})$ 的极大紧子群（精确到有限指数）；

**(SV2)** $X$ 具有 $G(\mathbb{R})$-不变的复结构，且作为 Hermite 对称空间，$X$ 上的每个点给出一个 Hodge 结构（通过 $G \to GL(V)$ 的某个表示）；

**(SV3)** Adjoint 群 $G^{\text{ad}}$ 没有定义在 $\mathbb{Q}$ 上的紧单因子（即 $G^{\text{ad}}$ 无 $\mathbb{Q}$-单的紧因子）；

**(SV4)** 权同态 $w: \mathbb{G}_m \to G$（定义在 $\mathbb{Q}$ 上）满足某些兼容条件；

**(SV5)** 对 $G^{\text{ad}}$ 的每个 $\mathbb{Q}$-单因子，其 $\mathbb{R}$-点是非紧的；

**(SV6)** 对 $G(\mathbb{R})$ 中由 $\operatorname{Lie} G(\mathbb{R})$ 中满足 $J^2 = -\operatorname{id}$ 的复结构 $J$ 的自然作用，$X$ 可等同于 $G(\mathbb{R})$ 的共轭类。

**定义 91.2**（Shimura 簇）：设 $(G, X)$ 是 Shimura 数据，$K \subset G(\mathbb{A}_f)$ 是有限 Adèle 点的紧开子群（称为 **级结构**，level structure）。则 **Shimura 簇** 定义为局部对称空间（双陪集空间）

$$\operatorname{Sh}_K(G, X) = G(\mathbb{Q}) \backslash X \times G(\mathbb{A}_f) / K$$

其中 $G(\mathbb{Q})$ 通过对角嵌入作用于 $X \times G(\mathbb{A}_f)$，$K$ 作用于右因子 $G(\mathbb{A}_f)$。

当 $K$ 充分小时（neat），$G(\mathbb{Q})$ 无固定点的元素作用于 $X \times G(\mathbb{A}_f) / K$，此时 $\operatorname{Sh}_K(G, X)$ 是光滑复流形。

### 91.2 经典例子

**例 91.1**（模曲线）：取 $G = GL(2)_\mathbb{Q}$（更精确地为 $G = GSp(2)$ 或 $G = GL(2)$ 在 $\mathbb{G}_m$ 中的适当限制），$X = \mathbb{H}$（上半平面），$K = K(N) = \{\gamma \in GL(2, \widehat{\mathbb{Z}}) : \gamma \equiv I \pmod{N}\}$。则

$$\operatorname{Sh}_K(GL(2), \mathbb{H}^\pm) = GL(2, \mathbb{Q}) \backslash \mathbb{H}^\pm \times GL(2, \mathbb{A}_f) / K(N) \cong Y(N)(\mathbb{C})$$

即完整的模曲线 $Y(N)$ 的复点。这是 Shimura 簇的原型——所有 Shimura 簇都是模曲线的某种自然推广。

**例 91.2**（Siegel 模簇）：取 $G = GSp(2g)$（辛相似群），$X = \mathbb{H}_g$（Siegel 上半空间——所有 $g \times g$ 对称复矩阵 $Z$ 满足 $\operatorname{Im}(Z) > 0$ 的集合）。则 $\operatorname{Sh}_K(GSp(2g), \mathbb{H}_g)$ 是亏格 $g$ 的主极化 Abelian 簇的模空间 $\mathcal{A}_g$（带级结构）。

Siegel 上半空间 $\mathbb{H}_g$ 的维数为 $g(g+1)/2$，其上 $Sp(2g, \mathbb{R})$ 以分式线性变换作用：

$$\begin{pmatrix} A & B \\ C & D \end{pmatrix} \cdot Z = (AZ + B)(CZ + D)^{-1}$$

**例 91.3**（志村曲线）：设 $B$ 是 $\mathbb{Q}$ 上的四元数代数（definite 或 indefinite）。若 $B$ 在无穷远点分裂（indefinite），取 $G = B^\times$（$B$ 的乘法群），$X = \mathbb{H}$，则 $\operatorname{Sh}_K(B^\times, \mathbb{H})$ 是**志村曲线**（Shimura curve）——紧 Riemann 面。与经典模曲线不同，志村曲线没有尖点（cusp），因为 $G$ 没有 $\mathbb{Q}$-抛物子群。

取 $B$ 在素数 $p$ 处分歧的四元数代数，对应的志村曲线在 $p$-进几何中有重要应用（如 $p$-进一致化理论和 Cerednik-Drinfeld 定理）。

### 91.3 Baily-Borel 定理与典范模型

**定理 91.1**（Baily-Borel 定理，1966 年）：对任意 Shimura 数据 $(G, X)$ 和紧开子群 $K \subset G(\mathbb{A}_f)$，Shimura 簇 $\operatorname{Sh}_K(G, X)$ 具有 **拟射影代数簇** 的自然结构——即 $\operatorname{Sh}_K(G, X)$ 可映为一个拟射影复代数簇的解析化。

*证明思路*：Baily 和 Borel 的证明利用了以下事实：$X$ 是对称域，其上存在 $G(\mathbb{R})$ 不变的 Bergman 度量。将 $G(\mathbb{Q})$ 不变的尖点形式（cusp forms）的 Fourier-Jacobi 展开与复结构的嵌入复合，证明了 $\operatorname{Sh}_K(G, X)$ 满足 Kodaira 嵌入定理的条件。具体地，高次张量的自守形式（权充分大且关于 $K$ 不变的）提供足够多的截面以定义到射影空间的嵌入。该嵌入的像是 Zariski 闭的（由自守形式的代数关系），从而赋予拟射影结构。∎

Baily-Borel 定理也给出了 Shimura 簇的紧化——**Baily-Borel 紧化**（或极小紧化）——通过在边界添加较低维的 Shimura 簇的商。

**定理 91.2**（典范模型，Canonical Model）：Shimura 簇 $\operatorname{Sh}_K(G, X)$ 在**反射域**（reflex field）$E(G, X)$ 上具有有理模型。反射域是 $G$ 的共轭类的定义域，也是关联的零维 Shimura 簇的分裂域。

粗略地说，$\operatorname{Sh}_K(G, X)$ 作为复代数簇可定义在数域 $E(G, X)$ 上——即存在 $E(G, X)$ 上的概型 $\mathcal{S}_K$ 使得 $\mathcal{S}_K \times_{E(G, X)} \mathbb{C} \cong \operatorname{Sh}_K(G, X)$。该模型的构造由 Shimura 的互反律理论给出，利用了 CM 点（complex multiplication points）的 Galois 作用：CM 点对应于特殊自守表示，其上 Galois 群的作用由类域论（整体互反律）描述。

### 91.4 上同调与 Langlands 纲领

Shimura 簇的核心重要性在于：其 **Betti 上同调**（或有理 $\ell$-进上同调）实现了 Langlands 纲领中的 Galois 表示。

**定理 91.3**（Shimura 簇的上同调与自守表示）：设 $(G, X)$ 是 Shimura 数据，$\xi$ 是 $G$ 的代数表示。则总上同调群

$$H^*(\operatorname{Sh}_K(G, X), \mathcal{L}_\xi)$$

（$\mathcal{L}_\xi$ 是由 $\xi$ 确定的局部系统）分解为 $G(\mathbb{A}_f)$-模的直和，每个直和项同构于某个自守表示 $\pi$ 的 $\pi_f$ 部分的若干次副本。即

$$H^*(\operatorname{Sh}_K(G, X), \mathcal{L}_\xi) \cong \bigoplus_{\pi} m(\pi) \cdot \pi_f^K \otimes H^*(\mathfrak{g}, K_\infty, \pi_\infty \otimes \xi)$$

其中 $m(\pi)$ 是 $\pi$ 的重数（离散系列表示的重数有限）。

**推论 91.4**（Galois 表示与 Langlands 对应）：$\ell$-进平展上同调 $H_{\text{ét}}^i(\operatorname{Sh}_K(G, X)_{\overline{\mathbb{Q}}}, \mathbb{Q}_\ell)$ 作为 $G(\mathbb{A}_f) \times \operatorname{Gal}(\overline{\mathbb{Q}} / E)$ 的表示实现了 Langlands 对应的几何版本：每个尖点自守表示 $\pi$ 关联一个 Galois 表示 $\rho_{\pi, \ell}: \operatorname{Gal}(\overline{\mathbb{Q}} / E) \to {}^L G(\mathbb{Q}_\ell)$（到 $L$-群的同态）。

### 91.5 Langlands-Kottwitz 方法与 Hasse-Weil Zeta 函数

**定理 91.5**（Kottwitz 的 Langlands-Kottwitz 方法，1990 年代）：设 $\operatorname{Sh}_K(G, X)$ 是 Shimura 簇（带有光滑整模型）。其 Hasse-Weil zeta 函数（算术 zeta 函数）

$$\zeta(\operatorname{Sh}_K, s) = \prod_{x \in |\operatorname{Sh}_K|} \frac{1}{1 - N(x)^{-s}}$$

（$x$ 遍历 $\operatorname{Sh}_K$ 的闭点）可通过 Langlands 对应的 $L$-函数表达。具体地，Kottwitz 证明了

$$\zeta(\operatorname{Sh}_K, s) = \prod_{\pi} L(s - \frac{\dim \operatorname{Sh}_K}{2}, \pi, r)^{m(\pi)}$$

其中乘积遍历 $G$ 的自守表示 $\pi$，$r$ 是 $L$-群 ${}^L G$ 的某个自然表示（由 Shimura 簇的切丛的 $G$-模结构决定），$L(s, \pi, r)$ 是关联的 $L$-函数。

*证明思路*：Kottwitz 的证明基于三个关键步骤：
(1) **Grothendieck-Lefschetz 迹公式**用于计算 zeta 函数的 Euler 因子：$\#\operatorname{Sh}_K(\mathbb{F}_q) = \sum_i (-1)^i \operatorname{Tr}(\operatorname{Frob}_q \mid H_{\text{ét}}^i(\operatorname{Sh}_K, \mathbb{Q}_\ell))$。
(2) **Langlands-Kottwitz 的稳定迹公式**将几何迹（Shimura 簇在正特征的点数）分解为 Galois 上同调和自守表示的贡献。
(3) **基本引理**（Fundamental Lemma, Ngo Bao Chau 2010 年证明）确保局部轨道积分在整体迹公式中可简化——这是 Langlands 纲领最重大的突破之一，Ngo 因此获得 2010 年 Fields 奖。∎

### 91.6 Shimura 簇的算术应用

1. **志村簇上的 CM 点的 Galois 作用**：CM 点生成 Shimura 簇中 0 维的子簇，其 Galois 作用由类域论完全描述。这是 Hilbert 第 12 问题（Kronecker 青春之梦）的高维推广——虚二次域的显式类域论（复乘理论）推广到更一般的 Shimura 数据。

2. **志村簇的模型与模性提升定理**：$GL(2)$-型 Shimura 簇（模曲线）的整模型理论（Deligne-Rapoport、Katz-Mazur）直接应用于 Wiles 对 Fermat 大定理的证明。高维推广的整模型理论（Kisin、Scholze 等）是 $p$-进自守形式理论的核心。

3. **志村簇和 Langlands 纲领**：Scholze（2013 年）利用 perfectoid 空间理论证明了拟射影 Shimura 簇的 Hodge-Tate 周期映射的某些性质，并构造了志村簇的 $p$-进一致化（类似于 Cerednik-Drinfeld 定理的高维推广）。

4. **André-Oort 猜想**：关于 Shimura 簇中特殊点（CM 点）的 Zariski 闭包——特殊子簇正好是较低维的 Shimura 子簇。该猜想由 Pila-Zannier（2009 年）使用 o-极小性方法在积模曲线情形证明，并由 Klingler-Ullmo-Yafaev 和 Pila-Tsimerman 在一般情形取得重大进展。

---



---

---

---

## 第194章（补充）
> 密码学是研究信息保密和认证的数学基础的科学，其数学内核包含数论（Euler 定理、离散对数）、代数（椭圆曲线群）、组合学和复杂性理论。本卷在数论 II（V17）、抽象代数（V8、V13）和计算理论（V31）的基础上，系统建立编码理论、对称密码、公钥密码、格密码与后量子密码以及密码协议的数学理论。

---

---

---

## 第195章：编码理论深化
编码理论研究在有噪信道中信息传输的数学方法，是 Shannon 信息论（V29）的直接应用和深化。

### 257.1 错误检测与纠错

**定义 257.1**（线性码 / Linear Code）：$[n, k, d]$ 线性码 $C$ 是 $\mathbb{F}_q^n$ 的 $k$ 维子空间，极小距离 $d = \min_{c \neq c' \in C} \operatorname{wt}(c - c')$。$C$ 可纠正 $\lfloor (d-1)/2 \rfloor$ 个错误。

**定义 257.2**（生成矩阵与校验矩阵）：**生成矩阵** $G \in \mathbb{F}_q^{k \times n}$（$C = \{mG : m \in \mathbb{F}_q^k\}$）。**校验矩阵** $H \in \mathbb{F}_q^{(n-k) \times n}$（$C = \{x : H x^T = 0\}$）。$HG^T = 0$。

**定理 257.1**（Singleton 界）：$[n, k, d]$ 码满足 $d \leq n - k + 1$。达到此界的码称为 **MDS 码**（最大距离可分码）。

**定理 257.2**（Hamming 界与 Gilbert-Varshamov 界）：
- **Hamming 界**（球填充界）：$q^k \sum_{i=0}^{\lfloor (d-1)/2 \rfloor} \binom{n}{i} (q-1)^i \leq q^n$
- **Gilbert-Varshamov 界**（存在性界）：存在 $[n, k, d]$ 码满足 $q^{n-k} > \sum_{i=0}^{d-2} \binom{n-1}{i} (q-1)^i$

### 257.2 经典代数编码

**定义 257.3**（Reed-Solomon 码 / RS 码）：取 $n \leq q-1$ 个互异点 $\alpha_1, \ldots, \alpha_n \in \mathbb{F}_q$。RS 码定义为 $\{(f(\alpha_1), \ldots, f(\alpha_n)) : f \in \mathbb{F}_q[x], \deg f < k\}$。RS 码是 MDS 码（$d = n - k + 1$）。

**定义 257.4**（BCH 码与 Reed-Muller 码）：
- **BCH 码**（Bose-Chaudhuri-Hocquenghem，1960）：指定纠错能力 $t$ 的循环码，设计距离 $\delta = 2t + 1$
- **Reed-Muller 码**：基于布尔函数的代数构造，$RM(r, m)$ 参数为 $[2^m, \sum_{i=0}^r \binom{m}{i}, 2^{m-r}]$

**定理 257.3**（Berlekamp-Massey 算法，1968-1969）：BCH 码的解码可通过求解线性递推关系在 $O(n^2)$ 时间内完成。这是代数解码的核心算法。

### 257.3 现代编码：Turbo 码、LDPC 与 Polar 码

**定义 257.5**（Turbo 码，Berrou-Glavieux-Thitimajshima 1993）：Turbo 码通过并行级联两个卷积码并使用迭代软判决解码，性能接近 Shannon 极限（差距 $< 0.7$ dB）。

**定义 257.6**（LDPC 码 / 低密度校验码，Gallager 1963 / MacKay-Neal 1996）：LDPC 码由稀疏校验矩阵定义，使用置信传播（belief propagation）在 Tanner 图上的迭代解码。极长码长下接近 Shannon 极限。

**定理 257.4**（Polar 码的极性化定理 / Arıkan）：通过信道极化（channel polarization）构造的 Polar 码，在码长 $N \to \infty$ 时可达对称信道容量。Polar 码是首个被严格证明可在所有对称二进制输入无记忆信道下达到 Shannon 信道容量的构造性编码方案。

---

---

---

## 第196章：对称密码
对称密码（私钥密码）使用相同的密钥进行加密和解密，其安全性模型由 Shannon 完全保密定理和信息论框架给出。

### 258.1 密码学基础概念

**定义 258.1**（加密方案 / Encryption Scheme）：对称加密方案由三个算法组成：
- $\mathsf{Gen}(1^\lambda) \to k$：密钥生成（安全参数 $\lambda$）
- $\mathsf{Enc}(k, m) \to c$：加密（明文 $m$，密文 $c$）
- $\mathsf{Dec}(k, c) \to m$：解密

**定义 258.2**（Shannon 完美保密 / Perfect Secrecy，1949）：加密方案具有完美保密性，如果对任意分布 $M$、任意明文 $m$ 和任意密文 $c$，
$$\Pr[M = m | C = c] = \Pr[M = m]$$
等价地，$|K| \geq |M|$ 且每个密钥以等概率使用（一次性密钥包 / one-time pad）。

**定理 258.3**（Shannon完美保密性的充要条件）：对称加密方案 $(K, M, C, E, D)$ 具有完美保密性当且仅当 $|K| \geq |M|$ 且密钥均匀随机分布。

*证明概要*（一次一密的证明）：充分性：设有均匀随机密钥 $k$ 且 $|K| \geq |M|$。对任意 $(m, c)$，$\Pr[C=c|M=m] = \Pr[K = k: E(k,m)=c] = 1/|K|$（或0若不存在）。由于该条件概率不依赖于 $m$，Bayes公式给出 $\Pr[M=m|C=c] = \Pr[M=m]$，即完美保密。必要性：若 $\Pr[M=m|C=c] = \Pr[M=m]$，则对任意 $m_1, m_2$ 和 $c$，$\Pr[C=c|M=m_1] = \Pr[C=c|M=m_2]$。这意味着对不同明文，密文分布相同，因此必须有至少与明文空间一样大的密钥空间 $|K| \geq |M|$，且每个密钥被等概率选中。一次一密（One-Time Pad）是满足此条件的典范构造，其中 $c = m \oplus k$。∎

**定义 258.3**（不可区分性 / IND-CPA 与 IND-CCA）：现代密码学使用计算安全性（非信息论安全）：
- **IND-CPA**（选择明文攻击下的不可区分性）：攻击者不能区分两个自选明文的加密
- **IND-CCA**（选择密文攻击下的不可区分性）：即使有解密谕示，攻击者也不能区分加密

### 258.2 分组密码与流密码

**定义 258.4**（分组密码 / Block Cipher）：$E: \{0,1\}^k \times \{0,1\}^n \to \{0,1\}^n$。DES（$n=64, k=56$）、AES（$n=128, k=128/192/256$）。

**定义 258.5**（AES / 高级加密标准）：AES 是取代-置换网络（SPN），由 SubBytes（S 盒）、ShiftRows、MixColumns 和 AddRoundKey 四步组成，轮数由密钥长度决定。

**定义 258.6**（流密码 / Stream Cipher）：使用伪随机生成器从种子密钥生成密钥流：$c_i = m_i \oplus G(k)_i$。安全需求：$G$ 的输出在计算上与真随机不可区分。

**定理 258.1**（伪随机函数与分组密码的安全性）：若 $F_k(\cdot)$ 是伪随机函数（PRF），则 CTR 模式（计数器模式）加密是 IND-CPA 安全的。

### 258.3 认证与 Hash

**定义 258.7**（消息认证码 / MAC）：$\mathsf{MAC}(k, m) \to t$（标签）。安全性要求：即使能查询任意消息的 MAC 标签（adaptive chosen-message attack），攻击者也不能为新消息伪造有效标签。

**定义 258.8**（Hash 函数安全性质）：密码学 Hash 函数 $H: \{0,1\}^* \to \{0,1\}^n$ 应满足：
- **抗原像**（preimage resistance）：给定 $y$，难找 $x$ 使 $H(x) = y$
- **抗第二原像**（second preimage resistance）：给定 $x$，难找 $x' \neq x$ 使 $H(x') = H(x)$
- **抗碰撞**（collision resistance）：难找 $x \neq x'$ 使 $H(x) = H(x')$

**定理 258.2**（Merkle-Damgård 构造）：若压缩函数 $f$ 是抗碰撞的，则由其通过 Merkle-Damgård 迭代构造的 Hash 函数也是抗碰撞的。SHA-256 基于此构造。

---

---

---

## 第197章：公钥密码
公钥密码（非对称密码）使用两个不同的密钥（公钥和私钥），其安全性基于数论困难问题（大整数分解、离散对数）的计算复杂性。

### 259.1 RSA 与因子分解

**定义 259.1**（RSA 密码体制，Rivest-Shamir-Adleman 1978）：
- $\mathsf{Gen}$：选大素数 $p, q$，$N = pq$，$\varphi(N) = (p-1)(q-1)$。选 $e$ 满足 $\gcd(e, \varphi(N)) = 1$。计算 $d = e^{-1} \bmod \varphi(N)$。公钥 $(N, e)$，私钥 $d$
- $\mathsf{Enc}((N, e), m) = m^e \bmod N$
- $\mathsf{Dec}(d, c) = c^d \bmod N$

**定理 259.1**（RSA 的正确性）：$c^d \bmod N = m^{ed} \bmod N = m$。

*证明*：由 $ed \equiv 1 \pmod{\varphi(N)}$，存在整数 $k$ 使 $ed = k\varphi(N) + 1$，需证 $m^{k\varphi(N)+1} \equiv m \pmod{pq}$。分两种情况：
1. 若 $\gcd(m, N) = 1$：由 Euler 定理 $m^{\varphi(N)} \equiv 1 \pmod N$，故 $m^{ed} = m^{k\varphi(N)+1} \equiv m \pmod N$。
2. 若 $\gcd(m, N) \neq 1$：因 $N = pq$ 且 $p, q$ 为素数，$\gcd(m, N) \neq 1$ 意味着 $p \mid m$ 或 $q \mid m$（或二者）。先考虑模 $p$：若 $p \mid m$，则 $m^{ed} \equiv 0 \equiv m \pmod p$；若 $p \nmid m$，由 Fermat 小定理 $m^{p-1} \equiv 1 \pmod p$，故 $m^{ed} = m \cdot (m^{p-1})^{k(q-1)} \equiv m \pmod p$。同理对模 $q$ 也有 $m^{ed} \equiv m \pmod q$。由中国剩余定理，$m^{ed} \equiv m \pmod{pq}$。∎

**定义 259.2**（RSA 假设与整数分解）：RSA 安全性基于**大整数分解的困难性**和 **RSA 问题**（已知 $N, e, m^e$ 求 $m$）。目前最佳分解算法为数域筛法（NFS），亚指数复杂度 $L_N(1/3, c)$。

**定理 259.2**（Wiener 攻击 / 小解密指数的 RSA）：若 $d < N^{1/4}/3$，可从公钥 $(N, e)$ 在多项式时间内恢复私钥（利用连分数）。

### 259.2 离散对数与椭圆曲线密码

**定义 259.3**（Diffie-Hellman 密钥交换）：公开参数：素数 $p$ 和生成元 $g \in \mathbb{F}_p^*$。方 $A$ 选取 $a$，公开 $g^a$；方 $B$ 选取 $b$，公开 $g^b$。共享值 $g^{ab}$ 可由双方各自计算。安全性基于**计算 Diffie-Hellman（CDH）假设**。

**定理 259.4**（Diffie-Hellman 安全性归约）：若决策 Diffie-Hellman（DDH）假设成立——即区分 $(g^a, g^b, g^{ab})$ 与 $(g^a, g^b, g^r)$（$r$ 随机）在计算上不可行——则 Diffie-Hellman 密钥交换在窃听攻击下是语义安全的。DDH 蕴含 CDH，且在一般循环群模型中，CDH 的困难性等价于离散对数问题（DLP）的困难性。椭圆曲线群 $E(\mathbb{F}_q)$ 上的 ECDLP：已知最有效攻击（Pollard rho）复杂度为 $O(\sqrt{n})$（$n$ 为群阶），与有限域上的亚指数级 DLP 形成对比。这是 ECC 使用短密钥却提供与 RSA 同等安全性的根本原因。∎

**定义 259.4**（椭圆曲线密码 / ECC）：以椭圆曲线群 $E(\mathbb{F}_q)$ 代替乘法群 $\mathbb{F}_p^*$。椭圆曲线离散对数问题（ECDLP）的最知名攻击复杂度为指数级（$\sqrt{|E|}$），这允许使用比 RSA 更短的密钥达到同等安全性。

**定义 259.5**（ElGamal 加密与 ECDSA 签名）：
- **ElGamal 加密**：公钥 $h = g^x$。加密：随机 $r$，输出 $(g^r, m \cdot h^r)$。解密：$m = (h^r)^{-x} \cdot m \cdot h^r$
- **ECDSA**：基于椭圆曲线群的数字签名算法，其安全性归约到 ECDLP

**定理 259.5**（ElGamal加密的IND-CPA安全性）：在DDH假设下，ElGamal加密方案在选择明文攻击下具有不可区分性（IND-CPA安全）。密文 $(g^r, m \cdot h^r)$ 中第一分量均匀随机，第二分量在DDH假设下与随机不可区分——攻击者无法区分 $h^r = g^{xr}$ 与随机群元素。解密需要私钥 $x$（即离散对数），安全性完全归约到CDH/DDH。将ElGamal移植到椭圆曲线群 $E(\mathbb{F}_q)$ 上得到EC-ElGamal，在ECDLP假设下具有同等安全性，但密钥和密文长度大幅缩短。ElGamal本身具有乘法同态性：$E(m_1) \cdot E(m_2) = (g^{r_1+r_2}, m_1 m_2 h^{r_1+r_2}) = E(m_1 m_2)$，这是最早的同态加密方案之一。∎

### 259.3 同态加密与安全计算

**定义 259.6**（同态加密 / Homomorphic Encryption）：加密方案 $\mathsf{Enc}$ 是**同态的**，如果存在运算 $\oplus$ 使 $\mathsf{Enc}(m_1) \oplus \mathsf{Enc}(m_2) = \mathsf{Enc}(m_1 + m_2)$（加法同态 / Paillier）或 $\otimes$ 使 $\mathsf{Enc}(m_1) \otimes \mathsf{Enc}(m_2) = \mathsf{Enc}(m_1 \cdot m_2)$（乘法同态 / ElGamal）。

**定理 259.3**（完全同态加密 / FHE，Gentry 2009）：存在同时支持加法和乘法同态的加密方案（基于理想格），使得可以在密文上执行任意电路计算。Gentry 的蓝图：基于格的 somewhat 同态加密 + 自举（bootstrapping）实现完全同态。

---

---

---

## 第198章：格密码与后量子密码
量子计算（Shor 算法）可以在多项式时间内分解大整数和求解离散对数，这对基于这些问题的密码体制（RSA、ECC）构成计算复杂性的挑战。**后量子密码**（PQC）研究在量子计算模型下仍然安全的密码体制。

### 260.1 格基础

**定义 260.1**（格 / Lattice）：$\mathbb{R}^n$ 中一组线性无关向量 $\mathbf{b}_1, \ldots, \mathbf{b}_n$ 的所有整数线性组合构成格：

$$\mathcal{L} = \left\{ \sum_{i=1}^n x_i \mathbf{b}_i : x_i \in \mathbb{Z} \right\}$$

**定义 260.2**（格中的难解问题）：
- **SVP**（最短向量问题）：求格中最短的非零向量的长度 $\lambda_1(\mathcal{L})$
- **CVP**（最近向量问题）：给定目标点，求最近的格点
- **SIS**（短整数解）：给定随机矩阵 $A$，找短的 $x \neq 0$ 使 $A x = 0 \pmod q$
- **LWE**（带误差学习 / Learning With Errors，Regev 2005）：从 $(A, As + e)$ 中恢复秘密 $s$（$e$ 是小误差）

**定理 260.1**（Regev 的 LWE 安全性归约，2005/2009）：LWE 问题至少与最坏情况的格问题（GapSVP 和 SIVP）一样难。即攻破 LWE 意味着可以用量子算法近似解决所有格中的最坏情况难解问题。

**定理 260.2**（LLL 算法 / Lenstra-Lenstra-Lovász 1982）：LLL 算法在多项式时间内找到长度不超过 $\lambda_1$ 的 $2^{(n-1)/2}$ 倍的短向量。LLL 是格基规约的基本工具。

### 260.2 基于格的密码体制

**定义 260.3**（Regev 的 LWE 加密，2005）：公钥 $A \in \mathbb{Z}_q^{n \times m}$ 和 $b = s^T A + e^T$（误差 $e$ 是短的）。加密比特 $m \in \{0, 1\}$ 为 $(A^T r, b^T r + m\lfloor q/2 \rfloor)$（$r$ 小随机向量）。解密利用 $s^T A^T r \approx b^T r$ 恢复 $m$。

**定义 260.4**（NTRU / CRYSTALS-Kyber / ML-KEM）：NTRU 基于多项式环 $R = \mathbb{Z}_q[x]/(x^n - 1)$ 上的格问题。CRYSTALS-Kyber 使用 Module-LWE 的 ML-KEM 构造。

**定义 260.5**（CRYSTALS-Dilithium / ML-DSA）：基于 Module-SIS 和 Module-LWE 的数字签名方案。

### 260.3 其他后量子密码方法

**定义 260.6**（基于 Hash 的签名 / SPHINCS+）：Merkle 树一次签名（Lamport 签名、Winternitz 签名）与少数次签名（HORS）结合的免状态 Hash 签名方案。

**定义 260.7**（基于编码的密码 / Classic McEliece）：McEliece 密码体制（1978）基于一般线性码的解码困难性（NP 完全）。使用 Goppa 码（可有效解码）作为私钥，加扰后的公开码为公钥。

---

---

---

## 第199章：密码协议
密码协议使用密码学原语实现安全多方计算、零知识证明和数字签名等高级安全目标。

### 261.1 数字签名

**定义 261.1**（数字签名方案）：$\mathsf{Gen}(1^\lambda) \to (pk, sk)$，$\mathsf{Sign}(sk, m) \to \sigma$，$\mathsf{Verify}(pk, m, \sigma) \to \{0, 1\}$。安全性（EUF-CMA / 存在性不可伪造性）：即使攻击者可以自适应地查询任意消息的签名，也不能为新消息伪造有效签名。

**定理 261.1**（RSA-FDH 签名的安全性 / Full Domain Hash）：在随机谕示模型下，RSA-FDH 签名是 EUF-CMA 安全的当且仅当 RSA 问题是难的（Bellare-Rogaway 1993/1996）。

### 261.2 零知识证明

**定义 261.2**（交互证明系统 / Interactive Proof）：证明者 $P$ 和验证者 $V$ 之间的协议，使得 $P$ 可以令 $V$ 确信陈述 $x \in L$ 为真而不泄露其他信息。满足：
- **完备性**（completeness）：若 $x \in L$，诚实 $P$ 总是成功说服 $V$
- **可靠性**（soundness）：若 $x \notin L$，任何（甚至恶意的）$P^*$ 说服 $V$ 的概率可忽略
- **零知识性**（zero-knowledge）：$V$ 在交互中学到的不超过 $x \in L$ 这个事实本身（存在模拟器可生成与真实交互不可区分的 view）

**定义 261.3**（$\Sigma$-协议 / 诚实验证者零知识）：三步协议（承诺 $a$、挑战 $c$、响应 $z$），满足特殊的可靠性（从两个接受相同 $a$ 但不同 $c$ 的 transcripts 可提取证据）。$\Sigma$-协议可转化为非交互零知识证明（Fiat-Shamir 变换）。

**定理 261.2**（Schnorr 的识别/签名协议，1989）：基于离散对数的 $\Sigma$-协议。$P$ 知道 $x$ 使 $h = g^x$。承诺：$a = g^r$（随机 $r$）。挑战：$c$。响应：$z = r + cx$。验证：$g^z = a \cdot h^c$。Fiat-Shamir 变换：$c = H(a, m)$ 将交互证明转为签名。

### 261.3 安全多方计算

**定义 261.4**（安全多方计算 / Secure MPC）：$n$ 个参与方各自有输入 $x_i$，联合计算 $f(x_1, \ldots, x_n)$ 而不暴露各自的输入（除计算结果的隐含信息外）。

**定义 261.5**（秘密共享与阈值密码）：
- **Shamir 秘密共享**（1979）：$t$ 个点确定 $t-1$ 次多项式。将秘密 $s$ 编码为 $f(0)=s$，分发给 $n$ 方 $f(i)$。任意 $t$ 方可通过 Lagrange 插值恢复 $s$，$t-1$ 方无法获得任何信息
- **阈值密码**：解密/签名需要 $\ge t$ 个参与方合作

**定理 261.3**（Yao 的乱码电路 / Garbled Circuit，1986）：任何多项式时间可计算函数都可以被两方安全地计算（在半诚实模型下）。这是安全两方计算的基础理论。

---

---

---

## 第200章（续）：量子密码学与信息论安全
### 262.1 量子密钥分发的数学基础

量子密钥分发（QKD）利用量子态的不可克隆性质在两方之间建立信息论安全的共享密钥。

**定义 262.1**（BB84 协议 / Bennett-Brassard）：方 $A$ 在两组建共轭基底中随机选择——计算基底 $\{|0\rangle, |1\rangle\}$ 和 Hadamard 基底 $\{|+\rangle = \frac{|0\rangle+|1\rangle}{\sqrt{2}}, |-\rangle = \frac{|0\rangle-|1\rangle}{\sqrt{2}}\}$——制备量子态并通过量子信道发送给方 $B$。方 $B$ 随机选择测量基底。双方公开比对基底选择后，保留基底一致的部分作为原始密钥（sifted key）。

**协议步骤**：
1. 方 $A$ 随机生成长度 $\gg n$ 的随机比特串和随机基底串，制备对应量子态并发送
2. 方 $B$ 随机选择测量基底，测量每个接收到的量子态并记录结果
3. 双方通过经典认证信道公开比对基底选择，丢弃基底不一致的比特
4. 随机抽样部分比特公开比对，估计量子比特错误率（QBER）以检测窃听
5. 若 QBER 低于阈值，执行信息调和（纠错）和隐私放大（通过 universal hashing）提取最终安全密钥

**定理 262.1**（BB84 无条件安全性 / Shor-Preskill）：BB84 协议在任意攻击（包括联合攻击和相干攻击）下的安全性可归约为 CSS（Calderbank-Shor-Steane）量子纠错码的不可区分性。窃听者获得的信息量以 Holevo 界约束：

$$I(A;B) \leq S(\rho_A) = -\operatorname{Tr}(\rho_A \log \rho_A)$$

其中 $S(\rho_A)$ 是方 $A$ 子系统约化密度矩阵的 von Neumann 熵。当观测到的 QBER 低于约 $11\%$ 时，可提取正的密钥率。

**定义 262.2**（Holevo 界）：从量子态中可提取的关于经典比特的信息量不超过对应子系统的 von Neumann 熵。这是量子信息论中的核心上界。

### 262.2 格密码与后量子安全

**定义 262.3**（格与格问题）：$n$ 维**格** $\Lambda = \{\sum_{i=1}^n z_i \mathbf{b}_i : z_i \in \mathbb{Z}\}$（$\mathbf{b}_1, \ldots, \mathbf{b}_n$ 为格基）。核心困难问题：
- **SVP**（最短向量问题）：求格中长度最短的非零向量
- **CVP**（最近向量问题）：给定目标点，求最近的格点
- **SIVP**（最短独立向量问题）：求 $n$ 个线性无关的短格向量

**定义 262.4**（LWE 问题 / Learning With Errors, Regev, 2005）：给定素数模数 $q$、维度 $n$、秘密向量 $\mathbf{s} \in \mathbb{Z}_q^n$ 和误差分布 $\chi$，LWE 分布为

$$(\mathbf{a}, b = \langle \mathbf{a}, \mathbf{s} \rangle + e \bmod q), \quad \mathbf{a} \leftarrow \mathbb{Z}_q^n \text{ 均匀}, \quad e \leftarrow \chi$$

搜索型 LWE 问题：给定来自该分布的多项式数量样本，恢复秘密 $\mathbf{s}$。判定型 LWE 问题：区分 LWE 分布与均匀分布。

**定理 262.2**（Regev 量子归约，2005）：若存在高效算法以不可忽略的概率求解 LWE 问题，则存在量子算法求解最坏情况下的格上近似最短向量问题（GapSVP）和最短独立向量问题（SIVP）。这建立了 LWE 的密码学安全性——假定格上最坏情况问题对量子计算机难解，则 LWE 在平均情况下也是难解的。

**后量子密码标准化**：NIST 的后量子密码标准化过程选定了基于格的方案：
- **KYBER**（ML-KEM）：基于 Module-LWE 的密钥封装机制
- **Dilithium**（ML-DSA）：基于 Module-LWE 和 Module-SIS 的数字签名方案

这些方案的数学基础是格上困难问题的（量子）归约安全性。

### 262.3 信息论安全

**定义 262.5**（信息论安全 / 无条件安全）：加密方案是**信息论安全**的，如果其安全性不依赖于任何计算假设——即使敌手拥有无限计算能力，密文也不泄露任何关于明文的信息（除密文长度外）。形式上，$H(M \mid C) = H(M)$（完全保密，Shannon, 1949）。

**定理 262.3**（Shannon 完全保密定理）：对 $n$ 比特消息，一次一密（One-Time Pad）$c = m \oplus k$（$k$ 为真随机且仅用一次的 $n$ 比特密钥）实现完全保密。反之，任何完全保密的加密方案必须满足 $H(K) \geq H(M)$（密钥熵不小于消息熵）。

**定义 262.6**（提取器与隐私放大 / Extractor and Privacy Amplification）：**随机提取器** $\operatorname{Ext}: \{0,1\}^n \times \{0,1\}^d \to \{0,1\}^m$ 将任意具有最小熵 $k$ 的弱随机源 $X$ 与短的均匀种子 $S$ 结合，输出统计上接近均匀的 $m$ 比特。在 QKD 的隐私放大步骤中，使用 universal hashing 族（如 Toeplitz 矩阵）从部分安全的原始密钥中提取近乎完全安全的最终密钥。

---

*本卷在数论（V17）、抽象代数（V8、V13）和计算理论（V31）的基础上，系统建立了编码理论、对称密码、公钥密码、格密码与后量子密码以及密码协议的数学理论。共 5 章。*


*本卷完成了从初等数论到现代数论的跨越：解析数论以 $\zeta(s)$ 和素数定理为核心，展示了分析工具在数论中的威力；模形式理论揭示了全纯函数与数论之间惊人的联系（Ramanujan $\tau$ 函数、Hecke 算子）；椭圆曲线以 Mordell-Weil 定理和 BSD 猜想为中心，连接了代数几何、模形式和 $L$-函数；类域论（局部和整体）以互反律为核心，完成了 Abel 扩张的分类；补充部分将密码学的数论基础（欧拉定理→RSA、离散对数→DH、椭圆曲线群→ECDSA、零知识证明→交互证明系统）纳入本卷框架。为后续 Langlands 纲领（如有需要）的学习奠定了基础。*


*卷十六：数论 II终。*


*卷十六：数论 II终。*
