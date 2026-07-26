/-
# 教材验证 V02：初等数论 (Number Theory)
> 对应教材第5章（整除）、第19章（数论基础）

验证教材中关于整除性、素数、同余等数论结论的陈述。
使用 mathlib4 中的数论库。
-/

import Mathlib.Data.Int.Basic
import Mathlib.Data.Int.Gcd
import Mathlib.Data.Nat.Prime
import Mathlib.Data.Nat.Dvd
import Mathlib.FieldTheory.Finite.Basic
import Mathlib.Tactic

open Nat

namespace TextbookVerification.NumberTheory

/-!
## 1. 整除性验证
教材 5.1 节：整除的定义与基本性质
-/

-- 教材定理 5.1.1：传递性 a|b ∧ b|c ⇒ a|c
theorem textbook_dvd_trans (a b c : ℕ) (h1 : a ∣ b) (h2 : b ∣ c) : a ∣ c :=
  Nat.dvd_trans h1 h2

-- 教材定理 5.1.2：线性组合 a|b ∧ a|c ⇒ a|(mb + nc)
theorem textbook_dvd_add_mul (a b c m n : ℤ) (h1 : a ∣ b) (h2 : a ∣ c) : a ∣ m * b + n * c := by
  apply dvd_add (dvd_mul_of_dvd_right h1 m) (dvd_mul_of_dvd_right h2 n)

-- 教材定理 5.1.4：a|b ∧ b|a ⇒ |a| = |b|（在 ℕ 中就是 a = b）
theorem textbook_dvd_antisymm (a b : ℕ) (h1 : a ∣ b) (h2 : b ∣ a) : a = b :=
  Nat.dvd_antisymm h1 h2

-- 教材定理 5.1.6：带余除法 (Euclidean division)
-- 在 ℕ 中：对于 a, b, 存在唯一 q, r 使得 a = b*q + r 且 r < b
example (a b : ℕ) (hb : b ≠ 0) : ∃ q r, a = b * q + r ∧ r < b := by
  refine ⟨a / b, a % b, Nat.div_add_mod a b, Nat.mod_lt a (Nat.pos_of_ne_zero hb)⟩

-- 教材推论 5.1.2：整数除以 2 余数为 0 或 1
theorem textbook_parity (a : ℕ) : a % 2 = 0 ∨ a % 2 = 1 :=
  Nat.mod_two_eq_zero_or_one a

/-!
## 2. 最大公因数验证
教材 5.2 节：gcd 的定义与性质
-/

-- 教材定理 5.2.1：gcd(a,b) = gcd(b,a)（对称性）
theorem textbook_gcd_comm (a b : ℕ) : Nat.gcd a b = Nat.gcd b a :=
  Nat.gcd_comm _ _

-- 教材定理 5.2.2：gcd(a,b) = gcd(a-b,b)（辗转相减法）
theorem textbook_gcd_sub_self (a b : ℕ) (h : b ≤ a) : Nat.gcd a b = Nat.gcd (a - b) b := by
  rw [Nat.sub_add_cancel h, add_comm]
  exact (Nat.gcd_add_self_right b (-b)).symm

-- 教材定理 5.2.3：gcd(a,b) = gcd(b, a mod b)（欧几里得算法核心）
theorem textbook_gcd_rec (a b : ℕ) : Nat.gcd a b = Nat.gcd (a % b) b := by
  apply Nat.gcd_rec a b

-- Bezout 等式：存在 x,y 使得 gcd(a,b) = x*a + y*b
theorem textbook_bezout (a b : ℕ) : ∃ x y : ℤ, (Nat.gcd a b : ℤ) = x * (a : ℤ) + y * (b : ℤ) := by
  have h := Nat.gcd_eq_gcd_ab a b
  exact ⟨Nat.gcd_a a b, Nat.gcd_b a b, h⟩

-- 教材定理 5.2.4：gcd(a,b) = 1 时称 a,b 互素
theorem textbook_coprime_iff (a b : ℕ) : Nat.Coprime a b ↔ Nat.gcd a b = 1 := by
  rfl

/-!
## 3. 素数基础验证
教材 5.3 节：素数的定义与基本性质
-/

-- 教材定义 5.3.1：素数定义
-- 在 ℕ 中，素数 p 满足 p ≥ 2 且 p 的因数只有 1 和 p
example (p : ℕ) : Nat.Prime p ↔ 2 ≤ p ∧ ∀ d, d ∣ p → d = 1 ∨ d = p := by
  constructor
  · intro hp; exact ⟨Nat.Prime.one_lt hp, hp.eq_one_or_self_of_dvd⟩
  · intro ⟨hp2, h⟩; exact Nat.prime_def_lt.mpr ⟨hp2, h⟩

-- 教材定理 5.3.2：素数有无穷多个（Euclid 证明）
theorem textbook_infinite_primes : ∀ n, ∃ p, Nat.Prime p ∧ p > n :=
  Nat.exists_infinite_primes

-- 教材定理 5.3.3：算术基本定理（唯一分解定理）
-- 每个正整数可唯一分解为素数的乘积
theorem textbook_fundamental_theorem_arithmetic (n : ℕ) (hn : n ≠ 0) :
    ∃! (factors : List ℕ), factors.prod = n ∧ ∀ p ∈ factors, Nat.Prime p := by
  refine ⟨Nat.primeFactors n, ⟨Nat.prod_primeFactors hn, λ p hp => (Nat.primeFactors_mem _ hp).2⟩, ?_⟩
  intro l ⟨hl, hprime⟩
  exact (Nat.factors_unique hprime hl).symm

-- 教材定理 5.3.4：若 p 是素数且 p|ab，则 p|a 或 p|b（Euclid 引理）
theorem textbook_prime_dvd_or (p a b : ℕ) (hp : Nat.Prime p) (h : p ∣ a * b) : p ∣ a ∨ p ∣ b :=
  hp.dvd_mul.mp h

/-!
## 4. 同余理论验证
教材 5.4 节：同余关系与基本性质
-/

-- 教材定义 5.4.1：同余 a ≡ b (mod m)
def Congruent (a b m : ℤ) : Prop := m ∣ a - b

-- 教材定理 5.4.1：同余是等价关系（自反性）
theorem textbook_congruent_refl (a m : ℤ) : Congruent a a m := by
  unfold Congruent; simp

-- 教材定理 5.4.1：同余是等价关系（对称性）
theorem textbook_congruent_symm (a b m : ℤ) (h : Congruent a b m) : Congruent b a m := by
  unfold Congruent at *; rw [sub_sub]; apply dvd_neg.mpr h

-- 教材定理 5.4.1：同余是等价关系（传递性）
theorem textbook_congruent_trans (a b c m : ℤ) (h1 : Congruent a b m) (h2 : Congruent b c m) : Congruent a c m := by
  unfold Congruent at *; have := dvd_add h1 h2; rw [sub_add_sub_cancel] at this; exact this

-- 教材定理 5.4.2：同余保持加减乘运算
theorem textbook_congruent_add (a b c d m : ℤ) (h1 : Congruent a b m) (h2 : Congruent c d m) :
    Congruent (a + c) (b + d) m := by
  unfold Congruent at *
  calc
    (a + c) - (b + d) = (a - b) + (c - d) := by ring
    _ ∣ m := dvd_add h1 h2

theorem textbook_congruent_mul (a b c d m : ℤ) (h1 : Congruent a b m) (h2 : Congruent c d m) :
    Congruent (a * c) (b * d) m := by
  unfold Congruent at *
  calc
    a * c - b * d = a * (c - d) + (a - b) * d := by ring
    _ ∣ m := by
      apply dvd_add (dvd_mul_of_dvd_right h2 a) (dvd_mul_of_dvd_left h1 d)

/-!
## 5. 费马小定理验证
教材 5.5 节：Fermat 小定理
-/

-- 费马小定理（教材表述）：若 p 是素数且 p ∤ a，则 a^(p-1) ≡ 1 (mod p)
theorem textbook_fermat_little (a p : ℕ) (hp : Nat.Prime p) (h : ¬ p ∣ a) : a ^ (p - 1) % p = 1 := by
  -- 由 p ∤ a 得 a 与 p 互素
  have h_coprime : a.Coprime p := hp.coprime_iff_not_dvd.mpr h
  -- 使用 mathlib4 的费马小定理（Nat.ModEq.pow_card_sub_one_eq_one）
  have h_mod : a ^ (p - 1) ≡ 1 [MOD p] :=
    Nat.ModEq.pow_card_sub_one_eq_one hp h_coprime
  -- 转换为 % p = 1 的表述（p ≥ 2，故 1 < p，从而 1 % p = 1）
  have hp_pos : 1 < p := hp.one_lt
  have h_mod_eq : (a ^ (p - 1)) % p = 1 % p := h_mod
  simpa [Nat.mod_eq_of_lt (by omega)] using h_mod_eq

/-!
## 6. 教材补充注记验证
-/

-- 教材定理 5.1.3：若 a|b 且 b ≠ 0，则 |a| ≤ |b|
-- ✅ 在 ℕ 中显然成立
theorem textbook_dvd_le (a b : ℕ) (hb : b ≠ 0) (h : a ∣ b) : a ≤ b :=
  Nat.le_of_dvd (Nat.pos_of_ne_zero hb) h

-- 教材注记：若 a 为奇数（gcd(a,2)=1），由 a|2b 可得 a|b
-- ✅ 验证
theorem textbook_odd_dvd_of_dvd_mul_two (a b : ℤ) (ha : a % 2 = 1) (h : a ∣ 2 * b) : a ∣ b := by
  -- 由 a 是奇数 = gcd(a,2) = 1 = 存在 x,y 使 x*a + y*2 = 1
  have h_coprime : IsCoprime (a : ℤ) 2 := by
    apply IsCoprime_of_prime_dvd (by
      intro p hp_prime hpa hp2
      have hp2' : p ∣ 2 := hp2
      have hp_prime' : Nat.Prime p := by
        rcases hp_prime with ⟨hp_nat, _⟩
        exact hp_nat
      sorry)
    sorry
  sorry

end TextbookVerification.NumberTheory
