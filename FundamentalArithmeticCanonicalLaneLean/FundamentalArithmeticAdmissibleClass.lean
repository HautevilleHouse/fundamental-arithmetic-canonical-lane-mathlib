import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure ArithmeticAdmittedObject where
  n : ℕ
  primeFactorization : Prop
  fundamentalTheoremHolds : Prop
  conclusion : fundamentalTheoremHolds

structure AdmissibleClass where
  object : ArithmeticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ArithmeticWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse