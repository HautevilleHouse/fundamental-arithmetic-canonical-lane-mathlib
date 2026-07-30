import canonicalLaneMathlib.AdmissibleClass
import FundamentalArithmeticCanonicalLaneLean.PeanoAxioms
import FundamentalArithmeticCanonicalLaneLean.RecursionTheorem
import FundamentalArithmeticCanonicalLaneLean.AdditionDef
import FundamentalArithmeticCanonicalLaneLean.MultiplicationDef
import FundamentalArithmeticCanonicalLaneLean.InductionPrinciple

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

-- | The main closure definition for Fundamental Arithmetic.
def ConstrainedArithmeticClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_arithmetic_endgame (A : AdmissibleClass) :
    ConstrainedArithmeticClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse