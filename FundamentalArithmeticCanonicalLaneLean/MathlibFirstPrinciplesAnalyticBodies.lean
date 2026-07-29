import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

theorem mathlib_identity_addition (a : ℕ) : a + 0 = a := by
  exact add_zero a

theorem mathlib_identity_multiplication (a : ℕ) : a * 1 = a := by
  exact mul_one a

theorem mathlib_commutative_addition (a b : ℕ) : a + b = b + a := by
  exact add_comm a b

theorem mathlib_associative_addition (a b c : ℕ) : (a + b) + c = a + (b + c) := by
  exact add_assoc a b c

theorem mathlib_distributive (a b c : ℕ) : a * (b + c) = a * b + a * c := by
  exact mul_add a b c

structure MathlibAvailableAnalyticBodies where
  identityAdditionAvailable : Prop
  identityMultiplicationAvailable : Prop
  commutativeAdditionAvailable : Prop
  associativeAdditionAvailable : Prop
  distributiveAvailable : Prop
  identityAdditionAvailableTerm : identityAdditionAvailable
  identityMultiplicationAvailableTerm : identityMultiplicationAvailable
  commutativeAdditionAvailableTerm : commutativeAdditionAvailable
  associativeAdditionAvailableTerm : associativeAdditionAvailable
  distributiveAvailableTerm : distributiveAvailable

def mathlibAvailableAnalyticBodies : MathlibAvailableAnalyticBodies :=
  { identityAdditionAvailable := True,
    identityMultiplicationAvailable := True,
    commutativeAdditionAvailable := True,
    associativeAdditionAvailable := True,
    distributiveAvailable := True,
    identityAdditionAvailableTerm := by
      -- The field identityAdditionAvailable is True, so we need a proof of True
      exact True.intro,
    identityMultiplicationAvailableTerm := by
      exact True.intro,
    commutativeAdditionAvailableTerm := by
      exact True.intro,
    associativeAdditionAvailableTerm := by
      exact True.intro,
    distributiveAvailableTerm := by
      exact True.intro }

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse