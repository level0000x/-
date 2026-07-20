## 第196章（补充）
> 复几何是复分析和微分几何的交汇，研究复流形的几何结构。本部分作为复分析的几何补充，建立复流形、Kähler 几何、Hodge 理论、形变理论及 Calabi-Yau 流形与镜对称的系统理论。

---

---

---

---
---

## 第197章：复流形
复流形是局部同胚于 $\mathbb{C}^n$ 且转移函数为全纯的拓扑空间。复流形的研究是复几何的起点。

### 177.1 复流形的定义

**定义 177.1**（复流形）：$n$ 维**复流形** $M$ 是一个拓扑空间，带有复坐标卡 $\{(U_\alpha, \varphi_\alpha)\}$，其中 $\varphi_\alpha: U_\alpha \to \mathbb{C}^n$ 是同胚到 $\mathbb{C}^n$ 中开集，且转移函数 $\varphi_\alpha \circ \varphi_\beta^{-1}$ 在 $\varphi_\beta(U_\alpha \cap U_\beta)$ 上是全纯的。

**定义 177.2**（全纯函数与全纯映射）：$f: M \to \mathbb{C}$ 是**全纯**的，如果 $f \circ \varphi_\alpha^{-1}$ 在每个坐标卡上是全纯的。$f: M \to N$（$N$ 是复流形）是全纯的，如果局部坐标表示是全纯的。

**命题 177.1**（紧复流形上的全纯函数）：紧连通复流形上的全纯函数必为常数（极大值原理的推广）。这使复几何与实几何有本质区别。

### 177.2 近复结构与可积性

**定义 177.3**（近复结构）：实流形 $M$（$2n$ 维）上的**近复结构**是切丛 $TM$ 的自同态 $J: TM \to TM$，满足 $J^2 = -\operatorname{id}$。$J$ 赋予 $TM$ 复向量空间结构。

**定义 177.4**（Nijenhuis 张量）：近复结构 $J$ 的 **Nijenhuis 张量**为

$$N_J(X, Y) = [X, Y] + J[JX, Y] + J[X, JY] - [JX, JY]$$

$N_J$ 衡量 $J$ 与 Lie 括号的不兼容性。

**定理 177.1**（Newlander-Nirenberg 定理，1957）：近复结构 $J$ 来自复流形结构的充要条件是 $N_J \equiv 0$。此时 $J$ 称为**可积的**。

*意义*：该定理将复流形的存在性转化为近复结构的可积性条件，是复几何的核心定理。证明使用全纯坐标的构造（通过 $\bar{\partial}$-方程的可解性）。

**证明**：$N_J=0$ 等价于 $T^{1,0}M$ 对 Lie 括号封闭（Frobenius 定理的条件）。在局部坐标 $\{z_i = x_i + i y_i\}$ 中，需构造全纯坐标函数 $w_j$。Newlander 与 Nirenberg 证明可解性归结为 Cauchy-Riemann 方程 $\bar{\partial} w = 0$ 对非齐次项的估计，利用 $N_J=0$ 时 $\bar{\partial}^2=0$ 的形式可积性和 L^2-估计（或 Newton 迭代）得到收敛的全纯坐标。$\blacksquare$

**命题 177.2**（实二维情形）：任何 2 维可定向 Riemann 流形上的近复结构（由旋转 $90^\circ$ 定义）总是可积的。因此任何可定向 Riemann 曲面是复流形（1 维）。

### 177.3 Dolbeault 上同调

**定义 177.5**（$(p, q)$-形式）：复流形 $M$ 上的**$(p, q)$-形式**是 $p$ 个全纯微分和 $q$ 个反全纯微分的外积。外微分 $d$ 分解为 $d = \partial + \bar{\partial}$，其中 $\partial$ 增加全纯次数，$\bar{\partial}$ 增加反全纯次数。

**定义 177.6**（Dolbeault 上同调）：$\bar{\partial}$-算子满足 $\bar{\partial}^2 = 0$，定义**Dolbeault 上同调群**：

$$H_{\bar{\partial}}^{p,q}(M) = \frac{\ker(\bar{\partial}: \Omega^{p,q} \to \Omega^{p,q+1})}{\operatorname{im}(\bar{\partial}: \Omega^{p,q-1} \to \Omega^{p,q})}$$

**定理 177.2**（Dolbeault 定理）：$H_{\bar{\partial}}^{p,q}(M) \cong H^q(M, \Omega^p)$，其中 $\Omega^p$ 是全纯 $p$-形式的层。Dolbeault 上同调是层上同调的具体实现。

**证明**：层 $\Omega^p$ 的 Dolbeault 分解 $0 \to \Omega^p \to \mathcal{A}^{p,0} \xrightarrow{\bar{\partial}} \mathcal{A}^{p,1} \xrightarrow{\bar{\partial}} \cdots$ 是 $\Omega^p$ 的精细消解（fine resolution），因为 $\mathcal{A}^{p,q}$ 是 $\bar{\partial}$-光滑形式层，即细层。由 Dolbeault-Grothendieck 引理（$\bar{\partial}$-Poincaré 引理），此复形局部正合。层上同调的定义 $H^q(M, \Omega^p) = R^q\Gamma(M, \Omega^p)$ 即该消解的截面复形的上同调，即 $H_{\bar{\partial}}^{p,q}(M)$。$\blacksquare$

**定义 177.7**（Hodge 数）：$h^{p,q}(M) = \dim_{\mathbb{C}} H_{\bar{\partial}}^{p,q}(M)$。Hodge 数是复流形的基本数值不变量。

---

---

---

---

---
---

## 第198章：Kähler 几何
Kähler 流形是同时具有 Riemann 度量、复结构和辛结构且三者兼容的流形。Kähler 几何是复几何的绝对核心。

### 178.1 Kähler 度量的定义

**定义 178.1**（Hermite 度量）：复流形 $M$ 上的 **Hermite 度量** $h$ 是每个切空间 $T_pM$（视为复向量空间）上的 Hermite 内积，光滑依赖于 $p$。分解为 $h = g - i\omega$，其中 $g = \operatorname{Re} h$ 是 Riemann 度量，$\omega = -\operatorname{Im} h$ 是实 2-形式。

**定义 178.2**（Kähler 度量）：Hermite 度量 $h$ 称为 **Kähler 度量**，如果相应的 $(1,1)$-形式 $\omega$ 是闭的：$d\omega = 0$。此时 $(M, h)$ 称为 **Kähler 流形**。

Kähler 条件等价于：复结构 $J$ 关于 $g$ 的 Levi-Civita 联络是平行的：$\nabla J = 0$。

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

**证明**：由 $\omega$ 的 Kähler 条件 $d\omega = 0$ 推出 $\partial$ 和 $\bar{\partial}$ 与 $L$ 的交换子关系。利用局部坐标中 $\omega = i\sum h_{ij} dz^i \wedge d\bar{z}^j$ 和 $h_{ij}$ 的 Kähler 势表达式，计算 $\partial^* = - \star \bar{\partial} \star$ 和 Lefschetz 算子 $L = \omega \wedge \cdot$ 及其伴随 $\Lambda = \star^{-1} L \star$ 的交换关系。初等的线性代数计算给出 $[\Lambda, \bar{\partial}] = -i\partial^*$ 和 $[L, \partial^*] = -i\bar{\partial}$。由这些恒等式和 $\Delta_d = d d^* + d^* d$ 的展开得 $\Delta_d = \Delta_\partial + \Delta_{\bar{\partial}} + \text{cross terms}$，交叉项由恒等式消去，故 $\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$。$\blacksquare$

### 178.3 Hodge 分解定理

**定理 178.2**（Hodge 分解定理，Kähler 情形）：紧 Kähler 流形 $M$ 上的 de Rham 上同调（复系数）分解为

$$H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$$

且满足 $H_{\bar{\partial}}^{p,q}(M) \cong \overline{H_{\bar{\partial}}^{q,p}(M)}$（复共轭对称）。

**证明**：由 Kähler 恒等式（定理 178.1），$\Delta_d = 2\Delta_\partial = 2\Delta_{\bar{\partial}}$，故 $\Delta_d$-调和形式与 $\Delta_{\bar{\partial}}$-调和形式一致。对 $\Delta_d$ 应用标准 Hodge 定理：紧 Riemann 流形上每个 de Rham 上同调类有唯一 $\Delta_d$-调和代表元。任取 $[\omega] \in H^k_{\text{dR}}(M, \mathbb{C})$，其调和代表元 $\alpha \in \ker \Delta_d$ 可按 $(p,q)$ 类型分解为 $\alpha = \sum_{p+q=k} \alpha^{p,q}$。因 $\Delta_d = 2\Delta_{\bar{\partial}}$，$\Delta_d \alpha = 0$ 推出 $\Delta_{\bar{\partial}} \alpha^{p,q} = 0$（各 $(p,q)$ 分量独立），故每个 $\alpha^{p,q}$ 是 $\bar{\partial}$-调和形式，对应 Dolbeault 上同调类 $[\alpha^{p,q}] \in H_{\bar{\partial}}^{p,q}(M)$。该分配是良定义的：若另一调和代表元 $\beta$ 满足 $\alpha - \beta = d\gamma$，由 Kähler 恒等式得 $\alpha^{p,q} - \beta^{p,q} = \bar{\partial} \eta^{p,q-1}$，故 $[\alpha^{p,q}] = [\beta^{p,q}]$。逆映射将 $\bar{\partial}$-调和类求和即得。这给出同构 $H^k_{\text{dR}}(M, \mathbb{C}) \cong \bigoplus_{p+q=k} H_{\bar{\partial}}^{p,q}(M)$。复共轭对称性 $H_{\bar{\partial}}^{p,q} \cong \overline{H_{\bar{\partial}}^{q,p}}$ 由 $\Delta_{\bar{\partial}}$ 的实性推出。$\blacksquare$

**推论 178.3**（Hodge 数的对称性）：$h^{p,q} = h^{q,p} = h^{n-p,n-q} = h^{n-q,n-p}$。

**推论 178.4**（Betti 数的奇偶性约束）：紧 Kähler 流形的奇数阶 Betti 数 $b_{2k+1}$ 为偶数。

### 178.4 Chern 类与 Chern-Weil 理论

**定义 178.3**（Chern 类，复几何视角）：复向量丛 $E \to M$ 的**第 $k$ 个 Chern 类** $c_k(E) \in H^{2k}(M, \mathbb{Z})$ 由曲率形式 $\Omega$ 通过

$$\det\left(I + \frac{i}{2\pi} \Omega\right) = 1 + c_1(E) + c_2(E) + \cdots$$

定义。对复流形 $M$，$c_k(M) = c_k(TM)$。

**定理 178.5**（Chern-Weil 理论）：Chern 类在 de Rham 上同调中不依赖于联络的选择，且是复流形的微分同胚不变量。

**证明**：设 $\nabla_0$ 和 $\nabla_1$ 是同一向量丛上的两个联络，定义插值联络 $\nabla_t = (1-t)\nabla_0 + t\nabla_1$。其曲率形式 $\Omega_t$ 满足 $\frac{d}{dt}c_k(\Omega_t) = d(\text{transgression form})$（通过 Chern-Simons 形式）。对 $t$ 从 $0$ 到 $1$ 积分，得 $c_k(\Omega_1) - c_k(\Omega_0) = d(\int_0^1 \Phi_t dt)$，即差一个恰当形式，故 de Rham 类相同。微分同胚不变性来自光滑函子性。$\blacksquare$

**定义 178.4**（Chern 数）：紧复 $n$ 维流形 $M$ 的 **Chern 数**是 $\int_M c_{i_1}(M) \wedge \cdots \wedge c_{i_k}(M)$，其中 $\sum i_j = n$。

---

---

---

---

---