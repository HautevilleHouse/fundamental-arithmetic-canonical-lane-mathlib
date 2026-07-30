import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

-- | A package defining addition recursively.
structure AdditionPackage (A : PeanoAxiomsPackage) where
  add : ℕ → ℕ → ℕ
  addZero : ∀ m, add m 0 = m
  addSucc : ∀ m n, add m (A.succ n) = A.succ (add m n)

-- | Evidence that addition satisfies its defining equations.
structure AdditionEvidence {A : PeanoAxiomsPackage} (Add : AdditionPackage A) where
  addZeroClosed : ∀ m, Add.add m 0 = m
  addSuccClosed : ∀ m n, Add.add m (A.succ n) = A.succ (Add.add m n)

-- | Closure condition for addition.
def AdditionClosed {A : PeanoAxiomsPackage} (Add : AdditionPackage A) : Prop :=
  (∀ m, Add.add m 0 = m) ∧ (∀ m n, Add.add m (A.succ n) = A.succ (Add.add m n))

theorem addition_closed_from_evidence {A : PeanoAxiomsPackage}
    (Add : AdditionPackage A) (E : AdditionEvidence Add) : AdditionClosed Add := by
  exact And.intro E.addZeroClosed E.addSuccClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse