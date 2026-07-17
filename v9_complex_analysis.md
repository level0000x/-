# 卷九：复分析

---

> **前置知识**：本卷建立在卷一（复数构造、级数理论）和卷四（极限、连续、导数、积分、幂级数）的基础之上。读者应熟悉 $\varepsilon$-$\delta$ 语言、一致收敛性、幂级数的收敛半径、以及 Riemann 积分的曲线积分概念。

## Ch 51 全纯函数
### 51.1 复平面与复函数

**定义 51.1.1（复平面）**：$\mathbb{C}$ 可视为 $\mathbb{R}^2$，配备复数乘法。$z. = x + iy \in \mathbb{C}$ 对应 $(x, y) \in \mathbb{R}^2$。$z$ 的模为 $|z| = \sqrt{x^2 + y^2}$。

**定义 51.1.2（复函数的极限与连续性）**：设 $\Omega \subseteq \mathbb{C}$ 为开集，$f : \Omega \to \mathbb{C}$，$z_0 \in \Omega$。

$$
\lim_{z \to z_0} f(z) = w_0 \iff \forall \varepsilon > 0, \exists \delta > 0, \; 0 < |z - z_0| < \delta \implies |f(z) - w_0| < \varepsilon
$$

$f$ 在 $z_0$ 处连续若 $\lim_{z \to z_0} f(z) = f(z_0)$。

**注记 51.1.1**：复函数的极限和连续性在形式上和实函数完全相同，但这里 $z$ 沿复平面中任意路径趋近 $z_0$，比实直线上只有左右两个方向的要求更强。

---

### 51.2 全纯函数与 Cauchy-Riemann 方程

**定义 51.2.1（复导数与全纯函数）**：设 $\Omega \subseteq \mathbb{C}$ 为开集，$f : \Omega \to \mathbb{C}$，$z_0 \in \Omega$。若极限

$$
f'(z_0) = \lim_{z \to z_0} \frac{f(z) - f(z_0)}{z - z_0}
$$

存在，则称 $f$ 在 $z_0$ 处**复可导**。若 $f$ 在 $\Omega$ 上每点复可导，则称 $f$ 为 $\Omega$ 上的**全纯函数**（或**解析函数**）。

**定理 51.2.1（Cauchy-Riemann 方程）**：设 $f(z) = u(x, y) + i v(x, y)$（$u, v : \mathbb{R}^2 \to \mathbb{R}$），$z_0 = x_0 + iy_0$。$f$ 在 $z_0$ 处复可导当且仅当 $u, v$ 在 $(x_0, y_0)$ 处可微且满足

$$
\frac{\partial u}{\partial x} = \frac{\partial v}{\partial y}, \quad \frac{\partial u}{\partial y} = -\frac{\partial v}{\partial x}
$$

此时 $f'(z_0) = \frac{\partial u}{\partial x}(x_0, y_0) + i\frac{\partial v}{\partial x}(x_0, y_0) = \frac{\partial v}{\partial y}(x_0, y_0) - i\frac{\partial u}{\partial y}(x_0, y_0)$。

**证明**：

（$\Rightarrow$）设 $f'(z_0) = A + iB$ 存在。取 $z \to z_0$ 沿实轴方向（$z = z_0 + h$，$h \in \mathbb{R}$）：

$$
f'(z_0) = \lim_{h \to 0} \frac{u(x_0 + h, y_0) + iv(x_0 + h, y_0) - u(x_0, y_0) - iv(x_0, y_0)}{h} = \frac{\partial u}{\partial x} + i\frac{\partial v}{\partial x}
$$

取 $z \to z_0$ 沿虚轴方向（$z = z_0 + ih$，$h \in \mathbb{R}$）：

$$
f'(z_0) = \lim_{h \to 0} \frac{u(x_0, y_0 + h) + iv(x_0, y_0 + h) - u(x_0, y_0) - iv(x_0, y_0)}{ih} = \frac{1}{i}\frac{\partial u}{\partial y} + \frac{\partial v}{\partial y} = -i\frac{\partial u}{\partial y} + \frac{\partial v}{\partial y}
$$

比较实部和虚部即得 Cauchy-Riemann 方程。

（$\Leftarrow$）设 $u, v$ 可微且满足 C-R 方程。由实可微性，$u(x_0 + h, y_0 + k) - u(x_0, y_0) = u_x h + u_y k + o(\sqrt{h^2 + k^2})$，$v$ 类似。令 $\Delta z = h + ik$，则

$$
f(z_0 + \Delta z) - f(z_0) = (u_x + iv_x)h + (u_y + iv_y)k + o(|\Delta z|)
$$

由 C-R 方程，$u_y + iv_y = -v_x + iu_x = i(u_x + iv_x)$。故

$$
f(z_0 + \Delta z) - f(z_0) = (u_x + iv_x)(h + ik) + o(|\Delta z|) = (u_x + iv_x)\Delta z + o(|\Delta z|)
$$

因此 $\lim_{\Delta z \to 0} \frac{f(z_0 + \Delta z) - f(z_0)}{\Delta z} = u_x + iv_x$。$\blacksquare$

**定理 51.2.2（全纯函数的基本运算）**：若 $f, g$ 在 $\Omega$ 上全纯，则

(i) $f \pm g$，$fg$ 全纯，且 $(f \pm g)' = f' \pm g'$，$(fg)' = f'g + fg'$
(ii) 若 $g \neq 0$，则 $f/g$ 全纯，且 $(f/g)' = (f'g - fg')/g^2$
(iii) 链式法则：$(f \circ g)'(z) = f'(g(z)) g'(z)$

**证明**：与实函数导数运算法则的证明完全相同（仅需将绝对值替换为模）。$\blacksquare$

---

### 51.3 幂级数作为全纯函数

**定理 51.3.1（幂级数的全纯性）**：设 $\sum_{n=0}^{\infty} a_n z^n$ 的收敛半径为 $R > 0$。则 $f(z) = \sum_{n=0}^{\infty} a_n z^n$ 在 $\{z \in \mathbb{C} \mid |z| < R\}$ 上全纯，且

$$
f'(z) = \sum_{n=1}^{\infty} n a_n z^{n-1}, \quad |z| < R
$$

（即幂级数可以逐项求导，收敛半径不变。）

**证明**：由幂级数的性质，$\sum n a_n z^{n-1}$ 的收敛半径也是 $R$。在 $|z| \leq r < R$ 的紧集上，逐项求导的级数一致收敛（由 Weierstrass M-判别法），故可逐项求导。$\blacksquare$

**推论 51.3.2**：$e^z = \sum_{n=0}^{\infty} \frac{z^n}{n!}$，$\sin z = \sum_{n=0}^{\infty} (-1)^n \frac{z^{2n+1}}{(2n+1)!}$，$\cos z = \sum_{n=0}^{\infty} (-1)^n \frac{z^{2n}}{(2n)!}$ 在整个 $\mathbb{C}$ 上全纯，且 $(e^z)' = e^z$，$(\sin z)' = \cos z$，$(\cos z)' = -\sin z$。

**注记 51.3.1**：这与实函数情形形式上完全一致，但这里 $z$ 取遍整个复平面。

---

---

## Ch 52 复积分
### 52.1 曲线积分

**定义 52.1.1（曲线）**：$\mathbb{C}$ 中的**曲线**（或**路径**）$\gamma$ 是一个连续可微映射 $\gamma : [a, b] \to \mathbb{C}$。$\gamma$ 称为**闭曲线**若 $\gamma(a) = \gamma(b)$。

**定义 52.1.2（复曲线积分）**：设 $f$ 在 $\gamma$ 上连续。定义 $f$ 沿 $\gamma$ 的积分为

$$
\int_{\gamma} f(z) \, dz = \int_a^b f(\gamma(t)) \gamma'(t) \, dt
$$

**定理 52.1.1（积分的基本估计）**：设 $|f(z)| \leq M$ 在 $\gamma$ 上，$L$ 为 $\gamma$ 的长度。则

$$
\left|\int_{\gamma} f(z) \, dz\right| \leq M L
$$

**证明**：
$$
\left|\int_{\gamma} f(z) dz\right| = \left|\int_a^b f(\gamma(t))\gamma'(t) dt\right| \leq \int_a^b |f(\gamma(t))||\gamma'(t)| dt \leq M \int_a^b |\gamma'(t)| dt = M L
$$

$\blacksquare$

---

### 52.2 Cauchy 积分定理

**定理 52.2.1（Cauchy 积分定理——矩形版本）**：设 $\Omega \subseteq \mathbb{C}$ 为开集，$f$ 在 $\Omega$ 上全纯，$R \subseteq \Omega$ 为闭矩形（边界 $\partial R$ 由四条线段组成）。则

$$
\int_{\partial R} f(z) \, dz = 0
$$

**证明**（Goursat）：将矩形 $R$ 四等分为 $R^{(1)}, \ldots, R^{(4)}$。则

$$
\int_{\partial R} f(z) dz = \sum_{j=1}^{4} \int_{\partial R^{(j)}} f(z) dz
$$

（公共边上的积分抵消）。设 $R_1$ 为四个子矩形中积分绝对值最大者，则 $|\int_{\partial R} f| \leq 4 |\int_{\partial R_1} f|$。重复此过程，得到矩形套 $R \supseteq R_1 \supseteq R_2 \supseteq \cdots$ 使得

$$
\left|\int_{\partial R_n} f(z) dz\right| \geq \frac{1}{4^n} \left|\int_{\partial R} f(z) dz\right|
$$

设 $z_0 \in \bigcap_{n=1}^{\infty} R_n$。由 $f$ 在 $z_0$ 处全纯，

$$
f(z) = f(z_0) + f'(z_0)(z - z_0) + \psi(z)(z - z_0)
$$

其中 $\psi(z) \to 0$（$z \to z_0$）。前两项 $f(z_0) + f'(z_0)(z - z_0)$ 有原函数，沿闭矩形积分为 $0$。故

$$
\int_{\partial R_n} f(z) dz = \int_{\partial R_n} \psi(z)(z - z_0) dz
$$

设 $R_n$ 的边长为 $L/2^n$，对角线长为 $\sqrt{2}L/2^n$。对任意 $\varepsilon > 0$，当 $n$ 足够大时 $|\psi(z)| < \varepsilon$。故

$$
\left|\int_{\partial R_n} f(z) dz\right| \leq \varepsilon \cdot \frac{\sqrt{2}L}{2^n} \cdot \frac{4L}{2^n} = \frac{4\sqrt{2}L^2}{4^n} \varepsilon
$$

因此 $|\int_{\partial R} f| \leq 4^n \cdot \frac{4\sqrt{2}L^2}{4^n} \varepsilon = 4\sqrt{2}L^2 \varepsilon$。由 $\varepsilon$ 任意性，$\int_{\partial R} f = 0$。$\blacksquare$

**定理 52.2.2（Cauchy 积分定理——一般版本）**：设 $\Omega \subseteq \mathbb{C}$ 为**单连通**开集（任何闭曲线可在 $\Omega$ 内连续收缩为一点），$f$ 在 $\Omega$ 上全纯。则对 $\Omega$ 中任何闭曲线 $\gamma$，

$$
\int_{\gamma} f(z) \, dz = 0
$$

**注记 52.2.1**：一般版本的证明需要将区域三角剖分或使用同伦论证，此处从略。核心结论：在单连通区域内，全纯函数的闭曲线积分为零。

**推论 52.2.3（原函数的存在性）**：在单连通区域 $\Omega$ 上全纯的函数 $f$ 有原函数 $F$（$F' = f$），$F(z) = \int_{z_0}^{z} f(\zeta) d\zeta$（积分与路径无关）。

---

### 52.3 Cauchy 积分公式

**定理 52.3.1（Cauchy 积分公式）**：设 $\Omega \subseteq \mathbb{C}$ 为开集，$f$ 在 $\Omega$ 上全纯，$\overline{D}(z_0, r) \subseteq \Omega$（以 $z_0$ 为中心、$r$ 为半径的闭圆盘）。则对任意 $z \in D(z_0, r)$（开圆盘），

$$
f(z) = \frac{1}{2\pi i} \int_{\partial D(z_0, r)} \frac{f(\zeta)}{\zeta - z} \, d\zeta
$$

**证明**：固定 $z \in D(z_0, r)$。考虑函数 $g(\zeta) = \frac{f(\zeta) - f(z)}{\zeta - z}$（$\zeta \neq z$），$g(z) = f'(z)$。$g$ 在 $\Omega \setminus \{z\}$ 上全纯，在 $z$ 处连续（从而在 $\Omega$ 上全纯，由 Riemann 可去奇点定理——见定理 53.4.1）。

在 $\Omega$ 内取以 $z$ 为中心的小圆 $\partial D(z, \varepsilon)$。由 Cauchy 积分定理（应用于环形区域），

$$
\int_{\partial D(z_0, r)} g(\zeta) d\zeta = \int_{\partial D(z, \varepsilon)} g(\zeta) d\zeta
$$

即 $\int_{\partial D(z_0, r)} \frac{f(\zeta)}{\zeta - z} d\zeta - f(z) \int_{\partial D(z_0, r)} \frac{d\zeta}{\zeta - z} = \int_{\partial D(z, \varepsilon)} \frac{f(\zeta) - f(z)}{\zeta - z} d\zeta$。

计算 $\int_{\partial D(z_0, r)} \frac{d\zeta}{\zeta - z} = 2\pi i$（由 Cauchy 积分公式基础情形 $f \equiv 1$）。右边当 $\varepsilon \to 0$ 时，$|g(\zeta)| \leq |f'(z)| + 1$（有界），故积分绝对值 $\leq M \cdot 2\pi\varepsilon \to 0$。因此

$$
\int_{\partial D(z_0, r)} \frac{f(\zeta)}{\zeta - z} d\zeta - 2\pi i f(z) = 0
$$

即 $f(z) = \frac{1}{2\pi i} \int_{\partial D(z_0, r)} \frac{f(\zeta)}{\zeta - z} d\zeta$。$\blacksquare$

**推论 52.3.2（Cauchy 积分公式——高阶导数）**：在定理 52.3.1 的条件下，$f$ 在 $D(z_0, r)$ 上无穷次复可导，且

$$
f^{(n)}(z) = \frac{n!}{2\pi i} \int_{\partial D(z_0, r)} \frac{f(\zeta)}{(\zeta - z)^{n+1}} \, d\zeta, \quad n = 0, 1, 2, \ldots
$$

**证明**：对 $n$ 归纳。$n = 0$ 即 Cauchy 积分公式。假设公式对 $n$ 成立。由差商极限和积分号下取极限的合法性（被积函数一致有界），

$$
f^{(n+1)}(z) = \lim_{h \to 0} \frac{f^{(n)}(z+h) - f^{(n)}(z)}{h} = \frac{n!}{2\pi i} \lim_{h \to 0} \int_{\partial D} \frac{f(\zeta)}{h} \left(\frac{1}{(\zeta - z - h)^{n+1}} - \frac{1}{(\zeta - z)^{n+1}}\right) d\zeta
$$

利用 $\frac{1}{(\zeta - z - h)^{n+1}} - \frac{1}{(\zeta - z)^{n+1}} \to (n+1) \frac{h}{(\zeta - z)^{n+2}}$（$h \to 0$），得 $f^{(n+1)}(z) = \frac{(n+1)!}{2\pi i} \int_{\partial D} \frac{f(\zeta)}{(\zeta - z)^{n+2}} d\zeta$。$\blacksquare$

**推论 52.3.3（全纯函数无穷次可导）**：全纯函数自动无穷次可导（与实分析根本不同）。

---

---

## Ch 53 级数展开
### 53.1 Taylor 级数展开

**定理 53.1.1（Taylor 展开定理）**：设 $f$ 在 $\Omega$ 上全纯，$z_0 \in \Omega$。设 $R = \operatorname{dist}(z_0, \partial\Omega)$（$z_0$ 到 $\Omega$ 边界的距离）。则 $f$ 在 $D(z_0, R)$ 上可展开为收敛的 Taylor 级数：

$$
f(z) = \sum_{n=0}^{\infty} a_n (z - z_0)^n, \quad a_n = \frac{f^{(n)}(z_0)}{n!}, \quad |z - z_0| < R
$$

**证明**：对 $|z - z_0| < r < R$，由 Cauchy 积分公式，

$$
f(z) = \frac{1}{2\pi i} \int_{\partial D(z_0, r)} \frac{f(\zeta)}{\zeta - z} d\zeta = \frac{1}{2\pi i} \int_{\partial D(z_0, r)} \frac{f(\zeta)}{(\zeta - z_0) - (z - z_0)} d\zeta
$$

展开几何级数：$\frac{1}{(\zeta - z_0) - (z - z_0)} = \frac{1}{\zeta - z_0} \cdot \frac{1}{1 - \frac{z - z_0}{\zeta - z_0}} = \frac{1}{\zeta - z_0} \sum_{n=0}^{\infty} \left(\frac{z - z_0}{\zeta - z_0}\right)^n$。由于 $|z - z_0| < |\zeta - z_0| = r$，级数一致收敛（关于 $\zeta$），可逐项积分：

$$
f(z) = \sum_{n=0}^{\infty} \left(\frac{1}{2\pi i} \int_{\partial D(z_0, r)} \frac{f(\zeta)}{(\zeta - z_0)^{n+1}} d\zeta\right) (z - z_0)^n = \sum_{n=0}^{\infty} \frac{f^{(n)}(z_0)}{n!} (z - z_0)^n
$$

由 Cauchy 高阶导数公式，系数确为 $f^{(n)}(z_0)/n!$。$\blacksquare$

**推论 53.1.2（Liouville 定理）**：若 $f$ 在整个 $\mathbb{C}$ 上全纯且有界（即存在 $M$ 使得 $|f(z)| \leq M$，$\forall z \in \mathbb{C}$），则 $f$ 为常数。

**证明**：由 Cauchy 高阶导数公式，对任意 $R > 0$，

$$
|f'(z_0)| = \left|\frac{1}{2\pi i} \int_{\partial D(z_0, R)} \frac{f(\zeta)}{(\zeta - z_0)^2} d\zeta\right| \leq \frac{1}{2\pi} \cdot \frac{M}{R^2} \cdot 2\pi R = \frac{M}{R}
$$

令 $R \to \infty$ 得 $f'(z_0) = 0$。$f' \equiv 0$ 意味着 $f$ 为常数。$\blacksquare$

**推论 53.1.3（代数基本定理的复分析证明）**：任何非常数复系数多项式 $P(z) = a_n z^n + \cdots + a_0$（$a_n \neq 0$，$n \geq 1$）在 $\mathbb{C}$ 中有根。

**证明**：假设 $P(z) \neq 0$（$\forall z \in \mathbb{C}$）。则 $f(z) = 1/P(z)$ 在整个 $\mathbb{C}$ 上全纯。当 $|z| \to \infty$ 时，$|P(z)| \to \infty$，故 $|f(z)| \to 0$，从而 $f$ 有界。由 Liouville 定理，$f$ 为常数，与 $n \geq 1$ 矛盾。$\blacksquare$

---

### 53.2 Laurent 级数展开

**定理 53.2.1（Laurent 展开定理）**：设 $f$ 在圆环 $A = \{z \in \mathbb{C} \mid r < |z - z_0| < R\}$（$0 \leq r < R \leq \infty$）上全纯。则 $f$ 在 $A$ 上可展开为 Laurent 级数：

$$
f(z) = \sum_{n=-\infty}^{\infty} a_n (z - z_0)^n, \quad r < |z - z_0| < R
$$

其中 $a_n = \frac{1}{2\pi i} \int_{\partial D(z_0, \rho)} \frac{f(\zeta)}{(\zeta - z_0)^{n+1}} d\zeta$（$r < \rho < R$，积分与 $\rho$ 无关）。

**证明**：对 $z \in A$，取 $r < r_1 < |z - z_0| < r_2 < R$。由 Cauchy 积分公式（应用于环形区域），

$$
f(z) = \frac{1}{2\pi i} \int_{\partial D(z_0, r_2)} \frac{f(\zeta)}{\zeta - z} d\zeta - \frac{1}{2\pi i} \int_{\partial D(z_0, r_1)} \frac{f(\zeta)}{\zeta - z} d\zeta
$$

对第一个积分，$|z - z_0| < |\zeta - z_0|$，展开 $\frac{1}{\zeta - z} = \sum_{n=0}^{\infty} \frac{(z - z_0)^n}{(\zeta - z_0)^{n+1}}$。

对第二个积分，$|z - z_0| > |\zeta - z_0|$，展开 $-\frac{1}{\zeta - z} = \frac{1}{z - \zeta} = \sum_{n=1}^{\infty} \frac{(\zeta - z_0)^{n-1}}{(z - z_0)^n}$。

将两部分合并即得 Laurent 级数。$\blacksquare$

---

### 53.3 孤立奇点的分类

**定义 53.3.1（孤立奇点）**：设 $f$ 在 $z_0$ 的去心邻域 $\{0 < |z - z_0| < \delta\}$ 上全纯，但在 $z_0$ 处不定义或不解析。则 $z_0$ 称为 $f$ 的**孤立奇点**。设 $f$ 在 $z_0$ 处的 Laurent 展开为 $f(z) = \sum_{n=-\infty}^{\infty} a_n (z - z_0)^n$。

1. **可去奇点**：$a_n = 0$（$\forall n < 0$），即 Laurent 级数实为 Taylor 级数
2. **极点**：存在 $m \geq 1$ 使得 $a_{-m} \neq 0$ 且 $a_n = 0$（$\forall n < -m$）。$m$ 称为**极点的阶**
3. **本性奇点**：存在无穷多个负指数 $n$ 使得 $a_n \neq 0$

**定理 53.3.1（Riemann 可去奇点定理）**：若 $f$ 在 $z_0$ 的去心邻域上全纯且有界，则 $z_0$ 是可去奇点。

**证明**：设 $|f(z)| \leq M$。$\forall n < 0$，$|a_n| = |\frac{1}{2\pi i} \int_{\partial D(z_0, \varepsilon)} \frac{f(\zeta)}{(\zeta - z_0)^{n+1}} d\zeta| \leq \frac{1}{2\pi} \cdot \frac{M}{\varepsilon^{n+1}} \cdot 2\pi\varepsilon = M \varepsilon^{-n}$。令 $\varepsilon \to 0$（$n < 0$ 时 $-n > 0$），得 $a_n = 0$。$\blacksquare$

**定理 53.3.2（Casorati-Weierstrass 定理）**：若 $z_0$ 是 $f$ 的本性奇点，则对任意 $w \in \mathbb{C} \cup \{\infty\}$，存在序列 $z_n \to z_0$ 使得 $f(z_n) \to w$。即 $f$ 在 $z_0$ 的任何去心邻域中的像在 $\mathbb{C}$ 中稠密。

*证明*：反设存在 $w \in \mathbb{C}$、$\varepsilon > 0$ 和 $\delta > 0$ 使得 $|f(z) - w| > \varepsilon$ 对所有 $0 < |z - z_0| < \delta$ 成立。令 $g(z) = \frac{1}{f(z) - w}$，则 $g$ 在 $0 < |z - z_0| < \delta$ 上全纯且有界（$|g(z)| \leq 1/\varepsilon$）。由 Riemann 可去奇点定理（定理 53.3.1），$g$ 可全纯延拓到 $z_0$。

若 $g(z_0) \neq 0$，则 $f(z) = w + \frac{1}{g(z)}$ 在 $z_0$ 处全纯，与 $z_0$ 是本性奇点矛盾。

若 $g(z_0) = 0$，设 $g$ 在 $z_0$ 处的零点阶数为 $m \geq 1$，则 $g(z) = (z - z_0)^m h(z)$（$h(z_0) \neq 0$）。于是 $f(z) - w = \frac{1}{(z - z_0)^m h(z)}$，故 $z_0$ 是 $f$ 的 $m$ 阶极点（或 $w = \infty$ 时 $f(z) \to \infty$），同样与 $z_0$ 是本性奇点矛盾。

因此假设不成立，即 $f$ 在 $z_0$ 的任何去心邻域中的像在 $\mathbb{C}$ 中稠密。∎

**定理 53.3.3（Picard 大定理——陈述）**：若 $z_0$ 是 $f$ 的本性奇点，则 $f$ 在 $z_0$ 的任何去心邻域中取遍 $\mathbb{C}$ 中的所有值，至多有一个例外。

*注记*：Picard 大定理的证明超出本书范围，但可通过模函数方法（modular function）得到。完整证明可参见 Ahlfors《Complex Analysis》或 Conway《Functions of One Complex Variable II》。

---

---

## Ch 54 留数定理
### 54.1 留数的定义与计算

**定义 54.1.1（留数）**：设 $z_0$ 是 $f$ 的孤立奇点，$f$ 在 $z_0$ 处的 Laurent 展开为 $f(z) = \sum_{n=-\infty}^{\infty} a_n (z - z_0)^n$。$f$ 在 $z_0$ 处的**留数**定义为

$$
\operatorname{Res}(f, z_0) = a_{-1} = \frac{1}{2\pi i} \int_{\partial D(z_0, \varepsilon)} f(z) \, dz
$$

**定理 54.1.1（留数的计算规则）**：

(i) 若 $z_0$ 是 $m$ 阶极点，则 $\operatorname{Res}(f, z_0) = \frac{1}{(m-1)!} \lim_{z \to z_0} \frac{d^{m-1}}{dz^{m-1}}[(z - z_0)^m f(z)]$
(ii) 若 $z_0$ 是 1 阶极点（简单极点），则 $\operatorname{Res}(f, z_0) = \lim_{z \to z_0} (z - z_0)f(z)$
(iii) 若 $f(z) = \frac{g(z)}{h(z)}$，$g, h$ 全纯，$g(z_0) \neq 0$，$h(z_0) = 0$，$h'(z_0) \neq 0$（简单极点），则 $\operatorname{Res}(f, z_0) = \frac{g(z_0)}{h'(z_0)}$

**证明**：(i) 设 $f(z) = \frac{a_{-m}}{(z - z_0)^m} + \cdots + \frac{a_{-1}}{z - z_0} + a_0 + \cdots$。则 $(z - z_0)^m f(z) = a_{-m} + \cdots + a_{-1}(z - z_0)^{m-1} + \cdots$。求导 $m-1$ 次后取 $z \to z_0$ 得 $a_{-1}$。

(ii) 是 (i) 的特例（$m = 1$）。

(iii) 由洛必达法则，$a_{-1} = \lim_{z \to z_0} (z - z_0)\frac{g(z)}{h(z)} = \frac{g(z_0)}{h'(z_0)}$。$\blacksquare$

---

### 54.2 留数定理

**定理 54.2.1（留数定理）**：设 $\Omega \subseteq \mathbb{C}$ 为单连通开集，$\gamma$ 为 $\Omega$ 中简单闭曲线（正向），$f$ 在 $\Omega$ 上除有限个孤立奇点 $z_1, \ldots, z_k$（均在 $\gamma$ 内部）外全纯。则

$$
\int_{\gamma} f(z) \, dz = 2\pi i \sum_{j=1}^{k} \operatorname{Res}(f, z_j)
$$

**证明**：在每个 $z_j$ 周围取小圆 $\gamma_j$（$\gamma_j$ 在 $\gamma$ 内部且互不相交）。由 Cauchy 积分定理（应用于 $\gamma$ 和各 $\gamma_j$ 之间的区域），

$$
\int_{\gamma} f(z) dz = \sum_{j=1}^{k} \int_{\gamma_j} f(z) dz = 2\pi i \sum_{j=1}^{k} \operatorname{Res}(f, z_j)
$$

其中第二步由留数的定义。$\blacksquare$

---

### 54.3 留数定理在实积分计算中的应用

**定理 54.3.1（有理三角函数的积分）**：$\int_0^{2\pi} R(\cos \theta, \sin \theta) d\theta$（$R$ 为有理函数）可通过代换 $z = e^{i\theta}$ 化为单位圆周上的复积分，然后用留数定理计算。

**定理 54.3.2（无穷区间上的有理函数积分）**：设 $P, Q$ 为多项式，$\deg Q \geq \deg P + 2$，$Q$ 在实轴上无零点。则

$$
\int_{-\infty}^{\infty} \frac{P(x)}{Q(x)} \, dx = 2\pi i \sum_{\operatorname{Im} z_j > 0} \operatorname{Res}\left(\frac{P}{Q}, z_j\right)
$$

**证明**：取上半平面的大半圆围道 $\Gamma_R = [-R, R] \cup C_R$（$C_R$ 为上半圆弧）。由于 $\deg Q \geq \deg P + 2$，$|\frac{P(z)}{Q(z)}| \leq \frac{C}{|z|^2}$（$|z|$ 大时），故 $\int_{C_R} \to 0$（$R \to \infty$）。由留数定理，$\int_{\Gamma_R} = 2\pi i \sum_{\operatorname{Im} z_j > 0} \operatorname{Res}$。令 $R \to \infty$ 即得。$\blacksquare$

**定理 54.3.3（Jordan 引理与含三角函数的积分）**：$\int_{-\infty}^{\infty} \frac{P(x)}{Q(x)} e^{i\alpha x} dx$（$\alpha > 0$）可通过 Jordan 引理 + 留数定理计算，常用于计算 $\int_{-\infty}^{\infty} \frac{\cos \alpha x}{Q(x)} dx$ 和 $\int_{-\infty}^{\infty} \frac{\sin \alpha x}{Q(x)} dx$ 类积分。

---

---

## Ch 55 共形映射
### 55.1 共形映射的定义与性质

**定义 55.1.1（共形映射）**：全纯函数 $f : \Omega \to \mathbb{C}$ 在 $z_0 \in \Omega$ 处称为**共形**的，若 $f'(z_0) \neq 0$。若 $f$ 在 $\Omega$ 上每点共形且为单射，则称 $f$ 为 $\Omega$ 上的**共形映射**。

**定理 55.1.1（共形映射的几何意义）**：$f$ 在 $z_0$ 处共形当且仅当 $f$ 在 $z_0$ 处保角（两曲线在 $z_0$ 处的交角等于其像曲线在 $f(z_0)$ 处的交角）且伸缩率 $|f'(z_0)|$ 与方向无关。

**证明**：由 $f(z) - f(z_0) \approx f'(z_0)(z - z_0)$（$z \to z_0$）。$f'(z_0) = r e^{i\theta}$ 将 $z - z_0$ 旋转 $\theta$ 并缩放 $r$ 倍，保角且伸缩率与方向无关。$\blacksquare$

---

### 55.2 分式线性变换

**定义 55.2.1（分式线性变换）**：形如

$$
T(z) = \frac{az + b}{cz + d}, \quad ad - bc \neq 0
$$

的映射称为**分式线性变换**（Möbius 变换）。它可延拓为 $\hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\}$（Riemann 球面）上的双射。

**定理 55.2.1（分式线性变换的基本性质）**：

(i) 分式线性变换构成群 $PSL(2, \mathbb{C})$
(ii) 分式线性变换将圆/直线映为圆/直线（保圆性）
(iii) 分式线性变换保交比：$\frac{T(z_1) - T(z_3)}{T(z_1) - T(z_4)} \cdot \frac{T(z_2) - T(z_4)}{T(z_2) - T(z_3)} = \frac{z_1 - z_3}{z_1 - z_4} \cdot \frac{z_2 - z_4}{z_2 - z_3}$
(iv) 存在唯一的分式线性变换将任意三个不同的点映为任意三个不同的点

**证明**：(i) 复合和逆的公式验证。(ii) 圆/直线方程可写为 $A z \overline{z} + B z + \overline{B} \overline{z} + C = 0$（$A, C \in \mathbb{R}$），分式线性变换保持此形式。(iii) 直接验证。(iv) 由交比的不变性构造。$\blacksquare$

---

### 55.3 Riemann 映射定理

**定理 55.3.1（Riemann 映射定理——陈述）**：设 $\Omega \subsetneq \mathbb{C}$ 为单连通区域。则存在共形映射 $f : \Omega \to D = \{z \in \mathbb{C} \mid |z| < 1\}$（单位圆盘）。进一步，若指定 $z_0 \in \Omega$ 和 $f(z_0) = 0$，$f'(z_0) > 0$，则 $f$ 是唯一的。

**注记 55.3.1**：Riemann 映射定理是复分析的核心定理之一，证明了任何单连通真子区域与单位圆盘共形等价。这是二维特有的现象——高维情况不成立。完整证明需要正规族理论和 Schwarz 引理，在卷十四（泛函分析）中展开。

**例 55.3.1**：上半平面 $\mathbb{H} = \{z \mid \operatorname{Im} z > 0\}$ 到单位圆盘的共形映射为 $f(z) = \frac{z - i}{z + i}$（Cayley 变换）。

---

---

## Ch 56 解析延拓
### 56.1 解析延拓的概念

**定义 56.1.1（解析延拓）**：设 $\Omega_1 \subseteq \Omega_2$ 为 $\mathbb{C}$ 中的区域，$f_1$ 在 $\Omega_1$ 上全纯，$f_2$ 在 $\Omega_2$ 上全纯。若 $f_2|_{\Omega_1} = f_1$，则称 $f_2$ 为 $f_1$ 从 $\Omega_1$ 到 $\Omega_2$ 的**解析延拓**。

**定理 56.1.1（解析延拓的唯一性）**：解析延拓若存在，则唯一。

**证明**：设 $f_2, g_2$ 均为 $f_1$ 在 $\Omega_2$ 上的解析延拓，则 $h = f_2 - g_2$ 在 $\Omega_2$ 上全纯，且在 $\Omega_1$ 上 $h = 0$。由全纯函数的唯一性定理（见下文），$h \equiv 0$ 在 $\Omega_2$ 上。$\blacksquare$

**定理 56.1.2（唯一性定理）**：设 $f$ 在区域 $\Omega$ 上全纯。若存在 $z_0 \in \Omega$ 和 $\{z_n\}_{n=1}^{\infty} \subseteq \Omega \setminus \{z_0\}$ 使得 $z_n \to z_0$ 且 $f(z_n) = 0$（$\forall n$），则 $f \equiv 0$ 在 $\Omega$ 上。

**证明**：设 $f$ 在 $z_0$ 处的 Taylor 展开为 $f(z) = \sum_{k=0}^{\infty} a_k (z - z_0)^k$。若 $f$ 不恒为零，设 $a_m$ 为第一个非零系数。则 $f(z) = (z - z_0)^m (a_m + a_{m+1}(z - z_0) + \cdots) = (z - z_0)^m g(z)$，其中 $g(z_0) = a_m \neq 0$。由 $g$ 的连续性，$g(z) \neq 0$ 在 $z_0$ 附近。但 $f(z_n) = 0$ 且 $z_n \neq z_0$，故 $g(z_n) = 0$，与 $g(z_0) \neq 0$ 和连续性矛盾。因此所有 $a_k = 0$，$f \equiv 0$ 在 $z_0$ 的一个邻域内。由区域的连通性，$f \equiv 0$ 在整个 $\Omega$ 上。$\blacksquare$

---

### 56.2 自然边界

**定义 56.2.1（自然边界）**：设 $f$ 在 $\Omega$ 上全纯。若 $\Omega$ 的边界 $\partial \Omega$ 上的每点都是 $f$ 的奇点（即 $f$ 不能延拓到该点的任何邻域），则称 $\partial \Omega$ 为 $f$ 的**自然边界**。

**例 56.2.1**：$f(z) = \sum_{n=0}^{\infty} z^{n!} = 1 + z + z^2 + z^6 + z^{24} + \cdots$ 在 $|z| < 1$ 上全纯，$|z| = 1$ 为其自然边界（Hadamard 间隙定理）。

---

### 56.3 多值函数与 Riemann 面初步

**定义 56.3.1（解析延拓与多值函数）**：有些函数通过解析延拓会产生多值性。例如 $f(z) = \sqrt{z}$ 在 $z = 0$ 附近：从某点出发沿包含 $0$ 的闭曲线绕一圈，函数值变为原来的 $-1$ 倍。

**定义 56.3.2（Riemann 面）**：多值函数的自然定义域是 **Riemann 面**——一个二维复流形，使得"多值函数"在其上成为单值全纯函数。

例如 $\sqrt{z}$ 的 Riemann 面是由两叶复平面在 $z = 0$ 处通过分支切割（branch cut）连接而成的。

**例 56.3.1**：对数函数 $\log z$ 的 Riemann 面是无穷多叶螺旋面。$\log z = \log|z| + i\arg z$，绕原点一圈 $\arg z$ 增加 $2\pi$，进入下一叶。

**注记 56.3.1**：Riemann 面的系统理论将在卷十二（微分几何）中作为一维复流形展开，并将在卷十六（代数几何）中深化为代数曲线理论。$\blacksquare$

---

---

## Ch 57 值分布理论（Nevanlinna 理论）
Nevanlinna 理论是复分析中研究亚纯函数值分布的核心框架，由 R. Nevanlinna 于 1925 年创立，将 Picard 定理从定性陈述提升为精密的定量理论。任给 $\mathbb{C}$ 上的亚纯函数 $f$ 及 $a \in \hat{\mathbb{C}} = \mathbb{C} \cup \{\infty\}$，引入计数函数 $N(r, a, f)$（计及重数的 $a$ 值点个数的对数平均）与逼近函数 $m(r, a, f)$（$f$ 在圆周 $|z| = r$ 上接近 $a$ 的程度的对数平均）。定义**特征函数** $T(r, f) = m(r, \infty, f) + N(r, \infty, f)$，它刻画 $f$ 的整体增长速率。**第一基本定理**断言：对任意 $a \in \hat{\mathbb{C}}$，

$$T(r, f) = m(r, a, f) + N(r, a, f) + O(1)$$

即和 $m(r,a) + N(r,a)$ 与目标值 $a$ 无关（至多相差有界量），表明 $f$ 以相同速率趋向每个值。**第二基本定理**是理论的核心深度结果：对任意 $q \geq 3$ 个互异值 $a_1, \ldots, a_q \in \hat{\mathbb{C}}$，

$$\sum_{\nu=1}^{q} m(r, a_\nu, f) \leq 2T(r, f) - N_1(r) + S(r, f)$$

其中 $N_1(r)$ 为分支点修正项，$S(r, f) = O(\log r T(r, f))$ 为误差项（在 $r \to \infty$ 除去一个有限测度集外成立）。作为直接推论，超越亚纯函数至多有两个 Picard 例外值（Picard 小定理），且其完全重数分支点至多可数。该理论深刻揭示了亚纯函数的"均值分布"本质——它不能同时极度靠近多个不同的值，这一现象与复平面的双曲几何结构紧密相关。

**定义 57.1**（Nevanlinna 特征函数）：设 $f$ 为 $\mathbb{C}$ 上非常数的亚纯函数。对 $r > 0$，定义：靠近函数 $m(r, f) = \frac{1}{2\pi} \int_0^{2\pi} \log^+ |f(r e^{i\theta})| d\theta$（其中 $\log^+ x = \max(\log x, 0)$）；计数函数 $N(r, f) = \int_0^r \frac{n(t, f) - n(0, f)}{t} dt + n(0, f) \log r$（其中 $n(t, f)$ 为 $f$ 在 $|z| \leq t$ 中的极点数，计重数）。**Nevanlinna 特征函数**定义为 $T(r, f) = m(r, f) + N(r, f)$。$T(r, f)$ 衡量 $f$ 的增长速度——若 $f$ 为有理函数，则 $T(r, f) = O(\log r)$；若 $f$ 为超越整函数，则 $T(r, f) / \log r \to \infty$。

**定理 57.1**（第一基本定理）：对任意 $a \in \mathbb{C} \cup \{\infty\}$，有 $m(r, \frac{1}{f-a}) + N(r, \frac{1}{f-a}) = T(r, f) + O(1)$（$r \to \infty$）。即：$T(r, \frac{1}{f-a}) = T(r, f) + O(1)$——特征函数在 Möbius 变换下几乎不变。

**定理 57.2**（第二基本定理 / Nevanlinna）：对互异的 $a_1, \ldots, a_q \in \mathbb{C} \cup \{\infty\}$，有 $(q-2) T(r, f) \leq \sum_{j=1}^q \overline{N}(r, \frac{1}{f-a_j}) + S(r, f)$，其中 $\overline{N}$ 是不计重数的计数函数，$S(r, f) = o(T(r, f))$ 对几乎所有 $r$ 成立。*证明思路*：利用对数导数的引理 $\int_0^{2\pi} \log^+ |f'/f| d\theta = o(T(r, f))$，结合对 $F = \prod_{j=1}^q (f - a_j)$ 应用第一基本定理和 Jensen 公式。

**推论 57.1**（Picard 小定理作为特例）：若整函数 $f$ 避开两个有穷值，则第二基本定理给出 $(2-2) T(r, f) \leq 0 + o(T(r, f))$，矛盾于 $\log r / T(r, f) \to 0$。因此 $f$ 必须是常数——Picard 小定理得证。

---

---

## Ch 58 拟共形映射与 Teichmüller 空间
### 58.1 拟共形映射

拟共形映射是共形映射的自然推广，允许有界的角度畸变。其解析定义基于 **Beltrami 方程**：

$$f_{\bar{z}} = \mu(z) f_z$$

其中 $\mu(z)$ 为 **Beltrami 系数**（复值可测函数），满足 $\|\mu\|_\infty = \operatorname{ess\,sup} |\mu(z)| < 1$。当 $\mu \equiv 0$ 时方程退化为 Cauchy-Riemann 方程，$f$ 为全纯函数；一般 $\mu \neq 0$ 时 $f$ 将无穷小圆映为椭圆，其偏心率由 $|\mu|$ 决定。$\mu$ 的 $L^\infty$ 范数度量了映射偏离共形的程度。核心结果——**可测 Riemann 映射定理**（Morrey, 1938；Ahlfors-Bers, 1960）断言：对复平面上任意满足 $\|\mu\|_\infty < 1$ 的可测 Beltrami 系数 $\mu$，存在唯一的拟共形同胚 $f^\mu : \hat{\mathbb{C}} \to \hat{\mathbb{C}}$ 满足 Beltrami 方程且固定 $0, 1, \infty$。该定理是复分析中 Riemann 映射定理的深远推广，为 Teichmüller 理论、Klein 群形变空间和复动力系统提供了不可或缺的分析工具。

### 58.2 Teichmüller 空间简介

**Teichmüller 空间** $\mathcal{T}_g$ 是亏格 $g$ 的紧 Riemann 面复结构的形变空间。对 $g \geq 2$，$\mathcal{T}_g$ 是 $3g-3$ 维复流形（实维数 $6g-6$）。其标准定义利用拟共形映射：取定参考曲面（标记 Riemann 面）$S_g$，令

$$\mathcal{T}_g = \{(X, f) \mid f : S_g \to X \text{ 为拟共形同胚}\} / \sim$$

其中 $(X, f) \sim (Y, g)$ 若 $g \circ f^{-1} : X \to Y$ 同伦于共形映射。等价地，$\mathcal{T}_g$ 可通过 **Bers 嵌入**实现为 $\mathbb{C}^{3g-3}$ 中的有界域——将曲面上的全纯二次微分对应于某个单值化群形变。Teichmüller 度量 $d_T$（基于极小拟共形映射的极大伸缩商的对数）将 $\mathcal{T}_g$ 变为完备度量空间。模空间 $\mathcal{M}_g = \mathcal{T}_g / \mathrm{MCG}(S_g)$ 则是 $\mathcal{T}_g$ 关于映射类群作用的商，为一个 $3g-3$ 维复轨道空间（orbifold），在双曲几何、弦论和代数几何的模空间理论中扮演核心角色。$\blacksquare$

---

---

## Ch 59：Siegel 区域与对称域
Siegel 区域理论是经典多复变函数论的核心部分。**定义**：$\mathbb{C}^n$ 中的 **Siegel 上半空间**（或 Siegel 广义上半平面）为 $\mathcal{H}_n = \{ Z \in \mathbb{C}^{n \times n} : Z^{\mathsf{T}} = Z, \; \operatorname{Im}(Z) \succ 0 \}$（即 $n \times n$ 对称复矩阵虚部正定的集合），它是 $\operatorname{Sp}(2n,\mathbb{R})$ 的作用空间，等价于 **Siegel 上半空间** $\operatorname{Sp}(2n,\mathbb{R}) / \operatorname{U}(n)$。更一般地，**Siegel 区域**是第二类域：$\{ (z,w) \in \mathbb{C}^{m} \times \mathbb{C}^{n} : \operatorname{Im}(z) - F(w,w) \in \Omega \}$，其中 $F$ 是 $\mathbb{C}^{n} \times \mathbb{C}^{n} \to \mathbb{C}^{m}$ 的 Hermite 形式，$\Omega \subset \mathbb{R}^{m}$ 是自对偶锥。Siegel 域给出了所有齐性有界域的典型表示。**Hermann 有界对称域分类**（E. Cartan, 1935）：不可约有界对称域分为四大类经典域（由 Siegel 上半空间、Grassmann 流形、正交 Lie 球的 Cayley 变换得到）和两个例外域（16维和27维）。Siegel 上半空间上的 **Siegel 模形式**（即 $\operatorname{Sp}(2n,\mathbb{Z})$ 作用下变换的全纯函数）推广了经典椭圆模形式，在数论（志村簇）和弦论紧化中有深刻应用。

---

---

## Ch 60：多复变函数论导引（Several Complex Variables）
多复变函数论研究 $\mathbb{C}^n$（$n \geq 2$）上的全纯函数，与单复变有本质区别。**基本现象**：（1）**Hartogs 现象**——存在区域 $\Omega \subsetneq \mathbb{C}^n$ 使得 $\Omega$ 上的所有全纯函数均可全纯延拓到更大的固定区域上。例如，对 $n \geq 2$，每个在 $0 < \|z\| < 1$ 上全纯的函数自动全纯延拓到整个单位球 $\|z\| < 1$——即孤立奇点不能作为全纯函数的障碍。这直接导致 $\mathbb{C}^n$ 中不存在"一般区域"的 Riemann 映射定理的类比。（2）**域的等价分类**：单复变中 Riemann 映射定理宣告所有单连通真子域彼此双全纯等价。多复变中双全纯等价类极其丰富——单位球 $B_n = \{ \|z\| < 1 \}$ 和单位多圆柱 $D^n = \{ |z_j| < 1 \}$ 并**不**双全纯等价，尽管两者都是 $\mathbb{C}^n$ 中的自然域。

**基本定义**：函数 $f: \Omega \to \mathbb{C}$ 称为**全纯**若 $f$ 在每点满足 Cauchy-Riemann 方程组 $\frac{\partial f}{\partial \bar{z}_j} = 0$（$j = 1,\ldots,n$）。等价地，$f$ 在每个变量单独全纯。**核心定理**：（1）**Cauchy 积分公式**（多复变版本）——$f(z) = \frac{1}{(2\pi i)^n} \int_{|w_1-z_1| = r_1} \cdots \int_{|w_n - z_n| = r_n} \frac{f(w)}{(w_1 - z_1)\cdots(w_n - z_n)} dw_1 \cdots dw_n$ （对于乘积圆盘）；（2）**Osgood 引理**——单独连续且对每个变量单独全纯的函数是全纯的；（3）**Hartogs 基本定理**——$f$ 全纯当且仅当 $f$ 对每个变量单独全纯（无需连续性假设）。

**Levi 问题**（E. E. Levi, 1911）：$\mathbb{C}^n$ 中的哪些域是全纯域（即存在不能延拓到更大域的全纯函数）？**答案**（Oka, 1942; Bremermann, 1954; Norguet, 1954）：域是全纯域当且仅当它是 **伪凸** 的。伪凸性由 **Levi 形式**（边界上复 Hessian 矩阵）的正半定性刻画——类似于 $\mathbb{R}^n$ 中域的凸性，但由复结构的约束导致。多复变中的 **$\bar{\partial}$ 问题**（即 $\bar{\partial} u = f$）及其正则解（Hörmander 的 $L^2$ 方法）正是处理这些问题的基本技术工具。

---

---

## Ch 61：多复变核心定理
### 61.1 Stein 流形与 Oka 原理

**定义**（Stein 流形）：复流形 $X$ 为 **Stein 流形** 若（1）$X$ 是 Hausdorff 且第二可数；（2）全纯函数分离点：对 $x \neq y$，存在 $f \in \mathcal{O}(X)$（$X$ 上全纯函数空间）使 $f(x) \neq f(y)$；（3）全纯函数给出局部坐标：对每点 $x$，存在 $f_1, \ldots, f_{\dim X} \in \mathcal{O}(X)$ 在 $x$ 处构成坐标系。

**定理 61.1**（Stein 基本定理）：$\mathbb{C}^n$ 中的域是 Stein 当且仅当它是全纯域。特别地，所有伪凸域是 Stein，所有 Stein 域是伪凸（对 $\mathbb{C}^n$ 中的域，两者等价——这是 Oka 对 Levi 问题的解答）。

**定理 61.2**（Cousin 问题与 Oka-Weil 定理）：第一 Cousin 问题（寻找具有指定极点的亚纯函数）在 Stein 流形上恒有解；第二 Cousin 问题（寻找具有指定零点的全纯函数）在 $\operatorname{Pic}(X) = 0$（全纯线丛平凡）时恒有解。**Oka-Weil 逼近定理**：若 $X$ 为 Stein，$K \subset X$ 为全纯凸紧集，则 $K$ 上的任意全纯函数可由 $X$ 上的全纯函数一致逼近。

### 61.2 dbar-Neumann 问题

**定理 61.3**（Hörmander $L^2$ 估计）：设 $\Omega \subset \mathbb{C}^n$ 为伪凸域，$\varphi$ 为光滑强多次调和函数。则对任意满足 $\bar{\partial} f = 0$ 的 $(0,1)$-形式 $f$，方程 $\bar{\partial} u = f$ 存在光滑解 $u$ 满足 $\int_\Omega |u|^2 e^{-\varphi} dV \leq \int_\Omega |f|^2 e^{-\varphi} dV$。*证明思路*：加权 $L^2$ 空间中的闭稠定算子满足 Hörmander 关于无界算子的存在定理，核心是 $\bar{\partial}$-Neumann 算子的正则性由 $L^2$ Sobolev 嵌入保证。该定理是研究 dbar 方程和多复变正则性问题的核心技术。

---

---

## 第87章（补充）
> 复几何是复分析和微分几何的交汇，研究复流形的几何结构。本部分作为复分析的几何补充，建立复流形、Kähler 几何、Hodge 理论、形变理论及 Calabi-Yau 流形与镜对称的系统理论。

---

## 第177章：复流形
复流形是局部同胚于 $\mathbb{C}^n$ 且转移函数为全纯的拓扑空间。复流形的研究是复几何的起点。

### 177.1 复流形的定义

**定义 177.1**（复流形）：$n$ 维**复流形** $M$ 是一个拓扑空间，带有复坐标卡 $\{(U_\alpha, \varphi_\alpha)\}$，其中 $\varphi_\alpha: U_\alpha \to \mathbb{C}^n$ 是同胚到 $\mathbb{C}^n$ 中开集，且转移函数 $\varphi_\alpha \circ \varphi_\beta^{-1}$ 在 $\varphi_\beta(U_\alpha \cap U_\beta)$ 上是全纯的。

**例 177.1**（基本复流形）：
- $\mathbb{C}^n$ 和 $\mathbb{C}^n$ 中的开集（平凡复流形）
- **复射影空间** $\mathbb{CP}^n$：$\mathbb{C}^{n+1} \setminus \{0\}$ 模去 $\mathbb{C}^*$ 作用，维数为 $n$
- **复环面** $\mathbb{C}^n / \Lambda$（$\Lambda$ 是秩 $2n$ 的格）
- **Riemann 面**：1 维复流形（V9 Ch 55 共形映射理论）
- **复 Grassmann 流形** $\operatorname{Gr}(k, n; \mathbb{C})$

**定义 177.2**（全纯函数与全纯映射）：$f: M \to \mathbb{C}$ 是**全纯**的，如果 $f \circ \varphi_\alpha^{-1}$ 在每个坐标卡上是全纯的。$f: M \to N$（$N$ 是复流形）是全纯的，如果局部坐标表示是全纯的。

**命题 177.1**（紧复流形上的全纯函数）：紧连通复流形上的全纯函数必为常数（极大值原理的推广）。这使复几何与实几何有本质区别。

### 177.2 近复结构与可积性

**定义 177.3**（近复结构）：实流形 $M$（$2n$ 维）上的**近复结构**是切丛 $TM$ 的自同态 $J: TM \to TM$，满足 $J^2 = -\operatorname{id}$。$J$ 赋予 $TM$ 复向量空间结构。

**定义 177.4**（Nijenhuis 张量）：近复结构 $J$ 的 **Nijenhuis 张量**为

$$N_J(X, Y) = [X, Y] + J[JX, Y] + J[X, JY] - [JX, JY]$$

$N_J$ 衡量 $J$ 与 Lie 括号的不兼容性。

**定理 177.1**（Newlander-Nirenberg 定理，1957）：近复结构 $J$ 来自复流形结构的充要条件是 $N_J \equiv 0$。此时 $J$ 称为**可积的**。

*意义*：该定理将复流形的存在性转化为近复结构的可积性条件，是复几何的核心定理。证明使用全纯坐标的构造（通过 $\bar{\partial}$-方程的可解性）。

**命题 177.2**（实二维情形）：任何 2 维可定向 Riemann 流形上的近复结构（由旋转 $90^\circ$ 定义）总是可积的。因此任何可定向 Riemann 曲面是复流形（1 维）。

### 177.3 Dolbeault 上同调

**定义 177.5**（$(p, q)$-形式）：复流形 $M$ 上的**$(p, q)$-形式**是 $p$ 个全纯微分和 $q$ 个反全纯微分的外积。外微分 $d$ 分解为 $d = \partial + \bar{\partial}$，其中 $\partial$ 增加全纯次数，$\bar{\partial}$ 增加反全纯次数。

**定义 177.6**（Dolbeault 上同调）：$\bar{\partial}$-算子满足 $\bar{\partial}^2 = 0$，定义**Dolbeault 上同调群**：

$$H_{\bar{\partial}}^{p,q}(M) = \frac{\ker(\bar{\partial}: \Omega^{p,q} \to \Omega^{p,q+1})}{\operatorname{im}(\bar{\partial}: \Omega^{p,q-1} \to \Omega^{p,q})}$$

**定理 177.2**（Dolbeault 定理）：$H_{\bar{\partial}}^{p,q}(M) \cong H^q(M, \Omega^p)$，其中 $\Omega^p$ 是全纯 $p$-形式的层。Dolbeault 上同调是层上同调的具体实现。

**定义 177.7**（Hodge 数）：$h^{p,q}(M) = \dim_{\mathbb{C}} H_{\bar{\partial}}^{p,q}(M)$。Hodge 数是复流形的基本数值不变量。

**例 177.2**（射影空间的 Hodge 数）：对 $\mathbb{CP}^n$，$h^{p,p} = 1$（$0 \leq p \leq n$），其余 $h^{p,q} = 0$。

---

---

## 第178章：Kähler 几何
Kähler 流形是同时具有 Riemann 度量、复结构和辛结构且三者兼容的流形。Kähler 几何是复几何的绝对核心。

### 178.1 Kähler 度量的定义

**定义 178.1**（Hermite 度量）：复流形 $M$ 上的 **Hermite 度量** $h$ 是每个切空间 $T_pM$（视为复向量空间）上的 Hermite 内积，光滑依赖于 $p$。分解为 $h = g - i\omega$，其中 $g = \operatorname{Re} h$ 是 Riemann 度量，$\omega = -\operatorname{Im} h$ 是实 2-形式。

**定义 178.2**（Kähler 度量）：Hermite 度量 $h$ 称为 **Kähler 度量**，如果相应的 $(1,1)$-形式 $\omega$ 是闭的：$d\omega = 0$。此时 $(M, h)$ 称为 **Kähler 流形**。

Kähler 条件等价于：复结构 $J$ 关于 $g$ 的 Levi-Civita 联络是平行的：$\nabla J = 0$。

**例 178.1**（Kähler 流形）：
- $\mathbb{C}^n$ 带标准欧氏度量（$\omega = \frac{i}{2} \sum dz_j \wedge d\bar{z}_j$）
- $\mathbb{CP}^n$ 带 **Fubini-Study 度量**：$\omega_{\text{FS}} = \frac{i}{2\pi} \partial \bar{\partial} \log \|Z\|^2$（在齐次坐标中）
- 复环面 $\mathbb{C}^n / \Lambda$（诱导度量是 Kähler 的）
- Kähler 流形的复子流形（诱导度量是 Kähler 的）
- 光滑复射影代数簇（嵌入 $\mathbb{CP}^n$ 后取诱导度量）

**命题 178.1**（Kähler 势）：在局部坐标下，Kähler 形式 $\omega$ 可写为

$$\omega = \frac{i}{2} \sum_{j,k} h_{j\bar{k}} dz_j \wedge d\bar{z}_k$$

其中 $h_{j\bar{k}} = \frac{\partial^2 \varphi}{\partial z_j \partial \bar{z}_k}$，$\varphi$ 是局部 **Kähler 势**。$d\omega = 0$ 自动满足。

### 178.2 Kähler 恒等式

**定理 178.1**（Kähler 恒等式）：在 Kähler 流形上，Hodge 星算子 $\star$、$\partial$、$\bar{\partial}$ 及其伴随算子满足以下恒等式：

1. $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$（Laplacian 的一致性）
2. $[\Lambda, \bar{\partial}] = -i \partial^*$，$[\Lambda, \partial] = i \bar{\partial}^*$（其中 $\Lambda = L^*$ 是 $\omega \wedge$ 的伴随）
3. $[L, \bar{\partial}^*] = i \partial$，$[L, \partial^*] = -i \bar{\partial}$

其中 $L = \omega \wedge \cdot$ 是 Lefschetz 算子，$\Lambda$ 是其伴随。

这些恒等式是 Hodge 理论在 Kähler 流形上成立的核心技术原因。

### 178.3 Hodge 分解定理

**定理 178.2**（Hodge 分解定理，Kähler 情形）：紧 Kähler 流形 $M$ 上的 de Rham 上同调（复系数）分解为

$$H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$$

且满足 $H_{\bar{\partial}}^{p,q}(M) \cong \overline{H_{\bar{\partial}}^{q,p}(M)}$（复共轭对称）。

*证明概要*（Dolbeault 上同调的 Hodge 分解）：由 Kähler 恒等式 $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$，$\Delta_d$-调和形式与 $\Delta_{\bar{\partial}}$-调和形式重合。对 $\Delta_d$ 应用 Hodge 定理：每个 de Rham 上同调类有唯一调和代表元 $\alpha \in \ker \Delta_d$。将 $\alpha$ 按 $(p,q)$ 类型分解：$\alpha = \sum_{p+q=k} \alpha^{p,q}$。由 Kähler 恒等式，$\Delta_d \alpha = 0$ 等价于 $\Delta_{\bar{\partial}} \alpha^{p,q} = 0$，故每个 $\alpha^{p,q}$ 是 $\bar{\partial}$-调和形式，对应 Dolbeault 上同调类。这给出同构 $H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$。∎

**推论 178.3**（Hodge 数的对称性）：$h^{p,q} = h^{q,p} = h^{n-p,n-q} = h^{n-q,n-p}$。

**推论 178.4**（Betti 数的奇偶性约束）：紧 Kähler 流形的奇数阶 Betti 数 $b_{2k+1}$ 为偶数。

**例 178.2**（Hodge 菱形，K3 曲面）：K3 曲面的 Hodge 菱形（注意：此处展示的是 K3 曲面而非 $\mathbb{CP}^2$，其 $h^{1,1}=20$ 是 K3 曲面的特征）：

```
              1
          0       0
      1      20      1
          0       0
              1
```

### 178.4 Chern 类与 Chern-Weil 理论

**定义 178.3**（Chern 类，复几何视角）：复向量丛 $E \to M$ 的**第 $k$ 个 Chern 类** $c_k(E) \in H^{2k}(M, \mathbb{Z})$ 由曲率形式 $\Omega$ 通过

$$\det\left(I + \frac{i}{2\pi} \Omega\right) = 1 + c_1(E) + c_2(E) + \cdots$$

定义。对复流形 $M$，$c_k(M) = c_k(TM)$。

**定理 178.5**（Chern-Weil 理论）：Chern 类在 de Rham 上同调中不依赖于联络的选择，且是复流形的微分同胚不变量。

**定义 178.4**（Chern 数）：紧复 $n$ 维流形 $M$ 的 **Chern 数**是 $\int_M c_{i_1}(M) \wedge \cdots \wedge c_{i_k}(M)$，其中 $\sum i_j = n$。

---

---

## 第179章：Hodge 理论
Hodge 理论是紧 Kähler 流形上同调理论的核心，揭示了调和形式、上同调类与复结构之间的深层关系。

### 179.1 调和形式与 Hodge 定理

**定义 179.1**（调和形式）：$(p,q)$-形式 $\alpha$ 称为**调和**的，如果 $\Delta_{\bar{\partial}} \alpha = 0$。记 $\mathcal{H}^{p,q}(M)$ 为调和 $(p,q)$-形式空间。

**定理 179.1**（Hodge 定理，调和表示）：在紧 Kähler 流形上，每个 Dolbeault 上同调类有唯一的调和代表元：

$$H_{\bar{\partial}}^{p,q}(M) \cong \mathcal{H}^{p,q}(M)$$

且 $\mathcal{H}^{p,q}(M)$ 是有限维的。

*证明*：$\Delta_{\bar{\partial}}$ 是椭圆算子（在紧流形上），其核是有限维的。$\bar{\partial}$-上同调类与 $\Delta_{\bar{\partial}}$-调和形式通过正交分解 $H_{\bar{\partial}}^{p,q} \cong \ker \Delta_{\bar{\partial}}$ 建立同构。∎

### 179.2 Lefschetz 分解

**定义 179.2**（Lefschetz 算子与原始形式）：定义 $L: \Omega^{p,q} \to \Omega^{p+1,q+1}$ 为 $L(\alpha) = \omega \wedge \alpha$（Kähler 形式的外乘）。$(p,q)$-形式 $\alpha$ 称为**原始**的（primitive），如果 $L^{n-p-q+1} \alpha = 0$（$n = \dim_{\mathbb{C}} M$）。

**定理 179.2**（Lefschetz 分解，硬 Lefschetz 定理）：对紧 Kähler 流形，$L^k: H^{n-k}(M, \mathbb{C}) \to H^{n+k}(M, \mathbb{C})$ 是同构（$0 \leq k \leq n$）。每个 $k$-形式可唯一分解为

$$\alpha = \sum_{j \geq \max(0, k-n)} L^j \alpha_j$$

其中 $\alpha_j$ 是原始的 $(k-2j)$-形式。

*注*：硬 Lefschetz 定理是 Kähler 几何区别于一般复流形的最深刻特征之一。

**定理 179.3**（Lefschetz 超平面定理）：设 $X \subset \mathbb{CP}^N$ 是光滑射影簇，$H$ 是超平面截面。则包含映射 $H \cap X \hookrightarrow X$ 诱导的同调群同态在维数 $< \dim_{\mathbb{C}} X - 1$ 上是同构。

### 179.3 Hodge 菱形与 Hodge 猜想

**定义 179.3**（Hodge 菱形）：Hodge 菱形是 $h^{p,q}$ 的阵列，行对应 $p+q$，列对应 $p-q$。Hodge 对称性 $h^{p,q} = h^{q,p} = h^{n-p,n-q}$ 反映在菱形的对称性上。

**命题 179.1**（Hodge 指标定理）：紧 Kähler 曲面 $M$ 的相交形式在 $H^{1,1}(M) \cap H^2(M, \mathbb{R})$ 上的符号差为 $(1, h^{1,1} - 1)$。

**定义 179.4**（Hodge 猜想）：设 $X$ 是光滑复射影代数簇。对每个 $k$，有理 $(k,k)$-类（即 $H^{2k}(X, \mathbb{Q}) \cap H^{k,k}(X)$）是否由代数子簇的类生成？这是 Clay 千禧年问题之一，至今未解决（$k=1$ 时由 Lefschetz 的 $(1,1)$-定理解决）。

**定理 179.4**（Lefschetz $(1,1)$-定理）：紧 Kähler 流形 $M$ 上的每个整 $(1,1)$-类是线丛的 Chern 类。即 $H^{1,1}(M) \cap H^2(M, \mathbb{Z}) \cong \operatorname{Pic}(M)$（Néron-Severi 群）。

### 179.4 Hodge 结构的变分

**定义 179.5**（Hodge 结构）：权 $k$ 的**有理 Hodge 结构**由有限维有理向量空间 $V_{\mathbb{Q}}$ 和 $V_{\mathbb{C}} = V_{\mathbb{Q}} \otimes \mathbb{C}$ 上的分解 $V_{\mathbb{C}} = \bigoplus_{p+q=k} V^{p,q}$ 组成，满足 $\overline{V^{p,q}} = V^{q,p}$。等价地，Hodge 结构可用两个滤过刻画：**Hodge 滤过** $F^p = \bigoplus_{i \geq p} V^{i,k-i}$ 是 $V_{\mathbb{C}}$ 的下降滤过，满足 $F^p \oplus \overline{F^{k-p+1}} \cong V_{\mathbb{C}}$；**权滤过** $W_\bullet$ 是定义在 $V_{\mathbb{Q}}$ 上的递增滤过，满足 $W_m = 0$（$m < 0$）且 $W_k = V_{\mathbb{Q}}$。称 $(V_{\mathbb{Q}}, F^\bullet, W_\bullet)$ 为**混合 Hodge 结构**。当 $W_{k-1} = 0$ 时即为**纯 Hodge 结构**。纯 Hodge 结构的基本例子包括：光滑复射影代数簇 $X$ 的 $k$ 阶上同调 $H^k(X, \mathbb{Q})$ 带由其 Kähler 结构诱导的 Hodge 分解 $H^k(X, \mathbb{C}) \cong \bigoplus_{p+q=k} H^{p,q}(X)$；以及 Abel 簇（复环面）的 $H^1$ 上的极化的纯 Hodge 结构。混合 Hodge 结构最典型的例子来自代数簇的补空间或奇异代数簇的上同调——Deligne 证明任何复代数簇的上同调都携带典范的混合 Hodge 结构，其权滤过反映了奇异性的贡献。

**定理 179.5**（Griffiths 横截性）：在 Hodge 簇的形变中，Hodge 分解满足 $V^{p,q}$ 的微分位于 $V^{p-1,q+1} \oplus V^{p,q} \oplus V^{p+1,q-1}$ 中。这是周期映射的基本性质。

---

---

## 第180章：形变理论
形变理论研究复流形在保持复结构前提下的连续变化。由 Kodaira 和 Spencer 在 1950 年代创立。

### 180.1 无穷小形变

**定义 180.1**（形变）：紧复流形 $M$ 的**形变**是光滑族 $\pi: \mathcal{M} \to B$（$B$ 是连通复流形），使得 $\pi^{-1}(0) = M$（$0 \in B$）。$M_t = \pi^{-1}(t)$ 是形变后的复流形。

**定义 180.2**（无穷小形变）：$M$ 的**无穷小形变**空间是 $H^1(M, \Theta_M)$，其中 $\Theta_M = \mathcal{O}(TM)$ 是全纯切丛的层。

**定理 180.1**（Kodaira-Spencer 映射）：设 $\pi: \mathcal{M} \to B$ 是 $M$ 的形变。则存在 Kodaira-Spencer 映射 $\rho: T_0 B \to H^1(M, \Theta_M)$，将形变方向映射到无穷小形变类。

**例 180.1**（Riemann 面的形变）：亏格 $g$ 的 Riemann 面的形变空间维数为 $3g-3$（$g \geq 2$），即 $H^1(M, \Theta_M) \cong \mathbb{C}^{3g-3}$。这对应于 Teichmüller 空间。

### 180.2 阻碍与 Kuranishi 族

**定理 180.2**（Kodaira 阻碍定理）：形变存在阻碍，阻碍空间为 $H^2(M, \Theta_M)$。若 $H^2(M, \Theta_M) = 0$，则每个无穷小形变可积为真正的形变（$M$ 无阻碍）。

**定理 180.3**（Kuranishi 定理，1965）：紧复流形 $M$ 存在**半通用形变**（Kuranishi 族），其参数空间是 $H^1(M, \Theta_M)$ 在 $0$ 处的一个邻域中由 $H^2(M, \Theta_M)$ 定义的解析子集。即形变由

$$\mu: H^1(M, \Theta_M) \to H^2(M, \Theta_M), \quad \mu(\varphi) = [\varphi, \varphi]$$

的零点定义（Kuranishi 映射 $\mu$ 是二次的）。

**例 180.2**（Calabi-Yau 流形的形变）：Calabi-Yau 3 维流形（$c_1 = 0$）的无穷小形变空间 $H^1(M, \Theta_M) \cong H^{2,1}(M)$ 无阻碍。由 Bogomolov-Tian-Todorov 定理，$H^2(M, \Theta_M) = 0$，形变空间是光滑的。

### 180.3 形变量子化

**定义 180.3**（形变量子化）：形变量子化将光滑函数代数（Poisson 代数）形变为非交换代数。对辛流形 $(M, \omega)$，形变量子化是形式幂级数环 $\mathbb{C}[[\hbar]]$ 上的结合代数结构：

$$f \star g = fg + \frac{i\hbar}{2}\{f, g\} + \sum_{k \geq 2} \hbar^k B_k(f, g)$$

其中 $B_k$ 是双微分算子，$\star$ 满足结合律，且 $f \star g - g \star f = i\hbar\{f, g\} + O(\hbar^2)$。

**定理 180.4**（Kontsevich 形变量子化定理，1997）：任意 Poisson 流形上存在形变量子化。

---

---

## 第181章：Calabi-Yau 流形与镜对称
Calabi-Yau 流形是第一 Chern 类为零的紧 Kähler 流形，在弦论和镜对称中占据核心地位。

### 181.1 Calabi 猜想与 Yau 定理

**定义 181.1**（Calabi-Yau 流形）：紧 Kähler 流形 $M$ 称为 **Calabi-Yau 流形**，如果 $c_1(M) = 0$（在实上同调中）。等价地，$M$ 的典范丛 $K_M = \bigwedge^n T^*M$ 是平凡的。

**定理 181.1**（Calabi 猜想 / Yau 定理，1976-1978）：设 $M$ 是紧 Kähler 流形，$c_1(M) = 0$。则 $M$ 上存在唯一的 Ricci 平坦 Kähler 度量，其 Kähler 类等于任意给定的 Kähler 类。

*意义*：Yau 定理证明了 Calabi 猜想，是 20 世纪几何学最伟大的成就之一。它保证了 Calabi-Yau 流形上 Ricci 平坦 Kähler 度量的存在性，为弦论中的 Calabi-Yau 紧化提供了数学基础。Yau 因此获 Fields 奖（1982）。

**注 181.1**（Yau 定理的证明概要）：Yau 的证明将问题转化为求解复 Monge-Ampere 方程：给定 Kähler 形式 $\omega_0$ 和体积形式 $\Omega$（满足 $\int_M \Omega = \int_M \omega_0^n$），求 Kähler 势 $\varphi$ 使得 $(\omega_0 + i\partial\bar{\partial}\varphi)^n = \Omega$ 且 $\omega_0 + i\partial\bar{\partial}\varphi > 0$。这是一个完全非线性的椭圆 PDE。Yau 使用**连续性方法**：构造从 $\omega_0^n$ 到 $\Omega$ 的一族体积形式，证明解的集合既开又闭。开性由椭圆算子的可逆性保证；闭性需要建立解的 $C^0$、$C^2$ 和 $C^{2,\alpha}$ 先验估计。其中 $C^0$ 估计（即 $\varphi$ 的有界性）是最困难的一步，Yau 通过精巧的 Moser 迭代和极大值原理完成。该定理的直接推论是：当 $c_1(M) = 0$ 时，取 $\Omega$ 为零曲率体积形式，得到的 Kähler 度量满足 $\operatorname{Ric}(g) = 0$，即 Ricci 平坦。

**例 181.1**（Calabi-Yau 流形的例子）：
- 复 1 维：椭圆曲线（$T^2$）
- 复 2 维：K3 曲面（唯一的单连通紧复曲面，$c_1 = 0$）
- 复 3 维：**五次 3 维流形**（$\mathbb{CP}^4$ 中由五次齐次多项式定义的超曲面）

### 181.2 Calabi-Yau 3 维流形

**定义 181.2**（Hodge 菱形，CY 3 维流形）：Calabi-Yau 3 维流形的 Hodge 数为：

$$
\begin{array}{ccccccc}
& & & 1 & & & \\
& & 0 & & 0 & & \\
& 0 & & h^{1,1} & & 0 & \\
1 & & h^{2,1} & & h^{2,1} & & 1 \\
& 0 & & h^{1,1} & & 0 & \\
& & 0 & & 0 & & \\
& & & 1 & & &
\end{array}
$$

其中 $h^{1,1}$ 和 $h^{2,1}$ 是仅有的独立 Hodge 数。$h^{1,1}$ 是 Kähler 模空间维数，$h^{2,1}$ 是复结构模空间维数。

**定义 181.3**（五次 3 维流形）：$\mathbb{CP}^4$ 中一般五次超曲面的 Hodge 数为 $h^{1,1} = 1$，$h^{2,1} = 101$。Euler 示性数 $\chi = -200$。这是研究最多的 Calabi-Yau 3 维流形。

### 181.3 镜对称

**定义 181.4**（镜对称猜想）：对每个 Calabi-Yau 3 维流形 $M$，存在**镜流形** $M^\vee$（也是 Calabi-Yau 3 维流形），满足：

$$h^{1,1}(M) = h^{2,1}(M^\vee), \quad h^{2,1}(M) = h^{1,1}(M^\vee)$$

即 Hodge 菱形沿 $45^\circ$ 线翻转。更深层的镜对称断言 $M$ 上的 **A-模型**（Gromov-Witten 不变量，与 Kähler 模空间相关）等价于 $M^\vee$ 上的 **B-模型**（周期积分，与复结构模空间相关）。

**定理 181.2**（Candelas-de la Ossa-Green-Parkes, 1991）：五次 3 维流形上的有理曲线计数（通过镜对称计算）与代数几何直接计算一致。这是镜对称的第一个数值验证，开启了枚举几何的新纪元。

**定义 181.5**（Gromov-Witten 不变量）：$M$ 的 **Gromov-Witten 不变量**计算 $M$ 中给定亏格和同调类的全纯曲线的"虚拟"数目。它们是辛几何的不变量，在镜对称中对应 B-模型的周期积分。

**定理 181.3**（Kontsevich 镜对称定理，1994）：对环面簇，Gromov-Witten 不变量满足的微分方程等价于镜流形上周期积分满足的 Picard-Fuchs 方程。这给出了镜对称在环面簇情形下的精确表述。

### 181.4 SYZ 猜想

**定理 181.4**（Strominger-Yau-Zaslow 猜想，1996）：镜对称可以通过 Calabi-Yau 流形的 **T-对偶**实现：$M$ 和 $M^\vee$ 都是特殊 Lagrangian 3-环面 $T^3$ 的纤维丛（在奇异纤维的极限下），且彼此通过交换纤维与基实现镜对称。

SYZ 猜想将镜对称从代数几何的等价性转化为几何构造，是理解镜对称本质的关键框架。

---

*本卷建立了复几何的核心理论框架：复流形（近复结构、可积性、Dolbeault 上同调）将实微分几何推广到全纯范畴；Kähler 几何（Kähler 度量、Kähler 恒等式、Hodge 分解）是连接复结构、Riemann 度量和辛结构的典范框架；Hodge 理论（调和形式、Lefschetz 分解、Hodge 猜想）揭示了紧 Kähler 流形上同调的精细结构；形变理论（无穷小形变、Kuranishi 族）刻画了复结构的连续变化；Calabi-Yau 流形与镜对称（Yau 定理、镜对称）是复几何中最深刻的结果，连接了几何、代数、物理三大领域。复几何是当代数学几何化的核心语言。*

---

*本卷建立了复分析的完整理论框架：全纯函数与 Cauchy-Riemann 方程（Ch 51）是复分析的起点；复积分与 Cauchy 积分定理/公式（Ch 52）揭示了全纯函数的深层性质；级数展开与奇点分类（Ch 53）提供了分析工具；留数定理（Ch 54）实现了实积分的复计算；共形映射与 Riemann 映射定理（Ch 55）建立了区域间的解析对应；解析延拓与 Riemann 面（Ch 56）处理了多值性问题；Nevanlinna 值分布理论（Ch 57）量化了亚纯函数的取值行为；拟共形映射与 Teichmüller 空间（Ch 58）将共形几何推广至有界畸变；Siegel 区域与对称域（Ch 59）及多复变函数论（Ch 60-61）将理论推广至高维。补充内容涵盖了复几何（复流形、Kähler 几何、Hodge 理论、形变理论、Calabi-Yau 流形与镜对称），构成了复分析与微分几何的桥梁。*


*卷九：复分析终。*
