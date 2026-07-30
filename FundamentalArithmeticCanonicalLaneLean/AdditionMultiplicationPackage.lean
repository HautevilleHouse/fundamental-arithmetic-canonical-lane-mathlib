import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.InductionPrinciple

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AdditionMultiplicationPackage {N : NaturalNumber}
    {P : PeanoAxiomsPackage N} {I : InductionPrinciplePackage P} where
  additionDefined : Prop
  multiplicationDefined : Prop
  additionProperties : Prop
  multiplicationProperties : Prop
  distributiveLaw : Prop
  additionDefinedTerm : additionDefined
  multiplicationDefinedTerm : multiplicationDefined
  additionPropertiesTerm : additionProperties
  multiplicationPropertiesTerm : multiplicationProperties
  distributiveLawTerm : distributiveLaw

structure AdditionMultiplicationEvidence {N : NaturalNumber}
    {P : PeanoAxiomsPackage N} {I : InductionPrinciplePackage P}
    (AM : AdditionMultiplicationPackage I) where
  additionDefinedClosed : AM.additionDefined
  multiplicationDefinedClosed : AM.multiplicationDefined
  additionPropertiesClosed : AM.additionProperties
  multiplicationPropertiesClosed : AM.multiplicationProperties
  distributiveLawClosed : AM.distributiveLaw

def AdditionMultiplicationClosed {N : NaturalNumber}
    {P : PeanoAxiomsPackage N} {I : InductionPrinciplePackage P}
    (AM : AdditionMultiplicationPackage I) : Prop :=
  AM.additionDefined ∧ AM.multiplicationDefined ∧ AM.additionProperties ∧
  AM.multiplicationProperties ∧ AM.distributiveLaw

theorem addition_multiplication_closed_from_evidence
    {N : NaturalNumber} {P : PeanoAxiomsPackage N} {I : InductionPrinciplePackage P}
    (AM : AdditionMultiplicationPackage I) (E : AdditionMultiplicationEvidence AM) :
    AdditionMultiplicationClosed AM := by
  exact And.intro E.additionDefinedClosed (And.intro E.multiplicationDefinedClosed
    (And.intro E.additionPropertiesClosed (And.intro E.multiplicationPropertiesClosed E.distributiveLawClosed)))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse