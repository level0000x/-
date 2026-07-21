## 第217章：Hodge 理论

Hodge 理论是紧 Kahler 流形上同调理论的核心，由 W. V. D. Hodge 在 1930-1940 年代系统创立。其最基本结果是 Hodge 分解定理：在紧 Kahler 流形 $M$ 上，每个 de Rham 上同调类都有唯一的调和形式代表元。更精确地，复值上同调群 $H^k(M, \mathbb{C})$ 可以按 $(p,q)$ 类型分解为调和 $(p,q)$-形式空间的直和 $H^k(M, \mathbb{C}) = \bigoplus_{p+q=k} \mathcal{H}^{p,q}(M)$，且满足 Hodge 对偶 $\mathcal{H}^{p,q} \cong \overline{\mathcal{H}^{q,p}}$。这一分解的几何意义极为深远：Hodge 数 $h^{p,q} = \dim \mathcal{H}^{p,q}$ 不仅给出了 Betti 数的精细分解（$\sum_{p+q=k} h^{p,q} = b_k$），其 Hodge 菱形对称性还同时编码了 Serre 对偶、复共轭对称以及 Lefschetz 分解（通过 Kahler 类的楔积给出 $H^{p,q} \to H^{p+1,q+1}$ 的同构）。在代数几何中，Hodge 理论是 Hodge 猜想（每个有理 $(p,p)$ 类必是代数闭链的有理线性组合）的基础，后者是 Clay 数学研究所的七大千禧问题之一。本章与形变理论（第200章）的联系在于：Hodge 结构随复结构的形变而变化，产生了 Griffiths 周期映射，这直接引向 Calabi-Yau 流形（第201章）的镜对称研究。

### 179.1 调和形式与 Hodge 定理

**定义 179.1**（调和形式）：$(p,q)$-形式 $\alpha$ 称为**调和**的，如果 $\Delta_{\bar{\partial}} \alpha = 0$。记 $\mathcal{H}^{p,q}(M)$ 为调和 $(p,q)$-形式空间。

**定理 179.1**（Hodge 定理，调和表示）：在紧 Kähler 流形上，每个 Dolbeault 上同调类有唯一的调和代表元：

$$H_{\bar{\partial}}^{p,q}(M) \cong \mathcal{H}^{p,q}(M)$$

且 $\mathcal{H}^{p,q}(M)$ 是有限维的。

*证明*：$\Delta_{\bar{\partial}}$ 是椭圆算子（在紧流形上），其核是有限维的。$\bar{\partial}$-上同调类与 $\Delta_{\bar{\partial}}$-调和形式通过正交分解 $H_{\bar{\partial}}^{p,q} \cong \ker \Delta_{\bar{\partial}}$ 建立同构。∎

### 179.2 Lefschetz 分解与 $\mathfrak{sl}_2$-表示

Hodge 定理在每一上同调层次给出了调和形式的存在性，但它并未揭示不同次数的 Hodge 分量之间的代数关系。Lefschetz 分解正是描述这些关系的基本结构——它表明 Hodge 结构的各个分量实际上构成了 $\mathfrak{sl}_2$ 表示论中的有限维不可约表示，从而将复几何与李代数的表示理论建立了深刻的联系。

**定义 179.2**（Lefschetz 算子与对偶 Lefschetz 算子）：定义 $L: \Omega^{p,q} \to \Omega^{p+1,q+1}$ 为 $L(\alpha) = \omega \wedge \alpha$（Kähler 形式的外乘）。$(p,q)$-形式 $\alpha$ 称为**原始**的（primitive），如果 $L^{n-p-q+1} \alpha = 0$（$n = \dim_{\mathbb{C}} M$）。

**定理 179.2**（Lefschetz 分解，硬 Lefschetz 定理）：对紧 Kähler 流形，$L^k: H^{n-k}(M, \mathbb{C}) \to H^{n+k}(M, \mathbb{C})$ 是同构（$0 \leq k \leq n$）。每个 $k$-形式可唯一分解为

$$\alpha = \sum_{j \geq \max(0, k-n)} L^j \alpha_j$$

其中 $\alpha_j$ 是原始的 $(k-2j)$-形式。

*注*：硬 Lefschetz 定理是 Kähler 几何区别于一般复流形的最深刻特征之一。

**证明**：设 $\Lambda = L^*$ 为 $L$ 的伴随算子。$\mathfrak{sl}_2$-三元组 $\{L, \Lambda, H = [L, \Lambda]\}$ 在 $\Omega^*(M)$ 上有表示，$H\alpha = (k-n)\alpha$ 对 $k$-形式。由 $\mathfrak{sl}_2$-表示论，$\alpha$ 有唯一分解 $\alpha = \sum L^j \alpha_j$（$\alpha_j$ 原始）。硬 Lefschetz 同构来自 $L^k$ 在调和形式上诱导的同构（由 Kähler 恒等式 $\Delta_d = 2\Delta_\partial$ 和 Lefschetz $L$ 与 Laplacian 交换）。$\blacksquare$

**定理 179.3**（Lefschetz 超平面定理）：设 $X \subset \mathbb{CP}^N$ 是光滑射影簇，$H$ 是超平面截面。则包含映射 $H \cap X \hookrightarrow X$ 诱导的同调群同态在维数 $< \dim_{\mathbb{C}} X - 1$ 上是同构。

**证明**：由 Morse 理论，$X \setminus H$ 是仿射簇，具有同伦型至多为 $\dim_{\mathbb{C}} X$ 的 CW 复形。Lefschetz 铅笔论证表明 $X \setminus H$ 上的相对同调在维数 $< n-1$ 时为零。由 Alexander-Lefschetz 对偶，包含映射 $i: H \cap X \hookrightarrow X$ 诱导同构 $i_*: H_k(H \cap X) \to H_k(X)$（$k < n-1$）。$\blacksquare$

### 179.3 Hodge 菱形与 Hodge 猜想

**定义 179.3**（Hodge 菱形）：Hodge 菱形是 $h^{p,q}$ 的阵列，行对应 $p+q$，列对应 $p-q$。Hodge 对称性 $h^{p,q} = h^{q,p} = h^{n-p,n-q}$ 反映在菱形的对称性上。

**命题 179.1**（Hodge 指标定理）：紧 Kähler 曲面 $M$ 的相交形式在 $H^{1,1}(M) \cap H^2(M, \mathbb{R})$ 上的符号差为 $(1, h^{1,1} - 1)$。

**证明**：由 Hodge 分解，$H^2(M, \mathbb{R}) = H^{1,1}(M) \cap H^2(M, \mathbb{R}) \oplus (H^{2,0} \oplus H^{0,2}) \cap H^2(M, \mathbb{R})$。Kähler 形式 $\omega$ 给出 $H^{1,1}$ 中的一个正类（$\int_M \omega^2 > 0$），故相交形式有一个正特征值。由 Lefschetz 分解，$H^{1,1}$ 的其余部分 $H^{1,1}_{\text{prim}}$ 中，$\omega$ 的作用给出负定形式：对 $\alpha \in H^{1,1}_{\text{prim}}$，$\int_M \alpha \wedge \alpha \wedge \omega^{n-2} < 0$。对于 $n=2$（曲面），这给出 $\int_M \alpha^2 < 0$。故 $H^{1,1}$ 的相交形式符号差为 $(1, h^{1,1} - 1)$。$\blacksquare$

**定义 179.4**（Hodge 猜想）：设 $X$ 是光滑复射影代数簇。对每个 $k$，有理 $(k,k)$-类（即 $H^{2k}(X, \mathbb{Q}) \cap H^{k,k}(X)$）是否由代数子簇的类生成？这是 Clay 千禧年问题之一，至今未解决（$k=1$ 时由 Lefschetz 的 $(1,1)$-定理解决）。

**定理 179.4**（Lefschetz $(1,1)$-定理）：紧 Kähler 流形 $M$ 上的每个整 $(1,1)$-类是线丛的 Chern 类。即 $H^{1,1}(M) \cap H^2(M, \mathbb{Z}) \cong \operatorname{Pic}(M)$（Néron-Severi 群）。

*证明*：指数正合列 $0 \to \mathbb{Z} \to \mathcal{O}_M \xrightarrow{\exp(2\pi i\cdot)} \mathcal{O}_M^* \to 0$ 的长正合序列给出 $\operatorname{Pic}(M)=H^1(M,\mathcal{O}_M^*) \to H^2(M,\mathbb{Z}) \to H^2(M,\mathcal{O}_M)$。像落在 $H^2(M,\mathbb{Z})$ 在 $H^2(M,\mathbb{C})=H^{2,0}\oplus H^{1,1}\oplus H^{0,2}$ 中的 $(1,1)$-部分。由 Dolbeault，$H^2(M,\mathcal{O}_M)=H^{0,2}$，故核即整 $(1,1)$-类。$\blacksquare$

### 179.4 Hodge 结构的变分

Hodge 结构的本质不仅仅在于单个复流形上静态的 $(p,q)$-分解，更在于当复流形在一族中连续变化时，这些分解如何随之演化。Griffiths 在 1960-70 年代建立的理论表明，Hodge 分解的变分受到严格的微分约束（横截性），而这些约束反过来通过周期映射精确控制了复结构的模空间几何。

**定义 179.5**（Hodge 结构）：权 $k$ 的**有理 Hodge 结构**由有限维有理向量空间 $V_{\mathbb{Q}}$ 和 $V_{\mathbb{C}} = V_{\mathbb{Q}} \otimes \mathbb{C}$ 上的分解 $V_{\mathbb{C}} = \bigoplus_{p+q=k} V^{p,q}$ 组成，满足 $\overline{V^{p,q}} = V^{q,p}$。等价地，Hodge 结构可用两个滤过刻画：**Hodge 滤过** $F^p = \bigoplus_{i \geq p} V^{i,k-i}$ 是 $V_{\mathbb{C}}$ 的下降滤过，满足 $F^p \oplus \overline{F^{k-p+1}} \cong V_{\mathbb{C}}$；**权滤过** $W_\bullet$ 是定义在 $V_{\mathbb{Q}}$ 上的递增滤过，满足 $W_m = 0$（$m < 0$）且 $W_k = V_{\mathbb{Q}}$。称 $(V_{\mathbb{Q}}, F^\bullet, W_\bullet)$ 为**混合 Hodge 结构**。当 $W_{k-1} = 0$ 时即为**纯 Hodge 结构**。纯 Hodge 结构的基本例子包括：光滑复射影代数簇 $X$ 的 $k$ 阶上同调 $H^k(X, \mathbb{Q})$ 带由其 Kähler 结构诱导的 Hodge 分解 $H^k(X, \mathbb{C}) \cong \bigoplus_{p+q=k} H^{p,q}(X)$；以及 Abel 簇（复环面）的 $H^1$ 上的极化的纯 Hodge 结构。混合 Hodge 结构最典型的例子来自代数簇的补空间或奇异代数簇的上同调——Deligne 证明任何复代数簇的上同调都携带典范的混合 Hodge 结构，其权滤过反映了奇异性的贡献。

**定理 179.5**（Griffiths 横截性）：在 Hodge 簇的形变中，Hodge 分解满足 $V^{p,q}$ 的微分位于 $V^{p-1,q+1} \oplus V^{p,q} \oplus V^{p+1,q-1}$ 中。这是周期映射的基本性质。

**证明**：设 $F_t^p = \bigoplus_{i\ge p} H^{i,n-i}_t$ 为 Hodge 滤过。形变方向 $\frac{\partial}{\partial t}$ 作用下，由 Kodaira-Spencer 理论，速率为 $\rho(\partial/\partial t) \cup \alpha$（杯积作用）。因 $\rho \in H^1(\Theta)$ 的杯积降低全纯次数一位，故 $\frac{\partial}{\partial t} F^p \subseteq F^{p-1}$。$\blacksquare$

---

---

---

---

---
---

## 第218章：形变理论

形变理论（deformation theory）研究复流形在保持复解析结构前提下的连续变动，由 Kunihiko Kodaira 和 Donald Spencer 在 1950-1960 年代通过发展复结构的偏微分方程方法系统建立。核心问题是：给定一个紧复流形 $M$，其"近邻"有多少个不同的复结构？Kodaira-Spencer 映射将这一问题转化为上同调的计算：一阶无穷小形变由 $H^1(M, \Theta_M)$（全纯切丛的上同调）参数化，而形变的障碍（即无穷小形变是否能积分为真正的形变族）位于 $H^2(M, \Theta_M)$ 中。当 $H^2(M, \Theta_M) = 0$ 时，Kodaira 定理保证所有一阶形变都能积分——形变空间在该点是光滑的，且其局部维数等于 $h^1(M, \Theta_M)$。形变理论在代数几何和镜对称中的关键应用包括：Calabi-Yau 流形（第201章）的复结构模空间的维数计算（在天野-田刚-Yau 定理中 $\dim H^1(M, \Theta_M)$ 恰好是复结构模空间的维数），以及 Griffiths 周期映射通过 Hodge 结构（第199章）的形变来刻画模空间的几何。

### 180.1 无穷小形变

形变理论的基本思想是研究复流形在保持其复解析结构的前提下能如何连续变化。这一问题由 Kodaira 和 Spencer 在 1950-60 年代系统地转化为上同调计算——这是一个典型的将几何问题翻译为代数问题（层上同调）的范例。

**定义 180.1**（形变）：紧复流形 $M$ 的**形变**是光滑族 $\pi: \mathcal{M} \to B$（$B$ 是连通复流形），使得 $\pi^{-1}(0) = M$（$0 \in B$）。$M_t = \pi^{-1}(t)$ 是形变后的复流形。

**定义 180.2**（无穷小形变）：$M$ 的**无穷小形变**空间是 $H^1(M, \Theta_M)$，其中 $\Theta_M = \mathcal{O}(TM)$ 是全纯切丛的层。

**定理 180.1**（Kodaira-Spencer 映射）：设 $\pi: \mathcal{M} \to B$ 是 $M$ 的形变。则存在 Kodaira-Spencer 映射 $\rho: T_0 B \to H^1(M, \Theta_M)$，将形变方向映射到无穷小形变类。

**证明**：取切向量 $\partial/\partial t \in T_0B$。选择局部全纯坐标覆盖，转移函数 $f_{\alpha\beta}(z,t)$ 的导数 $\partial f_{\alpha\beta}/\partial t$ 定义 Cech 1-上闭链，值在 $\Theta_M$ 中。其上同调类 $\rho(\partial/\partial t) \in H^1(M,\Theta_M)$ 即 Kodaira-Spencer 类。不同坐标选取对应上边缘的改动。$\blacksquare$

### 180.2 阻碍与 Kuranishi 族

**定理 180.2**（Kodaira 阻碍定理）：形变存在阻碍，阻碍空间为 $H^2(M, \Theta_M)$。若 $H^2(M, \Theta_M) = 0$，则每个无穷小形变可积为真正的形变（$M$ 无阻碍）。

**证明**：给定 $\theta \in H^1(M,\Theta_M)$，逐阶构造形变的幂级数。一阶可积性由 $\bar{\partial}\theta=0$ 保证。二阶可积性要求 Maurer-Cartan 方程 $[\theta,\theta]=0 \in H^2(M,\Theta_M)$。一般地，第 $k$ 阶阻碍均落在 $H^2(M,\Theta_M)$ 中。若该空间为零，则所有阻碍消失，形变全局可积。$\blacksquare$

Kodaira 阻碍定理回答了无穷小形变何时可积的问题，但它仍然留下了一个更精细的问题：当 $H^2(M, \Theta_M) \neq 0$ 时，形变空间的局部结构是什么？Kuranishi 在 1965 年通过 Banach 尺度上的不动点定理给出了完整的刻画——形变空间在一个形式幂级数的零点附近被精确描述。

**定理 180.3**（Kuranishi 定理，1965）：紧复流形 $M$ 存在**半通用形变**（Kuranishi 族），其参数空间是 $H^1(M, \Theta_M)$ 在 $0$ 处的一个邻域中由 $H^2(M, \Theta_M)$ 定义的解析子集。即形变由

$$\mu: H^1(M, \Theta_M) \to H^2(M, \Theta_M), \quad \mu(\varphi) = [\varphi, \varphi]$$

的零点定义（Kuranishi 映射 $\mu$ 是二次的）。

**证明**：选取 Hermitian 度量，定义 $\bar{\partial}$ 的形式伴随 $\bar{\partial}^*$ 和 Green 算子 $G$。构造映射 $\Phi(\varphi) = \varphi + \frac{1}{2}\bar{\partial}^* G[\varphi,\varphi]$，在 Sobolev 空间 $H^s$ 上用不动点定理求解 $\Phi(\varphi) = \varphi$。解集 $\mu^{-1}(0)$ 为 $\varphi$ 满足 $\bar{\partial}\varphi + \frac{1}{2}[\varphi,\varphi] = 0$ 的正则化饱和条件。由椭圆正则性，解是光滑的，给出有限维半通用族。$\blacksquare$

### 180.3 形变量子化

**定义 180.3**（形变量子化）：形变量子化将光滑函数代数（Poisson 代数）形变为非交换代数。对辛流形 $(M, \omega)$，形变量子化是形式幂级数环 $\mathbb{C}[[\hbar]]$ 上的结合代数结构：

$$f \star g = fg + \frac{i\hbar}{2}\{f, g\} + \sum_{k \geq 2} \hbar^k B_k(f, g)$$

其中 $B_k$ 是双微分算子，$\star$ 满足结合律，且 $f \star g - g \star f = i\hbar\{f, g\} + O(\hbar^2)$。

**定理 180.4**（Kontsevich 形变量子化定理，1997）：任意 Poisson 流形上存在形变量子化。

**证明**：Kontsevich 构造星积 $f \star g = \sum_{n\ge 0} \frac{(i\hbar)^n}{n!} \sum_{\Gamma \in G_n} w_\Gamma B_\Gamma(f,g)$，其中 $G_n$ 是含 $n$ 个顶点的 Kontsevich 图，$w_\Gamma$ 是上半平面配置空间上的角度积分（Maurer-Cartan 形式），$B_\Gamma$ 是由 $\pi$（Poisson 双向量场）的多阶导数构成的多微分算子。结合性由 Stokes 定理和图的边收缩对应的边界项消去证明。这等价于形式性定理：多向量场的 $L_\infty$-代数形式等价于多微分算子的 $L_\infty$-代数。$\blacksquare$

---

---

---

---

---
---

## 第219章：Calabi-Yau 流形与镜对称

Calabi-Yau 流形是第一 Chern 类为零（$c_1(M) = 0$）的紧 Kahler 流形，其重要性在现代数学物理中无可替代。Calabi 在 1954 年的著名猜想——具有给定 Kahler 类和消失的第一 Chern 类的紧 Kahler 流形上，存在唯一的 Ricci 平坦 Kahler 度量——由丘成桐（Shing-Tung Yau）在 1976 年通过求解复 Monge-Ampere 方程严格证明，这是几何分析最辉煌的胜利之一，丘成桐也因此获得 1982 年菲尔兹奖。Yau 定理的直接推论是：所有 $c_1 = 0$ 的紧 Kahler 流形必定是 Ricci 平坦的，其 holonomy 群包含在 $SU(n)$ 中——这正是超弦理论中"紧化"所需的几何条件。在理论物理中，Calabi-Yau 三维流形（复三维，实六维）是超弦理论中隐藏的"额外维"的候选模型，而镜对称（mirror symmetry）则是 20 世纪 90 年代由 Candelas、Greene、Vafa、Kontsevich 等人发展的惊人发现：每对镜对称的 Calabi-Yau 流形 $(M, W)$ 满足 $h^{p,q}(M) = h^{n-p,q}(W)$，且 $M$ 上的 A-模型（Gromov-Witten 不变量）与 $W$ 上的 B-模型（变分复结构）完全等价。本章与前章（Hodge 理论第 199 章和形变理论第 200 章）密切呼应——镜对称以 Hodge 菱形和周期映射为基本工具展开。

### 181.1 Calabi 猜想与 Yau 定理

Calabi-Yau 流形在现代几何中占据核心地位，因为它们同时满足了代数几何、微分几何和数学物理三重视角下的极端条件：代数几何中 $c_1=0$ 意味着典范丛是平凡的，微分几何中这等价于存在 Ricci 平坦度量，而物理中这提供了超弦理论紧化所需的六维内部空间。Calabi 在 1954 年提出了一个大胆的猜想：在这些代数约束下，每个 Kähler 类中恰有一个 Ricci 平坦度量。Yau 在 1976 年通过求解复 Monge-Ampere 方程证明了这一猜想，标志着几何分析的顶峰成就之一。

**定义 181.1**（Calabi-Yau 流形）：紧 Kähler 流形 $M$ 称为 **Calabi-Yau 流形**，如果 $c_1(M) = 0$（在实上同调中）。等价地，$M$ 的典范丛 $K_M = \bigwedge^n T^*M$ 是平凡的。

**定理 181.1**（Calabi 猜想 / Yau 定理，1976-1978）：设 $M$ 是紧 Kähler 流形，$c_1(M) = 0$。则 $M$ 上存在唯一的 Ricci 平坦 Kähler 度量，其 Kähler 类等于任意给定的 Kähler 类。

*意义*：Yau 定理证明了 Calabi 猜想，是 20 世纪几何学最伟大的成就之一。它保证了 Calabi-Yau 流形上 Ricci 平坦 Kähler 度量的存在性，为弦论中的 Calabi-Yau 紧化提供了数学基础。Yau 因此获 Fields 奖（1982）。

**注 181.1**（Yau 定理的证明概要）：Yau 的证明将问题转化为求解复 Monge-Ampere 方程：给定 Kähler 形式 $\omega_0$ 和体积形式 $\Omega$（满足 $\int_M \Omega = \int_M \omega_0^n$），求 Kähler 势 $\varphi$ 使得 $(\omega_0 + i\partial\bar{\partial}\varphi)^n = \Omega$ 且 $\omega_0 + i\partial\bar{\partial}\varphi > 0$。这是一个完全非线性的椭圆 PDE。Yau 使用**连续性方法**：构造从 $\omega_0^n$ 到 $\Omega$ 的一族体积形式，证明解的集合既开又闭。开性由椭圆算子的可逆性保证；闭性需要建立解的 $C^0$、$C^2$ 和 $C^{2,\alpha}$ 先验估计。其中 $C^0$ 估计（即 $\varphi$ 的有界性）是最困难的一步，Yau 通过精巧的 Moser 迭代和极大值原理完成。该定理的直接推论是：当 $c_1(M) = 0$ 时，取 $\Omega$ 为零曲率体积形式，得到的 Kähler 度量满足 $\operatorname{Ric}(g) = 0$，即 Ricci 平坦。


**证明**：Calabi 猜想等价于求解复 Monge-Ampère 方程 $\det(g_{i\bar{\jmath}} + \partial_i\partial_{\bar{\jmath}}\varphi) = e^F \det(g_{i\bar{\jmath}})$，其中 $\varphi$ 是 Kähler 势、$F$ 由 Ricci 形式约束给定。Yau 通过连续性方法证明该方程的可解性：(1) 构造一族方程 $(\omega + i\partial\bar{\partial}\varphi_t)^n = e^{tF + c_t}\omega^n$（$t\in[0,1]$）；(2) $t=0$ 时 $\varphi_0=0$（平凡解）；(3) 用 $C^0$ 估计（Moser 迭代）、$C^2$ 估计（二阶导数 Laplacian 比较）和 Calabi 的第三估计（$C^3$ 估计）获得闭性；(4) 开性由线性化椭圆算子的可逆性得出（$\Delta + \text{低阶项}$ 的指标为零，核平凡）。连续性方法在 $t=1$ 给出 Ricci 平坦 Kähler 度量，其 Kähler 类等于原始类。唯一性由最大值原理保证。$\blacksquare$

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

**证明**：五次 3 维流形 $X$ 的镜 $X^\vee$ 的周期积分满足 Picard-Fuchs 微分方程。其解在极大单值点（大半径极限）附近的展开系数预言了有理曲线数 $n_d$。Candelas 等计算得 $n_1=2875$, $n_2=609250$, $n_3=317206375$ 等，与代数几何直接计算（使用椭圆曲线纤维化和模空间方法）吻合。$\blacksquare$

**定义 181.5**（Gromov-Witten 不变量）：$M$ 的 **Gromov-Witten 不变量**计算 $M$ 中给定亏格和同调类的全纯曲线的"虚拟"数目。它们是辛几何的不变量，在镜对称中对应 B-模型的周期积分。

**定理 181.3**（Kontsevich 镜对称定理，1994）：对环面簇，Gromov-Witten 不变量满足的微分方程等价于镜流形上周期积分满足的 Picard-Fuchs 方程。这给出了镜对称在环面簇情形下的精确表述。

**证明**：对光滑环面簇 $X$，Gromov-Witten 理论的基本对象是 $J$-函数（由稳定映射的模空间的拉回给出）。Kontsevich 证明 $J$-函数可表示为超几何级数，且满足的量子微分方程（$D$-模结构）与镜流形 $X^\vee$ 上的 GKZ 超几何系统一致。等价性通过比较 Monodromy 群和初始值验证。$\blacksquare$

### 181.4 SYZ 猜想

**定理 181.4**（Strominger-Yau-Zaslow 猜想，1996）：镜对称可以通过 Calabi-Yau 流形的 **T-对偶**实现：$M$ 和 $M^\vee$ 都是特殊 Lagrangian 3-环面 $T^3$ 的纤维丛（在奇异纤维的极限下），且彼此通过交换纤维与基实现镜对称。

**证明**：在大半径极限下，CY 3-流形 $M$ 退化为以 $B$ 为基、$T^3$ 为纤维的丛。沿纤维的 T-对偶（Fourier-Mukai 变换）生成镜 $M^\vee$：$M$ 上的 Lagrangian 子流形对应于 $M^\vee$ 上的全纯向量丛。Kontsevich-Soibelman 和 Gross-Siebert 通过热带几何和 log 结构的光滑化使该构造严格化。$\blacksquare$

SYZ 猜想将镜对称从代数几何的等价性转化为几何构造，是理解镜对称本质的关键框架。

---

*本卷建立了复几何的核心理论框架：复流形（近复结构、可积性、Dolbeault 上同调）将实微分几何推广到全纯范畴；Kähler 几何（Kähler 度量、Kähler 恒等式、Hodge 分解）是连接复结构、Riemann 度量和辛结构的典范框架；Hodge 理论（调和形式、Lefschetz 分解、Hodge 猜想）揭示了紧 Kähler 流形上同调的精细结构；形变理论（无穷小形变、Kuranishi 族）刻画了复结构的连续变化；Calabi-Yau 流形与镜对称（Yau 定理、镜对称）是复几何中最深刻的结果，连接了几何、代数、物理三大领域。复几何是当代数学几何化的核心语言。*

---

*本卷建立了复分析的完整理论框架：全纯函数与 Cauchy-Riemann 方程（Ch 73）是复分析的起点；复积分与 Cauchy 积分定理/公式（Ch 74）揭示了全纯函数的深层性质；级数展开与奇点分类（Ch 75）提供了分析工具；留数定理（Ch 76）实现了实积分的复计算；共形映射与 Riemann 映射定理（Ch 77）建立了区域间的解析对应；解析延拓与 Riemann 面（Ch 78）处理了多值性问题；Nevanlinna 值分布理论（Ch 90）量化了亚纯函数的取值行为；拟共形映射与 Teichmüller 空间（Ch 91）将共形几何推广至有界畸变；Siegel 区域与对称域（Ch 92）及多复变函数论（Ch 93-61）将理论推广至高维。补充内容涵盖了复几何（复流形、Kähler 几何、Hodge 理论、形变理论、Calabi-Yau 流形与镜对称），构成了复分析与微分几何的桥梁。*


*卷九：复分析终。*


*卷九：复分析终。*


*卷九：复分析终。*


*卷十一：复几何终。*

---

### 196.A 复流形补充
> 复几何是复分析和微分几何的交汇，研究复流形的几何结构。本部分作为复分析的几何补充，建立复流形、Kahler 几何、Hodge 理论、形变理论及 Calabi-Yau 流形与镜对称的系统理论。

复几何的核心特征在于复流形的"刚性"——与光滑流形不同，复流形上的全纯函数由极大值原理在紧流形上必然为常数，这使得复流形范畴中的对象比实流形范畴中的对象更加"刚性"。但同时，Kahler 条件又为复流形注入了足够的"柔性"——Kahler 度量与 Ricci 曲率之间的关系（通过 Ricci 形式）产生了丰富的 Hodge 理论结构。复几何与代数几何的关系由 Serre 的 GAGA 原理和 Kodaira 嵌入定理架起桥梁：紧复流形是射影代数的当且仅当它容许一个 Hodge 度量（即 Kahler 形式是整上同调类）。

---
## 第220章：复流形
复流形是局部同胚于 $\mathbb{C}^n$ 且转移函数为全纯的拓扑空间。复流形的研究是复几何的起点。

### 177.1 复流形的定义

复流形是微分几何与复分析交汇的核心概念，它将 $\mathbb{C}^n$ 中全纯函数的结构推广到具有全纯转移函数的拓扑空间。复流形最本质的特征在于：它不仅是一个光滑流形（实 $2n$ 维），而且其坐标卡之间的转移函数满足 Cauchy-Riemann 方程，即它们是全纯的。这一性质赋予了复流形极大的刚性——与光滑流形不同，紧复流形上的全纯函数由极大值原理必然为常数，这意味着复流形上的"函数"范畴比光滑流形上的"函数"范畴小得多。复流形的维数通常以复维数 $n$ 计，其对应的实维数为 $2n$。复流形的基本例子包括：$\mathbb{C}^n$ 本身、复射影空间 $\mathbb{CP}^n$（由 $\mathbb{C}^{n+1} \setminus \{0\}$ 在标量乘法下的商空间，全纯坐标卡由齐次坐标的仿射片给出）、复环面 $\mathbb{C}^n / \Lambda$（$\Lambda$ 为满秩格）、以及代数簇的光滑点集（Serre 的 GAGA 原理建立了复流形与代数簇之间的深刻联系）。复流形上的全纯映射 $f: M \to N$ 是满足局部坐标表示为全纯函数的映射，且全纯映射的复合仍为全纯。复流形范畴中，双全纯映射（全纯且逆也为全纯）对应于复流形的同构，而双全纯等价类是复几何中的基本分类问题。紧复流形的基本不变量包括 Hodge 数 $h^{p,q}$、Chern 数和 Kodaira 维数，后者是 Enriques-Kodaira 分类理论的核心。

**定义 177.1**（复流形）：$n$ 维**复流形** $M$ 是一个拓扑空间，带有复坐标卡 $\{(U_\alpha, \varphi_\alpha)\}$，其中 $\varphi_\alpha: U_\alpha \to \mathbb{C}^n$ 是同胚到 $\mathbb{C}^n$ 中开集，且转移函数 $\varphi_\alpha \circ \varphi_\beta^{-1}$ 在 $\varphi_\beta(U_\alpha \cap U_\beta)$ 上是全纯的。

**定义 177.2**（全纯函数与全纯映射）：$f: M \to \mathbb{C}$ 是**全纯**的，如果 $f \circ \varphi_\alpha^{-1}$ 在每个坐标卡上是全纯的。$f: M \to N$（$N$ 是复流形）是全纯的，如果局部坐标表示是全纯的。

**命题 177.1**（紧复流形上的全纯函数）：紧连通复流形上的全纯函数必为常数（极大值原理的推广）。这使复几何与实几何有本质区别。

**证明**：设 $f: M \to \mathbb{C}$ 全纯，$M$ 紧连通。则 $|f|: M \to \mathbb{R}$ 是连续的，在紧集上达到最大值。设 $|f(p)|$ 最大。取 $p$ 附近的坐标卡，在该局部坐标下 $f$ 是全纯函数。由极大值原理，$f$ 在 $p$ 的邻域中为常数。由连通性，$f$ 在整个 $M$ 上为常数。$\blacksquare$

### 177.2 近复结构与可积性

**定义 177.3**（近复结构）：实流形 $M$（$2n$ 维）上的**近复结构**是切丛 $TM$ 的自同态 $J: TM \to TM$，满足 $J^2 = -\operatorname{id}$。$J$ 赋予 $TM$ 复向量空间结构：$(a+ib) \cdot v = av + bJv$。

复化切丛 $TM \otimes \mathbb{C}$ 在 $J$ 作用下分解为 $\pm i$-特征空间：
$$TM \otimes \mathbb{C} = T^{1,0}M \oplus T^{0,1}M$$
其中 $T^{1,0}M = \{X - iJX : X \in TM\}$（全纯切空间），$T^{0,1}M = \{X + iJX : X \in TM\}$（反全纯切空间）。在局部坐标 $\{z_j = x_j + iy_j\}$ 下，$T^{1,0}M$ 由 $\partial/\partial z_j$ 张成，$T^{0,1}M$ 由 $\partial/\partial \bar{z}_j$ 张成。

**定义 177.4**（Nijenhuis 张量）：近复结构 $J$ 的 **Nijenhuis 张量**为

$$N_J(X, Y) = [X, Y] + J[JX, Y] + J[X, JY] - [JX, JY]$$

$N_J$ 衡量 $J$ 与 Lie 括号的不兼容性。$N_J$ 是 $(1,2)$-张量，且 $N_J(JX, Y) = N_J(X, JY) = -J N_J(X, Y)$。$N_J = 0$ 等价于 $T^{0,1}M$ 对 Lie 括号封闭（即 $[T^{0,1}, T^{0,1}] \subseteq T^{0,1}$），这是 Frobenius 可积性定理的条件。

**定理 177.1**（Newlander-Nirenberg 定理，1957）：近复结构 $J$ 来自复流形结构的充要条件是 $N_J \equiv 0$。此时 $J$ 称为**可积的**。

*意义*：该定理将复流形的存在性转化为近复结构的可积性条件，是复几何的核心定理。证明使用全纯坐标的构造（通过 $\bar{\partial}$-方程的可解性）。

**证明**：$N_J=0$ 等价于 $T^{1,0}M$ 对 Lie 括号封闭（Frobenius 定理的条件）。在局部坐标 $\{z_i = x_i + i y_i\}$ 中，需构造全纯坐标函数 $w_j$。Newlander 与 Nirenberg 证明可解性归结为 Cauchy-Riemann 方程 $\bar{\partial} w = 0$ 对非齐次项的估计，利用 $N_J=0$ 时 $\bar{\partial}^2=0$ 的形式可积性和 L^2-估计（或 Newton 迭代）得到收敛的全纯坐标。具体地，利用 $\bar{\partial}$-Neumann 问题和 Hormander 的 $L^2$ 估计，构造 $\bar{\partial}$-闭的 $(0,1)$-形式的解，从而得到全纯坐标函数。$\blacksquare$

**命题 177.2**（实二维情形）：任何 2 维可定向 Riemann 流形上的近复结构（由旋转 $90^\circ$ 定义）总是可积的。因此任何可定向 Riemann 曲面是复流形（1 维）。

**证明**：在实二维情形，$N_J$ 自动为零（因为 $N_J$ 的对称性导致维数约束）。任何可定向 Riemann 曲面可以通过等温坐标局部地赋予复坐标。$\blacksquare$

### 177.3 Dolbeault 上同调

**定义 177.5**（$(p, q)$-形式）：复流形 $M$ 上的**$(p, q)$-形式**是 $p$ 个全纯微分和 $q$ 个反全纯微分的外积。外微分 $d$ 分解为 $d = \partial + \bar{\partial}$，其中 $\partial$ 增加全纯次数，$\bar{\partial}$ 增加反全纯次数。具体地，
$$\partial = \sum_j dz_j \wedge \frac{\partial}{\partial z_j}, \quad \bar{\partial} = \sum_j d\bar{z}_j \wedge \frac{\partial}{\partial \bar{z}_j}$$

$\partial^2 = 0$，$\bar{\partial}^2 = 0$，$\partial \bar{\partial} + \bar{\partial} \partial = 0$（由 $d^2 = 0$ 和类型的分解唯一性）。

**定义 177.6**（Dolbeault 上同调）：$\bar{\partial}$-算子满足 $\bar{\partial}^2 = 0$，定义**Dolbeault 上同调群**：

$$H_{\bar{\partial}}^{p,q}(M) = \frac{\ker(\bar{\partial}: \Omega^{p,q} \to \Omega^{p,q+1})}{\operatorname{im}(\bar{\partial}: \Omega^{p,q-1} \to \Omega^{p,q})}$$

**定理 177.2**（Dolbeault 定理）：$H_{\bar{\partial}}^{p,q}(M) \cong H^q(M, \Omega^p)$，其中 $\Omega^p$ 是全纯 $p$-形式的层。Dolbeault 上同调是层上同调的具体实现。

**证明**：层 $\Omega^p$ 的 Dolbeault 分解 $0 \to \Omega^p \to \mathcal{A}^{p,0} \xrightarrow{\bar{\partial}} \mathcal{A}^{p,1} \xrightarrow{\bar{\partial}} \cdots$ 是 $\Omega^p$ 的精细消解（fine resolution），因为 $\mathcal{A}^{p,q}$ 是 $\bar{\partial}$-光滑形式层，即细层。由 Dolbeault-Grothendieck 引理（$\bar{\partial}$-Poincare 引理），此复形局部正合。层上同调的定义 $H^q(M, \Omega^p) = R^q\Gamma(M, \Omega^p)$ 即该消解的截面复形的上同调，即 $H_{\bar{\partial}}^{p,q}(M)$。$\blacksquare$

**定义 177.7**（Hodge 数）：$h^{p,q}(M) = \dim_{\mathbb{C}} H_{\bar{\partial}}^{p,q}(M)$。Hodge 数是复流形的基本数值不变量。

**定理 177.3（Serre 对偶）**：设 $M$ 是紧 $n$ 维复流形。则 $H^q(M, \Omega^p) \cong H^{n-q}(M, \Omega^{n-p})^*$（对偶空间）。特别地，$h^{p,q} = h^{n-p, n-q}$。

**证明**：Serre 对偶是凝聚层上同调的 Serre 对偶定理的特殊情形。对偶层 $\Omega^p$ 的 Serre 对偶为 $\Omega^{n-p}$（因为 $\Omega^n$ 是典范丛，$\Omega^p$ 与 $\Omega^{n-p}$ 的对偶由 $\wedge$ 配对给出）。利用层上同调的 Serre 对偶定理，得 $H^q(M, \Omega^p)^* \cong \operatorname{Ext}^{n-q}(\Omega^p, \Omega^n) \cong H^{n-q}(M, \Omega^{n-p})$。$\blacksquare$

---
## 第221章：Kahler 几何
Kahler 流形是同时具有 Riemann 度量、复结构和辛结构且三者兼容的流形。Kahler 几何是复几何的绝对核心。

### 178.1 Kahler 度量的定义

**定义 178.1**（Hermite 度量）：复流形 $M$ 上的 **Hermite 度量** $h$ 是每个切空间 $T_pM$（视为复向量空间）上的 Hermite 内积，光滑依赖于 $p$。分解为 $h = g - i\omega$，其中 $g = \operatorname{Re} h$ 是 Riemann 度量，$\omega = -\operatorname{Im} h$ 是实 $(1,1)$-形式。$g$ 和 $\omega$ 满足 $g(JX, JY) = g(X, Y)$ 和 $\omega(X, Y) = g(JX, Y)$。

**定义 178.2**（Kahler 度量）：Hermite 度量 $h$ 称为 **Kahler 度量**，如果相应的 $(1,1)$-形式 $\omega$ 是闭的：$d\omega = 0$。此时 $(M, h)$ 称为 **Kahler 流形**。

Kahler 条件等价于：复结构 $J$ 关于 $g$ 的 Levi-Civita 联络是平行的：$\nabla J = 0$。这一等价性揭示了 Kahler 条件的本质：复结构和 Riemann 度量在 Levi-Civita 平行移动下完全兼容。

**证明**（$\nabla J = 0 \iff d\omega = 0$）：$\omega(X, Y) = g(JX, Y)$。计算 $d\omega(X, Y, Z) = (\nabla_X \omega)(Y, Z) + (\nabla_Y \omega)(Z, X) + (\nabla_Z \omega)(X, Y)$（利用 $\nabla$ 无挠且度量相容）。$(\nabla_X \omega)(Y, Z) = g((\nabla_X J)Y, Z)$。故 $d\omega = 0$ 当且仅当 $\nabla_X J$ 满足某种循环对称性，这等价于 $\nabla J = 0$。$\blacksquare$

**命题 178.1**（Kahler 势）：在局部坐标下，Kahler 形式 $\omega$ 可写为

$$\omega = \frac{i}{2} \sum_{j,k} h_{j\bar{k}} dz_j \wedge d\bar{z}_k$$

其中 $h_{j\bar{k}} = \frac{\partial^2 \varphi}{\partial z_j \partial \bar{z}_k}$，$\varphi$ 是局部 **Kahler 势**。$d\omega = 0$ 自动满足。

Kahler 势的存在性体现了 Kahler 度量的一个关键特征：度量由单个实值函数 $\varphi$ 的二阶导数给出。在紧 Kahler 流形上，全局 Kahler 势的存在性等价于 $\omega$ 是恰当形式（即 $[\omega] = 0 \in H^2_{\text{dR}}(M)$），这通常不成立。但 $\partial \bar{\partial}$-引理保证了局部 Kahler 势的存在性，且 $\omega$ 的形变可由 $\varphi$ 的形变描述。

**经典 Kahler 流形的例子**：
- $\mathbb{C}^n$ 配以标准 Hermite 度量 $\omega = \frac{i}{2} \sum dz_j \wedge d\bar{z}_j$，Kahler 势 $\varphi = \frac{1}{2}\|z\|^2$
- $\mathbb{CP}^n$ 配以 **Fubini-Study 度量**：在齐次坐标 $[Z_0: \cdots : Z_n]$ 下，$\omega_{\text{FS}} = \frac{i}{2\pi} \partial \bar{\partial} \log \|Z\|^2$，Kahler 势 $\varphi = \log(1 + \|z\|^2)$（在仿射坐标片 $Z_0 = 1$ 上）
- 复环面 $\mathbb{C}^n/\Lambda$ 配以 $\mathbb{C}^n$ 上平移不变的 Kahler 度量
- 光滑射影代数簇（由 $\mathbb{CP}^n$ 的 Kahler 度量限制得到）

### 178.2 Kahler 恒等式

**定理 178.1**（Kahler 恒等式）：在 Kahler 流形上，Hodge 星算子 $\star$、$\partial$、$\bar{\partial}$ 及其伴随算子满足以下恒等式：

1. $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$（Laplacian 的一致性）
2. $[\Lambda, \bar{\partial}] = -i \partial^*$，$[\Lambda, \partial] = i \bar{\partial}^*$（其中 $\Lambda = L^*$ 是 $\omega \wedge$ 的伴随）
3. $[L, \bar{\partial}^*] = i \partial$，$[L, \partial^*] = -i \bar{\partial}$

其中 $L = \omega \wedge \cdot$ 是 Lefschetz 算子，$\Lambda$ 是其伴随。

这些恒等式是 Hodge 理论在 Kahler 流形上成立的核心技术原因。

**证明**：由 $\omega$ 的 Kahler 条件 $d\omega = 0$ 推出 $\partial$ 和 $\bar{\partial}$ 与 $L$ 的交换子关系。利用局部坐标中 $\omega = i\sum h_{ij} dz^i \wedge d\bar{z}^j$ 和 $h_{ij}$ 的 Kahler 势表达式，计算 $\partial^* = - \star \bar{\partial} \star$ 和 Lefschetz 算子 $L = \omega \wedge \cdot$ 及其伴随 $\Lambda = \star^{-1} L \star$ 的交换关系。初等的线性代数计算给出 $[\Lambda, \bar{\partial}] = -i\partial^*$ 和 $[L, \partial^*] = -i\bar{\partial}$。由这些恒等式和 $\Delta_d = d d^* + d^* d$ 的展开得 $\Delta_d = \Delta_\partial + \Delta_{\bar{\partial}} + \text{cross terms}$，交叉项由恒等式消去，故 $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$。$\blacksquare$

**定理 178.1.5（Lefschetz 分解定理）**：在紧 Kahler 流形 $M$（复 $n$ 维）上，Lefschetz 算子 $L^k: \bigwedge^{n-k} T^*M \to \bigwedge^{n+k} T^*M$ 诱导上同调层面的同构：
$$L^k: H^{n-k}_{\text{dR}}(M, \mathbb{C}) \xrightarrow{\cong} H^{n+k}_{\text{dR}}(M, \mathbb{C})$$
且 de Rham 上同调群有 **Lefschetz 分解**：
$$H^k_{\text{dR}}(M, \mathbb{C}) = \bigoplus_{j \geq \max(0, k-n)} L^j H^{k-2j}_{\text{prim}}(M, \mathbb{C})$$
其中 $H^r_{\text{prim}}(M, \mathbb{C}) = \ker(L^{n-r+1}: H^r \to H^{2n-r+2})$ 是**本原上同调**（primitive cohomology）。

**证明**：Lefschetz 分解的关键在于 $L$、$\Lambda$ 和 $H = [L, \Lambda]$（其中 $H$ 在 $(p,q)$-形式上作用为 $(p+q-n)$ 倍）满足 $\mathfrak{sl}(2,\mathbb{C})$ 的交换关系：$[H, L] = 2L$，$[H, \Lambda] = -2\Lambda$，$[L, \Lambda] = H$。de Rham 上同调群成为 $\mathfrak{sl}(2,\mathbb{C})$ 的有限维表示，由 $\mathfrak{sl}(2,\mathbb{C})$-表示论的完全可约性得到 Lefschetz 分解。$\blacksquare$

### 178.3 Hodge 分解定理

**定理 178.2**（Hodge 分解定理，Kahler 情形）：紧 Kahler 流形 $M$ 上的 de Rham 上同调（复系数）分解为

$$H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$$

且满足 $H_{\bar{\partial}}^{p,q}(M) \cong \overline{H_{\bar{\partial}}^{q,p}(M)}$（复共轭对称）。

**证明**：由 Kahler 恒等式（定理 178.1），$\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$，故 $\Delta_d$-调和形式与 $\Delta_{\bar{\partial}}$-调和形式一致。对 $\Delta_d$ 应用标准 Hodge 定理：紧 Riemann 流形上每个 de Rham 上同调类有唯一 $\Delta_d$-调和代表元。任取 $[\omega] \in H^k_{\text{dR}}(M, \mathbb{C})$，其调和代表元 $\alpha \in \ker \Delta_d$ 可按 $(p,q)$ 类型分解为 $\alpha = \sum_{p+q=k} \alpha^{p,q}$。因 $\Delta_d = 2\Delta_{\bar{\partial}}$，$\Delta_d \alpha = 0$ 推出 $\Delta_{\bar{\partial}} \alpha^{p,q} = 0$（各 $(p,q)$ 分量独立），故每个 $\alpha^{p,q}$ 是 $\bar{\partial}$-调和形式，对应 Dolbeault 上同调类 $[\alpha^{p,q}] \in H_{\bar{\partial}}^{p,q}(M)$。该分配是良定义的：若另一调和代表元 $\beta$ 满足 $\alpha - \beta = d\gamma$，由 Kahler 恒等式得 $\alpha^{p,q} - \beta^{p,q} = \bar{\partial} \eta^{p,q-1}$，故 $[\alpha^{p,q}] = [\beta^{p,q}]$。逆映射将 $\bar{\partial}$-调和类求和即得。这给出同构 $H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$。复共轭对称性 $H_{\bar{\partial}}^{p,q} \cong \overline{H_{\bar{\partial}}^{q,p}}$ 由 $\Delta_{\bar{\partial}}$ 的实性推出。$\blacksquare$

**推论 178.3**（Hodge 数的对称性）：$h^{p,q} = h^{q,p} = h^{n-p,n-q} = h^{n-q,n-p}$。

**推论 178.4**（Betti 数的奇偶性约束）：紧 Kahler 流形的奇数阶 Betti 数 $b_{2k+1}$ 为偶数。

**证明**：$b_{2k+1} = \sum_{p+q=2k+1} h^{p,q}$。由 $h^{p,q} = h^{q,p}$，$h^{p,q} + h^{q,p} = 2h^{p,q}$ 是偶数，而 $p = q$ 时 $p+q = 2p$ 是偶数，不可能等于 $2k+1$。故 $b_{2k+1}$ 是偶数。$\blacksquare$

### 178.4 Calabi 猜想与 Yau 定理

**定理 178.5（Calabi-Yau 定理，Yau, 1978）**：设 $(M, \omega)$ 是紧 Kahler 流形，$R$ 是任意表示 $c_1(M)$ 的实 $(1,1)$-形式。则存在唯一的 Kahler 度量 $\tilde{\omega} \in [\omega]$（同一 Kahler 类中），其 Ricci 形式 $\rho(\tilde{\omega}) = R$。

特别地，若 $c_1(M) = 0$，则 $M$ 容许唯一的 Ricci 平坦 Kahler 度量（在每个 Kahler 类中）。这样的流形称为 **Calabi-Yau 流形**。

**证明**（框架）：Calabi 猜想等价于求解复 Monge-Ampere 方程：
$$\frac{(\omega + i\partial \bar{\partial} \varphi)^n}{\omega^n} = e^F, \quad \omega + i\partial \bar{\partial} \varphi > 0$$
其中 $F$ 由 $R - \rho(\omega) = i\partial \bar{\partial} F$ 确定。Yau 使用连续性方法：构造一族方程 $\frac{(\omega + i\partial \bar{\partial} \varphi_t)^n}{\omega^n} = e^{tF + c_t}$（$t \in [0,1]$），并证明 $t=1$ 时可解。关键步骤是建立 $\varphi$ 的 $C^0$ 估计（通过 Moser 迭代和 Sobolev 不等式）、$C^2$ 估计（通过 Calabi 的第三阶估计技巧）和 $C^{2,\alpha}$ 估计（通过 Evans-Krylov 理论或 Calabi 的 $C^3$ 估计）。$\blacksquare$

Yau 定理是复几何和 Kahler 几何中最深刻的定理之一，其直接推论包括：$K3$ 曲面存在 Ricci 平坦 Kahler 度量（从而 $K3$ 曲面是超 Kahler 流形），以及任意次数的 Calabi-Yau 三维流形（如 $\mathbb{CP}^4$ 中的五次超曲面）的 Ricci 平坦 Kahler 度量的存在性。这些结果在弦理论（超弦紧化需要 Calabi-Yau 三维流形）和镜对称（mirror symmetry）中具有根本重要性。

### 178.5 Chern 类与 Chern-Weil 理论

**定义 178.6**（Chern 类，复几何视角）：复向量丛 $E \to M$ 的**第 $k$ 个 Chern 类** $c_k(E) \in H^{2k}(M, \mathbb{Z})$ 由曲率形式 $\Omega$ 通过

$$\det\left(I + \frac{i}{2\pi} \Omega\right) = 1 + c_1(E) + c_2(E) + \cdots$$

定义。对复流形 $M$，$c_k(M) = c_k(TM)$。

**定理 178.7**（Chern-Weil 理论）：Chern 类在 de Rham 上同调中不依赖于联络的选择，且是复流形的微分同胚不变量。

**证明**：设 $\nabla_0$ 和 $\nabla_1$ 是同一向量丛上的两个联络，定义插值联络 $\nabla_t = (1-t)\nabla_0 + t\nabla_1$。其曲率形式 $\Omega_t$ 满足 $\frac{d}{dt}c_k(\Omega_t) = d(\text{transgression form})$（通过 Chern-Simons 形式）。对 $t$ 从 $0$ 到 $1$ 积分，得 $c_k(\Omega_1) - c_k(\Omega_0) = d(\int_0^1 \Phi_t dt)$，即差一个恰当形式，故 de Rham 类相同。微分同胚不变性来自光滑函子性。$\blacksquare$

**定义 178.8**（Chern 数）：紧复 $n$ 维流形 $M$ 的 **Chern 数**是 $\int_M c_{i_1}(M) \wedge \cdots \wedge c_{i_k}(M)$，其中 $\sum i_j = n$。

**定理 178.9（Kodaira 嵌入定理）**：紧复流形 $M$ 是射影代数的（即可嵌入复射影空间）当且仅当 $M$ 容许一个 Hodge 度量——即 Kahler 形式 $\omega$ 是整上同调类（$[\omega] \in H^2(M, \mathbb{Z})$）。

**证明**（框架）：若 $M$ 是射影代数簇，则 $\mathbb{CP}^N$ 的 Fubini-Study 度量的限制给出 Hodge 度量。反之，若 $M$ 有 Hodge 度量 $\omega$，则 $\omega$ 对应全纯线丛 $L \to M$（$c_1(L) = [\omega]$）。$L$ 是正线丛（因为 $\omega$ 是 Kahler 形式），由 Kodaira 消没定理，$L^{\otimes k}$ 的整体截面在 $k$ 充分大时分离点和切方向，从而给出嵌入 $M \hookrightarrow \mathbb{P}(H^0(M, L^{\otimes k})^*)$。$\blacksquare$

**定理 178.10（Kodaira 消没定理）**：设 $M$ 是紧 Kahler 流形，$L \to M$ 是正全纯线丛。则 $H^q(M, \Omega^n(L)) = 0$ 对所有 $q > 0$。等价地，$H^q(M, K_M \otimes L) = 0$（$q > 0$），其中 $K_M = \Omega^n$ 是典范丛。

**证明**：Kodaira 消没定理的证明使用 Bochner 技巧。正线丛 $L$ 的曲率形式 $\Theta(L)$ 是 Kahler 形式（至多差常数），利用 Weitzenbock 公式和 Hodge 定理，$\bar{\partial}$-Laplacian 与曲率项的关系给出 $\Delta_{\bar{\partial}} \alpha = 0$ 推出 $\alpha = 0$（对 $\alpha \in \Omega^{n,q}(L)$ 且 $q > 0$）。$\blacksquare$

Kodaira 消没定理是复几何中最重要的消没定理之一，它与 Hodge 分解定理、Kodaira 嵌入定理和 Kodaira-Spencer 形变理论一起构成了复几何的四大支柱。在代数几何中，Kodaira 消没定理的代数版本（Kawamata-Viehweg 消没定理）通过正特征约化方法得到推广，成为极小模型纲领（MMP）的核心技术工具。
