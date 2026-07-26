/-
# 第5-7章：数系构造 (Construction of Number Systems)
> 对应教材: 01-基础/02-集合与数系/02-数系构造.md

从集合论公理出发，逐层构造数系：
1. 自然数 ℕ（Peano 公理 / von Neumann 序数）
2. 整数 ℤ（自然数对的等价类）
3. 有理数 ℚ（整数的比例）
4. 实数 ℝ（Dedekind 分割 / Cauchy 序列）
5. 复数 ℂ（实数对）
-/

import Mathlib.Tactic
import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Basic
import Mathlib.Data.Nat.Basic
import Mathlib.Data.Int.Basic
import Mathlib.Data.Rat.Basic

open Set

namespace Foundations.NumberSystems

set_option pp.unicode.fun true

/-!
## 第5章：自然数 (Natural Numbers)
对应教材：集合论 → 自然数的构造

### 5.1 Peano 公理
Peano 公理是自然数的公理化定义：
1. 0 是自然数
2. 每个自然数 n 有后继 S(n)
3. S 是单射
4. 0 不是任何数的后继
5. 归纳公理

在 ZFC 中，自然数通过 von Neumann 序数构造：
  0 := ∅
  1 := {0} = {∅}
  2 := {0, 1} = {∅, {∅}}
  n := {0, 1, ..., n-1}

在 Lean 中，ℕ 是内建的类型，其归纳原理对应 Peano 公理。
-/

-- Peano 公理的 Lean 表述
#check Nat.zero_lt_succ  -- 0 < S(n)
#check Nat.succ_injective  -- S 是单射
#check Nat.rec  -- 归纳原理

-- von Neumann 序数构造示意
def vonNeumann (n : ℕ) : Set ℕ :=
  Finset.range n

-- 示例：von Neumann 序数
example : vonNeumann 0 = (∅ : Set ℕ) := by
  ext x; simp [vonNeumann]

example : vonNeumann 3 = {0, 1, 2} := by
  ext x; simp [vonNeumann]; omega

/-! ### 5.2 自然数上的运算
对应教材 4.1 节：加法、乘法、序结构。
-/

-- 加法结合律：教材 4.1.1 节
theorem add_assoc_nat (a b c : ℕ) : (a + b) + c = a + (b + c) :=
  Nat.add_assoc _ _ _

-- 加法交换律：教材 4.1.1 节
theorem add_comm_nat (a b : ℕ) : a + b = b + a :=
  Nat.add_comm _ _

-- 乘法分配律：教材 4.1.2 节
theorem mul_add_nat (a b c : ℕ) : a * (b + c) = a * b + a * c :=
  Nat.mul_add _ _ _

-- 自然数的序：教材 4.2 节
theorem nat_order_total (a b : ℕ) : a ≤ b ∨ b ≤ a :=
  Nat.le_total _ _

/-!
## 第6章：整数 (Integers)
对应教材：数系构造 → 整数

整数通过自然数对 (a, b) 的等价类构造：
  (a, b) ~ (c, d) 当且仅当 a + d = b + c
整数 a - b 对应等价类 [(a, b)]。
-/

-- 整数环的性质：教材 5.1 节
theorem int_add_comm (a b : ℤ) : a + b = b + a :=
  Int.add_comm _ _

theorem int_mul_assoc (a b c : ℤ) : (a * b) * c = a * (b * c) :=
  Int.mul_assoc _ _

-- 整数的序：教材 5.2 节
theorem int_mul_pos (a b : ℤ) (ha : 0 < a) (hb : 0 < b) : 0 < a * b := by
  exact mul_pos ha hb

/-!
## 第7章：有理数 (Rational Numbers)
对应教材：数系构造 → 有理数

有理数通过整数对 (a, b)（b ≠ 0）的等价类构造：
  (a, b) ~ (c, d) 当且仅当 a*d = b*c
有理数 a/b 对应等价类 [(a, b)]。
-/

-- 有理数的域结构：教材 6.1 节
theorem rat_add_comm (a b : ℚ) : a + b = b + a := by
  exact add_comm _ _

theorem rat_mul_comm (a b : ℚ) : a * b = b * a := by
  exact mul_comm _ _

-- 有理数的序与密度：教材 6.2 节
theorem rat_dense (a b : ℚ) (h : a < b) : ∃ c : ℚ, a < c ∧ c < b := by
  refine ⟨(a + b) / 2, ?_, ?_⟩
  · linarith
  · linarith

/-!
## 第8章：实数 (Real Numbers)
对应教材：数系构造 → 实数

实数有两种标准构造方式：
1. Dedekind 分割：R 是有理数集的"分割"
2. Cauchy 序列：R 是有理数 Cauchy 序列的等价类

### 8.1 实数的序完备性
-/

-- 实数的域结构：教材 7.1 节
theorem real_add_comm (a b : ℝ) : a + b = b + a := by
  exact add_comm _ _

-- 实数的完备性（上确界性质）：教材 7.2 节
-- 每个非空有上界的实数子集必有上确界
theorem real_completeness (S : Set ℝ) (hne : S.Nonempty) (hbdd : ∃ ub, ∀ x ∈ S, x ≤ ub) :
    ∃ sup, ∀ x, x ∈ S → x ≤ sup ∧ ∀ y, (∀ x ∈ S, x ≤ y) → sup ≤ y := by
  -- 使用 mathlib4 的完备性定理
  rcases hne with ⟨x, hx⟩
  rcases hbdd with ⟨ub, hub⟩
  have := exists_supₛ Real.sSup S hne hbdd
  sorry

-- 实数与有理数的关系（稠密性）：教材 7.3 节
theorem real_dense (a b : ℝ) (h : a < b) : ∃ q : ℚ, a < (q : ℝ) ∧ (q : ℝ) < b := by
  exact exists_rat_btwn h

/-!
### 8.2 Dedekind 分割构造的示意

Dedekind 分割是有理数集 ℚ 的一个子集 A，满足：
1. A 非空且 A ≠ ℚ
2. 若 r ∈ A 且 s < r，则 s ∈ A（向下封闭）
3. A 没有最大元
-/

structure DedekindCut where
  A : Set ℚ
  nonempty : A.Nonempty
  not_all : ∃ r : ℚ, r ∉ A
  down_closed : ∀ r s, r ∈ A → s < r → s ∈ A
  no_max : ∀ r ∈ A, ∃ s ∈ A, r < s

/-!
## 第9章：复数 (Complex Numbers)
对应教材：数系构造 → 复数

复数 ℂ 定义为 ℝ² 配上乘法 (a,b)(c,d) = (ac - bd, ad + bc)。
-/

-- 复数的域结构：教材 8.1 节
theorem complex_add_comm (a b : ℂ) : a + b = b + a := by
  exact add_comm _ _

theorem complex_mul_comm (a b : ℂ) : a * b = b * a := by
  exact mul_comm _ _

-- 虚数单位 i = √-1
example : (I : ℂ)^2 = -1 := by
  simp [Complex.I]

-- 代数基本定理（陈述）：每个非常数复系数多项式都有根
theorem fundamental_theorem_of_algebra' (f : ℂ[X]) (hf : f.degree ≥ 1) : ∃ z : ℂ, f.eval z = 0 := by
  -- 使用 mathlib4 中代数基本定理
  exact Polynomial.exists_root hf

end Foundations.NumberSystems
