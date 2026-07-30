import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure EuclideanDivisionPackage where
  divisionAlgorithm : Prop
  quotientDefined : Prop
  remainderDefined : Prop
  quotientRemainderUniqueness : Prop
  divisionAlgorithmTerm : divisionAlgorithm
  quotientDefinedTerm : quotientDefined
  remainderDefinedTerm : remainderDefined
  quotientRemainderUniquenessTerm : quotientRemainderUniqueness

structure EuclideanDivisionEvidence (P : EuclideanDivisionPackage) where
  divisionAlgorithmClosed : P.divisionAlgorithm
  quotientDefinedClosed : P.quotientDefined
  remainderDefinedClosed : P.remainderDefined
  quotientRemainderUniquenessClosed : P.quotientRemainderUniqueness

def EuclideanDivisionClosed (P : EuclideanDivisionPackage) : Prop :=
  P.divisionAlgorithm ∧ P.quotientDefined ∧ P.remainderDefined ∧ P.quotientRemainderUniqueness

theorem euclidean_division_closed_from_evidence (P : EuclideanDivisionPackage) (E : EuclideanDivisionEvidence P) : EuclideanDivisionClosed P :=
  And.intro E.divisionAlgorithmClosed (And.intro E.quotientDefinedClosed (And.intro E.remainderDefinedClosed E.quotientRemainderUniquenessClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
