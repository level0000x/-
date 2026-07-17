## Ch 108 值分布理论（Nevanlinna 理论）
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

---

---

---
---

## Ch 109 拟共形映射与 Teichmüller 空间
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

---

---

---
---

## Ch 110：Siegel 区域与对称域
Siegel 区域理论是经典多复变函数论的核心部分。**定义**：$\mathbb{C}^n$ 中的 **Siegel 上半空间**（或 Siegel 广义上半平面）为 $\mathcal{H}_n = \{ Z \in \mathbb{C}^{n \times n} : Z^{\mathsf{T}} = Z, \; \operatorname{Im}(Z) \succ 0 \}$（即 $n \times n$ 对称复矩阵虚部正定的集合），它是 $\operatorname{Sp}(2n,\mathbb{R})$ 的作用空间，等价于 **Siegel 上半空间** $\operatorname{Sp}(2n,\mathbb{R}) / \operatorname{U}(n)$。更一般地，**Siegel 区域**是第二类域：$\{ (z,w) \in \mathbb{C}^{m} \times \mathbb{C}^{n} : \operatorname{Im}(z) - F(w,w) \in \Omega \}$，其中 $F$ 是 $\mathbb{C}^{n} \times \mathbb{C}^{n} \to \mathbb{C}^{m}$ 的 Hermite 形式，$\Omega \subset \mathbb{R}^{m}$ 是自对偶锥。Siegel 域给出了所有齐性有界域的典型表示。**Hermann 有界对称域分类**（E. Cartan, 1935）：不可约有界对称域分为四大类经典域（由 Siegel 上半空间、Grassmann 流形、正交 Lie 球的 Cayley 变换得到）和两个例外域（16维和27维）。Siegel 上半空间上的 **Siegel 模形式**（即 $\operatorname{Sp}(2n,\mathbb{Z})$ 作用下变换的全纯函数）推广了经典椭圆模形式，在数论（志村簇）和弦论紧化中有深刻应用。

---

---

---

---

---
---

## Ch 111：多复变函数论导引（Several Complex Variables）
多复变函数论研究 $\mathbb{C}^n$（$n \geq 2$）上的全纯函数，与单复变有本质区别。**基本现象**：（1）**Hartogs 现象**——存在区域 $\Omega \subsetneq \mathbb{C}^n$ 使得 $\Omega$ 上的所有全纯函数均可全纯延拓到更大的固定区域上。例如，对 $n \geq 2$，每个在 $0 < \|z\| < 1$ 上全纯的函数自动全纯延拓到整个单位球 $\|z\| < 1$——即孤立奇点不能作为全纯函数的障碍。这直接导致 $\mathbb{C}^n$ 中不存在"一般区域"的 Riemann 映射定理的类比。（2）**域的等价分类**：单复变中 Riemann 映射定理宣告所有单连通真子域彼此双全纯等价。多复变中双全纯等价类极其丰富——单位球 $B_n = \{ \|z\| < 1 \}$ 和单位多圆柱 $D^n = \{ |z_j| < 1 \}$ 并**不**双全纯等价，尽管两者都是 $\mathbb{C}^n$ 中的自然域。

**基本定义**：函数 $f: \Omega \to \mathbb{C}$ 称为**全纯**若 $f$ 在每点满足 Cauchy-Riemann 方程组 $\frac{\partial f}{\partial \bar{z}_j} = 0$（$j = 1,\ldots,n$）。等价地，$f$ 在每个变量单独全纯。**核心定理**：（1）**Cauchy 积分公式**（多复变版本）——$f(z) = \frac{1}{(2\pi i)^n} \int_{|w_1-z_1| = r_1} \cdots \int_{|w_n - z_n| = r_n} \frac{f(w)}{(w_1 - z_1)\cdots(w_n - z_n)} dw_1 \cdots dw_n$ （对于乘积圆盘）；（2）**Osgood 引理**——单独连续且对每个变量单独全纯的函数是全纯的；（3）**Hartogs 基本定理**——$f$ 全纯当且仅当 $f$ 对每个变量单独全纯（无需连续性假设）。

**Levi 问题**（E. E. Levi, 1911）：$\mathbb{C}^n$ 中的哪些域是全纯域（即存在不能延拓到更大域的全纯函数）？**答案**（Oka, 1942; Bremermann, 1954; Norguet, 1954）：域是全纯域当且仅当它是 **伪凸** 的。伪凸性由 **Levi 形式**（边界上复 Hessian 矩阵）的正半定性刻画——类似于 $\mathbb{R}^n$ 中域的凸性，但由复结构的约束导致。多复变中的 **$\bar{\partial}$ 问题**（即 $\bar{\partial} u = f$）及其正则解（Hörmander 的 $L^2$ 方法）正是处理这些问题的基本技术工具。

---

---

---

---

---
---

## Ch 112：多复变核心定理
### 61.1 Stein 流形与 Oka 原理

**定义**（Stein 流形）：复流形 $X$ 为 **Stein 流形** 若（1）$X$ 是 Hausdorff 且第二可数；（2）全纯函数分离点：对 $x \neq y$，存在 $f \in \mathcal{O}(X)$（$X$ 上全纯函数空间）使 $f(x) \neq f(y)$；（3）全纯函数给出局部坐标：对每点 $x$，存在 $f_1, \ldots, f_{\dim X} \in \mathcal{O}(X)$ 在 $x$ 处构成坐标系。

**定理 61.1**（Stein 基本定理）：$\mathbb{C}^n$ 中的域是 Stein 当且仅当它是全纯域。特别地，所有伪凸域是 Stein，所有 Stein 域是伪凸（对 $\mathbb{C}^n$ 中的域，两者等价——这是 Oka 对 Levi 问题的解答）。

**定理 61.2**（Cousin 问题与 Oka-Weil 定理）：第一 Cousin 问题（寻找具有指定极点的亚纯函数）在 Stein 流形上恒有解；第二 Cousin 问题（寻找具有指定零点的全纯函数）在 $\operatorname{Pic}(X) = 0$（全纯线丛平凡）时恒有解。**Oka-Weil 逼近定理**：若 $X$ 为 Stein，$K \subset X$ 为全纯凸紧集，则 $K$ 上的任意全纯函数可由 $X$ 上的全纯函数一致逼近。

### 61.2 dbar-Neumann 问题

**定理 61.3**（Hörmander $L^2$ 估计）：设 $\Omega \subset \mathbb{C}^n$ 为伪凸域，$\varphi$ 为光滑强多次调和函数。则对任意满足 $\bar{\partial} f = 0$ 的 $(0,1)$-形式 $f$，方程 $\bar{\partial} u = f$ 存在光滑解 $u$ 满足 $\int_\Omega |u|^2 e^{-\varphi} dV \leq \int_\Omega |f|^2 e^{-\varphi} dV$。*证明思路*：加权 $L^2$ 空间中的闭稠定算子满足 Hörmander 关于无界算子的存在定理，核心是 $\bar{\partial}$-Neumann 算子的正则性由 $L^2$ Sobolev 嵌入保证。该定理是研究 dbar 方程和多复变正则性问题的核心技术。

---

---

---

---


*卷十：复分析终。*