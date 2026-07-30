import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure OrderRelationPackage where
  lessThanDefined : Prop
  greaterThanDefined : Prop
  transitivityLessThan : Prop
  irreflexivityLessThan : Prop
  linearOrder : Prop
  lessThanDefinedTerm : lessThanDefined
  greaterThanDefinedTerm : greaterThanDefined
  transitivityLessThanTerm : transitivityLessThan
  irreflexivityLessThanTerm : irreflexivityLessThan
  linearOrderTerm : linearOrder

structure OrderRelationEvidence (P : OrderRelationPackage) where
  lessThanDefinedClosed : P.lessThanDefined
  greaterThanDefinedClosed : P.greaterThanDefined
  transitivityLessThanClosed : P.transitivityLessThan
  irreflexivityLessThanClosed : P.irreflexivityLessThan
  linearOrderClosed : P.linearOrder

def OrderRelationClosed (P : OrderRelationPackage) : Prop :=
  P.lessThanDefined ∧ P.greaterThanDefined ∧ P.transitivityLessThan ∧ P.irreflexivityLessThan ∧ P.linearOrder

theorem order_relation_closed_from_evidence (P : OrderRelationPackage) (E : OrderRelationEvidence P) : OrderRelationClosed P :=
  And.intro E.lessThanDefinedClosed (And.intro E.greaterThanDefinedClosed (And.intro E.transitivityLessThanClosed (And.intro E.irreflexivityLessThanClosed E.linearOrderClosed)))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
