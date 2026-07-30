import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AdditionMultiplicationPackage where
  additionDefined : Prop
  multiplicationDefined : Prop
  commutativeAddition : Prop
  associativeAddition : Prop
  commutativeMultiplication : Prop
  associativeMultiplication : Prop
  distributiveLaw : Prop
  additionDefinedTerm : additionDefined
  multiplicationDefinedTerm : multiplicationDefined
  commutativeAdditionTerm : commutativeAddition
  associativeAdditionTerm : associativeAddition
  commutativeMultiplicationTerm : commutativeMultiplication
  associativeMultiplicationTerm : associativeMultiplication
  distributiveLawTerm : distributiveLaw

structure AdditionMultiplicationEvidence (P : AdditionMultiplicationPackage) where
  additionDefinedClosed : P.additionDefined
  multiplicationDefinedClosed : P.multiplicationDefined
  commutativeAdditionClosed : P.commutativeAddition
  associativeAdditionClosed : P.associativeAddition
  commutativeMultiplicationClosed : P.commutativeMultiplication
  associativeMultiplicationClosed : P.associativeMultiplication
  distributiveLawClosed : P.distributiveLaw

set_option pp.universes true
def AdditionMultiplicationClosed (P : AdditionMultiplicationPackage) : Prop :=
  P.additionDefined ∧ P.multiplicationDefined ∧ P.commutativeAddition ∧ P.associativeAddition ∧ P.commutativeMultiplication ∧ P.associativeMultiplication ∧ P.distributiveLaw

theorem addition_multiplication_closed_from_evidence (P : AdditionMultiplicationPackage) (E : AdditionMultiplicationEvidence P) : AdditionMultiplicationClosed P :=
  And.intro E.additionDefinedClosed (And.intro E.multiplicationDefinedClosed (And.intro E.commutativeAdditionClosed (And.intro E.associativeAdditionClosed (And.intro E.commutativeMultiplicationClosed (And.intro E.associativeMultiplicationClosed E.distributiveLawClosed)))))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
