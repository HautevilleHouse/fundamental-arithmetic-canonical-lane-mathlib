import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure PrimeFactorizationPackage where
  primeDefinition : Prop
  fundamentalTheoremArithmetic : Prop
  factorizationExistence : Prop
  factorizationUniqueness : Prop
  primeDefinitionTerm : primeDefinition
  fundamentalTheoremArithmeticTerm : fundamentalTheoremArithmetic
  factorizationExistenceTerm : factorizationExistence
  factorizationUniquenessTerm : factorizationUniqueness

structure PrimeFactorizationEvidence (P : PrimeFactorizationPackage) where
  primeDefinitionClosed : P.primeDefinition
  fundamentalTheoremArithmeticClosed : P.fundamentalTheoremArithmetic
  factorizationExistenceClosed : P.factorizationExistence
  factorizationUniquenessClosed : P.factorizationUniqueness

def PrimeFactorizationClosed (P : PrimeFactorizationPackage) : Prop :=
  P.primeDefinition ∧ P.fundamentalTheoremArithmetic ∧ P.factorizationExistence ∧ P.factorizationUniqueness

theorem prime_factorization_closed_from_evidence (P : PrimeFactorizationPackage) (E : PrimeFactorizationEvidence P) : PrimeFactorizationClosed P :=
  And.intro E.primeDefinitionClosed (And.intro E.fundamentalTheoremArithmeticClosed (And.intro E.factorizationExistenceClosed E.factorizationUniquenessClosed))

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
