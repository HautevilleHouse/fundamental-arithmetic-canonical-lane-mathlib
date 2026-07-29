import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.AdditionRecursiveDefinition

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AssociativityCommutativityPackage (N : Type) (zero : N) (succ : N → N) (add : N → N → N) where
  addAssoc : ∀ a b c : N, add (add a b) c = add a (add b c)
  addComm : ∀ a b : N, add a b = add b a
  mulAssoc : ∀ a b c : N, (a * b) * c = a * (b * c)
  mulComm : ∀ a b : N, a * b = b * a
  distrib : ∀ a b c : N, a * (b + c) = a * b + a * c

structure AssociativityCommutativityEvidence {N : Type} {zero : N} {succ : N → N} {add : N → N → N}
    (A : AssociativityCommutativityPackage N zero succ add) where
  addAssocClosed : A.addAssoc
  addCommClosed : A.addComm
  mulAssocClosed : A.mulAssoc
  mulCommClosed : A.mulComm
  distribClosed : A.distrib

def AssociativityCommutativityClosed {N : Type} {zero : N} {succ : N → N} {add : N → N → N}
    (A : AssociativityCommutativityPackage N zero succ add) : Prop :=
  A.addAssoc ∧ A.addComm ∧ A.mulAssoc ∧ A.mulComm ∧ A.distrib

theorem associativity_commutativity_closed_from_evidence
    {N : Type} {zero : N} {succ : N → N} {add : N → N → N}
    (A : AssociativityCommutativityPackage N zero succ add)
    (E : AssociativityCommutativityEvidence A) :
    AssociativityCommutativityClosed A := by
  exact And.intro E.addAssocClosed
    (And.intro E.addCommClosed
      (And.intro E.mulAssocClosed
        (And.intro E.mulCommClosed E.distribClosed)))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse