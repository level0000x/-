/-
# 教材验证 V01：逻辑基础 (Logic)
> 对应教材第1-2章：命题逻辑与谓词逻辑

验证教材中关于逻辑等价律、推理规则和证明方法的陈述。
使用 mathlib4 中的逻辑基础。
-/

import Mathlib.Tactic

open Classical

namespace TextbookVerification.Logic

/-!
## 1. 命题逻辑等价律验证
教材 2.1.3 节：基本逻辑等价律
-/

-- 教材声称：双重否定律 ¬¬P ↔ P
-- 对应教材定理 2.1.3 节
theorem textbook_double_negation (P : Prop) : ¬¬P ↔ P := by
  constructor
  · intro hnnp; exact by_contra (fun np => hnnp np)
  · intro hp; intro hnp; exact hnp hp

-- 教材声称：幂等律 P ∧ P ↔ P
theorem textbook_and_idempotent (P : Prop) : P ∧ P ↔ P := by
  constructor
  · intro h; exact h.1
  · intro h; exact ⟨h, h⟩

-- 教材声称：交换律 P ∧ Q ↔ Q ∧ P
theorem textbook_and_comm (P Q : Prop) : P ∧ Q ↔ Q ∧ P := by
  constructor
  · intro ⟨hp, hq⟩; exact ⟨hq, hp⟩
  · intro ⟨hq, hp⟩; exact ⟨hp, hq⟩

-- 教材声称：分配律 P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R)
theorem textbook_and_or_distrib (P Q R : Prop) : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) := by
  constructor
  · intro ⟨hp, hqr⟩
    rcases hqr with (hq | hr)
    · exact Or.inl ⟨hp, hq⟩
    · exact Or.inr ⟨hp, hr⟩
  · intro h
    rcases h with (⟨hp, hq⟩ | ⟨hp, hr⟩)
    · exact ⟨hp, Or.inl hq⟩
    · exact ⟨hp, Or.inr hr⟩

-- 教材声称：蕴含等价 ¬P ∨ Q ↔ (P → Q)
-- 对应教材 2.1.5 节
theorem textbook_imp_equiv (P Q : Prop) : (¬P ∨ Q) ↔ (P → Q) := by
  constructor
  · intro h hp
    rcases h with (hnp | hq)
    · exact absurd hp hnp
    · exact hq
  · intro h
    by_cases hp : P
    · exact Or.inr (h hp)
    · exact Or.inl hp

/-!
## 2. 谓词逻辑验证
教材 2.2 节：量词性质
-/

-- 教材声称：∀x (P x ∧ Q x) → (∀x P x) ∧ (∀x Q x)
theorem textbook_forall_and {α : Type} (P Q : α → Prop) :
    (∀ x, P x ∧ Q x) → (∀ x, P x) ∧ (∀ x, Q x) := by
  intro h
  constructor
  · intro x; exact (h x).1
  · intro x; exact (h x).2

-- 教材声称：∃x (P x ∨ Q x) ↔ (∃x P x) ∨ (∃x Q x)
theorem textbook_exists_or {α : Type} (P Q : α → Prop) :
    (∃ x, P x ∨ Q x) ↔ (∃ x, P x) ∨ (∃ x, Q x) := by
  constructor
  · intro ⟨x, h⟩
    rcases h with (hp | hq)
    · exact Or.inl ⟨x, hp⟩
    · exact Or.inr ⟨x, hq⟩
  · intro h
    rcases h with (⟨x, hp⟩ | ⟨x, hq⟩)
    · exact ⟨x, Or.inl hp⟩
    · exact ⟨x, Or.inr hq⟩

-- 教材声称：¬(∀x P x) ↔ ∃x ¬P x（量词版本的 De Morgan 律）
theorem textbook_not_forall {α : Type} (P : α → Prop) :
    ¬(∀ x, P x) ↔ ∃ x, ¬P x := by
  constructor
  · intro h
    by_contra hne
    apply h
    intro x
    by_contra hnp
    apply hne
    exact ⟨x, hnp⟩
  · intro ⟨x, hnp⟩ hall
    apply hnp
    exact hall x

-- 教材声称：¬(∃x P x) ↔ ∀x ¬P x
theorem textbook_not_exists {α : Type} (P : α → Prop) :
    ¬(∃ x, P x) ↔ ∀ x, ¬P x := by
  constructor
  · intro h x hp; apply h; exact ⟨x, hp⟩
  · intro h ⟨x, hp⟩; exact h x hp

/-!
## 3. 证明方法验证
教材 2.3 节：假言推理、拒取式等
-/

-- 假言推理 (Modus Ponens)：P ∧ (P → Q) → Q
theorem textbook_modus_ponens (P Q : Prop) : P ∧ (P → Q) → Q := by
  intro ⟨hp, hpq⟩; exact hpq hp

-- 拒取式 (Modus Tollens)：(P → Q) ∧ ¬Q → ¬P
theorem textbook_modus_tollens (P Q : Prop) : (P → Q) ∧ ¬Q → ¬P := by
  intro ⟨hpq, hnq⟩ hp; apply hnq; exact hpq hp

-- 假言三段论：(P → Q) ∧ (Q → R) → (P → R)
theorem textbook_hyp_syllogism (P Q R : Prop) : (P → Q) ∧ (Q → R) → (P → R) := by
  intro ⟨hpq, hqr⟩ hp; apply hqr; exact hpq hp

-- 逆否命题等价性：(P → Q) ↔ (¬Q → ¬P)
theorem textbook_contrapositive (P Q : Prop) : (P → Q) ↔ (¬Q → ¬P) := by
  constructor
  · intro hpq hnq hp; apply hnq; exact hpq hp
  · intro hqn hp
    by_contra hnq
    apply hqn hnq; exact hp

/-!
## 4. 教材中关于排中律与双条件推理的验证
教材 2.1.4 节：排中律的应用
-/

-- 排中律：P ∨ ¬P（在经典逻辑中成立）
theorem textbook_excluded_middle (P : Prop) : P ∨ ¬P := by
  apply em

-- 反证法示例（教材 2.3.2 节）：√2 不是有理数
-- 使用 mathlib4 的标准结论
example : Irrational (Real.sqrt 2) := by
  exact irrational_sqrt_two

end TextbookVerification.Logic
