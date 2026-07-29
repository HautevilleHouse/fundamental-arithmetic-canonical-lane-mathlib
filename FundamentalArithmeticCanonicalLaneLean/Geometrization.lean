import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure GeometrizationPackage where
  euclideanAlgorithm : Prop
  gcdExistence : Prop
  lcmExistence : Prop
  fundamentalTheoremArithmetic : Prop

structure GeometrizationEvidence (Z : GeometrizationPackage) where
  euclideanAlgorithmClosed : Z.euclideanAlgorithm
  gcdExistenceClosed : Z.gcdExistence
  lcmExistenceClosed : Z.lcmExistence
  fundamentalTheoremArithmeticClosed : Z.fundamentalTheoremArithmetic

def GeometrizationClosed (Z : GeometrizationPackage) : Prop :=
  Z.euclideanAlgorithm ∧ Z.gcdExistence ∧ Z.lcmExistence ∧ Z.fundamentalTheoremArithmetic

theorem geometrization_closed_from_evidence
    (Z : GeometrizationPackage) (E : GeometrizationEvidence Z) :
    GeometrizationClosed Z := by
  exact And.intro E.euclideanAlgorithmClosed
    (And.intro E.gcdExistenceClosed
      (And.intro E.lcmExistenceClosed E.fundamentalTheoremArithmeticClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse