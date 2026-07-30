import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.FundamentalArithmeticAdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure EuclideanAlgorithmPackage (A : AdmissibleClass) where
  divisionWithRemainder : Prop
  termination : Prop
  bezoutIdentity : Prop

structure EuclideanAlgorithmEvidence {A : AdmissibleClass} (E : EuclideanAlgorithmPackage A) where
  divisionWithRemainderClosed : E.divisionWithRemainder
  terminationClosed : E.termination
  bezoutIdentityClosed : E.bezoutIdentity

def EuclideanAlgorithmClosed {A : AdmissibleClass} (E : EuclideanAlgorithmPackage A) : Prop :=
  E.divisionWithRemainder ∧ E.termination ∧ E.bezoutIdentity

theorem euclidean_algorithm_closed_from_evidence {A : AdmissibleClass}
    (E : EuclideanAlgorithmPackage A) (Ev : EuclideanAlgorithmEvidence E) :
    EuclideanAlgorithmClosed E := by
  exact And.intro Ev.divisionWithRemainderClosed (And.intro Ev.terminationClosed Ev.bezoutIdentityClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse