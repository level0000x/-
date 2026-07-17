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

---

---

---

---

---