# 卷三B：立体几何、向量与几何基础

> 本卷将平面几何的结果推广到三维空间，建立立体几何的完整理论，并引入向量这一强有力的代数工具。第14章系统推导空间中线面关系的判定与性质、空间角与距离、以及简单几何体的体积与表面积；第15章建立平面向量和空间向量的运算体系，用向量方法统一处理立体几何中的平行、垂直、角度和距离问题；第16章探讨几何基础与公理体系的深层问题，包括非欧几里得几何和公理体系的完备性。

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
