# 卷三十：计算理论

> 计算理论是计算机科学的数学基础，研究计算的本质、能力和极限。本卷在数理逻辑（V20 Ch 101 递归论）的基础上，建立自动机理论、形式语言、可计算性深化和计算复杂性分类（P/NP/PSPACE）。计算复杂性理论是当代数学中最重要的未解决问题之一（P vs NP 问题）的所在地。

---

## 第366章（补充）
> 数理逻辑研究数学推理本身的形式化。本卷从一阶逻辑的语法和语义出发，证明 Gödel 完备性定理；然后建立模型论、递归论和可计算性理论的基础；最后证明 Gödel 不完全性定理——20 世纪数学最深刻的成果之一，并引入集合论的进阶内容（序数、基数、连续统假设）。

---

---

## 第99章：一阶逻辑完备性
一阶逻辑是数学推理的标准形式化框架。本章从语法（形式语言、证明系统）和语义（结构、真值）两方面建立一阶逻辑，并证明 Gödel 完备性定理：语义真蕴含语法可证。

### 99.1 一阶语言

**定义 99.1**（一阶语言）：一个**一阶语言** $\mathcal{L}$ 由以下符号组成：
- **逻辑符号**：变元 $x_1, x_2, \ldots$；连接词 $\neg, \land, \lor, \to$；量词 $\forall, \exists$；等号 $=$（通常包含）
- **非逻辑符号**：常数符号 $\{c_i\}$；函数符号 $\{f_j\}$（带元数）；关系符号 $\{R_k\}$（带元数）

**定义 99.2**（项与公式）：$\mathcal{L}$ 的**项**归纳定义：变元和常数是项；若 $f$ 是 $n$ 元函数符号，$t_1, \ldots, t_n$ 是项，则 $f(t_1, \ldots, t_n)$ 是项。

**原子公式**为 $R(t_1, \ldots, t_n)$（$R$ 是 $n$ 元关系符号）或 $t_1 = t_2$。**公式**由原子公式通过连接词和量词递归构造。

**定义 99.3**（句子与自由变元）：不含自由变元的公式称为**句子**。一个**理论** $T$ 是一组 $\mathcal{L}$-句子的集合。

### 99.2 语义

**定义 99.4**（$\mathcal{L}$-结构）：$\mathcal{L}$ 的一个**结构**（或模型）$\mathfrak{A}$ 由以下组成：
- 一个非空集合 $A$（论域）
- 对每个常数符号 $c$，$\mathfrak{A}$ 中一个元素 $c^{\mathfrak{A}} \in A$
- 对每个 $n$ 元函数符号 $f$，一个函数 $f^{\mathfrak{A}}: A^n \to A$
- 对每个 $n$ 元关系符号 $R$，一个关系 $R^{\mathfrak{A}} \subseteq A^n$

**定义 99.5**（真值，Tarski 真定义）：对 $\mathcal{L}$-结构 $\mathfrak{A}$ 和句子 $\varphi$，$\mathfrak{A} \models \varphi$（$\varphi$ 在 $\mathfrak{A}$ 中为真）由 Tarski 真定义递归定义：
- $\mathfrak{A} \models R(t_1, \ldots, t_n)$ 当且仅当 $(t_1^{\mathfrak{A}}, \ldots, t_n^{\mathfrak{A}}) \in R^{\mathfrak{A}}$
- $\mathfrak{A} \models \neg \varphi$ 当且仅当 $\mathfrak{A} \not\models \varphi$
- $\mathfrak{A} \models \varphi \land \psi$ 当且仅当 $\mathfrak{A} \models \varphi$ 且 $\mathfrak{A} \models \psi$
- $\mathfrak{A} \models \forall x \varphi(x)$ 当且仅当对每个 $a \in A$，$\mathfrak{A} \models \varphi(a)$

**定义 99.6**（逻辑蕴含）：$T \models \varphi$ 表示对每个 $\mathcal{L}$-结构 $\mathfrak{A}$，若 $\mathfrak{A} \models T$（即 $\mathfrak{A}$ 满足 $T$ 中所有句子），则 $\mathfrak{A} \models \varphi$。

### 99.3 证明系统

**定义 99.7**（Hilbert 式证明系统）：一阶逻辑的公理包括：
1. 命题逻辑公理（重言式）
2. $\forall x \varphi(x) \to \varphi(t)$（$t$ 对 $\varphi$ 中 $x$ 可代入）
3. $\forall x (\varphi \to \psi) \to (\forall x \varphi \to \forall x \psi)$
4. $\varphi \to \forall x \varphi$（$x$ 不在 $\varphi$ 中自由）
5. 等号公理：$x = x$，$x = y \to y = x$，$(x = y \land y = z) \to x = z$，以及函数和关系的代换公理

推理规则：**Modus Ponens**（从 $\varphi$ 和 $\varphi \to \psi$ 推出 $\psi$）和 **全称概括**（Generalization：从 $\varphi$ 推出 $\forall x \varphi$，要求 $x$ 不在前提中自由出现）。

**定义 99.8**（可证性）：$T \vdash \varphi$ 表示存在从 $T$ 中公理出发、使用推理规则得到的 $\varphi$ 的有限证明序列。

### 99.4 Gödel 完备性定理

**定理 99.1**（可靠性定理）：若 $T \vdash \varphi$，则 $T \models \varphi$。

*证明*：对证明长度归纳。公理在任意结构中为真，推理规则保持真值。∎

**定理 99.2**（Gödel 完备性定理，1929）：若 $T \models \varphi$，则 $T \vdash \varphi$。等价地，每个一致的理论（$T \nvdash \bot$）有模型。

*证明思路*（Henkin 构造，1949）：
1. 将语言 $\mathcal{L}$ 扩展为 $\mathcal{L}^*$（添加 Henkin 常元：对每个 $\exists x \varphi(x)$，添加常元 $c_\varphi$ 和公理 $\exists x \varphi(x) \to \varphi(c_\varphi)$）。
2. 将 $T$ 扩展为极大一致理论 $T^*$（Lindenbaum 引理，使用 Zorn 引理）。
3. 从 $T^*$ 构造 Henkin 模型：论域为 $\mathcal{L}^*$ 的闭项等价类，函数和关系由 $T^*$ 中的等词决定。
4. 验证此模型满足 $T^*$（从而满足 $T$）：对公式复杂度归纳。∎

**推论 99.3**（紧致性定理）：若 $T$ 的每个有限子集有模型，则 $T$ 有模型。

*证明*：若 $T$ 无模型，由完备性定理，$T \vdash \bot$。证明是有限的，仅用到 $T$ 的有限子集 $T_0$。故 $T_0 \vdash \bot$，由可靠性，$T_0$ 无模型，矛盾。∎

**推论 99.4**（Löwenheim-Skolem 定理，向下）：若可数语言 $\mathcal{L}$ 的理论 $T$ 有无限模型，则 $T$ 有任意无限基数 $\kappa \geq \aleph_0$ 的模型（向上 Löwenheim-Skolem：若 $T$ 有无限模型，则 $T$ 有任意基数 $\kappa \geq |\mathcal{L}|$ 的模型）。

*证明*（向上）：添加 $\kappa$ 个新常元 $\{c_\alpha\}_{\alpha < \kappa}$ 和公理 $c_\alpha \neq c_\beta$（$\alpha \neq \beta$）。每个有限子集有模型（原无限模型可解释有限个新常元为不同元素）。由紧致性，整个理论有模型，其基数 $\geq \kappa$。∎

---

---

## 第100章：模型论基础
模型论研究数学结构与其一阶理论之间的关系。本章引入初等等价、初等子模型和模型完备性等基本概念。

### 100.1 初等等价与初等扩张

**定义 100.1**（初等等价）：两个 $\mathcal{L}$-结构 $\mathfrak{A}$ 和 $\mathfrak{B}$ 称为**初等等价**的（记作 $\mathfrak{A} \equiv \mathfrak{B}$），如果它们满足相同的 $\mathcal{L}$-句子。

**定义 100.2**（初等子模型）：$\mathfrak{A} \preceq \mathfrak{B}$（$\mathfrak{A}$ 是 $\mathfrak{B}$ 的**初等子模型**），如果 $\mathfrak{A} \subseteq \mathfrak{B}$ 且对每个 $\mathcal{L}$-公式 $\varphi(x_1, \ldots, x_n)$ 和 $a_1, \ldots, a_n \in A$，

$$\mathfrak{A} \models \varphi(a_1, \ldots, a_n) \iff \mathfrak{B} \models \varphi(a_1, \ldots, a_n)$$

**定理 100.1**（Tarski-Vaught 判别法）：$\mathfrak{A} \subseteq \mathfrak{B}$ 是初等子模型当且仅当对每个 $\mathcal{L}$-公式 $\varphi(x, y_1, \ldots, y_n)$ 和 $a_1, \ldots, a_n \in A$，若 $\mathfrak{B} \models \exists x \varphi(x, a_1, \ldots, a_n)$，则存在 $a \in A$ 使得 $\mathfrak{B} \models \varphi(a, a_1, \ldots, a_n)$。

### 100.2 Löwenheim-Skolem 定理

**定理 100.2**（向下 Löwenheim-Skolem 定理）：设 $\mathfrak{A}$ 是 $\mathcal{L}$-结构，$X \subseteq A$ 是子集。则存在 $\mathfrak{A}$ 的初等子模型 $\mathfrak{B} \preceq \mathfrak{A}$ 包含 $X$，且 $|B| \leq \max(|X|, |\mathcal{L}|, \aleph_0)$。

*证明*：构造地封闭 $X$ 在 Skolem 函数下。对每个 $\mathcal{L}$-公式 $\exists y \varphi(y, x_1, \ldots, x_n)$，选择 Skolem 函数 $f_\varphi$ 满足 $\mathfrak{A} \models \exists y \varphi(y, a_1, \ldots, a_n) \to \varphi(f_\varphi(a_1, \ldots, a_n), a_1, \ldots, a_n)$。$\mathcal{L}$ 的 Skolem 扩张为 $\mathcal{L}^S$。取 $X$ 在 Skolem 函数下的闭包 $B$，则 $|B| \leq \max(|X|, |\mathcal{L}|, \aleph_0)$，且 $\mathfrak{B} \preceq \mathfrak{A}$。∎

**推论 100.3**（Skolem 悖论）：若 ZFC 集合论一致，则它有可数模型（由向下 Löwenheim-Skolem）。但在此可数模型中，可以证明"存在不可数集合"（Cantor 定理在模型内部成立）。这不是矛盾，而是"不可数"在模型内部和外部的含义不同。

### 100.3 量词消去与模型完备性

**定义 100.3**（量词消去）：理论 $T$ 称为有**量词消去**，如果每个 $\mathcal{L}$-公式等价于（在 $T$ 中）一个无量词公式。

**定理 100.4**（量词消去的判别法）：$T$ 有量词消去当且仅当对任意 $\mathfrak{A}, \mathfrak{B} \models T$，$\mathfrak{C} \subseteq \mathfrak{A}, \mathfrak{B}$ 是公共子结构，以及无量词公式 $\varphi(x, \bar{y})$ 和 $\bar{c} \in C$，若 $\mathfrak{A} \models \exists x \varphi(x, \bar{c})$，则 $\mathfrak{B} \models \exists x \varphi(x, \bar{c})$。

**例 100.1**（有量词消去的理论）：
- 代数闭域理论 ACF（量词消去，Tarski）
- 实闭域理论 RCF（量词消去，Tarski-Seidenberg）
- 无端点稠密线序理论 DLO（量词消去）

**定义 100.4**（模型完备性）：理论 $T$ 称为**模型完备**的，如果对任意 $\mathfrak{A}, \mathfrak{B} \models T$，$\mathfrak{A} \subseteq \mathfrak{B}$ 推出 $\mathfrak{A} \preceq \mathfrak{B}$。

**定理 100.5**（Robinson 判别法）：$T$ 是模型完备的当且仅当对任意 $\mathfrak{A}, \mathfrak{B} \models T$ 和 $\mathfrak{A} \subseteq \mathfrak{B}$，每个存在公式（$\exists \bar{x} \varphi(\bar{x}, \bar{y})$，$\varphi$ 无量词）在 $\mathfrak{B}$ 中满足的元素也在 $\mathfrak{A}$ 中满足。

---

---

## 第101章：递归论与可计算性
递归论（可计算性理论）研究哪些函数是可计算的，以及不可计算问题的层级。本章从 Turing 机出发，定义可计算函数，并证明停机问题的不可判定性。

### 101.1 Turing 机

**定义 101.1**（Turing 机）：一个 **Turing 机** $M$ 由以下组成：
- 有限状态集 $Q$（包含初始状态 $q_0$ 和停机状态 $q_{\text{halt}}$）
- 有限带符号集 $\Gamma$（包含空白符号 $\sqcup$）
- 输入符号集 $\Sigma \subseteq \Gamma \setminus \{\sqcup\}$
- 转移函数 $\delta: Q \times \Gamma \to Q \times \Gamma \times \{L, R\}$

Turing 机有一条无限长的带（双向无限），初始时输入写在带上，读写头在输入最左端，状态为 $q_0$。每一步根据当前状态和读写头下的符号，按 $\delta$ 写入新符号、移动读写头（左/右）并改变状态。

**定义 101.2**（Turing 可计算）：部分函数 $f: \mathbb{N}^k \to \mathbb{N}$（或 $f: \Sigma^* \to \Sigma^*$）称为 **Turing 可计算**的，如果存在 Turing 机 $M$，对每个输入 $\bar{x}$，$M$ 在 $f(\bar{x})$ 有定义时停机且输出 $f(\bar{x})$，否则 $M$ 永不停机。

**Church-Turing 论题**：直观上"可计算"的函数恰好是 Turing 可计算的函数。所有其他计算模型（$\lambda$ 演算、一般递归函数、寄存器机等）都定义了相同的可计算函数类。

### 101.2 递归函数与递归可枚举集

**定义 101.3**（原始递归函数）：**原始递归函数**类是最小的包含以下函数且在复合和原始递归下封闭的函数类：
- 零函数：$Z(n) = 0$
- 后继函数：$S(n) = n + 1$
- 投影函数：$P_i^n(x_1, \ldots, x_n) = x_i$
- 原始递归：$f(0, \bar{y}) = g(\bar{y})$，$f(n+1, \bar{y}) = h(n, f(n, \bar{y}), \bar{y})$

**定义 101.4**（部分递归函数）：**部分递归函数**是原始递归函数加上极小化算子 $\mu$：$f(\bar{x}) = \mu y [g(\bar{x}, y) = 0]$（最小的 $y$ 使得 $g(\bar{x}, y) = 0$，且所有 $g(\bar{x}, z)$（$z < y$）有定义且非零）。

**定理 101.1**：Turing 可计算函数类 = 部分递归函数类。

**定义 101.5**（递归集与递归可枚举集）：$A \subseteq \mathbb{N}$ 称为
- **递归集**（可判定集）：其特征函数 $\chi_A$ 是可计算的（总函数）
- **递归可枚举集**（r.e. 集）：$A = \emptyset$ 或 $A$ 是某个可计算总函数的值域

**命题 101.2**：$A$ 是递归的当且仅当 $A$ 和 $\mathbb{N} \setminus A$ 都是 r.e. 的。存在 r.e. 但非递归的集合。

### 101.3 停机问题与不可判定性

**定义 101.6**（停机问题）：**停机问题** $K = \{\langle M, x \rangle : M \text{ 在输入 } x \text{ 上停机}\}$，其中 $\langle M, x \rangle$ 是 $M$ 和 $x$ 的某种编码。

**定理 101.3**（停机问题的不可判定性，Turing 1936）：$K$ 不是递归集（不可判定）。

*证明*：假设存在 Turing 机 $H$ 判定 $K$。构造 Turing 机 $D$：在输入 $M$（Turing 机的编码）上，$D$ 使用 $H$ 判断 $M$ 在输入 $M$ 上是否停机。若停机，则 $D$ 进入无限循环；若不停机，则 $D$ 停机。那么 $D$ 在输入 $D$ 上停机当且仅当 $D$ 在输入 $D$ 上不停机，矛盾。∎

**推论 101.4**（一阶逻辑的不可判定性，Church 1936）：一阶逻辑的有效性（$\models \varphi$？）是不可判定的。即不存在算法能判定任意一阶公式是否为逻辑有效式。

### 101.4 算术层次

**定义 101.7**（算术层次）：$\Sigma_1^0$ 公式形如 $\exists x_1 \cdots \exists x_n \varphi$，其中 $\varphi$ 仅含受囿量词。$\Pi_1^0$ 公式形如 $\forall x_1 \cdots \forall x_n \varphi$。$\Sigma_{n+1}^0$ 形如 $\exists \bar{x} \psi$，$\psi \in \Pi_n^0$。$\Pi_{n+1}^0$ 形如 $\forall \bar{x} \psi$，$\psi \in \Sigma_n^0$。

**定理 101.5**：$A \subseteq \mathbb{N}$ 是 r.e. 当且仅当 $A$ 是 $\Sigma_1^0$-可定义的（在 $\mathbb{N}$ 的标准模型中）。递归集恰好是 $\Delta_1^0 = \Sigma_1^0 \cap \Pi_1^0$ 可定义的。

---

---

## 第102章：不完全性定理
Gödel 不完全性定理（1931）是数理逻辑和数学基础的里程碑式成果。它表明：任何包含基本算术的一致递归公理系统都是不完全的——存在该系统无法证明也无法否证的命题。

### 102.1 算术的形式化

**定义 102.1**（Peano 算术，PA）：PA 的语言为 $\mathcal{L}_{PA} = \{0, S, +, \cdot\}$（V1 中的 Peano 公理的形式化）。公理包括：
1. $\forall x (S(x) \neq 0)$
2. $\forall x \forall y (S(x) = S(y) \to x = y)$
3. $\forall x (x + 0 = x)$
4. $\forall x \forall y (x + S(y) = S(x + y))$
5. $\forall x (x \cdot 0 = 0)$
6. $\forall x \forall y (x \cdot S(y) = x \cdot y + x)$
7. 归纳公理模式：对每个公式 $\varphi(x, \bar{y})$，$[\varphi(0, \bar{y}) \land \forall x (\varphi(x, \bar{y}) \to \varphi(S(x), \bar{y}))] \to \forall x \varphi(x, \bar{y})$

### 102.2 Gödel 编码

**定义 102.2**（Gödel 编码）：Gödel 编码（或 Gödel 数）是 $\mathcal{L}_{PA}$ 的符号、公式和证明序列到 $\mathbb{N}$ 的单射编码。记 $\ulcorner \varphi \urcorner$ 为公式 $\varphi$ 的 Gödel 数。

**引理 102.1**（可表示性）：以下关系和函数在 PA 中可表示（即存在公式定义它们，PA 能证明其基本性质）：
- $\operatorname{Prf}_{PA}(x, y)$：$x$ 是 $y$ 的 PA 证明的 Gödel 数
- $\operatorname{Prov}_{PA}(y) = \exists x \operatorname{Prf}_{PA}(x, y)$：$y$ 是 PA 可证公式的 Gödel 数
- 对角化函数 $d$：$d(\ulcorner \varphi(x) \urcorner) = \ulcorner \varphi(\ulcorner \varphi(x) \urcorner) \urcorner$

### 102.3 第一不完全性定理

**定理 102.1**（Gödel 第一不完全性定理）：设 $T$ 是包含 PA 的一致递归公理化理论。则存在 $\mathcal{L}_{PA}$-句子 $G_T$（Gödel 句子）使得 $T \nvdash G_T$ 且 $T \nvdash \neg G_T$（假设 $T$ 是 $\omega$-一致的或 $\Sigma_1$-可靠的）。

*证明*（Gödel 1931）：
1. 构造自指句子：由对角引理，存在句子 $G_T$ 满足 $T \vdash G_T \leftrightarrow \neg \operatorname{Prov}_T(\ulcorner G_T \urcorner)$。$G_T$ 断言"$G_T$ 在 $T$ 中不可证"。
2. 若 $T \vdash G_T$，则 $T \vdash \operatorname{Prov}_T(\ulcorner G_T \urcorner)$（由 $\Sigma_1$-完备性：$T$ 能证明每个真 $\Sigma_1$ 句子）。但 $T \vdash G_T \to \neg \operatorname{Prov}_T(\ulcorner G_T \urcorner)$，矛盾。
3. 若 $T \vdash \neg G_T$，则 $T \vdash \operatorname{Prov}_T(\ulcorner G_T \urcorner)$。由 $\omega$-一致性（或 $\Sigma_1$-可靠性），这蕴含 $T \vdash G_T$，矛盾。故 $T$ 既不能证明也不能否证 $G_T$。∎

**推论 102.2**（不可完备性）：不存在包含 PA 的一致递归公理化完备理论。数学真理不能完全被形式系统捕获。

**定理 102.3**（Rosser 变体，1936）：Gödel 第一不完全性定理仅需 $T$ 的一致性（不需要 $\omega$-一致性）。Rosser 句子 $R_T$ 满足 $R_T \leftrightarrow \forall x (\operatorname{Prf}_T(x, \ulcorner R_T \urcorner) \to \exists y < x \operatorname{Prf}_T(y, \ulcorner \neg R_T \urcorner))$。

### 102.4 第二不完全性定理

**定义 102.3**（一致性陈述）：$\operatorname{Con}_T = \neg \operatorname{Prov}_T(\ulcorner 0 = 1 \urcorner)$（或 $\neg \operatorname{Prov}_T(\ulcorner \bot \urcorner)$）。$\operatorname{Con}_T$ 断言 $T$ 是一致的。

**定理 102.4**（Gödel 第二不完全性定理）：设 $T$ 是包含 PA 的一致递归公理化理论。则 $T \nvdash \operatorname{Con}_T$。即 $T$ 不能证明自身的一致性。

*证明思路*：第一不完全性定理的证明可以在 $T$ 内部形式化，得到 $T \vdash \operatorname{Con}_T \to G_T$。因此若 $T \vdash \operatorname{Con}_T$，则 $T \vdash G_T$，与第一不完全性定理矛盾。∎

**推论 102.5**：ZFC 集合论的一致性不能在 ZFC 内部证明。Hilbert 计划（用有限方法证明数学的一致性）被 Gödel 不完全性定理从根本上限制。

---

---

## 第103章：集合论进阶
本章在 V1（ZFC 集合论基础）的基础上，深入序数、基数的算术和连续统假设。

### 103.1 序数与超限归纳

**定义 103.1**（序数，von Neumann 定义）：一个集合 $\alpha$ 称为**序数**，如果 $\alpha$ 是传递的（即 $\beta \in \alpha \Rightarrow \beta \subseteq \alpha$）且 $\alpha$ 在 $\in$ 下是良序的。

**例 103.1**：$0 = \varnothing$，$1 = \{0\}$，$2 = \{0, 1\}$，$\ldots$，$\omega = \{0, 1, 2, \ldots\}$（第一个无穷序数），$\omega + 1 = \omega \cup \{\omega\}$，$\ldots$。

**定理 103.1**（超限归纳法）：若对每个序数 $\alpha$，$(\forall \beta < \alpha) P(\beta)$ 推出 $P(\alpha)$，则 $P(\alpha)$ 对所有序数 $\alpha$ 成立。

**定理 103.2**（超限递归定义）：对任意给定的类函数 $G$，存在唯一的类函数 $F$ 定义在所有序数上，满足 $F(\alpha) = G(F \restriction \alpha)$。

**定义 103.2**（序数算术）：
- $\alpha + 0 = \alpha$，$\alpha + (\beta + 1) = (\alpha + \beta) + 1$，$\alpha + \lambda = \sup_{\beta < \lambda} (\alpha + \beta)$（极限序数 $\lambda$）
- $\alpha \cdot 0 = 0$，$\alpha \cdot (\beta + 1) = \alpha \cdot \beta + \alpha$，$\alpha \cdot \lambda = \sup_{\beta < \lambda} (\alpha \cdot \beta)$
- $\alpha^0 = 1$，$\alpha^{\beta+1} = \alpha^\beta \cdot \alpha$，$\alpha^\lambda = \sup_{\beta < \lambda} \alpha^\beta$

注意：序数加法和乘法不交换（$1 + \omega = \omega \neq \omega + 1$）。

### 103.2 基数

**定义 103.3**（基数）：序数 $\kappa$ 称为**基数**（或初始序数），如果对所有 $\alpha < \kappa$，$|\alpha| < |\kappa|$（即不存在 $\alpha$ 到 $\kappa$ 的双射）。

**定义 103.4**（$\aleph$ 序列）：$\aleph_0 = \omega$。$\aleph_{\alpha+1} = \min\{\kappa : \kappa > \aleph_\alpha\}$（$\aleph_\alpha$ 的后继基数）。$\aleph_\lambda = \sup_{\alpha < \lambda} \aleph_\alpha$（极限序数 $\lambda$）。

**定理 103.3**（Cantor 定理）：对任意集合 $X$，$|X| < |\mathcal{P}(X)|$。特别地，$\aleph_\alpha < 2^{\aleph_\alpha}$。

*证明*：$f: X \to \mathcal{P}(X)$ 不是满射：考虑 $D = \{x \in X : x \notin f(x)\}$。若 $D = f(d)$，则 $d \in D \iff d \notin f(d) = D$，矛盾。∎

**定义 103.5**（基数算术）：对基数 $\kappa, \lambda$：
- $\kappa + \lambda = |\kappa \sqcup \lambda|$
- $\kappa \cdot \lambda = |\kappa \times \lambda|$
- $\kappa^\lambda = |\{f: \lambda \to \kappa\}|$

**定理 103.4**（基数算术基本定理）：对无穷基数 $\kappa, \lambda$：
- $\kappa + \lambda = \kappa \cdot \lambda = \max(\kappa, \lambda)$（若 $\kappa, \lambda > 0$）
- $\kappa^\kappa = 2^\kappa$

**定理 103.5**（König 定理）：对基数 $\kappa_i < \lambda_i$（$i \in I$），$\sum_{i \in I} \kappa_i < \prod_{i \in I} \lambda_i$。

### 103.3 选择公理的等价形式

**定理 103.6**（选择公理，AC）：以下陈述在 ZF 中等价：
1. **选择公理**：对任意非空集合族 $\{X_i\}_{i \in I}$，存在选择函数 $f: I \to \bigcup_i X_i$ 使得 $f(i) \in X_i$
2. **Zorn 引理**：若非空偏序集中每条链有上界，则该偏序集有极大元
3. **良序定理**：每个集合可被良序
4. **Tychonoff 定理**：紧致空间的任意积是紧致的（V10 Ch 58）
5. 每个向量空间有基（V7 Ch 32）
6. 每个满射有右逆

**定理 103.7**（基数比较定理，在 AC 下）：对任意两个集合 $X, Y$，$|X| \leq |Y|$ 或 $|Y| \leq |X|$。即任意两个基数可比较。

### 103.4 连续统假设

**定义 103.6**（连续统假设，CH）：**连续统假设**断言 $2^{\aleph_0} = \aleph_1$。即实数集 $\mathbb{R}$ 的基数是第一个不可数基数。

**广义连续统假设（GCH）**：对所有序数 $\alpha$，$2^{\aleph_\alpha} = \aleph_{\alpha+1}$。

**定理 103.8**（Gödel 1938，Cohen 1963）：
1. 若 ZF 一致，则 ZFC + GCH 一致（Gödel：CH 在 ZFC 中不可否证，即可构造宇宙 $L$ 满足 GCH）
2. 若 ZFC 一致，则 ZFC + $\neg$CH 一致（Cohen：力迫法，CH 在 ZFC 中不可证明）

CH 独立于 ZFC！这是数理逻辑最著名的独立性结果。Cohen 因此获得 Fields 奖（1966）。

**定义 103.7**（可构造宇宙）：Gödel 的**可构造宇宙** $L$ 通过超限递归定义：$L_0 = \varnothing$，$L_{\alpha+1} = \operatorname{Def}(L_\alpha)$（$L_\alpha$ 的可定义子集），$L_\lambda = \bigcup_{\alpha < \lambda} L_\alpha$（极限序数）。$L = \bigcup_{\alpha \in \mathbf{Ord}} L_\alpha$。

**定理 103.9**（$V = L$ 公理）：在 $L$ 中，选择公理和 GCH 都成立。$L$ 是最小的包含所有序数的 ZF 内模型。

**定义 103.8**（力迫法概要）：力迫法（Cohen 1963）通过添加"一般滤子"（generic filter）来扩张可数传递模型 $M$，得到 $M[G]$，其中某些命题（如 $\neg$CH）成立。力迫法是现代集合论最强大的工具之一。

---

---

## 第152章：自动机与形式语言
自动机理论是计算模型的最简形式，与形式语言（Chomsky 谱系）之间有精确的对应关系。

### 152.1 有限自动机

**定义 152.1**（确定型有限自动机 / DFA）：一个**确定型有限自动机**是五元组 $M = (Q, \Sigma, \delta, q_0, F)$，其中 $Q$ 为有限状态集，$\Sigma$ 为输入字母表，$\delta: Q \times \Sigma \to Q$ 为转移函数，$q_0 \in Q$ 为初始状态，$F \subseteq Q$ 为接受状态集。

$M$ 接受字符串 $w = w_1 w_2 \cdots w_n$ 如果存在状态序列 $r_0, r_1, \ldots, r_n$ 满足 $r_0 = q_0$，$r_{i+1} = \delta(r_i, w_{i+1})$，且 $r_n \in F$。

**定义 152.2**（正则语言）：语言 $L \subseteq \Sigma^*$ 是**正则语言**，如果存在 DFA 使得 $L = L(M)$（$M$ 接受的语言）。

**定义 152.3**（非确定型有限自动机 / NFA）：转移函数 $\delta: Q \times \Sigma_\varepsilon \to \mathcal{P}(Q)$（$\Sigma_\varepsilon = \Sigma \cup \{\varepsilon\}$）。NFA 接受字符串如果存在某条接受路径。

**定理 152.1**（DFA 与 NFA 的等价性 / Rabin-Scott，1959）：任何 NFA 可转化为等价的 DFA（子集构造法）。正则语言类在并、交、补、连接、Kleene 星号下封闭。

**定理 152.2**（正则语言的泵引理）：若 $L$ 是正则语言，则存在泵长度 $p$ 使得任何 $w \in L$（$|w| \geq p$）可分解为 $w = xyz$，满足 $|xy| \leq p$，$|y| > 0$，且 $xy^iz \in L$ 对所有 $i \geq 0$。

**例 152.1**：$L = \{0^n 1^n : n \geq 0\}$ 不是正则语言（由泵引理）。$L = \{w : w$ 中 0 和 1 的个数相等$\}$ 不是正则语言。

**定理 152.3**（Myhill-Nerode 定理）：语言 $L$ 是正则的当且仅当 $L$ 的右不变等价关系 $\equiv_L$ 的指数（等价类个数）有限。这给出了正则语言的最小 DFA 构造方法。

### 152.2 下推自动机与上下文无关语言

**定义 152.4**（上下文无关文法 / CFG）：文法 $G = (V, \Sigma, R, S)$，其中产生式规则形如 $A \to \alpha$（$A \in V$，$\alpha \in (V \cup \Sigma)^*$）。$L(G)$ 是能从 $S$ 推导出的终结符串集合。

**定义 152.5**（下推自动机 / PDA）：PDA 是有限自动机加上一个栈（stack）。转移函数 $\delta: Q \times \Sigma_\varepsilon \times \Gamma_\varepsilon \to \mathcal{P}(Q \times \Gamma_\varepsilon)$，其中 $\Gamma$ 为栈字母表。

**定理 152.4**（PDA 与 CFG 的等价性）：语言 $L$ 是上下文无关的当且仅当存在 PDA 接受 $L$。

**定理 152.5**（CFL 的泵引理）：若 $L$ 是 CFL，则存在 $p$ 使得任何 $w \in L$（$|w| \geq p$）可分解为 $w = uvxyz$，满足 $|vxy| \leq p$，$|vy| > 0$，且 $uv^ixy^iz \in L$ 对所有 $i \geq 0$。

**例 152.2**：$\{0^n 1^n 2^n : n \geq 0\}$ 不是 CFL。$\{ww : w \in \{0,1\}^*\}$ 不是 CFL。

**定理 152.6**（Chomsky 范式）：任何不含 $\varepsilon$ 的 CFG 可转化为等价的 Chomsky 范式格式（产生式仅形如 $A \to BC$ 或 $A \to a$）。

### 152.3 Turing 机与 Chomsky 谱系

**定义 152.6**（Turing 机 / TM）：Turing 机是七元组 $M = (Q, \Sigma, \Gamma, \delta, q_0, q_{\text{accept}}, q_{\text{reject}})$，其中 $\Gamma$ 是带字母表，$\delta: Q \times \Gamma \to Q \times \Gamma \times \{L, R\}$（转移函数）。

**定理 152.7**（Chomsky 谱系）：
- 类型 3（正则文法）$\leftrightarrow$ DFA/NFA $\leftrightarrow$ 正则语言
- 类型 2（上下文无关文法）$\leftrightarrow$ PDA $\leftrightarrow$ CFL
- 类型 1（上下文有关文法）$\leftrightarrow$ 线性有界自动机（LBA）
- 类型 0（无限制文法）$\leftrightarrow$ Turing 机 $\leftrightarrow$ 递归可枚举语言（r.e.）

**定理 152.8**（Turing 机的变体等价性）：多带 TM、非确定型 TM（NTM）、双向无限带 TM 在计算能力上与单带 TM 等价。

---

---

## 第153章：可计算性理论深化
本章在 V20 Ch 101 的基础上，深入探讨可计算性的核心定理和不可判定问题。

### 153.1 可计算函数的精确定义

**定义 153.1**（部分递归函数）：**部分递归函数**是从初始函数（零函数 $Z(x)=0$、后继函数 $S(x)=x+1$、投影函数 $P_i^n(x_1,\ldots,x_n)=x_i$）通过复合、原始递归和极小化（$\mu$-算子）得到的函数类。**全递归函数**是处处有定义的部分递归函数。

**定理 153.1**（Church-Turing 论题）：以下计算模型定义相同的函数类：
- Turing 机可计算函数
- $\lambda$-可定义函数（Church 的 $\lambda$ 演算，1936）
- 部分递归函数（Gödel-Kleene，1936）
- 随机存取机（RAM）可计算函数
- 所有「合理」的计算模型

**定理 153.2**（Kleene 正规形定理）：存在原始递归谓词 $T(e, x, y)$（Kleene T-谓词）和原始递归函数 $U(y)$ 使得任何部分递归函数可表为 $f(x) = U(\mu y \, T(e, x, y))$。

**定理 153.3**（$s$-$m$-$n$ 定理 / 参数化定理）：存在原始递归函数 $S_n^m$ 使得 $\varphi_{S_n^m(e, x_1, \ldots, x_n)}^{(m)}(y_1, \ldots, y_m) = \varphi_e^{(m+n)}(x_1, \ldots, x_n, y_1, \ldots, y_m)$。

### 153.2 不可判定性

**定理 153.4**（停机问题 / Halting Problem，Turing 1936）：语言 $HALT = \{\langle M, w \rangle : M$ 在输入 $w$ 上停机$\}$ 是递归可枚举的，但不是可判定的（递归的）。

*证明*：假设存在判定器 $H$。构造 $D$：在输入 $\langle M \rangle$ 时，$D$ 以 $\langle M, \langle M \rangle \rangle$ 运行 $H$，若 $H$ 接受则拒绝，反之接受。则 $D(\langle D \rangle)$ 接受当且仅当 $D(\langle D \rangle)$ 不接受，矛盾。∎

**定理 153.5**（Rice 定理，1953）：递归可枚举语言的任何非平凡性质（即存在具有和不具有该性质的 r.e. 语言）都是不可判定的。即 $\{\langle M \rangle : L(M) \in \mathcal{P}\}$ 不可判定，只要 $\mathcal{P}$ 非平凡。

*证明思路*：设 $\mathcal{P}$ 是非平凡的 r.e. 语言性质，且 $\emptyset \notin \mathcal{P}$（否则考虑 $\mathcal{P}$ 的补）。取 $L_0 \in \mathcal{P}$ 并使 $L_0$ 被 TM $M_0$ 半判定。将停机问题归约：对任意 $\langle M, w \rangle$，构造 TM $N$：在输入 $x$ 上，$N$ 同时模拟 $M$ 在 $w$ 上的运行和 $M_0$ 在 $x$ 上的运行。若 $M$ 在 $w$ 上停机，则 $N$ 接受 $x$ 当且仅当 $M_0$ 接受 $x$；否则 $N$ 不接受任何输入。于是 $L(N) = L_0$（若 $M$ 在 $w$ 上停机），$L(N) = \emptyset$（若不停机）。因此 $\langle M, w \rangle \in \operatorname{HALT} \iff L(N) \in \mathcal{P}$，停机问题可归约为判定 $\mathcal{P}$，故 $\mathcal{P}$ 不可判定。∎

**推论 153.6**（不可判定问题的例子）：以下问题均不可判定：
- 判定两个 CFG 是否生成相同的语言
- 判定一个 CFG 是否是歧义的
- 判定一个 TM 是否接受空语言
- Hilbert 第十问题：判定 Diophantine 方程是否有整数解（Matiyasevich，1970，基于 Davis-Putnam-Robinson 的工作）

### 153.3 相对计算与 Turing 度

**定义 153.2**（神谕 Turing 机 / Oracle TM）：带有神谕 $A \subseteq \Sigma^*$ 的 Turing 机 $M^A$ 可以查询「$w \in A$？」。相对可计算性：$B \leq_T A$ 如果 $B$ 在 $M^A$ 下可判定。

**定义 153.3**（Turing 度）：$\leq_T$ 的等价类构成 Turing 度。Turing 度构成上半格。$\mathbf{0}$ 是可计算集的度，$\mathbf{0}'$ 是停机问题的度。

**定理 153.7**（Post 问题，1944 / Friedberg-Muchnik 1956-1957）：存在递归可枚举的 Turing 度严格介于 $\mathbf{0}$ 和 $\mathbf{0}'$ 之间。这通过优先方法（priority method）证明，是递归论的核心技术。

**定理 153.8**（Kleene-Post 定理）：存在不可比较的 Turing 度（即 $\mathbf{a} \nleq_T \mathbf{b}$ 且 $\mathbf{b} \nleq_T \mathbf{a}$）。

---

---

## 第154章：计算复杂性：P、NP 与 NP 完全性
计算复杂性理论研究计算问题所需资源（时间、空间）与输入规模的关系，是理论计算机科学的核心。

### 154.1 时间复杂度类

**定义 154.1**（时间复杂度类）：
- $\mathbf{TIME}(t(n)) = \{L : \text{存在 } O(t(n)) \text{ 时间判定 } L \text{ 的 TM}\}$
- $\mathbf{P} = \bigcup_{k \geq 1} \mathbf{TIME}(n^k)$（多项式时间可判定语言）
- $\mathbf{NP} = \bigcup_{k \geq 1} \mathbf{NTIME}(n^k)$（非确定型多项式时间可判定语言）
- $\mathbf{EXP} = \bigcup_{k \geq 1} \mathbf{TIME}(2^{n^k})$（指数时间可判定语言）

**定义 154.2**（NP 的等价刻画）：$L \in \mathbf{NP}$ 当且仅当存在多项式时间可验证的证书（certificate）。即存在多项式 $p$ 和多项式时间 TM $V$ 使得 $x \in L \iff \exists y, |y| \leq p(|x|), V(x, y) = 1$。

**例 154.1**（NP 问题的例子）：
- **SAT**：布尔公式的可满足性
- **3SAT**：3-CNF 公式的可满足性
- **CLIQUE**：图是否包含 $k$-团
- **VERTEX COVER**：是否存在 $k$ 个顶点的覆盖
- **HAMILTONIAN CYCLE**：图是否有 Hamilton 回路
- **SUBSET SUM**：是否存在子集和等于目标值
- **整数规划**：$A\mathbf{x} \leq \mathbf{b}$ 是否有整数解

### 154.2 NP 完全性

**定义 154.3**（多项式时间归约）：$A \leq_P B$ 如果存在多项式时间可计算函数 $f$ 使得 $x \in A \iff f(x) \in B$。

**定义 154.4**（NP 完全与 NP 难）：
- $L$ 是 $\mathbf{NP}$-**难**的，如果对所有 $A \in \mathbf{NP}$，$A \leq_P L$
- $L$ 是 $\mathbf{NP}$-**完全**的，如果 $L \in \mathbf{NP}$ 且 $L$ 是 NP 难的

**定理 154.1**（Cook-Levin 定理，1971-1973）：SAT 是 NP 完全的。

*证明思路*：给定任意 NP 语言 $L$ 和对应的非确定型 TM $M$，构造一个布尔公式 $\phi$ 编码 $M$ 在输入 $x$ 上的计算过程。$\phi$ 可满足当且仅当 $M$ 有一条接受路径。公式的构造是局部的（每个时间步的状态转移），大小是多项式的。∎

**定理 154.2**（Karp 的 21 个 NP 完全问题，1972）：通过多项式时间归约，证明了 3SAT、CLIQUE、VERTEX COVER、HAMILTONIAN CYCLE、SUBSET SUM、PARTITION、KNAPSACK 等 21 个问题的 NP 完全性。

**归约链**：SAT $\leq_P$ 3SAT $\leq_P$ CLIQUE $\leq_P$ VERTEX COVER $\leq_P$ HAMILTONIAN CYCLE。

### 154.3 P vs NP 问题

**问题 154.1**（P vs NP 问题 / Clay 千禧年问题）：$\mathbf{P} \stackrel{?}{=} \mathbf{NP}$。即：是否每个解可被快速验证的问题，其解也可被快速找到？

绝大多数理论计算机科学家相信 $\mathbf{P} \neq \mathbf{NP}$，即存在本质上难以求解但解易于验证的问题。若 $\mathbf{P} = \mathbf{NP}$，则公钥密码学将崩溃（因整数分解属 NP），数学证明自动化、蛋白质折叠等难题将在多项式时间内可解；若 $\mathbf{P} \neq \mathbf{NP}$，则意味着存在不可逾越的计算硬阈值，这也是当前密码学安全性的理论前提。该问题自 1971 年 Cook-Levin 提出以来，虽已有大量证据支持 $\mathbf{P} \neq \mathbf{NP}$，但严格证明至今缺失。

**定理 154.3**（相对化障碍 / Baker-Gill-Solovay，1975）：存在神谕 $A, B$ 使得 $\mathbf{P}^A = \mathbf{NP}^A$ 和 $\mathbf{P}^B \neq \mathbf{NP}^B$。因此，对角化论证不能解决 P vs NP 问题。

**定理 154.4**（自然证明障碍 / Razborov-Rudich，1997）：若存在伪随机数生成器，则不存在「自然证明」证明 $\mathbf{P} \neq \mathbf{NP}$（即电路复杂度下界的高效构造性证明）。

**定理 154.5**（代数化障碍 / Aaronson-Wigderson，2008）：代数化（代数神谕）方法也不能解决 P vs NP 问题。

---

---

## 第155章：复杂度类与空间复杂性
本章深入探讨空间复杂性、多项式谱系和概率与交互证明类。

### 155.1 空间复杂性

**定义 155.1**（空间复杂度类）：
- $\mathbf{SPACE}(s(n))$：使用 $O(s(n))$ 空间的 TM 可判定语言
- $\mathbf{L} = \mathbf{SPACE}(\log n)$（对数空间）
- $\mathbf{NL} = \mathbf{NSPACE}(\log n)$（非确定型对数空间）
- $\mathbf{PSPACE} = \bigcup_k \mathbf{SPACE}(n^k)$（多项式空间）
- $\mathbf{NPSPACE} = \bigcup_k \mathbf{NSPACE}(n^k)$

**定理 155.1**（Savitch 定理，1970）：对 $s(n) \geq \log n$，$\mathbf{NSPACE}(s(n)) \subseteq \mathbf{SPACE}(s(n)^2)$。特别地，$\mathbf{PSPACE} = \mathbf{NPSPACE}$。

**定理 155.2**（空间层次定理）：若 $s_1(n) = o(s_2(n))$ 且 $s_2$ 是空间可构造的，则 $\mathbf{SPACE}(s_1(n)) \subsetneq \mathbf{SPACE}(s_2(n))$。

**已知包含关系**：$\mathbf{L} \subseteq \mathbf{NL} \subseteq \mathbf{P} \subseteq \mathbf{NP} \subseteq \mathbf{PSPACE} \subseteq \mathbf{EXP}$。其中 $\mathbf{NL} \subsetneq \mathbf{PSPACE}$（空间层次定理），但 $\mathbf{P} \stackrel{?}{=} \mathbf{PSPACE}$ 仍未知。

**定义 155.2**（对数空间归约与 NL 完全性）：$\mathbf{PATH}$（有向图的 $s$-$t$ 连通性）是 NL 完全的。$\mathbf{2SAT}$ 是 NL 完全的。

**定理 155.3**（Immerman-Szelepcsényi 定理，1987-1988）：$\mathbf{NL} = \mathbf{coNL}$。即非确定型对数空间在补运算下封闭。

### 155.2 多项式谱系

**定义 155.3**（多项式谱系 / Polynomial Hierarchy）：
- $\Sigma_0^P = \Pi_0^P = \mathbf{P}$
- $\Sigma_{k+1}^P = \mathbf{NP}^{\Sigma_k^P}$（带 $\Sigma_k^P$ 神谕的 NP）
- $\Pi_{k+1}^P = \mathbf{coNP}^{\Sigma_k^P}$
- $\mathbf{PH} = \bigcup_k \Sigma_k^P$

**定理 155.4**（多项式谱系的坍塌性质）：若 $\Sigma_k^P = \Pi_k^P$，则 $\mathbf{PH} = \Sigma_k^P$（谱系坍塌到第 $k$ 层）。特别地，若 $\mathbf{P} = \mathbf{NP}$，则 $\mathbf{P} = \mathbf{PH}$。

**定理 155.5**（Toda 定理，1991）：$\mathbf{PH} \subseteq \mathbf{P}^{\#\mathbf{P}}$。即 $\#\mathbf{P}$（计数类）包含了整个多项式谱系。

**定义 155.4**（$\#\mathbf{P}$ 类）：$\#\mathbf{P}$ 是 NP 问题的解的个数计数问题类。$\#SAT$（计算 SAT 的满足赋值数）是 $\#\mathbf{P}$ 完全的。

### 155.3 概率与交互证明类

**定义 155.5**（概率类）：
- $\mathbf{BPP}$（Bounded-error Probabilistic Polynomial time）：错误概率 $< 1/3$ 的概率多项式时间可判定语言
- $\mathbf{RP}$：单侧错误（是实例不被错判为否）
- $\mathbf{ZPP} = \mathbf{RP} \cap \mathbf{coRP}$（零错误概率多项式时间）

**定理 155.6**（概率放大）：$\mathbf{BPP}$ 的错误概率可降至 $2^{-n}$，通过重复多数投票。

**已知关系**：$\mathbf{P} \subseteq \mathbf{ZPP} \subseteq \mathbf{RP} \subseteq \mathbf{BPP} \subseteq \mathbf{PSPACE}$。$\mathbf{BPP} \stackrel{?}{\subseteq} \mathbf{P}$ 未知。

**定义 155.6**（交互证明系统 / IP）：验证者 $V$（概率多项式时间）与证明者 $P$ 交换多项式轮消息。$V$ 接受 $x \in L$ 的概率 $> 2/3$，$x \notin L$ 的概率 $< 1/3$。

**定理 155.7**（$\mathbf{IP} = \mathbf{PSPACE}$ / Shamir，1992）：交互证明可验证的恰好是 PSPACE 语言。

**定义 155.7**（$\mathbf{PCP}$ 定理 / Probabilistically Checkable Proofs，Arora-Lund-Motwani-Sudan-Szegedy 1992；Arora-Safra 1998）：$\mathbf{NP} = \mathbf{PCP}[\log n, O(1)]$。即任何 NP 语言有证明，只需检查常数个随机比特即可高概率验证。其深刻意义在于：它等价于"近似版本的 NP 困难性"——PCP 定理表明，区分可满足公式与每个赋值最多满足 $1-\varepsilon$ 比例的公式（对某个常数 $\varepsilon > 0$）是 NP 难的。这催生了近似困难性理论：MAX-3SAT、MAX-CLIQUE、SET COVER 等经典优化问题在某个常数因子内近似仍是 NP 难的。PCP 定理的证明分两步：代数方法（将 NP 预言转化为多项式求和验证）和组合方法（通过低度检验和局部解码将验证者简化为常数次查询）。PCP 定理是 20 世纪理论计算机科学最重大的成果之一，获得了 2001 年 Gödel 奖。

**定理 155.8**（PCP 定理与近似困难性）：PCP 定理蕴含许多 NP 完全问题的近似算法的最优性。例如，CLIQUE 不可近似到 $n^{1-\varepsilon}$（除非 $\mathbf{P} = \mathbf{NP}$）。

---

---

## 第156章：电路复杂性与量子计算
本章介绍计算复杂性的非均匀模型（电路）和量子计算的基本概念。

### 156.1 电路复杂性

**定义 156.1**（布尔电路）：布尔电路是节点为逻辑门（AND, OR, NOT）的有向无环图。电路族 $\{C_n\}_{n \in \mathbb{N}}$ 接受语言 $L$，如果 $C_n$ 有 $n$ 个输入，且 $C_n(x) = 1 \iff x \in L$（$|x| = n$）。

**定义 156.2**（电路复杂度类）：
- $\mathbf{P}_{/\text{poly}}$：存在多项式大小的电路族可判定的语言
- $\mathbf{NC}$（Nick's Class）：深度为 $O(\log^k n)$ 的多项式大小电路族
- $\mathbf{AC}^0$：深度为常数的无界扇入电路

**定理 156.1**：$\mathbf{P} \subseteq \mathbf{P}_{/\text{poly}}$。但 $\mathbf{P}_{/\text{poly}}$ 包含不可判定语言（因为可为每个 $n$ 硬编码答案）。

**定理 156.2**（Karp-Lipton 定理，1980）：若 $\mathbf{NP} \subseteq \mathbf{P}_{/\text{poly}}$，则 $\mathbf{PH} = \Sigma_2^P$（多项式谱系坍塌到第二层）。

**定理 156.3**（电路下界结果）：
- $\mathbf{PARITY} \notin \mathbf{AC}^0$（Furst-Saxe-Sipser 1981, Ajtai 1983）
- $\mathbf{MOD}_p \notin \mathbf{AC}^0[\mathbf{MOD}_q]$（$p \neq q$ 素数，Razborov 1987, Smolensky 1987）

### 156.2 量子计算引论

量子计算利用量子力学叠加与纠缠原理处理信息，计算能力严格包含经典计算（$\mathbf{P} \subseteq \mathbf{BQP}$），并能在多项式时间内分解整数（Shor 算法），对经典密码学构成根本挑战。

**定义 156.3**（量子比特 / Qubit）：量子比特的状态是 $\mathbb{C}^2$ 中的单位向量 $\alpha|0\rangle + \beta|1\rangle$（$|\alpha|^2 + |\beta|^2 = 1$）。$n$ 个量子比特的状态在 $\mathbb{C}^{2^n}$ 中。

**定义 156.4**（量子门）：量子计算由酉变换实现。基本量子门包括：
- Hadamard 门：$H = \frac{1}{\sqrt{2}}\begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}$
- 受控非门（CNOT）：$|x, y\rangle \mapsto |x, x \oplus y\rangle$
- $\pi/8$ 门（T 门）：$T = \begin{pmatrix} 1 & 0 \\ 0 & e^{i\pi/4} \end{pmatrix}$

**定理 156.4**（通用量子门集）：$\{H, CNOT, T\}$ 是一个通用量子门集，即任何酉变换可由此集近似。

**定义 156.5**（量子复杂度类）：
- $\mathbf{BQP}$：量子多项式时间可判定的语言（错误概率 $< 1/3$）
- $\mathbf{QMA}$：量子 NP 的类比（量子 Merlin-Arthur 证明）

**定理 156.5**（已知的包含关系）：$\mathbf{P} \subseteq \mathbf{BPP} \subseteq \mathbf{BQP} \subseteq \mathbf{PSPACE}$。$\mathbf{BQP}$ 是否超出 $\mathbf{P}$ 未知。

**定理 156.6**（Shor 算法，1994）：整数因子分解和离散对数可在 $\mathbf{BQP}$ 中解决。复杂度 $O(\log^3 N)$（量子），而经典已知最好算法是亚指数时间。

**定理 156.7**（Grover 算法，1996）：无序数据库搜索可在 $O(\sqrt{N})$ 量子查询中完成（经典需 $O(N)$），这是二次加速。

**定理 156.8**（量子查询下界 / BBBV 定理，1998）：对一般的无序搜索，$O(\sqrt{N})$ 是最优的量子查询复杂度。

---

---

## 第157章：计算几何（Computational Geometry）
计算几何研究几何对象的算法设计与复杂性分析。**核心问题**：（1）**凸包**——给定 $n$ 个平面点，Graham 扫描算法以 $O(n \log n)$ 构造其凸包（下界也是 $\Omega(n \log n)$）；（2）**Voronoi 图与 Delaunay 三角剖分**——平面上 $n$ 个站点的 Voronoi 图划分空间为最近站点区域，Fortune 算法以 $O(n \log n)$ 时间构造；对偶的 Delaunay 三角剖分最大化最小角（避免瘦三角形），是有限元网格生成的标准工具；（3）**线段求交**——Bentley-Ottmann 扫描线算法检测 $n$ 条线段的全部 $k$ 个交点，$O((n+k)\log n)$ 时间；（4）**点定位**——Kirpatrick 的层次化三角剖分支持 $O(\log n)$ 时间的平面点定位。**数值鲁棒性**——浮点舍入误差导致的拓扑不一致性是计算几何的核心挑战，精确几何计算通过任意精度有理算术（如 LEDA, CGAL 库）解决。**高维计算几何**：$d$ 维凸包的组合复杂性为 $O(n^{\lfloor d/2 \rfloor})$（上界定理），Voronoi 图的复杂度类似增长，产生碰撞维数灾难（curse of dimensionality）的实际瓶颈。近似算法如 $\epsilon$-核集（$\epsilon$-kernel）和随机投影在机器学习（高维最近邻搜索）中提供折中方案。

---

---

## 第158章：计算机代数（Computer Algebra）
计算机代数研究符号计算的理论和算法，区别于数值计算的关键在于保持精确表示（如整数的任意精度、多项式的符号形式）。**核心内容**：（1）**多项式 GCD 计算**——Euclid 算法推广到多变元多项式，通过模素数的 Hensel 提升和 Chinese Remainder Theorem 组合恢复整系数。小素数的模方法（modular GCD、EZ-GCD 算法）避免中间表达式膨胀；（2）**Gröbner 基底**——Buchberger 算法（1965年）将多项式理想化归为标准表示的完备方法，核心为计算 $S$-多项式并逐步消去首项。应用涵盖代数方程组求解、理想的维数和 Hilbert 多项式计算、自动几何定理证明。Faugère 的 F4/F5 算法用线性代数加速大规模 Gröbner 基底计算；（3）**多项式因式分解**——Berlekamp 算法（有限域）、Zassenhaus 的 Hensel 提升方法（有理数域）；（4）**符号积分**——Risch 算法（1969年）基于 Liouville 定理给出了初等函数的积分能否由初等函数表达的完全判定算法，是符号计算理论的最高成就之一；（5）**柱形代数分解（CAD）**——Collins (1975) 引入的实代数几何算法，将 $\mathbb{R}^n$ 划分为半代数胞腔，在每个胞腔上多项式符号恒定——是实数域量词消去的基础算法。计算机代数系统（Maple, Mathematica, Singular, SageMath）的内核均依赖这些算法。

---

---

## 第159章：机器学习理论基础
机器学习的数学理论基础由统计学习理论（Vapnik-Chervonenkis）、优化理论（随机梯度下降）和信息论共同构成。

### 159.1 PAC 学习框架

**定义 159.1**（PAC 学习 / Probably Approximately Correct, Valiant, 1984）：对给定的假设类 $\mathcal{H}$、精度参数 $\varepsilon > 0$ 和置信参数 $\delta > 0$，学习算法 $\mathcal{A}$ 称为 **PAC 学习** $\mathcal{H}$ 的，如果存在样本复杂度 $m(\varepsilon, \delta)$，使得对任意目标概念 $c \in \mathcal{H}$ 和任意分布 $\mathcal{D}$，以至少 $m(\varepsilon, \delta)$ 个 i.i.d. 样本训练的算法以概率至少 $1-\delta$ 输出假设 $h$ 满足 $L_{\mathcal{D}}(h) \leq \varepsilon$。

**定义 159.2**（VC 维数 / Vapnik-Chervonenkis Dimension）：假设类 $\mathcal{H}$ 的 **VC 维数** $d_{\text{VC}}(\mathcal{H})$ 是能被 $\mathcal{H}$ 打散（shattered）的最大点数，即存在 $d$ 个点使得 $\mathcal{H}$ 能在其上实现所有 $2^d$ 种标号组合。

**定理 159.1**（PAC 学习的基本定理）：若 $\mathcal{H}$ 具有有限 VC 维数 $d$，则 $\mathcal{H}$ 是 PAC 可学的，其样本复杂度为

$$m(\varepsilon, \delta) = O\left( \frac{d}{\varepsilon} \log \frac{1}{\varepsilon} + \frac{1}{\varepsilon} \log \frac{1}{\delta} \right)$$

反之，若 $\mathcal{H}$ 的 VC 维数无限，则 $\mathcal{H}$ 不是 PAC 可学的。

### 159.2 经验风险最小化与泛化理论

**定义 159.3**（经验风险最小化 / ERM）：给定损失函数 $\ell$ 和假设类 $\mathcal{F}$，ERM 原则选择

$$\hat{f} = \arg\min_{f \in \mathcal{F}} \frac{1}{n} \sum_{i=1}^n \ell(f(x_i), y_i) \equiv \arg\min_{f \in \mathcal{F}} \widehat{L}_n(f)$$

**定理 159.2**（泛化误差界 / 一致大数律）：设 $\mathcal{F}$ 的 VC 维数为 $d$。则以概率至少 $1-\delta$，

$$L(\hat{f}) - \inf_{f \in \mathcal{F}} L(f) \leq O\left( \sqrt{\frac{d}{n}} + \sqrt{\frac{\log(1/\delta)}{n}} \right)$$

若 $\mathcal{F}$ 满足更精细的熵条件（如 Rademacher 复杂度或覆盖数），可得到数据依赖的紧界。

**定理 159.3**（结构风险最小化 / SRM）：对嵌套的假设类 $\mathcal{F}_1 \subset \mathcal{F}_2 \subset \cdots$，SRM 选择最小化 $\widehat{L}_n(f) + \text{penalty}(k)$ 的类和假设，从而在偏差-方差之间自动权衡。这是 SVM 和正则化方法的理论基础。

### 159.3 随机梯度下降的收敛理论

**算法 159.1**（随机梯度下降 / SGD）：

$$w_{t+1} = w_t - \eta_t \nabla f(w_t; \xi_t)$$

其中 $\xi_t$ 是从训练集中随机抽取的（小批次）样本。

**定理 159.4**（SGD 的凸收敛性）：设目标函数 $F(w) = \mathbb{E}[f(w; \xi)]$ 为 $\mu$-强凸且梯度 $L$-Lipschitz。选取步长 $\eta_t = 1/(\mu t)$，则

$$\mathbb{E}\left[ \|w_T - w^*\|^2 \right] = O\left( \frac{1}{T} \right)$$

对一般凸函数（非强凸），取 $\eta_t = 1/\sqrt{t}$，收敛速率为 $O(1/\sqrt{T})$（平均迭代意义下）。

### 159.4 神经网络的逼近理论

**定理 159.5**（通用逼近定理 / Cybenko, 1989; Hornik, 1991）：带有一个隐藏层且具有 Sigmoid 激活函数的前馈神经网络在 $C([0,1]^n)$ 中稠密——即对任意连续函数 $f$ 和任意 $\varepsilon > 0$，存在有限大小的单隐层网络一致逼近 $f$ 至 $\varepsilon$ 精度。

**定理 159.6**（Barron 界, 1993）：若目标函数 $f$ 的 Fourier 变换满足 $C_f = \int_{\mathbb{R}^n} \|\omega\| |\hat{f}(\omega)| d\omega < \infty$，则单隐藏层 Sigmoid 网络以 $O(C_f^2 / \sqrt{N})$ 的速率逼近 $f$（$N$ 为隐藏单元数），避免了一般非参数估计的维数灾难。

**深度网络的表示优势**：深度网络通过多层次函数组合以指数方式降低表示某些函数所需的参数数量。对于折叠函数（如 $x \mapsto |x|$ 的重复组合），$k$ 层网络仅需 $O(k)$ 个单元，而浅层网络可能需要 $O(2^k)$ 个单元才能达到同等逼近精度。

---



---

---

## 第380章（补充）
非标准分析（Nonstandard Analysis）由 Abraham Robinson 于 1961 年创立，使用模型论中的超幂构造（ultrapower construction）将实数域 $\mathbb{R}$ 扩充为包含"无限小"和"无限大"元素的非标准模型 ${}^*\mathbb{R}$，使 Leibniz 的无限小演算获得了严格的数学基础。

### 超幂构造与紧致性定理

**定义**（超滤子 / ultrafilter）：集合 $I$ 上的**超滤子** $\mathcal{U}$ 是 $I$ 的幂集 $\mathcal{P}(I)$ 的子集，满足：(1) $\emptyset \notin \mathcal{U}$；(2) 若 $A, B \in \mathcal{U}$，则 $A \cap B \in \mathcal{U}$；(3) 若 $A \in \mathcal{U}$ 且 $A \subset B$，则 $B \in \mathcal{U}$；(4) 对任意 $A \subset I$，$A \in \mathcal{U}$ 或 $I \setminus A \in \mathcal{U}$（极大性）。

不包含任何有限集（即仅包含无限集）的非主超滤子（nonprincipal ultrafilter）的存在性信赖于选择公理（经 Zorn 引理）。

**定义**（超幂 / ultrapower）：设 $\mathcal{U}$ 是 $\mathbb{N}$ 上的非主超滤子。$\mathbb{R}$ 的超幂是积 $\mathbb{R}^{\mathbb{N}}$ 模去如下等价关系的商：
$$(a_n) \sim (b_n) \iff \{n : a_n = b_n\} \in \mathcal{U}$$
所得的域记为 ${}^*\mathbb{R} = \mathbb{R}^{\mathbb{N}} / \mathcal{U}$，称为**非标准实数域**（超实数域）。

**定理**（Łoś定理 / 超积基本定理，1955）：对任意语言 $\mathcal{L}$ 中的一阶公式 $\varphi(x_1, \ldots, x_k)$ 和任意元素 $[a_n] \in {}^*\mathbb{R}$（$a_n$ 是第 $n$ 个分量），
$${}^*\mathbb{R} \models \varphi([a_n^{(1)}], \ldots, [a_n^{(k)}]) \iff \{n : \mathbb{R} \models \varphi(a_n^{(1)}, \ldots, a_n^{(k)})\} \in \mathcal{U}$$
特别地，标准实数 $\mathbb{R}$ 上所有真的一阶语句在 ${}^*\mathbb{R}$ 中也真（传递原理 transfer principle）。

### 超实数与非标准模型

**定义**（超实数的代数结构）：${}^*\mathbb{R}$ 是包含 $\mathbb{R}$ 作为子域的有序域。嵌入通过将 $r \in \mathbb{R}$ 映为常数列 $(r, r, r, \ldots)$ 的等价类实现。

**定义**（无限小 / 无限大 / 有限超实数）：
- $x \in {}^*\mathbb{R}$ 是**无限小**（infinitesimal），若对所有 $n \in \mathbb{N}$，$|x| < 1/n$。记作 $x \approx 0$
- $x \in {}^*\mathbb{R}$ 是**无限大**（infinite / unlimited），若对所有 $n \in \mathbb{N}$，$|x| > n$
- $x \in {}^*\mathbb{R}$ 是**有限**（finite），若存在标准 $n \in \mathbb{N}$ 使 $|x| < n$。所有有限超实数构成 ${}^*\mathbb{R}$ 的子环 $\mathcal{O}$

**定理**（标准部分定理 / standard part）：每个有限超实数 $x \in {}^*\mathbb{R}$ 有唯一的标准部分 $\operatorname{st}(x) \in \mathbb{R}$（即与 $x$ 相差一个无限小的唯一标准实数）：$x - \operatorname{st}(x) \approx 0$。从有限超实数到 $\mathbb{R}$ 的映射 $\operatorname{st}: \mathcal{O} \to \mathbb{R}$ 是满环同态，核为无限超实数理想 $\mathfrak{m} \subset \mathcal{O}$。

### 非标准分析与非标准模型

**定义**（超幂扩张 / enlargement）：设 $\mathcal{U}$ 是足够大索引集 $I$ 上的非主超滤子（包含所有 $\mathbb{N}$ 中的有限余子集）。则**超结构**的扩张 $\bigcup_{n} V_n(X) \hookrightarrow \bigcup_{n} {}^*V_n(X)$（其中 $V_0(X) = X$，$V_{n+1}(X) = V_n(X) \cup \mathcal{P}(V_n(X))$）给出一个满足传递原理和**饱和原理**（$\kappa$-saturated for sufficiently large $\kappa$）的非标准模型。

**定义**（饱和性 / saturation）：非标准扩张是 **$\kappa$-饱和的**，如果对索引集基数 $< \kappa$ 的任意一族内部集（internal sets）$\{A_i\}$，若其具有有限交性质（任意有限个子族的交非空），则全族有非空交。饱和性保证了非标准扩张"足够大"——包含充分多的理想元素。

**定理**（非标准分析的微积分 / Leibniz 无穷小演算的严格化）：
- $f$ 在 $x_0$ 连续 $\iff$ 对所有 $x \approx x_0$（$x$ 是 $x_0$ 的无限小邻域内的超实数），$f(x) \approx f(x_0)$
- $f$ 在 $x_0$ 可微且导数为 $L$ $\iff$ 对所有 $dx \approx 0, dx \neq 0$，$\frac{f(x_0 + dx) - f(x_0)}{dx} \approx L$（且此关系与 $dx$ 的选取无关）
- Riemann积分 $\int_a^b f(x) dx$ 由无限细分的 Riemann 和的公共标准部分给出（Keisler 1960s）

### 非标准分析的应用

**定义**（非标准Hilbert空间与Loeb测度）：非标准分析在泛函分析中给出紧算子和Fredholm理论的简化处理。**Loeb测度**（1975）将标准Borel测度构造为非标准计数测度的标准部分，为构造Brown运动等提供了新路径。

**定理**（Bernstein-Robinson 多项式紧算子不变子空间定理，1966）：用非标准分析给出了 Hilbert 空间上多项式紧算子存在非平凡不变子空间的第一个证明——经标准部分翻译后得到经典分析的结果。这证明了非标准方法在泛函分析中的威力。

**推论**（非标准测度论）：$\sigma$-加性测度空间的非标准构造（Loeb空间）为随机分析、鞅论和Brown运动理论提供了统一的框架：标准随机过程可视为内部过程的"投影"。

---

*本卷完成了数理逻辑的核心内容：一阶逻辑的完备性（Gödel 1929）建立了语法与语义的桥梁；紧致性定理和 Löwenheim-Skolem 定理揭示了形式语言的局限性；Turing 机和停机问题为可计算性划定了边界；Gödel 不完全性定理（1931）是 20 世纪数学最深刻的成果之一，它证明了任何足够强的形式系统都不可避免地存在不可判定的命题；序数和基数理论为无穷提供了精确的度量；连续统假设的独立性（Gödel 1938 / Cohen 1963）展示了形式系统的根本局限性。数理逻辑不仅是数学的基础，也是计算机科学（计算理论、形式化验证）的基石。*

*本卷在计算理论（自动机、形式语言、可计算性、计算复杂性、量子计算）的基础上，整合了数理逻辑（命题逻辑、一阶逻辑、模型论、证明论、Gödel 不完备定理）和计算几何与计算机代数。从哥德尔到图灵，形成了数学基础与计算理论的完整链条。共 12 章。*


*卷三十：计算理论终。*
