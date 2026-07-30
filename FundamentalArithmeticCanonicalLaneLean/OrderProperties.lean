import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.PeanoAxioms

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure OrderPackage {P : PeanoAxiomsPackage} (H : PeanoAxiomsEvidence P) where
  leqRelation : P.zeroElement → P.zeroElement → Prop
  leqReflexive : ∀ a : P.zeroElement, leqRelation a a
  leqTransitive : ∀ a b c : P.zeroElement, leqRelation a b → leqRelation b c → leqRelation a c
  leqAntisymmetric : ∀ a b : P.zeroElement, leqRelation a b → leqRelation b a → a = b
  leqTotal : ∀ a b : P.zeroElement, leqRelation a b ∨ leqRelation b a

structure OrderEvidence {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (O : OrderPackage H) where
  leqReflexiveClosed : ∀ a : P.zeroElement, O.leqRelation a a
  leqTransitiveClosed : ∀ a b c : P.zeroElement, O.leqRelation a b → O.leqRelation b c → O.leqRelation a c
  leqAntisymmetricClosed : ∀ a b : P.zeroElement, O.leqRelation a b → O.leqRelation b a → a = b
  leqTotalClosed : ∀ a b : P.zeroElement, O.leqRelation a b ∨ O.leqRelation b a

def OrderClosed {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (O : OrderPackage H) : Prop :=
  (∀ a : P.zeroElement, O.leqRelation a a) ∧
  (∀ a b c : P.zeroElement, O.leqRelation a b → O.leqRelation b c → O.leqRelation a c) ∧
  (∀ a b : P.zeroElement, O.leqRelation a b → O.leqRelation b a → a = b) ∧
  (∀ a b : P.zeroElement, O.leqRelation a b ∨ O.leqRelation b a)

theorem order_closed_from_evidence {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} (O : OrderPackage H) (E : OrderEvidence O) :
    OrderClosed O := by
  exact And.intro E.leqReflexiveClosed (And.intro E.leqTransitiveClosed (And.intro E.leqAntisymmetricClosed E.leqTotalClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
