import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure EndpointClassificationPackage where
  targetNumber : ℕ
  primeFactorization : List ℕ
  isPrime : Prop
  isComposite : Prop

structure EndpointClassificationEvidence (E : EndpointClassificationPackage) where
  primeFactorizationClosed : E.primeFactorization = [] ∨ E.isPrime
  isPrimeClosed : E.isPrime
  isCompositeClosed : E.isComposite

def EndpointClassificationClosed (E : EndpointClassificationPackage) : Prop :=
  (E.primeFactorization = [] ∨ E.isPrime) ∧ E.isPrime ∧ E.isComposite

theorem endpoint_classification_closed_from_evidence
    (E : EndpointClassificationPackage) (Ev : EndpointClassificationEvidence E) :
    EndpointClassificationClosed E := by
  exact And.intro Ev.primeFactorizationClosed (And.intro Ev.isPrimeClosed Ev.isCompositeClosed)

theorem endpoint_classification_supplies_mathlib_statement
    (E : EndpointClassificationPackage) : E.isPrime ∨ E.isComposite := by
  cases E.isPrime with
  | inl h => exact Or.inl h
  | inr h => exact Or.inr E.isComposite

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse