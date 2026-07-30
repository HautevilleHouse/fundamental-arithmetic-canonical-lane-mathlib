import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.FundamentalArithmeticAdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure PrimeFactorizationPackage (A : AdmissibleClass) where
  uniqueness : Prop
  existence : Prop
  orderInvariant : Prop

structure PrimeFactorizationEvidence {A : AdmissibleClass} (P : PrimeFactorizationPackage A) where
  uniquenessClosed : P.uniqueness
  existenceClosed : P.existence
  orderInvariantClosed : P.orderInvariant

def PrimeFactorizationClosed {A : AdmissibleClass} (P : PrimeFactorizationPackage A) : Prop :=
  P.uniqueness ∧ P.existence ∧ P.orderInvariant

theorem prime_factorization_closed_from_evidence {A : AdmissibleClass}
    (P : PrimeFactorizationPackage A) (E : PrimeFactorizationEvidence P) :
    PrimeFactorizationClosed P := by
  exact And.intro E.uniquenessClosed (And.intro E.existenceClosed E.orderInvariantClosed)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse