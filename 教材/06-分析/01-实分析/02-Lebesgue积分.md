## Ch 96 Lebesgue 积分
### 47.1 非负简单函数的积分

**定义 47.1.1（非负简单函数的积分）**：设 $\varphi = \sum_{j=1}^{k} a_j \chi_{E_j}$ 为 $E$ 上的非负简单函数（$a_j \geq 0$，$E_j$ 两两不交可测）。定义 $\varphi$ 的 Lebesgue 积分为

$$
\int_E \varphi \, dm = \sum_{j=1}^{k} a_j \, m(E_j)
$$

（约定 $0 \cdot \infty = 0$。）

**定理 47.1.1（简单函数积分的线性性与单调性）**：

(i) **线性性**：$\int_E (a\varphi + b\psi) = a\int_E \varphi + b\int_E \psi$（$a, b \geq 0$）
(ii) **单调性**：若 $\varphi \leq \psi$，则 $\int_E \varphi \leq \int_E \psi$

**证明**：(i) 将 $\varphi, \psi$ 用同一组可测集（它们的交集划分）表示，然后验证。(ii) 由 (i)，$\psi - \varphi \geq 0$，故 $\int \psi - \int \varphi = \int (\psi - \varphi) \geq 0$。$\blacksquare$

---

### 47.2 非负可测函数的积分

**定义 47.2.1（非负可测函数的积分）**：设 $f$ 为 $E$ 上的非负可测函数。定义

$$
\int_E f \, dm = \sup\left\{\int_E \varphi \, dm \;\middle|\; 0 \leq \varphi \leq f, \; \varphi \text{ 为简单函数}\right\}
$$

**定理 47.2.1（Chebyshev 不等式）**：设 $f \geq 0$ 可测。则对任意 $\lambda > 0$，

$$
m(\{x \in E \mid f(x) \geq \lambda\}) \leq \frac{1}{\lambda} \int_E f \, dm
$$

**证明**：令 $A = \{f \geq \lambda\}$。则 $f \geq \lambda \chi_A$。由积分的单调性，$\int_E f \geq \lambda \int_E \chi_A = \lambda m(A)$。$\blacksquare$

**推论 47.2.2**：若 $\int_E f = 0$，则 $f = 0$ a.e.。

**证明**：由 Chebyshev 不等式，对任意 $n$，$m(\{f \geq 1/n\}) \leq n \int_E f = 0$。故 $\{f > 0\} = \bigcup_{n=1}^{\infty} \{f \geq 1/n\}$ 为零测集。$\blacksquare$

---

### 47.3 单调收敛定理

**定理 47.3.1（Lebesgue 单调收敛定理）**：设 $\{f_k\}$ 为 $E$ 上的非负可测函数列，满足 $0 \leq f_1 \leq f_2 \leq \cdots$，且 $f_k \to f$（逐点）。则

$$
\lim_{k \to \infty} \int_E f_k \, dm = \int_E f \, dm
$$

即极限与积分可交换（在非负递增情形下）。

**证明**：由于 $f_k \leq f$，$\int f_k \leq \int f$，故 $\lim_{k \to \infty} \int f_k \leq \int f$。需证反向不等式。

取任意简单函数 $0 \leq \varphi \leq f$ 和 $0 < \alpha < 1$。定义 $E_k = \{x \mid f_k(x) \geq \alpha \varphi(x)\}$。则 $E_1 \subseteq E_2 \subseteq \cdots$ 且 $\bigcup E_k = E$（因为 $f_k \uparrow f$ 且 $\alpha \varphi < f$）。

由测度的下连续性，$m(E_k) \uparrow m(E)$。且 $\int_E f_k \geq \int_{E_k} f_k \geq \alpha \int_{E_k} \varphi$。

对简单函数 $\varphi = \sum a_j \chi_{F_j}$，$\int_{E_k} \varphi = \sum a_j m(F_j \cap E_k) \uparrow \sum a_j m(F_j) = \int_E \varphi$（$k \to \infty$）。

因此 $\lim_{k \to \infty} \int_E f_k \geq \alpha \int_E \varphi$。令 $\alpha \to 1$ 得 $\lim \int f_k \geq \int \varphi$。再对 $\varphi \leq f$ 取上确界，得 $\lim \int f_k \geq \int f$。$\blacksquare$

**推论 47.3.2（非负可测函数级数的逐项积分）**：若 $\{g_k\}$ 为非负可测函数列，则

$$
\int_E \sum_{k=1}^{\infty} g_k \, dm = \sum_{k=1}^{\infty} \int_E g_k \, dm
$$

**证明**：令 $f_k = \sum_{j=1}^{k} g_j$，应用单调收敛定理。$\blacksquare$

---

### 47.4 Fatou 引理

**定理 47.4.1（Fatou 引理）**：设 $\{f_k\}$ 为 $E$ 上的非负可测函数列。则

$$
\int_E \liminf_{k \to \infty} f_k \, dm \leq \liminf_{k \to \infty} \int_E f_k \, dm
$$

**证明**：令 $g_k = \inf_{j \geq k} f_j$。则 $0 \leq g_1 \leq g_2 \leq \cdots$，$g_k \uparrow \liminf f_k$。由单调收敛定理，$\int \liminf f_k = \lim_{k \to \infty} \int g_k$。

又 $g_k \leq f_j$（$\forall j \geq k$），故 $\int g_k \leq \inf_{j \geq k} \int f_j$。因此

$$
\int \liminf f_k = \lim_{k \to \infty} \int g_k \leq \lim_{k \to \infty} \inf_{j \geq k} \int f_j = \liminf_{k \to \infty} \int f_k
$$

$\blacksquare$

---

### 47.5 一般可测函数的积分与 Lebesgue 控制收敛定理

**定义 47.5.1（可积函数）**：设 $f$ 为 $E$ 上的可测函数。将 $f$ 分解为正部和负部：$f = f^+ - f^-$，其中 $f^+ = \max(f, 0)$，$f^- = \max(-f, 0)$。

若 $\int_E f^+ < \infty$ 且 $\int_E f^- < \infty$，则称 $f$ 在 $E$ 上 **Lebesgue 可积**，定义

$$
\int_E f \, dm = \int_E f^+ \, dm - \int_E f^- \, dm
$$

**定理 47.5.1（Lebesgue 控制收敛定理）**：设 $\{f_k\}$ 为 $E$ 上的可测函数列，满足 $f_k \to f$ a.e.。若存在可积函数 $g$ 使得 $|f_k| \leq g$ a.e.（$\forall k$），则 $f$ 可积且

$$
\lim_{k \to \infty} \int_E f_k \, dm = \int_E f \, dm
$$

**证明**：由 $|f_k| \leq g$ 及 $g$ 可积，$f_k$ 可积。对 $f$，$|f| = \lim |f_k| \leq g$ a.e.，故 $f$ 也可积。

考虑 $g + f_k \geq 0$ 和 $g - f_k \geq 0$。由 Fatou 引理：

$$
\int_E (g + f) \leq \liminf_{k \to \infty} \int_E (g + f_k) = \int_E g + \liminf_{k \to \infty} \int_E f_k
$$

故 $\int_E f \leq \liminf_{k \to \infty} \int_E f_k$。

同理对 $g - f_k$：

$$
\int_E (g - f) \leq \liminf_{k \to \infty} \int_E (g - f_k) = \int_E g - \limsup_{k \to \infty} \int_E f_k
$$

故 $\int_E f \geq \limsup_{k \to \infty} \int_E f_k$。

因此 $\liminf \int f_k = \limsup \int f_k = \int f$，即 $\lim \int f_k = \int f$。$\blacksquare$

---

### 47.6 Lebesgue 积分与 Riemann 积分的比较

**定理 47.6.1**：设 $f$ 在 $[a, b]$ 上 Riemann 可积。则 $f$ 在 $[a, b]$ 上 Lebesgue 可积，且两种积分值相等：

$$
\int_{[a, b]} f \, dm = \int_a^b f(x) \, dx
$$

**证明**：Riemann 可积函数必有界，且其不连续点构成零测集（Lebesgue 判别法）。有界可测函数在有限测度集上 Lebesgue 可积。

比较两种积分：Riemann 积分用阶梯函数逼近，Lebesgue 积分用简单函数逼近。由 Riemann 可积性，Riemann 上下积分相等，且等于 Lebesgue 积分。$\blacksquare$

**定理 47.6.2（Lebesgue 可积函数类更广）**：存在 Lebesgue 可积但 Riemann 不可积的函数。

**例**：Dirichlet 函数 $\chi_{\mathbb{Q} \cap [0, 1]}$ 在 $[0, 1]$ 上 Lebesgue 可积（值为 $0$，因为 $\mathbb{Q} \cap [0, 1]$ 可数故零测），但 Riemann 不可积。

### 47.7 有界变差函数与 Lebesgue-Stieltjes 积分

**定义 47.7.1（有界变差函数）**：函数 $f: [a, b] \to \mathbb{R}$ 称为**有界变差**的，若其全变差 $V_a^b(f) = \sup \sum_{i=1}^n |f(x_i) - f(x_{i-1})| < \infty$，其中上确界取遍 $[a, b]$ 的所有分割。有界变差函数必可表示为两个单调函数之差（Jordan 分解定理）：$f = g - h$，其中 $g, h$ 单调递增。

**定理 47.7.1（Lebesgue-Stieltjes 积分）**：设 $\alpha: [a, b] \to \mathbb{R}$ 为有界变差函数。由 $\alpha$ 诱导的 Lebesgue-Stieltjes 测度 $\mu_\alpha$ 满足 $\mu_\alpha((c, d]) = \alpha(d) - \alpha(c)$。Lebesgue-Stieltjes 积分 $\int_a^b f \, d\alpha = \int_{[a,b]} f \, d\mu_\alpha$ 统一了 Riemann-Stieltjes 积分和 Lebesgue 积分：当 $\alpha(x) = x$ 时退化为通常的 Lebesgue 积分；当 $\alpha$ 为阶梯函数时退化为离散求和。

**证明**：由 Riesz 表示定理，$C[a,b]$ 上的正线性泛函一一对应于有限 Borel 测度。有界变差函数 $\alpha$ 通过 Riemann-Stieltjes 积分定义了 $C[a,b]$ 上的线性泛函，由其 Jordan 分解可分解为正泛函之差，从而对应一个符号 Borel 测度 $\mu_\alpha$。$\blacksquare$

### 47.8 微分与积分的互逆

**定理 47.8.1（Lebesgue 微分定理）**：设 $f \in L^1_{\text{loc}}(\mathbb{R}^n)$。则对 a.e. $x \in \mathbb{R}^n$，

$$\lim_{r \to 0} \frac{1}{m(B(x, r))} \int_{B(x, r)} f(y) \, dm(y) = f(x)$$

**证明**：利用 Hardy-Littlewood 极大函数 $Mf(x) = \sup_{r>0} \frac{1}{|B(x,r)|} \int_{B(x,r)} |f(y)| dy$。由极大函数的弱 $(1,1)$ 型估计（$m(\{Mf > \lambda\}) \leq \frac{C_n}{\lambda}\|f\|_1$）和连续函数在 $L^1$ 中的稠密性，标准论证即得逐点收敛。$\blacksquare$

**定理 47.8.2（Newton-Leibniz 公式的 Lebesgue 版本）**：设 $f$ 在 $[a, b]$ 上 Lebesgue 可积。定义 $F(x) = \int_a^x f(t) \, dm(t)$。则 $F$ 在 $[a, b]$ 上绝对连续，且 $F'(x) = f(x)$ a.e.。反之，若 $F$ 在 $[a, b]$ 上绝对连续，则 $F'$ 存在 a.e.，$F' \in L^1([a, b])$，且 $F(x) - F(a) = \int_a^x F'(t) \, dm(t)$。

**证明**：由积分的绝对连续性，$F$ 是绝对连续的。$F'$ 的 a.e. 存在性来自 Lebesgue 微分定理。反向：绝对连续函数有界变差，故 $F'$ 存在 a.e. 且可积。由 $F$ 的绝对连续性，两个函数 $F(x)$ 和 $\int_a^x F'(t) dt$ 有相同的导数 a.e. 且都绝对连续，故差为常数（由 Lebesgue 微分定理的推论）。$\blacksquare$

### 47.9 乘积测度与 Fubini 定理

**定理 47.9.1（Fubini-Tonelli 定理）**：设 $(X, \mathcal{A}, \mu)$ 和 $(Y, \mathcal{B}, \nu)$ 为 $\sigma$-有限的测度空间。

(i) **Tonelli 定理**：若 $f: X \times Y \to [0, \infty]$ 为 $\mathcal{A} \otimes \mathcal{B}$-可测函数，则 $\int_X \int_Y f \, d\nu \, d\mu = \int_Y \int_X f \, d\mu \, d\nu = \int_{X \times Y} f \, d(\mu \times \nu)$。

(ii) **Fubini 定理**：若 $f \in L^1(\mu \times \nu)$，则 $f(x, \cdot) \in L^1(\nu)$ 对 $\mu$-a.e. $x$ 成立，$f(\cdot, y) \in L^1(\mu)$ 对 $\nu$-a.e. $y$ 成立，且上述积分等式成立。

**证明**：先对 $f$ 为特征函数验证（由测度构造），然后线性性和单调收敛定理推广到非负简单函数和非负可测函数（Tonelli 定理）。Fubini 定理将 $f$ 分解为正负部后应用 Tonelli 定理。$\blacksquare$

Fubini 定理是 Lebesgue 积分理论超越 Riemann 积分的最重要优势之一。在 Riemann 积分框架下，重积分交换次序需要函数满足一致连续性等苛刻条件；而在 Lebesgue 框架下，仅需可测性和绝对可积性（或非负性），使用极为方便。这在概率论中尤为重要——联合分布与边缘分布的关系本质上是 Fubini 定理的推论。$\blacksquare$