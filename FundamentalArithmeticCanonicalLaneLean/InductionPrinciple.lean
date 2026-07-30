import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.PeanoAxiomsPackage

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure InductionPrinciplePackage {N : NaturalNumber} (P : PeanoAxiomsPackage N) where
  baseCase : Prop
  stepCase : Prop
  conclusion : Prop
  baseCaseTerm : baseCase
  stepCaseTerm : stepCase
  conclusionTerm : conclusion

structure InductionPrincipleEvidence {N : NaturalNumber} {P : PeanoAxiomsPackage N}
    (I : InductionPrinciplePackage P) where
  baseCaseClosed : I.baseCase
  stepCaseClosed : I.stepCase
  conclusionClosed : I.conclusion

def InductionPrincipleClosed {N : NaturalNumber} {P : PeanoAxiomsPackage N}
    (I : InductionPrinciplePackage P) : Prop :=
  I.baseCase ∧ I.stepCase ∧ I.conclusion

theorem induction_principle_closed_from_evidence
    {N : NaturalNumber} {P : PeanoAxiomsPackage N}
    (I : InductionPrinciplePackage P) (E : InductionPrincipleEvidence I) :
    InductionPrincipleClosed I := by
  exact And.intro E.baseCaseClosed (And.intro E.stepCaseClosed E.conclusionClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse