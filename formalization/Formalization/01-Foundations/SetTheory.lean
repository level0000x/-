/-
# 第3-4章：公理集合论 (Axiomatic Set Theory)
> 对应教材: 01-基础/02-集合与数系/01-集合论.md

ZFC 公理集合论是整个数学大厦的基石。
本章在 Lean 中形式化 ZFC 公理体系及基本推论。
- 外延公理
- 配对公理
- 并集公理
- 幂集公理
- 子集公理（分离公理模式）
- 无穷公理
- 正则公理
- 替换公理模式
- 选择公理
-/

import Mathlib.SetTheory.ZFC.Basic
import Mathlib.Tactic

open Set
open Classical

namespace Foundations.SetTheory

set_option pp.unicode.fun true

/-!
## 第3章：集合的基本概念
对应教材 3.1 节：集合、属于关系、外延公理。

在 ZFC 中，`∈` 是唯一原始谓词，所有数学对象都是集合。
mathlib4 使用类型论而非 ZFC 作为基础，但提供了 `ZFSet` 作为 ZFC 集合的模型。
内置的 `Set α` 则是类型 α 上的子集。
-/

section BasicConcepts

/-! ### 3.1 外延公理 (Axiom of Extensionality)
> 教材 3.1.3 节

外延公理：两个集合相等当且仅当它们有完全相同的元素。
这是集合论最基本的原理：集合由其元素唯一确定。
-/

-- 外延公理在 Set 类型中表示为 Set.ext_iff
#check (Set.ext_iff : ∀ {α} {s t : Set α}, s = t ↔ ∀ x, x ∈ s ↔ x ∈ t)

-- 用 Lean 表述外延公理：s = t ↔ (∀ x, x ∈ s ↔ x ∈ t)
theorem extensionality {α : Type} (s t : Set α) : s = t ↔ ∀ x : α, x ∈ s ↔ x ∈ t :=
  Set.ext_iff

-- 示例：{1, 2} = {2, 1}（外延公理的应用）
example : ({1, 2} : Set ℕ) = ({2, 1} : Set ℕ) := by
  ext x; simp

/-! ### 3.2 空集公理 (Empty Set)
> 教材 3.1.3 节

空集是不含任何元素的集合，记为 ∅ 或 {}。
空集公理断言存在一个不含任何元素的集合。
-/

-- 空集
#check (∅ : Set ℕ)

theorem empty_set_no_element {α : Type} (x : α) : x ∉ (∅ : Set α) := by
  simp

-- 空集是唯一的
theorem empty_set_unique {α : Type} (s : Set α) (h : ∀ x : α, x ∉ s) : s = ∅ := by
  ext x; simp [h x]

/-! ### 3.3 配对公理 (Axiom of Pairing)
> 教材 3.1.4 节

配对公理：对任意集合 a, b，存在集合 {a, b} 恰好包含 a 和 b。
-/

-- 配对: {a, b}
example : ({1, 2} : Set ℕ) = {1, 2} := rfl

theorem pair_mem {α : Type} (a b x : α) : x ∈ ({a, b} : Set α) ↔ x = a ∨ x = b := by
  simp

-- 有序对 (a, b) 的 Kuratowski 定义：{{a}, {a, b}}
def orderedPair (a b : ℕ) : Set (Set ℕ) :=
  {{a}, {a, b}}

theorem orderedPair_inj {a b c d : ℕ} (h : orderedPair a b = orderedPair c d) : a = c ∧ b = d := by
  -- 有序对唯一的证明需要仔细处理几种情况
  sorry

/-! ### 3.4 子集公理 (Axiom Schema of Separation)
> 教材 3.2.1 节

子集公理模式：对任意集合 A 和性质 P(x)，存在集合 {x ∈ A | P(x)}。
-/

-- 子集构造: {x ∈ A | P(x)}
theorem mem_sep {α : Type} (A : Set α) (P : α → Prop) (x : α) :
    x ∈ {x ∈ A | P x} ↔ x ∈ A ∧ P x := by
  simp

-- 交运算：A ∩ B = {x ∈ A | x ∈ B}
theorem inter_def {α : Type} (A B : Set α) : A ∩ B = {x ∈ A | x ∈ B} := by
  ext x; simp

-- 差运算：A \ B = {x ∈ A | x ∉ B}
theorem diff_def {α : Type} (A B : Set α) : A \ B = {x ∈ A | x ∉ B} := by
  ext x; simp

/-! ### 3.5 并集公理 (Axiom of Union)
> 教材 3.2.2 节

并集公理：对任意集合 A，存在 ∪A = {x | ∃ y ∈ A, x ∈ y}。
-/

-- 并集: ⋃₀ A
example (A : Set (Set ℕ)) (x : ℕ) : x ∈ ⋃₀ A ↔ ∃ s ∈ A, x ∈ s := by
  simp

-- 两集合的并：A ∪ B
example (A B : Set ℕ) (x : ℕ) : x ∈ A ∪ B ↔ x ∈ A ∨ x ∈ B := by
  simp

/-! ### 3.6 幂集公理 (Axiom of Power Set)
> 教材 3.2.3 节

幂集公理：对任意集合 A，存在 𝒫(A) = {x | x ⊆ A}。
-/

-- 幂集: 𝒫 A
theorem powerset_def {α : Type} (A : Set α) (x : Set α) : x ∈ 𝒫 A ↔ x ⊆ A := by
  simp

-- 幂集的基本性质：A ⊆ B → 𝒫(A) ⊆ 𝒫(B)
theorem powerset_mono {α : Type} {A B : Set α} (h : A ⊆ B) : 𝒫 A ⊆ 𝒫 B := by
  intro x hx; simp; exact hx.trans h

end BasicConcepts

/-!
## 第4章：关系与函数
对应教材 3.3-3.4 节：集合上的关系与函数。
-/

section RelationsAndFunctions

/-! ### 4.1 关系 (Relations)
> 教材 3.3 节

关系是 Descartes 积的子集。
等价关系与偏序是两种最重要的关系类型。
-/

-- 关系的定义：α × β 的子集
def Relation (α β : Type) := Set (α × β)

-- 等价关系的定义
structure EquivalenceRelation (α : Type) where
  R : α → α → Prop
  refl : ∀ a, R a a
  symm : ∀ a b, R a b → R b a
  trans : ∀ a b c, R a b → R b c → R a c

-- 等价类
def equivalenceClass {α : Type} (R : α → α → Prop) (a : α) : Set α :=
  {b | R a b}

-- 偏序关系的定义
structure PartialOrder (α : Type) where
  le : α → α → Prop
  refl : ∀ a, le a a
  antisymm : ∀ a b, le a b → le b a → a = b
  trans : ∀ a b c, le a b → le b c → le a c

/-! ### 4.2 函数 (Functions)
> 教材 3.4 节

函数是满足"单值性"的二元关系。
在 ZFC 中，函数 f : A → B 是 A × B 的子集，
满足：∀ a ∈ A, ∃! b ∈ B, (a, b) ∈ f。
-/

-- 函数的 ZFC 定义
structure ZFCFunction (A B : Set ℕ) where
  graph : Set (ℕ × ℕ)
  dom : graph.Domain ⊆ A
  ran : graph.Range ⊆ B
  functional : ∀ x, ∀ y₁ y₂, (x, y₁) ∈ graph → (x, y₂) ∈ graph → y₁ = y₂

-- 单射
def Injective (f : α → β) : Prop :=
  ∀ a₁ a₂, f a₁ = f a₂ → a₁ = a₂

-- 满射
def Surjective (A B : Set α) (f : α → α) : Prop :=
  ∀ b ∈ B, ∃ a ∈ A, f a = b

-- 双射
def Bijective (A B : Set α) (f : α → α) : Prop :=
  Injective f ∧ Surjective A B f

end RelationsAndFunctions

/-!
## 第5章：序数与基数
对应教材 3.5-3.6 节：序数与基数的基本理论。

在 ZFC 中，序数是传递集合且在 ∈ 下构成良序。
自然数是最小的序数（有限序数），ω = ℕ 是第一个无穷序数。
-/

section OrdinalsAndCardinals

/-! ### 5.1 良序 (Well-orders)
> 教材 3.5.1 节

偏序 (A, <) 称为良序，若 A 的每个非空子集都有最小元。
所有序数在 ∈ 下构成良序类。
-/

-- 良序的定义
structure WellOrder (α : Type) where
  lt : α → α → Prop
  trans : ∀ a b c, lt a b → lt b c → lt a c
  trichotomy : ∀ a b, lt a b ∨ a = b ∨ lt b a
  wellFounded : ∀ (s : Set α), s.Nonempty → ∃ m ∈ s, ∀ x ∈ s, ¬lt x m

/-! ### 5.2 序数 (Ordinals)
> 教材 3.6.1 节

序数是 ZFC 中最重要的概念之一，它推广了自然数的计数功能到超限领域。
-/

-- 在 Lean 中，`Ordinal` 是序数的类型
#check Ordinal

-- 序数的基本运算
#check (Ordinal.add : Ordinal → Ordinal → Ordinal)
#check (Ordinal.mul : Ordinal → Ordinal → Ordinal)

-- 自然数作为序数嵌入
example : ℕ → Ordinal :=
  (fun n : ℕ => (n : Ordinal))

-- 第一个无穷序数 ω
#check (Ordinal.omega : Ordinal)

/-! ### 5.3 基数 (Cardinals)
> 教材 3.6.2 节

基数是集合"大小"的度量，两个集合有相同的基数当且仅当它们之间存在双射。
-/

-- 在 Lean 中，`Cardinal` 是基数的类型
#check Cardinal

-- 无穷基数 ℵ₀
#check (Cardinal.aleph0 : Cardinal)

-- Cantor 定理：|A| < |𝒫(A)|
theorem cantor_theorem (α : Type) : Cardinal.mk α < Cardinal.mk (Set α) := by
  -- 使用 mathlib4 的 Cantor 定理
  exact Cardinal.cantor (Cardinal.mk α)

/-! ### 5.4 选择公理 (Axiom of Choice)
> 教材 3.6.4 节

选择公理是 ZFC 中最有争议但最有用的公理。
在 Lean 中，选择公理通过 `Classical.choice` 或 `choose` 使用。
-/

-- 选择公理的等价形式：Zorn 引理
theorem zorn_lemma_example {α : Type} [PartialOrder α]
    (h : ∀ c : Set α, IsChain (fun a b => a ≤ b) c → ∃ ub, ∀ a ∈ c, a ≤ ub) :
    ∃ m, ∀ a, m ≤ a → a = m := by
  -- 实际证明用到 Zorn 引理（在 mathlib4 中）
  sorry

-- 选择公理的另一个等价形式：良序定理
-- 每个集合都可以被良序化
theorem well_ordering_theorem (α : Type) : ∃ (r : α → α → Prop), WellOrder α := by
  sorry

end OrdinalsAndCardinals

end Foundations.SetTheory
