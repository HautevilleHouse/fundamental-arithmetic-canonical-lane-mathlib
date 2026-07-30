import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

-- | A package representing the Peano axioms for natural numbers.
structure PeanoAxiomsPackage where
  zero : ℕ
  succ : ℕ → ℕ
  inductiveAxiom : ∀ (P : ℕ → Prop), P 0 → (∀ n, P n → P (succ n)) → ∀ n, P n
  zeroNotSucc : ∀ n, succ n ≠ 0
  succInjective : ∀ n m, succ n = succ m → n = m

-- | Evidence that the Peano axioms hold.
structure PeanoAxiomsEvidence (P : PeanoAxiomsPackage) where
  inductiveClosed : P.inductiveAxiom
  zeroNotSuccClosed : P.zeroNotSucc
  succInjectiveClosed : P.succInjective

-- | Closure condition for the Peano axioms.
def PeanoAxiomsClosed (P : PeanoAxiomsPackage) : Prop :=
  P.inductiveAxiom ∧ P.zeroNotSucc ∧ P.succInjective

theorem peano_axioms_closed_from_evidence (P : PeanoAxiomsPackage) (E : PeanoAxiomsEvidence P) :
    PeanoAxiomsClosed P := by
  exact And.intro E.inductiveClosed (And.intro E.zeroNotSuccClosed E.succInjectiveClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse