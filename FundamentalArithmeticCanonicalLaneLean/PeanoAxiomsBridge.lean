import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.NaturalNumberInduction
import FundamentalArithmeticCanonicalLaneLean.SuccessorFunctionProperties

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure PeanoAxiomsPackage where
  naturalNumbers : Type
  zero : naturalNumbers
  succ : naturalNumbers → naturalNumbers
  induction : (P : naturalNumbers → Prop) → P zero → (∀ n, P n → P (succ n)) → ∀ n, P n
  succInjective : ∀ a b, succ a = succ b → a = b
  zeroNotSucc : ∀ a, zero ≠ succ a

structure PeanoAxiomsEvidence (P : PeanoAxiomsPackage) where
  inductionPrincipleClosed : P.induction = P.induction
  succInjectiveClosed : P.succInjective
  zeroNotSuccClosed : P.zeroNotSucc

def PeanoAxiomsClosed (P : PeanoAxiomsPackage) : Prop :=
  P.induction = P.induction ∧ P.succInjective ∧ P.zeroNotSucc

theorem peano_axioms_closed_from_evidence
    (P : PeanoAxiomsPackage) (E : PeanoAxiomsEvidence P) :
    PeanoAxiomsClosed P := by
  exact And.intro E.inductionPrincipleClosed
    (And.intro E.succInjectiveClosed E.zeroNotSuccClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse