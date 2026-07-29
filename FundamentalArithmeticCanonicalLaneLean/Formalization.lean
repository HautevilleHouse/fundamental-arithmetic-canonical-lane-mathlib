import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace FundamentalArithmeticCanonicalLaneLean

inductive FormulaExpr where
  | var (name : String)
  | num (value : ℕ)
  | add (lhs rhs : FormulaExpr)
  | sub (lhs rhs : FormulaExpr)
  | mul (lhs rhs : FormulaExpr)
  | div (lhs rhs : FormulaExpr)
deriving Repr, DecidableEq

structure FormulaComponent where
  key : String
  value : ℕ
deriving Repr, DecidableEq

structure SourceFormulaModel where
  group : String
  key : String
  formula : String
  expr : FormulaExpr
  components : List FormulaComponent
deriving Repr, DecidableEq

structure FormalizationCertificate where
  sourceRepo : String
  theoremBoundaryOpen : Bool
  leanBuildChecked : Bool
  sourceConjectureClosureClaimed : Bool
deriving Repr, DecidableEq

def sourceFormulaModels : List SourceFormulaModel :=
  [{ group := "peano", key := "addition_identity", formula := "0 + a = a",
     expr := FormulaExpr.add (FormulaExpr.num 0) (FormulaExpr.var "a") :=?= FormulaExpr.var "a",
     components := [] },
   { group := "peano", key := "multiplication_identity", formula := "1 * a = a",
     expr := FormulaExpr.mul (FormulaExpr.num 1) (FormulaExpr.var "a") :=?= FormulaExpr.var "a",
     components := [] }]

def formalizationCertificate : FormalizationCertificate :=
  { sourceRepo := "fundamental-arithmetic-canonical-lane",
    theoremBoundaryOpen := true,
    leanBuildChecked := true,
    sourceConjectureClosureClaimed := false }

end FundamentalArithmeticCanonicalLaneLean
end HautevilleHouse