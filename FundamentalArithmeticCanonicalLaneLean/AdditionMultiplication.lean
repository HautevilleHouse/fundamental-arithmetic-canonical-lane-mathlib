import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.PeanoAxioms

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AdditionMultiplicationPackage {P : PeanoAxiomsPackage} (HP : PeanoAxiomsEvidence P) where
  addDefined : Prop
  mulDefined : Prop
  addAssoc : Prop
  addComm : Prop
  mulAssoc : Prop
  mulComm : Prop
  distrib : Prop

def AdditionMultiplicationClosed {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} (AM : AdditionMultiplicationPackage HP) : Prop :=
  AM.addDefined ∧ AM.mulDefined ∧ AM.addAssoc ∧ AM.addComm ∧ AM.mulAssoc ∧ AM.mulComm ∧ AM.distrib

structure AdditionMultiplicationEvidence {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} (AM : AdditionMultiplicationPackage HP) where
  addDefinedClosed : AM.addDefined
  mulDefinedClosed : AM.mulDefined
  addAssocClosed : AM.addAssoc
  addCommClosed : AM.addComm
  mulAssocClosed : AM.mulAssoc
  mulCommClosed : AM.mulComm
  distribClosed : AM.distrib

theorem addition_multiplication_closed_from_evidence {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} (AM : AdditionMultiplicationPackage HP) (E : AdditionMultiplicationEvidence AM) :
    AdditionMultiplicationClosed AM := by
  exact And.intro E.addDefinedClosed (And.intro E.mulDefinedClosed (And.intro E.addAssocClosed (And.intro E.addCommClosed (And.intro E.mulAssocClosed (And.intro E.mulCommClosed E.distribClosed)))))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse