import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

-- | A package capturing the (strong) induction principle for ℕ.
structure InductionPackage (A : PeanoAxiomsPackage) where
  strongInduction : ∀ (P : ℕ → Prop), (∀ n, (∀ m, m < n → P m) → P n) → ∀ n, P n
  inductiveProof : ∀ (P : ℕ → Prop), P 0 → (∀ n, P n → P (A.succ n)) → ∀ n, P n

-- | Evidence that induction holds.
structure InductionEvidence {A : PeanoAxiomsPackage} (I : InductionPackage A) where
  strongInductionClosed : I.strongInduction
  inductiveProofClosed : I.inductiveProof

-- | Closure condition for induction.
def InductionClosed {A : PeanoAxiomsPackage} (I : InductionPackage A) : Prop :=
  I.strongInduction ∧ I.inductiveProof

theorem induction_closed_from_evidence {A : PeanoAxiomsPackage}
    (I : InductionPackage A) (E : InductionEvidence I) : InductionClosed I := by
  exact And.intro E.strongInductionClosed E.inductiveProofClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse