## 第372章：重正化群与重正化理论

重正化（renormalization）是量子场论中消除紫外发散的系统性方法，其核心思想在于：将裸参数重新定义为依赖于截断标度的跑动耦合常数，使得物理可观测量在移除截断后保持有限。

### 372.1 重正化的物理动机与正规化

**定义 372.1**（紫外发散）：在微扰量子场论中，对无限制动量积分出现的发散称为**紫外（UV）发散**。典型例子是 $\phi^4$ 理论中单圈自能图 $\int d^4k/(k^2+m^2)$，该积分在大动量 $|k|\to\infty$ 时二次发散。

**定义 372.2**（动量截断正规化）：引入动量截断 $\Lambda>0$，将发散积分截断为有限值：

$$\int \frac{d^4k}{(2\pi)^4} \frac{1}{k^2+m^2} \;\longrightarrow\; \int_{|k|\leq\Lambda} \frac{d^4k}{(2\pi)^4} \frac{1}{k^2+m^2}$$

物理结果在 $\Lambda\to\infty$ 极限下通过重新定义耦合常数和场归一化保持有限。

**定义 372.3**（维数正规化，'t Hooft-Veltman 1972）：在 $d=4-\varepsilon$ 维时空中计算Feynman积分，发散表现为 $1/\varepsilon$ 极点。对任意Feynman图 $G$，其维数正规化振幅为

$$\mathcal{A}_G = \mu^{2\varepsilon} \int \frac{d^dk}{(2\pi)^d} I_G(k,p_i)$$

其中 $\mu$ 为重整化标度，引入以保持耦合常数无量纲。$d\to 4$ 时 $1/\varepsilon$ 极点对应于原理论的对数发散。

### 372.2 BPZH重正化方案

**定义 372.4**（Zimmermann森林公式，1969）：设Feynman图 $G$ 的发散子图集合为 $\mathcal{F}(G)$。$G$ 的**重正化振幅** $R_G$ 由森林公式给出

$$R_G = \sum_{U \in \mathcal{W}(\mathcal{F}(G))} \prod_{\gamma \in U} (-t_\gamma) \cdot I_G$$

其中 $\mathcal{W}(\mathcal{F}(G))$ 是 $\mathcal{F}(G)$ 的所有**森林**（两两不相交或不嵌套的连通发散子图族），$t_\gamma$ 是在子图 $\gamma$ 上定义的Taylor减法算子（在零外动量处展开至发散阶），$I_G$ 是未重整化的Feynman积分。

**定理 372.1**（BPHZ定理，Bogoliubov-Parasiuk 1957, Hepp 1966, Zimmermann 1969）：对任意可重整

**证明**：BPHZ方案分三步。（1）Zimmermann森林公式：对每个Feynman图$G$，其重正化值$R_G$由森林公式给出——$R_G=\sum_{U\in\mathcal{F}(G)}\prod_{\gamma\in U}(-t^\gamma)\circ I_G$，其中$\mathcal{F}(G)$为$G$的发散子图森林，$t^\gamma$为Taylor减法算子（在$\gamma$的外动量处展开至发散度$d(\gamma)$阶）。（2）Bogoliubov $R$-操作递归定义：$\bar{R}_G=I_G+\sum_{\{\gamma_1,\ldots,\gamma_k\}}I_{G/\{\gamma_i\}}\circ\prod_i(-t^{\gamma_i}\bar{R}_{\gamma_i})$。（3）Hepp-Zimmermann收敛定理：对每个发散的1PI子图施加Taylor减法后，所有Feynman积分的整体发散在$d=4$时被抵消。$\blacksquare$的量子场论，森林公式 $R_G$ 对所有Feynman图 $G$ 给出有限的、Lorentz不变的振幅，且满足因果性和幺正性。重整化后的Feynman振幅对动量截断 $\Lambda\to\infty$（或 $\varepsilon\to 0$）一致收敛。

### 372.3 Callan-Symanzik方程与β-函数

**定义 372.5**（跑动耦合常数与β-函数）：设 $g(\mu)$ 为重整化标度 $\mu$ 处的有效耦合常数。**β-函数**定义为

$$\beta(g) \equiv \mu \frac{\partial g}{\partial \mu}$$

在微扰论中，$\beta(g)=\beta_0 g^3+\beta_1 g^5+O(g^7)$，其中 $\beta_0,\beta_1$ 是方案无关的普适系数。

**定理 372.2**（Callan-Symanzik方程，1970）：设 $\Gamma^{(n)}(p_i;g,\mu)$ 是 $n$-点单粒子不可约（1PI）Green函数，$\gamma(g)$ 为反常量纲。则

$$\left[\mu\frac{\partial}{\partial\mu} + \beta(g)\frac{\partial}{\partial g} + n\gamma(g)\right]\Gamma^{(n)}(p_i;g,\mu) = 0$$

**证明**：由重整化群不变性，裸Green函数 $\Gamma^{(n)}_B(p_i;g_0,\Lambda)$ 不依赖于 $\mu$。利用 $g_0=Z_g(g,\mu/\Lambda)g\mu^{\varepsilon}$ 和场重整化常数 $Z_\phi$，对 $\mu$ 求导即得CS方程。$\blacksquare$

### 372.4 Wilson重正化群流

**定义 372.6**（Kadanoff分块自旋变换，1966）：在临界现象中，将 $d$ 维格点系统分组为边长为 $b$ 的超块，每个超块内的自旋取平均（粗粒化），再重新标度长度 $x\to x/b$ 和场变量 $\phi\to b^{\Delta}\phi$。此操作定义了相空间上的**重正化群变换** $\mathcal{R}_b$。

**定理 372.3**（重正化群不动点与普适类）：重正化群变换 $\mathcal{R}_b$ 的参数空间流由 $\beta$ 函数控制。$\beta(g_*

**证明**：RG变换$\mathcal{R}_b$将耦合常数$\{g_i\}$映射为$\{g_i(b)\}$。$\beta$函数$\beta_i(g)=\frac{dg_i}{d\ln b}$控制RG流。RG不动点$g^*$满足$\beta_i(g^*)=0$。在$g^*$附近线性化：$\frac{d}{d\ln b}(g_i-g_i^*)=\sum_j M_{ij}(g_j-g_j^*)$（$M_{ij}=\partial\beta_i/\partial g_j|_{g^*}$）。$M$的正特征值对应相关方向（relevant，远离不动点），负特征值对应无关方向（irrelevant，趋近不动点），零特征值对应边缘方向。所有流到同一不动点的理论属于同一普适类，具有相同的临界指数（由$M$的特征值决定）。$\blacksquare$)=0$ 的点 $g_*$ 称为**不动点**。在不动点处线性化 $\mathcal{R}_b$，特征值 $\lambda_i=b^{y_i}$ 对应的本征方向 $y_i>0$ 为**相关参量**，$y_i<0$ 为**无关参量**。所有流向同一不动点的理论构成一个**普适类**，具有相同的临界指数。

---

## 第373章：Vlasov方程的数学理论

Vlasov方程描述无碰撞等离子体或自引力系统中粒子分布函数在相空间中的演化。它是Boltzmann方程在碰撞项消失时的极限。

### 373.1 Vlasov方程与Vlasov-Poisson系统

**定义 373.1**（Vlasov方程）：设 $f(t,x,v)\geq 0$ 为时刻 $t$ 在位置 $x\in\mathbb{R}^d_x$、速度 $v\in\mathbb{R}^d_v$ 处的粒子分布函数。粒子所受平均场力为 $F(t,x)$，则**Vlasov方程**为

$$\partial_t f + v\cdot\nabla_x f + F\cdot\nabla_v f = 0$$

该方程表达了相空间体积的 Liouville 守恒：沿特征线 $\dot{x}=v,\;\dot{v}=F(t,x)$，$f$ 为常数。

**定义 373.2**（Vlasov-Poisson系统）：当力场 $F$ 由自洽Poisson方程确定时，得到**Vlasov-Poisson系统**：

$$\begin{cases}
\partial_t f + v\cdot\nabla_x f + F\cdot\nabla_v f = 0 \\[4pt]
F = -\nabla_x \Phi, \quad \Delta_x \Phi = \gamma_d \int_{\mathbb{R}^d_v} f(t,x,v)\,dv
\end{cases}$$

其中对等离子体情形 $\gamma_d=1$（静电势，$\Delta\Phi=-\rho$ 归入符号约定），对自引力情形 $\gamma_d=4\pi G$。系统的总能量

$$\mathcal{E}(t) = \frac{1}{2}\iint |v|^2 f\,dx\,dv + \frac{1}{2}\int |\nabla\Phi|^2\,dx$$

是形式守恒量。

### 373.2 弱解的存在性：DiPerna-Lions理论

**定义 373.3**（重正规化解，DiPerna-Lions 1989）：设 $f_0\in L^1\cap L^\infty(\mathbb{R}^d_x\times\mathbb{R}^d_v)$ 非负且有有限动能。分布函数 $f\in L^\infty([0,T];L^1\cap L^\infty)$ 称为Vlasov-Poisson系统的**重正规化解**，若对任意 $\beta\in C^1(\mathbb{R})\cap L^\infty(\mathbb{R})$ 满足 $\beta(0)=0$ 和 $|\beta'(t)|\leq C(1+|t|^p)$，有

$$\partial_t \beta(f) + v\cdot\nabla_x \beta(f) + F\cdot\nabla_v \beta(f) = 0$$

在分布意义下成立。重正规化条件补偿了缺乏 $W^{1,1}$ 正则性的困难，使得乘积 $F\cdot\nabla_v f$ 有定义。

**定理 373.1**（DiPerna-Lions全局存在性，1989）：设 $f_0\geq 0$，$f_0\in L^1\cap L^\infty(\mathbb{R}^6)$，且 $\iint |v|^2 f_0\,dx\,dv<\infty$。则Vlasov-Poisson系统存在全局重正规化解 $f\in L^\infty([0,\infty);L^1\cap L^\infty)$。若进一步 $f_0\in C^1$，则该解为经典解。

**证明概要**：构造正则化系统（磨光力场），得到逼近序列 $(f^\varepsilon,F^\varepsilon)$。利用速度矩估计和能量守恒得到一致界，通过速度平均引理（velocity averaging lemma）获得紧性，取极限后在重正规化意义下验证方程。$\blacksquare$

### 373.3 Landau阻尼的线性理论

**定理 373.2**（线性Landau阻尼，Landau 1946）：考虑空间均匀平衡态 $f_0(v)$ 上的线性化Vlasov-Poisson系统（$d

**证明**：线性化Vlasov-Poisson系统：$\partial_t f_1+v\cdot\nabla_x f_1+E\cdot\nabla_v f_0=0$，$\nabla\cdot E=\int f_1 dv$。Fourier-Laplace变换得色散关系$\varepsilon(k,\omega)=1-\frac{1}{k^2}\int\frac{k\cdot\nabla_v f_0}{\omega-k\cdot v}dv=0$。对稳定的$f_0$（单峰分布），$\operatorname{Im}\omega<0$给出Landau阻尼：$E(t)\sim e^{-\gamma t}$（$\gamma>0$为Landau阻尼率）。阻尼的物理机制是波-粒子共振（$\omega=k\cdot v$）导致能量从电场转移到粒子。$\blacksquare$=1$ 情形）。对扰动 $f_1(t,x,v)=g(t,v)e^{ikx}$，电场 $E(t,x)=\hat{E}(t)e^{ikx}$。由Laplace变换分析，当 $t\to\infty$ 时，

$$\hat{E}(t) \sim C e^{-i\omega_p t - \gamma t}, \quad \gamma = \frac{\pi}{2}\frac{\omega_p^3}{k^2} f_0'\left(\frac{\omega_p}{k}\right)$$

其中 $\omega_p$ 为等离子体频率，由色散关系 $\varepsilon(k,\omega)=1-\frac{\omega_p^2}{k^2}\int \frac{f_0'(v)}{v-\omega/k}dv=0$ 确定。若 $f_0'(\omega_p/k)<0$（Penrose稳定性条件），则 $\gamma>0$，电场呈指数衰减——此即Landau阻尼。衰减机制源于波-粒子共振导致的相位混合，即使在线性无碰撞系统中也为不可逆过程。

**定理 373.3**（Mouhot-Villani非线性Landau阻尼，2011）：对充分光滑且小振幅的初值扰动，非线性Vlasov-Poisson系统的

**证明**：Mouhot-Villani使用Newton迭代和正则化方法。关键步骤：（1）证明线性化算子的Landau阻尼性质（谱界的解析延拓）；（2）构造非线性响应的级数展开，利用等离子体回波（plasma echo）的抵消机制控制非线性项的共振增长；（3）通过Gevrey类解析函数的正则性估计，证明非线性项在长时间尺度上保持可控。核心是证明非线性回波不会导致不稳定性——即不同波数间的非线性相互作用在适当正则性下互相抵消，使得Landau阻尼在非线性层面依然有效。$\blacksquare$解在 $t\to\infty$ 时以几乎多项式速率衰减至齐态，验证了非线性稳定性和Landau阻尼在非线性水平上的严格成立。

---

## 第374章（补充）

量子信息科学研究信息在量子力学框架下的数学表示与处理，其数学基础涉及Hilbert空间、算子理论、张量积和群表示论。量子纠缠是张量积结构中不可分解的态，量子算法（Shor、Grover）在计算复杂性上体现了量子模型的优势。本卷在量子力学数学基础（V30 Ch 325）和泛函分析（V14 Ch 129-Hilbert 空间）的基础上，系统建立量子态与测量公理、纠缠理论、量子信道、量子算法和量子纠错码的数学理论。
