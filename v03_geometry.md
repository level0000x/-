# 卷三：几何

## Ch 18 欧氏几何公理体系
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

---

---

---

## Ch 19 平面几何
**前置知识**：本章假定读者已掌握 Ch 18 欧氏几何公理体系，特别是希尔伯特公理系统（关联公理、顺序公理、合同公理、平行公理、连续公理）以及从中推导的基本命题（线段中点和角平分线的存在唯一性、三角形内角和定理、外角定理）。本章的所有定理都将从这些公理和基本命题出发，经过严格的逻辑推导得出。

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

> 卷三A总结：本卷从希尔伯特公理系统出发，经过严格的逻辑推导，建立了平面几何的完整理论体系。第18章确立了欧氏几何的五组公理（关联、顺序、合同、平行、连续），并从中推导出了线段中点、角平分线、外角定理和三角形内角和等基本命题。第19章在此基础上系统推导了平面几何的全部核心定理，涵盖三角形全等与相似、四边形性质、圆的核心定理、面积理论和锐角三角函数。每一步推导都严格追溯到公理，每一个定理都有严格证明，体现了公理化方法的精髓。

---


*卷三A：平面几何终。*


*卷三A：平面几何终。*


*卷三A：平面几何终。*

---

## Ch 20 立体几何
**前置知识**：本章假定读者已掌握 Ch 18 欧氏几何公理体系（特别是关联公理 I1--I8 和平行公理 P）以及 Ch 19 平面几何的全部定理（三角形全等与相似、四边形性质、圆的定理、面积理论）。本章将平面几何的结果系统推广到三维空间，建立直线与平面的位置关系、空间角与距离、以及简单几何体的体积与表面积理论。

---

上一章中，我们建立了平面几何的完整理论。然而，我们所生活的物理空间是三维的。从平面到空间的推广并非简单的"多加一个维度"——它引入了全新的概念（如异面直线、二面角）和全新的关系（如线面平行、面面垂直），这些在平面中没有对应物。本章严格建立立体几何的理论基础，从空间中直线与平面的基本关系出发，逐步推导空间角与距离的概念，最终建立各类简单几何体的体积与表面积公式。

### 14.1 空间中的直线与平面关系

#### 14.1.1 线面平行的判定与性质

**定义 14.1**（直线与平面平行）：如果一条直线与一个平面没有公共点，则称该直线与该平面**平行**，记为 $l \parallel \alpha$。

**定义 14.2**（直线在平面内）：如果一条直线上的所有点都在一个平面内，则称该直线**在平面内**（或含于平面），记为 $l \subset \alpha$。

**定义 14.3**（直线与平面相交）：如果一条直线与一个平面有且仅有一个公共点，则称该直线与该平面**相交**，公共点称为**交点**。

空间中直线与平面的位置关系有且仅有三种：直线在平面内、直线与平面平行、直线与平面相交。

**定理 14.1**（线面平行的判定定理）：如果平面外一条直线与平面内一条直线平行，则该直线与此平面平行。

即：设 $l \not\subset \alpha$，$m \subset \alpha$，且 $l \parallel m$，则 $l \parallel \alpha$。

**证明**（反证法）：

假设 $l$ 与 $\alpha$ 不平行，则 $l$ 与 $\alpha$ 有公共点。设公共点为 $P$。

因为 $l \parallel m$，所以 $l$ 与 $m$ 不相交。但 $P \in l$ 且 $P \in \alpha$，$m \subset \alpha$。

如果 $P \in m$，则 $P$ 是 $l$ 与 $m$ 的公共点，与 $l \parallel m$ 矛盾。

如果 $P \notin m$，则 $P$ 和 $m$ 在同一平面 $\alpha$ 上，过 $P$ 作直线 $m' \parallel m$。由平行公理（在平面 $\alpha$ 上），这样的 $m'$ 存在且唯一。

但 $l$ 也过 $P$ 且 $l \parallel m$。由空间中平行线的传递性（两条直线都平行于第三条直线，且过同一点，则它们重合），$l = m'$。

因此 $l = m' \subset \alpha$，与 $l \not\subset \alpha$ 矛盾。

所以 $l \parallel \alpha$。$\blacksquare$

**定理 14.2**（线面平行的性质定理）：如果一条直线与一个平面平行，过该直线的平面与此平面相交，则该直线与交线平行。

即：设 $l \parallel \alpha$，$l \subset \beta$，$\alpha \cap \beta = m$，则 $l \parallel m$。

**证明**：

因为 $l \parallel \alpha$，所以 $l$ 与 $\alpha$ 没有公共点。

因为 $m \subset \alpha$，所以 $l$ 与 $m$ 没有公共点（$l$ 上的点都不在 $\alpha$ 上，自然不在 $m$ 上）。

又因为 $l \subset \beta$，$m \subset \beta$，所以 $l$ 和 $m$ 在同一平面 $\beta$ 上。

在同一平面上没有公共点的两条直线平行，因此 $l \parallel m$。$\blacksquare$

**定理 14.3**（线面平行性质的推论）：如果一条直线与一个平面平行，则过该直线的任意平面与该平面的交线都与该直线平行。

**证明**：设直线 $l \parallel$ 平面 $\alpha$，$\beta$ 为过 $l$ 的平面，$\beta \cap \alpha = m$。若 $l$ 与 $m$ 相交，则交点在 $\alpha$ 上（因 $m \subset \alpha$），与 $l \parallel \alpha$ 矛盾。又 $l, m \subset \beta$，故 $l \parallel m$。$\blacksquare$

**推论 14.1**：如果两条平行线中的一条平行于一个平面，则另一条也平行于该平面（或在该平面内）。

**证明**：设 $l_1 \parallel l_2$，$l_1 \parallel \alpha$。在 $\alpha$ 内取一点 $P$（$P \notin l_2$），过 $P$ 和 $l_1$ 作平面 $\beta$。设 $\beta \cap \alpha = m$。由定理 14.2，$l_1 \parallel m$。又 $l_1 \parallel l_2$，由平行线的传递性，$l_2 \parallel m$。由定理 14.1，$l_2 \parallel \alpha$（若 $l_2 \not\subset \alpha$）。$\blacksquare$

#### 14.1.2 面面平行的判定与性质

**定义 14.4**（平面与平面平行）：如果两个平面没有公共点，则称这两个平面**平行**，记为 $\alpha \parallel \beta$。

**定理 14.4**（面面平行的判定定理）：如果一个平面内有两条相交直线分别平行于另一个平面，则这两个平面平行。

即：设 $a \subset \alpha$，$b \subset \alpha$，$a \cap b = P$，$a \parallel \beta$，$b \parallel \beta$，则 $\alpha \parallel \beta$。

**证明**（反证法）：

假设 $\alpha$ 与 $\beta$ 不平行，则它们相交。设 $\alpha \cap \beta = l$。

因为 $a \parallel \beta$，$a \subset \alpha$，由线面平行的性质定理（定理 14.2），$a \parallel l$。

因为 $b \parallel \beta$，$b \subset \alpha$，由线面平行的性质定理，$b \parallel l$。

所以 $a \parallel l$ 且 $b \parallel l$，即 $a \parallel b$。但这与 $a \cap b = P$ 矛盾。

因此 $\alpha \parallel \beta$。$\blacksquare$

**定理 14.5**（面面平行的性质定理）：

1. 如果两个平行平面都与第三个平面相交，则交线平行。
2. 如果一条直线垂直于两个平行平面中的一个，则也垂直于另一个。

**证明**：

**性质 1**：设 $\alpha \parallel \beta$，$\gamma \cap \alpha = a$，$\gamma \cap \beta = b$。

由于 $a \subset \alpha$，$b \subset \beta$，$\alpha \parallel \beta$，所以 $a$ 与 $b$ 没有公共点。

又 $a \subset \gamma$，$b \subset \gamma$，$a$ 和 $b$ 在同一平面上，所以 $a \parallel b$。

**性质 2**：设 $\alpha \parallel \beta$，$l \perp \alpha$ 于 $A$。要证明 $l \perp \beta$。

过 $l$ 作平面 $\gamma$，设 $\gamma \cap \alpha = a$，$\gamma \cap \beta = b$。由性质 1，$a \parallel b$。

因为 $l \perp \alpha$，所以 $l \perp a$。又 $a \parallel b$，所以 $l \perp b$。

对 $\beta$ 内过垂足 $H$（$l$ 与 $\beta$ 的交点）的任意直线 $c$，取包含 $l$ 和 $c$ 的平面 $\gamma$。则 $\gamma \cap \alpha = a_c$（过 $H$ 在 $\alpha$ 内），$\gamma \cap \beta = c$。由性质 1，$a_c \parallel c$。由 $l \perp \alpha$ 得 $l \perp a_c$。再由 $a_c \parallel c$ 得 $l \perp c$。

因此 $l$ 垂直于 $\beta$ 上所有过 $l$ 与 $\beta$ 的交点的直线，所以 $l \perp \beta$。$\blacksquare$

#### 14.1.3 线面垂直的判定与性质

**定义 14.5**（直线与平面垂直）：如果一条直线与一个平面内的**所有**直线都垂直，则称该直线与该平面**垂直**。该直线称为平面的**垂线**，垂线与平面的交点称为**垂足**。

**定义 14.6**（斜线与射影）：如果一条直线与平面相交但不垂直，则称该直线为平面的**斜线**，交点称为**斜足**。从斜线上一点向平面作垂线，垂足与斜足之间的线段称为斜线在平面上的**射影**。

**定理 14.6**（线面垂直的判定定理）：如果一条直线与一个平面内的两条相交直线都垂直，则该直线与此平面垂直。

即：设 $a \subset \alpha$，$b \subset \alpha$，$a \cap b = P$，$l \perp a$，$l \perp b$，则 $l \perp \alpha$。

**证明**：

设 $l$ 过点 $P$（若不过 $P$，可作平移使过 $P$ 的直线与 $l$ 平行，保持垂直关系）。要证明 $l$ 垂直于 $\alpha$ 内过 $P$ 的任意直线 $c$。

在 $l$ 上取点 $A$（不在 $\alpha$ 上），取 $A'$ 使得 $PA' = PA$ 且 $A$、$A'$ 在 $\alpha$ 的两侧（即 $A*P*A'$）。

**关键步骤**：证明 $\alpha$ 上到 $P$ 距离为 $PA$ 的任意点到 $A$ 和 $A'$ 的距离相等。

在 $a$ 上取点 $B$ 使得 $PB = PA$。在 $\triangle APB$ 和 $\triangle A'PB$ 中：
- $PA = PA'$（由构造）
- $\angle APB = \angle A'PB = 90°$（$l \perp a$，故 $\angle APB = 90°$；又 $A*P*A'$，$\angle A'PB = 180° - \angle APB = 90°$）
- $PB = PB$（公共边）

由 SAS，$\triangle APB \cong \triangle A'PB$，所以 $AB = A'B$。

同理，在 $b$ 上取 $C$ 使得 $PC = PA$，可证 $AC = A'C$。

现在，设 $c$ 是 $\alpha$ 内过 $P$ 的任意直线。在包含 $l$ 和 $c$ 的平面 $\beta$ 中，设 $D$ 在 $c$ 上且 $PD = PA$。

利用余弦定理计算 $AD$ 和 $A'D$。设 $\angle APD = \theta$，则 $\angle A'PD = 180° - \theta$。

$$AD^2 = PA^2 + PD^2 - 2 \cdot PA \cdot PD \cos\theta$$
$$A'D^2 = PA'^2 + PD^2 - 2 \cdot PA' \cdot PD \cos(180° - \theta) = PA'^2 + PD^2 + 2 \cdot PA' \cdot PD \cos\theta$$

所以 $AD^2 - A'D^2 = -4 \cdot PA \cdot PD \cos\theta$。

$AD = A'D$ 当且仅当 $\cos\theta = 0$，即 $\theta = 90°$。

现在需要证明 $AD = A'D$，从而由上式推出 $\cos\theta = 0$，即 $\theta = 90°$。

利用 $a$ 和 $b$ 提供的信息。在 $\alpha$ 内，$a$ 和 $b$ 张成过 $P$ 的整个平面。$D$ 是 $c$ 上满足 $PD = PA$ 的点。在 $c$ 上取 $P$ 关于 $D$ 的另一侧的点 $D'$ 使得 $PD' = PD = PA$。在 $l$ 上，$A$ 和 $A'$ 也关于 $P$ 对称（$PA = PA'$，$A * P * A'$）。

由于 $a$、$b$ 都是 $\alpha$ 内过 $P$ 且与 $l$ 垂直的直线，$a$ 和 $b$ 上满足 $PX = PA$ 的点 $X$ 均满足 $AX = A'X$（已证）。现在，$D$ 在 $c$ 上，而 $c$ 是 $\alpha$ 内过 $P$ 的另一条直线。设 $\alpha$ 内过 $P$ 且满足 $PX = PA$ 的点 $X$ 的集合为 $S_P$（即以 $P$ 为圆心、$PA$ 为半径的圆周在 $\alpha$ 内的部分）。集合 $S_P$ 是 $\alpha$ 内的一个闭合曲线。

$a$ 上的 $B$ 和 $b$ 上的 $C$ 都在 $S_P$ 上，且 $AB = A'B$，$AC = A'C$。现在 $D$ 也在 $S_P$ 上。由对称性论证（$A$ 和 $A'$ 关于 $\alpha$ 内过 $P$ 的平面 $l$ 对称），$S_P$ 上的每个点到 $A$ 和 $A'$ 的距离相等。这是因为 $A$ 和 $A'$ 关于由 $l$ 和 $\alpha$ 的法向量确定的对称面对称，且 $S_P$ 在此对称面上是不变的。更严格地：取 $S_P$ 上任意点 $X$，设 $X$ 在 $a$ 和 $b$ 方向上的分量分别为 $s$ 和 $t$（即 $\overrightarrow{PX} = s \cdot \hat{a} + t \cdot \hat{b}$，其中 $\hat{a}$、$\hat{b}$ 是 $a$、$b$ 方向的单位向量）。由余弦定理，$AX^2 = PA^2 + PX^2 - 2 \cdot PA \cdot PX \cos\angle APX$，$A'X^2 = PA^2 + PX^2 + 2 \cdot PA \cdot PX \cos\angle APX$。由 $a$ 和 $b$ 两个方向上的垂直关系以及 $D$ 在 $a$、$b$ 张成的平面内这一事实，可利用阿基米德公理和帕施公理论证 $AD^2 = A'D^2$（具体地，$S_P$ 上到 $A$ 和 $A'$ 等距的点构成 $S_P$ 的一个闭子集，包含 $B$ 和 $C$；由 $a \perp l$ 和 $b \perp l$ 确保该子集非空且在 $S_P$ 上稠密，结合完备性公理可知该子集等于 $S_P$）。

**严格补充**：对 $\alpha$ 内过 $P$ 的任意直线 $c$，可在 $\alpha$ 内将 $c$ 表示为沿 $a$ 方向和 $b$ 方向的线性组合。设 $c$ 上距 $P$ 为 $d$ 的点为 $D_c$，其在 $a$ 和 $b$ 方向上的分量分别为 $d_a$ 和 $d_b$（$d_a^2 + d_b^2 = d^2$）。由 $l \perp a$ 和 $l \perp b$，利用勾股定理（在含 $l$ 和 $a$ 的平面内，$AD^2 = AP^2 + PD^2$；类似对 $b$），可得 $A$ 到 $D_c$ 的距离平方为 $AP^2 + d^2$，与 $c$ 的方向无关。因此 $l$ 垂直于 $\alpha$ 内所有过垂足的直线，即 $l \perp \alpha$。

因此 $AD = A'D$，从而 $\cos\theta = 0$，$\theta = 90°$，即 $l \perp c$。由于 $c$ 是 $\alpha$ 内过 $P$ 的任意直线，$l \perp \alpha$。$\blacksquare$

**定理 14.7**（线面垂直的性质定理）：

1. 如果两条直线都垂直于同一个平面，则这两条直线平行。
2. 过一点与已知平面垂直的直线有且仅有一条。

**证明**：

**性质 1**：设 $a \perp \alpha$，$b \perp \alpha$。假设 $a$ 与 $b$ 不平行，则 $a$ 和 $b$ 相交或异面。

如果 $a$ 和 $b$ 相交于 $P$，取 $\alpha$ 中过 $P$ 的任意一条直线 $l$。因为 $a \perp \alpha$，$b \perp \alpha$，所以 $a \perp l$ 且 $b \perp l$。在由 $a$ 和 $l$ 确定的平面内，过 $P$ 与 $l$ 垂直的直线唯一（平面几何基本事实），故 $a = b$，与假设矛盾。

如果 $a$ 和 $b$ 异面，过 $b$ 上一点 $Q$ 作 $a' \parallel a$。由线面垂直的判定（$\alpha$ 内两条相交直线分别与 $a'$ 垂直，可由 $a \perp \alpha$ 推出），$a' \perp \alpha$。但 $b \perp \alpha$，$a'$ 和 $b$ 都过 $Q$ 且都垂直于 $\alpha$，由上述推理（相交情形）知 $a' = b$，故 $a \parallel b$，与 $a$、$b$ 异面矛盾。

因此 $a \parallel b$。

**性质 2**：设 $P$ 是空间中一点，$l$ 和 $l'$ 都过 $P$ 且都垂直于平面 $\alpha$。由性质 1，$l \parallel l'$。又 $l$ 和 $l'$ 都过 $P$，故 $l = l'$（过同一点的平行线重合）。$\blacksquare$

#### 14.1.4 面面垂直的判定与性质

**定义 14.7**（二面角）：从一条直线出发的两个半平面所组成的图形称为**二面角**，这条直线称为**棱**，两个半平面称为**面**。

**定义 14.8**（二面角的平面角）：在二面角的棱上任取一点，过该点分别在两个半平面内作棱的垂线，这两条射线所成的角称为二面角的**平面角**。

**命题 14.1**：二面角的平面角与棱上点的选取无关。

**证明**：设在棱上取两点 $P$、$Q$，分别作棱的垂线。由这些垂线确定的平面角相等（因为对应的射线互相平行，异面直线所成角的定义保证了角的大小不变）。$\blacksquare$

**定义 14.9**（两个平面垂直）：如果两个平面所成的二面角是直角（即二面角的平面角为 $90°$），则称这两个平面**互相垂直**，记为 $\alpha \perp \beta$。

**定理 14.8**（面面垂直的判定定理）：如果一个平面经过另一个平面的一条垂线，则这两个平面互相垂直。

即：设 $l \perp \alpha$，$l \subset \beta$，则 $\beta \perp \alpha$。

**证明**：

设 $\alpha \cap \beta = m$。在 $m$ 上取点 $P$，在 $\beta$ 内作 $PA \perp m$ 于 $P$（$A \in l$）。

因为 $l \perp \alpha$，$m \subset \alpha$，所以 $l \perp m$，即 $\angle APl = 90°$。

在 $\beta$ 内，$PA \perp m$，$l \perp m$，且 $PA$ 和 $l$ 都在 $\beta$ 内。所以 $PA$ 与 $l$ 的夹角（在 $\beta$ 内度量）就是以 $m$ 为棱的二面角的平面角。

由于 $l \perp \alpha$，$\angle APl = 90°$（$l$ 垂直于 $\alpha$ 内过 $P$ 的直线 $PA$），所以二面角的平面角为 $90°$，即 $\beta \perp \alpha$。$\blacksquare$

**定理 14.9**（面面垂直的性质定理）：

1. 如果两个平面互相垂直，那么在一个平面内垂直于交线的直线垂直于另一个平面。
2. 如果两个平面互相垂直，那么从一个平面内一点作另一个平面的垂线，垂足在交线上。

**证明**：

**性质 1**：设 $\alpha \perp \beta$，$\alpha \cap \beta = m$，$l \subset \alpha$，$l \perp m$。

在 $\beta$ 内作 $n \perp m$ 于 $P$（$P = l \cap m$）。由二面角的定义，$l$ 与 $n$ 的夹角是二面角的平面角，等于 $90°$。

所以 $l \perp n$。又 $l \perp m$，$n \cap m = P$，$n, m \subset \beta$，由线面垂直的判定（定理 14.6），$l \perp \beta$。

**性质 2**：设 $\alpha \perp \beta$，$A \in \alpha$，$AH \perp \beta$ 于 $H$。要证明 $H \in m$（$m$ 是交线）。

过 $A$ 作 $AB \perp m$ 于 $B$，则 $AB \subset \alpha$。由性质 1，$AB \perp \beta$。

由于过一点到一个平面的垂线唯一（定理 14.7），$AH$ 与 $AB$ 重合，所以 $H = B \in m$。$\blacksquare$

#### 14.1.5 三垂线定理

**定理 14.10**（三垂线定理）：如果平面内的一条直线与一条斜线在这个平面内的射影垂直，则它也与这条斜线垂直。

即：设 $PO \perp \alpha$ 于 $O$，$PA$ 是斜线（$A \in \alpha$），$a \subset \alpha$，$a \perp OA$（$OA$ 是 $PA$ 在 $\alpha$ 上的射影），则 $a \perp PA$。

**证明**：

因为 $PO \perp \alpha$，所以 $PO \perp a$（$a \subset \alpha$）。

又 $OA \perp a$（已知），且 $PO$ 和 $OA$ 相交于 $O$。

所以 $a \perp$ 平面 $POA$（$a$ 垂直于平面 $POA$ 内的两条相交直线，由定理 14.6）。

因此 $a \perp PA$（$PA \subset$ 平面 $POA$）。$\blacksquare$

**定理 14.11**（三垂线定理的逆定理）：如果平面内的一条直线与一条斜线垂直，则它也与这条斜线在平面内的射影垂直。

即：设 $PO \perp \alpha$ 于 $O$，$PA$ 是斜线，$a \subset \alpha$，$a \perp PA$，则 $a \perp OA$。

**证明**：

因为 $PO \perp \alpha$，所以 $PO \perp a$。

又 $a \perp PA$（已知），且 $PO$ 和 $PA$ 相交于 $P$。

所以 $a \perp$ 平面 $POA$。

因此 $a \perp OA$（$OA \subset$ 平面 $POA$）。$\blacksquare$

### 14.2 空间中的角与距离

#### 14.2.1 异面直线所成的角

**定义 14.10**（异面直线）：不在同一平面内的两条直线称为**异面直线**。

**定义 14.11**（异面直线所成的角）：过空间中任意一点分别作与两条异面直线平行的直线，这两条相交直线所成的锐角（或直角）称为两条异面直线所成的角。

**定理 14.12**：异面直线所成的角的大小与所取点的位置无关。

**证明**：

设 $a$、$b$ 是异面直线，$P$、$Q$ 是空间中任意两点。

过 $P$ 作 $a' \parallel a$，$b' \parallel b$，角 $\alpha = \angle(a', b')$。

过 $Q$ 作 $a'' \parallel a$，$b'' \parallel b$，角 $\beta = \angle(a'', b'')$。

因为 $a' \parallel a \parallel a''$，所以 $a' \parallel a''$。

因为 $b' \parallel b \parallel b''$，所以 $b' \parallel b''$。

由平行线的性质（同位角或内错角相等），$\alpha = \beta$。$\blacksquare$

#### 14.2.2 直线与平面所成的角

**定义 14.12**：一条直线与它在平面上的射影所成的锐角称为该直线与平面所成的角。

特别地，当直线垂直于平面时，所成的角为 $90°$；当直线平行于或在平面内时，所成的角为 $0°$。

**定理 14.13**：斜线与平面所成的角是斜线与平面内所有直线所成角中的最小值。

**证明**：

设斜线 $PB$ 与平面 $\alpha$ 所成的角为 $\theta$（$P$ 在 $\alpha$ 外，$O$ 是 $P$ 在 $\alpha$ 上的射影，$B$ 是斜足，$\angle PBO = \theta$）。

设 $l$ 是 $\alpha$ 上过 $B$ 的任意直线，$PB$ 与 $l$ 所成的角为 $\phi$。

作 $PH \perp l$ 于 $H$。在 $\triangle PBH$ 中，$\angle PHB = 90°$，所以 $PH = PB \sin\phi$。

在 $\triangle POB$ 中，$\angle POB = 90°$，所以 $PO = PB \sin\theta$。

因为 $O$ 是 $P$ 到 $\alpha$ 的最近点（垂足），$PO \leq PH$（$P$ 到平面的距离不超过 $P$ 到平面内任意直线的距离，由垂线段最短定理）。

所以 $PB \sin\theta \leq PB \sin\phi$，即 $\sin\theta \leq \sin\phi$。

因为 $\theta$ 和 $\phi$ 都是锐角（或 $\theta = \phi = 90°$），$\theta \leq \phi$。

等号成立当且仅当 $H = O$，即 $l \perp OB$（$l$ 垂直于 $PB$ 在 $\alpha$ 上的投影）。$\blacksquare$

#### 14.2.3 点到平面的距离、异面直线的距离

**定义 14.13**（点到平面的距离）：从一点到一个平面所作的垂线段的长度称为该点到该平面的**距离**。

**定理 14.14**（垂线段最短）：点到平面的垂线段是该点到平面上所有点的连线中最短的。

**证明**：

设 $P$ 在平面 $\alpha$ 外，$PO \perp \alpha$ 于 $O$。设 $A$ 是 $\alpha$ 上不同于 $O$ 的点。

在 $\triangle POA$ 中，$\angle POA = 90°$，所以 $PA^2 = PO^2 + OA^2 > PO^2$，即 $PA > PO$。$\blacksquare$

**定义 14.14**（异面直线的距离）：与两条异面直线都垂直相交的线段的长度称为两条异面直线的**公垂线段**的长度，也称为两条异面直线的**距离**。

**定理 14.15**：两条异面直线的公垂线段存在且唯一，且其长度是两条异面直线上任意两点间距离的最小值。

**证明**（概要）：

设 $a$、$b$ 是异面直线。

**(1) 过 $a$ 作平面 $\alpha \parallel b$ 的存在性论证**：在 $a$ 上取一点 $A$。过 $A$ 作直线 $b' \parallel b$（空间中过一点恰有一条直线与给定直线平行）。若 $b' = a$，则 $a \parallel b$，与 $a$、$b$ 异面矛盾，故 $b' \neq a$。$a$ 与 $b'$ 确定唯一平面 $\alpha$。又 $b \parallel b' \subset \alpha$ 且 $b \not\subset \alpha$（否则 $a$ 与 $b$ 共面于 $\alpha$，与异面矛盾），故 $\alpha \parallel b$。

**(2) 过 $b$ 作平面 $\beta \perp \alpha$ 的论证**：在 $b$ 上取一点 $B$。由 $B$ 向平面 $\alpha$ 作垂线 $BB'$（$B' \in \alpha$），则 $BB' \perp \alpha$。过 $b$ 和 $BB'$ 确定平面 $\beta$（$b$ 与 $BB'$ 交于 $B$ 且不共线，故确定唯一平面）。由于 $BB' \perp \alpha$ 且 $BB' \subset \beta$，由面面垂直的判定定理得 $\beta \perp \alpha$。

**(3) 设 $l = \alpha \cap \beta$，论证 $l$ 与 $b$ 相交**：由于 $b \subset \beta$，$l = \alpha \cap \beta$，故 $l$ 与 $b$ 都在平面 $\beta$ 内。若 $l \parallel b$，则由 $b \parallel \alpha$ 得 $l \parallel \alpha$，但 $l \subset \alpha$，矛盾。故 $l$ 与 $b$ 必相交于一点 $Q$。

**(4) 严格证明 $PQ \perp b$**：过 $Q$ 在 $\alpha$ 内作 $PQ \perp l$，$P \in a$（$PQ$ 与 $a$ 相交于 $P$，因为 $l \parallel a$ 且两者均在 $\alpha$ 内，$PQ$ 与 $a$ 的公垂距离有限）。因 $PQ \perp l$ 且 $l \parallel a$，故 $PQ \perp a$。又因 $\beta \perp \alpha$，$PQ \subset \alpha$，$PQ \perp l$ 于点 $Q \in l = \alpha \cap \beta$，由面面垂直的性质定理（平面内垂直于交线的直线垂直于另一个平面），得 $PQ \perp \beta$。因此 $PQ$ 垂直于 $\beta$ 中过 $Q$ 的所有直线，特别地 $PQ \perp b$。故 $PQ$ 是 $a$ 与 $b$ 的公垂线段。$\blacksquare$

### 14.3 简单几何体

#### 14.3.1 棱柱、棱锥、棱台

**体积公理（祖暅原理/卡瓦列里原理）**：设两个立体 $\mathcal{S}_1$ 和 $\mathcal{S}_2$ 位于同一对平行平面之间。若用任意平行于这两个平面的平面截 $\mathcal{S}_1$ 和 $\mathcal{S}_2$ 所得的截面积总是相等，则 $\mathcal{S}_1$ 和 $\mathcal{S}_2$ 的体积相等。

**注**：此原理可视为三维体积理论的基本公理，是面积公理 S1-S4 在三维空间的推广。在现代数学中，其严格证明需要测度论（参见实分析教材）。

**定义 14.15**（棱柱）：有两个面互相平行，其余各面都是四边形，并且每相邻两个四边形的公共边都互相平行的多面体称为**棱柱**。互相平行的两个面称为**底面**，其余各面称为**侧面**，相邻侧面的公共边称为**侧棱**。

**定义 14.16**（直棱柱、正棱柱）：侧棱垂直于底面的棱柱称为**直棱柱**。底面是正多边形的直棱柱称为**正棱柱**。

**定理 14.16**（棱柱的体积）：棱柱的体积等于底面积乘以高，即 $V = Sh$。

**证明**：

设棱柱的底面面积为 $S$，高为 $h$（两底面之间的距离）。

将棱柱沿平行于底面的平面切片。对于任意高度 $z$（$0 \leq z \leq h$），截面是一个与底面全等的多边形，面积为 $S$。

考虑一个底面积为 $S$、高为 $h$ 的直棱柱（柱体）。该直棱柱在每个高度 $z$ 处的截面面积也是 $S$。

由祖暅原理（卡瓦列里原理）：如果两个立体在每一个平行于底面的截面上面积相等，则这两个立体体积相等。棱柱的体积等于该直棱柱的体积。

对于直棱柱，可以将其底面（$n$ 边形）分解为 $n-2$ 个三角形，从而将直棱柱分解为 $n-2$ 个三棱柱。每个三棱柱可以看作一个平行六面体的一半（通过镜像对称构造），平行六面体的体积为底面积乘以高，因此三棱柱的体积为三角形底面积乘以高。所有三棱柱的体积之和为 $(\sum S_i) h = Sh$。

因此棱柱的体积 $V = Sh$。$\blacksquare$

**定义 14.17**（棱锥）：有一个面是多边形，其余各面是有一个公共顶点的三角形的多面体称为**棱锥**。多边形面称为**底面**，三角形面称为**侧面**，公共顶点称为**顶点**，顶点到底面的距离称为**高**。

**定理 14.17**（棱锥的体积）：棱锥的体积等于底面积乘以高的三分之一，即 $V = \frac{1}{3}Sh$。

**证明**：

首先证明三棱锥（四面体）的体积为 $V = \frac{1}{3}Sh$。

考虑三棱柱 $ABC-A'B'C'$。连接 $AB'$、$AC'$、$B'C$，将三棱柱分为三个三棱锥：$T_1 = ABC-B'$、$T_2 = A'-AB'C'$、$T_3 = B'-A'C'C$。

**$T_1$ 与 $T_2$ 等体积**：$T_1$ 以 $\triangle ABC$ 为底、$B'$ 为顶点，高为 $B'$ 到平面 $ABC$ 的距离（即棱柱的高 $h$）。$T_2$ 以 $\triangle AB'C'$ 为底、$A'$ 为顶点，高为 $A'$ 到平面 $AB'C'$ 的距离（也是 $h$）。由三棱柱的性质，$\triangle ABC \cong \triangle AB'C'$，故 $T_1$ 和 $T_2$ 的底面积相等、高相等，体积相等。

**$T_2$ 与 $T_3$ 等体积**：$T_2$ 以 $\triangle AB'C'$ 为底、$A'$ 为顶点。$T_3$ 以 $\triangle A'C'C$ 为底、$B'$ 为顶点。注意 $\triangle AB'C'$ 与 $\triangle A'C'C$ 共享边 $A'C'$，且顶点 $B'$ 和 $C$ 到直线 $A'C'$ 的距离相等（因为 $B'C \parallel A'C'$——三棱柱的侧棱互相平行），故两个三角形面积相等。$A'$ 和 $B'$ 到这两个三角形所在平面（同为侧面 $A'C'CB$ 所在平面）的距离也相等（因为 $A'B' \parallel$ 侧面 $A'C'CB$），故 $T_2$ 和 $T_3$ 的高相等，体积相等。

因此三个三棱锥体积相等，每个的体积为三棱柱体积的 $\frac{1}{3}$，即 $\frac{1}{3}Sh$。

对于一般的棱锥，将其底面分解为三角形，对应多个三棱锥，每个体积为 $\frac{1}{3} S_i h$。总和为 $\frac{1}{3}(\sum S_i) h = \frac{1}{3}Sh$。$\blacksquare$

**定义 14.18**（棱台）：用一个平行于棱锥底面的平面去截棱锥，底面与截面之间的部分称为**棱台**。

**定理 14.18**（棱台的体积）：设棱台的上底面积为 $S_1$，下底面积为 $S_2$，高为 $h$，则体积为：
$$V = \frac{1}{3}h(S_1 + S_2 + \sqrt{S_1 S_2})$$

**证明**：

设原棱锥底面积为 $S_2$，高为 $H$。截面（上底）面积为 $S_1$，距顶点的距离为 $h_1$。则 $H = h_1 + h$。

由相似关系，$\frac{S_1}{S_2} = \left(\frac{h_1}{H}\right)^2$。

棱台体积 = 大棱锥体积 - 小棱锥体积：
$$V = \frac{1}{3}S_2 H - \frac{1}{3}S_1 h_1 = \frac{1}{3}(S_2 H - S_1 h_1)$$

由 $h_1 = H\sqrt{\frac{S_1}{S_2}}$，$h = H - h_1 = H\left(1 - \sqrt{\frac{S_1}{S_2}}\right)$，所以 $H = \frac{h}{1 - \sqrt{S_1/S_2}}$。

设 $k = \sqrt{S_1/S_2}$，则 $S_1 = k^2 S_2$，$h_1 = kH$。

$$V = \frac{1}{3}(S_2 H - k^2 S_2 \cdot kH) = \frac{S_2 H}{3}(1 - k^3)$$

$$= \frac{S_2}{3} \cdot \frac{h}{1 - k} \cdot (1 - k^3) = \frac{S_2 h}{3} \cdot (1 + k + k^2)$$

$$= \frac{h}{3}(S_2 + kS_2 + k^2 S_2) = \frac{h}{3}(S_2 + \sqrt{S_1 S_2} + S_1)$$

$\blacksquare$

#### 14.3.2 圆柱、圆锥、圆台

**定义 14.19**（圆柱）：以矩形的一边所在直线为旋转轴，其余三边旋转形成的曲面所围成的几何体称为**圆柱**。

**定理 14.19**（圆柱的体积和表面积）：底面半径为 $r$、高为 $h$ 的圆柱：
- 体积：$V = \pi r^2 h$
- 侧面积：$S_{\text{侧}} = 2\pi r h$
- 表面积：$S = 2\pi r^2 + 2\pi r h = 2\pi r(r + h)$

**证明**：

**体积**：圆柱可以看作是底面为圆的棱柱的极限（底面圆内接正 $n$ 边形棱柱当 $n \to \infty$）。底面圆的面积为 $\pi r^2$，所以 $V = \pi r^2 h$。

也可以用祖暅原理直接证明：在高度 $z$ 处的截面为与底面全等的圆，面积为 $\pi r^2$，与高度无关。

**侧面积**：将侧面沿一条母线剪开，展开为矩形。矩形的长为底面圆的周长 $2\pi r$，宽为 $h$。所以 $S_{\text{侧}} = 2\pi r h$。

**表面积**：$S = S_{\text{侧}} + 2S_{\text{底}} = 2\pi rh + 2\pi r^2 = 2\pi r(r + h)$。$\blacksquare$

**定义 14.20**（圆锥）：以直角三角形的一条直角边所在直线为旋转轴，其余两边旋转形成的曲面所围成的几何体称为**圆锥**。

**定理 14.20**（圆锥的体积和表面积）：底面半径为 $r$、高为 $h$、母线长为 $l = \sqrt{r^2 + h^2}$ 的圆锥：
- 体积：$V = \frac{1}{3}\pi r^2 h$
- 侧面积：$S_{\text{侧}} = \pi r l$
- 表面积：$S = \pi r^2 + \pi r l = \pi r(r + l)$

**证明**：

**体积**：利用祖暅原理。在高度 $z$（$0 \leq z \leq h$）处，圆锥的截面为圆，半径为 $r \cdot \frac{h - z}{h}$（由相似关系），面积为 $\pi r^2 \cdot \frac{(h-z)^2}{h^2}$。

考虑一个底面面积为 $\pi r^2$、高为 $h$ 的棱锥（例如底面为正方形的四棱锥，正方形边长为 $\sqrt{\pi}\, r$）。该棱锥在高度 $z$ 处的截面与底面相似，线性比例为 $\frac{h - z}{h}$，故截面面积为 $\pi r^2 \cdot \frac{(h-z)^2}{h^2}$，与圆锥在同高度的截面面积完全相同。

由祖暅原理，等截面处面积相等的两个立体体积相等。而棱锥体积为 $\frac{1}{3} \times \text{底面积} \times \text{高} = \frac{1}{3}\pi r^2 h$，因此圆锥体积 $V = \frac{1}{3}\pi r^2 h$。

**侧面积**：将侧面沿一条母线剪开，展开为扇形。扇形的半径为 $l$，弧长为 $2\pi r$。扇形面积 $= \frac{1}{2} \times l \times 2\pi r = \pi r l$。

**表面积**：$S = \pi rl + \pi r^2 = \pi r(r + l)$。$\blacksquare$

**定义 14.21**（圆台）：以直角梯形的垂直于底边的腰所在直线为旋转轴，其余三边旋转形成的曲面所围成的几何体称为**圆台**。

**定理 14.21**（圆台的体积和表面积）：上底半径为 $r_1$、下底半径为 $r_2$、高为 $h$、母线长为 $l$ 的圆台：
- 体积：$V = \frac{1}{3}\pi h(r_1^2 + r_2^2 + r_1 r_2)$
- 侧面积：$S_{\text{侧}} = \pi(r_1 + r_2)l$
- 表面积：$S = \pi r_1^2 + \pi r_2^2 + \pi(r_1 + r_2)l$

**证明**：

**体积**：由棱台体积公式的推广，$V = \frac{1}{3}\pi h(r_1^2 + r_1 r_2 + r_2^2)$。

严格地，将圆台看作大圆锥减去小圆锥。设大圆锥高为 $H$，底面半径 $r_2$，则小圆锥高为 $H - h$，底面半径 $r_1 = r_2 \cdot \frac{H - h}{H}$。由此解出 $H = \frac{r_2 h}{r_2 - r_1}$。

$$V = \frac{1}{3}\pi r_2^2 H - \frac{1}{3}\pi r_1^2(H - h) = \frac{\pi}{3}\left[r_2^2 H - r_1^2(H - h)\right]$$

代入 $H = \frac{r_2 h}{r_2 - r_1}$，$H - h = \frac{r_1 h}{r_2 - r_1}$：

$$V = \frac{\pi}{3} \cdot \frac{h}{r_2 - r_1}\left(r_2^3 - r_1^3\right) = \frac{\pi h}{3} \cdot \frac{(r_2 - r_1)(r_2^2 + r_1 r_2 + r_1^2)}{r_2 - r_1} = \frac{1}{3}\pi h(r_1^2 + r_1 r_2 + r_2^2)$$

**侧面积**：将侧面沿母线展开，得到扇环形。面积 $= \pi(r_1 + r_2)l$。

**表面积**：$S = \pi r_1^2 + \pi r_2^2 + \pi(r_1 + r_2)l$。$\blacksquare$

#### 14.3.3 球的体积和表面积

**定义 14.22**（球）：空间中到定点 $O$ 的距离等于定长 $r$ 的所有点的集合称为**球面**，记为 $S(O, r)$。球面及其内部所围成的几何体称为**球体**，简称**球**。

**定理 14.22**（球的体积）：半径为 $R$ 的球的体积为 $V = \frac{4}{3}\pi R^3$。

**证明**（祖暅原理法）：

将球放在一个底面半径和高都为 $R$ 的圆柱中（球内切于圆柱）。在高度 $h$（$-R \leq h \leq R$）处，作平行于底面的截面。

球的截面是一个圆，半径为 $\sqrt{R^2 - h^2}$，面积为 $\pi(R^2 - h^2)$。

圆柱的截面也是圆，半径为 $R$，面积为 $\pi R^2$。

从圆柱中挖去两个底面半径和高都为 $R$ 的圆锥（顶点在圆柱的两个底面中心），剩余部分在高度 $h$ 处的截面面积为：
$$\pi R^2 - \pi h^2 = \pi(R^2 - h^2)$$

（圆锥在高度 $h$ 处的截面半径为 $|h|$，面积为 $\pi h^2$。）

球的截面面积 $\pi(R^2 - h^2)$ 等于圆柱减去两个圆锥后剩余部分的截面面积 $\pi(R^2 - h^2)$。

由祖暅原理，球的体积等于圆柱减去两个圆锥的体积：
$$V = \pi R^2 \cdot 2R - 2 \cdot \frac{1}{3}\pi R^2 \cdot R = 2\pi R^3 - \frac{2}{3}\pi R^3 = \frac{4}{3}\pi R^3$$

$\blacksquare$

**定理 14.23**（球的表面积）：半径为 $R$ 的球的表面积为 $S = 4\pi R^2$。

**证明**（逼近法）：

**注**：以下证明使用微积分方法，其严格基础将在卷四建立。

将球面分为许多窄的球带。在与球心距离为 $h$ 处，取厚度为 $\mathrm{d}h$ 的球带。

球带的半径为 $r(h) = \sqrt{R^2 - h^2}$，球带的宽度为 $\mathrm{d}s = \frac{R}{\sqrt{R^2 - h^2}} \mathrm{d}h$（由弧长公式）。

球带的面积为 $2\pi r \cdot \mathrm{d}s = 2\pi \sqrt{R^2 - h^2} \cdot \frac{R}{\sqrt{R^2 - h^2}} \mathrm{d}h = 2\pi R \, \mathrm{d}h$。

注意：球带面积与 $h$ 无关！每一个厚度为 $\mathrm{d}h$ 的球带面积都是 $2\pi R \, \mathrm{d}h$。

对所有球带求和（从 $h = -R$ 到 $h = R$）：

$$S = \int_{-R}^{R} 2\pi R \, \mathrm{d}h = 2\pi R \cdot 2R = 4\pi R^2$$

严格证明参见卷四定理 24.16（微积分基本定理）的相关应用。

$\blacksquare$

**推论 14.2**：球的体积与表面积之间存在关系 $S = \frac{\mathrm{d}V}{\mathrm{d}R}$，即表面积等于体积对半径的导数。

**证明**：$\frac{\mathrm{d}}{\mathrm{d}R}\left(\frac{4}{3}\pi R^3\right) = 4\pi R^2 = S$。$\blacksquare$

这体现了微积分中"壳层法"的几何直观——将球看作由无穷薄的球壳叠加而成，每层球壳的体积为 $S(r) \cdot \mathrm{d}r$。

#### 14.3.4 祖暅原理

祖暅原理是推导各种几何体体积公式的核心工具，值得单独阐述。

**注** 祖暅原理在本体系中作为体积公理（见第 14 章开头）引入。在现代数学中，此原理的严格基础由测度论和积分理论提供。

#### 14.3.5 欧拉公式

**定理 14.25**（欧拉多面体公式）：对于任意凸多面体，设其顶点数为 $V$，棱数为 $E$，面数为 $F$，则

$$V - E + F = 2$$

**证明概要**：

将凸多面体的一个面"展开"到平面上，得到一个平面图。具体地，移除多面体的一个面，将剩余部分沿棱展开到平面上，得到一个连通的平面图。

对于连通的平面图，由图论中的归纳法可以证明 $V - E + F = 1$（展开后少了一个面）。因此原多面体的 $V - E + F = 1 + 1 = 2$。

具体地：对平面连通图归纳。**基础步**：单个顶点，$V = 1, E = 0, F = 1$，$V - E + F = 2$。**归纳步**：设对 $k$ 条边的连通图成立。对 $k+1$ 条边的图，若存在有界面（多边形），移除其一条边界边（非桥），$E$ 减 1，$F$ 减 1，$V$ 不变，$V - E + F$ 不变，由归纳假设为 2。若无有界面（即图为树），则 $E = V - 1$，$F = 1$，$V - E + F = V - (V-1) + 1 = 2$。

归纳法的关键步骤：对于平面图中的任意一个有界面（多边形），移除其一条边（不删除顶点），则 $E$ 减少 $1$，$F$ 减少 $1$，$V$ 不变，$V - E + F$ 不变。反复移除边直到只剩一个无界面，此时得到一棵生成树，$E = V - 1$，$F = 1$，$V - E + F = V - (V-1) + 1 = 2$。$\blacksquare$

**验证**：正四面体：$V = 4$，$E = 6$，$F = 4$，$4 - 6 + 4 = 2$。立方体：$V = 8$，$E = 12$，$F = 6$，$8 - 12 + 6 = 2$。正十二面体：$V = 20$，$E = 30$，$F = 12$，$20 - 30 + 12 = 2$。

---

**本章展望**：本章系统建立了立体几何的理论体系，从线面平行和线面垂直的判定与性质出发，经过面面垂直、三垂线定理等核心定理，到异面直线角、线面角、二面角和各种距离的概念，最后建立了棱柱、棱锥、棱台、圆柱、圆锥、圆台和球的体积与表面积公式。然而，上述所有推导都是纯几何的方法。在下一章中，我们将引入向量这一代数工具，它将为立体几何问题提供系统化、程序化的解题方法，使得平行、垂直、角度和距离的判定都可以转化为代数运算。

---

---

---

---

---

## Ch 21 向量
**前置知识**：本章假定读者已掌握 Ch 19 平面几何（特别是平行四边形性质、三角形相似和勾股定理）以及 Ch 20 立体几何（线面平行、线面垂直、面面垂直、异面直线角、线面角、二面角、点到平面距离）。向量将为这些几何概念提供统一的代数刻画。

---

前两章中，我们用纯几何的方法建立了平面几何和立体几何的完整理论。然而，纯几何方法在处理复杂的空间问题时往往需要精巧的辅助线构造，缺乏系统性和可操作性。本章引入向量——一种兼具大小和方向的数学对象——作为连接几何与代数的桥梁。向量方法的核心思想是：将几何关系（平行、垂直、角度、距离）转化为代数运算（加法、数量积、向量积），从而将几何证明转化为代数计算。这一思想的深远意义在于：它为几何学提供了一套统一的、可算法化的处理框架。

### 15.1 平面向量

#### 15.1.0 从几何直觉到代数抽象

向量的概念源于物理学中的力、速度和位移等量，这些量不仅有大小，还有方向。数学上的向量将这一直觉抽象化，使得我们可以在纯粹的代数框架下处理几何问题。

#### 15.1.1 向量的基本概念

**定义 15.1**（向量）：既有大小又有方向的量称为**向量**（或矢量）。向量用带箭头的有向线段表示，如 $\overrightarrow{AB}$ 或 $\vec{a}$。向量的大小（长度）称为向量的**模**，记作 $|\vec{a}|$ 或 $|\overrightarrow{AB}|$。

**定义 15.2**（特殊向量）：
- **零向量**：模为 $0$ 的向量，记作 $\vec{0}$。零向量的方向不确定。
- **单位向量**：模为 $1$ 的向量。与非零向量 $\vec{a}$ 同方向的单位向量为 $\vec{e}_a = \frac{\vec{a}}{|\vec{a}|}$。

**定义 15.3**（向量相等）：长度相等且方向相同的向量称为**相等向量**。

**定义 15.4**（共线向量）：方向相同或相反的非零向量称为**共线向量**（或平行向量）。规定零向量与任何向量共线。

#### 15.1.2 向量的运算

**定义 15.5**（向量加法）：设 $\vec{a}$ 和 $\vec{b}$ 是两个向量。在平面上取一点 $O$，作 $\overrightarrow{OA} = \vec{a}$，$\overrightarrow{AB} = \vec{b}$，则 $\overrightarrow{OB} = \vec{a} + \vec{b}$。此法则称为**三角形法则**。

等价地，作 $\overrightarrow{OA} = \vec{a}$，$\overrightarrow{OC} = \vec{b}$，以 $OA$、$OC$ 为邻边作平行四边形 $OABC$，则对角线 $\overrightarrow{OB} = \vec{a} + \vec{b}$。此法则称为**平行四边形法则**。

**定理 15.1**（向量加法的交换律）：对任意向量 $\vec{a}$、$\vec{b}$，$\vec{a} + \vec{b} = \vec{b} + \vec{a}$。

**证明**：作 $\overrightarrow{OA} = \vec{a}$，$\overrightarrow{AB} = \vec{b}$，则 $\overrightarrow{OB} = \vec{a} + \vec{b}$。作 $\overrightarrow{OC} = \vec{b}$，$\overrightarrow{CB} = \vec{a}$（平行四边形对边平行且相等），则 $\overrightarrow{OB} = \vec{b} + \vec{a}$。因此 $\vec{a} + \vec{b} = \vec{b} + \vec{a}$。$\blacksquare$

**定理 15.2**（向量加法的结合律）：对任意向量 $\vec{a}$、$\vec{b}$、$\vec{c}$，$(\vec{a} + \vec{b}) + \vec{c} = \vec{a} + (\vec{b} + \vec{c})$。

**证明**：作 $\overrightarrow{OA} = \vec{a}$，$\overrightarrow{AB} = \vec{b}$，$\overrightarrow{BC} = \vec{c}$。则 $(\vec{a} + \vec{b}) + \vec{c} = \overrightarrow{OB} + \overrightarrow{BC} = \overrightarrow{OC}$，$\vec{a} + (\vec{b} + \vec{c}) = \overrightarrow{OA} + \overrightarrow{AC} = \overrightarrow{OC}$。因此 $(\vec{a} + \vec{b}) + \vec{c} = \vec{a} + (\vec{b} + \vec{c})$。$\blacksquare$

**定义 15.6**（数乘向量）：设 $\lambda$ 为实数，$\vec{a}$ 为向量，定义 $\lambda\vec{a}$ 为：
- 若 $\lambda > 0$，$\lambda\vec{a}$ 与 $\vec{a}$ 同方向，$|\lambda\vec{a}| = \lambda|\vec{a}|$；
- 若 $\lambda = 0$，$\lambda\vec{a} = \vec{0}$；
- 若 $\lambda < 0$，$\lambda\vec{a}$ 与 $\vec{a}$ 反方向，$|\lambda\vec{a}| = |\lambda||\vec{a}|$。

**定理 15.3**（数乘的性质）：对实数 $\lambda, \mu$ 和向量 $\vec{a}, \vec{b}$：
1. $\lambda(\mu\vec{a}) = (\lambda\mu)\vec{a}$
2. $(\lambda + \mu)\vec{a} = \lambda\vec{a} + \mu\vec{a}$
3. $\lambda(\vec{a} + \vec{b}) = \lambda\vec{a} + \lambda\vec{b}$

**证明**：这些性质均可以从数乘的定义和几何意义直接验证。以分配律 (3) 为例：设 $\overrightarrow{OA} = \vec{a}$，$\overrightarrow{OB} = \vec{b}$，以 $OA$、$OB$ 为邻边作平行四边形 $OACB$，则 $\overrightarrow{OC} = \vec{a} + \vec{b}$。在射线 $OC$ 上取 $C'$ 使得 $\overrightarrow{OC'} = \lambda\overrightarrow{OC} = \lambda(\vec{a} + \vec{b})$。由相似关系，$C'$ 也是以 $\lambda\vec{a}$ 和 $\lambda\vec{b}$ 为邻边的平行四边形的对角线的终点，故 $\overrightarrow{OC'} = \lambda\vec{a} + \lambda\vec{b}$。$\blacksquare$

**定义 15.7**（向量减法）：$\vec{a} - \vec{b} = \vec{a} + (-\vec{b})$，其中 $-\vec{b}$ 是与 $\vec{b}$ 方向相反、模相等的向量。

**几何意义**：作 $\overrightarrow{OA} = \vec{a}$，$\overrightarrow{OB} = \vec{b}$，则 $\overrightarrow{BA} = \vec{a} - \vec{b}$。

#### 15.1.3 向量的坐标表示

**定义 15.8**（基底）：平面上两个不共线的向量 $\vec{e}_1, \vec{e}_2$ 称为一组**基底**。对于平面上任意向量 $\vec{a}$，存在唯一的实数对 $(x, y)$ 使得：
$$\vec{a} = x\vec{e}_1 + y\vec{e}_2$$

$(x, y)$ 称为 $\vec{a}$ 在基底 $\{\vec{e}_1, \vec{e}_2\}$ 下的**坐标**。

当 $\vec{e}_1 = (1, 0)$，$\vec{e}_2 = (0, 1)$ 为标准基底时，$\vec{a} = (x, y)$。

**存在性证明**：设 $\vec{e}_1, \vec{e}_2$ 不共线，$\vec{a}$ 为平面上任意向量。将 $\vec{e}_1, \vec{e}_2$ 放在同一起点 $O$。过 $\vec{a}$ 的终点 $A$ 作平行于 $\vec{e}_2$ 的直线，交 $\vec{e}_1$ 所在直线于点 $P$。则 $\overrightarrow{OP} = x\vec{e}_1$（某实数 $x$），$\overrightarrow{PA}$ 平行于 $\vec{e}_2$，故 $\overrightarrow{PA} = y\vec{e}_2$（某实数 $y$）。由 $\vec{a} = \overrightarrow{OA} = \overrightarrow{OP} + \overrightarrow{PA} = x\vec{e}_1 + y\vec{e}_2$，存在性得证。$\blacksquare$

**定理 15.4**（坐标的唯一性）：在给定基底 $\{\vec{e}_1, \vec{e}_2\}$ 下，任意向量的坐标是唯一的。

**证明**：设 $\vec{a} = x\vec{e}_1 + y\vec{e}_2 = x'\vec{e}_1 + y'\vec{e}_2$。则 $(x - x')\vec{e}_1 + (y - y')\vec{e}_2 = \vec{0}$。由于 $\vec{e}_1$ 和 $\vec{e}_2$ 不共线，若 $x - x' \neq 0$ 或 $y - y' \neq 0$，则 $\vec{0}$ 可以表示为非零向量的线性组合，这意味着 $\vec{e}_1$ 和 $\vec{e}_2$ 共线，矛盾。因此 $x = x'$，$y = y'$。$\blacksquare$

**运算的坐标表示**：设 $\vec{a} = (x_1, y_1)$，$\vec{b} = (x_2, y_2)$，$\lambda$ 为实数：

$$\vec{a} + \vec{b} = (x_1 + x_2, y_1 + y_2)$$
$$\vec{a} - \vec{b} = (x_1 - x_2, y_1 - y_2)$$
$$\lambda\vec{a} = (\lambda x_1, \lambda y_1)$$
$$|\vec{a}| = \sqrt{x_1^2 + y_1^2}$$

**定理 15.5**（共线的充要条件）：设 $\vec{a} = (x_1, y_1)$，$\vec{b} = (x_2, y_2)$，$\vec{b} \neq \vec{0}$，则 $\vec{a}$ 与 $\vec{b}$ 共线的充要条件是 $x_1 y_2 - x_2 y_1 = 0$。

**证明**：$\vec{a}$ 与 $\vec{b}$ 共线 $\iff$ 存在实数 $\lambda$ 使得 $\vec{a} = \lambda\vec{b}$ $\iff$ $(x_1, y_1) = (\lambda x_2, \lambda y_2)$ $\iff$ $x_1 = \lambda x_2$ 且 $y_1 = \lambda y_2$。

若 $x_2 \neq 0$，则 $\lambda = \frac{x_1}{x_2}$，代入得 $y_1 = \frac{x_1}{x_2} y_2$，即 $x_1 y_2 = x_2 y_1$，即 $x_1 y_2 - x_2 y_1 = 0$。

若 $x_2 = 0$，则 $x_1 = \lambda \cdot 0 = 0$，且 $y_1 = \lambda y_2$，此时 $x_1 y_2 - x_2 y_1 = 0 \cdot y_2 - 0 \cdot y_1 = 0$。$\blacksquare$

#### 15.1.4 平面向量的数量积

**定义 15.9**（数量积）：设 $\vec{a}$ 和 $\vec{b}$ 是两个非零向量，$\theta$ 为它们的夹角（$0 \leq \theta \leq \pi$），定义：

$$\vec{a} \cdot \vec{b} = |\vec{a}||\vec{b}|\cos\theta$$

规定零向量与任何向量的数量积为 $0$。

**定理 15.6**（数量积的坐标公式）：设 $\vec{a} = (x_1, y_1)$，$\vec{b} = (x_2, y_2)$，则 $\vec{a} \cdot \vec{b} = x_1 x_2 + y_1 y_2$。

**证明**：设标准基底 $\vec{i} = (1, 0)$，$\vec{j} = (0, 1)$。则 $\vec{a} = x_1\vec{i} + y_1\vec{j}$，$\vec{b} = x_2\vec{i} + y_2\vec{j}$。

$$\vec{a} \cdot \vec{b} = (x_1\vec{i} + y_1\vec{j}) \cdot (x_2\vec{i} + y_2\vec{j})$$

利用分配律：
$$= x_1 x_2(\vec{i} \cdot \vec{i}) + x_1 y_2(\vec{i} \cdot \vec{j}) + y_1 x_2(\vec{j} \cdot \vec{i}) + y_1 y_2(\vec{j} \cdot \vec{j})$$

由于 $\vec{i} \cdot \vec{i} = 1$，$\vec{j} \cdot \vec{j} = 1$，$\vec{i} \cdot \vec{j} = 1 \cdot 1 \cdot \cos 90° = 0$：

$$\vec{a} \cdot \vec{b} = x_1 x_2 + y_1 y_2$$

$\blacksquare$

**定理 15.7**（数量积的性质）：设 $\vec{a}, \vec{b}, \vec{c}$ 为向量，$\lambda \in \mathbb{R}$，则：

1. **交换律**：$\vec{a} \cdot \vec{b} = \vec{b} \cdot \vec{a}$
2. **分配律**：$\vec{a} \cdot (\vec{b} + \vec{c}) = \vec{a} \cdot \vec{b} + \vec{a} \cdot \vec{c}$
3. **数乘结合律**：$(\lambda\vec{a}) \cdot \vec{b} = \lambda(\vec{a} \cdot \vec{b})$
4. **正定性**：$\vec{a} \cdot \vec{a} = |\vec{a}|^2 \geq 0$，等号当且仅当 $\vec{a} = \vec{0}$

**证明**：

(1) $\vec{a} \cdot \vec{b} = |\vec{a}||\vec{b}|\cos\theta = |\vec{b}||\vec{a}|\cos\theta = \vec{b} \cdot \vec{a}$。

(2) 由坐标公式，设 $\vec{a} = (a_1, a_2)$，$\vec{b} = (b_1, b_2)$，$\vec{c} = (c_1, c_2)$：

$$\vec{a} \cdot (\vec{b} + \vec{c}) = a_1(b_1 + c_1) + a_2(b_2 + c_2) = (a_1 b_1 + a_2 b_2) + (a_1 c_1 + a_2 c_2) = \vec{a} \cdot \vec{b} + \vec{a} \cdot \vec{c}$$

(3) $(\lambda\vec{a}) \cdot \vec{b} = (\lambda a_1)b_1 + (\lambda a_2)b_2 = \lambda(a_1 b_1 + a_2 b_2) = \lambda(\vec{a} \cdot \vec{b})$。

(4) $\vec{a} \cdot \vec{a} = x_1^2 + y_1^2 = |\vec{a}|^2 \geq 0$，等号当且仅当 $x_1 = y_1 = 0$，即 $\vec{a} = \vec{0}$。$\blacksquare$

**推论 15.1**（夹角公式）：$\cos\theta = \dfrac{\vec{a} \cdot \vec{b}}{|\vec{a}||\vec{b}|} = \dfrac{x_1 x_2 + y_1 y_2}{\sqrt{x_1^2 + y_1^2}\sqrt{x_2^2 + y_2^2}}$。

**证明**：由数量积定义 $\vec{a} \cdot \vec{b} = |\vec{a}||\vec{b}|\cos\theta$ 和定理 15.6 中 $\vec{a} \cdot \vec{b} = x_1x_2 + y_1y_2$，立即得到结论。$\blacksquare$

**推论 15.2**（垂直的充要条件）：非零向量 $\vec{a} \perp \vec{b}$ 的充要条件是 $\vec{a} \cdot \vec{b} = 0$，即 $x_1 x_2 + y_1 y_2 = 0$。

**证明**：$\vec{a} \perp \vec{b} \iff \theta = 90° \iff \cos\theta = 0 \iff |\vec{a}||\vec{b}|\cos\theta = 0 \iff \vec{a} \cdot \vec{b} = 0$。$\blacksquare$

### 15.2 空间向量

#### 15.2.1 空间向量的概念与运算

**定义 15.10**（空间向量）：在空间中，既有大小又有方向的量称为空间向量。空间向量用有向线段表示，记为 $\overrightarrow{AB}$ 或 $\vec{a}$。

**定义 15.11**（空间向量的坐标表示）：在空间直角坐标系 $Oxyz$ 中，设 $\vec{e}_1, \vec{e}_2, \vec{e}_3$ 分别为 $x$ 轴、$y$ 轴、$z$ 轴正方向的单位向量（标准基向量），则任一空间向量 $\vec{a}$ 可唯一表示为

$$\vec{a} = x\vec{e}_1 + y\vec{e}_2 + z\vec{e}_3$$

其中有序实数组 $(x, y, z)$ 称为向量 $\vec{a}$ 的**坐标**，记为 $\vec{a} = (x, y, z)$。

**存在性**：过 $\vec{a}$ 的终点 $A$ 作三个平面分别平行于坐标平面 $yOz$、$xOz$、$xOy$，与坐标轴分别交于 $P_1$（$x$ 轴）、$P_2$（$y$ 轴）、$P_3$（$z$ 轴）。则 $\overrightarrow{OP_1} = x\vec{e}_1$，$\overrightarrow{P_1Q} = y\vec{e}_2$（$Q$ 为 $A$ 在 $xOy$ 平面上的投影），$\overrightarrow{QA} = z\vec{e}_3$。由向量加法，$\vec{a} = x\vec{e}_1 + y\vec{e}_2 + z\vec{e}_3$。唯一性的证明与二维情形类似。

**定义 15.12**（空间向量的模）：空间向量 $\vec{a} = (x, y, z)$ 的**模**定义为

$$|\vec{a}| = \sqrt{x^2 + y^2 + z^2}$$

**证明**：由勾股定理，从原点到点 $(x, y, z)$ 的距离为 $|\vec{a}|^2 = x^2 + y^2 + z^2$。$\blacksquare$

空间向量的加法、减法、数乘的坐标表示与平面向量类似：

$$\vec{a} + \vec{b} = (x_1 + x_2, y_1 + y_2, z_1 + z_2)$$
$$\vec{a} - \vec{b} = (x_1 - x_2, y_1 - y_2, z_1 - z_2)$$
$$\lambda\vec{a} = (\lambda x_1, \lambda y_1, \lambda z_1)$$

**定理 15.8**（空间向量共线的充要条件）：非零向量 $\vec{a} = (x_1, y_1, z_1)$ 与 $\vec{b} = (x_2, y_2, z_2)$ 共线的充要条件是 $\frac{x_2}{x_1} = \frac{y_2}{y_1} = \frac{z_2}{z_1}$（当某个分量为零时，对应分量也须为零）。

**证明**：$\vec{a} \parallel \vec{b}$ 当且仅当 $\vec{a} = t\vec{b}$ 对某标量 $t$，即 $x_1 = tx_2, y_1 = ty_2, z_1 = tz_2$。消去 $t$ 得 $x_1y_2 = x_2y_1, y_1z_2 = y_2z_1, x_1z_2 = x_2z_1$。$\blacksquare$

#### 15.2.2 空间向量的数量积

**定义 15.13**（空间向量的数量积）：设 $\vec{a}$ 与 $\vec{b}$ 是空间中两个非零向量，$\theta$ 为它们的夹角（$0 \leq \theta \leq \pi$），定义

$$\vec{a} \cdot \vec{b} = |\vec{a}||\vec{b}|\cos\theta$$

**定理 15.9**（空间向量数量积的坐标公式）：设 $\vec{a} = (x_1, y_1, z_1)$，$\vec{b} = (x_2, y_2, z_2)$，则

$$\vec{a} \cdot \vec{b} = x_1 x_2 + y_1 y_2 + z_1 z_2$$

**证明**：设 $\vec{a} = x_1\vec{e}_1 + y_1\vec{e}_2 + z_1\vec{e}_3$，$\vec{b} = x_2\vec{e}_1 + y_2\vec{e}_2 + z_2\vec{e}_3$。由分配律展开：

$$\vec{a} \cdot \vec{b} = x_1 x_2(\vec{e}_1 \cdot \vec{e}_1) + x_1 y_2(\vec{e}_1 \cdot \vec{e}_2) + \cdots$$

由于 $\vec{e}_1, \vec{e}_2, \vec{e}_3$ 是标准正交基：

$$\vec{e}_i \cdot \vec{e}_j = \begin{cases} 1, & i = j \\ 0, & i \neq j \end{cases}$$

因此交叉项全部为零，得 $\vec{a} \cdot \vec{b} = x_1 x_2 + y_1 y_2 + z_1 z_2$。$\blacksquare$

**推论 15.3**（空间向量垂直的充要条件）：$\vec{a} \perp \vec{b} \iff \vec{a} \cdot \vec{b} = 0 \iff x_1 x_2 + y_1 y_2 + z_1 z_2 = 0$。

**证明**：与推论 15.2 类似，$\vec{a} \perp \vec{b} \iff \theta = 90° \iff \cos\theta = 0 \iff \vec{a} \cdot \vec{b} = 0$，再由定理 15.9 得 $\vec{a} \cdot \vec{b} = x_1x_2 + y_1y_2 + z_1z_2 = 0$。$\blacksquare$

**推论 15.4**（空间夹角公式）：$\cos\theta = \dfrac{x_1 x_2 + y_1 y_2 + z_1 z_2}{\sqrt{x_1^2 + y_1^2 + z_1^2}\sqrt{x_2^2 + y_2^2 + z_2^2}}$。

**证明**：与推论 15.1 类似，由空间数量积定义 $\vec{a} \cdot \vec{b} = |\vec{a}||\vec{b}|\cos\theta$ 和定理 15.9 中 $\vec{a} \cdot \vec{b} = x_1x_2 + y_1y_2 + z_1z_2$，立即得到结论。$\blacksquare$

#### 15.2.3 空间向量的向量积

**定义 15.14**（向量积）：设 $\vec{a}$ 与 $\vec{b}$ 是空间中两个不共线的向量，定义它们的**向量积** $\vec{a} \times \vec{b}$ 为满足以下条件的向量：

1. **方向**：$\vec{a} \times \vec{b}$ 垂直于 $\vec{a}$ 和 $\vec{b}$ 所确定的平面，且 $\vec{a}, \vec{b}, \vec{a} \times \vec{b}$ 构成右手系。
2. **大小**：$|\vec{a} \times \vec{b}| = |\vec{a}||\vec{b}|\sin\theta$，其中 $\theta$ 为 $\vec{a}$ 与 $\vec{b}$ 的夹角。

若 $\vec{a}$ 与 $\vec{b}$ 共线，则规定 $\vec{a} \times \vec{b} = \vec{0}$。

**定理 15.10**（向量积的坐标公式）：设 $\vec{a} = (x_1, y_1, z_1)$，$\vec{b} = (x_2, y_2, z_2)$，则

$$\vec{a} \times \vec{b} = (y_1 z_2 - z_1 y_2, \; z_1 x_2 - x_1 z_2, \; x_1 y_2 - y_1 x_2)$$

**证明**：由标准基的向量积关系：

$$\vec{e}_1 \times \vec{e}_2 = \vec{e}_3, \quad \vec{e}_2 \times \vec{e}_3 = \vec{e}_1, \quad \vec{e}_3 \times \vec{e}_1 = \vec{e}_2$$
$$\vec{e}_2 \times \vec{e}_1 = -\vec{e}_3, \quad \vec{e}_3 \times \vec{e}_2 = -\vec{e}_1, \quad \vec{e}_1 \times \vec{e}_3 = -\vec{e}_2$$
$$\vec{e}_i \times \vec{e}_i = \vec{0}$$

展开 $\vec{a} \times \vec{b} = (x_1\vec{e}_1 + y_1\vec{e}_2 + z_1\vec{e}_3) \times (x_2\vec{e}_1 + y_2\vec{e}_2 + z_2\vec{e}_3)$，利用上述关系逐项计算：

$$= (y_1 z_2 - z_1 y_2)\vec{e}_1 + (z_1 x_2 - x_1 z_2)\vec{e}_2 + (x_1 y_2 - y_1 x_2)\vec{e}_3$$

$\blacksquare$

**定理 15.11**（向量积的性质）：

1. **反交换律**：$\vec{a} \times \vec{b} = -(\vec{b} \times \vec{a})$
2. **自叉积为零**：$\vec{a} \times \vec{a} = \vec{0}$
3. **分配律**：$\vec{a} \times (\vec{b} + \vec{c}) = \vec{a} \times \vec{b} + \vec{a} \times \vec{c}$

**证明**：

(1) 由坐标公式，交换 $\vec{a}$ 与 $\vec{b}$ 即每个分量变号，故 $\vec{a} \times \vec{b} = -(\vec{b} \times \vec{a})$。

(2) 由反交换律：$\vec{a} \times \vec{a} = -(\vec{a} \times \vec{a})$，故 $2(\vec{a} \times \vec{a}) = \vec{0}$，即 $\vec{a} \times \vec{a} = \vec{0}$。

(3) 可由坐标公式验证。$\blacksquare$

**定理 15.12**（向量积的几何意义）：$|\vec{a} \times \vec{b}|$ 等于以 $\vec{a}$ 和 $\vec{b}$ 为邻边的平行四边形的面积。

**证明**：以 $\vec{a}$ 和 $\vec{b}$ 为邻边的平行四边形，底边长为 $|\vec{a}|$，高为 $|\vec{b}|\sin\theta$，故面积为 $|\vec{a}||\vec{b}|\sin\theta = |\vec{a} \times \vec{b}|$。$\blacksquare$

**推论 15.5**：以 $\vec{a}$ 和 $\vec{b}$ 为邻边的三角形面积为 $S_{\triangle} = \frac{1}{2}|\vec{a} \times \vec{b}|$。

**证明**：以 $\vec{a}, \vec{b}$ 为邻边的平行四边形面积为 $|\vec{a} \times \vec{b}|$（定理 15.12），三角形为其一半。$\blacksquare$

### 15.3 向量法解立体几何

#### 15.3.1 方向向量与法向量

**定义 15.15**（方向向量）：空间中直线 $l$ 的**方向向量**是指与直线 $l$ 平行的非零向量 $\vec{d}$。一条直线的方向向量有无穷多个，但它们两两共线。

**定义 15.16**（法向量）：平面 $\alpha$ 的**法向量**是指垂直于平面 $\alpha$ 的非零向量 $\vec{n}$。一个平面的法向量有无穷多个，但它们两两共线。

**定理 15.13**（法向量的确定）：设平面 $\alpha$ 由三个不共线的点 $A$、$B$、$C$ 确定，取 $\vec{u} = \overrightarrow{AB}$，$\vec{v} = \overrightarrow{AC}$，则 $\alpha$ 的法向量为

$$\vec{n} = \vec{u} \times \vec{v}$$

**证明**：由向量积的定义，$\vec{u} \times \vec{v}$ 同时垂直于 $\vec{u}$ 和 $\vec{v}$。由于 $\vec{u}$ 和 $\vec{v}$ 不共线且都在平面 $\alpha$ 内，它们张成整个平面 $\alpha$，故 $\vec{n}$ 垂直于 $\alpha$ 内的任意向量，即 $\vec{n}$ 是 $\alpha$ 的法向量。$\blacksquare$

若平面 $\alpha$ 由方程 $ax + by + cz = d$ 给出，则法向量为 $\vec{n} = (a, b, c)$。

#### 15.3.2 平行与垂直的向量判定

利用方向向量和法向量，可以将空间中的平行与垂直关系全部转化为向量运算。

**定理 15.14**（线线平行）：设 $l_1$ 的方向向量为 $\vec{d}_1$，$l_2$ 的方向向量为 $\vec{d}_2$，则 $l_1 \parallel l_2$ 的充要条件是 $\vec{d}_1 \parallel \vec{d}_2$，即存在 $\lambda \neq 0$ 使得 $\vec{d}_2 = \lambda\vec{d}_1$。

**证明**：$l_1 \parallel l_2$ 当且仅当 $l_1$ 与 $l_2$ 方向相同（或相反），当且仅当 $\vec{d}_1$ 与 $\vec{d}_2$ 共线。$\blacksquare$

**定理 15.15**（线面平行）：设直线 $l$ 的方向向量为 $\vec{d}$，平面 $\alpha$ 的法向量为 $\vec{n}_\alpha$，则 $l \parallel \alpha$（$l \not\subset \alpha$）的充要条件是 $\vec{d} \cdot \vec{n}_\alpha = 0$。

**证明**：$l \parallel \alpha$ 当且仅当 $l$ 的方向平行于 $\alpha$，当且仅当 $\vec{d}$ 垂直于 $\alpha$ 的法向量 $\vec{n}_\alpha$，当且仅当 $\vec{d} \cdot \vec{n}_\alpha = 0$。$\blacksquare$

**定理 15.16**（面面平行）：设 $\alpha$ 的法向量为 $\vec{n}_\alpha$，$\beta$ 的法向量为 $\vec{n}_\beta$，则 $\alpha \parallel \beta$ 的充要条件是 $\vec{n}_\alpha \parallel \vec{n}_\beta$，即存在 $\lambda \neq 0$ 使得 $\vec{n}_\beta = \lambda\vec{n}_\alpha$。

**证明**：$\alpha \parallel \beta$ 当且仅当两个平面有相同的"倾斜方向"，当且仅当法向量平行。$\blacksquare$

**定理 15.17**（线线垂直）：$l_1 \perp l_2$ 的充要条件是 $\vec{d}_1 \cdot \vec{d}_2 = 0$。

**证明**：$l_1 \perp l_2 \iff \theta = 90° \iff \cos\theta = 0 \iff \vec{d}_1 \cdot \vec{d}_2 = 0$。$\blacksquare$

**定理 15.18**（线面垂直）：$l \perp \alpha$ 的充要条件是 $\vec{d} \parallel \vec{n}_\alpha$，即存在 $\lambda \neq 0$ 使得 $\vec{d} = \lambda\vec{n}_\alpha$。

**证明**：$l \perp \alpha$ 当且仅当 $l$ 垂直于 $\alpha$ 内的所有直线，当且仅当 $\vec{d}$ 与 $\alpha$ 的法向量平行。$\blacksquare$

**定理 15.19**（面面垂直）：$\alpha \perp \beta$ 的充要条件是 $\vec{n}_\alpha \cdot \vec{n}_\beta = 0$。

**证明**：$\alpha \perp \beta$ 当且仅当二面角的平面角为 $90°$。两个法向量的夹角 $\gamma$ 满足 $\cos\gamma = \frac{\vec{n}_\alpha \cdot \vec{n}_\beta}{|\vec{n}_\alpha||\vec{n}_\beta|}$。二面角的平面角 $\psi$ 与 $\gamma$ 的关系是 $\psi = \gamma$ 或 $\psi = \pi - \gamma$。当 $\psi = 90°$ 时，$|\cos\gamma| = 0$，即 $\vec{n}_\alpha \cdot \vec{n}_\beta = 0$。$\blacksquare$

**总结表**：

| 位置关系 | 向量条件 |
|---------|---------|
| $l_1 \parallel l_2$ | $\vec{d}_1 \parallel \vec{d}_2$ |
| $l \parallel \alpha$ | $\vec{d} \cdot \vec{n}_\alpha = 0$ |
| $\alpha \parallel \beta$ | $\vec{n}_\alpha \parallel \vec{n}_\beta$ |
| $l_1 \perp l_2$ | $\vec{d}_1 \cdot \vec{d}_2 = 0$ |
| $l \perp \alpha$ | $\vec{d} \parallel \vec{n}_\alpha$ |
| $\alpha \perp \beta$ | $\vec{n}_\alpha \cdot \vec{n}_\beta = 0$ |

#### 15.3.3 空间角的向量公式

**定理 15.20**（异面直线所成的角）：设 $l_1$ 的方向向量为 $\vec{d}_1$，$l_2$ 的方向向量为 $\vec{d}_2$，则异面直线 $l_1$ 与 $l_2$ 所成的角 $\phi$ 满足

$$\cos\phi = \frac{|\vec{d}_1 \cdot \vec{d}_2|}{|\vec{d}_1||\vec{d}_2|}$$

**证明**：设 $\vec{d}_1$ 与 $\vec{d}_2$ 的夹角为 $\theta$（$0 \leq \theta \leq \pi$）。异面直线所成的角取锐角或直角，即 $\phi = \theta$（若 $\theta \leq 90°$）或 $\phi = 180° - \theta$（若 $\theta > 90°$）。无论哪种情况，$\cos\phi = |\cos\theta| = \frac{|\vec{d}_1 \cdot \vec{d}_2|}{|\vec{d}_1||\vec{d}_2|}$。$\blacksquare$

**定理 15.21**（直线与平面所成的角）：设直线 $l$ 的方向向量为 $\vec{d}$，平面 $\alpha$ 的法向量为 $\vec{n}$，则直线 $l$ 与平面 $\alpha$ 所成的角 $\varphi$ 满足

$$\sin\varphi = \frac{|\vec{d} \cdot \vec{n}|}{|\vec{d}||\vec{n}|}$$

**证明**：设 $\vec{d}$ 与 $\vec{n}$ 的夹角为 $\gamma$。由于 $\vec{n}$ 垂直于 $\alpha$，$l$ 在 $\alpha$ 上的射影 $l'$ 的方向向量 $\vec{d}'$ 满足 $\vec{d}' \perp \vec{n}$。$l$ 与 $l'$ 所成的角 $\varphi$ 满足 $\varphi = |90° - \gamma|$。因此

$$\sin\varphi = \sin|90° - \gamma| = |\cos\gamma| = \frac{|\vec{d} \cdot \vec{n}|}{|\vec{d}||\vec{n}|}$$

$\blacksquare$

**定理 15.22**（二面角）：设平面 $\alpha$ 的法向量为 $\vec{n}_1$，平面 $\beta$ 的法向量为 $\vec{n}_2$，则二面角 $\alpha$-$l$-$\beta$ 的平面角 $\psi$ 满足

$$\cos\psi = \pm\frac{\vec{n}_1 \cdot \vec{n}_2}{|\vec{n}_1||\vec{n}_2|}$$

其中正负号取决于法向量的选取方向。

**证明**：两个法向量 $\vec{n}_1$ 与 $\vec{n}_2$ 的夹角 $\gamma$ 满足 $\cos\gamma = \frac{\vec{n}_1 \cdot \vec{n}_2}{|\vec{n}_1||\vec{n}_2|}$。二面角的平面角 $\psi$ 与 $\gamma$ 的关系是 $\psi = \gamma$ 或 $\psi = \pi - \gamma$，取决于法向量的选取方向是否指向二面角的同一侧。因此 $\cos\psi = \pm\cos\gamma$。在实际计算中，通常直接计算 $\cos\gamma$，再根据几何意义判断正负号。$\blacksquare$

#### 15.3.4 空间距离的向量公式

**定理 15.23**（点到平面的距离）：设平面 $\alpha$ 的法向量为 $\vec{n}$，$P$ 为空间中一点，$A$ 为平面 $\alpha$ 上的任意一点，则点 $P$ 到平面 $\alpha$ 的距离为

$$d = \frac{|\overrightarrow{AP} \cdot \vec{n}|}{|\vec{n}|}$$

**证明**：设 $H$ 为 $P$ 在平面 $\alpha$ 上的正投影（垂足），则 $\overrightarrow{PH} \parallel \vec{n}$。设 $\overrightarrow{PH} = t\vec{n}$，则

$$\overrightarrow{AH} = \overrightarrow{AP} + \overrightarrow{PH} = \overrightarrow{AP} + t\vec{n}$$

由于 $H \in \alpha$，$\overrightarrow{AH}$ 在 $\alpha$ 内，故 $\overrightarrow{AH} \perp \vec{n}$，即

$$(\overrightarrow{AP} + t\vec{n}) \cdot \vec{n} = 0 \implies \overrightarrow{AP} \cdot \vec{n} + t|\vec{n}|^2 = 0 \implies t = -\frac{\overrightarrow{AP} \cdot \vec{n}}{|\vec{n}|^2}$$

因此

$$d = |\overrightarrow{PH}| = |t| \cdot |\vec{n}| = \frac{|\overrightarrow{AP} \cdot \vec{n}|}{|\vec{n}|}$$

$\blacksquare$

**定理 15.24**（异面直线的距离）：设 $l_1$ 过点 $A$，方向向量为 $\vec{d}_1$；$l_2$ 过点 $B$，方向向量为 $\vec{d}_2$。则 $l_1$ 与 $l_2$ 的距离为

$$d = \frac{|\overrightarrow{AB} \cdot (\vec{d}_1 \times \vec{d}_2)|}{|\vec{d}_1 \times \vec{d}_2|}$$

**证明**：公垂线的方向向量为 $\vec{d}_1 \times \vec{d}_2$（同时垂直于 $\vec{d}_1$ 和 $\vec{d}_2$）。异面直线的距离等于 $\overrightarrow{AB}$ 在公垂线方向上的投影的绝对值：

$$d = \left|\text{proj}_{\vec{d}_1 \times \vec{d}_2}\overrightarrow{AB}\right| = \frac{|\overrightarrow{AB} \cdot (\vec{d}_1 \times \vec{d}_2)|}{|\vec{d}_1 \times \vec{d}_2|}$$

$\blacksquare$

### 15.4 向量法证明几何定理

向量法为证明经典几何定理提供了简洁有力的工具。以下展示如何用向量方法重新证明若干重要定理。

**定理 15.25**（用向量法证明余弦定理）：在 $\triangle ABC$ 中，$a^2 = b^2 + c^2 - 2bc\cos A$。

**证明**：设 $\overrightarrow{AB} = \vec{c}$，$\overrightarrow{AC} = \vec{b}$，则 $\overrightarrow{BC} = \vec{b} - \vec{c}$。

$$a^2 = |\overrightarrow{BC}|^2 = (\vec{b} - \vec{c}) \cdot (\vec{b} - \vec{c}) = |\vec{b}|^2 - 2\vec{b} \cdot \vec{c} + |\vec{c}|^2$$

$$= b^2 + c^2 - 2|\vec{b}||\vec{c}|\cos A = b^2 + c^2 - 2bc\cos A$$

$\blacksquare$

**定理 15.26**（用向量法证明平行四边形对角线性质）：平行四边形的对角线互相平分。

**证明**：设平行四边形 $ABCD$，$\overrightarrow{AB} = \vec{a}$，$\overrightarrow{AD} = \vec{b}$。则 $\overrightarrow{AC} = \vec{a} + \vec{b}$，$\overrightarrow{DB} = \vec{a} - \vec{b}$。

设对角线 $AC$ 和 $BD$ 的交点为 $O$。设 $\overrightarrow{AO} = t(\vec{a} + \vec{b})$（$O$ 在 $AC$ 上），$\overrightarrow{DO} = s(\vec{a} - \vec{b})$（$O$ 在 $BD$ 上）。

由 $\overrightarrow{AO} = \overrightarrow{AD} + \overrightarrow{DO}$，得 $t(\vec{a} + \vec{b}) = \vec{b} + s(\vec{a} - \vec{b})$。

比较 $\vec{a}$ 和 $\vec{b}$ 的系数：$t = s$，$t = 1 - s$。解得 $t = s = \frac{1}{2}$。

因此 $\overrightarrow{AO} = \frac{1}{2}\overrightarrow{AC}$，$\overrightarrow{DO} = \frac{1}{2}\overrightarrow{DB}$，即 $O$ 是两条对角线的中点。$\blacksquare$

**定理 15.27**（用向量法证明三角形中位线定理）：三角形的中位线平行于第三边且等于第三边的一半。

**证明**：设 $\triangle ABC$ 中，$D$、$E$ 分别是 $\overline{AB}$、$\overline{AC}$ 的中点。设 $\overrightarrow{AB} = \vec{a}$，$\overrightarrow{AC} = \vec{b}$。

$$\overrightarrow{AD} = \frac{1}{2}\vec{a}, \quad \overrightarrow{AE} = \frac{1}{2}\vec{b}$$

$$\overrightarrow{DE} = \overrightarrow{AE} - \overrightarrow{AD} = \frac{1}{2}\vec{b} - \frac{1}{2}\vec{a} = \frac{1}{2}(\vec{b} - \vec{a}) = \frac{1}{2}\overrightarrow{BC}$$

因此 $\overrightarrow{DE} \parallel \overrightarrow{BC}$ 且 $|\overrightarrow{DE}| = \frac{1}{2}|\overrightarrow{BC}|$。$\blacksquare$

**定理 15.28**（用向量法证明勾股定理）：在直角三角形中，斜边的平方等于两直角边的平方和。

**证明**：设 $\triangle ABC$ 中 $\angle C = 90°$。设 $\overrightarrow{CA} = \vec{a}$，$\overrightarrow{CB} = \vec{b}$，则 $\overrightarrow{AB} = \vec{b} - \vec{a}$。

由 $\angle C = 90°$，$\vec{a} \perp \vec{b}$，即 $\vec{a} \cdot \vec{b} = 0$。

$$c^2 = |\overrightarrow{AB}|^2 = (\vec{b} - \vec{a}) \cdot (\vec{b} - \vec{a}) = |\vec{a}|^2 - 2\vec{a} \cdot \vec{b} + |\vec{b}|^2 = a^2 + b^2$$

$\blacksquare$

**定理 15.29**（用向量法证明三垂线定理）：如果平面内的一条直线与一条斜线在平面内的射影垂直，则它也与这条斜线垂直。

**证明**：设 $PO \perp \alpha$ 于 $O$，$A \in \alpha$，$a \subset \alpha$，$a \perp OA$。在 $a$ 上取方向向量 $\vec{d}$，则 $\vec{d} \perp \overrightarrow{OA}$，即 $\vec{d} \cdot \overrightarrow{OA} = 0$。

又 $\overrightarrow{PO} \perp \alpha$，故 $\overrightarrow{PO} \perp \vec{d}$，即 $\overrightarrow{PO} \cdot \vec{d} = 0$。

$$\overrightarrow{PA} \cdot \vec{d} = (\overrightarrow{PO} + \overrightarrow{OA}) \cdot \vec{d} = \overrightarrow{PO} \cdot \vec{d} + \overrightarrow{OA} \cdot \vec{d} = 0 + 0 = 0$$

因此 $\overrightarrow{PA} \perp \vec{d}$，即 $PA \perp a$。$\blacksquare$

**定理 15.30**（用向量法证明正弦定理）：在 $\triangle ABC$ 中，$\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C}$。

**证明**：设 $\overrightarrow{AB} = \vec{c}$，$\overrightarrow{AC} = \vec{b}$。由向量积的几何意义：

$$|\vec{b} \times \vec{c}| = |\vec{b}||\vec{c}|\sin A = bc\sin A$$

而 $|\vec{b} \times \vec{c}|$ 等于以 $\overrightarrow{AB}$ 和 $\overrightarrow{AC}$ 为邻边的平行四边形的面积，即 $2S_{\triangle}$（三角形面积的两倍）。

因此 $bc\sin A = 2S$，即 $\frac{a}{\sin A} = \frac{a \cdot bc}{2S}$。

同理 $ac\sin B = 2S$，$ab\sin C = 2S$。

所以 $\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C} = \frac{abc}{2S}$。

**注**：上述向量法证明建立了 $\frac{a}{\sin A} = \frac{b}{\sin B} = \frac{c}{\sin C} = \frac{abc}{2S}$。其中 $\frac{abc}{2S} = 2R$（$R$ 为外接圆半径）的结论参见定理 13.40 的几何证明。$\blacksquare$

---

#### 15.4.1 混合积

**定义 15.17**（混合积）：三个向量 $\vec{a}, \vec{b}, \vec{c}$ 的**混合积**（标量三重积）定义为

$$[\vec{a}\;\vec{b}\;\vec{c}] = (\vec{a} \times \vec{b}) \cdot \vec{c}$$

**定理 15.31**（混合积的坐标公式）：设 $\vec{a} = (x_1, y_1, z_1)$，$\vec{b} = (x_2, y_2, z_2)$，$\vec{c} = (x_3, y_3, z_3)$，则

$$[\vec{a}\;\vec{b}\;\vec{c}] = \begin{vmatrix} x_1 & y_1 & z_1 \\ x_2 & y_2 & z_2 \\ x_3 & y_3 & z_3 \end{vmatrix}$$

**证明**：由向量积的坐标公式，$\vec{a} \times \vec{b} = (y_1 z_2 - z_1 y_2, \; z_1 x_2 - x_1 z_2, \; x_1 y_2 - y_1 x_2)$。再由数量积的坐标公式：

$$[\vec{a}\;\vec{b}\;\vec{c}] = x_3(y_1 z_2 - z_1 y_2) + y_3(z_1 x_2 - x_1 z_2) + z_3(x_1 y_2 - y_1 x_2)$$

按第三行展开行列式即得上述结果。$\blacksquare$

**定理 15.32**（混合积的几何意义）：$|[\vec{a}\;\vec{b}\;\vec{c}]|$ 等于以 $\vec{a}, \vec{b}, \vec{c}$ 为棱的平行六面体的体积。

**证明**：$\vec{a} \times \vec{b}$ 的模长等于以 $\vec{a}, \vec{b}$ 为底的平行四边形的面积 $S$，方向为底面的法向量。$(\vec{a} \times \vec{b}) \cdot \vec{c}$ 等于 $\vec{c}$ 在 $\vec{a} \times \vec{b}$ 方向上的投影与 $|\vec{a} \times \vec{b}|$ 的乘积，即底面积 $S$ 乘以高 $h$，等于平行六面体的体积。$\blacksquare$

**推论 15.6**（共面的充要条件）：三个向量 $\vec{a}, \vec{b}, \vec{c}$ 共面的充要条件是 $[\vec{a}\;\vec{b}\;\vec{c}] = 0$。

**证明**：$\vec{a}, \vec{b}, \vec{c}$ 共面 $\iff$ 以它们为棱的平行六面体体积为零 $\iff$ $[\vec{a}\;\vec{b}\;\vec{c}] = 0$。$\blacksquare$

**定理 15.33**（混合积的轮换对称性）：$[\vec{a}\;\vec{b}\;\vec{c}] = [\vec{b}\;\vec{c}\;\vec{a}] = [\vec{c}\;\vec{a}\;\vec{b}]$。

**证明**：由行列式的性质，轮换行列式的行不改变行列式的值（或改变偶数次行交换，符号不变）：

$$[\vec{a}\;\vec{b}\;\vec{c}] = (\vec{a} \times \vec{b}) \cdot \vec{c} = \vec{c} \cdot (\vec{a} \times \vec{b}) = [\vec{c}\;\vec{a}\;\vec{b}]$$

其中最后一步利用了混合积的循环性质（行列式的行轮换）。$\blacksquare$

#### 15.4.2 用向量法证明更多的几何定理

**定理 15.34**（用向量法证明斯图尔特定理）：设 $D$ 是 $\triangle ABC$ 的边 $BC$ 上一点，$BD = m$，$DC = n$，$BC = a = m + n$，则

$$AD^2 = \frac{mb^2 + nc^2}{m + n} - mn$$

**证明**：设 $\overrightarrow{AB} = \vec{c}$，$\overrightarrow{AC} = \vec{b}$。则 $\overrightarrow{BC} = \vec{b} - \vec{c}$，$|\vec{b}| = b$，$|\vec{c}| = c$。

$$\overrightarrow{AD} = \overrightarrow{AB} + \overrightarrow{BD} = \vec{c} + \frac{m}{a}(\vec{b} - \vec{c}) = \frac{n}{a}\vec{c} + \frac{m}{a}\vec{b}$$

$$AD^2 = |\overrightarrow{AD}|^2 = \frac{n^2}{a^2}|\vec{c}|^2 + 2 \cdot \frac{mn}{a^2}\vec{b} \cdot \vec{c} + \frac{m^2}{a^2}|\vec{b}|^2$$

$$= \frac{n^2 c^2 + m^2 b^2 + 2mn \vec{b} \cdot \vec{c}}{a^2}$$

由余弦定理，$\vec{b} \cdot \vec{c} = bc\cos A = \frac{b^2 + c^2 - a^2}{2}$。代入化简：

$$AD^2 = \frac{n^2 c^2 + m^2 b^2 + mn(b^2 + c^2 - a^2)}{a^2} = \frac{(n^2 + mn)c^2 + (m^2 + mn)b^2 - mna^2}{a^2}$$

$$= \frac{n(m+n)c^2 + m(m+n)b^2}{a^2} - \frac{mna^2}{a^2} = \frac{nc^2 + mb^2}{a} - mn = \frac{mb^2 + nc^2}{m+n} - mn$$

$\blacksquare$

**推论 15.7**（中线长公式）：当 $m = n = \frac{a}{2}$ 时（$D$ 为 $BC$ 的中点），斯图尔特定理退化为中线长公式：

$$m_a^2 = \frac{2b^2 + 2c^2 - a^2}{4}$$

**证明**：代入 $m = n = \frac{a}{2}$：

$$AD^2 = \frac{\frac{a}{2} b^2 + \frac{a}{2} c^2}{a} - \frac{a^2}{4} = \frac{b^2 + c^2}{2} - \frac{a^2}{4} = \frac{2b^2 + 2c^2 - a^2}{4}$$

$\blacksquare$

**定理 15.35**（用向量法证明阿波罗尼奥斯定理）：三角形三条中线的平方和等于三边平方和的四分之三，即

$$m_a^2 + m_b^2 + m_c^2 = \frac{3}{4}(a^2 + b^2 + c^2)$$

**证明**：由中线长公式（推论 15.7），三条中线的平方分别为：

$$m_a^2 = \frac{2b^2 + 2c^2 - a^2}{4}, \quad m_b^2 = \frac{2a^2 + 2c^2 - b^2}{4}, \quad m_c^2 = \frac{2a^2 + 2b^2 - c^2}{4}$$

求和：

$$m_a^2 + m_b^2 + m_c^2 = \frac{(2b^2 + 2c^2 - a^2) + (2a^2 + 2c^2 - b^2) + (2a^2 + 2b^2 - c^2)}{4}$$

$$= \frac{3a^2 + 3b^2 + 3c^2}{4} = \frac{3}{4}(a^2 + b^2 + c^2)$$

$\blacksquare$

**定理 15.36**（用向量法证明四面体体积公式）：以 $\vec{a}, \vec{b}, \vec{c}$ 为从同一顶点出发的三条棱的四面体的体积为

$$V = \frac{1}{6}|[\vec{a}\;\vec{b}\;\vec{c}]|$$

**证明**：以 $\vec{a}, \vec{b}, \vec{c}$ 为棱的平行六面体的体积为 $|[\vec{a}\;\vec{b}\;\vec{c}]|$（定理 15.32）。四面体是平行六面体的六分之一（平行六面体可分解为六个等体积的四面体），因此 $V = \frac{1}{6}|[\vec{a}\;\vec{b}\;\vec{c}]|$。$\blacksquare$

---

**本章展望**：本章建立了向量的完整理论体系，从平面向量的运算和坐标表示出发，推广到空间向量，引入了数量积和向量积这两个核心运算，并系统地将立体几何中的平行、垂直、角度和距离关系转化为向量运算。向量方法将几何直觉与代数计算完美结合，使得复杂的几何问题可以程序化地求解。在后续的解析几何中，向量将成为描述曲线和曲面的基本工具；在函数分析中，向量空间的概念将进一步推广到无穷维的情形。

---

---

---

---

---

## 第22章：几何基础与公理体系
几何基础研究 Euclid 公理体系的完备性和独立性，是数学公理化运动的先驱。

**定义 16.1**（Hilbert 公理体系）：D. Hilbert 在《几何基础》(1899) 中将 Euclid 几何公理组织为五组：**关联公理**（点、线、面的基本关系）；**顺序公理**（点在直线上的介于关系）；**合同公理**（线段的长度和角度的全等）；**平行公理**（过线外一点恰有一条平行线——Playfair 公设）；**连续公理**（Archimedes 公理 + 完备性）。该体系不仅是 Euclid 要素的公理化重建，更重要的是建立了**公理间的独立性**（每组公理不能被其他四组推导出来）。

**模型构造与非 Euclid 几何**：改变平行公理得双曲几何（Lobachevsky, Bolyai, Gauss）和椭圆几何（Riemann）。在双曲几何的 Beltrami-Klein 模型中，点对应单位圆盘内点，直线对应弦，角度和距离的定义与 Euclid 不同——这是证明非 Euclid 几何与 Euclid 几何具有相同逻辑一致性（相对无矛盾性）的严格方法。

**Gödel 不完全性定理的几何意涵**：Hilbert 体系在 Tarski 的实闭域公理化下是**完备且可判定**的（Tarski-Seidenberg 定理）。这与 Peano 算术体系（不完备、不可判定）的对比揭示了数学基础中"足够强"的公理体系的本质差异——几何的"较弱"公理体系确保了其逻辑上的完备性。

---

> 卷三B总结：本卷在卷三A平面几何的基础上，将几何理论推广到三维空间，并引入向量和公理体系深层探讨。第20章建立了空间中直线与平面关系的判定与性质、空间角与距离、以及简单几何体的体积与表面积理论；第21章从平面向量推广到空间向量，建立了数量积和向量积的运算体系，用向量方法统一处理立体几何中的平行、垂直、角度和距离问题；第23章探讨了几何基础与公理体系的完备性和独立性，包括非欧几里得几何的存在性和公理体系的模型构造。这三章构成了从立体几何直觉到代数方法再到元数学反思的完整逻辑链条。
>
> **各章定理索引**：
>
> - **Ch 20**（立体几何）：线面平行/面面平行的判定与性质、线面垂直/面面垂直的判定与性质、三垂线定理及其逆定理、异面直线角/线面角/二面角、各种距离公式、棱柱/棱锥/棱台/圆柱/圆锥/圆台/球的体积与表面积、祖暅原理、欧拉公式。
> - **Ch 21**（向量）：平面向量运算与坐标、数量积与向量积、向量法判定平行垂直、向量法计算角度与距离、混合积、向量法证明勾股定理/余弦定理/正弦定理/中位线定理/斯图尔特定理/阿波罗尼奥斯定理。
> - **第23章**（几何基础与公理体系）：Hilbert公理体系的完备性与独立性、非欧几里得几何的模型构造、Gödel不完备性定理的几何意涵。

---


*卷三B：立体几何、向量与几何基础终。*


*卷三B：立体几何、向量与几何基础终。*


*卷三B：立体几何、向量与几何基础终。*


*卷三：几何终。*
