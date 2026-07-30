import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.AdditionMultiplication

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure NumberTheoryFoundationsPackage {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} {AM : AdditionMultiplicationPackage HP} (HAM : AdditionMultiplicationEvidence AM) where
  euclideanDivision : Prop
  gcdExists : Prop
  bezoutIdentity : Prop
  uniqueFactorization : Prop
  infinitudeOfPrimes : Prop

def NumberTheoryFoundationsClosed {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} {AM : AdditionMultiplicationPackage HP} {HAM : AdditionMultiplicationEvidence AM} (NT : NumberTheoryFoundationsPackage HAM) : Prop :=
  NT.euclideanDivision ∧ NT.gcdExists ∧ NT.bezoutIdentity ∧ NT.uniqueFactorization ∧ NT.infinitudeOfPrimes

structure NumberTheoryFoundationsEvidence {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} {AM : AdditionMultiplicationPackage HP} {HAM : AdditionMultiplicationEvidence AM} (NT : NumberTheoryFoundationsPackage HAM) where
  euclideanDivisionClosed : NT.euclideanDivision
  gcdExistsClosed : NT.gcdExists
  bezoutIdentityClosed : NT.bezoutIdentity
  uniqueFactorizationClosed : NT.uniqueFactorization
  infinitudeOfPrimesClosed : NT.infinitudeOfPrimes

theorem number_theory_foundations_closed_from_evidence {P : PeanoAxiomsPackage} {HP : PeanoAxiomsEvidence P} {AM : AdditionMultiplicationPackage HP} {HAM : AdditionMultiplicationEvidence AM} (NT : NumberTheoryFoundationsPackage HAM) (E : NumberTheoryFoundationsEvidence NT) :
    NumberTheoryFoundationsClosed NT := by
  exact And.intro E.euclideanDivisionClosed (And.intro E.gcdExistsClosed (And.intro E.bezoutIdentityClosed (And.intro E.uniqueFactorizationClosed E.infinitudeOfPrimesClosed)))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse