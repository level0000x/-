## 第112章：Borel-Weil-Bott 定理

Borel-Weil-Bott 定理是李理论表示论中最辉煌的几何实现定理之一，它将紧 Lie 群的不可约表示实现为旗簇 $G/B$ 上齐性线丛的全纯截面。这一定理的历史可追溯至 Borel 和 Weil 在 1954 年的开创性工作，他们证明了紧半单 Lie 群 $G$ 的每个支配整权 $\lambda \in \Lambda^+$ 对应的不可约表示 $V_\lambda$ 同构于 $G/B$ 上线丛 $\mathcal{L}_\lambda$ 的整体截面空间 $H^0(G/B, \mathcal{L}_\lambda)$。Raoul Bott 于 1957 年将这一结果推广为完整的 Bott-Borel-Weil 定理，精确计算了所有线丛 $\mathcal{L}_\lambda$（$\lambda \in \Lambda$）的层上同调 $H^i(G/B, \mathcal{L}_\lambda)$——它们要么为零，要么同构于某个支配权对应的不可约表示。

Borel-Weil-Bott 定理的几何意义深远：它将李代数的纯代数表示论转化为复几何和代数几何的问题。具体而言，旗簇 $G/B$ 是紧半单 Lie 群 $G$ 的完备齐性空间，其上的齐性线丛 $\mathcal{L}_\lambda$ 由权 $\lambda$ 参数化。当 $\lambda$ 是支配整权时，$\mathcal{L}_\lambda$ 是丰沛线丛，其整体截面空间 $H^0$ 就是 $V_\lambda$，而高阶上同调 $H^{>0}$ 全部消失（Kempf 消没定理）。当 $\lambda$ 不是支配权时，截面空间 $H^0$ 为零，但高阶上同调 $H^i$ 可能非零，且 Bott 定理精确地告诉我们在哪个 $i = \ell(w)$ 处非零（其中 $w$ 是使得 $w \bullet \lambda = w(\lambda + \rho) - \rho$ 为支配权的唯一 Weyl 群元素），且该非零上同调群同构于 $V_{w \bullet \lambda}$。

Bott-Borel-Weil 定理的证明结合了代数几何（Schubert 胞腔的层上同调）、表示论（Demazure 算符）和微分几何（等变 K-理论）三种工具。Schubert 胞腔分层将 $G/B$ 分解为仿射空间 $\mathbb{C}^{\ell(w)}$ 的并，将层上同调的计算归约为组合问题。Demazure 算符 $D_\alpha$ 则捕捉了 $\mathbb{P}^1$-纤维化 $\pi_\alpha: G/B \to G/P_\alpha$ 上同调的递归行为。Weyl 特征公式作为 Euler-Poincare 特征公式的推论自然得出，而 Borel-Weil 定理自身则作为 Bott 定理在 $\lambda$ 支配时的特例。本章将系统介绍旗簇的几何、齐性线丛的构造、Borel-Weil 定理、Bott-Borel-Weil 定理及其与 Weyl 特征公式的联系，为几何表示论（卷十六）和等变 K-理论（卷二十）奠定基础。

**定义 87.1**（旗簇）：设 $G$ 为 $\mathbb{C}$ 上的连通半单代数群，$B \subset G$ 为 Borel 子群（极大连通可解子群），$T \subset B$ 为极大环面。**旗簇**（flag variety）定义为完备齐性空间
$$\mathcal{B} = G/B$$
$\mathcal{B}$ 为光滑射影簇，维数 $\dim \mathcal{B} = |\Phi^+|$（正根的个数）。$G$ 通过左平移传递作用于 $\mathcal{B}$。基本例子：$G = GL_n(\mathbb{C})$ 时，$\mathcal{B}$ 同构于 $\mathbb{C}^n$ 中全体完全旗 $\{0\} = V_0 \subset V_1 \subset \cdots \subset V_n = \mathbb{C}^n$（$\dim_{\mathbb{C}} V_i = i$）构成的空间。

**定义 87.2**（权与特征）：权格为 $\Lambda = \operatorname{Hom}_{\text{alg}}(T, \mathbb{C}^\times)$。Borel 子群 $B$ 决定了正根集 $\Phi^+ \subset \Phi$。**支配整权**集为
$$\Lambda^+ = \{\lambda \in \Lambda : \langle \lambda, \alpha^\vee \rangle \geq 0,\ \forall \alpha \in \Phi^+\}$$
$\rho = \frac{1}{2} \sum_{\alpha \in \Phi^+} \alpha$ 为全部正根之和的一半。

**定义 87.3**（齐性线丛）：对每个权 $\lambda \in \Lambda$，定义一维系数的 $B$-模 $\mathbb{C}_\lambda$：$b \in B$ 通过投射 $B \twoheadrightarrow B/U \cong T$ 后以特征 $\lambda$ 作用于 $\mathbb{C}$。定义 $G/B$ 上的**齐性线丛**为均衡积
$$\mathcal{L}_\lambda = G \times_B \mathbb{C}_\lambda \longrightarrow G/B,\quad (g, z) \sim (gb, \lambda(b)^{-1} z)$$
投影映射为 $(g, z) \mapsto gB$。$\mathcal{L}_\lambda$ 是 $G/B$ 上的 $G$-等变全纯线丛。当 $\lambda \in \Lambda^+$ 时，$\mathcal{L}_\lambda$ 为丰沛线丛（ample line bundle）。

### 87.2 Borel-Weil 定理

**定理 87.1**（Borel-Weil，1954）：设 $\lambda \in \Lambda^+$ 为支配整权。则整体截面空间 $H^0(G/B, \mathcal{L}_\lambda)$ 作为 $G$-模同构于最高权为 $\lambda$ 的不可约有限维表示 $V_\lambda$：
$$H^0(G/B, \mathcal{L}_\lambda) \cong V_\lambda$$
若 $\lambda \notin \Lambda^+$（非支配权），则 $H^0(G/B, \mathcal{L}_\lambda) = 0$。

**证明**：利用 $G$ 的 Bruhat 分解 $G = \bigsqcup_{w \in W} BwB$，其中 $W = N_G(T)/T$ 为 Weyl 群。$G/B$ 分解为 $B$-轨道的并（Schubert 胞腔），每个 $\mathcal{O}_w = BwB/B \cong \mathbb{C}^{\ell(w)}$ 为仿射空间。截面 $s \in H^0(G/B, \mathcal{L}_\lambda)$ 对应于全纯函数 $\varphi: G \to \mathbb{C}$ 满足 $\varphi(gb) = \lambda(b)^{-1} \varphi(g)$（对 $b \in B$）。由 Borel 不动点定理，$G$ 在 $H^0$ 上的作用诱导 $G$-模结构。设 $\lambda \in \Lambda^+$ 为支配整权，则存在最高权向量 $v_\lambda \in V_\lambda$。由 Peter-Weyl 定理，$H^0(G/B, \mathcal{L}_\lambda)$ 分解为 $G$-不可约模的直和。由 Bruhat 分解，$H^0$ 中最高权向量在 $G$ 作用下生成的子模恰为 $V_\lambda$。若 $\lambda \notin \Lambda^+$，则 $\mathcal{L}_\lambda$ 无整体截面（因 $B$ 在纤维上的作用非支配），故 $H^0 = 0$。$\blacksquare$

**定理 87.2**（Borel-Weil 与 Weyl 特征公式）：作为 Euler-Poincaré 特征，
$$\chi(G/B, \mathcal{L}_\lambda) = \frac{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\lambda+\rho)}}{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\rho)}} = \operatorname{ch} V_\lambda$$

**证明**：由 Borel-Weil 定理，$H^0(G/B, \mathcal{L}_\lambda) \cong V_\lambda$（$\lambda \in \Lambda^+$）且由 Kempf 消没定理，$H^{>0}(G/B, \mathcal{L}_\lambda) = 0$。故对支配权 $\lambda$，Euler-Poincare 特征 $\chi(G/B, \mathcal{L}_\lambda) = \operatorname{ch} H^0 = \operatorname{ch} V_\lambda$。另一方面，由 Atiyah-Bott 不动点公式应用于极大环面 $T$ 在 $G/B$ 上的作用，$T$-等变 $K$-理论给出 $\chi(G/B, \mathcal{L}_\lambda) = \sum_{w \in W} (-1)^{\ell(w)} e^{w(\lambda+\rho)} / \prod_{\alpha \in \Phi^+} (e^{\alpha/2} - e^{-\alpha/2})$。分母由 Weyl 分母公式 $\prod_{\alpha \in \Phi^+} (e^{\alpha/2} - e^{-\alpha/2}) = e^{-\rho} \sum_{w \in W} (-1)^{\ell(w)} e^{w(\rho)}$ 化简，即得 Weyl 特征公式。$\blacksquare$

### 87.3 Bott-Borel-Weil 定理

**定义 87.4**（Weyl 群的点作用）：对 $w \in W$ 和 $\lambda \in \Lambda$，定义平移 Weyl 群作用（点作用）
$$w \bullet \lambda = w(\lambda + \rho) - \rho$$
权 $\lambda$ 称为**正则**的，若对所有 $\alpha \in \Phi$，$\langle \lambda + \rho, \alpha^\vee \rangle \neq 0$（即 $\lambda + \rho$ 不落在任何 Weyl 腔的壁上）。$\lambda$ 称为**奇异**的，若存在 $\alpha$ 使得 $\langle \lambda + \rho, \alpha^\vee \rangle = 0$。

**定理 87.3**（Bott-Borel-Weil，Bott 1957）：设 $\lambda \in \Lambda$。

1. 若 $\lambda + \rho$ 为正则的，则存在唯一的 $w \in W$ 使得 $w \bullet \lambda \in \Lambda^+$（支配），且
$$H^i(G/B, \mathcal{L}_\lambda) \cong \begin{cases}
V_{w \bullet \lambda} & \text{若 } i = \ell(w) \\
0 & \text{若 } i \neq \ell(w)
\end{cases}$$

2. 若 $\lambda + \rho$ 为奇异的，则对所有 $i \geq 0$，$H^i(G/B, \mathcal{L}_\lambda) = 0$。

**证明**：证明基于三个关键技术。

（i）Schubert 胞腔的层上同调：将 $G/B$ 按 Schubert 胞腔 $\mathcal{O}_w$ 分层。对每个 Schubert 簇 $X_w = \overline{\mathcal{O}_w}$，考虑闭嵌入 $i_w: X_w \hookrightarrow G/B$ 和开嵌入 $j_w: \mathcal{O}_w \hookrightarrow X_w$。由局部上同调长正合列，$H^i(X_w, \mathcal{L}_\lambda|_{X_w})$ 可通过 $H^i(\mathcal{O}_w, \mathcal{L}_\lambda|_{\mathcal{O}_w})$ 和 $H^i(X_{v < w}, \mathcal{L}_\lambda|_{X_{v < w}})$ 归约计算。$\mathcal{O}_w \cong \mathbb{C}^{\ell(w)}$ 为仿射空间，其上的线丛上同调由 Borel-Weil-Bott 的局部版本计算。

（ii）Demazure 算符：对每个单根 $\alpha \in \Delta$，定义 Demazure 算符 $D_\alpha(e^\mu) = \frac{e^\mu - e^{s_\alpha(\mu)-\alpha}}{1 - e^{-\alpha}}$。其几何意义：$\pi_\alpha: G/B \to G/P_\alpha$ 为 $\mathbb{P}^1$-纤维化。$\mathcal{L}_\lambda$ 限制在每条纤维 $\mathbb{P}^1$ 上对应于 $\mathcal{O}(-n)$（$n = \langle \lambda+\rho, \alpha^\vee \rangle - 1$）。$H^0(\mathbb{P}^1, \mathcal{O}(-n))$ 非零仅当 $n \leq 0$，此时 $H^0$ 为 $n+1$ 维，特征标为 $e^\lambda + e^{\lambda-\alpha} + \cdots + e^{\lambda-n\alpha}$ 与 $D_\alpha(e^\lambda)$ 一致；$H^1$ 仅在 $n \geq 2$ 时非零，特征标为 $e^{s_\alpha(\lambda+\rho)-\rho}$。

（iii）归纳论证：设 $\lambda+\rho$ 为正则且 $\langle \lambda+\rho, \alpha^\vee \rangle < 0$，则 $\mathcal{L}_\lambda$ 在 $\mathbb{P}^1$-纤维上没有截面，上同调集中于 $H^1$。每一次穿越单根 $\alpha$ 的壁，上同调群移动一个指标：$H^i(G/B, \mathcal{L}_\lambda) \cong H^{i-1}(G/B, \mathcal{L}_{s_\alpha \bullet \lambda})$（含 $\ell(s_\alpha)=1$ 的情形的 Serre 对偶变体）。对一般 $w \in W$，将 $w$ 写为单反射的约化乘积，逐次应用上述步骤归纳。基情形 $w = \operatorname{id}$（$\lambda$ 支配）即 Borel-Weil 定理。$\blacksquare$

**定理 87.4**（Weyl 特征公式作为推论）：对任意 $\lambda \in \Lambda$，由 Euler-Poincaré 特征
$$\chi(G/B, \mathcal{L}_\lambda) = \sum_{i \geq 0} (-1)^i \operatorname{ch} H^i(G/B, \mathcal{L}_\lambda)$$
- 若 $\lambda \in \Lambda^+$，仅有 $H^0$ 非零，$\chi = \operatorname{ch} V_\lambda$
- 若 $\lambda + \rho$ 为正则且 $w \bullet \lambda \in \Lambda^+$，$\chi = (-1)^{\ell(w)} \operatorname{ch} V_{w \bullet \lambda}$

因为特征标映射是 $K$-理论中的加性不变量，上述 Euler-Poincaré 特征恒等于 Atiyah-Bott 不动点公式给出的表达式
$$\chi(G/B, \mathcal{L}_\lambda) = \frac{\sum_{w \in W} (-1)^{\ell(w)} e^{w(\lambda+\rho)}}{\prod_{\alpha \in \Phi^+} (e^{\alpha/2} - e^{-\alpha/2})}$$
其中分母 $\prod_{\alpha \in \Phi^+} (e^{\alpha/2} - e^{-\alpha/2}) = e^{-\rho} \prod_{\alpha \in \Phi^+} (e^\alpha - 1) = \sum_{w \in W} (-1)^{\ell(w)} e^{w(\rho) - \rho}$ 为 Weyl 分母恒等式。分子分母化简即得标准 Weyl 特征公式。

**证明**：由定理 87.3（Bott-Borel-Weil），上同调群 $H^i(G/B, \mathcal{L}_\lambda)$ 要么全为零，要么恰在一个 $i$ 处非零（$i = \ell(w)$ 时 $H^{\ell(w)} \cong V_{w \bullet \lambda}$）。因此 Euler-Poincaré 特征 $\chi = \sum (-1)^i \operatorname{ch} H^i = (-1)^{\ell(w)} \operatorname{ch} V_{w \bullet \lambda}$。Atiyah-Bott 不动点公式将 $\chi$ 计算为 $T$-等变 $K$-理论中的迹，给出所述分数形式。结合 Weyl 分母恒等式 $\sum_{w \in W} (-1)^{\ell(w)} e^{w(\rho)} = e^\rho \prod_{\alpha > 0} (1 - e^{-\alpha})$ 即得标准 Weyl 特征公式。$\blacksquare$

### 87.4 与几何量子化的联系

**注记 87.1**（几何量子化，Kostant-Souriau 1960年代）：Borel-Weil-Bott 定理是几何量子化最经典的范例。在几何量子化框架中：

- 余伴随轨道 $\mathcal{O}_\lambda = G \cdot \lambda \subseteq \mathfrak{g}^*$（$G$ 为紧实形 $G_c$ 时）是 $G_c$ 的齐性辛流形，$\mathcal{O}_\lambda \cong G_c / G_{c,\lambda} \cong G/B$（作为复流形）
- $\mathcal{L}_\lambda \to \mathcal{O}_\lambda$ 为**预量子化线丛**，其联络曲率恰为 Kostant-Kirillov-Souriau 辛形式
- Borel 子群 $B$ 给出的复结构 $J$ 构成 Kähler 极化。极化下的量子化 = 全纯截面的空间 $H^0$，恰好实现不可约酉表示 $V_\lambda$
- Bott-Borel-Weil 定理计算了高次上同调，证明了正则权情形的量子化无反常（anomalies）——上同调集中于单一度数

这完美体现了 Kostant-Kirillov "轨道法" 哲学：紧 Lie 群的不可约酉表示 <-> 余伴随轨道，且表示的特征标由轨道上 Liouville 测度的 Fourier 变换给出（Harish-Chandra 特征标公式）。

### 87.5 Demazure 模与 Schubert 簇

**定义 87.5**（Schubert 簇）：对 $w \in W$，**Schubert 簇** $X_w = \overline{B w B / B} \subseteq G/B$ 是 Schubert 胞腔 $\mathcal{O}_w \cong \mathbb{C}^{\ell(w)}$ 的 Zariski 闭包。$\dim_{\mathbb{C}} X_w = \ell(w)$，且 $X_w$ 为正规射影簇（一般非光滑）。全体 $\{X_w\}_{w \in W}$ 按 Bruhat 偏序 $v \leq w \iff X_v \subseteq X_w$ 分层。

**定义 87.6**（Demazure 模）：对 $\lambda \in \Lambda^+$ 和 $w \in W$，**Demazure 模** $V_\lambda(w)$ 为 $V_\lambda$ 中由极值权空间 $V_\lambda(w\lambda)$ 在 Borel 子代数 $\mathfrak{b}$ 作用下生成的子模：
$$V_\lambda(w) = U(\mathfrak{b}) \cdot V_\lambda(w\lambda) \subseteq V_\lambda$$
其中 $V_\lambda(w\lambda)$ 为权 $w\lambda$ 的一维权空间。$V_\lambda(w)$ 是 $B$ 的（无限维）表示，其有限维部分由 $V_\lambda$ 的唯一性确定。

**定理 87.5**（Demazure 特征公式）：设 $\lambda \in \Lambda^+$。则
$$H^0(X_w, \mathcal{L}_\lambda|_{X_w}) \cong V_\lambda(w)^*$$
且特征标由 Demazure 算符给出：$\operatorname{ch} V_\lambda(w) = D_w(e^\lambda)$，其中 $D_w = D_{\alpha_{i_1}} \circ \cdots \circ D_{\alpha_{i_\ell}}$（$w = s_{i_1} \cdots s_{i_\ell}$ 为约化分解），而单根算符为
$$D_\alpha(e^\mu) = \frac{e^\mu - e^{s_\alpha(\mu) - \alpha}}{1 - e^{-\alpha}}$$
取 $w = w_0$（最长元）时 $V_\lambda(w_0) = V_\lambda$，即回到 Borel-Weil 定理。

**证明**：对 $\ell(w)$ 归纳。基情形 $\ell(w) = 0$（$w = \operatorname{id}$）：$X_{\operatorname{id}} = \{\text{pt}\}$（单点），$H^0 = \mathbb{C}$ 为一维，$V_\lambda(\operatorname{id})$ 为极值权空间 $V_\lambda(\lambda)$，两者对偶。单反射 $s_\alpha$ 情形：$X_{s_\alpha} \cong \mathbb{P}^1$，$\mathcal{L}_\lambda|_{\mathbb{P}^1}$ 为上同调已知的线丛。利用 $\mathbb{P}^1$-纤维化 $\pi_\alpha: G/B \to G/P_\alpha$ 的 Leray 谱序列，$\pi_{\alpha *} \mathcal{L}_\lambda \cong \mathcal{L}_\lambda'$（$G/P_\alpha$ 上的线丛），$H^0(X_{s_\alpha}, \mathcal{L}_\lambda) \cong H^0(G/P_\alpha, \pi_{\alpha *} \mathcal{L}_\lambda)$。由 Borel-Weil 定理在 $G/P_\alpha$ 上的应用，$H^0$ 给出 $V_\lambda(s_\alpha)^*$。一般 $w$：取约化分解 $w = s_{\alpha_1} \cdots s_{\alpha_\ell}$。由归纳假设，$H^0(X_{ws_\alpha}, \mathcal{L}_\lambda) \cong V_\lambda(ws_\alpha)^*$。利用 Demazure 算符的函子性质，$D_{ws_\alpha} = D_w \circ D_{s_\alpha}$，且 $D_{s_\alpha}(e^\mu) = \operatorname{ch} V_\mu(s_\alpha)$。故 $\operatorname{ch} V_\lambda(w) = D_w(e^\lambda)$。取 $w = w_0$（最长元）时 $V_\lambda(w_0) = V_\lambda$，回到 Borel-Weil 定理。$\blacksquare$

### 87.6 Beilinson-Bernstein 局部化

**定理 87.6**（Beilinson-Bernstein 局部化，1981）：设 $\mathfrak{g}$ 为复半单 Lie 代数，$\lambda \in \mathfrak{h}^*$ 为支配正则权。则存在范畴等价
$$\mathcal{M}(\mathfrak{g}, \lambda) \cong \operatorname{QCoh}(G/B, \mathcal{D}_\lambda)$$
其中左端为具有平凡广义中心特征的 $\mathfrak{g}$-模（Harish-Chandra 双模范畴），右端为 $G/B$ 上扭折微分算符层 $\mathcal{D}_\lambda$ 的拟凝聚层范畴。该等价将 Verma 模映为标准 $\mathcal{D}$-模，将单最高权模映为连接 $\mathcal{D}$-模（即全纯线丛的 $\mathcal{D}$-模推送）。

**证明**：关键步骤三步。(1) 构造「局部化」函子：给定 $\mathfrak{g}$-模 $M$（满足 Harish-Chandra 条件，即 $\mathcal{Z}(\mathfrak{g})$ 通过中心特征 $\chi_\lambda$ 作用），在旗簇上定义 $\mathcal{D}_\lambda$-模 $\Delta(M) = \mathcal{D}_\lambda \otimes_{U(\mathfrak{g})_\lambda} M$，其中 $U(\mathfrak{g})_\lambda = U(\mathfrak{g}) / \ker(\chi_\lambda)$ 为广义中心特征商。$\Delta(M)$ 是拟凝聚 $\mathcal{D}_\lambda$-模，函子 $\Delta$ 正合。(2) 构造「整体截面」函子 $\Gamma(G/B, -)$ 作为拟逆。核心是证明 $\Gamma \circ \Delta \cong \operatorname{id}$：由 $\mathcal{D}_\lambda$ 的整体截面环 $\Gamma(G/B, \mathcal{D}_\lambda) \cong U(\mathfrak{g})_\lambda$（扭折 $\mathcal{D}$-模的整体截面同构于约化包络代数），故 $\Gamma(\Delta(M)) \cong U(\mathfrak{g})_\lambda \otimes_{U(\mathfrak{g})_\lambda} M \cong M$。同时证明 $\Delta \circ \Gamma \cong \operatorname{id}$：由 $\mathcal{D}_\lambda$ 作为 $\mathcal{O}$-模的忠实平坦性，$\Delta$ 和 $\Gamma$ 互为拟逆。(3) $\lambda$ 的正则性条件保证 $\mathcal{D}_\lambda$ 的「扭折」是平凡的：此时 $\mathcal{D}_\lambda$ 和 $\mathcal{D}_0$（通常 $\mathcal{D}$-模层）Morita 等价，因此 $\mathcal{D}_\lambda$-模范畴与 $\mathcal{D}_0$-模范畴等价。$\blacksquare$

**定理 87.7**（局部化与 Borel-Weil-Bott 的联系）：对支配正则权 $\lambda$，整体截面函子 $\Gamma(G/B, -)$ 在扭折 $\mathcal{D}$-模上正合，且
$$\Gamma(G/B, \mathcal{D}_\lambda \otimes_{\mathcal{O}} \mathcal{L}_\mu) \cong M(\mu)^* \quad (\text{$\mu$ 与 $\lambda$ 全整链接})$$
其中 $M(\mu)$ 为权 $\mu$ 的 Verma 模。对反支配权（antidominant），$\Gamma$ 函子非正合而需考察高次上同调，这正好对应于 Bott-Borel-Weil 定理中的上同调转移现象。对奇异权（$\lambda+\rho$ 落在 Weyl 腔壁上），通过平移函子将问题归约至正则情形，给出全部 $H^i(G/B, \mathcal{L}_\mu)$ 的代数刻画。

**证明**：由 Beilinson-Bernstein 局部化，$\mathcal{D}_\lambda$-模范畴等价于 $\mathfrak{g}$-模范畴（具有中心特征 $\chi_\lambda$）。$\mathcal{D}_\lambda \otimes_{\mathcal{O}} \mathcal{L}_\mu$ 是 $\mathcal{D}_\lambda$-模（$\mathcal{D}_\lambda$ 作用于第一个因子），其整体截面 $\Gamma(G/B, \mathcal{D}_\lambda \otimes \mathcal{L}_\mu)$ 为 $\mathfrak{g}$-模。直接计算该模的特征标：由 $\mathcal{D}_\lambda$ 的局部结构，$\Gamma(G/B, \mathcal{D}_\lambda \otimes \mathcal{L}_\mu)$ 包含最高权为 $\mu$ 的向量（由 $\mathcal{L}_\mu$ 的常截面经 $\mathcal{D}_\lambda$ 作用生成），其权空间分解为 $\mu - \sum n_i \alpha_i$（$n_i \in \mathbb{N}$）。因此特征标为 $e^\mu / \prod_{\alpha > 0} (1 - e^{-\alpha})$，这正是 Verma 模 $M(\mu)$ 的特征标。由 Harish-Chandra 定理，$M(\mu)$ 由该特征标唯一确定，故 $\Gamma(G/B, \mathcal{D}_\lambda \otimes \mathcal{L}_\mu) \cong M(\mu)^*$。对非支配权，$\Gamma$ 非正合导致高次上同调的非消没；由定理 87.3，这些高次上同调群恰好实现为相同 LKT 等价类中的不可约表示。$\blacksquare$

**注记 87.2**：Beilinson-Bernstein 局部化定理是几何表示论的基石，将代数 $\mathcal{D}$-模理论与李代数表示论统一。该定理为 Kazhdan-Lusztig 猜想（由 Brylinski-Kashiwara 与 Beilinson-Bernstein 于 1981 年独立证明）提供了几何框架，将 Borel-Weil-Bott 嵌入为宏观对应体系的特例：旗簇上的 $\mathcal{D}$-模、反常层和反常复形精确分类了李代数的全体表示。