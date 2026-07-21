## 第299章：Sobolev 空间

Sobolev 空间是 PDE 理论的基石，由 С.Л. Соболев 于 1930 年代引入。它将函数的可微性与 $L^p$ 可积性统一起来，使得 PDE 的弱解理论成为可能。本章建立从弱导数到嵌入定理的完整框架。

### 弱导数与 Sobolev 空间 $W^{k,p}$

设 $\Omega \subset \mathbb{R}^n$ 为开集。记 $L^1_{\text{loc}}(\Omega)$ 为 $\Omega$ 上局部可积函数空间。对多重指标 $\alpha = (\alpha_1, \ldots, \alpha_n)$，记 $D^\alpha = \partial_1^{\alpha_1} \cdots \partial_n^{\alpha_n}$，$|\alpha| = \sum \alpha_i$。

**定义 251.1**（弱导数）：设 $u, v \in L^1_{\text{loc}}(\Omega)$。称 $v$ 为 $u$ 的第 $\alpha$ 阶**弱导数**（或广义导数），记作 $v = D^\alpha u$，若对一切测试函数 $\varphi \in C_c^\infty(\Omega)$ 成立

$$\int_\Omega u(x) D^\alpha \varphi(x)\,dx = (-1)^{|\alpha|} \int_\Omega v(x) \varphi(x)\,dx$$

此即分部积分公式。若 $u \in C^{|\alpha|}(\Omega)$，则经典导数与弱导数一致；弱导数在 $L^1_{\text{loc}}$ 意义下唯一。

**定义 251.2**（Sobolev 空间 $W^{k,p}(\Omega)$）：设 $k \in \mathbb{N}$，$1 \leq p \leq \infty$。**Sobolev 空间** $W^{k,p}(\Omega)$ 定义为

$$W^{k,p}(\Omega) = \left\{ u \in L^p(\Omega) : D^\alpha u \in L^p(\Omega), \; \forall |\alpha| \leq k \right\}$$

其中 $D^\alpha u$ 为弱导数。配备 **Sobolev 范数**

$$\|u\|_{W^{k,p}(\Omega)} = \begin{cases}
\left( \sum_{|\alpha| \leq k} \|D^\alpha u\|_{L^p(\Omega)}^p \right)^{1/p}, & 1 \leq p < \infty \\
\max_{|\alpha| \leq k} \|D^\alpha u\|_{L^\infty(\Omega)}, & p = \infty
\end{cases}$$

**定理 251.1**（$W^{k,p}$ 的完备性）：对任意 $k \in \mathbb{N}$，$1 \leq p \leq \infty$，$W^{k,p}(\Omega)$ 是 Banach 空间。

**证明**：令 $\{u_m\}$ 为 $W^{k,p}$ 中的 Cauchy 列。对每个 $|\alpha| \leq k$，$\{D^\alpha u_m\}$ 在 $L^p$ 中为 Cauchy 列。由 $L^p$ 完备性，存在 $u_\alpha \in L^p$ 使得 $D^\alpha u_m \to u_\alpha$（在 $L^p$ 中）。记 $u = u_{(0,\ldots,0)}$。对 $\varphi \in C_c^\infty(\Omega)$，

$$\int u D^\alpha \varphi = \lim_{m} \int u_m D^\alpha \varphi = \lim_{m} (-1)^{|\alpha|} \int D^\alpha u_m \,\varphi = (-1)^{|\alpha|} \int u_\alpha \varphi$$

故 $u_\alpha = D^\alpha u$（弱导数），从而 $u \in W^{k,p}$ 且 $u_m \to u$ 在 $W^{k,p}$ 中。$\blacksquare$

当 $p=2$ 时，$H^k(\Omega) = W^{k,2}(\Omega)$ 为 Hilbert 空间，内积为 $\langle u, v \rangle_{H^k} = \sum_{|\alpha| \leq k} \langle D^\alpha u, D^\alpha v \rangle_{L^2}$。

### 分数阶 Sobolev 空间 $H^s(\mathbb{R}^n)$

**定义 251.3**（$H^s(\mathbb{R}^n)$，$s \in \mathbb{R}$）：利用 Fourier 变换 $\mathcal{F}$，定义

$$H^s(\mathbb{R}^n) = \left\{ u \in \mathcal{S}'(\mathbb{R}^n) : (1 + |\xi|^2)^{s/2} \widehat{u}(\xi) \in L^2(\mathbb{R}^n) \right\}$$

范数为 $\|u\|_{H^s} = \| (1 + |\xi|^2)^{s/2} \widehat{u} \|_{L^2}$。称 $(1+|\xi|^2)^{s/2}$ 为 $s$ 阶 Bessel 位势。

**定理 251.2**：$H^s(\mathbb{R}^n)$ 是 Hilbert 空间。对 $s = k \in \mathbb{N}$，$H^k(\mathbb{R}^n)$ 与 $W^{k,2}(\mathbb{R}^n)$ 等距同构。

**证明**：Hilbert 结构由 $\langle u, v \rangle = \int (1+|\xi|^2)^s \widehat{u} \overline{\widehat{v}}\,d\xi$ 给出。对 $s=k \in \mathbb{N}$，Plancherel 定理保证 $\|D^\alpha u\|_{L^2} = \|\xi^\alpha \widehat{u}\|_{L^2}$，而 $c(1+|\xi|^2)^k \leq \sum_{|\alpha|\leq k} |\xi^\alpha|^2 \leq C(1+|\xi|^2)^k$，故两范数等价。$\blacksquare$

### 逼近与稠密性

**定义 251.4**（$W^{k,p}_0(\Omega)$）：记 $W^{k,p}_0(\Omega)$ 为 $C_c^\infty(\Omega)$ 在 $W^{k,p}(\Omega)$ 中的闭包。当 $\Omega = \mathbb{R}^n$ 时 $W^{k,p}_0(\mathbb{R}^n) = W^{k,p}(\mathbb{R}^n)$。

$W^{k,p}_0(\Omega)$ 在偏微分方程理论中扮演"零边界条件"的角色：其元素在边界 $\partial\Omega$ 上"迹为零"（在迹算子意义下）。当 $k=1$ 时，$W^{1,p}_0(\Omega)$ 恰好是那些在 $\partial\Omega$ 上迹为零的 $W^{1,p}(\Omega)$ 函数的全体。Sobolev 空间中光滑函数的稠密性是证明众多不等式和嵌入定理的基础——先对光滑函数建立不等式，再通过稠密性（及范数的连续性）推广到整个 Sobolev 空间。这一策略被称为"光滑化-稠密性论证"（density argument），是泛函分析中处理 PDE 弱解的标准方法。

**定理 251.3**（Meyers-Serrin 定理，$H = W$）：设 $\Omega \subset \mathbb{R}^n$ 为开集，$1 \leq p < \infty$。则 $C^\infty(\Omega) \cap W^{k,p}(\Omega)$ 在 $W^{k,p}(\Omega)$ 中稠密。

**证明**：取 $\Omega$ 的穷竭序列 $\{\Omega_j\}_{j=1}^\infty$ 满足 $\Omega_j \subset\subset \Omega_{j+1}$ 且 $\bigcup_j \Omega_j = \Omega$。令 $\{\psi_j\}$ 为从属于开覆盖 $\{\Omega_{j+1} \setminus \overline{\Omega}_{j-1}\}$ 的光滑单位分解（$\sum_j \psi_j = 1$ 在 $\Omega$ 上，$\psi_j \in C_c^\infty(\Omega_{j+1} \setminus \overline{\Omega}_{j-1})$）。对 $u \in W^{k,p}(\Omega)$，考虑截断和磨光：$u_\varepsilon = \sum_{j=1}^\infty \eta_{\varepsilon_j} * (\psi_j u)$，其中 $\eta_\varepsilon(x) = \varepsilon^{-n}\eta(x/\varepsilon)$ 为标准磨光核，$\varepsilon_j$ 充分小以确保 $\operatorname{supp}(\eta_{\varepsilon_j} * (\psi_j u)) \subset \Omega$。由磨光核的性质，$u_\varepsilon \in C^\infty(\Omega)$。对于 $|\alpha| \leq k$，$D^\alpha u_\varepsilon = \sum_j \eta_{\varepsilon_j} * D^\alpha(\psi_j u)$（利用磨光与弱导数的交换性）。由 $L^p$ 中磨光逼近的收敛性，$\|D^\alpha u_\varepsilon - D^\alpha u\|_{L^p} \to 0$（$\varepsilon \to 0$）。故 $u_\varepsilon \to u$ 在 $W^{k,p}(\Omega)$ 中，即 $C^\infty(\Omega) \cap W^{k,p}(\Omega)$ 在 $W^{k,p}(\Omega)$ 中稠密。$\blacksquare$

### Sobolev 嵌入定理

**定理 251.4**（Sobolev 嵌入 —— $k p < n$ 情形）：设 $1 \leq p < n/k$。则 $W^{k,p}(\mathbb{R}^n) \hookrightarrow L^{p^*}(\mathbb{R}^n)$ 连续，其中 **Sobolev 共轭指数** $p^* = \dfrac{np}{n - kp}$。即存在 $C = C(k, p, n)$ 使得

$$\|u\|_{L^{p^*}} \leq C \|u\|_{W^{k,p}}$$

**证明**（归纳法，$k=1$ 情形）：设 $u \in C_c^\infty(\mathbb{R}^n)$，需证 $\|u\|_{L^{p^*}} \leq C \|\nabla u\|_{L^p}$。由 Gagliardo-Nirenberg 不等式，对 $n \geq 2$，$\|u\|_{L^{n/(n-1)}} \leq \frac{1}{2\sqrt{n}} \prod_{i=1}^n \|\partial_i u\|_{L^1}^{1/n}$。对 $p > 1$，取 $v = |u|^\alpha$（$\alpha > 1$ 待定），应用 $L^1$ 嵌入得 $\|u\|_{L^{\alpha n/(n-1)}}^\alpha \leq C \alpha \|u^{\alpha-1} \nabla u\|_{L^1}$。由 Hölder 不等式，$\|u^{\alpha-1} \nabla u\|_{L^1} \leq \|u\|_{L^{(\alpha-1)p'}}^{\alpha-1} \|\nabla u\|_{L^p}$。取 $\alpha = \frac{n(p-1)}{n-p}$ 使 $\alpha n/(n-1) = (\alpha-1)p' = p^*$，得 $\|u\|_{L^{p^*}} \leq C \|\nabla u\|_{L^p}$。$k > 1$ 情形对 $k$ 归纳，每次降低一阶导数。$\blacksquare$

**定理 251.5**（Morrey 不等式 —— $k p > n$ 情形）：设 $p > n$。则 $W^{1,p}(\mathbb{R}^n) \hookrightarrow C^{0, \gamma}(\mathbb{R}^n)$ 连续，其中 $\gamma = 1 - n/p$。即存在 $C$ 使得

$$|u(x) - u(y)| \leq C \|Du\|_{L^p} \, |x - y|^{1 - n/p}$$

对所有 $u \in W^{1,p}$ 以及几乎所有 $x, y$ 成立。

**证明**：对 $u \in C_c^\infty(\mathbb{R}^n)$，固定 $x,y \in \mathbb{R}^n$，令 $r = |x-y|$。由球体积分表示，$|u(x) - u(y)| \leq \int_0^1 |\nabla u(x + t(y-x))| \cdot |y-x| dt$。取 $B = B(x,r)$，利用平均积分技巧：$|u(x) - u_{B}| \leq \frac{C}{r^{n-1}} \int_B \frac{|\nabla u(z)|}{|x-z|^{n-1}} dz$，其中 $u_B = \frac{1}{|B|}\int_B u$。由 Hölder 不等式，$\int_B \frac{|\nabla u(z)|}{|x-z|^{n-1}} dz \leq \|\nabla u\|_{L^p(B)} \| |x-z|^{-(n-1)}\|_{L^{p'}(B)}$（$p' = p/(p-1)$）。因 $p > n$，$p'(n-1) < n$，后一积分有限且 $\sim r^{1-n/p}$。故 $|u(x) - u_B| \leq C r^{1-n/p} \|\nabla u\|_{L^p}$。对 $y$ 同理，三角不等式得 $|u(x) - u(y)| \leq C |x-y|^{1-n/p} \|\nabla u\|_{L^p}$。由 $C_c^\infty$ 的稠密性延拓至 $W^{1,p}$。$\blacksquare$

**定理 251.6**（$k p = n$ 极限情形）：设 $p = n$。则 $W^{1,n}(\mathbb{R}^n) \hookrightarrow L^q(\mathbb{R}^n)$ 对一切 $n \leq q < \infty$ 连续，但一般不嵌入 $L^\infty$。更精细的极限情形由 Trudinger-Moser 指数可积性刻画。

**证明**：由 Sobolev 嵌入定理的极限情形，$p=n$ 时共轭指数 $p^* = np/(n-p)$ 趋于无穷，故不能直接嵌入 $L^\infty$。对任意 $q \in [n, \infty)$，由 Gagliardo-Nirenberg 插值不等式：$\|u\|_{L^q} \leq C \|u\|_{L^n}^{n/q} \|\nabla u\|_{L^n}^{1-n/q}$。因 $W^{1,n} \hookrightarrow L^n$ 连续，得 $\|u\|_{L^q} \leq C \|u\|_{W^{1,n}}$。但对 $q=\infty$ 插值失效，确实存在 $W^{1,n}$ 函数无界（例如 $u(x) = \log\log(1/|x|)$ 在 $B(0,1/e)$ 中）。Trudinger-Moser 不等式给出 $\int_\Omega \exp(\alpha |u|^{n/(n-1)}) < \infty$（对适当 $\alpha$），这是 $L^\infty$ 缺失的补偿。$\blacksquare$

### 紧嵌入与 Rellich-Kondrachov 定理

**定理 251.7**（Rellich-Kondrachov 紧嵌入）：设 $\Omega \subset \mathbb{R}^n$ 为有界 Lipschitz 开集，$1 \leq p < \infty$。

1. 若 $k p < n$，则 $W^{k,p}(\Omega) \hookrightarrow\hookrightarrow L^q(\Omega)$ 对 $1 \leq q < p^*$ 为紧嵌入；
2. 若 $k p = n$，则 $W^{k,p}(\Omega) \hookrightarrow\hookrightarrow L^q(\Omega)$ 对 $1 \leq q < \infty$ 为紧嵌入；
3. 若 $k p > n$，则 $W^{k,p}(\Omega) \hookrightarrow\hookrightarrow C^{0,\beta}(\overline{\Omega})$ 对 $0 \leq \beta < k - n/p$ 为紧嵌入。

其中 $\hookrightarrow\hookrightarrow$ 表示紧嵌入（将单位球中的有界序列映为预紧序列）。

**证明**：仅证情形1（$kp < n$），其余情形类似。设 $\{u_m\} \subset W^{k,p}(\Omega)$ 为有界序列，$\|u_m\|_{W^{k,p}} \leq M$。由 Sobolev 嵌入 $W^{k,p} \hookrightarrow L^{p^*}$ 连续，$\{u_m\}$ 在 $L^{p^*}$ 中有界。对 $q < p^*$，由 Holder 不等式 $\|u_m\|_{L^q} \leq |\Omega|^{1/q-1/p^*}\|u_m\|_{L^{p^*}} \leq C$。关键步骤：利用磨光核 $\eta_\varepsilon$ 构造 $u_m^\varepsilon = \eta_\varepsilon * u_m$（延拓到 $\mathbb{R}^n$ 外为零）。由 Friedrichs 不等式，$\|u_m^\varepsilon - u_m\|_{L^q} \leq C\varepsilon^\alpha$（$\alpha = k - n(1/p-1/q) > 0$），且 $\|u_m^\varepsilon\|_{C^1}$ 被 $\varepsilon^{-k-n/p}M$ 控制。由 Arzela-Ascoli 定理，对固定 $\varepsilon$，$\{u_m^\varepsilon\}_m$ 在 $L^q$ 中预紧。取对角线子列 $\{u_{m_j}\}$ 及 $\varepsilon \to 0$，利用 $\varepsilon$-逼近论证即得 $\{u_{m_j}\}$ 在 $L^q(\Omega)$ 中收敛。$\blacksquare$

### 迹定理

**定理 251.8**（迹定理）：设 $\Omega \subset \mathbb{R}^n$ 为有界 $C^1$（或 Lipschitz）开集，$1 \leq p < \infty$。存在唯一的有界线性算子

$$\gamma : W^{1,p}(\Omega) \to L^p(\partial \Omega)$$

称为**迹算子**，满足 $\gamma u = u|_{\partial\Omega}$ 对 $u \in C^\infty(\overline{\Omega})$ 成立。存在 $C = C(\Omega, p)$ 使得

$$\|\gamma u\|_{L^p(\partial\Omega)} \leq C \|u\|_{W^{1,p}(\Omega)}$$

**证明**：先对半空间 $\mathbb{R}^n_+ = \{(x', x_n): x' \in \mathbb{R}^{n-1}, x_n > 0\}$ 证明迹估计。对 $u \in C_c^\infty(\overline{\mathbb{R}^n_+})$，由微积分基本定理：$|u(x',0)|^p = -\int_0^\infty \frac{\partial}{\partial x_n}|u(x',x_n)|^p dx_n = -p\int_0^\infty |u|^{p-1}\operatorname{sgn}(u)\frac{\partial u}{\partial x_n}dx_n$。由 Young 不等式，$|u(x',0)|^p \leq C\int_0^\infty (|u|^p + |\partial_n u|^p)dx_n$。对 $x'$ 积分得 $\|u(\cdot,0)\|_{L^p(\mathbb{R}^{n-1})} \leq C\|u\|_{W^{1,p}(\mathbb{R}^n_+)}$。对于一般 $C^1$（或 Lipschitz）区域 $\Omega$，利用局部坐标将边界展平：取有限开覆盖 $\{U_i\}$ 及 $C^1$ 微分同胚 $\Phi_i: U_i \cap \Omega \to \mathbb{R}^n_+$，将 $u$ 拉回为半空间上的函数，应用上述估计后再用单位分解求和。迹算子的唯一性由 $C^\infty(\overline{\Omega})$ 在 $W^{1,p}(\Omega)$ 中的稠密性保证。$\blacksquare$

**定义 251.5**（迹零空间）：$W^{1,p}_0(\Omega)$ 恰为 $\gamma^{-1}(\{0\})$，即

$$W^{1,p}_0(\Omega) = \{ u \in W^{1,p}(\Omega) : \gamma u = 0 \}$$

换言之，$W^{1,p}_0$ 是边界上迹为零的 Sobolev 函数，其与 $C_c^\infty(\Omega)$ 的闭包定义等价（对 Lipschitz 边界）。

### Poincaré 不等式

**定理 251.9**（Poincaré 不等式 —— $W^{1,p}_0$ 形式）：设 $\Omega \subset \mathbb{R}^n$ 为有界开集。存在 $C = C(\Omega, p)$ 使得

$$\|u\|_{L^p(\Omega)} \leq C \|Du\|_{L^p(\Omega)}, \quad \forall u \in W^{1,p}_0(\Omega)$$

特别地，$\|Du\|_{L^p}$ 在 $W^{1,p}_0(\Omega)$ 上等价于全范数 $\|u\|_{W^{1,p}}$。

**证明**：对 $u \in C_c^\infty(\Omega)$，延拓到 $\mathbb{R}^n$ 上的一个大立方体 $Q$ 令边界外为零。沿每个坐标方向积分：$|u(x)| \leq \int_{-\infty}^{x_i} |\partial_i u|\,dt$。取平均后 Hölder 不等导出估计。再由 $C_c^\infty$ 的稠密性传递至 $W^{1,p}_0$。$\blacksquare$

**定理 251.10**（Poincaré-Wirtinger 不等式 —— 零均值形式）：设 $\Omega \subset \mathbb{R}^n$ 为连通有界 Lipschitz 开集。定义均值 $u_\Omega = \frac{1}{|\Omega|} \int_\Omega u\,dx$。存在 $C = C(\Omega, p)$ 使得

$$\|u - u_\Omega\|_{L^p(\Omega)} \leq C \|Du\|_{L^p(\Omega)}, \quad \forall u \in W^{1,p}(\Omega)$$

**证明**：若不然，存在序列 $\{u_m\}$ 满足 $\|u_m - (u_m)_\Omega\|_{L^p} = 1$ 而 $\|Du_m\|_{L^p} \to 0$。由 Rellich-Kondrachov，子列 $u_m \to u$ 在 $L^p$ 中，而 $Du = 0$（弱极限），故 $u = \text{const}$。但 $\int (u_m - (u_m)_\Omega) \to \int (u - u_\Omega) = 0$，与极限范数为 $1$ 矛盾。$\blacksquare$

### Sobolev 空间在 PDE 中的应用框架

Sobolev 空间为 PDE 的弱解理论提供了基本语言。对二阶椭圆方程 $- \operatorname{div}(A(x) \nabla u) = f$（齐次 Dirichlet 边界），其**变分形式**为：求 $u \in H^1_0(\Omega)$ 满足

$$\int_\Omega A \nabla u \cdot \nabla v \,dx = \int_\Omega f v\,dx, \quad \forall v \in H^1_0(\Omega)$$

由 Poincaré 不等式和 Lax-Milgram 引理，当 $A$ 一致椭圆时解存在唯一。正则性理论（$f \in L^2 \Rightarrow u \in H^2$）依赖于差商和 Sobolev 嵌入。对发展方程（热方程、波动方程），Sobolev 空间 $H^s$ 提供能量估计的自然框架。对非线性 PDE（Navier-Stokes、反应扩散），紧嵌入和临界 Sobolev 指数控制了紧性和爆破分析。

更具体地，对于椭圆型 PDE，Sobolev 嵌入给出了解的正则性阶梯：若 $f \in W^{k,p}(\Omega)$，则弱解 $u$ 满足 $u \in W^{k+2,p}_{\operatorname{loc}}(\Omega)$（内部正则性）。这一结果通过差分商方法（Nirenberg 平移技巧）证明：考察差分商 $\Delta_h u = \frac{u(x+h)-u(x)}{|h|}$，利用变分方程的一致椭圆性得到 $\Delta_h u$ 的 $H^1$ 估计，进而取极限 $h \to 0$ 获得二阶弱导数的 $L^2$ 界。对于抛物型方程 $\partial_t u + \mathcal{L}u = f$，自然的工作空间是 $L^2(0,T; H^1_0(\Omega)) \cap H^1(0,T; H^{-1}(\Omega))$，其中时间的 Sobolev 正则性为 $H^1$ 而空间的为正则性的 $H^1_0$，嵌入 $H^1(0,T) \hookrightarrow C([0,T])$ 保证了解在时间上的连续性。对于双曲型方程，能量守恒律在 $H^1 \times L^2$ 框架下自然成立。对于非线性方程，临界 Sobolev 嵌入 $H^1 \hookrightarrow L^{2^*}$（$2^* = 2n/(n-2)$）在变分方法和爆破分析中起着核心作用——Pohozaev 恒等式和 Trudinger-Moser 不等式分别处理了临界和极限情形。

---

## 第300章：KAM 理论与自由边界问题

本章涵盖两个看似独立、实则共享"小扰动下结构稳定性"这一核心主题的数学领域。KAM 理论（Kolmogorov-Arnold-Moser）是 Hamilton 动力系统微扰理论的核心成就，证明了近可积 Hamilton 系统在满足 Diophantine 条件的频率下，大多数不变环面在小扰动下得以存留——这颠覆了 Boltzmann 的"遍历假设"，揭示了可积系统的显著刚性。自由边界问题处理 PDE 的解域边界本身是未知的、由解决定的边值问题，其经典例子包括 Stefan 问题（冰-水相变的自由界面演化）和障碍问题（膜与障碍物接触的边界）。

### 96.1 KAM 理论（Kolmogorov-Arnold-Moser）

KAM 理论是 Hamilton 动力系统微扰理论的核心成就，描述了近可积系统在微小扰动下拟周期运动的保持。**基本问题**：给定可积 Hamilton 系统 $H_0(I)$（作用量-角变量坐标，环面 $I \times \mathbb{T}^n$），当加入小扰动 $H_\epsilon = H_0(I) + \epsilon H_1(I, \theta)$ 后，哪些不变环面得以存留？

**定理 96.1**（Kolmogorov 定理，1954）：若 $H_0$ 非退化（$\det(\partial^2 H_0 / \partial I_i \partial I_j) \neq 0$），则对满足 Diophantine 条件

$$|k \cdot \omega| \geq \frac{\gamma}{\|k\|^\tau}, \quad \forall k \in \mathbb{Z}^n \setminus \{0\}$$

的频率 $\omega = \nabla H_0(I)$，相应的不变环面在充分小的 $\epsilon > 0$ 下扰动后仍然存在——仅发生微小形变，其频率集合具有正 Lebesgue 测度（当 $\epsilon \to 0$ 时测度趋于全测度）。

**证明**：Kolmogorov 的证明使用快速收敛的 Newton 型迭代（Kolmogorov 迭代）。在作用量-角变量 $(I,\theta)$ 下，设 $H(I,\theta) = H_0(I) + \epsilon H_1(I,\theta)$。目标是通过一系列典则变换逐步消除角度依赖的扰动项。第 $n$ 步迭代的误差为 $O(\epsilon^{2^n})$，实现二次收敛。关键步骤：求解同调方程 $\{H_0, S\} + \epsilon H_1 = \bar{H}_1$（Poisson 括号），其中 $S$ 为生成函数。在 Fourier 展开下，该方程的解为 $S_k = \epsilon H_{1,k}/(i k\cdot\omega)$（$k\neq 0$）。Diophantine 条件 $|k\cdot\omega| \geq \gamma\|k\|^{-\tau}$ 保证分母不趋于零过快，使得迭代收敛。收敛后，扰动系统的频率 $\omega_\epsilon$ 与 $\omega$ 相差 $O(\epsilon)$，且不变环面仅发生 $O(\epsilon)$ 的形变。$\blacksquare$

**定义 96.1**（Diophantine 条件）：频率向量 $\omega \in \mathbb{R}^n$ 称为 $(\gamma, \tau)$-Diophantine 的（$\gamma > 0$, $\tau > n-1$），若对任意非零整数向量 $k \in \mathbb{Z}^n$，有 $|k \cdot \omega| \geq \gamma \|k\|^{-\tau}$。满足此条件的频率集合在 $\mathbb{R}^n$ 中具有全测度。

**定理 96.2**（Arnold 扩散，1964）：未被 KAM 环面覆盖的相空间区域中存在极缓慢的扩散现象（速度为 $O(e^{-c/\epsilon})$），这是导致不变环面间"泄露"的核心机制。对于 $n \geq 3$ 自由度的系统，Arnold 证明了存在穿越由 KAM 环面形成的"网"的轨道链。

**证明**：对 $n \geq 3$ 自由度的近可积 Hamilton 系统，KAM 环面是 $n$ 维的，相空间维数为 $2n$。当 $n \geq 3$ 时，$2n - n = n \geq 3 > 2$，KAM 环面不再能分割相空间——它们形成"网"结构，轨道可通过环面间的间隙缓慢扩散。Arnold 构造了过渡链：一系列由双曲周期轨道的不稳定流形与稳定流形横截相交形成的异宿连接。每条连接使轨道从一个环面附近"跳跃"到相邻环面附近。由于 Melnikov 型分裂的大小为 $O(e^{-c/\epsilon})$，每次跳跃的速度为 $O(e^{-c/\epsilon})$，故扩散速度为 $O(e^{-c/\epsilon})$。这解释了为何在近可积系统中，尽管 KAM 环面占据大部分相空间，长时间后仍可能出现大范围的能量输运。$\blacksquare$

### 96.2 自由边界问题（Free Boundary Problems）

自由边界问题处理 PDE 的解域边界本身是未知的、由解决定的边值问题。

**定义 96.2**（Stefan 问题 / 冰-水相变）：热方程 $u_t = \Delta u$ 在固相/液相区域分别成立，在自由界面 $\Gamma(t)$ 上满足 Stefan 条件

$$[\nabla u \cdot \mathbf{n}] = L V_n$$

其中 $L > 0$ 为潜热，$V_n$ 为界面法向速度，$[\cdot]$ 表示界面两侧跳跃。一维 Stefan 问题的显式解（Neumann 解，1860 年代）由误差函数 $\operatorname{erf}$ 构成，自由边界以 $\sim\sqrt{t}$ 的速率移动。

**定义 96.3**（障碍问题 / Obstacle Problem）：给定障碍函数 $\psi$，求解 $u \geq \psi$ 满足

$$\Delta u \leq 0, \quad u \geq \psi, \quad (u - \psi) \Delta u = 0$$

其自由边界是接触集 $\Gamma = \partial \{u = \psi\} \cap \Omega$（即 $u = \psi$ 区域的拓扑边界）。

**定理 96.3**（Caffarelli 正则性定理，1977）：障碍问题的自由边界在除去一个低维奇异集之外是光滑的（$C^{1,\alpha}$），这为整个自由边界正则性理论奠定了基础。具体而言，自由边界点分为正则点（自由边界在该点附近为 $C^{1,\alpha}$ 超曲面）和奇点（可分类），后者的 Hausdorff 维数不超过 $n-2$。

**证明**：Caffarelli 的证明基于"改进平坦性"（improvement of flatness）迭代。设 $u$ 为障碍问题的解，$\Gamma = \partial\{u = \psi\}$。在正则点 $x_0 \in \Gamma$ 处，假设 $u$ 在 $B_r(x_0)$ 中接近一个线性函数 $a\cdot(x-x_0)^+$（$a \neq 0$）。通过缩放和紧性论证，构造序列 $u_k(x) = u(x_0 + r_k x)/r_k^2$（$r_k \to 0$）。该序列在 $C^{1,\alpha}$ 中收敛到全局解（"blow-up 极限"），该极限为 $\frac{1}{2}\max(x\cdot e, 0)^2$ 的形式（$e$ 为单位向量）。由粘性解理论和 Harnack 不等式，自由边界在 $x_0$ 附近为 $C^{1,\alpha}$ 超曲面。奇点对应 $a=0$ 的退化情形，blow-up 极限为二次齐次多项式，可用凸分析分类——其 Hausdorff 维数不超过 $n-2$。$\blacksquare$

**定义 96.4**（Hele-Shaw 流动）：描述两平行平板间粘性流体的界面演化。对 Hele-Shaw 胞腔，压强 $p$ 在流体区域满足 $\Delta p = 0$，在自由边界上 $p = 0$ 且法向速度 $V_n = -\partial p / \partial n$。其数学模型等价于 Laplacian 增长（DLA 的连续极限），小扰动下界面不稳定（Saffman-Taylor 指进现象）。

---
## 第301章：特殊函数与正交多项式

本章对 Gamma、Beta、Bessel、Legendre 及超几何函数给出编号定义、定理与完整证明，作为数学物理中特殊函数的标准知识库。

### 97.1 Gamma 函数与 Beta 函数

**定义 97.1**（Gamma 函数）：$\Gamma(z)$ 的 Euler 积分定义为

$$\Gamma(z) = \int_0^\infty t^{z-1} e^{-t} \, dt, \quad \operatorname{Re}(z) > 0$$

通过解析延拓可扩充为 $\mathbb{C} \setminus \{0, -1, -2, \ldots\}$ 上的亚纯函数，诸负整数为一阶极点，留数为 $\operatorname{Res}(\Gamma, -n) = (-1)^n / n!$。等价地有 Weierstrass 无穷乘积

$$\frac{1}{\Gamma(z)} = z e^{\gamma z} \prod_{n=1}^\infty \left(1 + \frac{z}{n}\right) e^{-z/n}$$

其中 $\gamma = \lim_{N \to \infty} \left(\sum_{n=1}^N \frac{1}{n} - \log N\right)$ 为 Euler-Mascheroni 常数。

**定理 97.1**（函数方程）：$\Gamma(z+1) = z \Gamma(z)$ 对所有 $z \in \mathbb{C} \setminus \mathbb{Z}_{\leq 0}$ 成立。

**证明**：对 $\operatorname{Re}(z) > 0$，分部积分：$\Gamma(z+1) = \int_0^\infty t^z e^{-t} dt = [-t^z e^{-t}]_0^\infty + z \int_0^\infty t^{z-1} e^{-t} dt = z \Gamma(z)$。由解析延拓的唯一性，该等式在整个定义域上成立。$\blacksquare$

特别地，$\Gamma(n) = (n-1)!$（$n \in \mathbb{N}$）。Euler 反射公式 $\Gamma(z)\Gamma(1-z) = \pi / \sin(\pi z)$ 及 Legendre 倍元公式 $\Gamma(2z) = \frac{2^{2z-1}}{\sqrt{\pi}} \Gamma(z) \Gamma(z + \frac{1}{2})$ 亦为基础恒等式。

**定义 97.2**（Beta 函数）：对 $\operatorname{Re}(x) > 0$，$\operatorname{Re}(y) > 0$，

$$B(x, y) = \int_0^1 t^{x-1} (1-t)^{y-1} \, dt$$

**定理 97.2**（Beta 与 Gamma 的关系）：

$$B(x, y) = \frac{\Gamma(x) \Gamma(y)}{\Gamma(x + y)}$$

**证明**：考虑 $\Gamma(x)\Gamma(y) = \int_0^\infty \int_0^\infty u^{x-1} v^{y-1} e^{-(u+v)} du dv$。作变量代换 $u = ts$，$v = (1-t)s$（$t \in (0,1)$，$s \in (0,\infty)$），Jacobi 行列式为 $s$。则

$$\Gamma(x)\Gamma(y) = \int_0^1 \int_0^\infty (ts)^{x-1} ((1-t)s)^{y-1} e^{-s} \cdot s \, ds \, dt$$

$$= \int_0^1 t^{x-1} (1-t)^{y-1} dt \cdot \int_0^\infty s^{x+y-1} e^{-s} ds = B(x,y) \cdot \Gamma(x+y)$$

除以 $\Gamma(x+y)$ 即得结论。$\blacksquare$

### 97.2 Bessel 函数

**定义 97.3**（Bessel 微分方程与第一类 Bessel 函数）：对阶 $\nu \in \mathbb{C}$，Bessel 微分方程为

$$z^2 y'' + z y' + (z^2 - \nu^2) y = 0$$

其第一类解为：

$$J_\nu(z) = \sum_{k=0}^\infty \frac{(-1)^k}{k! \, \Gamma(k + \nu + 1)} \left(\frac{z}{2}\right)^{2k + \nu}$$

级数对任意 $z \in \mathbb{C}$ 收敛（无穷收敛半径），在 $z = 0$ 处 $J_\nu(z) \sim (z/2)^\nu / \Gamma(\nu+1)$。当 $\nu \notin \mathbb{Z}$ 时，$J_\nu$ 与 $J_{-\nu}$ 线性无关，构成解空间的基。

**定义 97.4**（第二类 Bessel 函数 / Weber 函数）：对 $\nu \notin \mathbb{Z}$，

$$Y_\nu(z) = \frac{J_\nu(z) \cos(\nu \pi) - J_{-\nu}(z)}{\sin(\nu \pi)}$$

对整数 $\nu = n$，$Y_n(z) = \lim_{\nu \to n} Y_\nu(z)$（极限存在，消除了 $0/0$ 不定式）。$Y_\nu(z)$ 在 $z = 0$ 处具有对数奇性：$Y_0(z) \sim \frac{2}{\pi} \log z$。

**定理 97.3**（Bessel 函数的递推关系）：

$$\begin{aligned} \frac{d}{dz}\left[z^\nu J_\nu(z)\right] &= z^\nu J_{\nu-1}(z) \\ \frac{d}{dz}\left[z^{-\nu} J_\nu(z)\right] &= -z^{-\nu} J_{\nu+1}(z) \end{aligned}$$

以及 $J_{\nu-1}(z) + J_{\nu+1}(z) = \frac{2\nu}{z} J_\nu(z)$，$J_{\nu-1}(z) - J_{\nu+1}(z) = 2 J'_\nu(z)$。

**证明**：对级数逐项微分并重组指标即得。以第一个为例：$z^\nu J_\nu(z) = \sum_{k=0}^\infty \frac{(-1)^k}{k! \Gamma(k+\nu+1)} \frac{z^{2k+2\nu}}{2^{2k+\nu}}$，对 $z$ 求导后合并 $k$ 与 $k+1$ 项即产生 $z^\nu J_{\nu-1}(z)$ 的级数。$\blacksquare$

**定理 97.4**（Bessel 函数的生成函数）：对整数阶 $\nu = n \in \mathbb{Z}$，

$$\exp\left(\frac{z}{2}\left(t - \frac{1}{t}\right)\right) = \sum_{n=-\infty}^{\infty} J_n(z) \, t^n$$

此即指数函数的 Laurent 展开，系数恰为整数阶 Bessel 函数。该生成函数直接导出 Jacobi-Anger 展开及其在调频信号分析中的应用。

**证明**：将生成函数 $\exp(\frac{z}{2}(t-t^{-1}))$ 展开为 Laurent 级数。由指数函数的 Taylor 展开，$\exp(\frac{z}{2}t) = \sum_{k=0}^\infty \frac{1}{k!}(\frac{z}{2})^k t^k$，$\exp(-\frac{z}{2}t^{-1}) = \sum_{\ell=0}^\infty \frac{(-1)^\ell}{\ell!}(\frac{z}{2})^\ell t^{-\ell}$。乘积的 $t^n$ 系数为 $\sum_{k-\ell=n} \frac{(-1)^\ell}{k!\ell!}(\frac{z}{2})^{k+\ell} = \sum_{\ell=\max(0,-n)}^\infty \frac{(-1)^\ell}{(\ell+n)!\ell!}(\frac{z}{2})^{2\ell+n} = J_n(z)$。当 $n<0$ 时，利用 $J_{-n}(z)=(-1)^n J_n(z)$ 的一致性。故 Laurent 级数恰为 $\sum_{n=-\infty}^\infty J_n(z) t^n$。该生成函数蕴含 $e^{iz\sin\theta} = \sum_{n=-\infty}^\infty J_n(z) e^{in\theta}$（令 $t=e^{i\theta}$），即 Jacobi-Anger 展开。$\blacksquare$

### 97.3 Legendre 多项式与球谐函数

**定义 97.5**（Legendre 多项式的 Rodrigues 公式）：

$$P_n(x) = \frac{1}{2^n n!} \frac{d^n}{dx^n} (x^2 - 1)^n, \quad n = 0, 1, 2, \ldots$$

$P_n$ 为 $n$ 次多项式，$P_n(1) = 1$，$P_n(-1) = (-1)^n$。其满足 Legendre 微分方程 $(1 - x^2) P_n'' - 2x P_n' + n(n+1) P_n = 0$。

**定理 97.5**（Legendre 多项式的正交性）：

$$\int_{-1}^1 P_m(x) P_n(x) \, dx = \frac{2}{2n+1} \delta_{mn}$$

**证明**：设 $m \leq n$。代入 Rodrigues 公式并分部积分 $n$ 次：

$$\int_{-1}^1 P_m(x) P_n(x) \, dx = \frac{1}{2^n n!} \int_{-1}^1 P_m(x) \frac{d^n}{dx^n} (x^2-1)^n \, dx$$

$$= \frac{(-1)^n}{2^n n!} \int_{-1}^1 (x^2-1)^n \frac{d^n}{dx^n} P_m(x) \, dx$$

边界项消去是因为 $(x^2-1)^n$ 及其前 $n-1$ 阶导数在 $x = \pm 1$ 处为零。若 $m < n$，则 $\frac{d^n}{dx^n} P_m(x) = 0$，故积分为零。若 $m = n$，则 $\frac{d^n}{dx^n} P_n(x) = \frac{(2n)!}{2^n n!}$，代入得

$$\int_{-1}^1 P_n(x)^2 \, dx = \frac{(2n)!}{2^{2n} (n!)^2} \int_{-1}^1 (1 - x^2)^n \, dx$$

Beta 函数计算得右端积分为 $2^{2n+1} (n!)^2 / ((2n+1)!)$，代入即得 $2/(2n+1)$。$\blacksquare$

**定义 97.6**（球谐函数）：在单位球面 $S^2 \subset \mathbb{R}^3$ 上，球谐函数 $Y_\ell^m(\theta, \phi)$（$\ell \in \mathbb{N}$，$m = -\ell, \ldots, \ell$）是 Laplace 算子球面部分 $\Delta_{S^2}$ 的特征函数：

$$\Delta_{S^2} Y_\ell^m = -\ell(\ell+1) Y_\ell^m$$

其标准表达式为

$$Y_\ell^m(\theta, \phi) = (-1)^m \sqrt{\frac{2\ell+1}{4\pi} \frac{(\ell-m)!}{(\ell+m)!}} \, P_\ell^m(\cos\theta) \, e^{im\phi}$$

其中 $P_\ell^m(x) = (1-x^2)^{m/2} \frac{d^m}{dx^m} P_\ell(x)$ 为连带 Legendre 函数。$\{Y_\ell^m\}$ 构成 $L^2(S^2)$ 的完备正交基（等价于 $SO(3)$ 的不可约酉表示的矩阵系数），满足正交关系 $\int_{S^2} Y_\ell^m \overline{Y_{\ell'}^{m'}} \, d\Omega = \delta_{\ell\ell'} \delta_{mm'}$。

### 97.4 超几何函数与合流型

**定义 97.7**（Gauss 超几何函数）：

$$_2F_1(a, b; c; z) = \sum_{n=0}^\infty \frac{(a)_n (b)_n}{(c)_n n!} z^n, \quad |z| < 1$$

其中 $(q)_n = q(q+1)\cdots(q+n-1)$（$n \geq 1$），$(q)_0 = 1$ 为 Pochhammer 符号。参数 $c \notin \mathbb{Z}_{\leq 0}$，否则分母为零。$_2F_1$ 满足超几何微分方程 $z(1-z) y'' + [c - (a+b+1)z] y' - ab \, y = 0$，在 $z = 0$ 处正则。

**定理 97.6**（Gauss 求和公式）：

$$_2F_1(a, b; c; 1) = \frac{\Gamma(c) \Gamma(c - a - b)}{\Gamma(c-a) \Gamma(c-b)}, \quad \operatorname{Re}(c - a - b) > 0$$

**证明**：利用 Euler 积分表示 $_2F_1(a,b;c;z) = \frac{\Gamma(c)}{\Gamma(b)\Gamma(c-b)} \int_0^1 t^{b-1}(1-t)^{c-b-1}(1-zt)^{-a}dt$（$\operatorname{Re}(c) > \operatorname{Re}(b) > 0$）。该表示由展开 $(1-zt)^{-a} = \sum_{n=0}^\infty \frac{(a)_n}{n!}(zt)^n$ 并逐项积分得到。令 $z = 1$，则 $(1-t)^{-a}$ 出现在积分中：$_2F_1(a,b;c;1) = \frac{\Gamma(c)}{\Gamma(b)\Gamma(c-b)} \int_0^1 t^{b-1}(1-t)^{c-b-1}(1-t)^{-a}dt = \frac{\Gamma(c)}{\Gamma(b)\Gamma(c-b)} \int_0^1 t^{b-1}(1-t)^{c-a-b-1}dt$。最后的积分是 Beta 函数 $B(b, c-a-b) = \frac{\Gamma(b)\Gamma(c-a-b)}{\Gamma(c-a)}$。代入即得 $_2F_1(a,b;c;1) = \frac{\Gamma(c)\Gamma(c-a-b)}{\Gamma(c-a)\Gamma(c-b)}$。收敛条件 $\operatorname{Re}(c-a-b) > 0$ 由 Beta 积分的收敛性保证。$\blacksquare$

**定义 97.8**（合流超几何函数 / Kummer 函数）：

$$_1F_1(a; c; z) = \sum_{n=0}^\infty \frac{(a)_n}{(c)_n n!} z^n, \quad z \in \mathbb{C}$$

这是 $_2F_1(a,b;c;z/b)$ 当 $b \to \infty$ 的极限，满足 Kummer 方程 $z y'' + (c-z) y' - a y = 0$。经典特例包括 $L_n^{(\alpha)}(z) = \frac{(\alpha+1)_n}{n!} {}_1F_1(-n; \alpha+1; z)$（Laguerre 多项式）及误差函数 $\operatorname{erf}(z) = \frac{2z}{\sqrt{\pi}} {}_1F_1(\frac{1}{2}; \frac{3}{2}; -z^2)$。

**定义 97.9**（Whittaker 函数）：Whittaker 方程 $y'' + \left(-\frac{1}{4} + \frac{\kappa}{z} + \frac{\frac{1}{4} - \mu^2}{z^2}\right) y = 0$ 的两组标准解：

$$M_{\kappa,\mu}(z) = z^{\mu+\frac{1}{2}} e^{-z/2} {}_1F_1(\mu - \kappa + \tfrac{1}{2}; 1 + 2\mu; z)$$

$$W_{\kappa,\mu}(z) = \frac{\Gamma(-2\mu)}{\Gamma(\frac{1}{2} - \mu - \kappa)} M_{\kappa,\mu}(z) + \frac{\Gamma(2\mu)}{\Gamma(\frac{1}{2} + \mu - \kappa)} M_{\kappa,-\mu}(z)$$

$M_{\kappa,\mu}$ 在 $z = 0$ 处正则，$W_{\kappa,\mu}$ 在 $z \to \infty$ 时以 $z^\kappa e^{-z/2}$ 的渐近行为衰减，后者在量子力学（Coulomb 散射）和随机过程（Bessel 过程的特征函数）中有重要应用。

---
*卷二十：微分方程终。*
