import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.PeanoAxioms

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

def bridgeClosed {P : PeanoAxiomsPackage} (A : AdmissibleClass) : Prop :=
  PeanoAxiomsClosed P

theorem bridge_from_admissible_class {P : PeanoAxiomsPackage} (A : AdmissibleClass) (E : PeanoAxiomsEvidence P) :
    bridgeClosed A := by
  exact peano_axioms_closed_from_evidence P E

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
