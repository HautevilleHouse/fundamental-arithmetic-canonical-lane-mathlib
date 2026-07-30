import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.PeanoAxioms

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AdditionPackage {P : PeanoAxiomsPackage} (H : PeanoAxiomsEvidence P) where
  addFunction : P.zeroElement → P.zeroElement → P.zeroElement
  addZero : ∀ a : P.zeroElement, addFunction a P.zeroElement = a
  addSucc : ∀ a b : P.zeroElement, addFunction a (P.successorFunction b) = P.successorFunction (addFunction a b)

structure MultiplicationPackage {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (A : AdditionPackage H) where
  mulFunction : P.zeroElement → P.zeroElement → P.zeroElement
  mulZero : ∀ a : P.zeroElement, mulFunction a P.zeroElement = P.zeroElement
  mulSucc : ∀ a b : P.zeroElement, mulFunction a (P.successorFunction b) = A.addFunction (mulFunction a b) a

structure ArithmeticEvidence {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (A : AdditionPackage H) (M : MultiplicationPackage A) where
  addZeroClosed : ∀ a : P.zeroElement, A.addFunction a P.zeroElement = a
  addSuccClosed : ∀ a b : P.zeroElement, A.addFunction a (P.successorFunction b) = P.successorFunction (A.addFunction a b)
  mulZeroClosed : ∀ a : P.zeroElement, M.mulFunction a P.zeroElement = P.zeroElement
  mulSuccClosed : ∀ a b : P.zeroElement, M.mulFunction a (P.successorFunction b) = A.addFunction (M.mulFunction a b) a

def ArithmeticClosed {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (A : AdditionPackage H) (M : MultiplicationPackage A) : Prop :=
  (∀ a : P.zeroElement, A.addFunction a P.zeroElement = a) ∧
  (∀ a b : P.zeroElement, A.addFunction a (P.successorFunction b) = P.successorFunction (A.addFunction a b)) ∧
  (∀ a : P.zeroElement, M.mulFunction a P.zeroElement = P.zeroElement) ∧
  (∀ a b : P.zeroElement, M.mulFunction a (P.successorFunction b) = A.addFunction (M.mulFunction a b) a)

theorem arithmetic_closed_from_evidence {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (A : AdditionPackage H) (M : MultiplicationPackage A) (E : ArithmeticEvidence A M) :
    ArithmeticClosed A M := by
  exact And.intro E.addZeroClosed (And.intro E.addSuccClosed (And.intro E.mulZeroClosed E.mulSuccClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
