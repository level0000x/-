## 第199章：Hodge 理论
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

---

---

---
---

## 第200章：形变理论
形变理论研究复流形在保持复结构前提下的连续变化。由 Kodaira 和 Spencer 在 1950 年代创立。

### 180.1 无穷小形变

**定义 180.1**（形变）：紧复流形 $M$ 的**形变**是光滑族 $\pi: \mathcal{M} \to B$（$B$ 是连通复流形），使得 $\pi^{-1}(0) = M$（$0 \in B$）。$M_t = \pi^{-1}(t)$ 是形变后的复流形。

**定义 180.2**（无穷小形变）：$M$ 的**无穷小形变**空间是 $H^1(M, \Theta_M)$，其中 $\Theta_M = \mathcal{O}(TM)$ 是全纯切丛的层。

**定理 180.1**（Kodaira-Spencer 映射）：设 $\pi: \mathcal{M} \to B$ 是 $M$ 的形变。则存在 Kodaira-Spencer 映射 $\rho: T_0 B \to H^1(M, \Theta_M)$，将形变方向映射到无穷小形变类。

### 180.2 阻碍与 Kuranishi 族

**定理 180.2**（Kodaira 阻碍定理）：形变存在阻碍，阻碍空间为 $H^2(M, \Theta_M)$。若 $H^2(M, \Theta_M) = 0$，则每个无穷小形变可积为真正的形变（$M$ 无阻碍）。

**定理 180.3**（Kuranishi 定理，1965）：紧复流形 $M$ 存在**半通用形变**（Kuranishi 族），其参数空间是 $H^1(M, \Theta_M)$ 在 $0$ 处的一个邻域中由 $H^2(M, \Theta_M)$ 定义的解析子集。即形变由

$$\mu: H^1(M, \Theta_M) \to H^2(M, \Theta_M), \quad \mu(\varphi) = [\varphi, \varphi]$$

的零点定义（Kuranishi 映射 $\mu$ 是二次的）。

### 180.3 形变量子化

**定义 180.3**（形变量子化）：形变量子化将光滑函数代数（Poisson 代数）形变为非交换代数。对辛流形 $(M, \omega)$，形变量子化是形式幂级数环 $\mathbb{C}[[\hbar]]$ 上的结合代数结构：

$$f \star g = fg + \frac{i\hbar}{2}\{f, g\} + \sum_{k \geq 2} \hbar^k B_k(f, g)$$

其中 $B_k$ 是双微分算子，$\star$ 满足结合律，且 $f \star g - g \star f = i\hbar\{f, g\} + O(\hbar^2)$。

**定理 180.4**（Kontsevich 形变量子化定理，1997）：任意 Poisson 流形上存在形变量子化。

---

---

---

---

---
---

## 第201章：Calabi-Yau 流形与镜对称
Calabi-Yau 流形是第一 Chern 类为零的紧 Kähler 流形，在弦论和镜对称中占据核心地位。

### 181.1 Calabi 猜想与 Yau 定理

**定义 181.1**（Calabi-Yau 流形）：紧 Kähler 流形 $M$ 称为 **Calabi-Yau 流形**，如果 $c_1(M) = 0$（在实上同调中）。等价地，$M$ 的典范丛 $K_M = \bigwedge^n T^*M$ 是平凡的。

**定理 181.1**（Calabi 猜想 / Yau 定理，1976-1978）：设 $M$ 是紧 Kähler 流形，$c_1(M) = 0$。则 $M$ 上存在唯一的 Ricci 平坦 Kähler 度量，其 Kähler 类等于任意给定的 Kähler 类。

*意义*：Yau 定理证明了 Calabi 猜想，是 20 世纪几何学最伟大的成就之一。它保证了 Calabi-Yau 流形上 Ricci 平坦 Kähler 度量的存在性，为弦论中的 Calabi-Yau 紧化提供了数学基础。Yau 因此获 Fields 奖（1982）。

**注 181.1**（Yau 定理的证明概要）：Yau 的证明将问题转化为求解复 Monge-Ampere 方程：给定 Kähler 形式 $\omega_0$ 和体积形式 $\Omega$（满足 $\int_M \Omega = \int_M \omega_0^n$），求 Kähler 势 $\varphi$ 使得 $(\omega_0 + i\partial\bar{\partial}\varphi)^n = \Omega$ 且 $\omega_0 + i\partial\bar{\partial}\varphi > 0$。这是一个完全非线性的椭圆 PDE。Yau 使用**连续性方法**：构造从 $\omega_0^n$ 到 $\Omega$ 的一族体积形式，证明解的集合既开又闭。开性由椭圆算子的可逆性保证；闭性需要建立解的 $C^0$、$C^2$ 和 $C^{2,\alpha}$ 先验估计。其中 $C^0$ 估计（即 $\varphi$ 的有界性）是最困难的一步，Yau 通过精巧的 Moser 迭代和极大值原理完成。该定理的直接推论是：当 $c_1(M) = 0$ 时，取 $\Omega$ 为零曲率体积形式，得到的 Kähler 度量满足 $\operatorname{Ric}(g) = 0$，即 Ricci 平坦。

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

*本卷建立了复分析的完整理论框架：全纯函数与 Cauchy-Riemann 方程（Ch 73）是复分析的起点；复积分与 Cauchy 积分定理/公式（Ch 74）揭示了全纯函数的深层性质；级数展开与奇点分类（Ch 75）提供了分析工具；留数定理（Ch 76）实现了实积分的复计算；共形映射与 Riemann 映射定理（Ch 77）建立了区域间的解析对应；解析延拓与 Riemann 面（Ch 78）处理了多值性问题；Nevanlinna 值分布理论（Ch 90）量化了亚纯函数的取值行为；拟共形映射与 Teichmüller 空间（Ch 91）将共形几何推广至有界畸变；Siegel 区域与对称域（Ch 92）及多复变函数论（Ch 93-61）将理论推广至高维。补充内容涵盖了复几何（复流形、Kähler 几何、Hodge 理论、形变理论、Calabi-Yau 流形与镜对称），构成了复分析与微分几何的桥梁。*


*卷九：复分析终。*


*卷九：复分析终。*


*卷九：复分析终。*


*卷十一：复几何终。*