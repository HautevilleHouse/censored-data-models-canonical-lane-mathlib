import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure RightCensoredInferencePackage where
  observedTimes : Type u
  censoringTimes : Type v
  independentCensoringAssumption : Prop
  inferenceFramework : Prop
  independentCensoringAssumptionClosed : independentCensoringAssumption
  inferenceFrameworkClosed : inferenceFramework

structure RightCensoredInferenceEvidence (R : RightCensoredInferencePackage) where
  independentCensoringAssumptionClosed : R.independentCensoringAssumption
  inferenceFrameworkClosed : R.inferenceFramework

def RightCensoredInferenceClosed (R : RightCensoredInferencePackage) : Prop :=
  R.independentCensoringAssumption ∧ R.inferenceFramework

theorem right_censored_inference_closed_from_evidence (R : RightCensoredInferencePackage)
    (E : RightCensoredInferenceEvidence R) : RightCensoredInferenceClosed R := by
  exact And.intro E.independentCensoringAssumptionClosed E.inferenceFrameworkClosed

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse