import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure MultiplicationRecursiveDefinitionPackage (N : Type) (zero : N) (succ : N → N) (add : N → N → N) where
  mul : N → N → N
  mulZero : ∀ m : N, mul m zero = zero
  mulSucc : ∀ m n : N, mul m (succ n) = add (mul m n) m

structure MultiplicationRecursiveDefinitionEvidence {N : Type} {zero : N} {succ : N → N} {add : N → N → N}
    (M : MultiplicationRecursiveDefinitionPackage N zero succ add) where
  mulZeroClosed : ∀ m : N, M.mul m zero = zero
  mulSuccClosed : ∀ m n : N, M.mul m (succ n) = add (M.mul m n) m

def MultiplicationRecursiveDefinitionClosed {N : Type} {zero : N} {succ : N → N} {add : N → N → N}
    (M : MultiplicationRecursiveDefinitionPackage N zero succ add) : Prop :=
  (∀ m : N, M.mul m zero = zero) ∧ (∀ m n : N, M.mul m (succ n) = add (M.mul m n) m)

theorem multiplication_recursive_definition_closed_from_evidence
    {N : Type} {zero : N} {succ : N → N} {add : N → N → N}
    (M : MultiplicationRecursiveDefinitionPackage N zero succ add)
    (E : MultiplicationRecursiveDefinitionEvidence M) :
    MultiplicationRecursiveDefinitionClosed M := by
  exact And.intro E.mulZeroClosed E.mulSuccClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse