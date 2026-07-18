## 第271章：条件期望与鞅
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

**定理 106.3**（鞅收敛定理，Doob）：设 $\{M_n\}$ 是下鞅且 $\sup_n \mathbb{E}[|M_n|] < \infty$（或 $\sup_n \mathbb{E}[M_n^+] < \infty$）。则 $M_n$ 几乎必然收敛到某个可积随机变量 $M_\infty$。

*证明思路*：使用上穿不等式。若 $\{M_n\}$ 不收敛，则存在 $a < b$ 使得上穿次数无穷多。上穿不等式给出 $\mathbb{E}[U_n(a, b)] \leq (\mathbb{E}[M_n^+] + |a|)/(b - a)$ 有界，与无穷多次上穿矛盾。∎

**定理 106.4**（$L^p$ 鞅收敛定理）：若 $\{M_n\}$ 是鞅且 $\sup_n \mathbb{E}[|M_n|^p] < \infty$（$p > 1$），则 $M_n \to M_\infty$ 在 $L^p$ 中收敛。

### 106.4 可选停止定理

**定义 106.5**（停时）：随机变量 $\tau: \Omega \to \mathbb{N} \cup \{\infty\}$ 称为关于 $\{\mathcal{F}_n\}$ 的**停时**，如果 $\{\tau = n\} \in \mathcal{F}_n$（对所有 $n$）。即"是否停止"仅依赖于当前和过去的信息。

**定理 106.5**（可选停止定理，Doob）：设 $\{M_n\}$ 是鞅，$\tau$ 是停时。若以下条件之一成立：
1. $\tau$ 有界（$\tau \leq N$ 几乎必然）
2. $\{M_n\}$ 有界且 $\tau < \infty$ 几乎必然
3. $\mathbb{E}[\tau] < \infty$ 且 $|M_n - M_{n-1}| \leq C$（有界增量）

则 $\mathbb{E}[M_\tau] = \mathbb{E}[M_0]$。

*证明*：对情形 1，$M_{\tau \wedge N} = \sum_{n=0}^{N-1} M_n \mathbf{1}_{\{\tau = n\}} + M_N \mathbf{1}_{\{\tau \geq N\}}$ 是鞅，故 $\mathbb{E}[M_\tau] = \mathbb{E}[M_{\tau \wedge N}] = \mathbb{E}[M_0]$。∎

**定理 106.6**（Wald 等式）：设 $X_1, X_2, \ldots$ 是 i.i.d.，$\mathbb{E}[|X_1|] < \infty$，$\mu = \mathbb{E}[X_1]$。$\tau$ 是关于 $\{X_n\}$ 的停时，$\mathbb{E}[\tau] < \infty$。则 $\mathbb{E}[\sum_{i=1}^\tau X_i] = \mu \mathbb{E}[\tau]$。

---

---

---

---

---
---

## 第272章：Markov 链
Markov 链是"无记忆"的随机过程，其未来状态仅依赖于当前状态。本章讨论离散时间、可数状态空间的 Markov 链，包括转移概率、平稳分布和遍历定理。

### 107.1 Markov 链的定义

**定义 107.1**（Markov 链）：状态空间 $S$（可数集）上的随机过程 $\{X_n\}_{n \geq 0}$ 称为 **Markov 链**，如果满足 Markov 性：

$$\mathbb{P}(X_{n+1} = j \mid X_n = i, X_{n-1}, \ldots, X_0) = \mathbb{P}(X_{n+1} = j \mid X_n = i)$$

**定义 107.2**（时齐 Markov 链）：若 $\mathbb{P}(X_{n+1} = j \mid X_n = i) = p_{ij}$（与 $n$ 无关），则称链是**时齐**的。矩阵 $P = (p_{ij})_{i,j \in S}$ 称为**转移矩阵**（每行和为 $1$）。

**定义 107.3**（$n$ 步转移概率）：$p_{ij}^{(n)} = \mathbb{P}(X_n = j \mid X_0 = i) = (P^n)_{ij}$。由 Chapman-Kolmogorov 方程：$p_{ij}^{(n+m)} = \sum_{k \in S} p_{ik}^{(n)} p_{kj}^{(m)}$。

**命题 107.1**：Markov 链的分布由初始分布 $\pi_0$（$\pi_0(i) = \mathbb{P}(X_0 = i)$）和转移矩阵 $P$ 完全确定：$\pi_n = \pi_0 P^n$。

### 107.2 状态的分类

**定义 107.4**（可达与互通）：$j$ 从 $i$ **可达**（$i \to j$）如果存在 $n \geq 0$ 使得 $p_{ij}^{(n)} > 0$。$i$ 和 $j$ 互通（$i \leftrightarrow j$）如果 $i \to j$ 且 $j \to i$。互通是等价关系，等价类称为**互通类**。

**定义 107.5**（常返与瞬时）：状态 $i$ 称为**常返**的，如果 $\mathbb{P}(X_n = i \text{ 无穷多次} \mid X_0 = i) = 1$。否则称为**瞬时**的。

**定理 107.2**（常返性的判别）：$i$ 常返当且仅当 $\sum_{n=1}^\infty p_{ii}^{(n)} = \infty$。$i$ 瞬时当且仅当 $\sum_{n=1}^\infty p_{ii}^{(n)} < \infty$。

**定义 107.6**（正常返与零常返）：常返状态 $i$ 称为**正常返**的，如果 $\mathbb{E}[T_i \mid X_0 = i] < \infty$（$T_i = \inf\{n \geq 1 : X_n = i\}$ 是首次返回时间）。否则称为**零常返**。

**定义 107.7**（不可约）：Markov 链称为**不可约**的，如果所有状态互通（只有一个互通类）。

**定理 107.3**：对不可约 Markov 链，所有状态同时为瞬时、零常返或正常返（固态性）。

### 107.3 平稳分布

**定义 107.8**（平稳分布）：概率分布 $\pi = (\pi(i))_{i \in S}$ 称为**平稳分布**（或不变测度），如果 $\pi = \pi P$（即 $\pi(j) = \sum_{i \in S} \pi(i) p_{ij}$）。若 $\pi_0 = \pi$，则 $\pi_n = \pi$ 对所有 $n$。

**定理 107.4**（平稳分布的存在性）：不可约 Markov 链有平稳分布当且仅当它是正常返的。此时平稳分布唯一，且 $\pi(i) = 1 / \mathbb{E}[T_i \mid X_0 = i]$。

**定理 107.5**（Markov 链遍历定理）：设不可约正常返 Markov 链有平稳分布 $\pi$。则

$$\lim_{n \to \infty} \frac{1}{n} \sum_{k=0}^{n-1} \mathbf{1}_{\{X_k = j\}} = \pi(j) \quad \text{几乎必然}$$

即时间平均收敛于空间平均。若链是非周期的，则 $\lim_{n \to \infty} p_{ij}^{(n)} = \pi(j)$（分布收敛）。

**定义 107.9**（周期）：状态 $i$ 的**周期** $d(i) = \gcd\{n \geq 1 : p_{ii}^{(n)} > 0\}$。若 $d(i) = 1$，则 $i$ 非周期。不可约链中所有状态周期相同。

### 107.4 可逆性与细致平衡

**定义 107.10**（细致平衡）：概率分布 $\pi$ 满足**细致平衡条件**（detailed balance），如果 $\pi(i) p_{ij} = \pi(j) p_{ji}$（对所有 $i, j$）。此时 $\pi$ 是平稳分布，链称为**可逆**的。

**定理 107.6**（MCMC 的基本原理）：若目标分布 $\pi$ 难以直接抽样，可构造 Markov 链使其平稳分布为 $\pi$。Metropolis-Hastings 算法和 Gibbs 抽样是构造满足细致平衡的转移矩阵的标准方法。

---

---

---

---

---
---

## 第273章：Brown 运动与随机过程
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

**命题 108.1**（Brown 运动的性质）：
1. 尺度不变性：$\{c^{-1/2} B_{ct}\}$ 也是 Brown 运动
2. 时间反演：$\{t B_{1/t}\}$（$t > 0$，$B_0 = 0$）是 Brown 运动
3. 反射原理：$\mathbb{P}(\max_{0 \leq s \leq t} B_s \geq a) = 2\mathbb{P}(B_t \geq a)$（$a > 0$）
4. 样本路径几乎必然无处可微（Paley-Wiener-Zygmund 定理）
5. 样本路径在 $[0, t]$ 上的变差无穷大（几乎必然），但二次变差为 $t$

### 108.2 Brown 运动的 Markov 性与强 Markov 性

**定理 108.2**（Markov 性）：Brown 运动是 Markov 过程：对 $s > 0$，$\{B_{t+s} - B_s\}_{t \geq 0}$ 是 Brown 运动且与 $\sigma(B_u, u \leq s)$ 独立。

**定理 108.3**（强 Markov 性）：设 $\tau$ 是关于 Brown 运动自然滤过的停时（$\tau < \infty$ 几乎必然）。则 $\{B_{\tau + t} - B_\tau\}_{t \geq 0}$ 是 Brown 运动且与 $\mathcal{F}_\tau$ 独立。

**定理 108.4**（Blumenthal 0-1 律）：设 $\mathcal{F}_{0^+} = \bigcap_{t > 0} \mathcal{F}_t$。则对 $A \in \mathcal{F}_{0^+}$，$\mathbb{P}(A) \in \{0, 1\}$。特别地，$\mathbb{P}(\sup_{[0, \varepsilon]} B_t > 0) = 1$（Brown 运动在原点附近立即取正值和负值）。

### 108.3 连续时间鞅

**定义 108.2**（连续时间鞅）：过程 $\{M_t\}_{t \geq 0}$ 关于滤过 $\{\mathcal{F}_t\}$ 是**鞅**，如果 $\mathbb{E}[|M_t|] < \infty$ 且 $\mathbb{E}[M_t \mid \mathcal{F}_s] = M_s$（$s < t$）。

**命题 108.2**（Brown 运动生成的鞅）：
1. $B_t$ 是鞅
2. $B_t^2 - t$ 是鞅
3. $\exp(\theta B_t - \theta^2 t/2)$ 是鞅（指数鞅）

**定理 108.5**（Doob 不等式，连续时间）：设 $\{M_t\}$ 是右连续下鞅。则

$$\mathbb{P}\left(\sup_{0 \leq s \leq t} |M_s| \geq \lambda\right) \leq \frac{\mathbb{E}[|M_t|]}{\lambda}$$

若 $M_t$ 是鞅且 $p > 1$，则 $\mathbb{E}[\sup_{0 \leq s \leq t} |M_s|^p] \leq \left(\frac{p}{p-1}\right)^p \mathbb{E}[|M_t|^p]$。

### 108.4 Itô 积分简介

**定义 108.3**（Itô 积分，启发式）：对适应过程 $H_s$，Itô 积分 $\int_0^t H_s dB_s$ 定义为

$$\int_0^t H_s dB_s = \lim_{\|\Pi\| \to 0} \sum_{i} H_{t_i} (B_{t_{i+1}} - B_{t_i})$$

（在 $L^2$ 意义下），其中被积函数在区间左端点取值（非预见性）。

**定理 108.6**（Itô 公式）：设 $f(t, x)$ 是 $C^{1,2}$ 函数。则

$$df(t, B_t) = \frac{\partial f}{\partial t}(t, B_t) dt + \frac{\partial f}{\partial x}(t, B_t) dB_t + \frac{1}{2} \frac{\partial^2 f}{\partial x^2}(t, B_t) dt$$

最后一项是 Itô 修正项，来源于 Brown 运动的非零二次变差。

---


---

---

---

---

---