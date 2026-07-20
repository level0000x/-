## 第251章：Sobolev 空间

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
