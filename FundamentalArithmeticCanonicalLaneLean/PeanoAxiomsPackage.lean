import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.NatFormalizationObjects

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure PeanoAxiomsPackage (N : NaturalNumber) where
  zeroExists : Prop
  succInjective : Prop
  succNotZero : Prop
  inductionAxiom : Prop
  zeroExistsTerm : zeroExists
  succInjectiveTerm : succInjective
  succNotZeroTerm : succNotZero
  inductionAxiomTerm : inductionAxiom

structure PeanoAxiomsEvidence {N : NaturalNumber} (P : PeanoAxiomsPackage N) where
  zeroExistsClosed : P.zeroExists
  succInjectiveClosed : P.succInjective
  succNotZeroClosed : P.succNotZero
  inductionAxiomClosed : P.inductionAxiom

def PeanoAxiomsClosed {N : NaturalNumber} (P : PeanoAxiomsPackage N) : Prop :=
  P.zeroExists ∧ P.succInjective ∧ P.succNotZero ∧ P.inductionAxiom

theorem peano_axioms_closed_from_evidence
    {N : NaturalNumber} (P : PeanoAxiomsPackage N) (E : PeanoAxiomsEvidence P) :
    PeanoAxiomsClosed P := by
  exact And.intro E.zeroExistsClosed (And.intro E.succInjectiveClosed (And.intro E.succNotZeroClosed E.inductionAxiomClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse