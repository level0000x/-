## 第319章：条件期望与鞅
条件期望是概率论中最重要的概念之一，它将 "已知部分信息下的平均" 精确化。鞅是 Doob 引入的强大工具，在随机过程、金融数学和统计推断中有广泛应用。

### 106.1 条件期望

**定义 106.1**（条件期望）：设 $X$ 是可积随机变量，$\mathcal{G} \subseteq \mathcal{F}$ 是子 $\sigma$-代数。$X$ 在 $\mathcal{G}$ 下的**条件期望** $\mathbb{E}[X \mid \mathcal{G}]$ 是唯一的 $\mathcal{G}$-可测随机变量 $Y$，满足

$$\int_A Y d\mathbb{P} = \int_A X d\mathbb{P} \quad \text{对所有 } A \in \mathcal{G}$$

（由 Radon-Nikodym 定理保证存在唯一性）。

**定义 106.2**（给定随机变量的条件期望）：$\mathbb{E}[X \mid Y] = \mathbb{E}[X \mid \sigma(Y)]$。存在 Borel 函数 $g$ 使得 $\mathbb{E}[X \mid Y] = g(Y)$，记 $g(y) = \mathbb{E}[X \mid Y = y]$。

**命题 106.1**（条件期望的基本性质）：
1. $\mathbb{E}[\mathbb{E}[X \mid \mathcal{G}]] = \mathbb{E}[X]$（全期望律）
2. 若 $X$ 是 $\mathcal{G}$-可测，则 $\mathbb{E}[X \mid \mathcal{G}] = X$
3. 若 $X$ 与 $\mathcal{G}$ 独立（即 $\sigma(X)$ 与 $\mathcal{G}$ 独立），则 $\mathbb{E}[X \mid \mathcal{G}] = \mathbb{E}[X]$
4. $\mathbb{E}[aX + bY \mid \mathcal{G}] = a \mathbb{E}[X \mid \mathcal{G}] + b \mathbb{E}[Y \mid \mathcal{G}]$（线性）
5. 若 $Z$ 是 $\mathcal{G}$-可测且有界，则 $\mathbb{E}[ZX \mid \mathcal{G}] = Z \mathbb{E}[X \mid \mathcal{G}]$
6. **塔性质**：$\mathbb{E}[\mathbb{E}[X \mid \mathcal{G}] \mid \mathcal{H}] = \mathbb{E}[X \mid \mathcal{H}]$（当 $\mathcal{H} \subseteq \mathcal{G}$）
7. 条件 Jensen 不等式：$\varphi(\mathbb{E}[X \mid \mathcal{G}]) \leq \mathbb{E}[\varphi(X) \mid \mathcal{G}]$（$\varphi$ 凸）

### 106.2 鞅的定义与基本性质

**定义 106.3**（滤过）：**滤过** $\{\mathcal{F}_n\}_{n \geq 0}$ 是 $\mathcal{F}$ 的递增子 $\sigma$-代数序列：$\mathcal{F}_0 \subseteq \mathcal{F}_1 \subseteq \cdots \subseteq \mathcal{F}$。$\mathcal{F}_n$ 表示时刻 $n$ 可用的信息。

**定义 106.4**（鞅）：随机过程 $\{M_n\}_{n \geq 0}$ 称为关于 $\{\mathcal{F}_n\}$ 的**鞅**（martingale），如果
1. $M_n$ 是 $\mathcal{F}_n$-可测（适应于滤过）
2. $\mathbb{E}[|M_n|] < \infty$（对所有 $n$）
3. $\mathbb{E}[M_{n+1} \mid \mathcal{F}_n] = M_n$（对所有 $n$）

若 $\mathbb{E}[M_{n+1} \mid \mathcal{F}_n] \geq M_n$（下鞅，submartingale）或 $\leq M_n$（上鞅，supermartingale），则称为**下鞅**或**上鞅**。

### 106.3 鞅收敛定理

**定理 106.2**（Doob 上穿不等式）：设 $\{X_n\}$ 是下鞅。对 $a < b$，在 $n$ 步内 $X_n$ 从 $a$ 以下穿到 $b$ 以上的次数 $U_n(a, b)$ 满足

$$\mathbb{E}[U_n(a, b)] \leq \frac{\mathbb{E}[(X_n - a)^+]}{b - a}$$

Doob 上穿不等式是鞅理论中最为深刻的技术工具之一。其直观含义是：下鞅在有限区间 $(a,b)$ 上的穿越次数在期望的意义下受终端值控制，因此若鞅不收敛必产生无穷次穿越，与这一估计矛盾。Doob 正是利用这一简单的组合推理，得到了鞅几乎必然收敛这一强大结论。

**证明**：令 $S_1 = \inf\{k \geq 0 : X_k \leq a\}$，$T_1 = \inf\{k > S_1 : X_k \geq b\}$，交替定义停时 $S_i, T_i$。则上穿次数 $U_n = \max\{j : T_j \leq n\}$。定义指标 $I_k = 1$ 当 $k \in [S_i+1, T_i]$ 对某 $i$，否则 $0$。则 $I_k$ 可料（$\mathcal{F}_{k-1}$-可测）。计算 $\sum_{k=1}^n I_k (X_k - X_{k-1}) \geq (b-a)U_n - (X_n - a)^-$。由下鞅性，$\mathbb{E}[I_k(X_k - X_{k-1})] = \mathbb{E}[I_k \mathbb{E}[X_k - X_{k-1} \mid \mathcal{F}_{k-1}]] \geq 0$。故 $(b-a)\mathbb{E}[U_n] \leq \mathbb{E}[(X_n - a)^+] - \mathbb{E}[(X_0 - a)^+] \leq \mathbb{E}[(X_n - a)^+]$。$\blacksquare$

上穿不等式的一个重要推论是：$L^1$ 有界的下鞅必定几乎必然收敛。事实上，若 $\sup_n \mathbb{E}[|M_n|] < \infty$，则对任意有理数 $a < b$，上穿次数的期望有界，从而几乎必然有限，排除了 $\liminf < a < b < \limsup$ 的可能性。这一论证构成了鞅收敛定理的证明核心。

**定理 106.3**（鞅收敛定理，Doob）：设 $\{M_n\}$ 是下鞅且 $\sup_n \mathbb{E}[|M_n|] < \infty$（或 $\sup_n \mathbb{E}[M_n^+] < \infty$）。则 $M_n$ 几乎必然收敛到某个可积随机变量 $M_\infty$。

**证明**：使用上穿不等式。若 $\{M_n\}$ 不收敛，则存在有理数 $a < b$ 使得 $\liminf M_n < a < b < \limsup M_n$，即上穿次数 $U_\infty(a,b) = \infty$。由上穿不等式（定理 106.2），$\mathbb{E}[U_n(a,b)] \leq \frac{\mathbb{E}[(M_n - a)^+]}{b - a} \leq \frac{\sup_n \mathbb{E}[|M_n|] + |a|}{b - a} < \infty$。由单调收敛定理，$\mathbb{E}[U_\infty(a,b)] = \lim_{n \to \infty} \mathbb{E}[U_n(a,b)] < \infty$，故 $U_\infty(a,b) < \infty$ a.s.，与 $\liminf < a < b < \limsup$ 矛盾。因此 $\lim M_n$ 存在（a.s.）。由 Fatou 引理，$\mathbb{E}[|M_\infty|] = \mathbb{E}[\liminf |M_n|] \leq \sup_n \mathbb{E}[|M_n|] < \infty$，故 $M_\infty$ 可积。$\blacksquare$

定理 106.3 仅保证了几乎必然收敛；若鞅还满足 $L^p$ 有界性（$p > 1$），则更强地在 $L^p$ 范数下收敛。这是因为 Doob 极大不等式提供了控制函数 $\sup_n |M_n|$ 的 $L^p$ 可积性，从而允许通过 Lebesgue 控制收敛定理将逐点收敛加强为 $L^p$ 收敛。这一结果在随机积分理论和偏微分方程的概率解法中至关重要。

**定理 106.4**（$L^p$ 鞅收敛定理）：若 $\{M_n\}$ 是鞅且 $\sup_n \mathbb{E}[|M_n|^p] < \infty$（$p > 1$），则 $M_n \to M_\infty$ 在 $L^p$ 中收敛。

**证明**：由 Doob 极大不等式，$\mathbb{E}[\sup_n |M_n|^p] \leq (\frac{p}{p-1})^p \sup_n \mathbb{E}[|M_n|^p] < \infty$。故 $\sup_n |M_n| \in L^p$。由定理 106.3，$M_n \to M_\infty$ a.s.。由于 $|M_n - M_\infty|^p \leq 2^p (\sup_n |M_n|)^p \in L^1$，由控制收敛定理，$\mathbb{E}[|M_n - M_\infty|^p] \to 0$。$\blacksquare$

### 106.4 可选停止定理

**定义 106.5**（停时）：随机变量 $\tau: \Omega \to \mathbb{N} \cup \{\infty\}$ 称为关于 $\{\mathcal{F}_n\}$ 的**停时**，如果 $\{\tau = n\} \in \mathcal{F}_n$（对所有 $n$）。即"是否停止"仅依赖于当前和过去的信息。

**定理 106.5**（可选停止定理，Doob）：设 $\{M_n\}$ 是鞅，$\tau$ 是停时。若以下条件之一成立：
1. $\tau$ 有界（$\tau \leq N$ 几乎必然）
2. $\{M_n\}$ 有界且 $\tau < \infty$ 几乎必然
3. $\mathbb{E}[\tau] < \infty$ 且 $|M_n - M_{n-1}| \leq C$（有界增量）

则 $\mathbb{E}[M_\tau] = \mathbb{E}[M_0]$。

*证明*：对情形 1，$M_{\tau \wedge N} = \sum_{n=0}^{N-1} M_n \mathbf{1}_{\{\tau = n\}} + M_N \mathbf{1}_{\{\tau \geq N\}}$ 是鞅，故 $\mathbb{E}[M_\tau] = \mathbb{E}[M_{\tau \wedge N}] = \mathbb{E}[M_0]$。∎

**定理 106.6**（Wald 等式）：设 $X_1, X_2, \ldots$ 是 i.i.d.，$\mathbb{E}[|X_1|] < \infty$，$\mu = \mathbb{E}[X_1]$。$\tau$ 是关于 $\{X_n\}$ 的停时，$\mathbb{E}[\tau] < \infty$。则 $\mathbb{E}[\sum_{i=1}^\tau X_i] = \mu \mathbb{E}[\tau]$。

**证明**：令 $S_n = \sum_{i=1}^n (X_i - \mu)$。$S_n$ 是鞅（$\mathbb{E}[S_{n+1} \mid \mathcal{F}_n] = S_n$）。由可选停止定理（条件 3），若 $\mathbb{E}[\tau] < \infty$ 且 $\mathbb{E}[|X_1|] < \infty$（增量一致有界于可积变量），则 $\mathbb{E}[S_\tau] = \mathbb{E}[S_0] = 0$。故 $\mathbb{E}[\sum_{i=1}^\tau X_i] = \mu \mathbb{E}[\tau] + \mathbb{E}[S_\tau] = \mu \mathbb{E}[\tau]$。$\blacksquare$

---

---

---

---

---
---

## 第320章：Markov 链
Markov 链是"无记忆"的随机过程，其未来状态仅依赖于当前状态。本章讨论离散时间、可数状态空间的 Markov 链，包括转移概率、平稳分布和遍历定理。

### 107.1 Markov 链的定义

**定义 107.1**（Markov 链）：状态空间 $S$（可数集）上的随机过程 $\{X_n\}_{n \geq 0}$ 称为 **Markov 链**，如果满足 Markov 性：

$$\mathbb{P}(X_{n+1} = j \mid X_n = i, X_{n-1}, \ldots, X_0) = \mathbb{P}(X_{n+1} = j \mid X_n = i)$$

上述定义中的转移概率原则上可以依赖于当前时刻 $n$。但在实际应用中，绝大多数 Markov 链具有时间齐次性——即转移机制不随时间变化。时齐 Markov 链的转移行为完全由一个与时间无关的转移矩阵 $P$ 刻画，这极大地简化了其长期行为的分析。

**定义 107.2**（时齐 Markov 链）：若 $\mathbb{P}(X_{n+1} = j \mid X_n = i) = p_{ij}$（与 $n$ 无关），则称链是**时齐**的。矩阵 $P = (p_{ij})_{i,j \in S}$ 称为**转移矩阵**（每行和为 $1$）。

转移矩阵 $P$ 描述了一步转移的行为，而多步转移概率则通过矩阵幂自然得到。Chapman-Kolmogorov 方程将 $n$ 步和 $m$ 步的转移概率连接起来，是 Markov 链所有渐近分析的基础递推关系。

**定义 107.3**（$n$ 步转移概率）：$p_{ij}^{(n)} = \mathbb{P}(X_n = j \mid X_0 = i) = (P^n)_{ij}$。由 Chapman-Kolmogorov 方程：$p_{ij}^{(n+m)} = \sum_{k \in S} p_{ik}^{(n)} p_{kj}^{(m)}$。

初始分布 $\pi_0$ 和转移矩阵 $P$ 共同决定了 Markov 链的联合分布。由于 Markov 性将每一步的条件分布简化为仅依赖于前一步，$n$ 时刻的分布 $\pi_n$ 可以简洁地表示为初始分布与转移矩阵幂的乘积。

**命题 107.1**：Markov 链的分布由初始分布 $\pi_0$（$\pi_0(i) = \mathbb{P}(X_0 = i)$）和转移矩阵 $P$ 完全确定：$\pi_n = \pi_0 P^n$。

### 107.2 状态的分类

**定义 107.4**（可达与互通）：$j$ 从 $i$ **可达**（$i \to j$）如果存在 $n \geq 0$ 使得 $p_{ij}^{(n)} > 0$。$i$ 和 $j$ 互通（$i \leftrightarrow j$）如果 $i \to j$ 且 $j \to i$。互通是等价关系，等价类称为**互通类**。

互通关系将状态空间划分为不相交的等价类，这是 Markov 链分类的起点。然而，属于同一互通类的状态在长期行为上可能仍有本质差异，区分这种差异需要引入常返性的概念：一个状态$i$是常返的，意味着从$i$出发几乎必然会在有限时间内返回$i$；否则称为瞬时的。

**定义 107.5**（常返与瞬时）：状态 $i$ 称为**常返**的，如果 $\mathbb{P}(X_n = i \text{ 无穷多次} \mid X_0 = i) = 1$。否则称为**瞬时**的。

常返性的上述定义涉及无限多次返回的概率，难以直接计算。幸运的是，这一条件可以等价地转化为转移概率的级数发散性：状态$i$常返当且仅当$\sum_{n=1}^\infty p_{ii}^{(n)} = \infty$。这一判别准则的证明利用了首次返回时间的生成函数与转移概率生成函数之间的基本关系。

**定理 107.2**（常返性的判别）：$i$ 常返当且仅当 $\sum_{n=1}^\infty p_{ii}^{(n)} = \infty$。$i$ 瞬时当且仅当 $\sum_{n=1}^\infty p_{ii}^{(n)} < \infty$。

**证明**：令 $T_i = \inf\{n \geq 1 : X_n = i\}$。由 母函数 关系 $\sum_{n=0}^\infty p_{ii}^{(n)} s^n = 1/(1 - F_{ii}(s))$，其中 $F_{ii}(s) = \mathbb{E}[s^{T_i} \mid X_0 = i]$。$i$ 常返当且仅当 $\mathbb{P}(T_i < \infty \mid X_0 = i) = 1$，即 $F_{ii}(1) = 1$。则 $\sum_n p_{ii}^{(n)} = 1/(1 - F_{ii}(1)) = \infty$。若 $F_{ii}(1) < 1$，则 $\sum_n p_{ii}^{(n)} = 1/(1 - F_{ii}(1)) < \infty$。$\blacksquare$

常返状态还可以进一步细分为正常返和零常返两类，取决于首次返回时间的期望是否有限。对于正常返状态，链不仅几乎必然返回，而且平均返回时间是有限的，这一性质对于平稳分布的存在性至关重要。

**定义 107.6**（正常返与零常返）：常返状态 $i$ 称为**正常返**的，如果 $\mathbb{E}[T_i \mid X_0 = i] < \infty$（$T_i = \inf\{n \geq 1 : X_n = i\}$ 是首次返回时间）。否则称为**零常返**。

上述各种状态分类——瞬时、零常返、正常返——在不可约链中具有一致性：同一等价类内所有状态的类型相同。这是 Markov 链理论的一个关键结构事实，称为"固态性"（solidarity），其证明基于互通关系对返回概率级数收敛的影响。

**定义 107.7**（不可约）：Markov 链称为**不可约**的，如果所有状态互通（只有一个互通类）。

**定理 107.3**：对不可约 Markov 链，所有状态同时为瞬时、零常返或正常返（固态性）。

**证明**：设 $i$ 正常返且 $j \leftrightarrow i$。存在 $n, m$ 使 $p_{ij}^{(n)} > 0$，$p_{ji}^{(m)} > 0$。则 $p_{jj}^{(n+r+m)} \geq p_{ji}^{(m)} p_{ii}^{(r)} p_{ij}^{(n)}$。由 $i$ 正常返，$\sum_r p_{ii}^{(r)}$ 以 $\mathbb{E}[T_i] < \infty$ 的速率收敛，推出 $\sum_k p_{jj}^{(k)} = \infty$ 且 $\mathbb{E}[T_j] < \infty$。类似论证关联瞬时性和零常返性。因为不可约链所有状态互通，该关系通过链任意两个状态之间传递。实际上，定义不依赖于特定状态的固化性等价于：存在常数 $c_{ij} > 0$ 和 $N$ 使得对所有充分大的 $r$，$p_{jj}^{(r)} \geq c_{ij} p_{ii}^{(r-N)}$。因此级数 $\sum p_{ii}^{(n)}$ 的收敛/发散性与 $\sum p_{jj}^{(n)}$ 相同。$\blacksquare$

### 107.3 平稳分布

**定义 107.8**（平稳分布）：概率分布 $\pi = (\pi(i))_{i \in S}$ 称为**平稳分布**（或不变测度），如果 $\pi = \pi P$（即 $\pi(j) = \sum_{i \in S} \pi(i) p_{ij}$）。若 $\pi_0 = \pi$，则 $\pi_n = \pi$ 对所有 $n$。

**定理 107.4**（平稳分布的存在性）：不可约 Markov 链有平稳分布当且仅当它是正常返的。此时平稳分布唯一，且 $\pi(i) = 1 / \mathbb{E}[T_i \mid X_0 = i]$。

**证明**：设链不可约正常返。定义 $\pi(i) = 1 / \mathbb{E}[T_i \mid X_0 = i]$。由 Markov 更新定理，$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} p_{ji}^{(k)} = \pi(i)$ 对任意 $j$ 成立。对稳态方程两边取极限：$\pi(j) = \lim_{n} \frac{1}{n} \sum_{k=0}^{n-1} p_{ji}^{(k+1)} = \lim_n \frac{1}{n} \sum_{k} \sum_\ell p_{j\ell} p_{\ell i}^{(k)} = \sum_\ell p_{j\ell} \pi(i)$。等号两侧交换 $j$ 和 $i$ 即得 $\pi = \pi P$。唯一性：若 $\pi'$ 是另一平稳分布，由遍历定理，$\pi'(i) = \lim \frac{1}{n} \sum_k \pi^{(k)}(i) = \pi(i)$。$\blacksquare$

**定理 107.5**（Markov 链遍历定理）：设不可约正常返 Markov 链有平稳分布 $\pi$。则

$$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} \mathbf{1}_{\{X_k = j\}} = \pi(j) \quad \text{几乎必然}$$

即时间平均收敛于空间平均。若链是非周期的，则 $\lim_{n \to \infty} p_{ij}^{(n)} = \pi(j)$（分布收敛）。

**证明**：由独立于初始态的 Markov 更新定理，$\frac{1}{n} \sum_{k=0}^{n-1} \mathbf{1}_{\{X_k = j\}} \to \pi(j)$ a.s.。此为时间平均向空间平均的收敛。若链非周期，由更新定理的 Blackwell 形式，$p_{ij}^{(n)} \to 1 / \mathbb{E}[T_j \mid X_0 = j] = \pi(j)$。若链有周期 $d > 1$，则 $p_{ii}^{(nd)} \to d \pi(i)$ 而 $p_{ii}^{(nd+r)} \to 0$（$0 < r < d$）。$\blacksquare$

**定义 107.9**（周期）：状态 $i$ 的**周期** $d(i) = \gcd\{n \geq 1 : p_{ii}^{(n)} > 0\}$。若 $d(i) = 1$，则 $i$ 非周期。不可约链中所有状态周期相同。

### 107.4 可逆性与细致平衡

**定义 107.10**（细致平衡）：概率分布 $\pi$ 满足**细致平衡条件**（detailed balance），如果 $\pi(i) p_{ij} = \pi(j) p_{ji}$（对所有 $i, j$）。此时 $\pi$ 是平稳分布，链称为**可逆**的。

细致平衡条件比平稳分布方程 $\pi = \pi P$ 更强：它不仅要求全局概率流守恒，还要求每对状态之间的概率流量相等。这一更强的条件为构造以指定分布为平稳分布的 Markov 链提供了一个实用的设计原则，即 Metropolis-Hastings 算法和 Gibbs 抽样的理论基础。

**定理 107.6**（MCMC 的基本原理）：若目标分布 $\pi$ 难以直接抽样，可构造 Markov 链使其平稳分布为 $\pi$。Metropolis-Hastings 算法和 Gibbs 抽样是构造满足细致平衡的转移矩阵的标准方法。

**证明**：给定目标分布 $\pi$，构造转移核 $P$ 满足细致平衡 $\pi(i) p_{ij} = \pi(j) p_{ji}$。Metropolis-Hastings 算法：选择建议分布 $Q(j \mid i)$，定义接受概率 $\alpha_{ij} = \min\{1, \frac{\pi(j) Q(i \mid j)}{\pi(i) Q(j \mid i)}\}$。转移概率 $p_{ij} = Q(j \mid i) \alpha_{ij}$（$i \neq j$）和 $p_{ii} = 1 - \sum_{j \neq i} p_{ij}$。容易验证 $\pi(i) p_{ij} = \pi(j) p_{ji}$，故 $\pi$ 为平稳分布。由遍历定理，链的样本路径提供 $\pi$ 的渐近抽样。$\blacksquare$

---

---

---

---

---
---

## 第321章：Brown 运动与随机过程
Brown 运动（Wiener 过程）是最重要的连续时间随机过程，是随机分析的基础。本章给出 Brown 运动的构造、基本性质，并简要介绍连续时间鞅和 Itô 积分。

### 108.1 Brown 运动的定义与构造

**定义 108.1**（Brown 运动 / Wiener 过程）：随机过程 $\{B_t\}_{t \geq 0}$ 称为**标准 Brown 运动**（或 Wiener 过程），如果
1. $B_0 = 0$ 几乎必然
2. 独立增量：对 $0 \leq t_1 < t_2 < \cdots < t_n$，$B_{t_2} - B_{t_1}, \ldots, B_{t_n} - B_{t_{n-1}}$ 独立
3. 平稳增量：$B_t - B_s \sim \mathcal{N}(0, t - s)$（$0 \leq s < t$）
4. 样本路径 $t \mapsto B_t$ 几乎必然连续

**定理 108.1**（Brown 运动的存在性，Wiener 1923）：Brown 运动存在。可通过以下方式构造：
- 在 $C[0, \infty)$ 上定义 Wiener 测度（Kolmogorov 扩张定理）
- 或使用 Lévy-Ciesielski 构造（Schauder 基上的随机 Fourier 级数）

**证明**（Levy-Ciesielski）：在 $C[0,1]$ 上定义 Schauder 基。令 $B_t^{(N)} = \sum_{n=0}^N \sum_k Z_{n,k} \int_0^t h_{n,k}(s)ds$，$Z_{n,k} \sim \mathcal{N}(0,1)$ i.i.d.。由 Borel-Cantelli 引理，$\sup_t |B_t^{(N)} - B_t^{(M)}| \to 0$ a.s.，极限 $B_t$ 连续。由独立正态增量性质，$B_t - B_s \sim \mathcal{N}(0, t-s)$ 且独立于过去。$\blacksquare$

**命题 108.1**（Brown 运动的性质）：
1. 尺度不变性：$\{c^{-1/2} B_{ct}\}$ 也是 Brown 运动
2. 时间反演：$\{t B_{1/t}\}$（$t > 0$，$B_0 = 0$）是 Brown 运动
3. 反射原理：$\mathbb{P}(\max_{0 \leq s \leq t} B_s \geq a) = 2\mathbb{P}(B_t \geq a)$（$a > 0$）
4. 样本路径几乎必然无处可微（Paley-Wiener-Zygmund 定理）
5. 样本路径在 $[0, t]$ 上的变差无穷大（几乎必然），但二次变差为 $t$

### 108.2 Brown 运动的 Markov 性与强 Markov 性

Brown 运动的 Markov 性意味着：过程在任何固定时刻 $s$ 之后的未来行为与过去独立，且重新以 $B_s$ 为起点"重新开始"。但 Brown 运动还满足一个更强的性质：这一"重新开始"的性质不仅对固定时刻成立，对随机时刻——只要该时刻不依赖于未来信息（即停时）——同样成立。

**定理 108.2**（Markov 性）：Brown 运动是 Markov 过程：对 $s > 0$，$\{B_{t+s} - B_s\}_{t \geq 0}$ 是 Brown 运动且与 $\sigma(B_u, u \leq s)$ 独立。

**证明**：固定 $s > 0$。对任意 $n$ 及 $0 \leq t_1 < \cdots < t_n$，增量向量 $(B_{s+t_1} - B_s, \ldots, B_{s+t_n} - B_{s+t_{n-1}})$ 是独立正态变量且分布与 $(B_{t_1}, B_{t_2} - B_{t_1}, \ldots, B_{t_n} - B_{t_{n-1}})$ 相同。这些增量与 $\sigma(B_u, u \leq s)$ 独立，因为 Brown 运动的增量独立于过去。故 $W_t := B_{s+t} - B_s$ 是 Brown 运动且独立于 $\mathcal{F}_s$。$\blacksquare$

固定时刻的 Markov 性在多数应用场景中已足够强大，但在分析首次到达时间、反射原理等涉及随机退出时间的问题时，需要将 Markov 性推广到停时。强 Markov 性是 Brown 运动与一般连续参数 Markov 过程相比最本质的优势之一，其证明需借助停时的离散逼近和样本路径的右连续性。

**定理 108.3**（强 Markov 性）：设 $\tau$ 是关于 Brown 运动自然滤过的停时（$\tau < \infty$ 几乎必然）。则 $\{B_{\tau + t} - B_\tau\}_{t \geq 0}$ 是 Brown 运动且与 $\mathcal{F}_\tau$ 独立。

**证明**：对停时 $\tau$ 取值于 $\{k 2^{-n}\}$ 的离散近似 $\tau_n = \inf\{k 2^{-n} : k 2^{-n} \geq \tau\}$。对每个固定 $k 2^{-n}$，由 Markov 性，$B_{k 2^{-n} + t} - B_{k 2^{-n}}$ 与 $\mathcal{F}_{k 2^{-n}}$ 独立。当 $n \to \infty$，$\tau_n \downarrow \tau$。利用 $B_t$ 的右连续性，$B_{\tau_n + t} - B_{\tau_n} \to B_{\tau + t} - B_\tau$ 几乎必然。由停时定义，$\mathcal{F}_{\tau_n} \supseteq \mathcal{F}_\tau$，故独立性在极限下保持。有限维分布的极限为 $B_{\tau + t} - B_\tau$ 的相应分布。$\blacksquare$

强 Markov 性的一个精彩应用是 Blumenthal 0-1 律：Brown 运动在任意小的正时间区间内的行为完全由瞬时滤过 $\mathcal{F}_{0^+}$ 决定，而该 $\sigma$-代数的任何事件概率非 0 即 1。这意味着 Brown 运动在原点附近以概率 1 立即取正值也立即取负值，其路径在任意小的时间尺度上都表现出极端的振荡行为。

**定理 108.4**（Blumenthal 0-1 律）：设 $\mathcal{F}_{0^+} = \bigcap_{t > 0} \mathcal{F}_t$。则对 $A \in \mathcal{F}_{0^+}$，$\mathbb{P}(A) \in \{0, 1\}$。特别地，$\mathbb{P}(\sup_{[0, \varepsilon]} B_t > 0) = 1$（Brown 运动在原点附近立即取正值和负值）。

**证明**：$\mathcal{F}_{0^+}$ 是 Brown 运动无穷小尾 $\sigma$-代数。对 $A \in \mathcal{F}_{0^+}$ 和任意 $\delta > 0$，$A \in \mathcal{F}_\delta$。由 Markov 性，$A$ 与 $\sigma(B_{\delta + t} - B_\delta : t \geq 0)$ 独立，故 $A$ 与自身独立，$\mathbb{P}(A) = \mathbb{P}(A)^2 \in \{0,1\}$。对第二个断言，$\{\sup_{[0,\varepsilon]} B_t > 0\} \in \mathcal{F}_{0^+}$，由对称性该概率为正，故必为 1。$\blacksquare$

### 108.3 连续时间鞅

**定义 108.2**（连续时间鞅）：过程 $\{M_t\}_{t \geq 0}$ 关于滤过 $\{\mathcal{F}_t\}$ 是**鞅**，如果 $\mathbb{E}[|M_t|] < \infty$ 且 $\mathbb{E}[M_t \mid \mathcal{F}_s] = M_s$（$s < t$）。

**命题 108.2**（Brown 运动生成的鞅）：
1. $B_t$ 是鞅
2. $B_t^2 - t$ 是鞅
3. $\exp(\theta B_t - \theta^2 t/2)$ 是鞅（指数鞅）

**定理 108.5**（Doob 不等式，连续时间）：设 $\{M_t\}$ 是右连续下鞅。则

$$\mathbb{P}\left(\sup_{0 \leq s \leq t} |M_s| \geq \lambda\right) \leq \frac{\mathbb{E}[|M_t|]}{\lambda}$$

若 $M_t$ 是鞅且 $p > 1$，则 $\mathbb{E}[\sup_{0 \leq s \leq t} |M_s|^p] \leq \left(\frac{p}{p-1}\right)^p \mathbb{E}[|M_t|^p]$。

**证明**：对离散时间逼近：取分划 $0 = t_0 < t_1 < \cdots < t_n = t$，令 $M_k^{(n)} = M_{t_k}$。对离散鞅应用 Doob 不等式得 $\mathbb{P}(\max_k |M_{t_k}| \geq \lambda) \leq \mathbb{E}[|M_t|]/\lambda$。由右连续性，$\sup_{[0,t]} |M_s| = \lim_n \max_k |M_{t_k}|$（a.s.），取 $n \to \infty$ 极限即得连续时间版本。$L^p$ 版本由 $p>1$ 时 $|x|^p$ 的凸性及离散 Doob $L^p$ 不等式延拓得到。$\blacksquare$

### 108.4 Itô 积分简介

**定义 108.3**（Itô 积分，启发式）：对适应过程 $H_s$，Itô 积分 $\int_0^t H_s dB_s$ 定义为

$$\int_0^t H_s dB_s = \lim_{\|\Pi\| \to 0} \sum_{i} H_{t_i} (B_{t_{i+1}} - B_{t_i})$$

（在 $L^2$ 意义下），其中被积函数在区间左端点取值（非预见性）。

**定理 108.6**（Itô 公式）：设 $f(t, x)$ 是 $C^{1,2}$ 函数。则

$$df(t, B_t) = \frac{\partial f}{\partial t}(t, B_t) dt + \frac{\partial f}{\partial x}(t, B_t) dB_t + \frac{1}{2} \frac{\partial^2 f}{\partial x^2}(t, B_t) dt$$

最后一项是 Itô 修正项，来源于 Brown 运动的非零二次变差。

**证明**：Taylor 展开：$f(t+\Delta t, B_{t+\Delta t}) - f(t, B_t) = f_t \Delta t + f_x \Delta B_t + \frac{1}{2} f_{xx} (\Delta B_t)^2 + o(\Delta t)$。对于 Itô 积分，$\Delta B_t \approx dB_t$ 且 $(\Delta B_t)^2 \approx dt$（因 $\mathbb{E}[(\Delta B_t)^2] = \Delta t$，且其方差为 $O((\Delta t)^2)$）。取 Riemann 和极限，$(\Delta B_t)^2$ 项收敛于 $dt$ 而非 0——这是 Itô 公式区别于经典链式法则的关键。严格证明需验证 $(\Delta B_t)^2 - \Delta t$ 的 $L^2$ 收敛性，由 Brown 运动二次变差性质 $[B]_t = t$ 确保。$\blacksquare$

---


---

---

---

---

---