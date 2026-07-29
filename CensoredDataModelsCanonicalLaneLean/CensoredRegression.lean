import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CensoredDataModelsCanonicalLaneLean.SurvivalModels

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure CensoredRegressionPackage {S : SurvivalModelPackage} where
  responseVariable : Type u
  covariates : Type v
  regressionFunction : Prop
  errorDistribution : Prop
  censoringDistribution : Prop
  identifiability : Prop

structure CensoredRegressionEvidence {S : SurvivalModelPackage}
    (R : CensoredRegressionPackage S) where
  regressionFunctionClosed : R.regressionFunction
  errorDistributionClosed : R.errorDistribution
  censoringDistributionClosed : R.censoringDistribution
  identifiabilityClosed : R.identifiability

def CensoredRegressionClosed {S : SurvivalModelPackage}
    (R : CensoredRegressionPackage S) : Prop :=
  R.regressionFunction ∧ R.errorDistribution ∧ R.censoringDistribution ∧ R.identifiability

theorem censored_regression_closed_from_evidence
    {S : SurvivalModelPackage} (R : CensoredRegressionPackage S)
    (E : CensoredRegressionEvidence R) : CensoredRegressionClosed R := by
  exact And.intro E.regressionFunctionClosed
    (And.intro E.errorDistributionClosed
      (And.intro E.censoringDistributionClosed E.identifiabilityClosed))

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse