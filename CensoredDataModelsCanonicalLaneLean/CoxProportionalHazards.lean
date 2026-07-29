import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure CoxProportionalHazardsPackage where
  covariateSpace : Type u
  baselineHazard : Type v
  regressionCoefficients : Type w
  partialLikelihood : Prop
  proportionalHazardsAssumption : Prop
  partialLikelihoodClosed : partialLikelihood
  proportionalHazardsAssumptionClosed : proportionalHazardsAssumption

structure CoxProportionalHazardsEvidence (C : CoxProportionalHazardsPackage) where
  partialLikelihoodClosed : C.partialLikelihood
  proportionalHazardsAssumptionClosed : C.proportionalHazardsAssumption

def CoxProportionalHazardsClosed (C : CoxProportionalHazardsPackage) : Prop :=
  C.partialLikelihood ∧ C.proportionalHazardsAssumption

theorem cox_proportional_hazards_closed_from_evidence (C : CoxProportionalHazardsPackage)
    (E : CoxProportionalHazardsEvidence C) : CoxProportionalHazardsClosed C := by
  exact And.intro E.partialLikelihoodClosed E.proportionalHazardsAssumptionClosed

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse