import FundamentalArithmeticCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AdmissibleClass where
  object : ArithmeticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  ArithmeticWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse