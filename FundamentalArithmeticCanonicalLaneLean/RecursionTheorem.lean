import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

-- | A package encoding the recursion theorem for natural numbers.
structure RecursionTheoremPackage (A : PeanoAxiomsPackage) where
  baseSet : Type u
  baseElement : baseSet
  stepFunction : ℕ → baseSet → baseSet
  recursionFunction : ℕ → baseSet
  recursionProperty : ∀ n, recursionFunction (A.succ n) = stepFunction n (recursionFunction n)
  recursionFunctionBase : recursionFunction 0 = baseElement

-- | Evidence that the recursion theorem holds.
structure RecursionTheoremEvidence {A : PeanoAxiomsPackage} (R : RecursionTheoremPackage A) where
  recursionPropertyClosed : R.recursionProperty
  recursionFunctionBaseClosed : R.recursionFunctionBase

-- | Closure condition for the recursion theorem.
def RecursionTheoremClosed {A : PeanoAxiomsPackage} (R : RecursionTheoremPackage A) : Prop :=
  R.recursionProperty ∧ R.recursionFunctionBase

theorem recursion_theorem_closed_from_evidence
    {A : PeanoAxiomsPackage} (R : RecursionTheoremPackage A) (E : RecursionTheoremEvidence R) :
    RecursionTheoremClosed R := by
  exact And.intro E.recursionPropertyClosed E.recursionFunctionBaseClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse