import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure ModularArithmeticPackage where
  congruenceDefined : Prop
  modularAddition : Prop
  modularMultiplication : Prop
  modularInverses : Prop
  residueClassRing : Prop
  congruenceDefinedTerm : congruenceDefined
  modularAdditionTerm : modularAddition
  modularMultiplicationTerm : modularMultiplication
  modularInversesTerm : modularInverses
  residueClassRingTerm : residueClassRing

structure ModularArithmeticEvidence (P : ModularArithmeticPackage) where
  congruenceDefinedClosed : P.congruenceDefined
  modularAdditionClosed : P.modularAddition
  modularMultiplicationClosed : P.modularMultiplication
  modularInversesClosed : P.modularInverses
  residueClassRingClosed : P.residueClassRing

def ModularArithmeticClosed (P : ModularArithmeticPackage) : Prop :=
  P.congruenceDefined ∧ P.modularAddition ∧ P.modularMultiplication ∧ P.modularInverses ∧ P.residueClassRing

theorem modular_arithmetic_closed_from_evidence (P : ModularArithmeticPackage) (E : ModularArithmeticEvidence P) : ModularArithmeticClosed P :=
  And.intro E.congruenceDefinedClosed (And.intro E.modularAdditionClosed (And.intro E.modularMultiplicationClosed (And.intro E.modularInversesClosed E.residueClassRingClosed)))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
