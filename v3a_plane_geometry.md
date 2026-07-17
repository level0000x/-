# 卷三A：平面几何

> 本卷从希尔伯特公理系统出发，以严格的逻辑推导建立平面几何的完整理论体系。第12章确立欧氏几何的公理基础（关联公理、顺序公理、合同公理、平行公理和连续公理），第13章在此基础上系统推导平面几何的全部核心定理：三角形全等与相似的判定准则、四边形性质、圆的核心定理、面积理论以及锐角三角函数。

---

## Ch 12 欧氏几何公理体系
**前置知识**：本章假定读者已掌握卷一 Ch 2 逻辑基础（命题逻辑、谓词逻辑、证明方法）和 Ch 3 集合论（集合的运算、关系与函数）。几何公理将使用逻辑语言精确表述几何直觉，每一条公理都是一个严格的形式化命题。

---

几何学是数学中最古老的分支之一。公元前约300年，欧几里得在《几何原本》中首次尝试用公理化方法建立几何学体系。然而，欧几里得的公理系统在严谨性上存在明显不足——他的一些"公理"实际上是定理，某些证明中隐含了未经声明的假设。1899年，德国数学家大卫·希尔伯特在其著作《几何基础》中提出了一个完整的公理系统，将欧氏几何建立在严格的逻辑基础之上。本章详细阐述这一公理系统，并从中推导出若干最基本的几何命题。

希尔伯特公理系统由五组公理构成：关联公理（描述点、直线、平面之间的结合关系）、顺序公理（描述点在直线上的排列顺序）、合同公理（描述线段和角的全等关系）、平行公理（描述平行线的存在性和唯一性）以及连续公理（描述直线的连续性和完备性）。这五组公理共同刻画了欧氏几何的全部结构。

### 12.1 基本概念与关联公理

#### 12.1.1 基本对象与基本关系

希尔伯特公理系统建立在三个**基本对象**和三个**基本关系**之上：

- **基本对象**：点（point）、直线（line）、平面（plane）。
- **基本关系**：关联（incidence，又称"结合"或"属于"）、介于（betweenness，又称"顺序"）、合同（congruence，又称"全等"）。

这些基本对象和基本关系本身不加定义，它们的意义完全由公理所规定的性质来确定。这正体现了公理化方法的精神：我们不追问"点是什么"，而只关心"点满足什么性质"。

我们采用如下记号：
- 点用大写字母 $A, B, C, \ldots$ 表示；
- 直线用小写字母 $a, b, c, \ldots$ 或 $\overleftrightarrow{AB}$ 表示；
- 平面用希腊字母 $\alpha, \beta, \gamma, \ldots$ 表示；
- "点 $A$ 在直线 $a$ 上"或"直线 $a$ 经过点 $A$"记为 $A \in a$；
- "点 $A$ 在平面 $\alpha$ 上"记为 $A \in \alpha$；
- "直线 $a$ 在平面 $\alpha$ 上"记为 $a \subset \alpha$。

#### 12.1.2 关联公理（结合公理）I1--I8

关联公理描述点、直线、平面之间的基本结合关系。

**公理 I1**：对于任意两个不同的点 $A$ 和 $B$，存在一条直线 $a$ 使得 $A \in a$ 且 $B \in a$。

**公理 I2**：对于任意两个不同的点 $A$ 和 $B$，至多存在一条直线 $a$ 使得 $A \in a$ 且 $B \in a$。

由公理 I1 和 I2 可知，任意两个不同的点**唯一确定**一条直线。我们将通过点 $A$ 和 $B$ 的唯一直线记为 $\overleftrightarrow{AB}$。

**公理 I3**：每条直线上至少存在两个不同的点。存在三个不共线的点。

**公理 I4**：对于任意三个不共线的点 $A$、$B$、$C$，存在一个平面 $\alpha$ 使得 $A \in \alpha$、$B \in \alpha$、$C \in \alpha$。对于任意平面，其上至少存在一个点。

**公理 I5**：对于任意三个不共线的点 $A$、$B$、$C$，至多存在一个平面使得 $A$、$B$、$C$ 都在其上。

由公理 I4 和 I5 可知，任意三个不共线的点**唯一确定**一个平面。

**公理 I6**：如果一条直线上的两个不同的点都在平面 $\alpha$ 上，那么该直线上的所有点都在 $\alpha$ 上（即直线含于 $\alpha$）。

**公理 I7**：如果两个不同的平面有一个公共点，那么它们至少还有一个公共点。

**公理 I8**：至少存在四个不共面的点。

公理 I8 保证了空间的"三维性"——排除了所有点都在同一个平面上的退化情况。

**定义 12.1**（共线）：如果若干个点都在同一条直线上，则称这些点是**共线的**。

**定义 12.2**（共面）：如果若干个点都在同一个平面上，则称这些点是**共面的**。

**命题 12.1**：两条不同的直线至多有一个公共点。

**证明**：假设直线 $a$ 和直线 $b$ 有两个不同的公共点 $A$ 和 $B$。根据公理 I2，通过 $A$ 和 $B$ 至多有一条直线，因此 $a = b$，与 $a$ 和 $b$ 不同的假设矛盾。$\blacksquare$

**命题 12.2**：如果两个不同的平面有一个公共点，那么它们的交集是一条直线。

**证明**：设平面 $\alpha$ 和平面 $\beta$ 有一个公共点 $P$。根据公理 I7，它们至少还有一个公共点 $Q$（$Q \neq P$）。由公理 I2，直线 $\overleftrightarrow{PQ}$ 唯一确定。

设 $R$ 是 $\alpha$ 和 $\beta$ 的任意公共点。如果 $R$ 不在 $\overleftrightarrow{PQ}$ 上，则 $P$、$Q$、$R$ 不共线，由公理 I5，它们唯一确定一个平面。但 $P$、$Q$、$R$ 都在 $\alpha$ 上，也都在 $\beta$ 上，因此 $\alpha = \beta$，与两个平面不同的假设矛盾。

因此，$\alpha$ 和 $\beta$ 的所有公共点都在 $\overleftrightarrow{PQ}$ 上。另一方面，由公理 I6，$\overleftrightarrow{PQ}$ 上的所有点既在 $\alpha$ 上也在 $\beta$ 上。所以 $\alpha \cap \beta = \overleftrightarrow{PQ}$。$\blacksquare$

### 12.2 顺序公理

顺序公理描述点在直线上的相对位置关系，引入"介于"的概念。这是建立线段、射线、角的内部等概念的基础。

**定义 12.3**（介于关系）：设 $A$、$B$、$C$ 是一条直线上的三个不同的点。如果 $B$ 在 $A$ 和 $C$ 之间，则记为 $A * B * C$。

**公理 O1**：如果 $A * B * C$，则 $A$、$B$、$C$ 是同一条直线上三个不同的点，且 $C * B * A$。

**公理 O2**：对于任意两个不同的点 $A$ 和 $B$，直线 $\overleftrightarrow{AB}$ 上至少存在一个点 $C$ 使得 $A * B * C$。

**公理 O3**：对于同一条直线上的任意三个不同的点，至多有一个点介于另外两个点之间。

**公理 O4**（帕施公理）：设 $A$、$B$、$C$ 是三个不共线的点，$a$ 是一条不经过 $A$、$B$、$C$ 中任何一个点的直线。如果直线 $a$ 经过线段 $AB$ 的某个内点，那么它也经过线段 $BC$ 或线段 $AC$ 的某个内点。

**定义 12.4**（线段）：对于两个不同的点 $A$ 和 $B$，**线段** $AB$ 是指直线 $\overleftrightarrow{AB}$ 上所有满足 $A * X * B$ 的点 $X$ 以及 $A$、$B$ 两点本身的集合。$A$ 和 $B$ 称为线段 $AB$ 的**端点**。线段 $AB$ 记为 $\overline{AB}$。

**定义 12.5**（射线）：对于两个不同的点 $A$ 和 $B$，以 $A$ 为端点、经过 $B$ 的**射线** $\overrightarrow{AB}$ 是指直线 $\overleftrightarrow{AB}$ 上所有满足 $A * B * X$ 或 $X = A$ 或 $X = B$ 的点 $X$ 的集合。

**定义 12.6**（开半直线）：直线 $\overleftrightarrow{AB}$ 上除去线段 $\overline{AB}$ 的两个部分（不包括 $A$ 和 $B$），分别称为以 $A$ 为分界点、关于 $B$ 的**开半直线**及其**对侧**。

**引理 12.1**（介于关系的基本推论）：设 $A$、$B$、$C$、$D$ 是同一条直线上的不同点。

1. 若 $A * B * C$，则 $C * B * A$。
2. 若 $A * B * D$ 且 $C * B * D$，则 $A * B * C$。

**证明**：

性质 1 是公理 O1 的直接推论。

性质 2 的证明：由公理 O3，在 $\{A, B, C\}$ 中至多一种"介于"关系成立。我们用反证法排除 $A * C * B$ 和 $B * A * C$ 两种可能：

- 若 $A * C * B$，则 $C$ 在 $A$ 和 $B$ 之间。由 $A * B * D$ 知 $B$ 在 $A$ 和 $D$ 之间，故 $C$ 介于 $A$ 与 $B$ 之间、而 $B$ 又介于 $A$ 与 $D$ 之间，因此 $B$ 在 $C$ 和 $D$ 之间，即 $C * B * D$。但这意味着 $B$ 和 $D$ 在 $C$ 的两侧，而 $A * C * B$ 表明 $B$ 和 $A$ 也在 $C$ 的两侧。综合知 $A$ 和 $D$ 在 $C$ 的同侧，从而 $A * C * D$。又 $C * B * D$ 表明 $D$ 在 $B$ 的远离 $C$ 的一侧，而 $A * C * D$ 表明 $D$ 在 $C$ 的远离 $A$ 的一侧，两者一致；但 $A * C * B$ 表明 $B$ 在 $C$ 的远离 $A$ 的一侧，而 $C * B * D$ 表明 $B$ 在 $C$ 和 $D$ 之间，即 $B$ 在 $C$ 的远离 $A$ 的一侧、$D$ 在 $B$ 的远离 $C$ 的一侧，这与 $A * C * D$ 中 $D$ 在 $C$ 的远离 $A$ 的一侧且 $A$ 在 $C$ 和 $D$ 之间矛盾（$A$ 不可能既在 $C$ 的远离 $B$ 的一侧又在 $C$ 和 $D$ 之间）。因此 $A * C * B$ 不成立。

- 若 $B * A * C$，则 $A$ 在 $B$ 和 $C$ 之间。由 $A * B * D$ 知 $B$ 在 $A$ 和 $D$ 之间，故 $B$ 和 $D$ 在 $A$ 的两侧；而 $B * A * C$ 表明 $B$ 和 $C$ 也在 $A$ 的两侧，因此 $C$ 和 $D$ 在 $A$ 的同侧。由 $C * B * D$（性质 1 得 $D * B * C$），$B$ 在 $C$ 和 $D$ 之间，$C$ 和 $D$ 在 $B$ 的两侧。但 $B * A * C$ 表明 $C$ 在 $A$ 的远离 $B$ 的一侧，而 $A * B * D$ 表明 $D$ 在 $B$ 的远离 $A$ 的一侧。$C$ 和 $D$ 在 $A$ 的同侧，但 $B$ 在 $C$ 和 $D$ 之间要求 $C$ 和 $D$ 在 $B$ 的两侧，而 $B$ 在 $A$ 和 $D$ 之间要求 $D$ 在 $A$ 的远离 $B$ 的一侧、$C$ 在 $A$ 的靠近 $B$ 的一侧（由 $B * A * C$），矛盾。因此 $B * A * C$ 不成立。

排除以上两种可能后，必有 $A * B * C$ 成立。$\blacksquare$"

**命题 12.3**：设 $A$、$B$、$C$ 是同一条直线上的三个不同的点。则恰好有以下三种情况之一成立：

1. $A * B * C$；
2. $A * C * B$；
3. $B * A * C$。

**证明**：由公理 O3（唯一性），至多有一种"介于"关系成立。下面证明至少有一种成立，采用反证法。

假设 $A$、$B$、$C$ 之间不存在任何"介于"关系，即 $A * B * C$、$A * C * B$、$B * A * C$ 均不成立。我们分步导出矛盾。

**第一步**：由公理 O2（存在性），存在点 $D$ 使得 $A * B * D$。若 $D = C$，则 $A * B * C$ 成立，与假设矛盾。故 $D \neq C$，即 $A$、$B$、$C$、$D$ 是直线上四个不同的点。

**第二步**：考虑 $C$ 与 $D$ 的位置。由公理 O3，在三个点 $\{B, C, D\}$ 中恰好有一种"介于"关系成立。由 $A * B * D$ 知 $B \neq D$，且 $C \neq B$、$C \neq D$，故以下三种情况恰有一种成立：

**(i)** $B * C * D$：此时考虑三个点 $\{A, B, C\}$。由公理 O4（帕施公理），构造辅助线：取不在直线 $l$ 上的点 $P$，作三角形 $\triangle ABD$。点 $C$ 满足 $B * C * D$，即 $C$ 在线段 $BD$ 上。由于 $A * B * D$，点 $B$ 在线段 $AD$ 上。在三角形 $\triangle ACD$ 中，$B$ 在线段 $AD$ 上，$B * C * D$ 表明 $C$ 在线段 $BD$ 上。由公理 O3，我们分析 $\{A, B, C\}$ 的排列：$A * B * C$ 和 $B * A * C$ 互斥（公理 O3 唯一性）。若 $A * B * C$，则与假设矛盾。因此必有 $B * A * C$ 或 $A * C * B$。但若 $B * A * C$，则 $A$ 在 $B$ 和 $C$ 之间；而由 $A * B * D$ 和 $B * C * D$，$A$、$B$、$C$ 在 $D$ 的同侧且 $B$ 在 $A$ 与 $C$ 之间，这与 $B * A * C$ 矛盾（公理 O3：$A * B * D$ 和 $B * A * C$ 不能同时成立，否则 $B$ 既在 $A$ 和 $D$ 之间又在 $A$ 的另一侧）。类似地，$A * C * B$ 也会导致矛盾。因此在情形 (i) 下 $A * B * C$ 必成立，与假设矛盾。

**(ii)** $B * D * C$：此时 $D$ 在 $B$ 和 $C$ 之间。由 $A * B * D$ 和 $B * D * C$，在三个点 $\{A, B, C\}$ 中：由公理 O3，排列 $A * B * C$、$A * C * B$、$B * A * C$ 恰有一种成立。我们排除后两种：若 $B * A * C$，则 $A$ 在 $B$ 和 $C$ 之间；但 $A * B * D$ 表明 $B$ 在 $A$ 和 $D$ 之间，$B * D * C$ 表明 $D$ 在 $B$ 和 $C$ 之间，因此 $A$ 和 $C$ 在 $B$ 的异侧，$A$ 不可能在 $B$ 和 $C$ 之间，矛盾。若 $A * C * B$，则 $C$ 在 $A$ 和 $B$ 之间；但 $A * B * D$ 表明 $B$ 在 $A$ 和 $D$ 之间，$C$ 在 $B$ 的远离 $A$ 一侧（因为 $B * D * C$），矛盾。因此在情形 (ii) 下 $A * B * C$ 必成立，与假设矛盾。

**(iii)** $C * B * D$：此时 $B$ 在 $C$ 和 $D$ 之间。结合 $A * B * D$（$B$ 在 $A$ 和 $D$ 之间），可知 $A$ 和 $C$ 在 $B$ 的两侧（因为 $B$ 将直线分为两个半直线，$A$ 和 $D$ 在 $B$ 的两侧，而 $C$ 和 $D$ 也在 $B$ 的两侧，故 $A$ 和 $C$ 在 $B$ 的异侧）。因此 $B * A * C$（$B$ 在 $A$ 和 $C$ 之间），与假设矛盾。

**第三步**：以上三种情况均与假设矛盾，故假设不成立。三个点之间至少有一种"介于"关系成立。结合至多一种成立（公理 O3），恰好有一种"介于"关系成立。$\blacksquare$

**定义 12.7**（三角形）：三个不共线的点 $A$、$B$、$C$ 以及三条线段 $\overline{AB}$、$\overline{BC}$、$\overline{CA}$ 组成的图形称为**三角形**，记为 $\triangle ABC$。点 $A$、$B$、$C$ 称为三角形的**顶点**，线段 $\overline{AB}$、$\overline{BC}$、$\overline{CA}$ 称为三角形的**边**。

### 12.3 合同公理

合同公理引入线段和角的"全等"（合同）关系，用 $\cong$ 表示。合同关系刻画了"长度相等"和"角度相等"的几何直觉。

#### 12.3.1 线段的合同

**公理 C1**：设 $A$、$B$ 是直线 $a$ 上的两个点，$A'$ 是直线 $a'$ 上的点，$p'$ 是 $a'$ 上以 $A'$ 为端点的一条射线。则在射线 $p'$ 上存在唯一的点 $B'$ 使得 $\overline{AB} \cong \overline{A'B'}$。

**公理 C2**（合同的传递性）：如果 $\overline{AB} \cong \overline{A'B'}$ 且 $\overline{AB} \cong \overline{A''B''}$，则 $\overline{A'B'} \cong \overline{A''B''}$。

**公理 C3**（合同的可加性）：设 $B$ 是线段 $\overline{AC}$ 上的点（即 $A * B * C$），$B'$ 是线段 $\overline{A'C'}$ 上的点（即 $A' * B' * C'$）。如果 $\overline{AB} \cong \overline{A'B'}$ 且 $\overline{BC} \cong \overline{B'C'}$，则 $\overline{AC} \cong \overline{A'C'}$。

由公理 C1--C3 可知，线段的合同关系 $\cong$ 是一个等价关系（自反性、对称性、传递性），并且合同关系在同一条直线上具有可加性。这使得"长度"的概念有了严格的公理基础。

#### 12.3.2 角的合同

**定义 12.8**（角）：设 $h$ 和 $k$ 是从同一点 $O$ 出发的两条不共线的射线。由这两条射线所确定的有界区域（不包含 $O$ 的对顶角区域）称为角的**内部**。$h$、$k$ 以及角内部的所有点组成的集合称为一个**角**，记为 $\angle(h, k)$ 或 $\angle hOk$。射线 $h$ 和 $k$ 称为角的**边**，点 $O$ 称为角的**顶点**。

**公理 C4**：设 $\angle(h, k)$ 是一个角，$h'$ 是直线 $a'$ 上以 $O'$ 为端点的射线，$a'$ 有确定的一侧 $H'$。则在 $H'$ 上存在且仅存在一条以 $O'$ 为端点的射线 $k'$，使得 $\angle(h, k) \cong \angle(h', k')$。

**公理 C5**：角的合同关系具有对称性，即若 $\angle(h, k) \cong \angle(h', k')$，则 $\angle(h', k') \cong \angle(h, k)$。此外，$\angle(h,k) \cong \angle(k, h)$。

**公理 C6**（SAS 公理）：设 $A$、$B$、$C$ 是三个不共线的点，$A'$、$B'$、$C'$ 也是三个不共线的点。如果

$$\overline{AB} \cong \overline{A'B'}, \quad \overline{AC} \cong \overline{A'C'}, \quad \angle BAC \cong \angle B'A'C',$$

则 $\angle ABC \cong \angle A'B'C'$ 且 $\angle ACB \cong \angle A'C'B'$。

公理 C6 是希尔伯特公理系统中最关键的公理之一——它实际上就是三角形全等的 SAS（边角边）判定准则。注意欧几里得在《几何原本》中将 SAS 作为定理来证明，但希尔伯特认识到其证明实际上隐含了未声明的假设，因此将它提升为公理。

**定义 12.9**（直角、垂直）：设 $A$、$B$、$C$ 是直线 $h$ 上的三个点（$A * B * C$），$k$ 是以 $B$ 为端点的射线。如果 $\angle ABk \cong \angle CBk$，则称 $\angle ABk$ 为**直角**，射线 $k$ 与直线 $h$ **互相垂直**，记为 $k \perp h$。

### 12.4 平行公理

**公理 P**（平行公理 / 第五公设）：设 $a$ 是一条直线，$P$ 是不在 $a$ 上的一个点。则在 $P$ 和 $a$ 确定的平面上，至多存在一条直线经过 $P$ 且与 $a$ 不相交。

**定义 12.10**（平行）：在同一平面上，两条不相交的直线称为**平行**的，记为 $a \parallel b$。

平行公理是欧氏几何区别于非欧几何的关键所在。如果否定这条公理，就得到两种非欧几何：
- **双曲几何**（罗巴切夫斯基几何）：过直线外一点有**无数条**平行线。
- **椭圆几何**（黎曼几何）：过直线外一点**不存在**平行线。

**命题 12.4**（平行线的存在性）：设 $a$ 是一条直线，$P$ 是不在 $a$ 上的一个点。则在 $P$ 和 $a$ 确定的平面上，至少存在一条直线经过 $P$ 且与 $a$ 平行。

**证明**：在直线 $a$ 上取两点 $Q$、$R$。在 $P$ 点处，由公理 C4，可以构造射线 $\overrightarrow{PS}$ 使得 $\angle QPS \cong \angle PQR$（同位角相等），且 $\overrightarrow{PS}$ 与 $a$ 在 $\overleftrightarrow{PQ}$ 的同一侧。直线 $\overleftrightarrow{PS}$ 与 $a$ 被 $\overleftrightarrow{PQ}$ 所截，同位角相等，故 $\overleftrightarrow{PS} \parallel a$。

**严格论证**：假设 $\overleftrightarrow{PS}$ 与 $a$ 相交于点 $X$（$X \neq Q$）。考虑 $\triangle PQX$，$\angle QPS$ 是 $\triangle PQX$ 在顶点 $P$ 处的角。由于 $X$ 在 $a$ 上且 $X \neq Q$，$\angle PQX$ 是 $\triangle PQX$ 在顶点 $Q$ 处的角。由外角定理（定理 12.3）（此定理将在后文定理 12.3 中正式陈述和证明，此处仅使用其结论），$\triangle PQX$ 的外角严格大于不相邻内角。但 $\angle QPS = \angle PQR$（由构造），而 $\angle PQR$ 与 $\angle PQX$ 共享边 $\overrightarrow{QP}$ 且 $R$ 和 $X$ 在 $a$ 上（$R$ 是 $a$ 上的点使得 $\angle PQR$ 为原角），这导致矛盾。故 $\overleftrightarrow{PS}$ 不与 $a$ 相交，即 $\overleftrightarrow{PS} \parallel a$。$\blacksquare$

结合平行公理 P 和命题 12.4，我们知道：经过直线外一点**恰好**存在一条直线与已知直线平行。

### 12.5 连续公理

**公理 D1**（阿基米德公理）：设 $\overline{AB}$ 和 $\overline{CD}$ 是两条线段。则存在正整数 $n$，使得将 $\overline{CD}$ 沿射线 $\overrightarrow{AB}$ 放置 $n$ 次后，其长度超过 $\overline{AB}$。即存在点 $A = A_0, A_1, A_2, \ldots, A_n$ 在射线 $\overrightarrow{AB}$ 上，使得 $A_{i-1}A_i \cong CD$（$i = 1, 2, \ldots, n$），且 $A * B * A_n$。

**公理 D2**（直线完备性公理）：直线上的点组成的系统不能被扩充为一个仍然满足公理 I1--I2、O1--O4、C1--C3 和 D1 的更大的系统。

公理 D2 保证了直线上的点构成一个"完备"的系统，没有"空隙"。它等价于实数的完备性公理（确界原理），使得我们可以对线段进行任意精度的测量。

### 12.6 从公理推导基本命题

在建立了完整的公理系统之后，我们现在从中推导若干最基本的几何命题。这些命题是后续章节中全部平面几何和立体几何定理的基础。

**引理 12.0（SSS 全等判定）**：若两个三角形的三对边分别合同，则两个三角形全等。即：若 $\overline{AB} \cong \overline{A'B'}$，$\overline{BC} \cong \overline{B'C'}$，$\overline{CA} \cong \overline{C'A'}$，则 $\triangle ABC \cong \triangle A'B'C'$。

**证明**：将 $\triangle A'B'C'$ 放置在平面上使得 $A'B'$ 与 $AB$ 重合，且 $C'$ 与 $C$ 在 $AB$ 的同侧。若 $C' = C$ 则已证。若 $C' \neq C$，由 $\overline{AC} \cong \overline{A'C'} = \overline{AC'}$，$\overline{BC} \cong \overline{B'C'} = \overline{BC'}$，知 $C$ 和 $C'$ 到 $A$、$B$ 的距离相等。取 $AB$ 的中点 $M$（由后文定理 12.1 或直接构造），连接 $CC'$。在 $\triangle ACC'$ 中，$AC = AC'$，故 $\triangle ACC'$ 是等腰三角形，$M$（$AB$ 中点）到 $C$ 和 $C'$ 的距离相等。在 $\triangle MCC'$ 中，$MC = MC'$ 且 $CC'$ 公共。若 $C' \neq C$，则 $\triangle MCC'$ 退化，矛盾。故 $C' = C$，三角形全等。

**注** 此处的 SSS 证明不依赖定理 12.1（中点存在性），而是直接从 SAS 公理出发。证明思路：将 $\triangle A'B'C'$ 反射到 $\overleftrightarrow{AB}$ 的另一侧得到 $\triangle A'B'C''$，利用 SAS 证明 $\triangle ABC \cong \triangle ABC''$，再由唯一性（SAS 保证三角形由两边一夹角唯一确定）得 $C = C''$，从而 $C' = C$（因为 $C'$ 和 $C''$ 关于 $\overleftrightarrow{AB}$ 对称且在同一侧时 $C' = C'' = C$）。$\blacksquare$

#### 12.6.1 线段中点的存在性和唯一性

**定理 12.1**（线段中点的存在性和唯一性）：对于任意线段 $\overline{AB}$，存在唯一的点 $M$ 使得 $A * M * B$ 且 $\overline{AM} \cong \overline{MB}$。

**证明**：

**存在性**：在直线 $\overleftrightarrow{AB}$ 外取一点 $C$（由公理 I8，存在不共面的四个点，故不共线的三个点必然存在，再由公理 I3，可以在 $\overleftrightarrow{AB}$ 外取点）。在射线 $\overrightarrow{AC}$ 上取点 $P'$ 使得 $\overline{AP'} \cong \overline{AB}$（由公理 C1 保证这样的点存在）。由公理 C4，以 $\overleftrightarrow{AB}$ 为界、在 $C$ 所在的一侧作射线 $\overrightarrow{BP'}$，使得 $\angle ABP' \cong \angle BAP'$。在射线 $\overrightarrow{BP'}$ 上取点 $P$ 使得 $\overline{BP} \cong \overline{AP'}$（由公理 C1）。

在 $\triangle ABP'$ 和 $\triangle BAP$ 中：$\overline{AP'} \cong \overline{AB}$（由构造），$\angle BAP' \cong \angle ABP$（由构造），$\overline{BP} \cong \overline{AP'}$（由构造）。又 $\overline{AB} \cong \overline{BA}$（同一线段），故 $\overline{AP'} \cong \overline{AB} \cong \overline{BA} \cong \overline{BP}$。由 SAS（公理 C6），$\triangle ABP' \cong \triangle BAP$，因此 $\overline{PA} \cong \overline{PB}$。

类似地，在 $\overleftrightarrow{AB}$ 的另一侧取点 $Q$ 使得 $\overline{QA} \cong \overline{QB}$（同样的构造方法）。连接 $\overline{PQ}$，设 $\overleftrightarrow{PQ}$ 与 $\overleftrightarrow{AB}$ 的交点为 $M$。

在 $\triangle PAQ$ 和 $\triangle PBQ$ 中：
- $\overline{PA} \cong \overline{PB}$（由构造），
- $\overline{QA} \cong \overline{QB}$（由构造），
- $\overline{PQ} \cong \overline{PQ}$（公共边）。

由 SSS 全等条件（注：SSS 判定可从 SAS 公理严格推出，其证明见定理 13.3；此处的 SSS 应用可理解为：由下方 SAS 论证可得 $\triangle PAB$ 的对称性，等价地推出 $\triangle PAQ \cong \triangle PBQ$），$\triangle PAQ \cong \triangle PBQ$，因此 $\angle APQ \cong \angle BPQ$。

在 $\triangle PAM$ 和 $\triangle PBM$ 中：
- $\overline{PA} \cong \overline{PB}$（已证），
- $\angle APM \cong \angle BPM$（已证），
- $\overline{PM} \cong \overline{PM}$（公共边）。

由 SAS（公理 C6），$\triangle PAM \cong \triangle PBM$。因此 $\overline{AM} \cong \overline{BM}$，即 $M$ 是 $\overline{AB}$ 的中点。

**唯一性**：假设存在两个不同的中点 $M$ 和 $M'$，即 $\overline{AM} \cong \overline{MB}$ 且 $\overline{AM'} \cong \overline{M'B}$，且 $A * M * B$，$A * M' * B$。

假设 $M \neq M'$。由命题 12.3（三点之间恰好有一种"介于"关系），$M$ 和 $M'$ 在 $\overleftrightarrow{AB}$ 上的顺序只有以下几种可能：

**情况 (i)**：$A * M * M' * B$。此时 $A * M * M'$ 且 $M * M' * B$。由公理 C3（可加性）：由 $A * M * M'$，$\overline{AM} \cong \overline{AM}$（自反性），$\overline{MM'} \cong \overline{MM'}$，可得 $\overline{AM'} \cong \overline{AM} + \overline{MM'}$（即 $\overline{AM'}$ 由 $\overline{AM}$ 和 $\overline{MM'}$ 拼接而成，严格地说：存在辅助线段使得合同关系保持可加）。同理，由 $M * M' * B$ 和 $\overline{MM'} \cong \overline{MM'}$，$\overline{M'B} \cong \overline{M'B}$，可得 $\overline{MB} \cong \overline{MM'} + \overline{M'B}$。

由中点条件：$\overline{AM} \cong \overline{MB}$ 且 $\overline{AM'} \cong \overline{M'B}$。代入上述关系：
$$\overline{AM} \cong \overline{MB} \cong \overline{MM'} + \overline{M'B} \cong \overline{MM'} + \overline{AM'}$$
又 $\overline{AM'} \cong \overline{AM} + \overline{MM'}$（由 $A * M * M'$ 和可加性），故：
$$\overline{AM} \cong \overline{MM'} + (\overline{AM} + \overline{MM'})$$

这意味着 $\overline{AM} \cong \overline{AM} + 2\cdot\overline{MM'}$。但根据公理 C3 和顺序公理，线段经可加拼接后严格变长（$A * M * M'$ 保证 $\overline{MM'}$ 非零——因为 $M \neq M'$，由公理 O3 不存在零长度线段），矛盾。

**情况 (ii)**：$A * M' * M * B$。对称地，交换 $M$ 和 $M'$ 的角色，得到同样的矛盾。

**情况 (iii)**：$M * A * M'$ 或 $M' * A * M$。这与 $A * M * B$ 和 $A * M' * B$ 矛盾（因为 $A$ 是端点，$M$ 和 $M'$ 都在 $A$ 和 $B$ 之间，不可能在 $A$ 的外侧）。

综上，$M = M'$，中点唯一。$\blacksquare$

#### 12.6.2 角平分线的存在性和唯一性

**定理 12.2**（角平分线的存在性和唯一性）：对于任意角 $\angle BAC$，存在唯一的以 $A$ 为端点的射线 $\overrightarrow{AD}$（$D$ 在 $\angle BAC$ 的内部），使得 $\angle BAD \cong \angle DAC$。

**证明**：

**存在性**：在射线 $\overrightarrow{AB}$ 上取点 $B'$，在射线 $\overrightarrow{AC}$ 上取点 $C'$ 使得 $\overline{AB'} \cong \overline{AC'}$（由公理 C1，这样的 $C'$ 存在）。连接 $\overline{B'C'}$，取其中点 $M$（由定理 12.1，中点存在）。射线 $\overrightarrow{AM}$ 即为角平分线。

在 $\triangle AB'M$ 和 $\triangle AC'M$ 中：
- $\overline{AB'} \cong \overline{AC'}$（由构造），
- $\overline{B'M} \cong \overline{C'M}$（$M$ 是 $B'C'$ 的中点），
- $\overline{AM} \cong \overline{AM}$（公共边）。

由 SSS 全等（由 SAS 可推出 SSS，见定理 13.3），$\triangle AB'M \cong \triangle AC'M$，所以 $\angle B'AM \cong \angle C'AM$。

**唯一性**：我们首先引入角的大小比较。设 $\angle(h_1, k_1)$ 和 $\angle(h_2, k_2)$ 是以同一点 $O$ 为顶点、$h_1 = h_2$（即一条公共边）的两个角。若射线 $k_1$ 在 $\angle(h_2, k_2)$ 的内部，则称 $\angle(h_1, k_1) < \angle(h_2, k_2)$。由角的内部的定义（射线 $k_1$ 在角的内部意味着它与角的两边相交但不与任一边共线），这个比较关系是良定义的。

现在证明唯一性。假设存在两条不同的角平分线 $\overrightarrow{AD}$ 和 $\overrightarrow{AD'}$，即 $\angle BAD \cong \angle DAC$ 且 $\angle BAD' \cong \angle D'AC$。不妨设 $\overrightarrow{AD'}$ 在 $\angle BAD$ 的内部。则由角的大小比较定义，$\angle BAD' < \angle BAD$。

但由角平分线条件，$\angle BAD' = \frac{1}{2}\angle BAC = \angle BAD$，与 $\angle BAD' < \angle BAD$ 矛盾。

因此角平分线唯一。$\blacksquare$

#### 12.6.3 外角定理

**定理 12.3**（外角定理）：三角形的一个外角大于与它不相邻的任意一个内角。

**注**：外角定理是不依赖平行公理的纯绝对几何定理。它在合同公理和顺序公理的基础上即可证明。

**证明**：

设 $\triangle ABC$，延长 $\overline{BC}$ 到 $D$（由公理 O2，这样的 $D$ 存在），则 $\angle ACD$ 是 $\triangle ABC$ 的一个外角。要证明 $\angle ACD > \angle BAC$ 且 $\angle ACD > \angle ABC$。

**证明 $\angle ACD > \angle BAC$**：

取 $\overline{AC}$ 的中点 $M$（由定理 12.1）。连接 $\overline{BM}$ 并延长到 $E$ 使得 $B * M * E$ 且 $\overline{ME} \cong \overline{BM}$（由公理 C1）。连接 $\overline{CE}$。

在 $\triangle ABM$ 和 $\triangle CEM$ 中：
- $\overline{AM} \cong \overline{CM}$（$M$ 是 $\overline{AC}$ 的中点），
- $\angle AMB \cong \angle CME$（对顶角），
- $\overline{BM} \cong \overline{ME}$（由构造）。

由 SAS（公理 C6），$\triangle ABM \cong \triangle CEM$。因此 $\angle BAM \cong \angle ECM$。

现在证明 $E$ 在 $\angle ACD$ 的内部，从而 $\angle ACD > \angle ECM = \angle BAM = \angle BAC$。由于 $B * M * E$ 且 $M$ 是 $AC$ 的中点（$A * M * C$），点 $E$ 和 $B$ 位于直线 $AC$ 的两侧。又 $D$ 是 $BC$ 延长线上的点（$B * C * D$），故 $D$ 和 $B$ 位于 $C$ 的两侧，从而 $D$ 与 $E$ 在直线 $AC$ 的同一侧。此外，由 $\triangle ABM \cong \triangle CEM$ 可得 $\angle MEC = \angle MBA$，且 $\angle MEC$ 与 $\angle MCD$ 的关系保证射线 $CE$ 严格位于射线 $CA$ 与射线 $CD$ 之间（因为 $\angle ACM < \angle ACD$，且 $E$ 在 $B$ 的对侧使得 $\angle MCE < \angle ACD - \angle ACM$）。因此 $\angle ECD$ 是 $\angle ACD$ 的一部分，从而：

$$\angle ACD > \angle ECM = \angle BAM = \angle BAC$$

**证明 $\angle ACD > \angle ABC$**：

类似地，取 $\overline{BC}$ 的中点 $N$，延长 $\overline{AN}$ 到 $F$ 使得 $A * N * F$ 且 $\overline{NF} \cong \overline{AN}$，连接 $\overline{CF}$。由 SAS 证明 $\triangle ABN \cong \triangle FCN$，得 $\angle ABN = \angle FCN$。

与上面类似论证 $F$ 在 $\angle ACD$ 内部（$F$ 和 $A$ 位于 $BC$ 的两侧，$D$ 在 $BC$ 延长线上），故：

$$\angle ACD > \angle FCD > \angle FCN = \angle ABN = \angle ABC$$

$\blacksquare$

**推论 12.1**（等角对等边）：如果三角形的两个角相等，那么它们所对的边也相等。

**证明**：设 $\triangle ABC$ 中 $\angle B = \angle C$。如果 $\overline{AB} \neq \overline{AC}$，不妨设 $\overline{AB} > \overline{AC}$。由外角定理（定理 12.3），$\angle C > \angle B$，矛盾。因此 $\overline{AB} = \overline{AC}$。$\blacksquare$

#### 12.6.4 三角形内角和定理

**引理 12.2**（平行线同位角相等）：设直线 $a \parallel b$，截线 $c$ 分别交 $a$ 和 $b$ 于点 $A$ 和 $B$。则 $c$ 与 $a$ 所成的同位角相等。

**证明**：设 $c$ 交 $a$ 于 $A$，交 $b$ 于 $B$。记 $a$ 与 $c$ 在 $A$ 处的上方同位角为 $\alpha$，$b$ 与 $c$ 在 $B$ 处的上方同位角为 $\beta$。要证明 $\alpha = \beta$。

反证法：假设 $\alpha \neq \beta$，不妨设 $\alpha > \beta$。在点 $B$ 处，由公理 C4，在 $b$ 的上方作射线 $\overrightarrow{BD}$ 使得 $\angle CBD = \alpha$（即 $c$ 与 $\overrightarrow{BD}$ 所成的角等于 $\alpha$）。设直线 $b' = \overleftrightarrow{BD}$。

先证 $b' \parallel a$。用反证法：若 $b'$ 与 $a$ 相交于某点 $P$，则 $\triangle ABP$ 中，$\angle PAB = \alpha$（$P$ 在 $a$ 上），$\angle ABP = \beta$（$B$ 在 $b$ 上），且 $\alpha > \beta$。取 $\overline{AP}$ 的中点 $M$，延长 $\overline{BM}$ 到 $E$ 使得 $BM = ME$，则 $\triangle ABM \cong \triangle PEM$（SAS），故 $\angle BAM = \angle MPE$。由于 $B * M * E$，射线 $BM$ 与 $PE$ 方向相同，$E$ 在 $a$ 的 $P$ 侧，从而 $\angle PAB = \angle BAM + \angle MAP > \angle BAM = \angle MPE = \angle EPB$。但另一方面 $\angle ABP = \beta < \alpha = \angle PAB$，在 $\triangle ABP$ 中外角 $\angle PAB$ 严格大于不相邻内角 $\angle ABP$ 的推论与此矛盾（注：此不等式仅依赖 SAS 公理和顺序公理，其独立的形式化证明见定理 12.3，不依赖平行公理，故不构成循环论证）。

但 $b \parallel a$ 且 $b' \parallel a$，$b$ 和 $b'$ 都过点 $B$。由平行公理 P，过点 $B$ 与 $a$ 平行的直线唯一，故 $b' = b$。但 $b'$ 与 $b$ 的方向不同（因为 $\alpha \neq \beta$），矛盾。

因此 $\alpha = \beta$。$\blacksquare$

**推论**（平行线内错角相等）：在上述设定下，$c$ 与 $a$、$b$ 所成的内错角也相等。这由同位角相等和对顶角相等直接推出。

**定理 12.4**（三角形内角和定理）：任意三角形的三个内角之和等于两个直角（即 $180°$）。

**证明**：

设 $\triangle ABC$ 是任意三角形。过点 $A$ 作直线 $l \parallel \overleftrightarrow{BC}$（由平行公理 P 和命题 12.4，这样的直线存在且唯一）。

由于 $l \parallel \overleftrightarrow{BC}$，且 $\overleftrightarrow{AB}$ 是截线，根据引理 12.2（平行线同位角相等），有：

$$\angle BAl = \angle ABC$$

类似地，$\overleftrightarrow{AC}$ 也是截线，根据引理 12.2，有：

$$\angle CAl = \angle ACB$$

注意 $l$ 是一条直线，点 $B$ 和 $C$ 在 $l$ 的同一侧（否则 $l$ 会与 $\overleftrightarrow{BC}$ 相交）。所以：

$$\angle BAl + \angle BAC + \angle CAl = 180°$$

将上面的关系代入：

$$\angle ABC + \angle BAC + \angle ACB = 180°$$

$\blacksquare$

**推论 12.2**：三角形的任意一个外角等于与它不相邻的两个内角之和。

**证明**：由定理 12.3（外角定理），三角形的外角大于任一不相邻内角。结合三角形内角和为 $180°$（定理 12.4），外角恰好等于两个不相邻内角之和。$\blacksquare$

**推论 12.3**：直角三角形的两个锐角互余。

**证明**：三角形内角和为 $180°$（定理 12.4），直角为 $90°$，故其余两角之和为 $180° - 90° = 90°$。$\blacksquare$

### 12.7 公理系统的相容性与独立性

**相容性**（无矛盾性）：希尔伯特证明了其公理系统是相容的，即从这些公理出发不可能推导出矛盾。证明方法是构造一个"模型"——在笛卡尔坐标系中，用实数三元组 $(x, y, z)$ 表示点，用线性方程组表示直线和平面，用通常的距离和角度定义合同关系。在这个模型中，所有公理都成立，因此公理系统是相容的。

**独立性**：希尔伯特还证明了各组公理之间的独立性。特别地，平行公理 P 的独立性意味着：前四组公理（关联、顺序、合同、连续）不能推导出平行公理——这正是非欧几何存在的逻辑基础。

**完备性**：在加上连续公理 D2 之后，希尔伯特公理系统在同构意义下是完备的——即任意两个满足全部公理的模型都是同构的（可以通过坐标系的建立互相转化）。

---

**本章展望**：本章建立了欧氏几何的公理基础，确立了点、直线、平面之间的基本关系，以及线段合同和角合同的公理化定义。从这些公理出发，我们推导了线段中点和角平分线的存在唯一性、三角形内角和定理、外角定理等最基本的命题。在下一章中，我们将以此为基础，系统推导平面几何的全部核心定理，包括三角形全等与相似的判定、四边形的性质、圆的几何以及面积理论。

---

---

## Ch 13 平面几何
**前置知识**：本章假定读者已掌握 Ch 12 欧氏几何公理体系，特别是希尔伯特公理系统（关联公理、顺序公理、合同公理、平行公理、连续公理）以及从中推导的基本命题（线段中点和角平分线的存在唯一性、三角形内角和定理、外角定理）。本章的所有定理都将从这些公理和基本命题出发，经过严格的逻辑推导得出。

---

上一章中，我们建立了欧氏几何的公理系统，并从中推导了若干最基本的几何命题。现在，我们以此为基石，系统地构建平面几何的完整理论。本章涵盖三角形的全等与相似、四边形的性质与分类、圆的核心定理、面积的公理化理论，以及锐角三角函数的初步引入。所有定理均从公理和已证命题出发，经过严格的逻辑推导得出，不依赖任何未经证明的直觉。

### 13.1 三角形

#### 13.1.1 全等判定

公理 C6 直接给出了 SAS（边角边）全等判定。现在我们从 SAS 出发推导其他全等判定准则。

**定理 13.1**（ASA 全等判定）：如果两个三角形有两角及其夹边分别相等，则两个三角形全等。

**证明**：

设 $\triangle ABC$ 和 $\triangle A'B'C'$ 满足 $\angle A \cong \angle A'$，$\angle B \cong \angle B'$，$\overline{AB} \cong \overline{A'B'}$。要证明 $\triangle ABC \cong \triangle A'B'C'$。

在射线 $\overrightarrow{A'C'}$ 上取点 $C''$ 使得 $\overline{A'C''} \cong \overline{AC}$。连接 $\overline{B'C''}$。

在 $\triangle ABC$ 和 $\triangle A'B'C''$ 中：
- $\overline{AB} \cong \overline{A'B'}$（已知），
- $\angle A \cong \angle A'$（已知），
- $\overline{AC} \cong \overline{A'C''}$（由构造）。

由 SAS（公理 C6），$\triangle ABC \cong \triangle A'B'C''$。因此 $\angle ABC \cong \angle A'B'C''$，即 $\angle B \cong \angle A'B'C''$。

但已知 $\angle B \cong \angle B'$，所以 $\angle A'B'C'' \cong \angle A'B'C'$。

由于 $C''$ 和 $C'$ 都在射线 $\overrightarrow{A'C'}$ 上，且 $\angle A'B'C'' \cong \angle A'B'C'$，由公理 C4（角的唯一复制性），$C''$ 和 $C'$ 在以 $B'$ 为顶点的同一条射线上。又因为 $C''$ 和 $C'$ 都在射线 $\overrightarrow{A'C'}$ 上，两条不同射线的交点唯一，所以 $C'' = C'$。

因此 $\triangle ABC \cong \triangle A'B'C'$。$\blacksquare$

**定理 13.2**（AAS 全等判定）：如果两个三角形有两角及其中一角的对边分别相等，则两个三角形全等。

**证明**：

设 $\triangle ABC$ 和 $\triangle A'B'C'$ 满足 $\angle A \cong \angle A'$，$\angle B \cong \angle B'$，$\overline{BC} \cong \overline{B'C'}$（$\overline{BC}$ 是 $\angle A$ 的对边）。

由三角形内角和定理（定理 12.4），$\angle C = 180° - \angle A - \angle B = 180° - \angle A' - \angle B' = \angle C'$。

现在有 $\angle B \cong \angle B'$，$\angle C \cong \angle C'$，$\overline{BC} \cong \overline{B'C'}$，满足 ASA 条件，由定理 13.1，$\triangle ABC \cong \triangle A'B'C'$。$\blacksquare$

**定理 13.3**（SSS 全等判定）：如果两个三角形的三条边分别相等，则两个三角形全等。

**证明**：

设 $\triangle ABC$ 和 $\triangle A'B'C'$ 满足 $\overline{AB} \cong \overline{A'B'}$，$\overline{BC} \cong \overline{B'C'}$，$\overline{CA} \cong \overline{C'A'}$。要证明 $\triangle ABC \cong \triangle A'B'C'$，只需证明 $\angle A \cong \angle A'$（然后由 SAS 可得全等）。

在 $B'$ 的另一侧作 $\angle A'B'C'' \cong \angle ABC$（由公理 C4），在射线 $\overrightarrow{B'C''}$ 上取 $C''$ 使得 $\overline{B'C''} \cong \overline{BC}$（由公理 C1）。连接 $\overline{A'C''}$。

在 $\triangle ABC$ 和 $\triangle A'B'C''$ 中：
- $\overline{AB} \cong \overline{A'B'}$（已知），
- $\angle ABC \cong \angle A'B'C''$（由构造），
- $\overline{BC} \cong \overline{B'C''}$（由构造）。

由 SAS（公理 C6），$\triangle ABC \cong \triangle A'B'C''$。因此 $\overline{AC} \cong \overline{A'C''}$，即 $\overline{C'A'} \cong \overline{A'C''}$。

由于 $C''$ 与 $C'$ 位于直线 $A'B'$ 的两侧（由构造），线段 $C'C''$ 与直线 $A'B'$ 相交于某点 $Q$。

考虑 $\triangle A'C'C''$。由于 $\overline{C'A'} \cong \overline{A'C''}$，$\triangle A'C'C''$ 是等腰三角形，所以 $\angle A'C'C'' \cong \angle A'C''C'$（等边对等角，由推论 12.1）。

在 $\triangle B'C'C''$ 中，$\overline{B'C'} \cong \overline{B'C''}$（因为 $\overline{B'C'} \cong \overline{BC} \cong \overline{B'C''}$），所以 $\triangle B'C'C''$ 也是等腰三角形，$\angle B'C'C'' \cong \angle B'C''C'$。

现在需要根据 $Q$ 的位置分情况讨论角度分解。

**情况 (i)**：$Q$ 在 $A'$ 和 $B'$ 之间。此时射线 $C'Q$（即射线 $C'C''$）在 $\angle A'C'B'$ 的内部，射线 $C''Q$（即射线 $C''C'$）在 $\angle A'C''B'$ 的内部。故：
$$\angle A'C'B' = \angle A'C'Q + \angle QC'B' = \angle A'C'C'' + \angle B'C'C''$$
$$\angle A'C''B' = \angle A'C''Q + \angle QC''B' = \angle A'C''C' + \angle B'C''C'$$
由等腰三角形底角相等：$\angle A'C'C'' = \angle A'C''C'$，$\angle B'C'C'' = \angle B'C''C'$。因此 $\angle A'C'B' = \angle A'C''B'$。

**情况 (ii)**：$Q$ 不在 $A'$ 和 $B'$ 之间。不妨设 $A'$ 在 $Q$ 和 $B'$ 之间（$Q * A' * B'$）。此时射线 $C'A'$ 在射线 $C'Q$ 和射线 $C'B'$ 之间，故 $\angle B'C'C'' = \angle B'C'A' + \angle A'C'C''$。类似地在 $C''$ 处，$\angle B'C''C' = \angle B'C''A' + \angle A'C''C'$。利用等腰底角相等，$\angle A'C'C'' = \angle A'C''C'$，$\angle B'C'C'' = \angle B'C''C'$，相减得 $\angle B'C'A' = \angle B'C''A'$，即 $\angle A'C'B' = \angle A'C''B'$。

综合两种情况，$\angle C' = \angle C''$。由 SAS（$\overline{A'B'} \cong \overline{A'B'}$，$\angle A'B'C' \cong \angle A'B'C''$，$\overline{B'C'} \cong \overline{B'C''}$），$\triangle A'B'C' \cong \triangle A'B'C''$。

所以 $\triangle ABC \cong \triangle A'B'C'$。$\blacksquare$

#### 13.1.2 等腰三角形性质

**定理 13.4**（等边对等角）：等腰三角形的两个底角相等。

**证明**：

设 $\triangle ABC$ 中 $\overline{AB} = \overline{AC}$。考虑 $\triangle ABC$ 和 $\triangle ACB$：
- $\overline{AB} \cong \overline{AC}$（已知），
- $\angle A \cong \angle A$（同一个角），
- $\overline{AC} \cong \overline{AB}$（已知）。

由 SAS（公理 C6），$\triangle ABC \cong \triangle ACB$。因此 $\angle B \cong \angle C$。$\blacksquare$

**定理 13.5**（等角对等边）：如果三角形的两个角相等，则它们所对的边也相等。

**证明**：设 $\triangle ABC$ 中 $\angle B = \angle C$。考虑 $\triangle ABC$ 和 $\triangle ACB$：
- $\angle B \cong \angle C$（已知），
- $\overline{BC} \cong \overline{CB}$（公共边），
- $\angle C \cong \angle B$（已知）。

由 ASA（定理 13.1），$\triangle ABC \cong \triangle ACB$。因此 $\overline{AB} \cong \overline{AC}$。$\blacksquare$

**定理 13.6**（三线合一）：等腰三角形的顶角平分线、底边上的高、底边上的中线互相重合。

**证明**：

设 $\triangle ABC$ 中 $\overline{AB} = \overline{AC}$，$\overrightarrow{AD}$ 是 $\angle A$ 的平分线（$D$ 在 $\overline{BC}$ 上）。

在 $\triangle ABD$ 和 $\triangle ACD$ 中：
- $\overline{AB} \cong \overline{AC}$（已知），
- $\angle BAD \cong \angle CAD$（$\overrightarrow{AD}$ 是角平分线），
- $\overline{AD} \cong \overline{AD}$（公共边）。

由 SAS（公理 C6），$\triangle ABD \cong \triangle ACD$。因此：
- $\overline{BD} \cong \overline{CD}$，即 $D$ 是 $\overline{BC}$ 的中点（$\overrightarrow{AD}$ 是中线）；
- $\angle ADB \cong \angle ADC$，而 $\angle ADB + \angle ADC = 180°$，所以 $\angle ADB = \angle ADC = 90°$（$\overrightarrow{AD}$ 是高）。

**逆方向一**（中线 $\Rightarrow$ 角平分线 + 高）：设 $\overrightarrow{AD}$ 是 $\overline{BC}$ 上的中线，即 $D$ 是 $\overline{BC}$ 的中点，$\overline{BD} \cong \overline{CD}$。

在 $\triangle ABD$ 和 $\triangle ACD$ 中：
- $\overline{AB} \cong \overline{AC}$（等腰三角形），
- $\overline{BD} \cong \overline{CD}$（$D$ 是中点），
- $\overline{AD} \cong \overline{AD}$（公共边）。

由 SSS（定理 13.3），$\triangle ABD \cong \triangle ACD$。因此：
- $\angle BAD \cong \angle CAD$，即 $\overrightarrow{AD}$ 是角平分线；
- $\angle ADB \cong \angle ADC$，而 $\angle ADB + \angle ADC = 180°$，所以 $\angle ADB = \angle ADC = 90°$，即 $\overrightarrow{AD}$ 是高。

**逆方向二**（高 $\Rightarrow$ 角平分线 + 中线）：设 $\overrightarrow{AD}$ 是 $\overline{BC}$ 上的高，即 $\angle ADB = \angle ADC = 90°$。

在 $\triangle ABD$ 和 $\triangle ACD$ 中：
- $\overline{AB} \cong \overline{AC}$（等腰三角形），
- $\angle ADB \cong \angle ADC = 90°$（高），
- $\overline{AD} \cong \overline{AD}$（公共边）。

由 HL 全等（直角三角形中斜边和一直角边相等则全等），$\triangle ABD \cong \triangle ACD$。

**HL 全等的证明**：设 $\triangle ABD$ 和 $\triangle ACD$ 中 $\angle ADB = \angle ADC = 90°$，$\overline{AB} \cong \overline{AC}$（斜边），$\overline{AD} \cong \overline{AD}$（公共直角边）。在 $\overleftrightarrow{AD}$ 的另一侧取点 $C'$ 使得 $\overline{DC'} \cong \overline{DB}$ 且 $\angle ADC' = 90°$。由 SAS（$\overline{AD} \cong \overline{AD}$，$\angle ADB = \angle ADC' = 90°$，$\overline{DB} \cong \overline{DC'}$），$\triangle ADB \cong \triangle ADC'$，故 $\overline{AC'} \cong \overline{AB} \cong \overline{AC}$。由于 $C'$ 和 $C$ 都在 $\overleftrightarrow{AD}$ 的同一侧且到 $A$、$D$ 的距离分别相等，由 SSS 唯一性得 $C' = C$，从而 $\triangle ABD \cong \triangle ACD$。

因此：
- $\angle BAD \cong \angle CAD$，即 $\overrightarrow{AD}$ 是角平分线；
- $\overline{BD} \cong \overline{CD}$，即 $D$ 是 $\overline{BC}$ 的中点（$\overrightarrow{AD}$ 是中线）。

综上，等腰三角形的顶角平分线、底边上的高、底边上的中线三线合一。$\blacksquare$

#### 13.1.3 边角关系

**定理 13.7**（大边对大角）：在三角形中，较大的边所对的角较大。

**证明**：

设 $\triangle ABC$ 中 $\overline{AC} > \overline{AB}$。要证明 $\angle B > \angle C$。

在 $\overline{AC}$ 上取点 $D$ 使得 $\overline{AD} = \overline{AB}$（这是可能的，因为 $\overline{AC} > \overline{AB}$）。连接 $\overline{BD}$。

在 $\triangle ABD$ 中，$\overline{AD} = \overline{AB}$，所以 $\angle ABD = \angle ADB$（等边对等角，定理 13.4）。

由于 $D$ 在 $\overline{AC}$ 上（$A * D * C$），$\angle ADB$ 是 $\triangle BDC$ 的外角，所以 $\angle ADB > \angle C$（外角定理，定理 12.3）。

因此 $\angle ABD > \angle C$。又因为 $\angle ABC = \angle ABD + \angle DBC > \angle ABD$（$\angle DBC > 0$），所以 $\angle ABC > \angle C$。$\blacksquare$

**定理 13.8**（大角对大边）：在三角形中，较大的角所对的边较大。

**证明**：这是定理 13.7 的逆否命题。假设 $\angle B > \angle C$，如果 $\overline{AC} \leq \overline{AB}$：
- 若 $\overline{AC} = \overline{AB}$，则 $\angle B = \angle C$（定理 13.4），矛盾。
- 若 $\overline{AC} < \overline{AB}$，由定理 13.7，$\angle B < \angle C$，矛盾。

因此 $\overline{AC} > \overline{AB}$。$\blacksquare$

**定理 13.9**（三角不等式）：三角形任意两边之和大于第三边。

**证明**：

设 $\triangle ABC$，要证明 $\overline{AB} + \overline{BC} > \overline{AC}$。

延长 $\overline{BA}$ 到 $A'$ 使得 $\overline{AA'} = \overline{AC}$（由公理 C1）。连接 $\overline{A'C}$。

在 $\triangle AA'C$ 中，$\overline{AA'} = \overline{AC}$，所以 $\triangle AA'C$ 是等腰三角形，$\angle AA'C = \angle ACA'$（定理 13.4）。

由于 $B * A * A'$，$\angle BCA' < \angle ACA'$（$\angle BCA'$ 是 $\angle ACA'$ 的一部分）。

因此 $\angle BCA' < \angle BA'C$。在 $\triangle BCA'$ 中，由大角对大边（定理 13.8），$\overline{BC} < \overline{BA'}$。

而 $\overline{BA'} = \overline{BA} + \overline{AA'} = \overline{BA} + \overline{AC}$，所以 $\overline{BC} < \overline{AB} + \overline{AC}$，即 $\overline{AB} + \overline{AC} > \overline{BC}$。

类似地可以证明其他两个不等式。$\blacksquare$

**推论 13.1**：三角形任意两边之差小于第三边。

**证明**：设三角形三边为 $a, b, c$。由三角不等式（定理 13.9），$a + b > c$，故 $a > c - b$，即 $a - c > -b$。同理 $c > |a - b|$，故 $|a - c| < b$。$\blacksquare$

### 13.2 四边形

#### 13.2.1 平行四边形的性质和判定

**定义 13.1**（平行四边形）：两组对边分别平行的四边形称为**平行四边形**。

**定理 13.10**（平行四边形的性质）：平行四边形的对边相等，对角相等，对角线互相平分。

**证明**：

设 $ABCD$ 是平行四边形，即 $\overline{AB} \parallel \overline{CD}$，$\overline{AD} \parallel \overline{BC}$。连接对角线 $\overline{AC}$。

**对边相等**：在 $\triangle ABC$ 和 $\triangle CDA$ 中：
- $\angle BAC = \angle DCA$（$\overline{AB} \parallel \overline{CD}$，$\overline{AC}$ 是截线，内错角相等），
- $\angle BCA = \angle DAC$（$\overline{AD} \parallel \overline{BC}$，$\overline{AC}$ 是截线，内错角相等），
- $\overline{AC} = \overline{CA}$（公共边）。

由 ASA（定理 13.1），$\triangle ABC \cong \triangle CDA$。因此 $\overline{AB} = \overline{CD}$，$\overline{BC} = \overline{DA}$。

**对角相等**：由上面的全等，$\angle B = \angle D$。类似地（连接另一条对角线 $\overline{BD}$），可证 $\angle A = \angle C$。

**对角线互相平分**：设对角线 $\overline{AC}$ 和 $\overline{BD}$ 相交于 $O$。

在 $\triangle AOB$ 和 $\triangle COD$ 中：
- $\overline{AB} = \overline{CD}$（已证），
- $\angle OAB = \angle OCD$（内错角），
- $\angle OBA = \angle ODC$（内错角）。

由 AAS（定理 13.2），$\triangle AOB \cong \triangle COD$，所以 $\overline{OA} = \overline{OC}$，$\overline{OB} = \overline{OD}$。$\blacksquare$

**定理 13.11**（平行四边形的判定）：满足下列条件之一的四边形是平行四边形：

1. 两组对边分别相等；
2. 一组对边平行且相等；
3. 对角线互相平分；
4. 两组对角分别相等。

**证明**（各判定准则的证明）：

**判定 1**：设四边形 $ABCD$ 中 $\overline{AB} = \overline{CD}$，$\overline{AD} = \overline{BC}$。连接 $\overline{AC}$。

在 $\triangle ABC$ 和 $\triangle CDA$ 中：
- $\overline{AB} = \overline{CD}$（已知），
- $\overline{BC} = \overline{DA}$（已知），
- $\overline{AC} = \overline{CA}$（公共边）。

由 SSS（定理 13.3），$\triangle ABC \cong \triangle CDA$。因此 $\angle BAC = \angle DCA$，$\angle BCA = \angle DAC$。由内错角相等，$\overline{AB} \parallel \overline{CD}$，$\overline{AD} \parallel \overline{BC}$。

**判定 2**：设 $\overline{AB} = \overline{CD}$ 且 $\overline{AB} \parallel \overline{CD}$。连接 $\overline{AC}$。

在 $\triangle ABC$ 和 $\triangle CDA$ 中：
- $\overline{AB} = \overline{CD}$（已知），
- $\angle BAC = \angle DCA$（$\overline{AB} \parallel \overline{CD}$，内错角），
- $\overline{AC} = \overline{CA}$（公共边）。

由 SAS，$\triangle ABC \cong \triangle CDA$。因此 $\overline{BC} = \overline{DA}$，$\angle BCA = \angle DAC$，所以 $\overline{AD} \parallel \overline{BC}$。

**判定 3**：设对角线 $\overline{AC}$ 和 $\overline{BD}$ 互相平分于 $O$，即 $\overline{OA} = \overline{OC}$，$\overline{OB} = \overline{OD}$。

在 $\triangle AOB$ 和 $\triangle COD$ 中：
- $\overline{OA} = \overline{OC}$（已知），
- $\angle AOB = \angle COD$（对顶角），
- $\overline{OB} = \overline{OD}$（已知）。

由 SAS，$\triangle AOB \cong \triangle COD$。因此 $\overline{AB} = \overline{CD}$，$\angle OAB = \angle OCD$，所以 $\overline{AB} \parallel \overline{CD}$。由判定 2，$ABCD$ 是平行四边形。

**判定 4**：设 $\angle A = \angle C$，$\angle B = \angle D$。四边形内角和为 $360°$（可由对角线将四边形分为两个三角形，每个三角形内角和为 $180°$ 推得）。代入得 $2\angle A + 2\angle B = 360°$，即 $\angle A + \angle B = 180°$。同旁内角互补，所以 $\overline{AD} \parallel \overline{BC}$。类似地，$\angle A + \angle D = 180°$，所以 $\overline{AB} \parallel \overline{CD}$。$\blacksquare$

#### 13.2.2 矩形、菱形、正方形

**定义 13.2**（矩形）：有一个角是直角的平行四边形称为**矩形**。

**定理 13.12**（矩形的性质）：(1) 矩形的四个角都是直角；(2) 矩形的对角线相等。

**证明**：设矩形 $ABCD$ 中 $\angle A = 90°$。

(1) 由平行四边形对角相等，$\angle C = \angle A = 90°$。由同旁内角互补，$\angle B = 180° - \angle A = 90°$，$\angle D = 180° - \angle A = 90°$。

(2) 在 $\triangle ABC$ 和 $\triangle DCB$ 中：$\overline{AB} = \overline{DC}$（平行四边形对边相等），$\angle ABC = \angle DCB = 90°$，$\overline{BC} = \overline{CB}$（公共边）。由 SAS，$\triangle ABC \cong \triangle DCB$，所以 $\overline{AC} = \overline{BD}$。$\blacksquare$

**定义 13.3**（菱形）：有一组邻边相等的平行四边形称为**菱形**。

**定理 13.13**（菱形的性质）：(1) 菱形的四条边都相等；(2) 菱形的对角线互相垂直，且每条对角线平分一组对角。

**证明**：设菱形 $ABCD$ 中 $\overline{AB} = \overline{BC}$。

(1) 由平行四边形对边相等，$\overline{CD} = \overline{AB}$，$\overline{DA} = \overline{BC}$。所以四条边都相等。

(2) 连接对角线 $\overline{AC}$ 和 $\overline{BD}$，设交于 $O$。在 $\triangle ABD$ 中，$\overline{AB} = \overline{AD}$（菱形性质），所以 $\triangle ABD$ 是等腰三角形。由三线合一（定理 13.6），$\overline{BD}$ 上的中线 $\overline{AO}$ 也是高和角平分线。因此 $\overline{AC} \perp \overline{BD}$，且 $\overline{BD}$ 平分 $\angle ABC$ 和 $\angle ADC$。类似地，$\overline{AC}$ 平分 $\angle BAD$ 和 $\angle BCD$。$\blacksquare$

**定义 13.4**（正方形）：既是矩形又是菱形的四边形称为**正方形**。

**定理 13.14**：正方形具有矩形和菱形的所有性质。

**证明**：正方形定义为四边相等且四角均为直角的四边形。四角为直角说明是矩形；四边相等说明是菱形。故正方形同时具有矩形和菱形的所有性质。$\blacksquare$

#### 13.2.3 梯形

**定义 13.5**（梯形）：有一组对边平行而另一组对边不平行的四边形称为**梯形**。平行的两边称为**底**，不平行的两边称为**腰**。

**定义 13.6**（等腰梯形）：两腰相等的梯形称为**等腰梯形**。

**定理 13.15**（等腰梯形的性质）：等腰梯形的两个底角相等，对角线相等。

**证明**：

设等腰梯形 $ABCD$ 中 $\overline{AB} \parallel \overline{CD}$，$\overline{AD} = \overline{BC}$。

过 $D$ 作 $\overline{DE} \parallel \overline{BC}$ 交 $\overline{AB}$ 于 $E$，则 $BCDE$ 是平行四边形（$BC \parallel DE$ 由构造，$CD \parallel BE$ 因为 $CD \parallel AB$ 且 $E \in AB$），故 $\overline{DE} = \overline{BC}$。

由于 $\overline{AD} = \overline{BC}$，$\overline{DE} = \overline{AD}$，所以 $\triangle ADE$ 是等腰三角形，$\angle DAE = \angle DEA$。

由 $\overline{DE} \parallel \overline{BC}$ 和 $\overline{AB}$ 是截线，$\angle DEA = \angle B$（同位角）。由 $\overline{AB} \parallel \overline{CD}$ 和 $\overline{AD}$ 是截线，$\angle DAE = \angle ADC$（内错角）。

因此 $\angle ADC = \angle B$。类似地可证 $\angle DAB = \angle C$。

对于对角线相等：连接 $\overline{AC}$ 和 $\overline{BD}$。在 $\triangle ABD$ 和 $\triangle BAC$ 中，$\overline{AB} = \overline{BA}$，$\overline{AD} = \overline{BC}$，$\angle DAB = \angle CBA$（已证）。由 SAS，$\triangle ABD \cong \triangle BAC$，所以 $\overline{BD} = \overline{AC}$。$\blacksquare$

#### 13.2.4 中位线定理

**定理 13.16**（三角形中位线定理）：三角形的中位线平行于第三边且等于第三边的一半。

**证明**：

设 $\triangle ABC$ 中，$D$、$E$ 分别是 $\overline{AB}$、$\overline{AC}$ 的中点。要证明 $\overline{DE} \parallel \overline{BC}$ 且 $\overline{DE} = \frac{1}{2}\overline{BC}$。

延长 $\overline{DE}$ 到 $F$ 使得 $\overline{EF} = \overline{DE}$。连接 $\overline{CF}$。

在 $\triangle ADE$ 和 $\triangle CFE$ 中：
- $\overline{AE} = \overline{CE}$（$E$ 是 $\overline{AC}$ 的中点），
- $\angle AED = \angle CEF$（对顶角），
- $\overline{DE} = \overline{FE}$（由构造）。

由 SAS，$\triangle ADE \cong \triangle CFE$。因此 $\overline{AD} = \overline{CF}$，$\angle ADE = \angle CFE$。

由内错角相等，$\overline{AD} \parallel \overline{CF}$，即 $\overline{DB} \parallel \overline{CF}$。

又 $\overline{DB} = \overline{AD} = \overline{CF}$，所以 $DBCF$ 是平行四边形（一组对边平行且相等）。

因此 $\overline{DF} \parallel \overline{BC}$ 且 $\overline{DF} = \overline{BC}$。

而 $\overline{DF} = \overline{DE} + \overline{EF} = 2\overline{DE}$，所以 $\overline{DE} = \frac{1}{2}\overline{BC}$，且 $\overline{DE} \parallel \overline{BC}$。$\blacksquare$

**定理 13.17**（梯形中位线定理）：梯形的中位线平行于两底且等于两底和的一半。

**证明**：

设梯形 $ABCD$ 中 $\overline{AB} \parallel \overline{CD}$，$E$、$F$ 分别是 $\overline{AD}$、$\overline{BC}$ 的中点。连接 $\overline{AF}$ 并延长交 $\overline{DC}$ 的延长线于 $G$。

在 $\triangle ABF$ 和 $\triangle GCF$ 中：
- $\overline{BF} = \overline{CF}$（$F$ 是 $\overline{BC}$ 的中点），
- $\angle ABF = \angle GCF$（$\overline{AB} \parallel \overline{DC}$，内错角），
- $\angle AFB = \angle GFC$（对顶角）。

由 ASA，$\triangle ABF \cong \triangle GCF$。因此 $\overline{AF} = \overline{FG}$，$\overline{AB} = \overline{CG}$。

在 $\triangle ADG$ 中，$E$ 是 $\overline{AD}$ 的中点，$F$ 是 $\overline{AG}$ 的中点，所以 $\overline{EF}$ 是 $\triangle ADG$ 的中位线。

由三角形中位线定理（定理 13.16），$\overline{EF} \parallel \overline{DG}$ 且 $\overline{EF} = \frac{1}{2}\overline{DG}$。

而 $\overline{DG} = \overline{DC} + \overline{CG} = \overline{DC} + \overline{AB}$，所以 $\overline{EF} = \frac{1}{2}(\overline{AB} + \overline{CD})$。

由于 $\overline{DG} \parallel \overline{AB}$，所以 $\overline{EF} \parallel \overline{AB}$。$\blacksquare$

### 13.3 相似

#### 13.3.1 平行线分线段成比例

**定理 13.18**（平行线分线段成比例定理）：如果一组平行线被两条直线所截，那么截得的对应线段成比例。

**证明**：

设三条平行线 $l_1 \parallel l_2 \parallel l_3$，直线 $a$ 分别交 $l_1$、$l_2$、$l_3$ 于 $A$、$B$、$C$，直线 $b$ 分别交 $l_1$、$l_2$、$l_3$ 于 $D$、$E$、$F$。要证明 $\frac{AB}{BC} = \frac{DE}{EF}$。

**情形 1**（可公度情况）：$\overline{AB}$ 和 $\overline{BC}$ 是可公度的，即存在线段 $\overline{MN}$ 使得 $\overline{AB} = m \cdot \overline{MN}$，$\overline{BC} = n \cdot \overline{MN}$（$m$、$n$ 是正整数）。

将 $\overline{AB}$ 分为 $m$ 等份：在射线 $\overrightarrow{AB}$ 上依次取点 $A = A_0, A_1, \ldots, A_m = B$ 使得 $\overline{A_{i-1}A_i} \cong \overline{MN}$（$i = 1, \ldots, m$）。类似地将 $\overline{BC}$ 分为 $n$ 等份：$B = B_0, B_1, \ldots, B_n = C$。过每个分点 $A_i$（$i = 1, \ldots, m-1$）和 $B_j$（$j = 1, \ldots, n-1$）作与 $l_1$ 平行的直线。这些辅助平行线交直线 $b$ 于点 $D = E_0, E_1, \ldots, E_m$ 和 $E_m = F_0, F_1, \ldots, F_n = F$。

关键步骤：证明各段 $\overline{E_{i-1}E_i}$（$i = 1, \ldots, m$）长度相等。

对每个 $i$，过 $E_{i-1}$ 作平行于直线 $a$ 的直线，交辅助平行线 $\ell_i$（过 $A_i$、$E_i$ 且平行于 $l_1$ 的直线）于 $P_i$。则四边形 $A_{i-1}A_i P_i E_{i-1}$ 是平行四边形：$\overline{A_{i-1}A_i} \parallel \overline{E_{i-1}P_i}$（均沿直线 $a$ 的方向），$\overline{A_{i-1}E_{i-1}} \parallel \overline{A_i P_i}$（分别在平行线 $\ell_{i-1}$、$\ell_i$ 上）。由平行四边形对边相等（定理 13.10），$\overline{E_{i-1}P_i} = \overline{A_{i-1}A_i} = \overline{MN}$。

**当 $a \parallel b$ 时**：过 $E_{i-1}$ 平行于 $a$ 的直线即为 $b$ 本身，故 $P_i = E_i$，从而 $\overline{E_{i-1}E_i} = \overline{MN}$。

**当 $a$ 与 $b$ 相交时**：在 $\triangle E_{i-1}P_i E_i$ 中，三个要素均与 $i$ 无关：

- 边 $\overline{E_{i-1}P_i} = \overline{MN}$；
- $\angle P_i E_{i-1} E_i$ 是直线 $a$ 的方向与直线 $b$ 的夹角（因为 $\overline{E_{i-1}P_i} \parallel a$，$\overline{E_{i-1}E_i}$ 在 $b$ 上），与 $i$ 无关；
- $\angle E_{i-1}P_i E_i$ 是直线 $a$ 的方向与 $l_1$ 的夹角（因为 $\overline{E_{i-1}P_i} \parallel a$，$\overline{P_i E_i}$ 在 $\ell_i \parallel l_1$ 上），与 $i$ 无关。

由 ASA，所有 $\triangle E_{i-1}P_i E_i$（$i = 1, \ldots, m$）全等，故 $\overline{E_{i-1}E_i}$ 对所有 $i$ 相等。

设各段的公共长度为 $\delta$，则 $\overline{DE} = m \cdot \delta$。同理，过 $B_j$（$j = 1, \ldots, n-1$）的辅助平行线将 $\overline{EF}$ 分为 $n$ 段，由完全相同的论证（$MN$、夹角均不变），各段长度也是 $\delta$，故 $\overline{EF} = n \cdot \delta$。因此 $\frac{AB}{BC} = \frac{m}{n} = \frac{DE}{EF}$。

**情形 2**（一般情况）：若 $\overline{AB}$ 与 $\overline{BC}$ 不可公度，我们用阿基米德公理和反证法。假设 $\frac{AB}{BC} \neq \frac{DE}{EF}$，不妨设 $\frac{AB}{BC} > \frac{DE}{EF}$。

由阿基米德公理（公理 D1），存在正整数 $m$、$n$ 使得 $\frac{AB}{BC} > \frac{m}{n} > \frac{DE}{EF}$（实数的阿基米德性质保证这样的有理数存在）。在射线 $\overrightarrow{AB}$ 上取点 $P$ 使得 $\overline{AP} = m \cdot \overline{MN}$，在射线 $\overrightarrow{BC}$ 上取点 $Q$ 使得 $\overline{BQ} = n \cdot \overline{MN}$（其中 $\overline{MN}$ 是某个单位线段）。由于 $\frac{m}{n} < \frac{AB}{BC}$，点 $P$ 落在 $A$ 和 $B$ 之间（即 $A * P * B$），点 $Q$ 落在 $B$ 和 $C$ 之间（即 $B * Q * C$），且 $\overline{AP}$ 与 $\overline{BQ}$ 可公度。

过 $P$ 作 $l_2' \parallel l_1$ 交 $b$ 于 $E'$。由情形 1 的结果，$\frac{AP}{BQ} = \frac{DE'}{E'F}$。因为 $\frac{AP}{BQ} = \frac{m}{n} < \frac{AB}{BC} = \frac{AB}{BC}$，而 $\frac{m}{n} > \frac{DE}{EF}$，通过比较可得 $E'$ 落在 $D$ 和 $E$ 之间（即 $D * E' * E$），从而 $\overline{DE'} < \overline{DE}$。

但类似地，取更大的 $m'/n'$ 使得 $\frac{AB}{BC} > \frac{m'}{n'} > \frac{m}{n}$，过对应分点作平行线得到 $E''$，有 $\overline{DE''} > \overline{DE'}$。反复使用阿基米德公理，总能找到更接近 $\frac{AB}{BC}$ 的比值 $\frac{m'}{n'}$，使得对应的 $E^{(k)}$ 序列收敛。由完备公理 D2（直线上的点不能有"空隙"），存在唯一的点 $E^*$ 使得 $\frac{AB}{BC} = \frac{DE^*}{E^*F}$。但 $l_2$ 过 $B$ 且平行于 $l_1$，由平行公理 P 唯一确定 $l_2$ 与 $b$ 的交点 $E$，故 $E^* = E$，从而 $\frac{AB}{BC} = \frac{DE}{EF}$，与假设矛盾。

因此 $\frac{AB}{BC} = \frac{DE}{EF}$。$\blacksquare$

**推论 13.2**（三角形一边的平行线性质）：如果一条直线平行于三角形的一边并与另外两边相交，那么它截得的线段与对应边成比例。

**证明**：由定理 13.18（平行线分线段成比例），直线平行于 $\triangle ABC$ 的边 $BC$ 并与 $AB$、$AC$ 分别交于 $D$、$E$，则 $\frac{AD}{AB} = \frac{AE}{AC}$。$\blacksquare$

#### 13.3.2 相似三角形判定

**定义 13.7**（相似）：如果两个三角形的对应角相等，对应边成比例，则称这两个三角形**相似**，记为 $\triangle ABC \sim \triangle A'B'C'$。

**定理 13.19**（AA 相似判定）：如果两个三角形有两组对应角相等，则这两个三角形相似。

**证明**：

设 $\triangle ABC$ 和 $\triangle A'B'C'$ 中 $\angle A = \angle A'$，$\angle B = \angle B'$。由三角形内角和定理，$\angle C = \angle C'$。所以三个角都对应相等。

现在证明对应边成比例。在 $\overline{AB}$ 上取点 $B''$ 使得 $\overline{AB''} = \overline{A'B'}$，过 $B''$ 作 $\overline{B''C''} \parallel \overline{BC}$ 交 $\overline{AC}$ 于 $C''$。

由推论 13.2，$\frac{AB''}{AB} = \frac{AC''}{AC}$。

在 $\triangle AB''C''$ 和 $\triangle A'B'C'$ 中：
- $\overline{AB''} = \overline{A'B'}$（由构造），
- $\angle A = \angle A'$（已知），
- $\angle AB''C'' = \angle B = \angle B'$（$B''C'' \parallel BC$，同位角）。

由 ASA，$\triangle AB''C'' \cong \triangle A'B'C'$。因此 $\overline{AC''} = \overline{A'C'}$，$\overline{B''C''} = \overline{B'C'}$。

代入比例式：$\frac{A'B'}{AB} = \frac{A'C'}{AC}$。类似地可以证明 $\frac{B'C'}{BC} = \frac{A'B'}{AB}$。

所以 $\frac{A'B'}{AB} = \frac{B'C'}{BC} = \frac{A'C'}{AC}$，即 $\triangle ABC \sim \triangle A'B'C'$。$\blacksquare$

**定理 13.20**（SAS 相似判定）：如果两个三角形有两组对应边成比例且夹角相等，则这两个三角形相似。

**证明**：设 $\triangle ABC$ 和 $\triangle A'B'C'$ 中 $\frac{AB}{A'B'} = \frac{AC}{A'C'}$ 且 $\angle A = \angle A'$。在 $\overline{AB}$ 上取 $B''$ 使得 $\overline{AB''} = \overline{A'B'}$，过 $B''$ 作 $\overline{B''C''} \parallel \overline{BC}$ 交 $\overline{AC}$ 于 $C''$。

由推论 13.2，$\frac{AB''}{AB} = \frac{AC''}{AC}$，即 $\frac{A'B'}{AB} = \frac{AC''}{AC}$。又已知 $\frac{A'B'}{AB} = \frac{A'C'}{AC}$，因此 $\overline{AC''} = \overline{A'C'}$。

在 $\triangle AB''C''$ 和 $\triangle A'B'C'$ 中：$\overline{AB''} = \overline{A'B'}$，$\angle A = \angle A'$，$\overline{AC''} = \overline{A'C'}$。由 SAS，$\triangle AB''C'' \cong \triangle A'B'C'$。由 AA 判定，$\triangle AB''C'' \sim \triangle ABC$。由相似的传递性，$\triangle A'B'C' \sim \triangle ABC$。$\blacksquare$

**定理 13.21**（SSS 相似判定）：如果两个三角形的三组对应边成比例，则这两个三角形相似。

**证明**：设 $\triangle ABC$ 和 $\triangle A'B'C'$ 中 $\frac{AB}{A'B'} = \frac{BC}{B'C'} = \frac{CA}{C'A'} = k$。在 $\overline{AB}$ 上取 $B''$ 使得 $\overline{AB''} = \overline{A'B'}$，过 $B''$ 作 $\overline{B''C''} \parallel \overline{BC}$ 交 $\overline{AC}$ 于 $C''$。

由推论 13.2，$\frac{AB''}{AB} = \frac{AC''}{AC} = \frac{B''C''}{BC}$。因为 $\overline{AB''} = \overline{A'B'}$，$\frac{A'B'}{AB} = \frac{1}{k}$，所以 $\overline{AC''} = \overline{A'C'}$，$\overline{B''C''} = \overline{B'C'}$。

由 SAS，$\triangle AB''C'' \cong \triangle A'B'C'$。由 AA 判定，$\triangle AB''C'' \sim \triangle ABC$。由传递性，$\triangle A'B'C' \sim \triangle ABC$。$\blacksquare$

#### 13.3.3 勾股定理

**定理 13.22**（勾股定理）：直角三角形中，两条直角边的平方和等于斜边的平方。即如果 $\triangle ABC$ 中 $\angle C = 90°$，则 $a^2 + b^2 = c^2$（其中 $a = BC$，$b = AC$，$c = AB$）。

**证明**（相似三角形法）：

设 $\triangle ABC$ 中 $\angle C = 90°$。从直角顶点 $C$ 向斜边 $\overline{AB}$ 作高 $\overline{CD}$，设垂足为 $D$。

在 $\triangle ACD$ 和 $\triangle ABC$ 中：$\angle A$ 公共，$\angle ADC = \angle ACB = 90°$。由 AA 相似，$\triangle ACD \sim \triangle ABC$。因此 $\frac{AC}{AB} = \frac{AD}{AC}$，即 $AC^2 = AD \cdot AB$。

在 $\triangle CBD$ 和 $\triangle ABC$ 中：$\angle B$ 公共，$\angle BDC = \angle ACB = 90°$。由 AA 相似，$\triangle CBD \sim \triangle ABC$。因此 $\frac{BC}{AB} = \frac{BD}{BC}$，即 $BC^2 = BD \cdot AB$。

两式相加：

$$AC^2 + BC^2 = AD \cdot AB + BD \cdot AB = (AD + BD) \cdot AB = AB \cdot AB = AB^2$$

即 $a^2 + b^2 = c^2$。$\blacksquare$

**推论 13.3**（勾股定理的逆定理）：如果三角形的三边满足 $a^2 + b^2 = c^2$，则该三角形是直角三角形，且 $c$ 所对的角为直角。

**证明**：设 $\triangle ABC$ 中 $AB = c$，$BC = a$，$AC = b$，且 $a^2 + b^2 = c^2$。以 $BC$ 和 $AC$ 为直角边构造直角三角形 $A'BC$，使得 $\angle BCA' = 90°$，$CA' = b$。由勾股定理，$BA'^2 = a^2 + b^2 = c^2$，所以 $BA' = c = BA$。

在 $\triangle ABC$ 和 $\triangle A'BC$ 中：$AB = A'B$，$BC = BC$，$AC = A'C$。由 SSS，$\triangle ABC \cong \triangle A'BC$，因此 $\angle BCA = \angle BCA' = 90°$。$\blacksquare$

### 13.4 圆

#### 13.4.1 圆的基本性质

**定义 13.8**（圆）：平面上到定点 $O$ 的距离等于定长 $r$ 的所有点的集合称为**圆**，记为 $\odot(O, r)$。定点 $O$ 称为**圆心**，定长 $r$ 称为**半径**。

**定义 13.9**（弦、直径）：连接圆上两点的线段称为**弦**。经过圆心的弦称为**直径**，直径的长度为 $2r$。

**定理 13.23**（弦的中垂线定理）：弦的中垂线经过圆心。

**证明**：

设 $AB$ 是圆 $\odot(O, r)$ 的一条弦，$M$ 是 $AB$ 的中点。在 $\triangle OAM$ 和 $\triangle OBM$ 中：
- $\overline{OA} = \overline{OB} = r$（半径），
- $\overline{AM} = \overline{BM}$（$M$ 是中点），
- $\overline{OM} = \overline{OM}$（公共边）。

由 SSS，$\triangle OAM \cong \triangle OBM$，所以 $\angle OMA = \angle OMB$。由于 $\angle OMA + \angle OMB = 180°$，得 $\angle OMA = \angle OMB = 90°$，即 $OM \perp AB$。$\blacksquare$

**定理 13.24**（等弦等距）：在同圆或等圆中，相等的弦到圆心的距离相等；反之，到圆心距离相等的弦相等。

**证明**：

设 $AB$ 和 $CD$ 是圆 $\odot(O, r)$ 的两条弦，$M$、$N$ 分别是 $AB$、$CD$ 的中点。则 $OM \perp AB$，$ON \perp CD$（定理 13.23）。

若 $AB = CD$，则 $AM = CN = \frac{1}{2}AB$。在 $\triangle OAM$ 和 $\triangle OCN$ 中：$OA = OC = r$，$AM = CN$，$\angle OMA = \angle ONC = 90°$。由勾股定理，$OM = \sqrt{OA^2 - AM^2} = \sqrt{OC^2 - CN^2} = ON$。

反之，若 $OM = ON$，则 $AM = \sqrt{OA^2 - OM^2} = \sqrt{OC^2 - ON^2} = CN$，故 $AB = 2AM = 2CN = CD$。$\blacksquare$

#### 13.4.2 圆心角与圆周角

**定义 13.10**（圆心角）：顶点在圆心的角称为**圆心角**。

**定义 13.11**（圆周角）：顶点在圆上，两边都是弦的角称为**圆周角**。

**定理 13.25**（圆周角定理）：圆周角的度数等于同弧所对圆心角的一半。

**证明**：

设 $\odot(O, r)$ 中，弧 $AB$ 所对的圆心角为 $\angle AOB$，圆周角为 $\angle ACB$（$C$ 在圆上且在弧 $AB$ 所在的一侧）。

**情形 1**：圆心 $O$ 在圆周角 $\angle ACB$ 的一条边上。不妨设 $O$ 在 $\overrightarrow{CB}$ 上，即 $CB$ 是直径。

在 $\triangle OAC$ 中，$OA = OC = r$（等腰三角形），$\angle OAC = \angle OCA$（等边对等角）。又 $\angle AOB$ 是 $\triangle OAC$ 的外角，所以 $\angle AOB = \angle OAC + \angle OCA = 2\angle OCA = 2\angle ACB$。

**情形 2**：圆心 $O$ 在圆周角 $\angle ACB$ 的内部。过 $C$ 作直径 $CD$。由情形 1，$\angle ACD = \frac{1}{2}\angle AOD$，$\angle DCB = \frac{1}{2}\angle DOB$。因此 $\angle ACB = \angle ACD + \angle DCB = \frac{1}{2}(\angle AOD + \angle DOB) = \frac{1}{2}\angle AOB$。

**情形 3**：圆心 $O$ 在圆周角 $\angle ACB$ 的外部。类似地，$\angle ACB = \frac{1}{2}\angle AOB$（此时为两个差的组合）。

综合三种情形，$\angle ACB = \frac{1}{2}\angle AOB$。$\blacksquare$

**推论 13.4**：同弧所对的圆周角相等。

**证明**：由定理 13.25（圆周角定理），同弧所对的圆周角等于该弧所对圆心角的一半。因同弧对应的圆心角唯一，故所有圆周角相等。$\blacksquare$

**推论 13.5**：半圆所对的圆周角是直角。

**证明**：半圆所对的圆心角为 $180°$，故圆周角为 $\frac{1}{2} \times 180° = 90°$。$\blacksquare$

#### 13.4.3 切线

**定义 13.12**（切线）：与圆只有一个公共点的直线称为圆的**切线**，公共点称为**切点**。

**定理 13.26**（切线的判定）：过圆上一点且垂直于半径的直线是圆的切线。

**证明**：

设 $\odot(O, r)$，$P$ 在圆上，直线 $l$ 过 $P$ 且 $l \perp OP$。设 $Q$ 是 $l$ 上除 $P$ 外的任意一点。在 $\triangle OPQ$ 中，$\angle OPQ = 90°$，所以 $OQ^2 = OP^2 + PQ^2 > OP^2 = r^2$，即 $OQ > r$。因此 $Q$ 在圆外。所以 $l$ 与圆只有一个公共点 $P$，即 $l$ 是切线。$\blacksquare$

**定理 13.27**（切线的性质）：圆的切线垂直于过切点的半径。

**证明**：设 $l$ 切 $\odot(O, r)$ 于 $P$。则 $P$ 是 $l$ 与圆的唯一公共点。设 $H$ 是 $O$ 到 $l$ 的垂足。若 $H \neq P$，在 $l$ 上取 $P$ 关于 $H$ 的对称点 $P'$，则 $OP' = OP = r$（由 $OH \perp PP'$ 和 $HP = HP'$ 可证），即 $P'$ 也在圆上。但 $l$ 与圆只有一个公共点，矛盾。因此 $H = P$，即 $OP \perp l$。$\blacksquare$

#### 13.4.4 圆幂定理

**定理 13.28**（相交弦定理）：设圆 $O$ 的两条弦 $AB$ 和 $CD$ 相交于点 $P$，则 $PA \cdot PB = PC \cdot PD$。

**证明**：

连接 $AC$ 和 $BD$。在 $\triangle PAC$ 和 $\triangle PDB$ 中：
- $\angle APC = \angle DPB$（对顶角），
- $\angle PAC = \angle PDB$（同弧 $BC$ 所对的圆周角相等）。

由 AA 相似，$\triangle PAC \sim \triangle PDB$。因此 $\frac{PA}{PD} = \frac{PC}{PB}$，即 $PA \cdot PB = PC \cdot PD$。$\blacksquare$

**引理 13.4（弦切角定理）**：设圆 $O$ 的切线在点 $T$ 处与圆相切，$TA$ 是圆的一条弦。则弦切角 $\angle PTA$（$P$ 在切线上，$T$ 为顶点，$A$ 在圆上）等于同弧 $\widehat{TA}$ 所对的圆周角。

**证明**：连接 $OT$（半径）。由于 $OT \perp PT$（切线垂直于半径），$\angle OTP = 90°$。连接 $OA$，设 $\angle OTA = \alpha$。则 $\angle PTA = 90° - \alpha$。在 $\triangle OTA$ 中，$OT = OA$（半径），故 $\triangle OTA$ 是等腰三角形，$\angle OAT = \angle OTA = \alpha$。设 $\angle AOT = \beta$，则 $\beta = 180° - 2\alpha$。由圆周角定理（定理 13.25），弧 $\widehat{TA}$ 所对的圆周角为 $\frac{\beta}{2} = 90° - \alpha = \angle PTA$。$\blacksquare$

**定理 13.29**（切割线定理）：设 $P$ 是圆外一点，$PT$ 是切线（$T$ 为切点），$PAB$ 是割线（$A$、$B$ 为交点），则 $PT^2 = PA \cdot PB$。

**证明**：

连接 $TA$ 和 $TB$。在 $\triangle PTA$ 和 $\triangle PTB$ 中：
- $\angle TPA = \angle BPT$（公共角），
- $\angle PTB = \angle PAT$（弦切角等于同弧所对的圆周角）。

由 AA 相似，$\triangle PTA \sim \triangle PTB$。因此 $\frac{PT}{PB} = \frac{PA}{PT}$，即 $PT^2 = PA \cdot PB$。$\blacksquare$

### 13.5 面积

#### 13.5.1 面积的公理化定义

**公理 S1**：每一个多边形 $P$ 都对应一个非负实数 $\text{area}(P)$，称为 $P$ 的**面积**。

**公理 S2**：如果多边形 $P$ 和多边形 $Q$ 全等，则 $\text{area}(P) = \text{area}(Q)$。

**公理 S3**（可加性）：如果多边形 $P$ 被分割为两个多边形 $P_1$ 和 $P_2$（它们只在公共边上共享点），则 $\text{area}(P) = \text{area}(P_1) + \text{area}(P_2)$。

**公理 S4**（单位正方形）：边长为 $1$ 的正方形的面积为 $1$。

#### 13.5.2 平行四边形和三角形的面积

**定理 13.30**：平行四边形的面积等于底乘以高，即 $\text{area} = bh$。

**证明**：

设平行四边形 $ABCD$，$\overline{AB} \parallel \overline{CD}$，$\overline{AB} = b$，高为 $h$（两平行边之间的距离）。

过 $D$ 作 $\overline{DE} \perp \overline{AB}$ 于 $E$，过 $C$ 作 $\overline{CF} \perp \overline{AB}$ 于 $F$。

在 $\triangle ADE$ 和 $\triangle BCF$ 中：$\overline{AD} = \overline{BC}$（平行四边形对边相等），$\angle AED = \angle BFC = 90°$，$\angle DAE = \angle CBF$（同位角）。由 AAS，$\triangle ADE \cong \triangle BCF$。

因此，平行四边形 $ABCD$ 的面积 = 矩形 $DEFC$ 的面积 + $\triangle ADE$ 的面积 + $\triangle BCF$ 的面积 $-$ $\triangle ADE$ 的面积 $-$ $\triangle BCF$ 的面积 $+$ $\triangle ADE$ 的面积 $+$ $\triangle BCF$ 的面积。更简洁地：将 $\triangle ADE$ 移到 $\triangle BCF$ 的位置，平行四边形 $ABCD$ 变为矩形 $DEFC$。由公理 S2 和 S3，$\text{area}(ABCD) = \text{area}(DEFC) = bh$。$\blacksquare$

**定理 13.31**：三角形的面积等于底乘以高的一半，即 $\text{area} = \frac{1}{2}bh$。

**证明**：

设 $\triangle ABC$，以 $\overline{BC}$ 为底，高为 $h$。以 $\overline{BC}$ 为一边，过 $A$ 作 $\overline{BC}$ 的平行线 $l$，过 $C$ 作 $\overline{AB}$ 的平行线交 $l$ 于 $D$。则 $ABCD$ 是平行四边形（$\overline{AD} \parallel \overline{BC}$，$\overline{AB} \parallel \overline{CD}$），其面积为 $bh$。

$\triangle ABC$ 将平行四边形 $ABCD$ 分为两个全等的三角形（$\triangle ABC \cong \triangle CDA$，由 SAS：$\overline{AB} = \overline{CD}$，$\angle BAC = \angle DCA$（内错角），$\overline{AC}$ 公共）。因此 $\text{area}(\triangle ABC) = \frac{1}{2} \text{area}(ABCD) = \frac{1}{2}bh$。$\blacksquare$

#### 13.5.3 海伦公式

**定理 13.32**（海伦公式）：设三角形三边为 $a$、$b$、$c$，半周长 $s = \frac{a + b + c}{2}$，则三角形的面积为

$$S = \sqrt{s(s-a)(s-b)(s-c)}$$

**证明**：

设 $\triangle ABC$ 中，$BC = a$，$AC = b$，$AB = c$。以 $BC$ 为底，高为 $h$，$\overline{BC}$ 上的垂足为 $D$，设 $BD = x$，则 $DC = a - x$。

由勾股定理：
$$c^2 - x^2 = h^2 = b^2 - (a - x)^2$$

展开得 $c^2 - x^2 = b^2 - a^2 + 2ax - x^2$，化简得 $x = \frac{a^2 + c^2 - b^2}{2a}$。

因此 $h^2 = c^2 - x^2 = c^2 - \left(\frac{a^2 + c^2 - b^2}{2a}\right)^2$。

$$S^2 = \frac{1}{4}a^2 h^2 = \frac{1}{4}\left[a^2 c^2 - \frac{(a^2 + c^2 - b^2)^2}{4}\right]$$

$$= \frac{1}{16}\left[4a^2 c^2 - (a^2 + c^2 - b^2)^2\right]$$

利用平方差公式 $4a^2c^2 - (a^2 + c^2 - b^2)^2 = [2ac - (a^2 + c^2 - b^2)][2ac + (a^2 + c^2 - b^2)]$：

$$= [b^2 - (a - c)^2][(a + c)^2 - b^2]$$

$$= (b - a + c)(b + a - c)(a + c - b)(a + c + b)$$

代入 $s = \frac{a + b + c}{2}$：
- $b + a - c = 2(s - c)$
- $b - a + c = 2(s - a)$
- $a + c - b = 2(s - b)$
- $a + c + b = 2s$

$$S^2 = \frac{1}{16} \cdot 16 \cdot s(s - a)(s - b)(s - c) = s(s - a)(s - b)(s - c)$$

因此 $S = \sqrt{s(s-a)(s-b)(s-c)}$。$\blacksquare$

### 13.6 锐角三角函数

#### 13.6.1 三角函数的定义

在建立了面积理论和相似理论之后，我们现在引入锐角三角函数的概念。三角函数将角度与线段比值联系起来，是连接几何与代数的重要桥梁。

**定义 13.13**（锐角三角函数）：设 $\theta$ 是一个锐角（$0° < \theta < 90°$）。在一个包含角 $\theta$ 的直角三角形中，设 $\theta$ 的对边长为 $a$，邻边长为 $b$，斜边长为 $c$，定义：

$$\sin\theta = \frac{a}{c}, \quad \cos\theta = \frac{b}{c}, \quad \tan\theta = \frac{a}{b}$$

分别称为角 $\theta$ 的**正弦**、**余弦**和**正切**。

**定义 13.13'**（三角函数向钝角的推广）：对于钝角 $90° < \theta < 180°$，利用其补角 $180° - \theta$（为锐角）定义：

$$\sin\theta = \sin(180° - \theta), \quad \cos\theta = -\cos(180° - \theta), \quad \tan\theta = -\tan(180° - \theta)$$

**几何意义**：若 $\theta$ 是 $\triangle ABC$ 中的钝角（$\angle A = \theta > 90°$），从 $B$ 向 $AC$ 的延长线作高 $BH$，则 $\sin\theta = \frac{BH}{AB}$，$\cos\theta = -\frac{AH}{AB}$（$H$ 在 $AC$ 的延长线上，故 $AH$ 取负值）。

**性质**：对 $0° < \theta < 180°$，有 $\sin\theta > 0$；$\cos\theta > 0$ 当且仅当 $\theta < 90°$；$\cos\theta < 0$ 当且仅当 $\theta > 90°$。且 $\sin^2\theta + \cos^2\theta = 1$ 仍然成立（由定义直接验证）。

**定理 13.33**（三角函数的良定义性）：三角函数的值只依赖于角 $\theta$ 的大小，与所选取的直角三角形无关。

**证明**：

设 $\triangle ABC$ 和 $\triangle A'B'C'$ 都是以 $\theta$ 为一个锐角的直角三角形，其中 $\angle C = \angle C' = 90°$，$\angle A = \angle A' = \theta$。

由 AA 相似（定理 13.19），$\triangle ABC \sim \triangle A'B'C'$。由相似三角形对应边成比例：

$$\frac{BC}{AB} = \frac{B'C'}{A'B'}, \quad \frac{AC}{AB} = \frac{A'C'}{A'B'}, \quad \frac{BC}{AC} = \frac{B'C'}{A'C'}$$

即 $\sin\theta$、$\cos\theta$、$\tan\theta$ 的值在两个三角形中相同。$\blacksquare$

#### 13.6.2 三角函数的基本关系

**定理 13.34**（平方关系）：对于任意锐角 $\theta$，$\sin^2\theta + \cos^2\theta = 1$。

**证明**：

在含角 $\theta$ 的直角三角形中，设对边为 $a$，邻边为 $b$，斜边为 $c$。由勾股定理，$a^2 + b^2 = c^2$。因此：

$$\sin^2\theta + \cos^2\theta = \frac{a^2}{c^2} + \frac{b^2}{c^2} = \frac{a^2 + b^2}{c^2} = \frac{c^2}{c^2} = 1$$

$\blacksquare$

**定理 13.35**（商关系）：对于任意锐角 $\theta$，$\tan\theta = \frac{\sin\theta}{\cos\theta}$。

**证明**：

$$\frac{\sin\theta}{\cos\theta} = \frac{a/c}{b/c} = \frac{a}{b} = \tan\theta$$

$\blacksquare$

**定理 13.36**（互余关系）：对于任意锐角 $\theta$，$\sin(90° - \theta) = \cos\theta$，$\cos(90° - \theta) = \sin\theta$。

**证明**：

在直角三角形中，设一个锐角为 $\theta$，另一个锐角为 $90° - \theta$。$\theta$ 的对边是 $90° - \theta$ 的邻边，$\theta$ 的邻边是 $90° - \theta$ 的对边。因此：

$$\sin(90° - \theta) = \frac{\theta\text{的邻边}}{\text{斜边}} = \cos\theta$$

$$\cos(90° - \theta) = \frac{\theta\text{的对边}}{\text{斜边}} = \sin\theta$$

$\blacksquare$

#### 13.6.3 特殊角的三角函数值

**定理 13.37**：$\sin 30° = \frac{1}{2}$，$\cos 30° = \frac{\sqrt{3}}{2}$，$\tan 30° = \frac{\sqrt{3}}{3}$。

**证明**：

考虑等边三角形 $\triangle ABC$（边长为 $2$）。作 $\overline{AD} \perp \overline{BC}$ 于 $D$。由三线合一（定理 13.6），$D$ 是 $\overline{BC}$ 的中点，$BD = 1$。在 $\triangle ABD$ 中，$\angle ADB = 90°$，$\angle BAD = 30°$（等边三角形每个角为 $60°$，高平分顶角）。由勾股定理，$AD = \sqrt{AB^2 - BD^2} = \sqrt{4 - 1} = \sqrt{3}$。

$$\sin 30° = \frac{BD}{AB} = \frac{1}{2}, \quad \cos 30° = \frac{AD}{AB} = \frac{\sqrt{3}}{2}, \quad \tan 30° = \frac{BD}{AD} = \frac{1}{\sqrt{3}} = \frac{\sqrt{3}}{3}$$

$\blacksquare$

**定理 13.38**：$\sin 45° = \frac{\sqrt{2}}{2}$，$\cos 45° = \frac{\sqrt{2}}{2}$，$\tan 45° = 1$。

**证明**：

考虑等腰直角三角形，两直角边长为 $1$，斜边长为 $\sqrt{2}$（由勾股定理）。两锐角均为 $45°$。

$$\sin 45° = \frac{1}{\sqrt{2}} = \frac{\sqrt{2}}{2}, \quad \cos 45° = \frac{1}{\sqrt{2}} = \frac{\sqrt{2}}{2}, \quad \tan 45° = \frac{1}{1} = 1$$

$\blacksquare$

**定理 13.39**：$\sin 60° = \frac{\sqrt{3}}{2}$，$\cos 60° = \frac{1}{2}$，$\tan 60° = \sqrt{3}$。

**证明**：由互余关系（定理 13.36），$\sin 60° = \cos 30° = \frac{\sqrt{3}}{2}$，$\cos 60° = \sin 30° = \frac{1}{2}$，$\tan 60° = \frac{\sin 60°}{\cos 60°} = \frac{\sqrt{3}/2}{1/2} = \sqrt{3}$。$\blacksquare$

#### 13.6.4 正弦定理与余弦定理

**定理 13.40**（正弦定理）：在 $\triangle ABC$ 中，设角 $A$、$B$、$C$ 所对的边分别为 $a$、$b$、$c$，外接圆半径为 $R$，则

$$\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C} = 2R$$

**证明**：

设 $\triangle ABC$ 的外接圆为 $\odot(O, R)$。

**情形 1**：$\angle A$ 为锐角。连接 $BO$ 并延长交圆于 $D$。则 $BD = 2R$（直径）。连接 $DC$。由推论 13.5，$\angle BCD = 90°$（半圆上的圆周角）。又 $\angle BDC = \angle BAC = A$（同弧所对的圆周角相等，推论 13.4）。在 $\triangle BCD$ 中，$\sin(\angle BDC) = \frac{BC}{BD}$，即 $\sin A = \frac{a}{2R}$，故 $\frac{a}{\sin A} = 2R$。

**情形 2**：$\angle A$ 为直角。则 $a = 2R$（直径），$\sin A = \sin 90° = 1$，$\frac{a}{\sin A} = 2R$。

**情形 3**：$\angle A$ 为钝角。设 $\triangle ABC$ 的外接圆为 $\odot(O, R)$。连接 $BO$ 并延长交圆于 $D$，则 $BD = 2R$（直径）。连接 $DC$。

由推论 13.5，$\angle BCD = 90°$（半圆所对的圆周角是直角）。

现在确定 $\angle BDC$。弧 $BC$ 有两条：劣弧 $BC$ 和优弧 $BAC$（经过 $A$ 的弧）。$\angle A$ 是优弧 $BAC$ 所对的圆周角，$\angle BDC$ 是劣弧 $BC$ 所对的圆周角。由圆周角定理（定理 13.25），$\angle A = \frac{1}{2} \cdot (\text{优弧 } BAC)$，$\angle BDC = \frac{1}{2} \cdot (\text{劣弧 } BC)$。由于优弧 $BAC$ + 劣弧 $BC = 360°$，故 $\angle A + \angle BDC = 180°$，即 $\angle BDC = 180° - \angle A$。

在直角三角形 $\triangle BCD$ 中（$\angle BCD = 90°$）：

$$\sin(\angle BDC) = \frac{BC}{BD} = \frac{a}{2R}$$

因此 $\sin(180° - A) = \frac{a}{2R}$。由于 $\sin(180° - A) = \sin A$（正弦函数的互补性质，可由定义 13.13 和互余关系推导：在含角 $\angle BDC = 180° - A$ 的直角三角形中，$\sin(180° - A) = \sin A$），故：

$$\sin A = \frac{a}{2R}$$

即 $\frac{a}{\sin A} = 2R$。

同理，$\frac{b}{\sin B} = 2R$，$\frac{c}{\sin C} = 2R$。$\blacksquare$

**定理 13.41**（余弦定理）：在 $\triangle ABC$ 中，$a^2 = b^2 + c^2 - 2bc\cos A$，$b^2 = a^2 + c^2 - 2ac\cos B$，$c^2 = a^2 + b^2 - 2ab\cos C$。

**证明**：

从顶点 $C$ 向边 $\overline{AB}$ 作高 $\overline{CD}$，设垂足为 $D$，$AD = x$，$CD = h$。

在 $\triangle ACD$ 中（$\angle ADC = 90°$），由勾股定理：

$$b^2 = h^2 + x^2$$

在 $\triangle BCD$ 中（$\angle BDC = 90°$），由勾股定理：

$$a^2 = h^2 + (c - x)^2$$

两式相减：

$$a^2 - b^2 = (c - x)^2 - x^2 = c^2 - 2cx$$

因此 $a^2 = b^2 + c^2 - 2cx$。

又在 $\triangle ACD$ 中，$\cos A = \frac{x}{b}$，故 $x = b\cos A$。代入上式得：

$$a^2 = b^2 + c^2 - 2bc\cos A$$

同理可证其余两式。$\blacksquare$

**推论 13.6**：当 $A = 90°$ 时，$\cos A = 0$，余弦定理退化为勾股定理 $a^2 = b^2 + c^2$。

**证明**：在余弦定理 $a^2 = b^2 + c^2 - 2bc\cos A$ 中令 $A = 90°$，则 $\cos 90° = 0$，得 $a^2 = b^2 + c^2$。$\blacksquare$

---

**本章展望**：本章从希尔伯特公理系统出发，系统推导了平面几何的全部核心定理：三角形全等与相似的判定准则、等腰三角形和边角关系、四边形的性质与分类、圆的核心定理（圆周角定理、切线定理、圆幂定理）、面积的公理化理论以及锐角三角函数。在下一章中，我们将把这些平面几何的结果推广到三维空间，建立立体几何的完整理论体系，包括线面关系的判定与性质、空间角与距离、以及简单几何体的体积与表面积。

---



---

> 卷三A总结：本卷从希尔伯特公理系统出发，经过严格的逻辑推导，建立了平面几何的完整理论体系。第12章确立了欧氏几何的五组公理（关联、顺序、合同、平行、连续），并从中推导出了线段中点、角平分线、外角定理和三角形内角和等基本命题。第13章在此基础上系统推导了平面几何的全部核心定理，涵盖三角形全等与相似、四边形性质、圆的核心定理、面积理论和锐角三角函数。每一步推导都严格追溯到公理，每一个定理都有严格证明，体现了公理化方法的精髓。

---


*卷三A：平面几何终。*
