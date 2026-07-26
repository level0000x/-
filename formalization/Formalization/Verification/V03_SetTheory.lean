/-
# 教材验证 V03：集合论 (Set Theory)
> 对应教材第3章：集合的基本概念与 ZFC 公理

验证教材中关于集合论公理、运算和基本结论的陈述。
使用 mathlib4 的集合论库。
-/

import Mathlib.Data.Set.Basic
import Mathlib.Data.Set.Lattice
import Mathlib.Tactic

open Set

namespace TextbookVerification.SetTheory

/-!
## 1. 集合基本运算验证
教材 3.1 节：集合的基本概念
-/

-- 教材外延公理：两个集合相等当且仅当它们有相同元素
theorem textbook_extensionality {α : Type} (s t : Set α) : s = t ↔ ∀ x, x ∈ s ↔ x ∈ t :=
  Set.ext_iff

-- 教材定理 3.1.1：空集的唯一性
theorem textbook_empty_unique {α : Type} (s : Set α) (h : ∀ x : α, x ∉ s) : s = ∅ := by
  ext x; simp [h x]

-- 教材 3.2.1：子集关系
theorem textbook_subset_def {α : Type} (A B : Set α) : A ⊆ B ↔ ∀ x, x ∈ A → x ∈ B := by
  rfl

-- 教材 3.2.2：子集的反身性
theorem textbook_subset_refl {α : Type} (A : Set α) : A ⊆ A :=
  Set.Subset.refl A

-- 教材 3.2.3：子集的传递性
theorem textbook_subset_trans {α : Type} {A B C : Set α} (h1 : A ⊆ B) (h2 : B ⊆ C) : A ⊆ C :=
  Set.Subset.trans h1 h2

/-!
## 2. 集合运算验证
教材 3.2 节：并、交、差、幂集
-/

-- 教材定义 3.2.1：并集
theorem textbook_union_def {α : Type} (A B : Set α) (x : α) : x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B := by
  simp

-- 教材定义 3.2.2：交集
theorem textbook_inter_def {α : Type} (A B : Set α) (x : α) : x ∈ A ∩ B ↔ x ∈ A ∧ x ∈ B := by
  simp

-- 教材定义 3.2.3：差集
theorem textbook_diff_def {α : Type} (A B : Set α) (x : α) : x ∈ A \ B ↔ x ∈ A ∧ x ∉ B := by
  simp

-- 教材定理 3.2.1：De Morgan 律 (A ∪ B)^c = A^c ∩ B^c
theorem textbook_de_morgan_union {α : Type} (A B : Set α) : (A ∪ B)ᶜ = Aᶜ ∩ Bᶜ := by
  ext x; simp

-- 教材定理 3.2.2：De Morgan 律 (A ∩ B)^c = A^c ∪ B^c
theorem textbook_de_morgan_inter {α : Type} (A B : Set α) : (A ∩ B)ᶜ = Aᶜ ∪ Bᶜ := by
  ext x; simp

-- 教材定理 3.2.3：分配律 A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C)
theorem textbook_distrib_inter_union {α : Type} (A B C : Set α) : A ∩ (B ∪ C) = (A ∩ B) ∪ (A ∩ C) := by
  ext x; simp [and_or_distrib_left]

-- 教材定理 3.2.4：分配律 A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C)
theorem textbook_distrib_union_inter {α : Type} (A B C : Set α) : A ∪ (B ∩ C) = (A ∪ B) ∩ (A ∪ C) := by
  ext x; simp [or_and_distrib_left]

/-!
## 3. 笛卡尔积与关系验证
教材 3.3 节：笛卡尔积、关系
-/

-- 教材定义 3.3.1：笛卡尔积
theorem textbook_prod_def {α β : Type} (A : Set α) (B : Set β) (x : α) (y : β) :
    (x, y) ∈ A ×ˢ B ↔ x ∈ A ∧ y ∈ B := by
  simp

-- 教材定义 3.3.2：关系的定义
def Relation (α β : Type) := Set (α × β)

-- 教材定义 3.3.3：等价关系的三公理
structure EquivalenceRelation (α : Type) where
  R : α → α → Prop
  refl : ∀ a, R a a
  symm : ∀ a b, R a b → R b a
  trans : ∀ a b c, R a b → R b c → R a c

-- 教材定理 3.3.1：等价关系给出集合的划分
-- 验证等价类的性质

/-!
## 4. 函数验证
教材 3.4 节：函数的定义与性质
-/

-- 教材定义 3.4.1：单射
theorem textbook_injective_def {α β : Type} (f : α → β) : Function.Injective f ↔ ∀ a₁ a₂, f a₁ = f a₂ → a₁ = a₂ := by
  rfl

-- 教材定义 3.4.2：满射
theorem textbook_surjective_def {α β : Type} (f : α → β) : Function.Surjective f ↔ ∀ b, ∃ a, f a = b := by
  rfl

-- 教材定义 3.4.3：双射
theorem textbook_bijective_def {α β : Type} (f : α → β) : Function.Bijective f ↔
    Function.Injective f ∧ Function.Surjective f := by
  constructor
  · intro h; exact ⟨h.1, h.2⟩
  · intro ⟨hinj, hsurj⟩; exact ⟨hinj, hsurj⟩

-- 教材定理 3.4.1：函数复合的结合律
theorem textbook_comp_assoc {α β γ δ : Type} (f : α → β) (g : β → γ) (h : γ → δ) :
    (h ∘ g) ∘ f = h ∘ (g ∘ f) := by
  rfl

/-!
## 5. 序数与基数验证
教材 3.5-3.6 节：序数与基数的基本性质
-/

-- 教材定理 3.5.1：Cantor 定理（教材 3.6.3 节）
-- |A| < |𝒫(A)|
theorem textbook_cantor {α : Type} : Cardinal.mk α < Cardinal.mk (Set α) :=
  Cantor.cantor (Cardinal.mk α)

-- 教材引理：无限集合存在可数无穷子集（依赖于选择公理）
-- 教材中称这个结论来自选择公理

end TextbookVerification.SetTheory
