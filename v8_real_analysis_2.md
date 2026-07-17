# 卷八：实分析 II

---

> **前置知识**：本卷建立在卷一（数系、确界原理、集合论）和卷四（极限、连续、导数、Riemann 积分）的基础之上。读者应熟悉 $\varepsilon$-$\delta$ 语言、确界原理、数列与函数的极限理论、以及 Riemann 积分的基本概念。

## Ch 45 集合的测度
### 45.1 引言：从 Riemann 积分到 Lebesgue 积分

Riemann 积分将定义域划分为小区间，在每个小区间上取函数值近似。这一方法具有直观性，但存在以下局限：

1. Riemann 可积函数类不够广泛（Dirichlet 函数不可积）
2. 极限与积分交换的条件苛刻（需要一致收敛）
3. 缺乏完备性（Riemann 可积函数空间不完备）

Lebesgue 测度与积分理论的核心思想是：**将值域划分为小区间，考察每个值对应的定义域集合的"大小"**。这需要先定义 $\mathbb{R}^n$ 中子集的"大小"——即测度。

---

### 45.2 Lebesgue 外测度

**定义 45.2.1（开矩体）**：$\mathbb{R}^n$ 中的**开矩体** $I$ 是形如

$$
I = (a_1, b_1) \times (a_2, b_2) \times \cdots \times (a_n, b_n)
$$

的集合，其中 $a_i < b_i$（$i = 1, \ldots, n$）。$I$ 的**体积** $|I|$ 定义为

$$
|I| = \prod_{i=1}^{n} (b_i - a_i)
$$

**定义 45.2.2（Lebesgue 外测度）**：设 $E \subseteq \mathbb{R}^n$。$E$ 的 **Lebesgue 外测度** $m^*(E)$ 定义为

$$
m^*(E) = \inf\left\{\sum_{j=1}^{\infty} |I_j| \;\middle|\; E \subseteq \bigcup_{j=1}^{\infty} I_j, \; I_j \text{ 为开矩体}\right\}
$$

即用可数个开矩体覆盖 $E$ 时，覆盖体积之和的下确界。

**定理 45.2.1（外测度的基本性质）**：

(i) **非负性**：$m^*(E) \geq 0$，$m^*(\varnothing) = 0$
(ii) **单调性**：$E_1 \subseteq E_2 \implies m^*(E_1) \leq m^*(E_2)$
(iii) **次可数可加性**：$\displaystyle m^*\left(\bigcup_{j=1}^{\infty} E_j\right) \leq \sum_{j=1}^{\infty} m^*(E_j)$
(iv) **平移不变性**：$m^*(E + h) = m^*(E)$（$h \in \mathbb{R}^n$）
(v) **矩体的外测度**：若 $I$ 为矩体（开、闭或半开半闭），则 $m^*(I) = |I|$

**证明**：

(i) 外测度是非负数的下确界，故非负。$\varnothing$ 可被体积 $\varepsilon$ 的矩体覆盖，$\forall \varepsilon > 0$，故 $m^*(\varnothing) = 0$。

(ii) $E_1$ 的覆盖也是 $E_2$ 的覆盖，故 $m^*(E_1)$ 的下确界不小于 $m^*(E_2)$ 的下确界。

(iii) 对任意 $\varepsilon > 0$，对每个 $E_j$ 取覆盖 $\{I_{jk}\}_{k=1}^{\infty}$ 使得 $\sum_k |I_{jk}| \leq m^*(E_j) + \varepsilon / 2^j$。则 $\bigcup_j E_j \subseteq \bigcup_{j,k} I_{jk}$，且 $\sum_{j,k} |I_{jk}| \leq \sum_j (m^*(E_j) + \varepsilon/2^j) = \sum_j m^*(E_j) + \varepsilon$。取 $\varepsilon \to 0$ 即得。

(iv) 开矩体平移后体积不变，覆盖也平移，故外测度不变。

(v) 需证 $m^*(I) = |I|$。$|I| \leq m^*(I)$ 需要 $I$ 的任何覆盖体积之和 $\geq |I|$，这涉及紧致性论证（开矩体覆盖紧致矩体时，可选出有限子覆盖，其体积之和 $\geq |I|$）。$m^*(I) \leq |I|$ 是平凡的（$I$ 自身就是一个覆盖）。$\blacksquare$

**评注 45.2.1**：外测度在一般集合上不是可数可加的。例如，存在 $E \subseteq [0, 1]$ 使得 $m^*(E) > 0$ 但 $m^*(E^c) = 1$ 且 $m^*(E) + m^*(E^c) > 1 = m^*([0, 1])$。这需要选择公理构造 Vitali 集（见 §45.5）。

---

### 45.3 Carathéodory 条件与可测集

**定义 45.3.1（Carathéodory 可测集）**：$E \subseteq \mathbb{R}^n$ 称为 **Lebesgue 可测集**（简称可测集），若对任意 $A \subseteq \mathbb{R}^n$，

$$
m^*(A) = m^*(A \cap E) + m^*(A \cap E^c)
$$

即 $E$ 将任何集合 $A$ 的外测度"分割"得恰好。此时记 $m(E) = m^*(E)$，称为 $E$ 的 **Lebesgue 测度**。

**定理 45.3.1（可测集的基本性质）**：

(i) 若 $m^*(E) = 0$，则 $E$ 可测（零测集可测）
(ii) 若 $E$ 可测，则 $E^c$ 可测
(iii) 可测集的有限并（从而有限交）可测
(iv) 可测集的可数并可测
(v) 开集和闭集可测

**证明**：

(i) 对任意 $A$，$A \cap E \subseteq E$，故 $m^*(A \cap E) \leq m^*(E) = 0$。$A \cap E^c \subseteq A$，故 $m^*(A \cap E^c) \leq m^*(A)$。由次可加性，$m^*(A) \leq m^*(A \cap E) + m^*(A \cap E^c) = 0 + m^*(A \cap E^c) \leq m^*(A)$。故 $m^*(A) = m^*(A \cap E) + m^*(A \cap E^c)$。

(ii) $E$ 和 $E^c$ 在 Carathéodory 条件中是对称的。

(iii) 先证两个可测集的并可测。设 $E_1, E_2$ 可测。对任意 $A$，
$$
\begin{aligned}
m^*(A) &= m^*(A \cap E_1) + m^*(A \cap E_1^c) \\
&= m^*(A \cap E_1) + m^*(A \cap E_1^c \cap E_2) + m^*(A \cap E_1^c \cap E_2^c)
\end{aligned}
$$
注意 $A \cap (E_1 \cup E_2) = (A \cap E_1) \cup (A \cap E_1^c \cap E_2)$。由次可加性，
$$
m^*(A \cap (E_1 \cup E_2)) \leq m^*(A \cap E_1) + m^*(A \cap E_1^c \cap E_2)
$$
而 $A \cap (E_1 \cup E_2)^c = A \cap E_1^c \cap E_2^c$。故
$$
m^*(A \cap (E_1 \cup E_2)) + m^*(A \cap (E_1 \cup E_2)^c) \leq m^*(A \cap E_1) + m^*(A \cap E_1^c \cap E_2) + m^*(A \cap E_1^c \cap E_2^c) = m^*(A)
$$
反向不等式由次可加性成立。故 $E_1 \cup E_2$ 可测。

(iv) 设 $\{E_j\}_{j=1}^{\infty}$ 为可测集。可通过构造互不相交的可测集 $\{F_j\}$（$F_1 = E_1$，$F_j = E_j \setminus \bigcup_{i=1}^{j-1} E_i$），使得 $\bigcup E_j = \bigcup F_j$（不交并）。对任意 $A$，可证
$$
m^*(A) = \sum_{j=1}^{k} m^*(A \cap F_j) + m^*\left(A \cap \left(\bigcup_{j=1}^{k} F_j\right)^c\right) \geq \sum_{j=1}^{k} m^*(A \cap F_j) + m^*\left(A \cap \left(\bigcup_{j=1}^{\infty} F_j\right)^c\right)
$$
令 $k \to \infty$，由外测度的次可加性得
$$
m^*(A) \geq \sum_{j=1}^{\infty} m^*(A \cap F_j) + m^*\left(A \cap \left(\bigcup_{j=1}^{\infty} F_j\right)^c\right) \geq m^*(A \cap \bigcup F_j) + m^*(A \cap (\bigcup F_j)^c)
$$
故 $\bigcup E_j$ 可测。

(v) 开矩体可测（由定义直接验证），开集是可数个开矩体的并，故可测。闭集是开集的补，也可测。$\blacksquare$

**定理 45.3.2（可测集的可数可加性）**：设 $\{E_j\}_{j=1}^{\infty}$ 为两两不交的可测集。则

$$
m\left(\bigcup_{j=1}^{\infty} E_j\right) = \sum_{j=1}^{\infty} m(E_j)
$$

**证明**：在定理 45.3.1(iv) 的证明中取 $A = \bigcup E_j$，则 $m^*(A \cap (\bigcup E_j)^c) = m^*(\varnothing) = 0$，且 $A \cap F_j = F_j = E_j$（当 $E_j$ 互不相交时）。故 $m^*(\bigcup E_j) = \sum m^*(E_j)$。$\blacksquare$

**定理 45.3.3（测度的连续性）**：

(i) **下连续性**：若 $E_1 \subseteq E_2 \subseteq \cdots$ 可测，则 $m(\bigcup_{j=1}^{\infty} E_j) = \lim_{j \to \infty} m(E_j)$
(ii) **上连续性**：若 $E_1 \supseteq E_2 \supseteq \cdots$ 可测且 $m(E_1) < \infty$，则 $m(\bigcap_{j=1}^{\infty} E_j) = \lim_{j \to \infty} m(E_j)$

**证明**：

(i) 令 $F_1 = E_1$，$F_j = E_j \setminus E_{j-1}$（$j \geq 2$）。则 $\{F_j\}$ 两两不交且 $\bigcup E_j = \bigcup F_j$，$E_k = \bigcup_{j=1}^{k} F_j$。由可数可加性，
$$
m\left(\bigcup E_j\right) = \sum_{j=1}^{\infty} m(F_j) = \lim_{k \to \infty} \sum_{j=1}^{k} m(F_j) = \lim_{k \to \infty} m(E_k)
$$

(ii) 令 $F_j = E_1 \setminus E_j$。则 $F_1 \subseteq F_2 \subseteq \cdots$ 且 $\bigcup F_j = E_1 \setminus \bigcap E_j$。由 (i)，
$$
m(E_1) - m\left(\bigcap E_j\right) = m\left(\bigcup F_j\right) = \lim_{j \to \infty} m(F_j) = \lim_{j \to \infty} (m(E_1) - m(E_j)) = m(E_1) - \lim_{j \to \infty} m(E_j)
$$
故 $m(\bigcap E_j) = \lim m(E_j)$。$\blacksquare$

---

### 45.4 Borel 集与正则性

**定义 45.4.1（Borel $\sigma$-代数）**：$\mathbb{R}^n$ 中由开集生成的最小 $\sigma$-代数（即包含所有开集且对可数并、可数交、补封闭的最小集族）称为 **Borel $\sigma$-代数**，其中的集合称为 **Borel 集**。

**定理 45.4.1**：所有 Borel 集都是 Lebesgue 可测的。

**证明**：由定理 45.3.1，开集可测，且可测集族构成 $\sigma$-代数（对补、可数并封闭），故包含所有开集的最小 $\sigma$-代数——即 Borel $\sigma$-代数——是 Lebesgue 可测集族的子族。$\blacksquare$

**定理 45.4.2（外正则性）**：对任意可测集 $E \subseteq \mathbb{R}^n$，

$$
m(E) = \inf\{m(U) \mid E \subseteq U, \; U \text{ 为开集}\}
$$

**定理 45.4.3（内正则性）**：对任意可测集 $E \subseteq \mathbb{R}^n$，

$$
m(E) = \sup\{m(K) \mid K \subseteq E, \; K \text{ 为紧集}\}
$$

**证明概要**：由外测度的定义，$E$ 可被可数个开矩体覆盖，它们的并 $U$ 是开集。紧致性方面，有界可测集可被紧集从内部逼近；无界可测集是递增有界可测集之并。$\blacksquare$

---

### 45.5 Vitali 集与非可测性

**定理 45.5.1（Vitali 集的存在性）**：存在 $\mathbb{R}$ 的子集不是 Lebesgue 可测的。

**证明**（需要选择公理）：在 $[0, 1]$ 上定义等价关系 $x \sim y \iff x - y \in \mathbb{Q}$。每个等价类形如 $x + \mathbb{Q}$。由选择公理，从每个等价类中选取一个代表元，构成 Vitali 集 $V \subseteq [0, 1]$。

设 $\{r_j\}_{j=1}^{\infty}$ 为 $[-1, 1] \cap \mathbb{Q}$ 的枚举。则 $V + r_j$ 两两不交（若 $v_1 + r_j = v_2 + r_k$，则 $v_1 - v_2 \in \mathbb{Q}$，故 $v_1 = v_2$，$r_j = r_k$），且 $[0, 1] \subseteq \bigcup_j (V + r_j) \subseteq [-1, 2]$。

若 $V$ 可测，则 $m(V + r_j) = m(V)$（平移不变性）。由可数可加性，$m(\bigcup_j (V + r_j)) = \sum_j m(V)$。若 $m(V) = 0$，则 $m(\bigcup (V + r_j)) = 0$，但 $[0, 1] \subseteq \bigcup (V + r_j)$，故 $m([0, 1]) = 0$，矛盾。若 $m(V) > 0$，则 $\sum m(V) = \infty$，但 $\bigcup (V + r_j) \subseteq [-1, 2]$ 测度有限，矛盾。故 $V$ 不可测。$\blacksquare$

---

---

## Ch 46 可测函数
### 46.1 可测函数的定义

**定义 46.1.1（可测函数）**：设 $E \subseteq \mathbb{R}^n$ 可测，$f : E \to \overline{\mathbb{R}} = \mathbb{R} \cup \{\pm\infty\}$。若对任意 $\alpha \in \mathbb{R}$，

$$
\{x \in E \mid f(x) > \alpha\}
$$

是可测集，则称 $f$ 为 $E$ 上的 **Lebesgue 可测函数**（简称可测函数）。

**定理 46.1.1（可测性的等价条件）**：以下条件等价：

(i) $\{f > \alpha\}$ 可测（$\forall \alpha \in \mathbb{R}$）
(ii) $\{f \geq \alpha\}$ 可测（$\forall \alpha \in \mathbb{R}$）
(iii) $\{f < \alpha\}$ 可测（$\forall \alpha \in \mathbb{R}$）
(iv) $\{f \leq \alpha\}$ 可测（$\forall \alpha \in \mathbb{R}$）

**证明**：(i) $\implies$ (ii)：$\{f \geq \alpha\} = \bigcap_{k=1}^{\infty} \{f > \alpha - 1/k\}$，可测集的可数交可测。

(ii) $\implies$ (iii)：$\{f < \alpha\} = E \setminus \{f \geq \alpha\}$。

(iii) $\implies$ (iv)：$\{f \leq \alpha\} = \bigcap_{k=1}^{\infty} \{f < \alpha + 1/k\}$。

(iv) $\implies$ (i)：$\{f > \alpha\} = E \setminus \{f \leq \alpha\}$。$\blacksquare$

**定理 46.1.2（可测函数的运算）**：设 $f, g$ 为 $E$ 上的可测函数（取值有限 a.e.），则

(i) $f + g$，$f - g$，$fg$ 可测（在定义有意义处）
(ii) $f/g$ 可测（若 $g \neq 0$ a.e.）
(iii) $\max(f, g)$，$\min(f, g)$，$|f|$ 可测
(iv) 若 $\{f_k\}$ 为可测函数列，则 $\sup f_k$，$\inf f_k$，$\limsup f_k$，$\liminf f_k$ 可测

**证明**：

(i) $\{f + g > \alpha\} = \bigcup_{r \in \mathbb{Q}} (\{f > r\} \cap \{g > \alpha - r\})$，可测集的可数并可测。

(iii) $\{\max(f, g) > \alpha\} = \{f > \alpha\} \cup \{g > \alpha\}$。

(iv) $\{\sup_k f_k > \alpha\} = \bigcup_k \{f_k > \alpha\}$。$\blacksquare$

---

### 46.2 简单函数及其逼近

**定义 46.2.1（简单函数）**：$E$ 上的**简单函数** $\varphi$ 是形如

$$
\varphi(x) = \sum_{j=1}^{k} a_j \chi_{E_j}(x)
$$

的函数，其中 $E_j$ 为两两不交的可测集，$\chi_{E_j}$ 为特征函数，$a_j \in \mathbb{R}$。

**定理 46.2.1（简单函数逼近定理）**：设 $f$ 为 $E$ 上的非负可测函数。则存在递增的简单函数列 $\{\varphi_k\}$ 使得 $\varphi_k(x) \uparrow f(x)$（逐点收敛）。

**证明**：对 $k \in \mathbb{N}^+$，将 $[0, k]$ 划分为 $k \cdot 2^k$ 个长度为 $1/2^k$ 的小区间。定义

$$
\varphi_k(x) = \begin{cases}
\frac{j-1}{2^k}, & \text{若 } \frac{j-1}{2^k} \leq f(x) < \frac{j}{2^k}, \; j = 1, \ldots, k \cdot 2^k \\
k, & \text{若 } f(x) \geq k
\end{cases}
$$

则 $\varphi_k$ 是简单函数，$\varphi_k \leq \varphi_{k+1}$，且 $\lim_{k \to \infty} \varphi_k(x) = f(x)$（$\forall x \in E$）。$\blacksquare$

**推论 46.2.2**：任意可测函数 $f$ 可表示为简单函数列的逐点极限（通过分解 $f = f^+ - f^-$）。

---

### 46.3 Egorov 定理与 Lusin 定理

**定理 46.3.1（Egorov 定理——几乎一致收敛）**：设 $E \subseteq \mathbb{R}^n$ 可测且 $m(E) < \infty$，$\{f_k\}$ 为 $E$ 上的可测函数列，$f_k \to f$ a.e.。则对任意 $\varepsilon > 0$，存在可测子集 $A \subseteq E$ 使得 $m(E \setminus A) < \varepsilon$ 且 $f_k \to f$ 在 $A$ 上**一致收敛**。

**证明**：对每个 $j, k \in \mathbb{N}^+$，定义

$$
E_{j,k} = \left\{x \in E \;\middle|\; \sup_{n \geq k} |f_n(x) - f(x)| > \frac{1}{j}\right\}
$$

由于 $f_n \to f$ a.e.，$\forall j$，$\bigcap_{k=1}^{\infty} E_{j,k}$ 为零测集。由 $m(E) < \infty$ 和测度的上连续性，$\lim_{k \to \infty} m(E_{j,k}) = 0$。

对 $\varepsilon > 0$，取 $k_j$ 使得 $m(E_{j, k_j}) < \varepsilon / 2^j$。令 $A = E \setminus \bigcup_{j=1}^{\infty} E_{j, k_j}$。则

$$
m(E \setminus A) = m\left(\bigcup_{j=1}^{\infty} E_{j, k_j}\right) \leq \sum_{j=1}^{\infty} m(E_{j, k_j}) < \varepsilon
$$

在 $A$ 上，对任意 $j$，当 $n \geq k_j$ 时 $|f_n - f| \leq 1/j$，故 $f_n \to f$ 一致。$\blacksquare$

**定理 46.3.2（Lusin 定理——几乎连续）**：设 $E \subseteq \mathbb{R}^n$ 可测且 $m(E) < \infty$，$f$ 为 $E$ 上 a.e. 有限的可测函数。则对任意 $\varepsilon > 0$，存在紧集 $K \subseteq E$ 使得 $m(E \setminus K) < \varepsilon$ 且 $f|_K$ 连续。

**证明概要**：先用简单函数逼近 $f$，对简单函数用 Egorov 定理和可测集的内正则性，再通过极限过程推广到一般可测函数。$\blacksquare$

---

---

## Ch 47 Lebesgue 积分
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

## Ch 48  $L^p$ 空间
### 48.1  $L^p$ 空间的定义

**定义 48.1.1（ $L^p$ 范数）**：设 $E \subseteq \mathbb{R}^n$ 可测，$1 \leq p < \infty$。$f$ 的 $L^p$ **范数**定义为

$$
\|f\|_p = \left(\int_E |f|^p \, dm\right)^{1/p}
$$

$L^p(E)$ 是所有满足 $\|f\|_p < \infty$ 的可测函数 $f$ 的集合（模去 a.e. 相等的函数，即 $f = g$ a.e. 视为同一元素）。

**定义 48.1.2（ $L^\infty$ 范数）**：$f$ 的 $L^\infty$ **范数**（本质上确界）定义为

$$
\|f\|_\infty = \inf\{M \geq 0 \mid |f(x)| \leq M \text{ a.e.}\}
$$

$L^\infty(E)$ 是所有满足 $\|f\|_\infty < \infty$ 的可测函数的集合。

**定理 48.1.1**：$L^p(E)$ 是向量空间（$1 \leq p \leq \infty$）。

**证明**：由 $|f + g|^p \leq 2^p(|f|^p + |g|^p)$（$p < \infty$）或 $\|f + g\|_\infty \leq \|f\|_\infty + \|g\|_\infty$（$p = \infty$）。$\blacksquare$

---

### 48.2 Hölder 不等式与 Minkowski 不等式

**定理 48.2.1（Young 不等式）**：设 $a, b \geq 0$，$p, q > 1$ 满足 $\frac{1}{p} + \frac{1}{q} = 1$。则

$$
ab \leq \frac{a^p}{p} + \frac{b^q}{q}
$$

**证明**：由凸函数 $t \mapsto e^t$ 的性质，$\frac{a^p}{p} + \frac{b^q}{q} = e^{\ln a^p - \ln p} + e^{\ln b^q - \ln q} \geq e^{\frac{1}{p}\ln a^p + \frac{1}{q}\ln b^q} = ab$。等号成立当且仅当 $a^p = b^q$。$\blacksquare$

**定理 48.2.2（Hölder 不等式）**：设 $1 < p, q < \infty$，$\frac{1}{p} + \frac{1}{q} = 1$。若 $f \in L^p$，$g \in L^q$，则 $fg \in L^1$ 且

$$
\|fg\|_1 \leq \|f\|_p \|g\|_q
$$

**证明**：若 $\|f\|_p = 0$ 或 $\|g\|_q = 0$，不等式平凡成立。否则，令 $a = |f(x)|/\|f\|_p$，$b = |g(x)|/\|g\|_q$。由 Young 不等式，

$$
\frac{|f(x)g(x)|}{\|f\|_p \|g\|_q} \leq \frac{1}{p} \frac{|f(x)|^p}{\|f\|_p^p} + \frac{1}{q} \frac{|g(x)|^q}{\|g\|_q^q}
$$

两边积分得 $\frac{\|fg\|_1}{\|f\|_p \|g\|_q} \leq \frac{1}{p} + \frac{1}{q} = 1$。$\blacksquare$

**定理 48.2.3（Minkowski 不等式）**：设 $1 \leq p < \infty$，$f, g \in L^p$。则

$$
\|f + g\|_p \leq \|f\|_p + \|g\|_p
$$

**证明**：$p = 1$ 时由三角不等式直接得到。$p > 1$ 时，

$$
\begin{aligned}
\|f + g\|_p^p &= \int |f + g|^p \leq \int |f + g|^{p-1}|f| + \int |f + g|^{p-1}|g| \\
&\leq \left(\int |f + g|^{(p-1)q}\right)^{1/q} \left(\int |f|^p\right)^{1/p} + \left(\int |f + g|^{(p-1)q}\right)^{1/q} \left(\int |g|^p\right)^{1/p} \\
&= \|f + g\|_p^{p/q} (\|f\|_p + \|g\|_p)
\end{aligned}
$$

其中第二步用了 Hölder 不等式（$\frac{1}{p} + \frac{1}{q} = 1$，$(p-1)q = p$）。两边除以 $\|f + g\|_p^{p/q}$（若为 $0$ 则平凡），得 $\|f + g\|_p \leq \|f\|_p + \|g\|_p$。$\blacksquare$

**推论 48.2.4**：$\|\cdot\|_p$ 是 $L^p(E)$ 上的范数。

---

### 48.3  $L^p$ 空间的完备性（Riesz-Fischer 定理）

**定理 48.3.1（Riesz-Fischer 定理）**：$L^p(E)$（$1 \leq p \leq \infty$）关于 $\|\cdot\|_p$ 范数是完备的赋范向量空间（即 Banach 空间）。

**证明**（$1 \leq p < \infty$ 的情形）：设 $\{f_k\}$ 为 $L^p$ 中的 Cauchy 列。选取子列 $\{f_{k_j}\}$ 使得 $\|f_{k_{j+1}} - f_{k_j}\|_p < 2^{-j}$。

定义 $g_n = \sum_{j=1}^{n} |f_{k_{j+1}} - f_{k_j}|$，$g = \sum_{j=1}^{\infty} |f_{k_{j+1}} - f_{k_j}|$。由 Minkowski 不等式，

$$
\|g_n\|_p \leq \sum_{j=1}^{n} \|f_{k_{j+1}} - f_{k_j}\|_p < \sum_{j=1}^{n} 2^{-j} < 1
$$

由 Fatou 引理，$\|g\|_p^p = \int \liminf g_n^p \leq \liminf \int g_n^p \leq 1$，故 $g \in L^p$。特别地，$g(x) < \infty$ a.e.。

因此 $\sum (f_{k_{j+1}} - f_{k_j})$ a.e. 绝对收敛，故 $f_{k_j}$ a.e. 收敛到某个 $f$。定义 $f(x) = \lim_{j \to \infty} f_{k_j}(x)$（a.e.），其余处为 $0$。

由 Fatou 引理，$\|f - f_k\|_p^p = \int \liminf_{j \to \infty} |f_{k_j} - f_k|^p \leq \liminf_{j \to \infty} \|f_{k_j} - f_k\|_p^p$。由于 $\{f_k\}$ 是 Cauchy 列，右端对足够大的 $k$ 可任意小，故 $f_k \to f$ 在 $L^p$ 中。$\blacksquare$

---

### 48.4 稠密性定理

**定理 48.4.1（连续函数在 $L^p$ 中的稠密性）**：设 $1 \leq p < \infty$，$E \subseteq \mathbb{R}^n$ 可测且 $m(E) < \infty$。则 $C_c(E)$（紧支集连续函数）在 $L^p(E)$ 中稠密。

**证明概要**：

1. 特征函数 $\chi_A$（$A$ 可测，$m(A) < \infty$）可由连续函数逼近（由 Lusin 定理，存在紧集 $K \subseteq A$ 使得 $m(A \setminus K)$ 很小，构造连续函数在 $K$ 上为 $1$，在 $K$ 外迅速衰减）。
2. 简单函数是特征函数的线性组合，故也可由连续函数逼近。
3. 任意 $f \in L^p$ 可由简单函数逼近（简单函数逼近定理），故由连续函数逼近。$\blacksquare$

---

### 48.5  $L^2$ 空间与内积

**定理 48.5.1**：$L^2(E)$ 配备内积 $\langle f, g \rangle = \int_E fg \, dm$ 是 Hilbert 空间。

**证明**：由 Hölder 不等式（$p = q = 2$），$\langle f, g \rangle$ 有限。内积的四条公理直接验证。完备性由 Riesz-Fischer 定理（$p = 2$）。$\blacksquare$

---

---

## Ch 49 微分与积分的联系
### 49.1 有界变差函数

**定义 49.1.1（有界变差函数）**：设 $f : [a, b] \to \mathbb{R}$。$f$ 在 $[a, b]$ 上的**全变差**定义为

$$
V_a^b(f) = \sup\left\{\sum_{i=1}^{n} |f(x_i) - f(x_{i-1})| \;\middle|\; a = x_0 < x_1 < \cdots < x_n = b\right\}
$$

若 $V_a^b(f) < \infty$，则称 $f$ 为 $[a, b]$ 上的**有界变差函数**。全体有界变差函数记为 $BV([a, b])$。

**定理 49.1.1（Jordan 分解）**：$f \in BV([a, b])$ 当且仅当 $f$ 可表示为两个单调递增函数的差。

**证明**：

（$\Leftarrow$）单调函数的全变差有限，两个有界变差函数的差也有界变差。

（$\Rightarrow$）定义 $g(x) = V_a^x(f)$（全变差函数），$h(x) = g(x) - f(x)$。$g$ 递增（全变差随区间增长）。需证 $h$ 也递增。对 $x < y$，$h(y) - h(x) = V_x^y(f) - (f(y) - f(x)) \geq 0$（因为全变差至少是 $|f(y) - f(x)|$）。故 $f = g - h$ 是两个单调递增函数的差。$\blacksquare$

**推论 49.1.2**：$f \in BV([a, b])$ 几乎处处可导。

**证明**：由 Jordan 分解，$f$ 是两个单调函数的差。单调函数几乎处处可导（Lebesgue 微分定理，见下节），故 $f$ 也几乎处处可导。$\blacksquare$

---

### 49.2 Lebesgue 微分定理

**定理 49.2.1（Lebesgue 微分定理）**：设 $f : [a, b] \to \mathbb{R}$ 单调递增。则 $f$ 在 $[a, b]$ 上几乎处处可导，且 $f' \in L^1([a, b])$，满足

$$
\int_a^b f'(x) \, dx \leq f(b) - f(a)
$$

**注记 49.2.1**：完整证明需要 Hardy-Littlewood 极大函数和 Vitali 覆盖引理，在此从略。核心思想是：单调函数的不连续点至多可数，且其导数 $f'$ 是差商极限的测度论性质。

**证明思路**：利用 Hardy-Littlewood 极大函数的弱 $(1,1)$ 型估计。对任意 $\alpha > 0$，令 $E_\alpha = \{x : |f(x) - f_r(x)| > \alpha \text{ 无穷次}\}$。通过极大函数控制 $|f - f_r|$，结合 $L^1$ 函数的几乎处处连续性（Lusin 定理）和 Vitali 覆盖引理，可得 $m(E_\alpha) = 0$，即几乎处处收敛。详见：Stein, *Singular Integrals*, Ch I.3。

---

### 49.3 绝对连续函数

**定义 49.3.1（绝对连续函数）**：$f : [a, b] \to \mathbb{R}$ 称为**绝对连续**的，若对任意 $\varepsilon > 0$，存在 $\delta > 0$，使得对 $[a, b]$ 的任意有限个互不相交的子区间 $\{(a_k, b_k)\}$，若 $\sum (b_k - a_k) < \delta$，则 $\sum |f(b_k) - f(a_k)| < \varepsilon$。

**定理 49.3.1（绝对连续函数的性质）**：

(i) 绝对连续函数是一致连续的（且是有界变差的）
(ii) Lipschitz 连续函数是绝对连续的
(iii) 绝对连续函数几乎处处可导

**定理 49.3.2（微积分基本定理——Lebesgue 版）**：$f : [a, b] \to \mathbb{R}$ 绝对连续当且仅当存在 $g \in L^1([a, b])$ 使得

$$
f(x) - f(a) = \int_a^x g(t) \, dt, \quad \forall x \in [a, b]
$$

此时 $f' = g$ a.e.。

**证明**：

（$\Leftarrow$）若 $f(x) = f(a) + \int_a^x g(t) dt$，由积分的绝对连续性（Lebesgue 积分的绝对连续性：对 $g \in L^1$，$\forall \varepsilon > 0$，$\exists \delta > 0$，当 $m(A) < \delta$ 时 $\int_A |g| < \varepsilon$），$f$ 是绝对连续的。

（$\Rightarrow$）$f$ 绝对连续 $\implies$ $f \in BV$。由 Jordan 分解，$f = f_1 - f_2$（$f_1, f_2$ 递增）。可以证明 $f_1, f_2$ 也是绝对连续的。由 Lebesgue 微分定理，$f'$ a.e. 存在且 $f' \in L^1$。定义 $h(x) = \int_a^x f'(t) dt$。则 $h$ 绝对连续且 $h' = f'$ a.e.。令 $\varphi = f - h$。$\varphi$ 绝对连续且 $\varphi' = 0$ a.e.。可以证明 $\varphi$ 为常数（需要 Vitali 覆盖引理），故 $f(x) - f(a) = h(x) - h(a) = \int_a^x f'(t) dt$。$\blacksquare$

---

---

## Ch 50 Fourier 级数
### 50.1 正交系与 Bessel 不等式

**定义 50.1.1（ $L^2$ 中的规范正交系）**：$L^2([-\pi, \pi])$ 中的函数列 $\{\varphi_k\}_{k=1}^{\infty}$ 称为**规范正交系**，若

$$
\langle \varphi_i, \varphi_j \rangle = \int_{-\pi}^{\pi} \varphi_i(x) \overline{\varphi_j(x)} \, dx = \delta_{ij}
$$

**例 50.1.1**：三角函数系

$$
\frac{1}{\sqrt{2\pi}}, \frac{\cos x}{\sqrt{\pi}}, \frac{\sin x}{\sqrt{\pi}}, \frac{\cos 2x}{\sqrt{\pi}}, \frac{\sin 2x}{\sqrt{\pi}}, \ldots
$$

是 $L^2([-\pi, \pi])$ 中的规范正交系（实内积：$\overline{\varphi_j} = \varphi_j$）。

**定理 50.1.1（Bessel 不等式）**：设 $\{\varphi_k\}$ 为 $L^2(E)$ 中的规范正交系，$f \in L^2(E)$。则

$$
\sum_{k=1}^{\infty} |\langle f, \varphi_k \rangle|^2 \leq \|f\|_2^2
$$

**证明**：对任意 $n$，令 $s_n = \sum_{k=1}^{n} \langle f, \varphi_k \rangle \varphi_k$。则

$$
0 \leq \|f - s_n\|_2^2 = \|f\|_2^2 - 2\langle f, s_n \rangle + \|s_n\|_2^2 = \|f\|_2^2 - 2\sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 + \sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 = \|f\|_2^2 - \sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2
$$

因此 $\sum_{k=1}^{n} |\langle f, \varphi_k \rangle|^2 \leq \|f\|_2^2$。令 $n \to \infty$ 即得。$\blacksquare$

---

### 50.2 Fourier 级数的 $L^2$ 收敛

**定义 50.2.1（Fourier 系数与 Fourier 级数）**：设 $f \in L^1([-\pi, \pi])$。$f$ 的 Fourier 系数定义为

$$
a_0 = \frac{1}{2\pi} \int_{-\pi}^{\pi} f(x) \, dx, \quad a_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \cos nx \, dx, \quad b_n = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x) \sin nx \, dx
$$

$f$ 的 Fourier 级数为

$$
f(x) \sim \frac{a_0}{2} + \sum_{n=1}^{\infty} (a_n \cos nx + b_n \sin nx)
$$

**定理 50.2.1（ $L^2$ 中 Fourier 级数的收敛性）**：设 $f \in L^2([-\pi, \pi])$。则 $f$ 的 Fourier 级数在 $L^2$ 范数下收敛到 $f$。即

$$
\lim_{N \to \infty} \left\|f - \left(\frac{a_0}{2} + \sum_{n=1}^{N} (a_n \cos nx + b_n \sin nx)\right)\right\|_2 = 0
$$

等价地，Parseval 恒等式成立：

$$
\frac{1}{\pi} \int_{-\pi}^{\pi} |f(x)|^2 \, dx = \frac{a_0^2}{2} + \sum_{n=1}^{\infty} (a_n^2 + b_n^2)
$$

**证明概要**：三角函数系在 $L^2([-\pi, \pi])$ 中是完备的规范正交系（这是 Weierstrass 逼近定理的推论——三角多项式在 $L^2$ 中稠密）。由 Hilbert 空间理论，规范正交系完备当且仅当 Parseval 恒等式成立。$\blacksquare$

---

### 50.3 Dirichlet 核与 Fejér 核

**定义 50.3.1（Dirichlet 核）**：$N$ 阶 Dirichlet 核为

$$
D_N(t) = \frac{1}{2} + \sum_{n=1}^{N} \cos nt = \frac{\sin((N + \frac{1}{2})t)}{2\sin(t/2)}
$$

Fourier 级数的部分和可表示为 $S_N f(x) = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x - t) D_N(t) \, dt$。

**定义 50.3.2（Fejér 核）**：$N$ 阶 Fejér 核为 Dirichlet 核的 Cesàro 平均：

$$
F_N(t) = \frac{1}{N+1} \sum_{k=0}^{N} D_k(t) = \frac{1}{2(N+1)} \left(\frac{\sin((N+1)t/2)}{\sin(t/2)}\right)^2
$$

Fejér 核构成**好核**：$F_N(t) \geq 0$，$\frac{1}{\pi} \int_{-\pi}^{\pi} F_N(t) dt = 1$，且对任意 $\delta > 0$，$\int_{\delta \leq |t| \leq \pi} F_N(t) dt \to 0$（$N \to \infty$）。

---

### 50.4 Fejér 定理

**定理 50.4.1（Fejér 定理）**：设 $f \in L^1([-\pi, \pi])$。则 $f$ 的 Fourier 级数的 Cesàro 平均 $\sigma_N f(x) = \frac{1}{N+1} \sum_{k=0}^{N} S_k f(x)$ 满足：

(i) 若 $f$ 在 $x$ 处连续，则 $\sigma_N f(x) \to f(x)$
(ii) 若 $f$ 在 $[-\pi, \pi]$ 上连续且 $f(-\pi) = f(\pi)$，则 $\sigma_N f \to f$ 一致收敛

**证明**：$\sigma_N f(x) = \frac{1}{\pi} \int_{-\pi}^{\pi} f(x - t) F_N(t) dt$。由 Fejér 核是"好核"的性质，可用卷积逼近的标准论证。$\blacksquare$

**推论 50.4.2（Weierstrass 第二逼近定理）**：三角多项式在 $C([-\pi, \pi])$（周期连续函数）中关于一致范数稠密。

---

### 50.5 逐点收敛性

**定理 50.5.1（Dini 判别法）**：设 $f \in L^1([-\pi, \pi])$，$x \in [-\pi, \pi]$。若存在 $\delta > 0$ 使得

$$
\int_0^{\delta} \frac{|f(x + t) + f(x - t) - 2f(x)|}{t} \, dt < \infty
$$

则 $f$ 的 Fourier 级数在 $x$ 处收敛到 $f(x)$。特别地，若 $f$ 在 $x$ 处 Lipschitz 连续（或可导），则 Dini 条件成立。

**定理 50.5.2（Dirichlet-Jordan 判别法）**：若 $f$ 在 $x$ 的某个邻域内有界变差，则 $f$ 的 Fourier 级数在 $x$ 处收敛到 $\frac{f(x^+) + f(x^-)}{2}$。

**证明概要**（Dini 判别法）：Fourier 部分和可写为 $S_N f(x) - f(x) = \frac{1}{\pi} \int_0^{\pi} \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)} \sin((N+\frac{1}{2})t) dt$。令 $\varphi(t) = \frac{f(x+t) + f(x-t) - 2f(x)}{2\sin(t/2)}$。由 Dini 条件，$\varphi \in L^1([0, \pi])$。由 Riemann-Lebesgue 引理，$\int_0^{\pi} \varphi(t) \sin((N+\frac{1}{2})t) dt \to 0$（$N \to \infty$）。$\blacksquare$

**定理 50.5.3（Riemann-Lebesgue 引理）**：设 $f \in L^1([-\pi, \pi])$。则

$$
\lim_{|n| \to \infty} \int_{-\pi}^{\pi} f(t) e^{-int} \, dt = 0
$$

即 Fourier 系数 $a_n, b_n \to 0$（$n \to \infty$）。

**证明**：先对 $f$ 为特征函数验证（直接积分），再对简单函数，最后用 $L^1$ 中简单函数的稠密性推广到一般 $f \in L^1$。$\blacksquare$

---

**注记 50.5.1**：关于 Fourier 级数的进一步深入内容（包括分布理论、Sobolev 空间、小波分析等）将在卷十四（泛函分析）和卷二十五（调和分析）中详细展开。$\blacksquare$

---

---

## 第74章（补充）
可和性理论（Summability Theory）研究给不收敛（发散）的级数赋予"广义和"的各类求和法及它们之间的关系。它在 Fourier 级数解的求和（如 Fejér 定理）、发散积分的正则化和 Dirichlet 级数解析延拓中应用广泛。

### 基本概念与求和法比较

**定义**（求和法 / summability method）：（复）数列空间上的**求和法**是一个线性泛函 $L: D \to \mathbb{C}$（$D$ 是某线性子空间，包含所有收敛序列），使得对收敛序列 $(s_n)$，$L((s_n)) = \lim_{n \to \infty} s_n$（即求和法是极限的推广）。通常要求求和法是**正则可和**（regular，即收敛级数的求和法值等于其通常和）。

**定理**（Silverman-Toeplitz 定理 / 正则可和矩阵的充要条件）：无穷矩阵 $A = (a_{nk})$ 定义了正则可和的矩阵求和法（将 $s_n = \sum_{k=1}^\infty a_{nk} s_k$ 对所有收敛 $(s_k)$ 都收敛且等于 $\lim s_k$）当且仅当：
1. $\lim_{n \to \infty} a_{nk} = 0$（对所有 $k$）
2. $\lim_{n \to \infty} \sum_{k=1}^\infty a_{nk} = 1$
3. $\sup_n \sum_{k=1}^\infty |a_{nk}| < \infty$（一致有界条件）

### Cesàro求和法

**定义**（Cesàro求和法 / $(C, 1)$）：级数 $\sum a_k$ 的 $(C, 1)$（Cesàro一次）和定义为部分和的算术平均的极限：
$$C_1\text{-}\sum_{k=0}^\infty a_k = \lim_{n \to \infty} \frac{s_0 + s_1 + \cdots + s_n}{n+1} \quad (s_n = \sum_{k=0}^n a_k)$$
若通常和存在，则 $(C, 1)$ 和等于通常和。更一般地，$(C, \alpha)$ 求和（$\alpha > -1$）通过 $\alpha$ 阶 Cesàro 平均定义。

**例**：
- Grandi级数：$1 - 1 + 1 - 1 + \cdots$。通常发散（$s_n$ 交替为 1 和 0）。$(C, 1)$ 极限为 $\frac{1}{2}$
- $1 - 2 + 3 - 4 + \cdots$（部分和 $1, -1, 2, -2, 3, -3, \ldots$）。Cesàro发散，但 $(C, 2)$（二次Cesàro平均）和为 $\frac{1}{4}$

**定理**（Fejér定理——Cesàro求和法在Fourier级数中的应用，1904）：若 $f$ 是周期 $2\pi$ 的 Riemann 可积函数，则其 Fourier 级数的 Cesàro 平均（算术平均）在 $f$ 的每个连续点处收敛到 $f(x)$，且在跳跃间断点处收敛到左右极限的平均值。这比 Fourier 级数的通常逐点收敛性普遍得多——对任意 Riemann 可积函数，Cesàro 平均处处收敛。

### Abel求和法与幂级数解析延拓

**定义**（Abel求和法）：级数 $\sum a_k$ 的**Abel和**定义为
$$A\text{-}\sum_{k=0}^\infty a_k = \lim_{x \to 1^-} \sum_{k=0}^\infty a_k x^k$$
（若函数 $f(x) = \sum a_k x^k$ 在 $|x| < 1$ 解析且在 $x=1$ 附近有边界值）。Abel 和存在的级数比 Cesàro 更广。

**例**：$\sum_{k=0}^\infty (-1)^k$ 的 Abel 和为 $\lim_{x \to 1^-} \frac{1}{1 + x} = \frac{1}{2}$；$\sum_{k=0}^\infty (-1)^k (k+1) = 1 - 2 + 3 - 4 + \cdots$ 的 Abel 和为 $\lim_{x \to 1^-} \frac{1}{(1+x)^2} = \frac{1}{4}$。

**定理**（Frobenius定理 / Cesàro-Abel 包含关系）：若级数的 $(C, 1)$ 和存在，则其 Abel 和也存在且相等。反之不成立——Abel 可和远比 Cesàro 可和更广（Abel定理）。这给出了求和法的强度排序：$(C, 1) \subset (C, \alpha) \subset \text{Abel} \subset \text{Borel}$。

### Tauber型定理

**定理**（Tauber定理，1897）：给定某求和法，什么条件下求和法的可和性推出通常收敛性？这些条件称为 **Tauber条件**。

**定理**（Tauber第一定理 / Tauber定理，1897）：若级数的 Abel 和存在且 $a_n = o(1/n)$（即 $\lim n a_n = 0$），则级数在通常意义下收敛（且和等于 Abel 和）。更一般地，**Landau-Tauber定理**将条件放宽到 $a_n = O(1/n)$（$n a_n$ 有界）。

**定理**（Littlewood定理 / Littlewood Tauber定理，1911）：Abel 可和加上条件 $a_n = O(1/n)$（$n a_n$ 有界）推出通常收敛。这比 Tauber 条件更弱但为真——Hardy 和 Littlewood 的证明用到 Newman 的简化方法（渐近 Tauber 不等式）。

**定理**（Wiener广义Tauber定理 / Wiener's Tauberian Theorem，1932）：设 $f \in L^1(\mathbb{R})$ 的 Fourier 变换 $\hat{f}$ 在 $\mathbb{R}$ 上无处为零。则 $f$ 的平移所张成的闭子空间等于集合 $\{g \in L^1(\mathbb{R}) : \hat{g}(\xi) = 0 \text{ 在所有 } \hat{f}(\xi) = 0 \text{ 的点}\}$。该定理是 Tauber 理论的深刻推广——将级数和函数的极限关系翻译为 Banach 代数 $L^1(\mathbb{R})$（卷积代数）中的理想结构问题。

**推论**（素数定理的Wiener证明）：使用 Wiener Tauber 定理可将素数定理 $\pi(x) \sim x / \log x$ 归结为 Riemann zeta 函数 $\zeta(1 + it) \neq 0$ 的验证——这是解析数论中 Tauber 方法的典范。

### Borel求和法与发散级数的正则化

**定义**（Borel求和法）：级数 $\sum a_k$ 的 **Borel 和**定义为
$$B\text{-}\sum_{k=0}^\infty a_k = \int_0^\infty e^{-t} \sum_{k=0}^\infty \frac{a_k}{k!} t^k \, dt$$
（若级数 $\sum a_k t^k / k!$ 在 $t \geq 0$ 上收敛且 Laplace 变换积分存在）。

**定义**（广义Borel求和法 / Mittag-Leffler求和法）：还包括 **Euler求和法** $(E, q)$（对 $|q| > 1$）、**Lambert求和法**（使用 Lambert 级数的解析延拓）和 **广义Euler求和法**。这些方法在扰动量子场论（perturbative QFT）中广泛用于发散微扰级数的正则化。

**命题**（求和法的相容性）：$(C, 1)$ $\subset$ $(C, \alpha)$（$\alpha \geq 1$）$\subset$ Abel $\subset$ Borel（每个包含都是严格的——存在反例）。

---

---

## Ch 51 位势论（Potential Theory）
位势论起源于 Newton 引力势和静电学，研究调和函数、上调和函数的性质及其与测度和容度的深刻关系。在 $\mathbb{R}^n$（$n \geq 3$）中，**Newton 核** $N(x, y) = \|x - y\|^{2-n}$ 是 Laplace 方程的基本解（$n = 2$ 时为 $-\log\|x - y\|$）。**Riesz 核** $R_\alpha(x, y) = \|x - y\|^{\alpha-n}$（$0 < \alpha < n$）将 Newton 位势推广至分数阶，是 Riesz 位势理论的基础。设 $\mu$ 为 Radon 测度，函数 $U^\mu(x) = \int N(x, y) d\mu(y)$ 称为 $\mu$ 的 Newton 位势，它是 $\mathbb{R}^n \setminus \operatorname{supp} \mu$ 上的调和函数。

**上调和函数** $u$ 满足 $-\Delta u \geq 0$（分布意义下），具有三项基本性质：（1）局部可积且下半连续，在任意球上的平均值不小于球心值（**平均值不等式**）；（2）**最大值原理**——若 $u$ 在区域 $\Omega$ 内部达到全局最小值，则 $u$ 在 $\Omega$ 上为常数；（3）Riesz 分解定理——任意上调和函数可表为 Newton 位势与调和函数的和。

**容度** $\operatorname{Cap}(E)$ 衡量集合 $E \subseteq \mathbb{R}^n$"容纳"电荷的能力，定义为

$$\operatorname{Cap}(E) = \sup\{\mu(E) \mid \operatorname{supp} \mu \subseteq E, \; U^\mu(x) \leq 1 \text{ 对所有 } x\}$$

零容度集合是位势论中的"可忽略集"：Dirichlet 问题的边界正则性由 **Wiener 判别法**给出——边界点 $x_0 \in \partial\Omega$ 为正则点（即存在 $x_0$ 处的闸函数）当且仅当

$$\sum_{k=1}^{\infty} 2^{k(n-2)} \operatorname{Cap}\big(B(x_0, 2^{-k}) \setminus \Omega\big) = \infty$$

（$n = 2$ 时用对数容度）。位势论与概率论有本质联系：调和函数对应于 **Brown 运动**的期望（$u(x) = \mathbb{E}^x[f(B_\tau)]$），容度与击中概率直接相关（$\operatorname{Cap}(E) > 0$ 当且仅当 Brown 运动以正概率击中 $E$）。这一深刻对应使位势论成为连接分析、几何与概率的桥梁，在随机过程、复分析和偏微分方程中有广泛应用。$\blacksquare$


*卷八：实分析 II终。*
