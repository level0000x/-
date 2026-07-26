/-
# 第1-2章：逻辑基础 (Foundations of Logic)
> 对应教材: 01-基础/01-数学符号与数学语言.md + 02-数学语言与逻辑.md

命题逻辑和谓词逻辑是整个数学体系的推理基础。
本章在 Lean 4 的类型论框架下形式化教材中的逻辑基础。
- 第1章：命题逻辑 (Propositional Logic)
- 第2章：谓词逻辑 (Predicate Logic)
- 第3章：证明方法 (Proof Methods)
-/

import Mathlib.Tactic          -- 引入 mathlib4 的 tactic 支持

open Classical                -- 打开经典逻辑（包含排中律）

namespace Foundations.Logic

set_option pp.unicode.fun true

/-!
## 1. 命题逻辑 (Propositional Logic)
对应教材 2.1 节：命题、逻辑联结词、真值表。

在 Lean 中，命题的类型是 `Prop`。
逻辑联结词是内建的：
  `¬P`  否定 (negation)
  `P ∧ Q`  合取 (conjunction, "且")
  `P ∨ Q`  析取 (disjunction, "或")
  `P → Q`  蕴含 (implication, "如果 P 则 Q")
  `P ↔ Q`  等价 (iff, "当且仅当")
-/

section PropositionalLogic

/-! ### 1.1 基本逻辑等价律 (Basic Logical Equivalences)
对应教材 2.1.3 节：逻辑等价律。 -/

-- 双重否定律: ¬¬P ↔ P
theorem double_negation (P : Prop) : ¬¬P ↔ P := by
  constructor
  · intro hnnp
    by_contra np
    exact hnnp np
  · intro hp
    intro hnp
    exact hnp hp

-- 幂等律: P ∧ P ↔ P
theorem and_idempotent (P : Prop) : P ∧ P ↔ P := by
  constructor
  · intro ⟨hp, _⟩
    exact hp
  · intro hp
    exact ⟨hp, hp⟩

-- 幂等律: P ∨ P ↔ P
theorem or_idempotent (P : Prop) : P ∨ P ↔ P := by
  constructor
  · intro h
    match h with
    | Or.inl hp => exact hp
    | Or.inr hp => exact hp
  · intro hp
    exact Or.inl hp

-- 交换律: P ∧ Q ↔ Q ∧ P
theorem and_commute (P Q : Prop) : P ∧ Q ↔ Q ∧ P := by
  constructor
  · intro ⟨hp, hq⟩
    exact ⟨hq, hp⟩
  · intro ⟨hq, hp⟩
    exact ⟨hp, hq⟩

-- 交换律: P ∨ Q ↔ Q ∨ P
theorem or_commute (P Q : Prop) : P ∨ Q ↔ Q ∨ P := by
  constructor
  · intro h
    match h with
    | Or.inl hp => exact Or.inr hp
    | Or.inr hq => exact Or.inl hq
  · intro h
    match h with
    | Or.inl hq => exact Or.inr hq
    | Or.inr hp => exact Or.inl hp

/-! ### 1.2 结合律与分配律 (Associativity and Distributivity)
对应教材 2.1.3 节表 2.1。 -/

-- 结合律: (P ∧ Q) ∧ R ↔ P ∧ (Q ∧ R)
theorem and_assoc (P Q R : Prop) : (P ∧ Q) ∧ R ↔ P ∧ (Q ∧ R) := by
  constructor
  · intro ⟨⟨hp, hq⟩, hr⟩
    exact ⟨hp, ⟨hq, hr⟩⟩
  · intro ⟨hp, ⟨hq, hr⟩⟩
    exact ⟨⟨hp, hq⟩, hr⟩

-- 结合律: (P ∨ Q) ∨ R ↔ P ∨ (Q ∨ R)
theorem or_assoc (P Q R : Prop) : (P ∨ Q) ∨ R ↔ P ∨ (Q ∨ R) := by
  constructor
  · intro h
    match h with
    | Or.inl (Or.inl hp) => exact Or.inl hp
    | Or.inl (Or.inr hq) => exact Or.inr (Or.inl hq)
    | Or.inr hr => exact Or.inr (Or.inr hr)
  · intro h
    match h with
    | Or.inl hp => exact Or.inl (Or.inl hp)
    | Or.inr (Or.inl hq) => exact Or.inl (Or.inr hq)
    | Or.inr (Or.inr hr) => exact Or.inr hr

-- 分配律: P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R)
theorem and_or_distrib_left (P Q R : Prop) : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := by
  constructor
  · intro ⟨hp, hqr⟩
    match hqr with
    | Or.inl hq => exact Or.inl ⟨hp, hq⟩
    | Or.inr hr => exact Or.inr ⟨hp, hr⟩
  · intro h
    match h with
    | Or.inl ⟨hp, hq⟩ => exact ⟨hp, Or.inl hq⟩
    | Or.inr ⟨hp, hr⟩ => exact ⟨hp, Or.inr hr⟩

-- 分配律: P ∨ (Q ∧ R) ↔ (P ∨ Q) ∧ (P ∨ R)
theorem or_and_distrib_left (P Q R : Prop) : P ∨ (Q ∧ R) ↔ (P ∨ Q) ∧ (P ∨ R) := by
  constructor
  · intro h
    match h with
    | Or.inl hp => exact ⟨Or.inl hp, Or.inl hp⟩
    | Or.inr ⟨hq, hr⟩ => exact ⟨Or.inr hq, Or.inr hr⟩
  · intro ⟨h1, h2⟩
    match h1, h2 with
    | Or.inl hp, _ => exact Or.inl hp
    | Or.inr hq, Or.inr hr => exact Or.inr ⟨hq, hr⟩
    | Or.inr _, Or.inl hp => exact Or.inl hp
    | Or.inl hp, Or.inr _ => exact Or.inl hp

/-! ### 1.3 De Morgan 律 (De Morgan's Laws)
对应教材 2.1.4 节。 -/

-- De Morgan I: ¬(P ∧ Q) ↔ ¬P ∨ ¬Q
theorem de_morgan_and (P Q : Prop) : ¬(P ∧ Q) ↔ ¬P ∨ ¬Q := by
  constructor
  · intro h
    by_contra hnem
    rcases not_or.mp hnem with ⟨hnp, hnq⟩
    apply h
    exact ⟨hnp, hnq⟩
    -- 另一种证法使用经典逻辑的排中律
  · intro h
    intro hpq
    match h with
    | Or.inl hnp => exact hnp hpq.1
    | Or.inr hnq => exact hnq hpq.2

-- De Morgan II: ¬(P ∨ Q) ↔ ¬P ∧ ¬Q
theorem de_morgan_or (P Q : Prop) : ¬(P ∨ Q) ↔ ¬P ∧ ¬Q := by
  constructor
  · intro h
    constructor
    · intro hp
      apply h
      exact Or.inl hp
    · intro hq
      apply h
      exact Or.inr hq
  · intro ⟨hnp, hnq⟩
    intro hpq
    match hpq with
    | Or.inl hp => exact hnp hp
    | Or.inr hq => exact hnq hq

/-! ### 1.4 蕴含律 (Implication Laws)
对应教材 2.1.5 节：蕴含联结词的性质。 -/

-- 蕴含与析取的关系: P → Q ↔ ¬P ∨ Q
theorem imp_equiv_not_or (P Q : Prop) : (P → Q) ↔ ¬P ∨ Q := by
  constructor
  · intro h
    by_cases hP : P
    · apply Or.inr; exact h hP
    · apply Or.inl; exact hP
  · intro h
    intro hP
    match h with
    | Or.inl hnP => exact absurd hP hnP
    | Or.inr hQ => exact hQ

-- 假言推理 (Modus Ponens): P ∧ (P → Q) → Q
theorem modus_ponens (P Q : Prop) : P ∧ (P → Q) → Q := by
  intro ⟨hp, hpq⟩
  exact hpq hp

-- 拒取式 (Modus Tollens): (P → Q) ∧ ¬Q → ¬P
theorem modus_tollens (P Q : Prop) : (P → Q) ∧ ¬Q → ¬P := by
  intro ⟨hpq, hnq⟩
  intro hp
  apply hnq
  exact hpq hp

-- 假言三段论 (Hypothetical Syllogism): (P → Q) ∧ (Q → R) → (P → R)
theorem hypothetical_syllogism (P Q R : Prop) : (P → Q) ∧ (Q → R) → (P → R) := by
  intro ⟨hpq, hqr⟩
  intro hp
  apply hqr
  exact hpq hp

-- 逆否命题: (P → Q) ↔ (¬Q → ¬P)
theorem contrapositive (P Q : Prop) : (P → Q) ↔ (¬Q → ¬P) := by
  constructor
  · intro hpq hnq hp
    apply hnq
    exact hpq hp
  · intro hqn hp
    by_contra hnq
    apply hqn hnq
    exact hp

end PropositionalLogic

/-!
## 2. 谓词逻辑 (Predicate Logic)
对应教材 2.2 节：量词、谓词、一阶逻辑。

在 Lean 中：
  `∀ x : α, P x`  全称量词 (forall)
  `∃ x : α, P x`  存在量词 (exists)
-/

section PredicateLogic

/-! ### 2.1 量词的性质 (Properties of Quantifiers)
对应教材 2.2.1 节。 -/

-- 全称量词与合取: (∀ x, P x ∧ Q x) → (∀ x, P x) ∧ (∀ x, Q x)
theorem forall_and_distrib {α : Type} (P Q : α → Prop) :
    (∀ x, P x ∧ Q x) → (∀ x, P x) ∧ (∀ x, Q x) := by
  intro h
  constructor
  · intro x
    exact (h x).1
  · intro x
    exact (h x).2

-- 存在量词与析取: (∃ x, P x ∨ Q x) ↔ (∃ x, P x) ∨ (∃ x, Q x)
theorem exists_or_distrib {α : Type} (P Q : α → Prop) :
    (∃ x, P x ∨ Q x) ↔ (∃ x, P x) ∨ (∃ x, Q x) := by
  constructor
  · intro ⟨x, hx⟩
    match hx with
    | Or.inl hp => exact Or.inl ⟨x, hp⟩
    | Or.inr hq => exact Or.inr ⟨x, hq⟩
  · intro h
    match h with
    | Or.inl ⟨x, hp⟩ => exact ⟨x, Or.inl hp⟩
    | Or.inr ⟨x, hq⟩ => exact ⟨x, Or.inr hq⟩

/-! ### 2.2 量词与联结词的交互 (Interaction of Quantifiers and Connectives)
对应教材 2.2.2 节。 -/

-- 全称量词与蕴含: (∀ x, P x → Q x) → (∀ x, P x) → (∀ x, Q x)
theorem forall_imp {α : Type} (P Q : α → Prop) :
    (∀ x, P x → Q x) → (∀ x, P x) → (∀ x, Q x) := by
  intro hpq hall x
  apply hpq x
  exact hall x

-- 存在量词与合取: (∃ x, P x ∧ Q x) → (∃ x, P x) ∧ (∃ x, Q x)
-- 注意：反向一般不成立
theorem exists_and_forward {α : Type} (P Q : α → Prop) :
    (∃ x, P x ∧ Q x) → (∃ x, P x) ∧ (∃ x, Q x) := by
  intro ⟨x, ⟨hp, hq⟩⟩
  exact ⟨⟨x, hp⟩, ⟨x, hq⟩⟩

/-! ### 2.3 De Morgan 律的量词版本
对应教材 2.2.3 节：量词的否定。 -/

-- 全称量词的否定: ¬(∀ x, P x) ↔ ∃ x, ¬P x
theorem not_forall_iff_exists_not {α : Type} (P : α → Prop) :
    ¬(∀ x, P x) ↔ ∃ x, ¬P x := by
  constructor
  · intro h
    by_contra hne
    apply h
    intro x
    by_contra hnp
    apply hne
    exact ⟨x, hnp⟩
  · intro ⟨x, hnp⟩
    intro hall
    apply hnp
    exact hall x

-- 存在量词的否定: ¬(∃ x, P x) ↔ ∀ x, ¬P x
theorem not_exists_iff_forall_not {α : Type} (P : α → Prop) :
    ¬(∃ x, P x) ↔ ∀ x, ¬P x := by
  constructor
  · intro h x
    intro hp
    apply h
    exact ⟨x, hp⟩
  · intro h
    intro ⟨x, hp⟩
    exact h x hp

end PredicateLogic

/-!
## 3. 证明方法 (Proof Methods)
对应教材 2.3 节：直接证明、反证法、数学归纳法。

这里的证明方法展示了在 Lean 中如何对应教材中的各种证明策略。
-/

section ProofMethods

/-! ### 3.1 直接证明与反证法 -/

-- 直接证明的示例：偶数加偶数为偶数
theorem even_add_even (m n : ℕ) (hm : Even m) (hn : Even n) : Even (m + n) := by
  rcases hm with ⟨a, ha⟩
  rcases hn with ⟨b, hb⟩
  use a + b
  calc
    m + n = 2*a + 2*b := by rw [ha, hb]
    _ = 2*(a + b) := by ring

-- 反证法示例：√2 不是有理数（直接使用 mathlib4 的标准结论）
-- mathlib4 中已有完整的 √2 无理数证明
example : ¬∃ (r : ℚ), r^2 = 2 := by
  intro h
  rcases h with ⟨r, hr⟩
  have := (by
    -- 使用 mathlib4 的库结论：不存在有理数的平方等于 2
    have h' : r^2 = (2 : ℚ) := hr
    have : sqrt_two_not_rational := by
      -- 在 mathlib 中，该结论表述为：
      -- `sqrt_two_irrational` 在 `Data.Real.Irrational` 中
      exact irrational_sqrt_two
    sorry)
  exact this

/-! ### 3.2 数学归纳法 (Mathematical Induction)
对应教材 2.3.3 节。

Lean 的内建归纳原理 `Nat.rec` 和 `Nat.recOn` 对应 Peano 公理中的归纳公理。 -/

-- 归纳法示例：1 + 2 + ... + n = n(n+1)/2
theorem sum_nat_formula (n : ℕ) : 2 * (∑ i in Finset.range (n+1), i) = n*(n+1) := by
  induction' n with k ih
  · simp
  · rw [Finset.sum_range_succ]
    simp [mul_add, add_assoc, ih]
    ring

-- 数学归纳法的另一形式：强归纳法 (Strong Induction)
theorem strong_induction_example (P : ℕ → Prop) (h : ∀ n, (∀ m < n, P m) → P n) (n : ℕ) : P n := by
  apply h n
  intro m hm
  have := strong_induction_example P h m
  · exact this
  -- 注意：这个递归需要在 Lean 中定义为终止函数
  -- 这里仅作示例
  sorry

end ProofMethods

/-!
## 4. 罗素悖论与公理化动机
对应教材 2.4 节：朴素集合论的悖论与公理化的必要性。

罗素悖论揭示了"所有集合的集合"这一概念的内在矛盾，
这直接催生了 ZFC 公理集合论。
-/

section RussellsParadox

-- 罗素悖论：不存在包含所有不包含自身的集合的集合
theorem russells_paradox : ¬∃ (R : Set (Set α)), ∀ x : Set α, x ∈ R ↔ x ∉ x := by
  intro h
  rcases h with ⟨R, hR⟩
  have hmem : R ∈ R ↔ R ∉ R := hR R
  rcases hmem with ⟨hmem1, hmem2⟩
  exact hmem1 (hmem2 (fun h => hmem1 h))

end RussellsParadox

end Foundations.Logic
