import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataCanonicalLaneLean

structure NonparametricCensoringModel where
  productLimitEstimator : Prop
  greenwoodVariance : Prop
  confidenceInterval : Prop
  censoringDistributionEstimated : Prop

structure NonparametricCensoringEvidence (A : AdmissibleClass) (N : NonparametricCensoringModel) where
  productLimitEstimatorClosed : N.productLimitEstimator
  greenwoodVarianceClosed : N.greenwoodVariance
  confidenceIntervalClosed : N.confidenceInterval
  censoringDistributionEstimatedClosed : N.censoringDistributionEstimated

def NonparametricCensoringClosed (N : NonparametricCensoringModel) : Prop :=
  N.productLimitEstimator ∧ N.greenwoodVariance ∧
  N.confidenceInterval ∧ N.censoringDistributionEstimated

theorem nonparametric_censoring_closed_from_evidence
    (N : NonparametricCensoringModel) (E : NonparametricCensoringEvidence A N) :
    NonparametricCensoringClosed N := by
  exact And.intro E.productLimitEstimatorClosed
    (And.intro E.greenwoodVarianceClosed
      (And.intro E.confidenceIntervalClosed E.censoringDistributionEstimatedClosed))

end CensoredDataCanonicalLaneLean
end HautevilleHouse