# 卷二：代数

---

## Ch 12 代数运算与运算律
> **前置知识**：本章建立在第一卷数系构造（第4章）的基础之上。读者应熟悉皮亚诺公理、数学归纳法以及实数的完备性。

### 6.1 二元运算与代数结构

**定义 6.1.1（二元运算）**

设 $S$ 为非空集合。从 $S \times S$ 到 $S$ 的映射

$$
\ast : S \times S \longrightarrow S, \quad (a, b) \longmapsto a \ast b
$$

称为 $S$ 上的**二元运算**。

**定义 6.1.2（封闭性）**

设 $\ast$ 为集合 $S$ 上的二元运算。对任意 $a, b \in S$，有 $a \ast b \in S$，则称 $\ast$ 在 $S$ 上**封闭**。

**定义 6.1.3（结合律）**

设 $\ast$ 为集合 $S$ 上的二元运算。若对任意 $a, b, c \in S$，有

$$
(a \ast b) \ast c = a \ast (b \ast c)
$$

则称 $\ast$ 满足**结合律**。

**定义 6.1.4（交换律）**

设 $\ast$ 为集合 $S$ 上的二元运算。若对任意 $a, b \in S$，有

$$
a \ast b = b \ast a
$$

则称 $\ast$ 满足**交换律**。

**定义 6.1.5（幺元）**

设 $\ast$ 为集合 $S$ 上的二元运算。若存在 $e \in S$，使得对任意 $a \in S$，有

$$
e \ast a = a \ast e = a
$$

则称 $e$ 为 $\ast$ 的**幺元**（恒等元）。

**定理 6.1.1（幺元唯一性）** 若二元运算 $\ast$ 存在幺元，则幺元唯一。

**证明**：设 $e_1, e_2$ 均为 $\ast$ 的幺元。由 $e_1$ 的幺元性质，$e_1 \ast e_2 = e_2$；由 $e_2$ 的幺元性质，$e_1 \ast e_2 = e_1$。因此 $e_1 = e_2$。 $\blacksquare$

**定义 6.1.6（逆元）**

设 $\ast$ 为集合 $S$ 上的二元运算，$e$ 为幺元。对 $a \in S$，若存在 $b \in S$，使得

$$
a \ast b = b \ast a = e
$$

则称 $b$ 为 $a$ 的**逆元**，记为 $a^{-1}$。

**定理 6.1.2（逆元唯一性）** 在满足结合律的运算下，若元素的逆元存在，则逆元唯一。

**证明**：设 $b, c$ 均为 $a$ 的逆元，则

$$
b = b \ast e = b \ast (a \ast c) = (b \ast a) \ast c = e \ast c = c
$$

其中第三步利用了结合律。 $\blacksquare$

**定义 6.1.7（半群）**

集合 $S$ 与其上的二元运算 $\ast$ 构成的代数结构 $(S, \ast)$，若满足：

1. **封闭性**：$\forall a, b \in S, \, a \ast b \in S$；
2. **结合律**：$\forall a, b, c \in S, \, (a \ast b) \ast c = a \ast (b \ast c)$，

则称 $(S, \ast)$ 为**半群**。

**定义 6.1.8（幺半群）**

若半群 $(S, \ast)$ 中存在幺元 $e$，则称 $(S, \ast)$ 为**幺半群**。

**定义 6.1.9（群）**

若幺半群 $(G, \ast)$ 中每个元素都有逆元，即

$$
\forall a \in G, \, \exists a^{-1} \in G, \, a \ast a^{-1} = a^{-1} \ast a = e
$$

则称 $(G, \ast)$ 为**群**。若进一步满足交换律，则称为**阿贝尔群**（交换群）。

**定义 6.1.10（环）**

集合 $R$ 上配备两个二元运算 $+$ 和 $\cdot$（分别称为加法和乘法），若满足：

1. $(R, +)$ 是阿贝尔群（加法幺元记为 $0$）；
2. $(R, \cdot)$ 是半群（乘法满足结合律和封闭性）；
3. **分配律**：$\forall a, b, c \in R$，

$$
a \cdot (b + c) = a \cdot b + a \cdot c, \quad (b + c) \cdot a = b \cdot a + c \cdot a
$$

则称 $(R, +, \cdot)$ 为**环**。

**定义 6.1.11（交换环与含幺环）**

- 若环 $(R, +, \cdot)$ 中乘法满足交换律，则称为**交换环**。
- 若环 $(R, +, \cdot)$ 中乘法存在幺元 $1$（$1 \neq 0$），则称为**含幺环**。

**定义 6.1.12（域）**

含幺交换环 $(F, +, \cdot)$ 中，若每个非零元素都有乘法逆元，即

$$
\forall a \in F \setminus \{0\}, \, \exists a^{-1} \in F, \, a \cdot a^{-1} = 1
$$

则称 $(F, +, \cdot)$ 为**域**。

---

### 6.2 自然数运算律

以下结果建立在皮亚诺公理之上（参见第一卷第4章）。

**定义 6.2.1（自然数加法）**

加法 $+: \mathbb{N} \times \mathbb{N} \to \mathbb{N}$ 递归定义为：

$$
a + 0 = a, \quad a + S(b) = S(a + b)
$$

其中 $S$ 为后继函数。

**定义 6.2.2（自然数乘法）**

乘法 $\cdot: \mathbb{N} \times \mathbb{N} \to \mathbb{N}$ 递归定义为：

$$
a \cdot 0 = 0, \quad a \cdot S(b) = a \cdot b + a
$$

**定理 6.2.1（加法右单位元）** 对任意 $a \in \mathbb{N}$，有 $a + 0 = a$。

**证明**：由加法定义的第一条直接得到。 $\blacksquare$

**定理 6.2.2（加法左单位元）** 对任意 $a \in \mathbb{N}$，有 $0 + a = a$。

**证明**：对 $a$ 进行归纳。

- **基础**：$a = 0$ 时，$0 + 0 = 0$，成立。
- **归纳**：假设 $0 + a = a$，则 $0 + S(a) = S(0 + a) = S(a)$。

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.2.3（加法结合律）** 对任意 $a, b, c \in \mathbb{N}$，有 $(a + b) + c = a + (b + c)$。

**证明**：对 $c$ 进行归纳。

- **基础**：$c = 0$ 时，$(a + b) + 0 = a + b = a + (b + 0)$。
- **归纳**：假设 $(a + b) + c = a + (b + c)$，则

$$
(a + b) + S(c) = S((a + b) + c) = S(a + (b + c)) = a + S(b + c) = a + (b + S(c))
$$

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.2.4（后继的加法表示）** 对任意 $a \in \mathbb{N}$，有 $S(a) = a + 1$。

**证明**：由定义，$1 = S(0)$，故 $a + 1 = a + S(0) = S(a + 0) = S(a)$。 $\blacksquare$

**定理 6.2.5（加法交换律）** 对任意 $a, b \in \mathbb{N}$，有 $a + b = b + a$。

**证明**：先证辅助引理：对任意 $a \in \mathbb{N}$，有 $S(a) = a + 1 = 1 + a$。

对 $a$ 归纳证明 $1 + a = S(a)$：

- **基础**：$1 + 0 = 1 = S(0)$。
- **归纳**：假设 $1 + a = S(a)$，则 $1 + S(a) = S(1 + a) = S(S(a))$。

现在对 $b$ 归纳证明 $a + b = b + a$：

- **基础**：$b = 0$ 时，$a + 0 = a = 0 + a$。
- **归纳**：假设 $a + b = b + a$，则

$$
a + S(b) = S(a + b) = S(b + a) = b + S(a) = b + (a + 1) = b + (1 + a) = (b + 1) + a = S(b) + a
$$

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.2.6（乘法右零元）** 对任意 $a \in \mathbb{N}$，有 $a \cdot 0 = 0$。

**证明**：由乘法定义直接得到。 $\blacksquare$

**定理 6.2.7（乘法左零元）** 对任意 $a \in \mathbb{N}$，有 $0 \cdot a = 0$。

**证明**：对 $a$ 进行归纳。

- **基础**：$0 \cdot 0 = 0$。
- **归纳**：假设 $0 \cdot a = 0$，则 $0 \cdot S(a) = 0 \cdot a + 0 = 0 + 0 = 0$。

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.2.8（乘法右单位元）** 对任意 $a \in \mathbb{N}$，有 $a \cdot 1 = a$。

**证明**：$a \cdot 1 = a \cdot S(0) = a \cdot 0 + a = 0 + a = a$。 $\blacksquare$

**定理 6.2.9（乘法左分配律）** 对任意 $a, b, c \in \mathbb{N}$，有 $a \cdot (b + c) = a \cdot b + a \cdot c$。

**证明**：对 $c$ 进行归纳。

- **基础**：$c = 0$ 时，$a \cdot (b + 0) = a \cdot b = a \cdot b + 0 = a \cdot b + a \cdot 0$。
- **归纳**：假设 $a \cdot (b + c) = a \cdot b + a \cdot c$，则

$$
a \cdot (b + S(c)) = a \cdot S(b + c) = a \cdot (b + c) + a = (a \cdot b + a \cdot c) + a = a \cdot b + (a \cdot c + a) = a \cdot b + a \cdot S(c)
$$

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.2.10（乘法结合律）** 对任意 $a, b, c \in \mathbb{N}$，有 $(a \cdot b) \cdot c = a \cdot (b \cdot c)$。

**证明**：对 $c$ 进行归纳。

- **基础**：$c = 0$ 时，$(a \cdot b) \cdot 0 = 0 = a \cdot 0 = a \cdot (b \cdot 0)$。
- **归纳**：假设 $(a \cdot b) \cdot c = a \cdot (b \cdot c)$，则

$$
(a \cdot b) \cdot S(c) = (a \cdot b) \cdot c + a \cdot b = a \cdot (b \cdot c) + a \cdot b = a \cdot (b \cdot c + b) = a \cdot (b \cdot S(c))
$$

其中第三步利用了左分配律。 $\blacksquare$

**定理 6.2.11（乘法交换律）** 对任意 $a, b \in \mathbb{N}$，有 $a \cdot b = b \cdot a$。

**证明**：先证辅助引理：对任意 $a \in \mathbb{N}$，有 $1 \cdot a = a$。对 $a$ 归纳：

- **基础**：$1 \cdot 0 = 0$。
- **归纳**：假设 $1 \cdot a = a$，则 $1 \cdot S(a) = 1 \cdot a + 1 = a + 1 = S(a)$。

再证另一辅助引理：$S(a) \cdot b = a \cdot b + b$。对 $b$ 归纳：

- **基础**：$S(a) \cdot 0 = 0 = 0 + 0 = a \cdot 0 + 0$。
- **归纳**：假设 $S(a) \cdot b = a \cdot b + b$，则

$$
S(a) \cdot S(b) = S(a) \cdot b + S(a) = (a \cdot b + b) + (a + 1) = (a \cdot b + a) + (b + 1) = a \cdot S(b) + S(b)
$$

现在对 $b$ 归纳证明 $a \cdot b = b \cdot a$：

- **基础**：$a \cdot 0 = 0 = 0 \cdot a$。
- **归纳**：假设 $a \cdot b = b \cdot a$，则 $a \cdot S(b) = a \cdot b + a = b \cdot a + a = S(b) \cdot a$。

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.2.12（乘法右分配律）** 对任意 $a, b, c \in \mathbb{N}$，有 $(a + b) \cdot c = a \cdot c + b \cdot c$。

**证明**：由乘法交换律和左分配律，

$$
(a + b) \cdot c = c \cdot (a + b) = c \cdot a + c \cdot b = a \cdot c + b \cdot c
$$

$\blacksquare$

---

### 6.3 整数运算律

整数 $\mathbb{Z}$ 通过自然数的等价类构造（参见第一卷第4章）。设 $a, b \in \mathbb{N}$，整数 $-a$ 表示使得 $a + (-a) = 0$ 的元素。

**引理 6.3.0**：整数的乘法交换律和右分配律可从自然数继承的左分配律和乘法交换律推导。

**证明**：由自然数的乘法交换律（定理 6.2.11），通过等价类构造可得整数的乘法交换律 $ab = ba$。

右分配律 $(a + b) \cdot c = a \cdot c + b \cdot c$：由乘法交换律，$(a+b) \cdot c = c \cdot (a+b) = c \cdot a + c \cdot b = a \cdot c + b \cdot c$（第二步利用了已有的左分配律）。

因此下文的分配律推广 $(a+b)(c+d) = ac + ad + bc + bd$ 合法。$\blacksquare$

**定理 6.3.1（负负得正）** $(-1) \times (-1) = 1$。

**证明**：考虑以下推导链。

由分配律的推广，对任意 $a, b, c, d \in \mathbb{Z}$：

$$
(a + b)(c + d) = ac + ad + bc + bd
$$

取 $a = 1, b = -1, c = 1, d = -1$：

$$
(1 + (-1))(1 + (-1)) = 1 \cdot 1 + 1 \cdot (-1) + (-1) \cdot 1 + (-1) \cdot (-1)
$$

左边为 $0 \cdot 0 = 0$。右边中 $1 \cdot 1 = 1$，$1 \cdot (-1) = -1$（由分配律：$1 \cdot (-1) + 1 \cdot 1 = 1 \cdot ((-1) + 1) = 1 \cdot 0 = 0$，故 $1 \cdot (-1) = -1$），$(-1) \cdot 1 = -1$（由交换律），因此：

$$
0 = 1 + (-1) + (-1) + (-1)(-1) = -1 + (-1)(-1)
$$

从而 $(-1)(-1) = 1$。 $\blacksquare$

**定理 6.3.2（负数乘法的一般法则）** 对任意 $a, b \in \mathbb{Z}$，有 $(-a)(-b) = ab$。

**证明**：

$$
(-a)(-b) = (-1 \cdot a)(-1 \cdot b) = (-1)(-1) \cdot ab = 1 \cdot ab = ab
$$

其中利用了乘法结合律和交换律以及定理6.3.1。 $\blacksquare$

**定理 6.3.3** 对任意 $a, b \in \mathbb{Z}$，有 $(-a) \cdot b = -(a \cdot b)$。

**证明**：需证 $(-a) \cdot b + a \cdot b = 0$。由分配律，

$$
(-a) \cdot b + a \cdot b = ((-a) + a) \cdot b = 0 \cdot b = 0
$$

由逆元唯一性，$(-a) \cdot b = -(a \cdot b)$。 $\blacksquare$

---

### 6.4 实数运算律（域公理）

实数集 $\mathbb{R}$ 配备加法和乘法运算构成域。以下为完整的域公理体系。

**加法公理（A1—A4）**：

- **(A1) 加法封闭性**：$\forall a, b \in \mathbb{R}$，$a + b \in \mathbb{R}$。
- **(A2) 加法结合律**：$\forall a, b, c \in \mathbb{R}$，$(a + b) + c = a + (b + c)$。
- **(A3) 加法交换律**：$\forall a, b \in \mathbb{R}$，$a + b = b + a$。
- **(A4) 加法单位元与逆元**：存在 $0 \in \mathbb{R}$，使得 $\forall a \in \mathbb{R}$，$a + 0 = a$；对每个 $a \in \mathbb{R}$，存在 $-a \in \mathbb{R}$，使得 $a + (-a) = 0$。

**乘法公理（M1—M4）**：

- **(M1) 乘法封闭性**：$\forall a, b \in \mathbb{R}$，$a \cdot b \in \mathbb{R}$。
- **(M2) 乘法结合律**：$\forall a, b, c \in \mathbb{R}$，$(a \cdot b) \cdot c = a \cdot (b \cdot c)$。
- **(M3) 乘法交换律**：$\forall a, b \in \mathbb{R}$，$a \cdot b = b \cdot a$。
- **(M4) 乘法单位元与逆元**：存在 $1 \in \mathbb{R}$（$1 \neq 0$），使得 $\forall a \in \mathbb{R}$，$a \cdot 1 = a$；对每个 $a \in \mathbb{R} \setminus \{0\}$，存在 $a^{-1} \in \mathbb{R}$，使得 $a \cdot a^{-1} = 1$。

**分配律（D）**：

- **(D) 分配律**：$\forall a, b, c \in \mathbb{R}$，$a \cdot (b + c) = a \cdot b + a \cdot c$。

**定理 6.4.1（加法消去律）** 若 $a + c = b + c$，则 $a = b$。

**证明**：$a = a + 0 = a + (c + (-c)) = (a + c) + (-c) = (b + c) + (-c) = b + (c + (-c)) = b + 0 = b$。 $\blacksquare$

**定理 6.4.2（乘法消去律）** 若 $a \cdot c = b \cdot c$ 且 $c \neq 0$，则 $a = b$。

**证明**：$a = a \cdot 1 = a \cdot (c \cdot c^{-1}) = (a \cdot c) \cdot c^{-1} = (b \cdot c) \cdot c^{-1} = b \cdot (c \cdot c^{-1}) = b \cdot 1 = b$。 $\blacksquare$

**定理 6.4.3（零因子性质）** 若 $a \cdot b = 0$，则 $a = 0$ 或 $b = 0$。

**证明**：假设 $a \neq 0$，则 $a^{-1}$ 存在。$b = 1 \cdot b = (a^{-1} \cdot a) \cdot b = a^{-1} \cdot (a \cdot b) = a^{-1} \cdot 0 = 0$。

其中最后一步 $a^{-1} \cdot 0 = 0$ 的证明如下：设 $x = a^{-1} \cdot 0$，则 $x = a^{-1} \cdot (0 + 0) = a^{-1} \cdot 0 + a^{-1} \cdot 0 = x + x$。由消去律 $x = 0$。 $\blacksquare$

---

### 6.5 指数运算律

#### 6.5.1 正整数指数

**定义 6.5.1** 设 $a \in \mathbb{R}$，$n \in \mathbb{N}^+$，归纳定义：

$$
a^1 = a, \quad a^{n+1} = a^n \cdot a
$$

**定理 6.5.1（指数加法法则）** 对 $a \in \mathbb{R}$，$m, n \in \mathbb{N}^+$，有 $a^m \cdot a^n = a^{m+n}$。

**证明**：对 $n$ 归纳。

- **基础**：$n = 1$ 时，$a^m \cdot a^1 = a^m \cdot a = a^{m+1}$。
- **归纳**：假设 $a^m \cdot a^n = a^{m+n}$，则 $a^m \cdot a^{n+1} = a^m \cdot (a^n \cdot a) = (a^m \cdot a^n) \cdot a = a^{m+n} \cdot a = a^{m+n+1}$。

由归纳法原理，结论成立。 $\blacksquare$

**定理 6.5.2（指数乘法法则）** 对 $a \in \mathbb{R}$，$m, n \in \mathbb{N}^+$，有 $(a^m)^n = a^{mn}$。

**证明**：对 $n$ 归纳。

- **基础**：$(a^m)^1 = a^m = a^{m \cdot 1}$。
- **归纳**：假设 $(a^m)^n = a^{mn}$，则 $(a^m)^{n+1} = (a^m)^n \cdot a^m = a^{mn} \cdot a^m = a^{mn+m} = a^{m(n+1)}$。

$\blacksquare$

**定理 6.5.3（积的幂）** 对 $a, b \in \mathbb{R}$，$n \in \mathbb{N}^+$，有 $(ab)^n = a^n b^n$。

**证明**：对 $n$ 归纳。

- **基础**：$(ab)^1 = ab = a^1 b^1$。
- **归纳**：假设 $(ab)^n = a^n b^n$，则 $(ab)^{n+1} = (ab)^n \cdot ab = a^n b^n \cdot a \cdot b = a^{n+1} b^{n+1}$。

$\blacksquare$

#### 6.5.2 零指数与负整数指数

**定义 6.5.2** 设 $a \in \mathbb{R}$，$a \neq 0$：

$$
a^0 = 1, \quad a^{-n} = \frac{1}{a^n} \quad (n \in \mathbb{N}^+)
$$

**定理 6.5.4** 对 $a \neq 0$，$m, n \in \mathbb{Z}$，上述三条运算律仍然成立。

**证明**（以加法法则为例，证 $a^m \cdot a^n = a^{m+n}$）：分情况讨论。

**情形一**：$m, n > 0$。由定理6.5.1成立。

**情形二**：$m > 0, n = 0$。$a^m \cdot a^0 = a^m \cdot 1 = a^m = a^{m+0}$。

**情形三**：$m > 0, n < 0$。设 $n = -k$（$k > 0$）。

- 若 $m > k$：$a^m \cdot a^{-k} = \dfrac{a^m}{a^k} = a^{m-k} = a^{m+(-k)}$。
- 若 $m = k$：$a^m \cdot a^{-m} = \dfrac{a^m}{a^m} = 1 = a^0 = a^{m+(-m)}$。
- 若 $m < k$：$a^m \cdot a^{-k} = \dfrac{a^m}{a^k} = \dfrac{1}{a^{k-m}} = a^{-(k-m)} = a^{m-k}$。

**情形四**：$m = 0$。$a^0 \cdot a^n = 1 \cdot a^n = a^n = a^{0+n}$。

**情形五**：$m < 0, n < 0$。$a^m \cdot a^{-n} = \dfrac{1}{a^{|m|}} \cdot \dfrac{1}{a^{|n|}} = \dfrac{1}{a^{|m|+|n|}} = a^{-(|m|+|n|)} = a^{m+n}$。

所有情形下 $a^m \cdot a^n = a^{m+n}$ 成立。指数乘法法则和积的幂的推广类似可证。 $\blacksquare$

#### 6.5.3 有理数指数

**定义 6.5.3** 设 $a > 0$，$m, n \in \mathbb{Z}$，$n \geq 1$，定义：

$$
a^{m/n} = \left(\sqrt[n]{a}\right)^m
$$

其中 $\sqrt[n]{a}$ 为 $a$ 的 $n$ 次算术根，即满足 $x^n = a$ 且 $x > 0$ 的唯一实数。

**定理 6.5.5（有理数指数的良定义性）** 若 $m/n = p/q$（即 $mq = np$），则 $a^{m/n} = a^{p/q}$。

**证明**：设 $m/n = p/q$，即 $mq = np$。需证 $(\sqrt[n]{a})^m = (\sqrt[q]{a})^p$。

设 $x = \sqrt[n]{a}$，$y = \sqrt[q]{a}$，则 $x^n = a$，$y^q = a$。对等式两端取 $nq$ 次幂：

$$
\left((\sqrt[n]{a})^m\right)^{nq} = (\sqrt[n]{a})^{mnq} = \left((\sqrt[n]{a})^n\right)^{mq} = a^{mq}
$$

$$
\left((\sqrt[q]{a})^p\right)^{nq} = (\sqrt[q]{a})^{pnq} = \left((\sqrt[q]{a})^q\right)^{np} = a^{np}
$$

由 $mq = np$，两式右端相等，即 $\left((\sqrt[n]{a})^m\right)^{nq} = \left((\sqrt[q]{a})^p\right)^{nq}$。由于 $nq > 0$ 且 $(\sqrt[n]{a})^m > 0$，$(\sqrt[q]{a})^p > 0$，正数的 $nq$ 次幂是单射，故 $(\sqrt[n]{a})^m = (\sqrt[q]{a})^p$。 $\blacksquare$

**定理 6.5.6（有理数指数的运算律）** 设 $a > 0$，$r, s \in \mathbb{Q}$，则：

(i) $a^r \cdot a^s = a^{r+s}$；

(ii) $(a^r)^s = a^{rs}$；

(iii) $(ab)^r = a^r \cdot b^r$（$b > 0$）。

**证明**（以 (i) 为例）：设 $r = m/n$，$s = p/q$，其中 $n, q \geq 1$。

$$
a^r \cdot a^s = (\sqrt[n]{a})^m \cdot (\sqrt[q]{a})^p
$$

令 $d = \text{lcm}(n, q)$，$n' = d/n$，$q' = d/q$。则 $\sqrt[n]{a} = (\sqrt[d]{a})^{n'}$，$\sqrt[q]{a} = (\sqrt[d]{a})^{q'}$。于是

$$
a^r = (\sqrt[d]{a})^{mn'}, \quad a^s = (\sqrt[d]{a})^{pq'}
$$

$$
a^r \cdot a^s = (\sqrt[d]{a})^{mn' + pq'}
$$

而 $r + s = m/n + p/q = (mq + np)/(nq)$。由于 $mn' + pq' = md/n + pd/q = (mq + np) \cdot d/(nq)$，且 $(\sqrt[d]{a})^{d/(nq)}$ 对应分母为 $nq$ 的根... 实际上 $a^{r+s} = (\sqrt[nq]{a})^{mq+np}$，而

$$
(\sqrt[d]{a})^{mn'+pq'} = a^{(mn'+pq')/d} = a^{m/n + p/q} = a^{r+s}
$$

$\blacksquare$

#### 6.5.4 实数指数

**定义 6.5.4** 设 $a > 0$，$x \in \mathbb{R}$。定义

$$
a^x = \sup \{ a^r : r \in \mathbb{Q}, \, r \leq x \}
$$

（利用实数的完备性保证上确界存在。）

**定理 6.5.7**（实数指数运算律——陈述）实数指数满足与有理数指数相同的三条运算律。

**证明思路**：以 (i) $a^x \cdot a^y = a^{x+y}$ 为例。取有理数列 $r_n \uparrow x$，$s_n \uparrow y$。由有理数指数的运算律（定理 6.5.6），$a^{r_n} \cdot a^{s_n} = a^{r_n + s_n}$。由上确界定义和单调有界性，$a^{r_n} \to a^x$，$a^{s_n} \to a^y$，$a^{r_n+s_n} \to a^{x+y}$（此处使用单调有界定理，其严格表述见卷四定理 22.5（单调有界定理））。由极限运算律得 $a^x \cdot a^y = a^{x+y}$。

**注**：上述"极限"记号的严格化需要极限理论（Ch 25-19）。在当前阶段，此定理可视为实数指数定义的自然延伸，完整证明在建立极限理论后补全。

---

### 6.6 分式运算与二次根式

**定义 6.6.1（二次根式）**

设 $a \geq 0$，$\sqrt{a}$ 表示满足 $x^2 = a$ 且 $x \geq 0$ 的唯一非负实数，称为 $a$ 的**算术平方根**。

**定理 6.6.1（根式乘法法则）** 设 $a \geq 0$，$b \geq 0$，则 $\sqrt{a} \cdot \sqrt{b} = \sqrt{ab}$。

**证明**：设 $x = \sqrt{a}$，$y = \sqrt{b}$，则 $x \geq 0$，$y \geq 0$，$x^2 = a$，$y^2 = b$。

考虑 $xy \geq 0$，且

$$
(xy)^2 = x^2 y^2 = ab
$$

由算术平方根的唯一性，$xy = \sqrt{ab}$，即 $\sqrt{a} \cdot \sqrt{b} = \sqrt{ab}$。 $\blacksquare$

**定理 6.6.2（根式除法法则）** 设 $a \geq 0$，$b > 0$，则 $\dfrac{\sqrt{a}}{\sqrt{b}} = \sqrt{\dfrac{a}{b}}$。

**证明**：设 $x = \sqrt{a}/\sqrt{b} \geq 0$，则

$$
x^2 = \frac{(\sqrt{a})^2}{(\sqrt{b})^2} = \frac{a}{b}
$$

由算术平方根的唯一性，$x = \sqrt{a/b}$。 $\blacksquare$

**定义 6.6.2（分母有理化）**

将分母中的根号消去的变换称为**分母有理化**。

**定理 6.6.3** 设 $a \geq 0$，$b > 0$，则

$$
\frac{a}{\sqrt{b}} = \frac{a\sqrt{b}}{b}
$$

**证明**：

$$
\frac{a}{\sqrt{b}} = \frac{a}{\sqrt{b}} \cdot \frac{\sqrt{b}}{\sqrt{b}} = \frac{a\sqrt{b}}{(\sqrt{b})^2} = \frac{a\sqrt{b}}{b}
$$

$\blacksquare$

**定理 6.6.4（共轭有理化）** 设 $a \geq 0$，$b > 0$，$a \neq b$，则

$$
\frac{1}{\sqrt{a} + \sqrt{b}} = \frac{\sqrt{a} - \sqrt{b}}{a - b} \quad (a \neq b)
$$

**证明**：

$$
\frac{1}{\sqrt{a} + \sqrt{b}} = \frac{\sqrt{a} - \sqrt{b}}{(\sqrt{a} + \sqrt{b})(\sqrt{a} - \sqrt{b})} = \frac{\sqrt{a} - \sqrt{b}}{a - b}
$$

其中利用了 $(\sqrt{a} + \sqrt{b})(\sqrt{a} - \sqrt{b}) = a - b$。 $\blacksquare$

> **本章展望**：本章建立了代数运算的公理化基础。从半群到域的层级结构，以及自然数、整数、实数上的具体运算律，为后续多项式、方程和不等式的理论奠定了基石。第13章将在此基础上研究多项式的代数结构。

---

---

---

---

## Ch 13 多项式
> **前置知识**：本章需要第12章关于实数域运算律（域公理）的知识，以及带余除法所需的基本实数性质。

### 7.1 多项式的定义与运算

**定义 7.1.1（多项式）**

设 $x$ 为未定元（变量），$a_0, a_1, \ldots, a_n \in \mathbb{R}$（$a_n \neq 0$），表达式

$$
f(x) = a_n x^n + a_{n-1} x^{n-1} + \cdots + a_1 x + a_0 = \sum_{k=0}^{n} a_k x^k
$$

称为关于 $x$ 的 **$n$ 次多项式**。其中 $a_n$ 称为**首项系数**，$a_0$ 称为**常数项**。若所有系数均为零，称为**零多项式**，记为 $0$，不定义其次数。

**定义 7.1.2（多项式的相等）**

两个多项式 $f(x) = \sum a_k x^k$ 和 $g(x) = \sum b_k x^k$ **相等**，当且仅当对所有 $k$，$a_k = b_k$。

**定义 7.1.3（多项式的加法）**

设 $f(x) = \sum_{k=0}^{n} a_k x^k$，$g(x) = \sum_{k=0}^{m} b_k x^k$，定义

$$
(f + g)(x) = \sum_{k=0}^{\max(n,m)} (a_k + b_k) x^k
$$

其中当 $k$ 超出某多项式次数时，对应系数视为 $0$。

**定义 7.1.4（多项式的乘法）**

$$
(f \cdot g)(x) = \sum_{k=0}^{n+m} c_k x^k, \quad c_k = \sum_{i+j=k} a_i b_j
$$

**定理 7.1.1** 若 $f(x)$ 为 $n$ 次多项式，$g(x)$ 为 $m$ 次多项式（$f, g$ 均非零），则 $f(x) \cdot g(x)$ 为 $n + m$ 次多项式。

**证明**：设 $f(x) = a_n x^n + \cdots$，$g(x) = b_m x^m + \cdots$（$a_n \neq 0$，$b_m \neq 0$）。乘积的最高次项系数为 $a_n b_m$。由于 $\mathbb{R}$ 是域，$a_n b_m \neq 0$。而 $n + m$ 次以上各项系数均为零（因 $i + j > n + m$ 时 $a_i = 0$ 或 $b_j = 0$）。故 $\deg(fg) = n + m$。 $\blacksquare$

**定理 7.1.2（多项式环）** 实系数多项式全体 $\mathbb{R}[x]$ 在上述加法和乘法下构成含幺交换环。

**证明**：

- $(\mathbb{R}[x], +)$ 是阿贝尔群：加法封闭、结合、交换，零多项式为加法单位元，$-f(x) = \sum(-a_k)x^k$ 为 $f$ 的加法逆元。
- 乘法封闭（由多项式乘法定义）、结合律（系数卷积满足结合律：$(f \cdot g) \cdot h$ 与 $f \cdot (g \cdot h)$ 的 $k$ 次项系数均为 $\sum_{i+j+\ell=k} a_i b_j c_\ell$，由求和的结合律和交换律保证两式相等）、交换律（$c_k = \sum_{i+j=k} a_i b_j = \sum_{i+j=k} b_j a_i$，由实数乘法交换律）由实数的对应性质逐项验证。
- 分配律由系数层面的分配律逐项验证。
- 幺元为常数多项式 $1$。

$\blacksquare$

---

### 7.2 乘法公式

以下每个公式均通过直接展开并利用分配律证明。

**定理 7.2.1（完全平方和）** 对任意 $a, b \in \mathbb{R}$：

$$
(a + b)^2 = a^2 + 2ab + b^2
$$

**证明**：

$$
(a + b)^2 = (a + b)(a + b) = a \cdot a + a \cdot b + b \cdot a + b \cdot b = a^2 + ab + ba + b^2 = a^2 + 2ab + b^2
$$

$\blacksquare$

**定理 7.2.2（完全平方差）** 对任意 $a, b \in \mathbb{R}$：

$$
(a - b)^2 = a^2 - 2ab + b^2
$$

**证明**：

$$
(a - b)^2 = (a + (-b))^2 = a^2 + 2a(-b) + (-b)^2 = a^2 - 2ab + b^2
$$

$\blacksquare$

**定理 7.2.3（平方差公式）** 对任意 $a, b \in \mathbb{R}$：

$$
(a + b)(a - b) = a^2 - b^2
$$

**证明**：

$$
(a + b)(a - b) = a^2 - ab + ba - b^2 = a^2 - ab + ab - b^2 = a^2 - b^2
$$

$\blacksquare$

**定理 7.2.4（完全立方和）** 对任意 $a, b \in \mathbb{R}$：

$$
(a + b)^3 = a^3 + 3a^2 b + 3ab^2 + b^3
$$

**证明**：

$$
(a + b)^3 = (a + b)^2 (a + b) = (a^2 + 2ab + b^2)(a + b)
$$

$$
= a^3 + a^2 b + 2a^2 b + 2ab^2 + ab^2 + b^3 = a^3 + 3a^2 b + 3ab^2 + b^3
$$

$\blacksquare$

**定理 7.2.5（立方和公式）** 对任意 $a, b \in \mathbb{R}$：

$$
a^3 + b^3 = (a + b)(a^2 - ab + b^2)
$$

**证明**：展开右端：

$$
(a + b)(a^2 - ab + b^2) = a^3 - a^2 b + ab^2 + a^2 b - ab^2 + b^3 = a^3 + b^3
$$

$\blacksquare$

**定理 7.2.6（立方差公式）** 对任意 $a, b \in \mathbb{R}$：

$$
a^3 - b^3 = (a - b)(a^2 + ab + b^2)
$$

**证明**：展开右端：

$$
(a - b)(a^2 + ab + b^2) = a^3 + a^2 b + ab^2 - a^2 b - ab^2 - b^3 = a^3 - b^3
$$

$\blacksquare$

---

### 7.3 因式分解

#### 7.3.1 提公因式法

**定理 7.3.1（提取公因式）** 若多项式 $f(x)$ 的各项都含有公因式 $d(x)$，则

$$
f(x) = d(x) \cdot q(x)
$$

其中 $q(x)$ 由 $f(x)$ 的各项除以 $d(x)$ 得到。

**证明**：设 $f(x) = \sum a_k x^k$，每项 $a_k x^k = d(x) \cdot p_k(x)$，则由分配律 $f(x) = d(x) \cdot \sum p_k(x)$。 $\blacksquare$

#### 7.3.2 公式法

利用7.2节的乘法公式反向进行分解：

- $a^2 - b^2 = (a+b)(a-b)$
- $a^2 + 2ab + b^2 = (a+b)^2$
- $a^2 - 2ab + b^2 = (a-b)^2$
- $a^3 + b^3 = (a+b)(a^2 - ab + b^2)$
- $a^3 - b^3 = (a-b)(a^2 + ab + b^2)$

#### 7.3.3 十字相乘法

**定理 7.3.2（十字相乘法）** 设 $f(x) = ax^2 + bx + c$。若存在整数 $p, q, r, s$ 使得

$$
pr = a, \quad qs = c, \quad ps + qr = b
$$

则 $f(x) = (px + q)(rx + s)$。

**证明**：

$$
(px + q)(rx + s) = prx^2 + (ps + qr)x + qs = ax^2 + bx + c
$$

$\blacksquare$

#### 7.3.4 分组分解法

**定理 7.3.3（分组分解）** 若多项式 $f(x)$ 可以写成 $f(x) = g(x) + h(x)$，且 $g(x)$ 和 $h(x)$ 有公共因式 $d(x)$，则

$$
f(x) = d(x) \cdot \left(\frac{g(x)}{d(x)} + \frac{h(x)}{d(x)}\right)
$$

**证明**：由分配律直接得出。 $\blacksquare$

#### 7.3.5 配方法

**定理 7.3.4（配方法）** 对任意 $a \neq 0$，$b, c \in \mathbb{R}$：

$$
ax^2 + bx + c = a\left(x + \frac{b}{2a}\right)^2 + c - \frac{b^2}{4a}
$$

**证明**：

$$
ax^2 + bx + c = a\left(x^2 + \frac{b}{a}x\right) + c = a\left(x^2 + \frac{b}{a}x + \frac{b^2}{4a^2} - \frac{b^2}{4a^2}\right) + c
$$

$$
= a\left(x + \frac{b}{2a}\right)^2 - \frac{b^2}{4a} + c = a\left(x + \frac{b}{2a}\right)^2 + \frac{4ac - b^2}{4a}
$$

$\blacksquare$

---

### 7.4 带余除法

**定理 7.4.1（带余除法定理）** 设 $f(x), g(x) \in \mathbb{R}[x]$，$g(x) \neq 0$。则存在唯一的 $q(x), r(x) \in \mathbb{R}[x]$，使得

$$
f(x) = g(x) \cdot q(x) + r(x)
$$

其中 $r(x) = 0$ 或 $\deg(r) < \deg(g)$。

**存在性证明**：对 $f$ 的次数进行归纳。

**基础**：若 $\deg(f) < \deg(g)$，取 $q(x) = 0$，$r(x) = f(x)$。

**归纳**：设 $\deg(f) = n \geq \deg(g) = m$。设 $f(x) = a_n x^n + \cdots$，$g(x) = b_m x^m + \cdots$。

令 $f_1(x) = f(x) - \dfrac{a_n}{b_m} x^{n-m} g(x)$。

则 $\deg(f_1) < n$（首项消去）。由归纳假设，存在 $q_1(x), r(x)$ 使得 $f_1(x) = g(x) \cdot q_1(x) + r(x)$，其中 $r(x) = 0$ 或 $\deg(r) < m$。

从而 $f(x) = g(x) \cdot \left(\dfrac{a_n}{b_m} x^{n-m} + q_1(x)\right) + r(x)$。取 $q(x) = \dfrac{a_n}{b_m} x^{n-m} + q_1(x)$ 即可。 $\blacksquare$

**唯一性证明**：设

$$
f(x) = g(x) q_1(x) + r_1(x) = g(x) q_2(x) + r_2(x)
$$

则 $g(x)(q_1(x) - q_2(x)) = r_2(x) - r_1(x)$。

若 $q_1 \neq q_2$，则左端次数 $\geq \deg(g)$，而右端 $r_2 - r_1$ 的次数 $< \deg(g)$（或为零多项式），矛盾。故 $q_1 = q_2$，从而 $r_1 = r_2$。 $\blacksquare$

---

### 7.5 余数定理与因式定理

**定理 7.5.1（余数定理）** 多项式 $f(x)$ 除以 $(x - a)$ 的余数等于 $f(a)$。

**证明**：由带余除法，$f(x) = (x - a) q(x) + r$，其中 $r$ 为常数（因 $\deg(x-a) = 1$，$\deg(r) < 1$）。

代入 $x = a$：$f(a) = (a - a) q(a) + r = r$。 $\blacksquare$

**定理 7.5.2（因式定理）** $(x - a)$ 是 $f(x)$ 的因式，当且仅当 $f(a) = 0$。

**证明**：

($\Rightarrow$) 若 $(x - a) | f(x)$，则 $f(x) = (x - a) q(x)$，$f(a) = 0 \cdot q(a) = 0$。

($\Leftarrow$) 若 $f(a) = 0$，由余数定理，$f(x) = (x - a) q(x) + f(a) = (x - a) q(x)$。 $\blacksquare$

---

### 7.6 多项式的根

**定义 7.6.1（多项式的根）**

设 $f(x) \in \mathbb{R}[x]$。若 $f(c) = 0$，则称 $c$ 为 $f(x)$ 的一个**根**（零点）。

**定理 7.6.1（根的重数与因式分解）** 若 $c$ 是 $f(x)$ 的 $k$ 重根（$k \geq 1$），则

$$
f(x) = (x - c)^k \cdot g(x)
$$

其中 $g(c) \neq 0$。

**证明**：对 $k$ 归纳。

- **基础**：$k = 1$ 时，由因式定理 $f(x) = (x - c) g(x)$，$g(c) \neq 0$（否则 $c$ 为至少二重根）。
- **归纳**：设 $c$ 为 $f(x)$ 的 $(k+1)$ 重根。由归纳假设（$k$ 重根的因式分解），$f(x) = (x - c)^k h(x)$。由 $(k+1)$ 重根的定义，$(x-c)^{k+1}$ 整除 $f(x)$，故 $h(c) = 0$（否则 $(x-c)^{k+1}$ 不能整除 $(x-c)^k h(x)$）。由因式定理，$h(x) = (x - c) g(x)$，$g(c) \neq 0$。故 $f(x) = (x - c)^{k+1} g(x)$。

$\blacksquare$

**定理 7.6.2（$n$ 次多项式至多有 $n$ 个根）** 非零的 $n$ 次多项式 $f(x)$ 在 $\mathbb{R}$ 中至多有 $n$ 个根（计入重数）。

**证明**：对 $n$ 归纳。

- **基础**：$n = 0$ 时，$f(x) = a_0 \neq 0$，无根。
- **归纳**：设对 $n - 1$ 次多项式结论成立。若 $f(x)$ 无根，则结论成立（$0 \leq n$）。若 $c$ 是 $f(x)$ 的根，由因式定理，$f(x) = (x - c) g(x)$，$\deg(g) = n - 1$。

$f(x)$ 的根恰好是 $c$ 加上 $g(x)$ 的根。由归纳假设，$g(x)$ 至多有 $n - 1$ 个根。故 $f(x)$ 至多有 $n$ 个根。 $\blacksquare$

**推论 7.6.1** 若 $n$ 次多项式 $f(x)$ 有超过 $n$ 个不同的根，则 $f(x) = 0$（零多项式）。

**证明** 对 $n$ 归纳。$n = 0$ 时，零次多项式 $f(x) = c$（$c \neq 0$）无根，与"超过 0 个根"矛盾，故 $f(x) = 0$。✓

假设 $n-1$ 时成立。设 $f(x)$ 是 $n$ 次多项式且有超过 $n$ 个不同的根 $r_1, r_2, \ldots, r_{n+1}$。由因式定理，$f(x) = (x - r_1)g(x)$，其中 $g(x)$ 是 $n-1$ 次多项式。对 $i = 2, 3, \ldots, n+1$，$0 = f(r_i) = (r_i - r_1)g(r_i)$，由 $r_i \neq r_1$ 得 $g(r_i) = 0$。故 $g(x)$ 有 $n$ 个不同的根 $r_2, \ldots, r_{n+1}$，由归纳假设 $g(x) = 0$，从而 $f(x) = 0$。$\blacksquare$

**定理 7.6.3（韦达定理）** 设 $f(x) = a_n x^n + a_{n-1} x^{n-1} + \cdots + a_0$（$a_n \neq 0$）的 $n$ 个根为 $x_1, x_2, \ldots, x_n$（在复数域中计重数），则：

$$
\begin{cases}
x_1 + x_2 + \cdots + x_n = -\dfrac{a_{n-1}}{a_n} \\[8pt]
\displaystyle\sum_{1 \leq i < j \leq n} x_i x_j = \frac{a_{n-2}}{a_n} \\[8pt]
\cdots \\[4pt]
x_1 x_2 \cdots x_n = (-1)^n \dfrac{a_0}{a_n}
\end{cases}
$$

一般地，设 $e_k$ 为 $x_1, \ldots, x_n$ 的 $k$ 次初等对称多项式：

$$
e_k = \sum_{1 \leq i_1 < \cdots < i_k \leq n} x_{i_1} \cdots x_{i_k}
$$

则 $a_{n-k} = (-1)^k a_n \cdot e_k$。

**证明**：由代数基本定理（定理 8.6.1），$n$ 次多项式在复数域中恰有 $n$ 个根（计重数），因此可以完全分解为一次因式的乘积：（完整证明见卷九定理53.1.3（复分析证明）和卷十定理60.14（拓扑学证明））。

$$
f(x) = a_n (x - x_1)(x - x_2) \cdots (x - x_n)
$$

展开右端：

$$
a_n \prod_{i=1}^{n}(x - x_i) = a_n \left(x^n - e_1 x^{n-1} + e_2 x^{n-2} - \cdots + (-1)^n e_n\right)
$$

其中 $e_k$ 是 $x_1, \ldots, x_n$ 的 $k$ 次初等对称多项式。这可以通过对 $n$ 归纳来严格证明：

- **基础**：$n = 1$ 时，$a_1(x - x_1) = a_1 x - a_1 x_1$，$e_1 = x_1$，系数为 $(-1)^1 a_1 e_1 = -a_1 x_1$。正确。
- **归纳**：假设 $a_n \prod_{i=1}^{n}(x - x_i) = a_n \sum_{k=0}^{n} (-1)^k e_k x^{n-k}$。则

$$
a_n \prod_{i=1}^{n+1}(x - x_i) = a_n (x - x_{n+1}) \sum_{k=0}^{n} (-1)^k e_k x^{n-k}
$$

$$
= a_n \left(\sum_{k=0}^{n} (-1)^k e_k x^{n+1-k} - x_{n+1} \sum_{k=0}^{n} (-1)^k e_k x^{n-k}\right)
$$

$$
= a_n \sum_{k=0}^{n+1} (-1)^k \left(e_k + x_{n+1} e_{k-1}\right) x^{n+1-k}
$$

由对称多项式的递推关系 $e_k^{(n+1)} = e_k^{(n)} + x_{n+1} e_{k-1}^{(n)}$，结论成立。

比较系数，$a_{n-k} = (-1)^k a_n \cdot e_k$。特别地：

$$
e_1 = \sum x_i = -\frac{a_{n-1}}{a_n}, \quad e_n = \prod x_i = (-1)^n \frac{a_0}{a_n}
$$

$\blacksquare$

> **本章展望**：多项式的运算和因式分解是代数的核心工具。下一章将利用这些工具系统地研究各类方程的求解理论。

---

---

---

---

## Ch 14 方程与方程组
> **前置知识**：本章需要第12章的运算律和第13章的多项式理论（特别是因式分解、余数定理和韦达定理）。

### 8.1 方程的基本概念

**定义 8.1.1（方程）**

含有未知数的等式称为**方程**。使方程成立的未知数的值称为方程的**解**。

**定义 8.1.2（解集）**

方程所有解的集合称为**解集**。

**定义 8.1.3（同解方程）**

若两个方程有相同的解集，则称它们**同解**。

**定义 8.1.4（同解变换）**

以下变换不改变方程的解集：

1. **等量加减**：方程两边同时加上（或减去）同一个数或整式。
2. **等量乘除**：方程两边同时乘以（或除以）同一个非零数或整式。
3. **等量替换**：将方程中的某表达式替换为与之相等的另一表达式。

**定理 8.1.1** 设 $f(x) = g(x)$ 是一个方程，$h(x)$ 为任意表达式。则 $f(x) = g(x)$ 与 $f(x) + h(x) = g(x) + h(x)$ 同解。

**证明**：设 $x_0$ 是 $f(x) = g(x)$ 的解，则 $f(x_0) = g(x_0)$，从而 $f(x_0) + h(x_0) = g(x_0) + h(x_0)$，即 $x_0$ 也是变换后方程的解。反之亦然。 $\blacksquare$

---

### 8.2 一元一次方程

**定理 8.2.1（一元一次方程解的存在唯一性）** 设 $a, b \in \mathbb{R}$，$a \neq 0$。则方程

$$
ax + b = 0
$$

有唯一解 $x = -b/a$。

**证明**：

**存在性**：代入 $x = -b/a$，$a \cdot (-b/a) + b = -b + b = 0$。故 $x = -b/a$ 是解。

**唯一性**：设 $x_0$ 为任意解，即 $ax_0 + b = 0$。则 $ax_0 = -b$，由乘法消去律（$a \neq 0$），$x_0 = -b/a$。 $\blacksquare$

**推论 8.2.1** 若 $a = 0$，$b \neq 0$，则 $ax + b = 0$ 无解；若 $a = 0$，$b = 0$，则 $ax + b = 0$ 的解为全体实数。

**证明**：若 $a = 0$，方程变为 $b = 0$。若 $b \neq 0$，矛盾，无解；若 $b = 0$，恒等式成立，全体实数为解。 $\blacksquare$

---

### 8.3 二元一次方程组

**定义 8.3.1（二元一次方程组）**

形如

$$
\begin{cases}
a_1 x + b_1 y = c_1 \\
a_2 x + b_2 y = c_2
\end{cases}
$$

的方程组称为**二元一次方程组**（线性方程组）。

**定义 8.3.2（系数行列式）**

$$
D = \begin{vmatrix} a_1 & b_1 \\ a_2 & b_2 \end{vmatrix} = a_1 b_2 - a_2 b_1
$$

**定理 8.3.1（克拉默法则）** 设 $D = a_1 b_2 - a_2 b_1 \neq 0$，则二元一次方程组有唯一解：

$$
x = \frac{D_x}{D} = \frac{c_1 b_2 - c_2 b_1}{a_1 b_2 - a_2 b_1}, \quad y = \frac{D_y}{D} = \frac{a_1 c_2 - a_2 c_1}{a_1 b_2 - a_2 b_1}
$$

其中

$$
D_x = \begin{vmatrix} c_1 & b_1 \\ c_2 & b_2 \end{vmatrix} = c_1 b_2 - c_2 b_1, \quad D_y = \begin{vmatrix} a_1 & c_1 \\ a_2 & c_2 \end{vmatrix} = a_1 c_2 - a_2 c_1
$$

**证明**：

**第一步：推导解的表达式。**

将第一个方程乘以 $b_2$，第二个方程乘以 $b_1$：

$$
\begin{cases}
a_1 b_2 x + b_1 b_2 y = c_1 b_2 \\
a_2 b_1 x + b_1 b_2 y = c_2 b_1
\end{cases}
$$

两式相减：

$$
(a_1 b_2 - a_2 b_1) x = c_1 b_2 - c_2 b_1
$$

即 $Dx = D_x$。由 $D \neq 0$，$x = D_x / D$。

类似地，将第一个方程乘以 $a_2$，第二个方程乘以 $a_1$：

$$
\begin{cases}
a_1 a_2 x + a_2 b_1 y = a_2 c_1 \\
a_1 a_2 x + a_1 b_2 y = a_1 c_2
\end{cases}
$$

相减：$(a_1 b_2 - a_2 b_1) y = a_1 c_2 - a_2 c_1$，即 $Dy = D_y$，$y = D_y/D$。

**第二步：验证。** 将 $x = D_x/D$，$y = D_y/D$ 代入原方程组：

$$
a_1 \cdot \frac{D_x}{D} + b_1 \cdot \frac{D_y}{D} = \frac{a_1 D_x + b_1 D_y}{D}
$$

计算 $a_1 D_x + b_1 D_y$：

$$
a_1(c_1 b_2 - c_2 b_1) + b_1(a_1 c_2 - a_2 c_1) = a_1 c_1 b_2 - a_1 c_2 b_1 + a_1 b_1 c_2 - a_2 b_1 c_1 = c_1(a_1 b_2 - a_2 b_1) = c_1 D
$$

因此 $a_1 (D_x/D) + b_1 (D_y/D) = c_1 D / D = c_1$。类似可验证第二个方程。

**第三步：唯一性。** 设 $(x_0, y_0)$ 为任意解，则

$$
\begin{cases} a_1 x_0 + b_1 y_0 = c_1 \\ a_2 x_0 + b_2 y_0 = c_2 \end{cases}
$$

由第一步的推导过程（这是同解变换），$(x_0, y_0)$ 必须满足 $D x_0 = D_x$ 和 $D y_0 = D_y$。由 $D \neq 0$，$x_0 = D_x/D$，$y_0 = D_y/D$。 $\blacksquare$

**推论 8.3.1（$D = 0$ 的情形）**

- 若 $D = 0$ 且 $D_x \neq 0$ 或 $D_y \neq 0$，则方程组无解。
- 若 $D = 0$ 且 $D_x = D_y = 0$，则方程组有无穷多解。

**证明**：

**情形一**：$D = 0$ 且 $D_x \neq 0$。假设存在解 $(x_0, y_0)$，则由定理8.3.1的推导过程（第一步的同解变换），$D x_0 = D_x$。但 $D = 0$ 故 $0 = D_x \neq 0$，矛盾。因此无解。$D_y \neq 0$ 的情况类似。

**情形二**：$D = 0$ 且 $D_x = D_y = 0$。由 $D = a_1 b_2 - a_2 b_1 = 0$ 得 $a_1 b_2 = a_2 b_1$。

子情形 2a：若 $b_1 \neq 0$，由第一个方程 $x = \frac{c_1 - b_1 y}{a_1}$（若 $a_1 \neq 0$）或 $y = \frac{c_1}{b_1}$（若 $a_1 = 0$）。代入第二个方程，利用 $D_x = D_y = 0$ 可验证恒成立，故 $y$ 可取任意值，$x$ 由 $y$ 确定，有无穷多解。

子情形 2b：若 $b_1 = 0$，由 $D = 0$ 得 $a_1 b_2 = 0$。若 $a_1 = 0$，则第一个方程变为 $0 = c_1$，由 $D_x = c_1 b_2 = 0$ 和 $D_y = -a_2 c_1 = 0$，若 $c_1 \neq 0$ 则 $b_2 = a_2 = 0$，但此时方程组退化；若 $c_1 = 0$ 则第一个方程恒成立。类似讨论第二个方程，可得无穷多解或全体实数解。

综上，$D = 0$ 时方程组要么无解要么有无穷多解。$\blacksquare$

---

### 8.4 一元二次方程

**定理 8.4.1（求根公式）** 设 $a, b, c \in \mathbb{R}$，$a \neq 0$。方程 $ax^2 + bx + c = 0$ 的解为

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

当 $b^2 - 4ac \geq 0$ 时，解为实数。

**证明**（配方法）：

$$
ax^2 + bx + c = 0
$$

$$
x^2 + \frac{b}{a}x + \frac{c}{a} = 0
$$

$$
x^2 + \frac{b}{a}x = -\frac{c}{a}
$$

$$
x^2 + \frac{b}{a}x + \frac{b^2}{4a^2} = \frac{b^2}{4a^2} - \frac{c}{a} = \frac{b^2 - 4ac}{4a^2}
$$

$$
\left(x + \frac{b}{2a}\right)^2 = \frac{b^2 - 4ac}{4a^2}
$$

当 $b^2 - 4ac \geq 0$ 时：

$$
x + \frac{b}{2a} = \pm \frac{\sqrt{b^2 - 4ac}}{2a}
$$

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$

$\blacksquare$

**定义 8.4.1（判别式）**

$\Delta = b^2 - 4ac$ 称为一元二次方程 $ax^2 + bx + c = 0$ 的**判别式**。

**定理 8.4.2（判别式的三种情形）**

设 $a \neq 0$，$f(x) = ax^2 + bx + c$：

**(i)** 若 $\Delta > 0$，则 $f(x) = 0$ 有两个不相等的实根：

$$
x_1 = \frac{-b + \sqrt{\Delta}}{2a}, \quad x_2 = \frac{-b - \sqrt{\Delta}}{2a}
$$

**(ii)** 若 $\Delta = 0$，则 $f(x) = 0$ 有一个二重实根 $x_0 = -b/(2a)$。

**(iii)** 若 $\Delta < 0$，则 $f(x) = 0$ 在 $\mathbb{R}$ 中无解。

**证明**：由求根公式的推导过程，$\left(x + \frac{b}{2a}\right)^2 = \frac{\Delta}{4a^2}$。

- $\Delta > 0$ 时，右端为正，$x + \frac{b}{2a} = \pm \frac{\sqrt{\Delta}}{2a}$ 给出两个不同实数。
- $\Delta = 0$ 时，$x + \frac{b}{2a} = 0$，唯一解 $x = -b/(2a)$。
- $\Delta < 0$ 时，右端为负，而左端 $\geq 0$，矛盾。无实数解。

$\blacksquare$

**定理 8.4.3（一元二次方程的韦达定理）** 设 $ax^2 + bx + c = 0$（$a \neq 0$）的两根为 $x_1, x_2$，则

$$
x_1 + x_2 = -\frac{b}{a}, \quad x_1 x_2 = \frac{c}{a}
$$

**证明**：由求根公式：

$$
x_1 + x_2 = \frac{-b + \sqrt{\Delta}}{2a} + \frac{-b - \sqrt{\Delta}}{2a} = \frac{-2b}{2a} = -\frac{b}{a}
$$

$$
x_1 x_2 = \frac{(-b + \sqrt{\Delta})(-b - \sqrt{\Delta})}{4a^2} = \frac{b^2 - \Delta}{4a^2} = \frac{b^2 - (b^2 - 4ac)}{4a^2} = \frac{4ac}{4a^2} = \frac{c}{a}
$$

$\blacksquare$

---

### 8.5 分式方程与无理方程

**定义 8.5.1（分式方程）**

分母中含有未知数的方程称为**分式方程**。

**定义 8.5.2（增根）**

在方程变形过程中产生的、不属于原方程解集的根称为**增根**。

**定理 8.5.1（增根的产生条件）** 将分式方程 $\dfrac{P(x)}{Q(x)} = \dfrac{R(x)}{S(x)}$ 两边乘以 $Q(x) S(x)$ 去分母，所得整式方程的根中，使 $Q(x) S(x) = 0$ 的值为增根。

**证明**：设 $x_0$ 使得 $Q(x_0) = 0$。则原方程在 $x_0$ 处无定义。但乘以 $Q(x_0) S(x_0) = 0$ 后等式 $0 = 0$ 恒成立，故 $x_0$ 可能满足去分母后的方程，却不满足原方程。 $\blacksquare$

**定义 8.5.3（无理方程）**

根号下含有未知数的方程称为**无理方程**。

**定理 8.5.2** 两边平方可能产生增根。设 $A(x) = B(x)$ 为无理方程，两边平方得 $A^2(x) = B^2(x)$，则 $A(x) = B(x)$ 或 $A(x) = -B(x)$。因此平方后方程的解集包含原方程的解集，可能更大。

**证明**：$A^2 = B^2 \Leftrightarrow A^2 - B^2 = 0 \Leftrightarrow (A+B)(A-B) = 0 \Leftrightarrow A = B$ 或 $A = -B$。 $\blacksquare$

---

### 8.6 高次方程简介

**定理 8.6.1（代数基本定理，陈述）** 任何 $n \geq 1$ 次复系数多项式在 $\mathbb{C}$ 中恰有 $n$ 个根（计重数）。

**定理 8.6.2（阿贝尔-鲁菲尼定理，陈述）** 当 $n \geq 5$ 时，一般 $n$ 次多项式方程

$$
a_n x^n + a_{n-1} x^{n-1} + \cdots + a_0 = 0
$$

不存在用系数的加、减、乘、除和开方运算构成的一般求根公式。

此定理的证明超出本书范围，但其含义是：五次及以上的高次方程不能像一至四次方程那样用根式给出通解。

> **本章展望**：方程是代数的核心应用。下一章将研究不等式，它是方程理论的自然推广，也是优化问题的基础。

---

---

---

---

## Ch 15 不等式
> **前置知识**：本章需要第4章实数的序公理，以及第12章的运算律和第13章的多项式理论。

### 9.1 基本性质

以下从实数的序公理（参见第一卷第4章）出发。

**定理 9.1.1（传递性）** 若 $a > b$ 且 $b > c$，则 $a > c$。

**证明**：由序公理，$a > b$ 意味着 $a - b > 0$，$b > c$ 意味着 $b - c > 0$。正数之和仍为正（由序公理），故

$$
a - c = (a - b) + (b - c) > 0
$$

即 $a > c$。 $\blacksquare$

**定理 9.1.2（加法保序性）** 若 $a > b$，则对任意 $c \in \mathbb{R}$，有 $a + c > b + c$。

**证明**：$a > b \Rightarrow a - b > 0$。而 $(a + c) - (b + c) = a - b > 0$，故 $a + c > b + c$。 $\blacksquare$

**定理 9.1.3（乘法保序性——正数乘）** 若 $a > b$ 且 $c > 0$，则 $ac > bc$。

**证明**：$a > b \Rightarrow a - b > 0$。$c > 0$，正数之积为正，故 $c(a - b) > 0$，即 $ac - bc > 0$，$ac > bc$。 $\blacksquare$

**定理 9.1.4（乘法反序性——负数乘）** 若 $a > b$ 且 $c < 0$，则 $ac < bc$。

**证明**：$a > b \Rightarrow a - b > 0$。$c < 0 \Rightarrow -c > 0$。正数之积为正，故 $(-c)(a - b) > 0$，即 $-(ac - bc) > 0$，$ac - bc < 0$，$ac < bc$。 $\blacksquare$

**定理 9.1.5（正数的平方为正）** 若 $a \neq 0$，则 $a^2 > 0$。

**证明**：若 $a > 0$，由正数之积为正，$a^2 = a \cdot a > 0$。若 $a < 0$，则 $-a > 0$，$a^2 = (-a)^2 = (-a)(-a) > 0$。 $\blacksquare$

**定理 9.1.6** $1 > 0$。

**证明**：$1 = 1^2 > 0$（由定理9.1.5，$1 \neq 0$）。 $\blacksquare$

**定理 9.1.7（三歧性）** 对任意 $a, b \in \mathbb{R}$，以下三种情形恰有一种成立：$a > b$，$a = b$，$a < b$。

**证明**：由实数序公理的三歧性公理直接得出。 $\blacksquare$

**定理 9.1.8（倒数保序性）** 若 $a > b > 0$，则 $\dfrac{1}{a} < \dfrac{1}{b}$。

**证明**：$a > b > 0$，则 $ab > 0$。由定理9.1.3，两边乘以 $\dfrac{1}{ab} > 0$：

$$
\frac{a}{ab} > \frac{b}{ab} \Rightarrow \frac{1}{b} > \frac{1}{a}
$$

$\blacksquare$

---

### 9.2 一元一次不等式组

**定理 9.2.1** 设 $a \neq 0$，则 $ax + b > 0$ 的解集为：

- 若 $a > 0$：$x > -b/a$；
- 若 $a < 0$：$x < -b/a$。

**证明**：$ax > -b$。

- 若 $a > 0$：由乘法保序性，$x > -b/a$。
- 若 $a < 0$：由乘法反序性，$x < -b/a$。

$\blacksquare$

**定理 9.2.2（不等式组的解集）** 不等式组

$$
\begin{cases} a_1 x + b_1 > 0 \\ a_2 x + b_2 > 0 \end{cases}
$$

的解集为两个不等式解集的交集。

**证明**：$x$ 满足不等式组当且仅当 $x$ 同时满足每个不等式，这恰好是两个解集的交集的定义。 $\blacksquare$

---

### 9.3 一元二次不等式

**定理 9.3.1** 设 $a > 0$，$f(x) = ax^2 + bx + c$，$\Delta = b^2 - 4ac$。

**(i) $\Delta > 0$**：设两根 $x_1 < x_2$。则

- $f(x) > 0$ 的解集为 $(-\infty, x_1) \cup (x_2, +\infty)$。
- $f(x) < 0$ 的解集为 $(x_1, x_2)$。

**(ii) $\Delta = 0$**：设根为 $x_0$。则

- $f(x) > 0$ 的解集为 $\mathbb{R} \setminus \{x_0\}$。
- $f(x) < 0$ 的解集为 $\varnothing$。

**(iii) $\Delta < 0$**：则

- $f(x) > 0$ 的解集为 $\mathbb{R}$。
- $f(x) < 0$ 的解集为 $\varnothing$。

**证明**：由配方法，$f(x) = a\left(x + \dfrac{b}{2a}\right)^2 + \dfrac{4ac - b^2}{4a} = a\left(x + \dfrac{b}{2a}\right)^2 - \dfrac{\Delta}{4a}$。

**(i)** $\Delta > 0$：$f(x) = a(x - x_1)(x - x_2)$。

- $x < x_1$ 时：$x - x_1 < 0$，$x - x_2 < 0$，$(x-x_1)(x-x_2) > 0$，$f(x) > 0$。
- $x_1 < x < x_2$ 时：$x - x_1 > 0$，$x - x_2 < 0$，$(x-x_1)(x-x_2) < 0$，$f(x) < 0$。
- $x > x_2$ 时：$x - x_1 > 0$，$x - x_2 > 0$，$(x-x_1)(x-x_2) > 0$，$f(x) > 0$。
- $x = x_1$ 或 $x = x_2$ 时：$f(x) = 0$。

**(ii)** $\Delta = 0$：$f(x) = a(x - x_0)^2 \geq 0$。等号当且仅当 $x = x_0$。

**(iii)** $\Delta < 0$：$f(x) = a\left(x + \dfrac{b}{2a}\right)^2 - \dfrac{\Delta}{4a}$。其中 $-\Delta/(4a) > 0$（因 $\Delta < 0$，$a > 0$），而第一项 $\geq 0$，故 $f(x) > 0$ 对一切 $x$ 成立。

$\blacksquare$

**推论 9.3.1** 若 $a < 0$，不等式 $ax^2 + bx + c > 0$ 等价于 $-ax^2 - bx - c < 0$，可转化为 $a' > 0$ 的情形。

**证明**：$ax^2 + bx + c > 0$ 两边乘 $-1$（不等号反向）得 $-ax^2 - bx - c < 0$，其中 $-a > 0$。 $\blacksquare$

---

### 9.4 绝对值不等式

**定义 9.4.1（绝对值）**

对任意 $a \in \mathbb{R}$，定义

$$
|a| = \begin{cases} a & \text{若 } a \geq 0 \\ -a & \text{若 } a < 0 \end{cases}
$$

**定理 9.4.1（绝对值的基本性质）**

(i) $|a| \geq 0$，等号当且仅当 $a = 0$。

(ii) $|a| = \sqrt{a^2}$。

(iii) $|ab| = |a| \cdot |b|$。

(iv) $\left|\dfrac{a}{b}\right| = \dfrac{|a|}{|b|}$（$b \neq 0$）。

**证明**：

(i) 若 $a \geq 0$，$|a| = a \geq 0$；若 $a < 0$，$|a| = -a > 0$。$|a| = 0 \Leftrightarrow a = 0$ 由定义直接得出。

(ii) 若 $a \geq 0$，$\sqrt{a^2} = a = |a|$；若 $a < 0$，$\sqrt{a^2} = \sqrt{(-a)^2} = -a = |a|$。

(iii) 分四种子情形讨论：

- $a \geq 0, b \geq 0$：$ab \geq 0$，$|ab| = ab = |a| \cdot |b|$。
- $a \geq 0, b < 0$：$ab \leq 0$，$|ab| = -ab = a \cdot (-b) = |a| \cdot |b|$。
- $a < 0, b \geq 0$：$ab \leq 0$，$|ab| = -ab = (-a) \cdot b = |a| \cdot |b|$。
- $a < 0, b < 0$：$ab > 0$，$|ab| = ab = (-a)(-b) = |a| \cdot |b|$。

所有情形下 $|ab| = |a| \cdot |b|$ 成立。

(iv) 由 (iii)，$|b| \cdot |a/b| = |b \cdot a/b| = |a|$，故 $|a/b| = |a|/|b|$。

$\blacksquare$

**定理 9.4.2（三角不等式）** 对任意 $a, b \in \mathbb{R}$：

$$
|a + b| \leq |a| + |b|
$$

**证明**：两边平方（因两边非负，不等式方向不变）：

$$
(a + b)^2 \leq (|a| + |b|)^2
$$

$$
a^2 + 2ab + b^2 \leq |a|^2 + 2|a||b| + |b|^2 = a^2 + 2|ab| + b^2
$$

只需证 $ab \leq |ab|$，即 $ab \leq |ab|$。

若 $ab \geq 0$，则 $ab = |ab|$，成立。若 $ab < 0$，则 $ab < 0 \leq |ab|$，成立。

$\blacksquare$

**定理 9.4.3（反向三角不等式）** 对任意 $a, b \in \mathbb{R}$：

$$
\bigl||a| - |b|\bigr| \leq |a - b|
$$

**证明**：由三角不等式，$|a| = |(a - b) + b| \leq |a - b| + |b|$，故 $|a| - |b| \leq |a - b|$。

类似地，$|b| = |(b - a) + a| \leq |b - a| + |a| = |a - b| + |a|$，故 $|b| - |a| \leq |a - b|$，即 $-(|a| - |b|) \leq |a - b|$。

综合两式：$-|a - b| \leq |a| - |b| \leq |a - b|$，即 $\bigl||a| - |b|\bigr| \leq |a - b|$。 $\blacksquare$

**推论 9.4.1** 对任意 $a, b \in \mathbb{R}$：

$$
\bigl||a| - |b|\bigr| \leq |a + b| \leq |a| + |b|
$$

**证明**：左边不等式由 $|a| = |(a+b) - b| \leq |a+b| + |b|$，得 $|a| - |b| \leq |a+b|$。类似 $|b| - |a| \leq |a+b|$。右边不等式即三角不等式。 $\blacksquare$

---

### 9.5 均值不等式

**定理 9.5.1（二元算术-几何均值不等式，AM-GM）** 对任意 $a, b \geq 0$：

$$
\frac{a + b}{2} \geq \sqrt{ab}
$$

等号当且仅当 $a = b$。

**证明**（配方法）：

$$
\frac{a + b}{2} - \sqrt{ab} = \frac{a + b - 2\sqrt{ab}}{2} = \frac{(\sqrt{a})^2 - 2\sqrt{a}\sqrt{b} + (\sqrt{b})^2}{2} = \frac{(\sqrt{a} - \sqrt{b})^2}{2} \geq 0
$$

等号当且仅当 $\sqrt{a} = \sqrt{b}$，即 $a = b$。 $\blacksquare$

**定理 9.5.2（$n$ 元 AM-GM 不等式）** 对任意 $a_1, a_2, \ldots, a_n \geq 0$（$n \geq 2$）：

$$
\frac{a_1 + a_2 + \cdots + a_n}{n} \geq \sqrt[n]{a_1 a_2 \cdots a_n}
$$

等号当且仅当 $a_1 = a_2 = \cdots = a_n$。

**证明**（前向-后向归纳法，柯西归纳法）：

**第一步（$n = 2$ 的情形）**：由定理9.5.1。

**第二步（$n \to 2n$）**：设 $n$ 元不等式成立，证 $2n$ 元。

$$
\frac{a_1 + \cdots + a_{2n}}{2n} = \frac{1}{2}\left(\frac{a_1 + \cdots + a_n}{n} + \frac{a_{n+1} + \cdots + a_{2n}}{n}\right)
$$

由归纳假设和二元AM-GM：

$$
\geq \frac{1}{2}\left(\sqrt[n]{a_1 \cdots a_n} + \sqrt[n]{a_{n+1} \cdots a_{2n}}\right) \geq \sqrt{\sqrt[n]{a_1 \cdots a_n} \cdot \sqrt[n]{a_{n+1} \cdots a_{2n}}} = \sqrt[2n]{a_1 \cdots a_{2n}}
$$

**第三步（$n \to n-1$，向后归纳）**：设 $n$ 元不等式成立，证 $n-1$ 元。

给定 $a_1, \ldots, a_{n-1} \geq 0$，令

$$
a_n = \frac{a_1 + a_2 + \cdots + a_{n-1}}{n-1} = A
$$

由 $n$ 元AM-GM：

$$
\frac{a_1 + \cdots + a_{n-1} + A}{n} \geq \sqrt[n]{a_1 \cdots a_{n-1} \cdot A}
$$

左端 $= \frac{(n-1)A + A}{n} = A$。故

$$
A \geq \sqrt[n]{a_1 \cdots a_{n-1} \cdot A}
$$

$$
A^n \geq a_1 \cdots a_{n-1} \cdot A
$$

若 $A = 0$，则所有 $a_i = 0$，$n-1$ 元不等式 $0 \geq 0$ 平凡成立。若 $A > 0$，两边除以 $A$：

$$
A \geq \sqrt[n-1]{a_1 \cdots a_{n-1}}
$$

即 $\dfrac{a_1 + \cdots + a_{n-1}}{n-1} \geq \sqrt[n-1]{a_1 \cdots a_{n-1}}$。

综合第二步和第三步，对所有 $n \geq 2$ 不等式成立。等号条件由各步等号传递得出：第二步中 $2n$ 元等号当且仅当 $a_1 = \cdots = a_{2n}$（由二元 AM-GM 及归纳假设），第三步中 $n-1$ 元等号当且仅当 $a_1 = \cdots = a_{n-1} = A = \frac{a_1+\cdots+a_{n-1}}{n-1}$，即全部相等。因此对所有 $n \geq 2$，等号当且仅当 $a_1 = a_2 = \cdots = a_n$。 $\blacksquare$

**定义 9.5.1（均值的定义）**

设 $a_1, a_2, \ldots, a_n > 0$，定义以下均值：

- **算术平均**（AM）：$A = \dfrac{a_1 + a_2 + \cdots + a_n}{n}$
- **几何平均**（GM）：$G = \sqrt[n]{a_1 a_2 \cdots a_n}$
- **调和平均**（HM）：$H = \dfrac{n}{\dfrac{1}{a_1} + \dfrac{1}{a_2} + \cdots + \dfrac{1}{a_n}}$
- **平方平均**（QM）：$Q = \sqrt{\dfrac{a_1^2 + a_2^2 + \cdots + a_n^2}{n}}$

**定理 9.5.3（均值不等式链）** 对任意 $a_1, a_2, \ldots, a_n > 0$：

$$
H \leq G \leq A \leq Q
$$

等号当且仅当 $a_1 = a_2 = \cdots = a_n$。

**证明**：

**$G \leq A$**：即定理9.5.2。

**$H \leq G$**：对 $1/a_1, 1/a_2, \ldots, 1/a_n$ 应用 $G \leq A$：

$$
\sqrt[n]{\frac{1}{a_1} \cdot \frac{1}{a_2} \cdots \frac{1}{a_n}} \leq \frac{\frac{1}{a_1} + \frac{1}{a_2} + \cdots + \frac{1}{a_n}}{n}
$$

取倒数（函数 $f(x) = 1/x$ 在 $x > 0$ 上单调递减）：

$$
\frac{n}{\frac{1}{a_1} + \cdots + \frac{1}{a_n}} \leq \sqrt[n]{a_1 a_2 \cdots a_n}
$$

即 $H \leq G$。

**$A \leq Q$**：需证 $\left(\dfrac{\sum a_i}{n}\right)^2 \leq \dfrac{\sum a_i^2}{n}$，即

$$
\left(\sum a_i\right)^2 \leq n \sum a_i^2
$$

将左端展开：

$$
\left(\sum_{i=1}^n a_i\right)^2 = \sum_{i=1}^n a_i^2 + 2\sum_{1 \leq i < j \leq n} a_i a_j
$$

因此需证 $2\sum_{i < j} a_i a_j \leq (n-1)\sum a_i^2$。由基本不等式 $2a_i a_j \leq a_i^2 + a_j^2$（这等价于 $(a_i - a_j)^2 \geq 0$），对每对 $(i, j)$ 求和：

$$
2\sum_{i < j} a_i a_j \leq \sum_{i < j} (a_i^2 + a_j^2) = (n-1)\sum_{i=1}^n a_i^2
$$

（每个 $a_i^2$ 恰好出现在 $n-1$ 对中。）代入即得 $\left(\sum a_i\right)^2 \leq n \sum a_i^2$。$\blacksquare$

**注记**：上述不等式也是柯西-施瓦茨不等式（定理 9.6.1）取 $b_i = 1$ 的特例。

---

### 9.6 柯西-施瓦茨不等式

**定理 9.6.1（柯西-施瓦茨不等式）** 对任意实数 $a_1, \ldots, a_n, b_1, \ldots, b_n$：

$$
\left(\sum_{i=1}^n a_i b_i\right)^2 \leq \left(\sum_{i=1}^n a_i^2\right)\left(\sum_{i=1}^n b_i^2\right)
$$

等号当且仅当存在常数 $t$，使得 $a_i = t b_i$（$\forall i$）或 $b_i = 0$（$\forall i$）。

**证明**（判别式法）：

考虑关于 $t$ 的函数：

$$
f(t) = \sum_{i=1}^n (a_i t - b_i)^2 \geq 0 \quad (\forall t \in \mathbb{R})
$$

展开：

$$
f(t) = \left(\sum a_i^2\right) t^2 - 2\left(\sum a_i b_i\right) t + \left(\sum b_i^2\right) \geq 0
$$

设 $A = \sum a_i^2$，$B = \sum a_i b_i$，$C = \sum b_i^2$。则 $f(t) = At^2 - 2Bt + C \geq 0$ 对一切 $t$ 成立。

若 $A = 0$，则所有 $a_i = 0$，不等式两端均为零，等号成立。

若 $A > 0$，二次函数 $f(t) \geq 0$ 对一切 $t$ 成立，当且仅当其判别式 $\leq 0$：

$$
\Delta = 4B^2 - 4AC \leq 0
$$

$$
B^2 \leq AC
$$

即

$$
\left(\sum a_i b_i\right)^2 \leq \left(\sum a_i^2\right)\left(\sum b_i^2\right)
$$

等号当且仅当 $\Delta = 0$，即存在 $t_0$ 使得 $f(t_0) = 0$，即 $\sum(a_i t_0 - b_i)^2 = 0$，即 $a_i t_0 = b_i$ 对所有 $i$ 成立。 $\blacksquare$

**推论 9.6.1（施瓦茨不等式的积分形式，陈述）** 设 $f, g$ 在 $[a, b]$ 上可积，则

$$
\left(\int_a^b f(x) g(x) \, dx\right)^2 \leq \left(\int_a^b f^2(x) \, dx\right)\left(\int_a^b g^2(x) \, dx\right)
$$

> **本章展望**：不等式是分析学和优化理论的基石。第16章将从逻辑学的角度审视数学命题的结构，为严谨的数学推理提供更深层的理论支撑。

---

---

---

---

## Ch 16 逻辑与命题
> **前置知识**：本章不需要特定的代数知识，但要求读者具备基本的数学推理能力，以及对集合论（第一卷第2章）的了解。

### 10.1 充分条件与必要条件

**定义 10.1.1（命题）**

可以判断真假的陈述句称为**命题**。真命题记为"真"（T），假命题记为"假"（F）。

**定义 10.1.2（蕴含关系）**

设 $P$，$Q$ 为命题。"$P \Rightarrow Q$"（若 $P$ 则 $Q$）称为**蕴含**。其真值表为：

| $P$ | $Q$ | $P \Rightarrow Q$ |
|:---:|:---:|:---:|
| T | T | T |
| T | F | F |
| F | T | T |
| F | F | T |

**定义 10.1.3（充分条件与必要条件）**

在 $P \Rightarrow Q$ 中：

- $P$ 是 $Q$ 的**充分条件**（$P$ 足以推出 $Q$）。
- $Q$ 是 $P$ 的**必要条件**（$Q$ 是 $P$ 成立所必须的）。

**定义 10.1.4（充要条件）**

若 $P \Rightarrow Q$ 且 $Q \Rightarrow P$，即 $P \Leftrightarrow Q$，则称 $P$ 是 $Q$ 的**充要条件**。

**定理 10.1.1（蕴含的集合视角）** 设 $P(x)$ 和 $Q(x)$ 分别表示"$x$ 具有性质 $P$"和"$x$ 具有性质 $Q$"。令

$$
A = \{x : P(x)\}, \quad B = \{x : Q(x)\}
$$

则：

(i) $P \Rightarrow Q$ 当且仅当 $A \subseteq B$。

(ii) $P \Leftrightarrow Q$ 当且仅当 $A = B$。

**证明**：

(i) ($\Rightarrow$) 若 $P \Rightarrow Q$，则对任意 $x \in A$，$P(x)$ 成立，从而 $Q(x)$ 成立，即 $x \in B$。故 $A \subseteq B$。

($\Leftarrow$) 若 $A \subseteq B$，则对任意 $x$，$P(x) \Rightarrow x \in A \Rightarrow x \in B \Rightarrow Q(x)$。故 $P \Rightarrow Q$。

(ii) 由 (i)，$P \Leftrightarrow Q$ 即 $P \Rightarrow Q$ 且 $Q \Rightarrow P$，等价于 $A \subseteq B$ 且 $B \subseteq A$，即 $A = B$。 $\blacksquare$

**定理 10.1.2（逆否命题）** $P \Rightarrow Q$ 与其逆否命题 $\neg Q \Rightarrow \neg P$ 等价。

**证明**：利用真值表。$\neg Q \Rightarrow \neg P$ 与 $P \Rightarrow Q$ 在所有真值指派下具有相同的真值。

或者直接证明：假设 $P \Rightarrow Q$ 成立且 $\neg Q$ 成立。若 $\neg P$ 不成立，即 $P$ 成立，则由 $P \Rightarrow Q$ 得 $Q$ 成立，与 $\neg Q$ 矛盾。故 $\neg P$ 成立，即 $\neg Q \Rightarrow \neg P$。

反方向的证明完全对称。 $\blacksquare$

---

### 10.2 全称命题与存在命题的否定

**定义 10.2.1（全称命题与存在命题）**

- **全称命题**：$\forall x \in D, \, P(x)$（对 $D$ 中所有 $x$，$P(x)$ 成立）。
- **存在命题**：$\exists x \in D, \, P(x)$（存在 $D$ 中的 $x$，使得 $P(x)$ 成立）。

**定理 10.2.1（全称命题的否定）**

$$
\neg(\forall x \, P(x)) \Leftrightarrow \exists x \, \neg P(x)
$$

**证明**：

($\Rightarrow$) 假设 $\neg(\forall x \, P(x))$。若不存在 $x$ 使得 $\neg P(x)$，即对所有 $x$，$P(x)$ 成立，则 $\forall x \, P(x)$ 成立，与假设矛盾。故存在 $x$ 使得 $\neg P(x)$。

($\Leftarrow$) 假设 $\exists x \, \neg P(x)$，设此 $x$ 为 $x_0$，则 $P(x_0)$ 为假，故 $\forall x \, P(x)$ 不成立，即 $\neg(\forall x \, P(x))$。

$\blacksquare$

**定理 10.2.2（存在命题的否定）**

$$
\neg(\exists x \, P(x)) \Leftrightarrow \forall x \, \neg P(x)
$$

**证明**：

($\Rightarrow$) 假设 $\neg(\exists x \, P(x))$。若存在 $x_0$ 使得 $P(x_0)$ 成立，则 $\exists x \, P(x)$ 成立，与假设矛盾。故对所有 $x$，$\neg P(x)$ 成立。

($\Leftarrow$) 假设 $\forall x \, \neg P(x)$。若 $\exists x \, P(x)$ 成立，设 $P(x_0)$ 成立，则 $\neg P(x_0)$ 与 $\forall x \, \neg P(x)$ 矛盾。故 $\neg(\exists x \, P(x))$。

$\blacksquare$

**推论 10.2.1（双重否定）**

$$
\neg(\neg P) \Leftrightarrow P
$$

**证明**：由真值表直接验证。 $\blacksquare$

**推论 10.2.2（复合命题的否定）**

$$
\neg(P \land Q) \Leftrightarrow (\neg P) \lor (\neg Q)
$$

$$
\neg(P \lor Q) \Leftrightarrow (\neg P) \land (\neg Q)
$$

这些法则称为**德摩根律**。

**证明**：由真值表直接验证（此处略去具体真值表）。 $\blacksquare$

> **本章展望**：逻辑与命题的严格理论为数学证明提供了语言基础。第17章将运用不等式和逻辑工具研究线性规划这一应用数学的重要分支。

---

---

---

---

## Ch 17 线性规划初步
> **前置知识**：本章需要第15章的不等式理论（特别是二元一次不等式），以及基本的平面直角坐标系知识。

### 11.1 二元一次不等式表示的区域

**定理 11.1.1** 设直线 $l: ax + by + c = 0$（$a, b$ 不同时为零）。则

(i) $ax + by + c > 0$ 表示 $l$ 的某一侧的半平面。

(ii) $ax + by + c < 0$ 表示 $l$ 的另一侧的半平面。

**证明**（取特殊点法）：

设 $(x_0, y_0)$ 为不在 $l$ 上的任意一点，即 $ax_0 + by_0 + c \neq 0$。

设 $(x, y)$ 为 $l$ 上的点，即 $ax + by + c = 0$。

考虑线段上任一点 $(x_t, y_t) = (1-t)(x_0, y_0) + t(x, y)$（$0 \leq t \leq 1$）：

$$
ax_t + by_t + c = (1-t)(ax_0 + by_0 + c) + t(ax + by + c) = (1-t)(ax_0 + by_0 + c)
$$

当 $0 \leq t < 1$ 时，$(1-t) > 0$，故 $ax_t + by_t + c$ 与 $ax_0 + by_0 + c$ 同号。

这说明：$(x_0, y_0)$ 和连接它与 $l$ 上任意点的线段上的点（不含端点在 $l$ 上的），使得 $ax + by + c$ 保持同号。因此，不在 $l$ 上的同一连通区域（半平面）内的点使 $ax + by + c$ 同号。

为确定哪个半平面对应 $> 0$，只需取一个特殊点检验。例如，若 $c \neq 0$，取原点 $(0, 0)$：

- 若 $c > 0$，则原点在 $ax + by + c > 0$ 的半平面内。
- 若 $c < 0$，则原点在 $ax + by + c < 0$ 的半平面内。

$\blacksquare$

**推论 11.1.1** 二元一次不等式组

$$
\begin{cases}
a_1 x + b_1 y + c_1 \leq 0 \\
a_2 x + b_2 y + c_2 \leq 0 \\
\vdots \\
a_n x + b_n y + c_n \leq 0
\end{cases}
$$

的解集是各不等式对应半平面的交集。若此交集非空且有界，则为凸多边形。

**证明**：由定理11.1.1，每个二元一次不等式 $a_i x + b_i y + c_i \leq 0$ 的解集为一个闭半平面。不等式组的解集为满足所有不等式的点的集合，即各半平面的交集。有限个半平面的交集为凸集（因半平面为凸集，凸集的交仍为凸集）。当此交集非空且有界时，凸集为凸多边形。$\blacksquare$

---

### 11.2 线性规划基本定理

**定义 11.2.1（线性规划问题）**

**线性规划问题**是求线性目标函数 $z = ax + by$ 在由线性不等式组（约束条件）确定的可行域上的最大值或最小值。

**定义 11.2.2（可行域与顶点）**

- **可行域**：满足所有约束条件的点 $(x, y)$ 的集合。
- **顶点**：可行域的凸多边形的顶点（角点）。

**定理 11.2.1（线性规划基本定理）** 设可行域 $D$ 为非空有界的凸多边形，目标函数 $z = ax + by$ 在 $D$ 上取得最大值和最小值。最大值和最小值必在 $D$ 的某个顶点处取得。

**证明**：

**第一步：最优值的存在性。** $D$ 为非空有界闭集，$z = ax + by$ 为连续函数。由闭区间上连续函数的极值定理的推广（多元版本），$z$ 在 $D$ 上取得最大值和最小值。（注：多元连续函数的极值定理将在后续多元分析章节中严格建立，此处仅作直观应用。）

**第二步：最优值在边界取得。** 若 $a = b = 0$，则 $z \equiv 0$ 为常函数，$D$ 的任意顶点均为最优点，结论成立。以下设 $(a,b) \neq (0,0)$。

设 $(x_0, y_0) \in D$ 为 $z$ 的最大值点。假设 $(x_0, y_0)$ 不在 $D$ 的边界上，即 $(x_0, y_0)$ 是 $D$ 的内点。则存在 $\varepsilon > 0$ 使得以 $(x_0, y_0)$ 为圆心、$\varepsilon$ 为半径的圆含于 $D$ 内。考虑方向 $(a, b)$ 上的点 $(x_0 + ta, y_0 + tb)$（$t > 0$ 充分小）：

$$
z(x_0 + ta, y_0 + tb) = a(x_0 + ta) + b(y_0 + tb) = z(x_0, y_0) + t(a^2 + b^2) > z(x_0, y_0)
$$

这与 $(x_0, y_0)$ 是最大值点矛盾。故最大值点在边界上。

**第三步：最优值在顶点取得。** $D$ 的边界由若干线段组成。设最大值在边界线段 $\overline{PQ}$（端点 $P, Q$ 为顶点）的内点 $M$ 处取得。设 $M = (1-\lambda)P + \lambda Q$（$0 < \lambda < 1$）。由线性：

$$
z(M) = (1-\lambda) z(P) + \lambda z(Q)
$$

由于 $z(M)$ 是 $z(P)$ 和 $z(Q)$ 的凸组合，$z(M) \leq \max(z(P), z(Q))$。但 $z(M)$ 是最大值，故 $z(M) = z(P) = z(Q)$。因此 $P$ 和 $Q$ 也是最大值点，即最大值在顶点处取得。

$\blacksquare$

**推论 11.2.1** 求解线性规划问题只需在可行域的所有顶点处计算目标函数的值，取最大（或最小）者即可。

---

### 11.3 图解法

**定义 11.3.1（图解法）**

对于只有两个变量的线性规划问题，可以用平面图形求解，方法如下：

1. 在平面直角坐标系中画出各约束条件对应的直线。
2. 确定每条直线对应的半平面，取其交集得到可行域。
3. 画出目标函数 $z = ax + by$ 的一组等值线（平行直线族 $ax + by = k$）。
4. 沿目标函数增大的方向平移等值线，最后离开可行域的点即为最优解。

**定理 11.3.1（等值线的平行性）** 目标函数 $z = ax + by$ 的等值线族 $\{ax + by = k : k \in \mathbb{R}\}$ 中的直线互相平行。

**证明**：等值线 $ax + by = k$ 的法向量为 $(a, b)$，与 $k$ 无关。故所有等值线法向量相同，互相平行。 $\blacksquare$

**定理 11.3.2** 若可行域 $D$ 非空有界，且目标函数 $z = ax + by$ 的等值线不与 $D$ 的任一边平行，则最优解唯一，位于某一顶点处。

**证明**：由定理11.2.1，最优值在某顶点 $V$ 处取得。假设另一点 $W \in D$ 也取得最优值，则 $z(W) = z(V)$，即 $W$ 在过 $V$ 的等值线上。若 $W$ 不是顶点，则 $W$ 在某条边 $\overline{PQ}$ 上。等值线方向向量为 $(-b, a)$，边 $\overline{PQ}$ 方向向量为 $Q - P$。若两者不平行，等值线与边至多一个交点，故 $W$ 必与某一端点重合。 $\blacksquare$

**定理 11.3.3（无界可行域的情形）** 若可行域 $D$ 无界，目标函数可能无最大值或无最小值（或两者皆无）。

**证明**：设可行域 $D$ 包含射线 $\{(x_0 + t d_1, y_0 + t d_2) : t \geq 0\}$，其中 $(d_1, d_2) \neq (0, 0)$。则

$$
z(x_0 + td_1, y_0 + td_2) = z(x_0, y_0) + t(ad_1 + bd_2)
$$

- 若 $ad_1 + bd_2 > 0$，当 $t \to +\infty$ 时 $z \to +\infty$，无最大值。
- 若 $ad_1 + bd_2 < 0$，当 $t \to +\infty$ 时 $z \to -\infty$，无最小值。
- 若 $ad_1 + bd_2 = 0$，沿射线 $z$ 为常数，需要进一步分析。

$\blacksquare$

> **本章展望**：线性规划是运筹学的核心内容。本章仅涉及二元情形的图解法，更一般的单纯形法和对偶理论将在高等代数和运筹学课程中深入讨论。至此，卷二"代数"的内容全部完成，为读者进入高等数学的学习奠定了坚实的代数基础。


*卷二：代数终。*


*卷二：代数终。*


*卷二：代数终。*
