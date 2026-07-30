import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure PeanoAxiomsPackage where
  zero : Type
  succ : Type
  induction : Prop
  zeroNotSucc : Prop
  succInjective : Prop

def PeanoAxiomsClosed (P : PeanoAxiomsPackage) : Prop :=
  P.induction ∧ P.zeroNotSucc ∧ P.succInjective

structure PeanoAxiomsEvidence (P : PeanoAxiomsPackage) where
  inductionClosed : P.induction
  zeroNotSuccClosed : P.zeroNotSucc
  succInjectiveClosed : P.succInjective

theorem peano_axioms_closed_from_evidence (P : PeanoAxiomsPackage) (E : PeanoAxiomsEvidence P) :
    PeanoAxiomsClosed P := by
  exact And.intro E.inductionClosed (And.intro E.zeroNotSuccClosed E.succInjectiveClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse