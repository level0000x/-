/-
# 教材验证 V04：分析学 (Analysis)
> 对应教材第22-23章（极限、导数）

验证教材中关于极限、连续、导数的定义与定理。
使用 mathlib4 的分析库。
-/

import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Analysis.Calculus.Deriv.Basic
import Mathlib.Analysis.Calculus.Deriv.Abs
import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.SpecialFunctions.Trigonometric
import Mathlib.Data.Real.Basic
import Mathlib.Tactic

open Real
open Filter
open Topology

namespace TextbookVerification.Analysis

/-!
## 1. 数列极限验证
教材 22.1 节：数列极限的 ε-N 定义
-/

-- 教材定义 22.1：数列极限的 ε-N 定义
-- 在 mathlib4 中，`Tendsto a atTop (𝓝 L)` 对应于 `lim_{n→∞} a_n = L`

-- 教材定理 22.1：极限的唯一性
theorem textbook_limit_unique {a : ℕ → ℝ} {L₁ L₂ : ℝ}
    (h₁ : Tendsto a atTop (𝓝 L₁)) (h₂ : Tendsto a atTop (𝓝 L₂)) : L₁ = L₂ :=
  tendsto_nhds_unique h₁ h₂

-- 教材定理 22.2：收敛数列必有界
theorem textbook_convergent_bounded {a : ℕ → ℝ} {L : ℝ} (h : Tendsto a atTop (𝓝 L)) : ∃ M, ∀ n, |a n| ≤ M := by
  have hb := Metric.bounded_of_tendsto h
  rcases hb with ⟨M, hM⟩
  refine ⟨M, ?_⟩
  intro n
  have h' := hM (Set.mem_range_self n)
  exact h'.trans (le_abs_self M)

-- 教材定理 22.3：极限的四则运算
-- 加法
theorem textbook_limit_add {a b : ℕ → ℝ} {L₁ L₂ : ℝ}
    (ha : Tendsto a atTop (𝓝 L₁)) (hb : Tendsto b atTop (𝓝 L₂)) :
    Tendsto (a + b) atTop (𝓝 (L₁ + L₂)) :=
  ha.add hb

-- 乘法
theorem textbook_limit_mul {a b : ℕ → ℝ} {L₁ L₂ : ℝ}
    (ha : Tendsto a atTop (𝓝 L₁)) (hb : Tendsto b atTop (𝓝 L₂)) :
    Tendsto (a * b) atTop (𝓝 (L₁ * L₂)) :=
  ha.mul hb

-- 教材定理 22.4：夹逼定理
theorem textbook_squeeze {a b c : ℕ → ℝ} {L : ℝ}
    (ha : ∀ n, a n ≤ b n ∧ b n ≤ c n) (hlim₁ : Tendsto a atTop (𝓝 L)) (hlim₂ : Tendsto c atTop (𝓝 L)) :
    Tendsto b atTop (𝓝 L) := by
  have h_ineq : ∀ n, a n ≤ b n ∧ b n ≤ c n := ha
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le hlim₁ hlim₂ ?_ ?_
  · intro n; exact (ha n).1
  · intro n; exact (ha n).2

-- 教材定理 22.5：单调有界定理
-- 单调递增有上界的数列必收敛
theorem textbook_monotone_convergence {a : ℕ → ℝ} (h_mono : Monotone a) (h_bdd : ∃ M, ∀ n, a n ≤ M) :
    ∃ L, Tendsto a atTop (𝓝 L) := by
  rcases h_bdd with ⟨M, hM⟩
  have h_sup : ∃ s, ∀ n, a n ≤ s := ⟨M, hM⟩
  -- 使用实数的上确界性质
  have h_sup' := exists_supₛ (Set.range a) ⟨a 0, ⟨0, rfl⟩⟩ ⟨M, λ x hx => ?_⟩
  · rcases h_sup' with ⟨L, hL⟩
    refine ⟨L, ?_⟩
    apply tendsto_of_monotone_bounded h_mono ?_
    exact ⟨M, hM⟩
  · rcases hx with ⟨n, rfl⟩; exact hM n

-- 重要极限：lim_{n→∞} (1 + 1/n)^n = e
theorem textbook_limit_e : Tendsto (λ n : ℕ => ((1 : ℝ) + 1 / ((n : ℝ) + 1)) ^ (n + 1)) atTop (𝓝 (Real.exp 1)) := by
  -- 使用 mathlib4 中关于 e 的极限
  simpa [add_comm] using Real.tendsto_exp_one_div_add_one_pow_atTop

/-!
## 2. 函数极限验证
教材 22.2 节：函数极限的 ε-δ 定义
-/

-- 教材定理 22.6：函数极限的唯一性
theorem textbook_fun_limit_unique {f : ℝ → ℝ} {a L₁ L₂ : ℝ}
    (h₁ : Tendsto f (𝓝 a) (𝓝 L₁)) (h₂ : Tendsto f (𝓝 a) (𝓝 L₂)) : L₁ = L₂ :=
  tendsto_nhds_unique h₁ h₂

-- 重要极限：lim_{x→0} sin x / x = 1
theorem textbook_limit_sin_over_x : Tendsto (λ x : ℝ => sin x / x) (𝓝[≠] 0) (𝓝 1) := by
  -- 使用 mathlib4 中的标准结论
  have h := Real.tendsto_sin_div_self
  simpa [div_eq_inv_mul] using h

/-!
## 3. 导数验证
教材 23.1 节：导数的定义与基本性质
-/

-- 教材定义 23.1：导数的极限定义
-- 在 mathlib4 中，`HasDerivAt f f' a` 表示 f 在 a 处的导数为 f'

-- 教材定理 23.1：可导必连续
theorem textbook_diff_implies_cont {f : ℝ → ℝ} {x f' : ℝ} (h : HasDerivAt f f' x) : ContinuousAt f x :=
  h.continuousAt

-- 教材定理 23.2：导数四则运算
-- 加法
theorem textbook_deriv_add {f g : ℝ → ℝ} {x f' g' : ℝ}
    (hf : HasDerivAt f f' x) (hg : HasDerivAt g g' x) : HasDerivAt (f + g) (f' + g') x :=
  hf.add hg

-- 乘法 (Leibniz 法则)
theorem textbook_deriv_mul {f g : ℝ → ℝ} {x f' g' : ℝ}
    (hf : HasDerivAt f f' x) (hg : HasDerivAt g g' x) : HasDerivAt (f * g) (f' * g x + f x * g') x :=
  HasDerivAt.mul hf hg

-- 链式法则
theorem textbook_chain_rule {f g : ℝ → ℝ} {x f' g' : ℝ}
    (hf : HasDerivAt f f' (g x)) (hg : HasDerivAt g g' x) : HasDerivAt (f ∘ g) (f' * g') x :=
  HasDerivAt.comp x hf hg

-- 教材定理 23.3：导数公式验证
-- d/dx (sin x) = cos x
theorem textbook_deriv_sin (x : ℝ) : HasDerivAt sin (cos x) x :=
  hasDerivAt_sin x

-- d/dx (cos x) = -sin x
theorem textbook_deriv_cos (x : ℝ) : HasDerivAt cos (-sin x) x :=
  hasDerivAt_cos x

-- d/dx (e^x) = e^x
theorem textbook_deriv_exp (x : ℝ) : HasDerivAt Real.exp (Real.exp x) x :=
  hasDerivAt_exp x

-- d/dx (ln x) = 1/x (x > 0)
theorem textbook_deriv_log {x : ℝ} (hx : x ≠ 0) : HasDerivAt Real.log (1 / x) x := by
  have := hasDerivAt_log hx
  simpa [div_eq_inv_mul] using this

/-!
## 4. 教材可能存在的缺陷标记
-/

-- 教材第 22 章提及"单调有界定理"的证明中依赖于上确界公理
-- ✅ 验证：该证明在 mathlib4 的实数构造中正确
-- ℕ 上的单调有界数列收敛由实数的 Dedekind 完备性保证

-- 教材 23.1.3 节的注记："f(x)=|x| 在 x=0 处连续但不可导"
-- ✅ 验证：
example : ContinuousAt (fun x : ℝ => |x|) 0 := by
  -- |x| 在 0 处连续
  refine continuous_iff_continuousAt.mp ?_ 0
  exact abs_continuous

example : ¬DifferentiableAt ℝ (fun x : ℝ => |x|) 0 :=
  not_differentiableAt_abs_zero

end TextbookVerification.Analysis
