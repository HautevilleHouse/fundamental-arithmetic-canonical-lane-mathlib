import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

structure AdditionRecursiveDefinitionPackage (N : Type) (zero : N) (succ : N → N) where
  add : N → N → N
  addZero : ∀ m : N, add m zero = m
  addSucc : ∀ m n : N, add m (succ n) = succ (add m n)

structure AdditionRecursiveDefinitionEvidence {N : Type} {zero : N} {succ : N → N}
    (A : AdditionRecursiveDefinitionPackage N zero succ) where
  addZeroClosed : ∀ m : N, A.add m zero = m
  addSuccClosed : ∀ m n : N, A.add m (succ n) = succ (A.add m n)

def AdditionRecursiveDefinitionClosed {N : Type} {zero : N} {succ : N → N}
    (A : AdditionRecursiveDefinitionPackage N zero succ) : Prop :=
  (∀ m : N, A.add m zero = m) ∧ (∀ m n : N, A.add m (succ n) = succ (A.add m n))

theorem addition_recursive_definition_closed_from_evidence
    {N : Type} {zero : N} {succ : N → N}
    (A : AdditionRecursiveDefinitionPackage N zero succ)
    (E : AdditionRecursiveDefinitionEvidence A) :
    AdditionRecursiveDefinitionClosed A := by
  exact And.intro E.addZeroClosed E.addSuccClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse