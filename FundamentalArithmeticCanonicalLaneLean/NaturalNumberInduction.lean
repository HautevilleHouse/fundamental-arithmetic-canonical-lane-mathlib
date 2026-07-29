import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure NaturalNumberInductionPackage where
  baseCase : Prop
  inductiveHypothesis : Prop
  inductionStep : Prop
  inductionPrinciple : Prop

structure NaturalNumberInductionEvidence (N : NaturalNumberInductionPackage) where
  baseCaseClosed : N.baseCase
  inductiveHypothesisClosed : N.inductiveHypothesis
  inductionStepClosed : N.inductionStep
  inductionPrincipleClosed : N.inductionPrinciple

def NaturalNumberInductionClosed (N : NaturalNumberInductionPackage) : Prop :=
  N.baseCase ∧ N.inductiveHypothesis ∧ N.inductionStep ∧ N.inductionPrinciple

theorem natural_number_induction_closed_from_evidence
    (N : NaturalNumberInductionPackage) (E : NaturalNumberInductionEvidence N) :
    NaturalNumberInductionClosed N := by
  exact And.intro E.baseCaseClosed
    (And.intro E.inductiveHypothesisClosed
      (And.intro E.inductionStepClosed E.inductionPrincipleClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse