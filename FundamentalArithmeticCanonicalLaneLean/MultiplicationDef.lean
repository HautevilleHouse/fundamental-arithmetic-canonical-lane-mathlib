import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

-- | A package defining multiplication recursively via addition.
structure MultiplicationPackage (A : PeanoAxiomsPackage) (Add : AdditionPackage A) where
  mul : ℕ → ℕ → ℕ
  mulZero : ∀ m, mul m 0 = 0
  mulSucc : ∀ m n, mul m (A.succ n) = Add.add (mul m n) m

-- | Evidence that multiplication satisfies its defining equations.
structure MultiplicationEvidence {A : PeanoAxiomsPackage} {Add : AdditionPackage A}
    (Mul : MultiplicationPackage A Add) where
  mulZeroClosed : ∀ m, Mul.mul m 0 = 0
  mulSuccClosed : ∀ m n, Mul.mul m (A.succ n) = Add.add (Mul.mul m n) m

-- | Closure condition for multiplication.
def MultiplicationClosed {A : PeanoAxiomsPackage} {Add : AdditionPackage A}
    (Mul : MultiplicationPackage A Add) : Prop :=
  (∀ m, Mul.mul m 0 = 0) ∧ (∀ m n, Mul.mul m (A.succ n) = Add.add (Mul.mul m n) m)

theorem multiplication_closed_from_evidence {A : PeanoAxiomsPackage} {Add : AdditionPackage A}
    (Mul : MultiplicationPackage A Add) (E : MultiplicationEvidence Mul) :
    MultiplicationClosed Mul := by
  exact And.intro E.mulZeroClosed E.mulSuccClosed

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse