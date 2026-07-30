import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure NaturalNumber where
  one : Type
  succ : Type -> Type
  additionDefined : Prop
  multiplicationDefined : Prop
  inductionPrinciple : Prop
  additionDefinedTerm : additionDefined
  multiplicationDefinedTerm : multiplicationDefined
  inductionPrincipleTerm : inductionPrinciple

structure ArithmeticObject where
  numbers : NaturalNumber
  peanoAxioms : Prop
  ringStructure : Prop
  orderStructure : Prop
  peanoAxiomsTerm : peanoAxioms
  ringStructureTerm : ringStructure
  orderStructureTerm : orderStructure

structure AdmittedArithmeticObject where
  object : ArithmeticObject
  conclusion : object.peanoAxioms

def ArithmeticWitnessClosed (O : AdmittedArithmeticObject) : Prop :=
  O.conclusion

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse