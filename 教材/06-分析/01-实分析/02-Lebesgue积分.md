## 第117章：Lebesgue 积分

Lebesgue 积分理论是实分析的核心，由 Henri Lebesgue 于 1902 年在其博士论文《积分、长度与面积》中创立。与 Riemann 积分通过对定义域进行分割不同，Lebesgue 积分通过对值域进行分割，从而将积分理论建立在测度论的坚实基础上。这一视角的转变带来了深刻的后果：Lebesgue 积分理论中的极限定理（单调收敛定理、Fatou 引理、控制收敛定理）极为强大且易于使用，使得积分与极限的交换条件远比 Riemann 积分宽松。此外，Lebesgue 积分自然地统一了离散求和与连续积分，为概率论、调和分析和泛函分析提供了统一的语言。

### 47.1 非负简单函数的积分

简单函数是 Lebesgue 积分理论的基本建筑块，其角色类似于 Riemann 积分中的阶梯函数，但远比阶梯函数灵活——简单函数基于可测集的分划，而可测集可以是任意复杂的集合。

**定义 47.1.1（非负简单函数的积分）**：设 $\varphi = \sum_{j=1}^{k} a_j \chi_{E_j}$ 为 $E$ 上的非负简单函数（$a_j \geq 0$，$E_j$ 两两不交可测）。定义 $\varphi$ 的 Lebesgue 积分为

$$
\int_E \varphi \, dm = \sum_{j=1}^{k} a_j \, m(E_j)
$$

（约定 $0 \cdot \infty = 0$。）

**注记 47.1.1**：上述定义与 $\varphi$ 的具体表示无关。即若 $\varphi = \sum_{j=1}^{k} a_j \chi_{E_j} = \sum_{i=1}^{\ell} b_i \chi_{F_i}$ 为两种不同表示，则 $\sum a_j m(E_j) = \sum b_i m(F_i)$。这是因为两种表示可通过取 $E_j \cap F_i$ 的公共细化来统一，由测度的可加性，积分值不变。这一性质是 Lebesgue 积分定义良好性的基础。

**定理 47.1.1（简单函数积分的线性性与单调性）**：

(i) **线性性**：$\int_E (a\varphi + b\psi) = a\int_E \varphi + b\int_E \psi$（$a, b \geq 0$）
(ii) **单调性**：若 $\varphi \leq \psi$，则 $\int_E \varphi \leq \int_E \psi$

**证明**：(i) 将 $\varphi, \psi$ 用同一组可测集（它们的交集划分）表示，然后验证。具体地，设 $\varphi = \sum a_j \chi_{E_j}$，$\psi = \sum b_i \chi_{F_i}$。令 $G_{ji} = E_j \cap F_i$，则 $\{G_{ji}\}$ 为两两不交的可测集族，且 $\varphi = \sum_{j,i} a_j \chi_{G_{ji}}$，$\psi = \sum_{j,i} b_i \chi_{G_{ji}}$。于是 $a\varphi + b\psi = \sum_{j,i} (a a_j + b b_i) \chi_{G_{ji}}$，积分值为 $\sum_{j,i} (a a_j + b b_i) m(G_{ji}) = a\sum_j a_j m(E_j) + b\sum_i b_i m(F_i)$。

(ii) 由 (i)，$\psi - \varphi \geq 0$，故 $\int \psi - \int \varphi = \int (\psi - \varphi) \geq 0$。$\blacksquare$

**命题 47.1.2（非负简单函数的逼近性质）**：设 $f$ 为 $E$ 上的非负可测函数。则存在递增的非负简单函数列 $\{\varphi_k\}$ 使得 $\varphi_k \uparrow f$（逐点收敛）。具体构造为：对每个 $k$，将 $[0, k]$ 等分为 $k \cdot 2^k$ 份，令

$$
\varphi_k(x) = \begin{cases} \frac{m-1}{2^k} & \text{若 } \frac{m-1}{2^k} \leq f(x) < \frac{m}{2^k}, \; m = 1, 2, \ldots, k \cdot 2^k \\ k & \text{若 } f(x) \geq k \end{cases}
$$

则 $\varphi_k$ 是简单函数（因为每个水平集 $\{f \geq c\}$ 均可测），且 $\varphi_k \leq \varphi_{k+1}$，$\varphi_k \to f$ 逐点。

**证明**：由 $f$ 的可测性，每个水平集 $\{x : \frac{m-1}{2^k} \leq f(x) < \frac{m}{2^k}\}$ 和 $\{x : f(x) \geq k\}$ 均为可测集，故 $\varphi_k$ 为简单函数。单调性由构造方式直接保证。收敛性：对任意 $x$，若 $f(x) < \infty$，则当 $k > f(x)$ 时，$f(x) - \varphi_k(x) \leq 2^{-k} \to 0$。若 $f(x) = \infty$，则 $\varphi_k(x) = k \to \infty$。$\blacksquare$

---

### 47.2 非负可测函数的积分

**定义 47.2.1（非负可测函数的积分）**：设 $f$ 为 $E$ 上的非负可测函数。定义

$$
\int_E f \, dm = \sup\left\{\int_E \varphi \, dm \;\middle|\; 0 \leq \varphi \leq f, \; \varphi \text{ 为简单函数}\right\}
$$

这一定义是 Lebesgue 积分理论的核心创新：不再通过分割定义域，而是通过从下方用简单函数逼近来定义积分。这一"由下而上"的逼近策略使得积分自动具有优良的极限性质。

**命题 47.2.1（积分的初等性质）**：设 $f, g$ 为 $E$ 上的非负可测函数。

(i) **单调性**：若 $f \leq g$ a.e.，则 $\int_E f \leq \int_E g$
(ii) **齐次性**：$\int_E c f = c \int_E f$（$c \geq 0$）
(iii) **可加性**：$\int_E (f + g) = \int_E f + \int_E g$
(iv) **对定义域的有限可加性**：若 $E = A \cup B$ 且 $A \cap B = \emptyset$，则 $\int_E f = \int_A f + \int_B f$

**证明**：(i) 由定义，任何不超过 $f$ 的简单函数也不超过 $g$，故 $\int f$ 的上确界不超过 $\int g$ 的上确界。(ii) 对简单函数成立，取上确界即得。(iii) 需证明 $\sup\{\int \varphi : \varphi \leq f+g\} = \sup\{\int \varphi_1 : \varphi_1 \leq f\} + \sup\{\int \varphi_2 : \varphi_2 \leq g\}$。由命题 47.1.2，存在简单函数列 $\varphi_k \uparrow f$，$\psi_k \uparrow g$，则 $\varphi_k + \psi_k \uparrow f+g$。由简单函数积分的可加性和单调收敛定理（见定理 47.3.1），可得等号成立。(iv) 由积分定义和测度的可加性直接验证。$\blacksquare$

**定理 47.2.2（Chebyshev 不等式 / Markov 不等式）**：设 $f \geq 0$ 可测。则对任意 $\lambda > 0$，

$$
m(\{x \in E \mid f(x) \geq \lambda\}) \leq \frac{1}{\lambda} \int_E f \, dm
$$

**证明**：令 $A = \{f \geq \lambda\}$。则 $f \geq \lambda \chi_A$。由积分的单调性，$\int_E f \geq \lambda \int_E \chi_A = \lambda m(A)$。$\blacksquare$

**推论 47.2.3**：若 $\int_E f = 0$，则 $f = 0$ a.e.。

**证明**：由 Chebyshev 不等式，对任意 $n$，$m(\{f \geq 1/n\}) \leq n \int_E f = 0$。故 $\{f > 0\} = \bigcup_{n=1}^{\infty} \{f \geq 1/n\}$ 为零测集。$\blacksquare$

**推论 47.2.4**：若 $f$ 可积（即 $\int |f| < \infty$），则 $|f| < \infty$ a.e.。特别地，可积函数几乎处处有限。

**推论 47.2.5（积分的绝对连续性——初级形式）**：设 $f \geq 0$ 可积。则对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得对任意可测集 $A$，$m(A) < \delta$ 蕴含 $\int_A f < \varepsilon$。

**证明**：反设存在 $\varepsilon_0 > 0$ 和可测集列 $A_n$ 满足 $m(A_n) < 2^{-n}$ 但 $\int_{A_n} f \geq \varepsilon_0$。令 $A = \limsup A_n = \bigcap_{N=1}^{\infty} \bigcup_{n=N}^{\infty} A_n$。由 Borel-Cantelli 引理，$m(A) = 0$。但由 Fatou 引理逆命题（或控制收敛定理），$\int_A f \geq \limsup \int_{A_n} f \geq \varepsilon_0$，矛盾。$\blacksquare$

---

### 47.3 单调收敛定理

**定理 47.3.1（Lebesgue 单调收敛定理）**：设 $\{f_k\}$ 为 $E$ 上的非负可测函数列，满足 $0 \leq f_1 \leq f_2 \leq \cdots$，且 $f_k \to f$（逐点）。则

$$
\lim_{k \to \infty} \int_E f_k \, dm = \int_E f \, dm
$$

即极限与积分可交换（在非负递增情形下）。

**证明**：由于 $f_k \leq f$，$\int f_k \leq \int f$，故 $\lim_{k \to \infty} \int f_k \leq \int f$。需证反向不等式。

取任意简单函数 $0 \leq \varphi \leq f$ 和 $0 < \alpha < 1$。定义 $E_k = \{x \mid f_k(x) \geq \alpha \varphi(x)\}$。则 $E_1 \subseteq E_2 \subseteq \cdots$ 且 $\bigcup E_k = E$（因为 $f_k \uparrow f$ 且 $\alpha \varphi < f$ 在 $\varphi > 0$ 处）。

由测度的下连续性，$m(E_k) \uparrow m(E)$。且 $\int_E f_k \geq \int_{E_k} f_k \geq \alpha \int_{E_k} \varphi$。

对简单函数 $\varphi = \sum a_j \chi_{F_j}$，$\int_{E_k} \varphi = \sum a_j m(F_j \cap E_k) \uparrow \sum a_j m(F_j) = \int_E \varphi$（$k \to \infty$）。

因此 $\lim_{k \to \infty} \int_E f_k \geq \alpha \int_E \varphi$。令 $\alpha \to 1$ 得 $\lim \int f_k \geq \int \varphi$。再对 $\varphi \leq f$ 取上确界，得 $\lim \int f_k \geq \int f$。$\blacksquare$

**推论 47.3.2（非负可测函数级数的逐项积分 / Beppo Levi 定理）**：若 $\{g_k\}$ 为非负可测函数列，则

$$
\int_E \sum_{k=1}^{\infty} g_k \, dm = \sum_{k=1}^{\infty} \int_E g_k \, dm
$$

**证明**：令 $f_k = \sum_{j=1}^{k} g_j$，应用单调收敛定理。$\blacksquare$

**注记 47.3.1**：单调收敛定理是 Lebesgue 积分理论中最基本的极限定理。它表明：对于非负递增的函数列，积分和极限总是可以交换。这一性质在 Riemann 积分框架下完全不成立——Riemann 可积函数列的单调极限甚至可能不是 Riemann 可积的。Beppo Levi 定理（级数逐项积分）是单调收敛定理的直接推论，它使得我们可以将重积分与无穷级数自由交换，这在概率论中尤为有用。

**命题 47.3.3（单调收敛定理的测度构造应用）**：设 $f \geq 0$ 可测。定义测度 $\nu(A) = \int_A f \, dm$。则 $\nu$ 是 $\sigma$-有限的测度（若 $f$ 可积），且 $\nu$ 关于 $m$ 绝对连续。此即 Radon-Nikodym 定理中 $f$ 作为密度函数的基本构造。

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

**定理 47.4.2（反向 Fatou 引理）**：设 $\{f_k\}$ 为 $E$ 上的可测函数列，满足 $|f_k| \leq g$ a.e. 且 $g$ 可积。则

$$
\limsup_{k \to \infty} \int_E f_k \, dm \leq \int_E \limsup_{k \to \infty} f_k \, dm
$$

**证明**：将 Fatou 引理应用于非负函数列 $g - f_k$：

$$
\int \liminf (g - f_k) \leq \liminf \int (g - f_k)
$$

左边 $\int \liminf (g - f_k) = \int (g - \limsup f_k) = \int g - \int \limsup f_k$。右边 $\liminf \int (g - f_k) = \liminf (\int g - \int f_k) = \int g - \limsup \int f_k$。因此 $-\int \limsup f_k \leq -\limsup \int f_k$，即 $\limsup \int f_k \leq \int \limsup f_k$。$\blacksquare$

**注记 47.4.1**：Fatou 引理在不等式方向上是"损耗性的"——它只给出下极限的不等式，且方向可能带来信息损失。这体现了"积分与极限交换"在缺乏可积控制时的代价。反向 Fatou 引理则表明，在有可积控制函数 $g$ 的条件下，上极限的方向也可以反转。Fatou 引理是证明控制收敛定理的关键工具，其优雅之处在于它不需要任何一致收敛性条件，仅需要非负性。

---

### 47.5 一般可测函数的积分与 Lebesgue 控制收敛定理

**定义 47.5.1（可积函数）**：设 $f$ 为 $E$ 上的可测函数。将 $f$ 分解为正部和负部：$f = f^+ - f^-$，其中 $f^+ = \max(f, 0)$，$f^- = \max(-f, 0)$。

若 $\int_E f^+ < \infty$ 且 $\int_E f^- < \infty$，则称 $f$ 在 $E$ 上 **Lebesgue 可积**，定义

$$
\int_E f \, dm = \int_E f^+ \, dm - \int_E f^- \, dm
$$

$L^1(E)$ 表示 $E$ 上所有 Lebesgue 可积函数的集合。

**命题 47.5.1（可积函数的基本性质）**：设 $f, g \in L^1(E)$。

(i) **线性性**：$L^1(E)$ 是向量空间，且 $\int (af + bg) = a\int f + b\int g$
(ii) **三角不等式**：$|\int_E f| \leq \int_E |f|$
(iii) **单调性**：若 $f \leq g$ a.e.，则 $\int f \leq \int g$
(iv) **绝对连续性**：$f \in L^1(E)$ 等价于 $|f| \in L^1(E)$

**证明**：(i) 由正负部分解验证。$(f+g)^+ - (f+g)^- = f^+ - f^- + g^+ - g^-$，移项得 $(f+g)^+ + f^- + g^- = (f+g)^- + f^+ + g^+$。两边积分并利用非负函数积分的可加性即得。(ii) $|\int f| = |\int f^+ - \int f^-| \leq \int f^+ + \int f^- = \int |f|$。(iii) 由 $g - f \geq 0$ 和非负函数积分的定义。(iv) $|f| = f^+ + f^-$，故 $\int |f| < \infty$ 当且仅当 $\int f^+ < \infty$ 且 $\int f^- < \infty$。$\blacksquare$

**定理 47.5.2（Lebesgue 控制收敛定理）**：设 $\{f_k\}$ 为 $E$ 上的可测函数列，满足 $f_k \to f$ a.e.。若存在可积函数 $g$ 使得 $|f_k| \leq g$ a.e.（$\forall k$），则 $f$ 可积且

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

**定理 47.5.3（Vitali 收敛定理）**：设 $\{f_k\} \subseteq L^1(E)$，$f_k \to f$（依测度），且 $\{f_k\}$ 一致可积。则 $f \in L^1(E)$ 且 $f_k \to f$ 在 $L^1$ 范数下。

**定义 47.5.2（一致可积性）**：函数族 $\{f_k\} \subseteq L^1(E)$ 称为**一致可积**，若对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得对任意可测集 $A$，$m(A) < \delta$ 蕴含 $\int_A |f_k| < \varepsilon$（对所有 $k$），且存在 $M$ 使得 $\int_{|f_k| > M} |f_k| < \varepsilon$（对所有 $k$）。

**证明**：由一致可积性，$\{f_k\}$ 在 $L^1$ 中范数有界。由 Fatou 引理（逐点收敛的子列），$f \in L^1$。对任意 $\varepsilon > 0$，选取 $\delta > 0$ 和 $M$ 满足一致可积性条件。由 Egorov 定理，在 $E$ 的一个大子集上 $f_k \to f$ 一致收敛，在其余小集上积分由一致可积性控制。$\varepsilon/3$ 论证给出 $\|f_k - f\|_1 \to 0$。$\blacksquare$

---

### 47.6 Lebesgue 积分与 Riemann 积分的比较

**定理 47.6.1**：设 $f$ 在 $[a, b]$ 上 Riemann 可积。则 $f$ 在 $[a, b]$ 上 Lebesgue 可积，且两种积分值相等：

$$
\int_{[a, b]} f \, dm = \int_a^b f(x) \, dx
$$

**证明**：Riemann 可积函数必有界，且其不连续点构成零测集（Lebesgue 判别法）。有界可测函数在有限测度集上 Lebesgue 可积。

比较两种积分：Riemann 积分用阶梯函数（基于区间分割）逼近，Lebesgue 积分用简单函数逼近。取 $[a, b]$ 的一列细化分割 $P_n$，其上下 Riemann 和分别给出 $f$ 的简单函数逼近。由 Riemann 可积性，上下 Riemann 积分相等，且等于 Lebesgue 积分。具体地，Riemann 下和给出的简单函数列递增到 $f$ 的某个下逼近，由单调收敛定理其 Lebesgue 积分收敛到 Riemann 积分。$\blacksquare$

**定理 47.6.2（Lebesgue 可积函数类更广）**：存在 Lebesgue 可积但 Riemann 不可积的函数。

**例**：Dirichlet 函数 $\chi_{\mathbb{Q} \cap [0, 1]}$ 在 $[0, 1]$ 上 Lebesgue 可积（值为 $0$，因为 $\mathbb{Q} \cap [0, 1]$ 可数故零测），但 Riemann 不可积（因为其上下 Riemann 和分别为 $1$ 和 $0$）。

**定理 47.6.3（Riemann 可积性的 Lebesgue 刻画）**：$[a, b]$ 上的有界函数 $f$ Riemann 可积当且仅当 $f$ 的不连续点集为零测集。

**证明**：设 $f$ 的有界性常数为 $M$。$f$ 在 $x$ 处的振幅为 $\omega_f(x) = \lim_{\delta \to 0} \sup_{y,z \in (x-\delta, x+\delta)} |f(y) - f(z)|$。$f$ 在 $x$ 处连续当且仅当 $\omega_f(x) = 0$。Riemann 可积的充要条件是：对任意 $\varepsilon > 0$，$\{x : \omega_f(x) \geq \varepsilon\}$ 是零测集（由 Riemann 可积的 Darboux 刻画）。取 $\varepsilon = 1/n$，得 $\{x : \omega_f(x) > 0\} = \bigcup_{n=1}^{\infty} \{x : \omega_f(x) \geq 1/n\}$ 为零测集。$\blacksquare$

**注记 47.6.1**：Lebesgue 积分相比于 Riemann 积分的优势不仅在于可积函数类更广，更在于其极限定理的优越性。在 Riemann 积分框架下，逐点收敛的函数列即使一致有界，其极限也可能不可积。Lebesgue 控制收敛定理则只需要一个可积的控制函数，使用极为方便。此外，在无界区域和无界函数的情形下，Lebesgue 积分的处理也比 Riemann 反常积分更为系统和优雅。

### 47.7 有界变差函数与 Lebesgue-Stieltjes 积分

**定义 47.7.1（有界变差函数）**：函数 $f: [a, b] \to \mathbb{R}$ 称为**有界变差**的，若其全变差 $V_a^b(f) = \sup \sum_{i=1}^n |f(x_i) - f(x_{i-1})| < \infty$，其中上确界取遍 $[a, b]$ 的所有分割 $a = x_0 < x_1 < \cdots < x_n = b$。

**定理 47.7.1（Jordan 分解定理）**：$f$ 在 $[a, b]$ 上有界变差当且仅当 $f$ 可表示为两个单调递增函数之差：$f = g - h$，其中 $g, h$ 单调递增。具体可取 $g(x) = V_a^x(f)$（全变差函数），$h(x) = V_a^x(f) - f(x)$。

**证明**：若 $f = g - h$ 且 $g, h$ 单调递增，则对任意分割，$\sum |f(x_i) - f(x_{i-1})| \leq \sum (g(x_i) - g(x_{i-1})) + \sum (h(x_i) - h(x_{i-1})) = (g(b) - g(a)) + (h(b) - h(a))$，故 $V_a^b(f) < \infty$。

反之，设 $V_a^b(f) < \infty$。定义 $g(x) = V_a^x(f)$。则 $g$ 单调递增，且 $g(x) \pm f(x)$ 均为单调递增（因为 $g(y) - g(x) \geq |f(y) - f(x)|$）。取 $h = g - f$ 即得 $h$ 单调递增。$\blacksquare$

**推论 47.7.2**：有界变差函数几乎处处可导（由 Lebesgue 定理，单调函数几乎处处可导）。

**定理 47.7.3（Lebesgue-Stieltjes 积分）**：设 $\alpha: [a, b] \to \mathbb{R}$ 为有界变差函数。由 $\alpha$ 诱导的 Lebesgue-Stieltjes 测度 $\mu_\alpha$ 满足 $\mu_\alpha((c, d]) = \alpha(d) - \alpha(c)$（对 $a \leq c < d \leq b$）。Lebesgue-Stieltjes 积分 $\int_a^b f \, d\alpha = \int_{[a,b]} f \, d\mu_\alpha$ 统一了 Riemann-Stieltjes 积分和 Lebesgue 积分：当 $\alpha(x) = x$ 时退化为通常的 Lebesgue 积分；当 $\alpha$ 为阶梯函数时退化为离散求和（即 $\sum f(x_j) \Delta \alpha_j$）。

**证明**：由 Riesz 表示定理，$C[a,b]$ 上的正线性泛函一一对应于有限 Borel 测度。有界变差函数 $\alpha$ 通过 Riemann-Stieltjes 积分 $f \mapsto \int_a^b f \, d\alpha$（对 $f \in C[a,b]$）定义了 $C[a,b]$ 上的线性泛函。由 Jordan 分解，$\alpha$ 可分解为两个单调递增函数之差，从而该泛函可分解为正泛函之差，对应一个符号 Borel 测度 $\mu_\alpha$。$\blacksquare$

**定理 47.7.4（Lebesgue-Stieltjes 积分的 Radon-Nikodym 表示）**：若 $\alpha$ 是绝对连续的，则 $d\alpha = \alpha'(x) dx$，即 $\mu_\alpha \ll m$，且 $\frac{d\mu_\alpha}{dm} = \alpha'$。此时 Lebesgue-Stieltjes 积分退化为 $\int_a^b f(x) \alpha'(x) dx$。

### 47.8 微分与积分的互逆

**定理 47.8.1（Lebesgue 微分定理）**：设 $f \in L^1_{\text{loc}}(\mathbb{R}^n)$。则对 a.e. $x \in \mathbb{R}^n$，

$$\lim_{r \to 0} \frac{1}{m(B(x, r))} \int_{B(x, r)} f(y) \, dm(y) = f(x)$$

**定义 47.8.1（Hardy-Littlewood 极大函数）**：对 $f \in L^1_{\text{loc}}(\mathbb{R}^n)$，其 Hardy-Littlewood 极大函数定义为

$$
Mf(x) = \sup_{r > 0} \frac{1}{m(B(x, r))} \int_{B(x, r)} |f(y)| \, dy
$$

**定理 47.8.2（极大函数的弱 $(1,1)$ 型估计）**：存在常数 $C_n > 0$（仅依赖于维数 $n$）使得对任意 $\lambda > 0$，

$$
m(\{x \in \mathbb{R}^n \mid Mf(x) > \lambda\}) \leq \frac{C_n}{\lambda} \int_{\mathbb{R}^n} |f(y)| \, dy
$$

**证明**（Lebesgue 微分定理的框架）：利用 Hardy-Littlewood 极大函数的弱 $(1,1)$ 型估计和 Vitali 覆盖引理。对任意 $\varepsilon > 0$，取 $g \in C_c(\mathbb{R}^n)$ 使得 $\|f - g\|_1 < \varepsilon$（连续函数在 $L^1$ 中的稠密性）。令 $E_\alpha = \{x : \limsup_{r \to 0} |\frac{1}{|B(x,r)|} \int_{B(x,r)} f - f(x)| > \alpha\}$。利用 $f = (f - g) + g$ 分解，$g$ 部分的极限为 $0$（由连续性），$(f-g)$ 部分由极大函数估计控制。由 $\varepsilon$ 和 $\alpha$ 的任意性，$E_\alpha$ 为零测集，对所有 $\alpha > 0$ 取可数并即得结论。$\blacksquare$

**定理 47.8.3（Newton-Leibniz 公式的 Lebesgue 版本）**：设 $f$ 在 $[a, b]$ 上 Lebesgue 可积。定义 $F(x) = \int_a^x f(t) \, dm(t)$。则 $F$ 在 $[a, b]$ 上绝对连续，且 $F'(x) = f(x)$ a.e.。反之，若 $F$ 在 $[a, b]$ 上绝对连续，则 $F'$ 存在 a.e.，$F' \in L^1([a, b])$，且 $F(x) - F(a) = \int_a^x F'(t) \, dm(t)$。

**证明**：由积分的绝对连续性，$F$ 是绝对连续的。$F'$ 的 a.e. 存在性来自 Lebesgue 微分定理。反向：绝对连续函数有界变差，故 $F'$ 存在 a.e. 且可积。由 $F$ 的绝对连续性，两个函数 $F(x)$ 和 $\int_a^x F'(t) dt$ 有相同的导数 a.e. 且都绝对连续，故差为常数（由 Lebesgue 微分定理的推论）。$\blacksquare$

**定义 47.8.2（绝对连续函数）**：函数 $F: [a, b] \to \mathbb{R}$ 称为**绝对连续**的，若对任意 $\varepsilon > 0$，存在 $\delta > 0$ 使得对任意有限个互不相交的开区间 $(a_k, b_k) \subseteq [a, b]$，满足 $\sum (b_k - a_k) < \delta$ 时，$\sum |F(b_k) - F(a_k)| < \varepsilon$。

**命题 47.8.4**：绝对连续函数必为有界变差函数，且满足 Lusin 性质（将零测集映为零测集）。绝对连续函数是满足 Newton-Leibniz 公式的函数类的精确刻画。

---

### 47.9 乘积测度与 Fubini 定理

**定理 47.9.1（Fubini-Tonelli 定理）**：设 $(X, \mathcal{A}, \mu)$ 和 $(Y, \mathcal{B}, \nu)$ 为 $\sigma$-有限的测度空间。

(i) **Tonelli 定理**（非负情形）：若 $f: X \times Y \to [0, \infty]$ 为 $\mathcal{A} \otimes \mathcal{B}$-可测函数，则

$$
\int_X \int_Y f(x, y) \, d\nu(y) \, d\mu(x) = \int_Y \int_X f(x, y) \, d\mu(x) \, d\nu(y) = \int_{X \times Y} f \, d(\mu \times \nu)
$$

(ii) **Fubini 定理**（可积情形）：若 $f \in L^1(\mu \times \nu)$，则 $f(x, \cdot) \in L^1(\nu)$ 对 $\mu$-a.e. $x$ 成立，$f(\cdot, y) \in L^1(\mu)$ 对 $\nu$-a.e. $y$ 成立，且上述积分等式成立。

**证明**：先对 $f$ 为特征函数 $\chi_{A \times B}$（$A \in \mathcal{A}, B \in \mathcal{B}$）验证：$\int_X \int_Y \chi_{A \times B} d\nu d\mu = \int_X \nu(B) \chi_A d\mu = \mu(A)\nu(B) = (\mu \times \nu)(A \times B)$。由线性性推广到非负简单函数，再由单调收敛定理推广到非负可测函数（Tonelli 定理）。Fubini 定理将 $f$ 分解为正负部 $f = f^+ - f^-$ 后应用 Tonelli 定理，由 $\int |f| d(\mu \times \nu) < \infty$ 保证 $f^+$ 和 $f^-$ 的 Tonelli 积分有限，从而其中的截面函数对 a.e. 点为可积的。$\blacksquare$

**注记 47.9.1**：Fubini 定理是 Lebesgue 积分理论超越 Riemann 积分的最重要优势之一。在 Riemann 积分框架下，重积分交换次序需要函数满足一致连续性等苛刻条件；而在 Lebesgue 框架下，仅需可测性和绝对可积性（或非负性），使用极为方便。这在概率论中尤为重要——联合分布与边缘分布的关系本质上是 Fubini 定理的推论。条件期望的几乎所有性质（如 $\mathbb{E}[\mathbb{E}[X \mid \mathcal{G}]] = \mathbb{E}[X]$）都可以追溯到 Fubini 定理。

**推论 47.9.2（乘积测度的完备性）**：Lebesgue 测度 $m_n$ 在 $\mathbb{R}^n$ 上是一维 Lebesgue 测度 $m_1$ 的 $n$ 次乘积完备化。即 $m_n = \overline{m_1 \times \cdots \times m_1}$。

---

### 47.10 Egorov 定理与 Lusin 定理

**定理 47.10.1（Egorov 定理）**：设 $E$ 为有限测度可测集，$\{f_k\}$ 为 $E$ 上的可测函数列，$f_k \to f$ a.e.。则对任意 $\varepsilon > 0$，存在可测集 $A \subseteq E$ 满足 $m(E \setminus A) < \varepsilon$，且在 $A$ 上 $f_k \to f$ 一致收敛。

**证明**：不妨设 $f_k \to f$ 在 $E$ 上处处收敛（去掉零测集不影响）。对 $n, m \in \mathbb{N}$，定义

$$
E_{n,m} = \bigcup_{k=n}^{\infty} \left\{x \in E : |f_k(x) - f(x)| \geq \frac{1}{m}\right\}
$$

对固定的 $m$，$E_{n,m} \downarrow \emptyset$（$n \to \infty$）。由 $m(E) < \infty$ 和测度的上连续性，$m(E_{n,m}) \to 0$。对任意 $\varepsilon > 0$，取 $n_m$ 使 $m(E_{n_m, m}) < \varepsilon / 2^m$。令 $A = E \setminus \bigcup_{m=1}^{\infty} E_{n_m, m}$。则 $m(E \setminus A) \leq \sum_{m=1}^{\infty} m(E_{n_m, m}) < \varepsilon$。且在 $A$ 上，对所有 $m$ 和 $k \geq n_m$，$|f_k(x) - f(x)| < 1/m$，故 $f_k \to f$ 在 $A$ 上一致收敛。$\blacksquare$

**注记 47.10.1**：Egorov 定理体现了 Lusin 的名言："几乎处处收敛的函数在去掉一个任意小测度集后一致收敛。"它揭示了可测函数列几乎处处收敛与一致收敛之间的深刻联系。有限测度条件是必要的：考虑 $\mathbb{R}$ 上 $f_n = \chi_{[n, n+1]}$，$f_n \to 0$ 逐点，但无法在任意大测度集上一致收敛。

**定理 47.10.2（Lusin 定理）**：设 $f$ 为 $E$ 上的可测函数（$m(E) < \infty$）。则对任意 $\varepsilon > 0$，存在紧集 $K \subseteq E$ 满足 $m(E \setminus K) < \varepsilon$，且 $f|_K$ 连续。

**证明**：先对 $f$ 为简单函数（特征函数）的情形验证，由可测集的外正则性（紧集逼近）和 Urysohn 引理推出。对一般可测函数，用简单函数逼近和 Egorov 定理。$\blacksquare$

Lusin 定理表明：可测函数"几乎"是连续函数。这一事实是 $C_c(\mathbb{R}^n)$ 在 $L^p(\mathbb{R}^n)$ 中稠密性的基础，也是实分析与泛函分析之间桥梁的基石之一。

---

### 47.11 Radon-Nikodym 定理与条件期望

**定义 47.11.1（绝对连续的测度）**：设 $\mu, \nu$ 为 $(X, \mathcal{A})$ 上的测度。$\nu$ 关于 $\mu$ 绝对连续（记为 $\nu \ll \mu$），若对任意 $A \in \mathcal{A}$，$\mu(A) = 0$ 蕴含 $\nu(A) = 0$。

**定理 47.11.1（Radon-Nikodym 定理）**：设 $(X, \mathcal{A}, \mu)$ 为 $\sigma$-有限测度空间，$\nu$ 为 $\sigma$-有限的符号测度满足 $\nu \ll \mu$。则存在唯一的 $\mu$-a.e. 有限的可测函数 $f$（称为 Radon-Nikodym 导数，记为 $f = \frac{d\nu}{d\mu}$），使得对任意 $A \in \mathcal{A}$，

$$
\nu(A) = \int_A f \, d\mu
$$

**证明**（框架）：由 Hahn 分解，只需对正测度 $\nu$ 证明。考虑函数类 $\mathcal{F} = \{f \geq 0 \text{ 可测} : \int_A f d\mu \leq \nu(A), \forall A\}$。$\mathcal{F}$ 非空（$0 \in \mathcal{F}$）。取 $f_0 \in \mathcal{F}$ 最大化 $\int_X f d\mu$（由极大元存在性，利用单调收敛定理）。验证 $\int_A f_0 d\mu = \nu(A)$ 对所有 $A$ 成立。若否，存在 $A_0$ 使 $\nu(A_0) - \int_{A_0} f_0 d\mu > 0$。由 $\sigma$-有限性，可构造一个与 $f_0$ 不兼容的附加函数，破坏 $f_0$ 的极大性。$\blacksquare$

**注记 47.11.1**：Radon-Nikodym 定理是条件期望的数学基础。给定概率空间 $(\Omega, \mathcal{F}, \mathbb{P})$ 和子 $\sigma$-代数 $\mathcal{G} \subseteq \mathcal{F}$，对 $X \in L^1(\mathcal{F})$，定义 $\nu(G) = \int_G X d\mathbb{P}$（$G \in \mathcal{G}$）。则 $\nu \ll \mathbb{P}|_{\mathcal{G}}$，由 Radon-Nikodym 定理，存在唯一的 $\mathcal{G}$-可测函数 $\mathbb{E}[X \mid \mathcal{G}]$ 满足 $\int_G \mathbb{E}[X \mid \mathcal{G}] d\mathbb{P} = \int_G X d\mathbb{P}$。这一定义统一了初等概率论中离散和连续情形的条件期望，并允许将条件期望推广到任意子 $\sigma$-代数，是现代概率论公理化体系的核心。