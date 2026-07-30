import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure NaturalNumberConstruction where
  zero : Type
  succ : Type
  inductionPrinciple : Prop
  recursiveDefinition : Prop
  zeroDefined : zero
  succDefined : succ
  inductionPrincipleTerm : inductionPrinciple
  recursiveDefinitionTerm : recursiveDefinition

def NaturalNumberConstructionClosed (C : NaturalNumberConstruction) : Prop :=
  C.inductionPrinciple ∧ C.recursiveDefinition

theorem natural_number_construction_closed_from_evidence (C : NaturalNumberConstruction) (E : NaturalNumberConstructionEvidence C) : NaturalNumberConstructionClosed C :=
  And.intro E.inductionPrincipleClosed E.recursiveDefinitionClosed

structure NaturalNumberConstructionEvidence (C : NaturalNumberConstruction) where
  inductionPrincipleClosed : C.inductionPrinciple
  recursiveDefinitionClosed : C.recursiveDefinition

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
