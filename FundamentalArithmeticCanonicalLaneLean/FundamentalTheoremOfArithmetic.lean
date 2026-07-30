import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.PeanoAxioms
import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.AdditionMultiplication
import HautevilleHouse.FundamentalArithmeticCanonicalLaneLean.OrderProperties

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure FundamentalTheoremOfArithmeticPackage {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} {A : AdditionPackage H} {M : MultiplicationPackage A} {O : OrderPackage H} where
  primeDefinition : P.zeroElement → Prop
  factorizationExistence : ∀ n : P.zeroElement, n ≠ P.zeroElement → ∃ (l : List P.zeroElement), (∀ p ∈ l, primeDefinition p) ∧ M.mulList l = n
  factorizationUniqueness : ∀ (n : P.zeroElement) (l1 l2 : List P.zeroElement), (∀ p ∈ l1, primeDefinition p) → (∀ p ∈ l2, primeDefinition p) → M.mulList l1 = n → M.mulList l2 = n → l1.perm l2

structure FundamentalTheoremOfArithmeticEvidence {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} {A : AdditionPackage H} {M : MultiplicationPackage A} {O : OrderPackage H} (F : FundamentalTheoremOfArithmeticPackage P H A M O) where
  primeDefinitionClosed : P.zeroElement → Prop
  factorizationExistenceClosed : ∀ n : P.zeroElement, n ≠ P.zeroElement → ∃ (l : List P.zeroElement), (∀ p ∈ l, F.primeDefinition p) ∧ M.mulList l = n
  factorizationUniquenessClosed : ∀ (n : P.zeroElement) (l1 l2 : List P.zeroElement), (∀ p ∈ l1, F.primeDefinition p) → (∀ p ∈ l2, F.primeDefinition p) → M.mulList l1 = n → M.mulList l2 = n → l1.perm l2

def FundamentalTheoremOfArithmeticClosed {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} {A : AdditionPackage H} {M : MultiplicationPackage A} {O : OrderPackage H} (F : FundamentalTheoremOfArithmeticPackage P H A M O) : Prop :=
  (∀ n : P.zeroElement, n ≠ P.zeroElement → ∃ (l : List P.zeroElement), (∀ p ∈ l, F.primeDefinition p) ∧ M.mulList l = n) ∧
  (∀ (n : P.zeroElement) (l1 l2 : List P.zeroElement), (∀ p ∈ l1, F.primeDefinition p) → (∀ p ∈ l2, F.primeDefinition p) → M.mulList l1 = n → M.mulList l2 = n → l1.perm l2)

theorem fundamental_theorem_of_arithmetic_closed_from_evidence {P : PeanoAxiomsPackage} {H : PeanoAxiomsEvidence P} {A : AdditionPackage H} {M : MultiplicationPackage A} {O : OrderPackage H} (F : FundamentalTheoremOfArithmeticPackage P H A M O) (E : FundamentalTheoremOfArithmeticEvidence F) :
    FundamentalTheoremOfArithmeticClosed F := by
  exact And.intro E.factorizationExistenceClosed E.factorizationUniquenessClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse
