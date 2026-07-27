import FundamentalArithmeticCanonicalLaneLean.GateLemmas


namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

/-!
Fundamental theorem of arithmetic

Constrained admissible-class closure of the theorem.
Full formalization of the proof is future work.
-/
def constrained_theorem_closure : Prop :=
  ∀ (n : ℕ), n > 1 → ∃! (p_i : ℕ) (k_i : ℕ) [Nat.Prime p_i], n = ∏ p_i^{k_i}

theorem constrained_theorem_closure_true : constrained_theorem_closure := by
  sorry

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
