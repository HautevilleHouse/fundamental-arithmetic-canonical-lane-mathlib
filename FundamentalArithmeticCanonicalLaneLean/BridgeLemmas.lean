import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ArithmeticWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse