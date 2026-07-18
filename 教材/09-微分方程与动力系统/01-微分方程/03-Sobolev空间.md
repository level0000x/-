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

**证明框架**：取 $\Omega$ 的穷竭开覆盖 $\{\Omega_j\}$，满足 $\Omega_j \subset\subset \Omega_{j+1}$，令 $\{\psi_j\}$ 为从属于 $\{\Omega_{j+1} \setminus \overline{\Omega}_{j-1}\}$ 的单位分解。对 $u \in W^{k,p}$，考虑截断和磨光：$u_\epsilon = \sum_j \eta_{\epsilon_j} * (\psi_j u)$，其中 $\eta_\epsilon$ 为标准磨光核，$\epsilon_j$ 取得充分小。则 $u_\epsilon \in C^\infty$ 且 $u_\epsilon \to u$ 在 $W^{k,p}$ 中。$\blacksquare$

### Sobolev 嵌入定理

**定理 251.4**（Sobolev 嵌入 —— $k p < n$ 情形）：设 $1 \leq p < n/k$。则 $W^{k,p}(\mathbb{R}^n) \hookrightarrow L^{p^*}(\mathbb{R}^n)$ 连续，其中 **Sobolev 共轭指数** $p^* = \dfrac{np}{n - kp}$。即存在 $C = C(k, p, n)$ 使得

$$\|u\|_{L^{p^*}} \leq C \|u\|_{W^{k,p}}$$

**证明要点**（$k=1$ 情形）：对 $u \in C_c^\infty(\mathbb{R}^n)$，利用每个单变量方向的积分表示

$$|u(x)| \leq \frac{1}{2} \prod_{i=1}^n \left( \int_{\mathbb{R}} |\partial_i u| \,dx_i \right)^{1/n}$$

累次应用 Gagliardo-Nirenberg 插值得 $\|u\|_{L^{n/(n-1)}} \leq \frac{1}{2} \prod \|\partial_i u\|_{L^1}^{1/n}$。对一般 $p$，将 $|u|^{\gamma}$（$\gamma = p(n-1)/(n-p)$）代入 $p=1$ 情形即得。对 $k>1$ 递推。$\blacksquare$

**定理 251.5**（Morrey 不等式 —— $k p > n$ 情形）：设 $p > n$。则 $W^{1,p}(\mathbb{R}^n) \hookrightarrow C^{0, \gamma}(\mathbb{R}^n)$ 连续，其中 $\gamma = 1 - n/p$。即存在 $C$ 使得

$$|u(x) - u(y)| \leq C \|Du\|_{L^p} \, |x - y|^{1 - n/p}$$

对所有 $u \in W^{1,p}$ 以及几乎所有 $x, y$ 成立。

**证明要点**：对 $u \in C_c^\infty$，利用球体积分表示：$|u(x) - u(y)| \leq C \int_{B(x,r)} \frac{|Du(z)|}{|x-z|^{n-1}} dz + (\text{对称项})$，由 Hölder 不等式并取 $r = |x-y|$ 即得 Hölder 估计。对 $W^{1,p}$ 中一般函数用逼近。$\blacksquare$

**定理 251.6**（$k p = n$ 极限情形）：设 $p = n$。则 $W^{1,n}(\mathbb{R}^n) \hookrightarrow L^q(\mathbb{R}^n)$ 对一切 $n \leq q < \infty$ 连续，但一般不嵌入 $L^\infty$。更精细的极限情形由 Trudinger-Moser 指数可积性刻画。

### 紧嵌入与 Rellich-Kondrachov 定理

**定理 251.7**（Rellich-Kondrachov 紧嵌入）：设 $\Omega \subset \mathbb{R}^n$ 为有界 Lipschitz 开集，$1 \leq p < \infty$。

1. 若 $k p < n$，则 $W^{k,p}(\Omega) \hookrightarrow\hookrightarrow L^q(\Omega)$ 对 $1 \leq q < p^*$ 为紧嵌入；
2. 若 $k p = n$，则 $W^{k,p}(\Omega) \hookrightarrow\hookrightarrow L^q(\Omega)$ 对 $1 \leq q < \infty$ 为紧嵌入；
3. 若 $k p > n$，则 $W^{k,p}(\Omega) \hookrightarrow\hookrightarrow C^{0,\beta}(\overline{\Omega})$ 对 $0 \leq \beta < k - n/p$ 为紧嵌入。

其中 $\hookrightarrow\hookrightarrow$ 表示紧嵌入（将单位球中的有界序列映为预紧序列）。

### 迹定理

**定理 251.8**（迹定理）：设 $\Omega \subset \mathbb{R}^n$ 为有界 $C^1$（或 Lipschitz）开集，$1 \leq p < \infty$。存在唯一的有界线性算子

$$\gamma : W^{1,p}(\Omega) \to L^p(\partial \Omega)$$

称为**迹算子**，满足 $\gamma u = u|_{\partial\Omega}$ 对 $u \in C^\infty(\overline{\Omega})$ 成立。存在 $C = C(\Omega, p)$ 使得

$$\|\gamma u\|_{L^p(\partial\Omega)} \leq C \|u\|_{W^{1,p}(\Omega)}$$

**证明要点**：先对半空间 $\mathbb{R}^n_+$ 证明 $\|u(\cdot, 0)\|_{L^p(\mathbb{R}^{n-1})} \leq C \|u\|_{W^{1,p}(\mathbb{R}^n_+)}$（对 $u \in C_c^\infty(\overline{\mathbb{R}^n_+})$ 用基本定理和 Hölder 不等式）。再用局部坐标展平边界推广到一般区域。$\blacksquare$

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
