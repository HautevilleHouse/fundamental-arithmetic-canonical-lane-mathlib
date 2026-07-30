import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.FundamentalArithmeticAdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.PrimeFactorization
import FundamentalArithmeticCanonicalLaneLean.EuclideanAlgorithm

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ArithmeticWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.conclusion

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

def ConstrainedArithmeticClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_arithmetic_endgame (A : AdmissibleClass) :
    ConstrainedArithmeticClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse