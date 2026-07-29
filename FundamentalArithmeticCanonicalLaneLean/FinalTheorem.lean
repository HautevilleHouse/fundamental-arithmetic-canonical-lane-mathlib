import FundamentalArithmeticCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

def ConstrainedFundamentalArithmeticClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_fundamental_arithmetic_endgame (A : AdmissibleClass) :
    ConstrainedFundamentalArithmeticClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse