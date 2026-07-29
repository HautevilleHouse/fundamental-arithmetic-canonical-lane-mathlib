import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure SuccessorFunctionPackage where
  successorDefined : Prop
  injective : Prop
  notSurjectiveOntoNaturalNumbers : Prop
  recursionTheorem : Prop

structure SuccessorFunctionEvidence (S : SuccessorFunctionPackage) where
  successorDefinedClosed : S.successorDefined
  injectiveClosed : S.injective
  notSurjectiveOntoNaturalNumbersClosed : S.notSurjectiveOntoNaturalNumbers
  recursionTheoremClosed : S.recursionTheorem

def SuccessorFunctionClosed (S : SuccessorFunctionPackage) : Prop :=
  S.successorDefined ∧ S.injective ∧ S.notSurjectiveOntoNaturalNumbers ∧ S.recursionTheorem

theorem successor_function_closed_from_evidence
    (S : SuccessorFunctionPackage) (E : SuccessorFunctionEvidence S) :
    SuccessorFunctionClosed S := by
  exact And.intro E.successorDefinedClosed
    (And.intro E.injectiveClosed
      (And.intro E.notSurjectiveOntoNaturalNumbersClosed E.recursionTheoremClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse