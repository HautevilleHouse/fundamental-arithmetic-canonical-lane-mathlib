import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure PeanoAxiomsPackage where
  zeroElement : Type u
  successorFunction : zeroElement → zeroElement
  inductionSchema : Prop
  zeroNotSuccessor : Prop
  successorInjective : Prop

structure PeanoAxiomsEvidence (P : PeanoAxiomsPackage) where
  inductionSchemaClosed : P.inductionSchema
  zeroNotSuccessorClosed : P.zeroNotSuccessor
  successorInjectiveClosed : P.successorInjective

def PeanoAxiomsClosed (P : PeanoAxiomsPackage) : Prop :=
  P.inductionSchema ∧ P.zeroNotSuccessor ∧ P.successorInjective

theorem peano_axioms_closed_from_evidence (P : PeanoAxiomsPackage) (E : PeanoAxiomsEvidence P) :
    PeanoAxiomsClosed P := by
  exact And.intro E.inductionSchemaClosed (And.intro E.zeroNotSuccessorClosed E.successorInjectiveClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
