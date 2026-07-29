import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure CanonicalNeighborhoodsPackage where
  additionCovered : Prop
  subtractionCovered : Prop
  multiplicationCovered : Prop
  divisionCovered : Prop

structure CanonicalNeighborhoodsEvidence (C : CanonicalNeighborhoodsPackage) where
  additionCoveredClosed : C.additionCovered
  subtractionCoveredClosed : C.subtractionCovered
  multiplicationCoveredClosed : C.multiplicationCovered
  divisionCoveredClosed : C.divisionCovered

def CanonicalNeighborhoodsClosed (C : CanonicalNeighborhoodsPackage) : Prop :=
  C.additionCovered ∧ C.subtractionCovered ∧ C.multiplicationCovered ∧ C.divisionCovered

theorem canonical_neighborhoods_closed_from_evidence
    (C : CanonicalNeighborhoodsPackage) (E : CanonicalNeighborhoodsEvidence C) :
    CanonicalNeighborhoodsClosed C := by
  exact And.intro E.additionCoveredClosed
    (And.intro E.subtractionCoveredClosed
      (And.intro E.multiplicationCoveredClosed E.divisionCoveredClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse