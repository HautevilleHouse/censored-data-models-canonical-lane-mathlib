import canonicalLaneMathlib.AdmissibleClass
import CensoredDataCanonicalLaneLean.CensoredDataObjects

namespace HautevilleHouse
namespace CensoredDataCanonicalLaneLean

structure AFTModel where
  logSurvivalTime : Type
  covariates : Type
  linearModelAssumption : Prop
  errorDistribution : Prop
  parametersEstimated : Prop

structure AFTEvidence (A : AdmissibleClass) (M : AFTModel) where
  linearModelAssumptionClosed : M.linearModelAssumption
  errorDistributionClosed : M.errorDistribution
  parametersEstimatedClosed : M.parametersEstimated

def AFTClosed (M : AFTModel) : Prop :=
  M.linearModelAssumption ∧ M.errorDistribution ∧ M.parametersEstimated

theorem aft_closed_from_evidence (M : AFTModel) (E : AFTEvidence A M) :
    AFTClosed M := by
  exact And.intro E.linearModelAssumptionClosed
    (And.intro E.errorDistributionClosed E.parametersEstimatedClosed)

end CensoredDataCanonicalLaneLean
end HautevilleHouse