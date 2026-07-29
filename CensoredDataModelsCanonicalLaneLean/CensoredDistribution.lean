import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure CensoredDistributionPackage where
  underlyingDistribution : Type u
  censoringThreshold : Type v
  observedData : Type w
  likelihoodFunction : Prop
  censoringMechanism : Prop
  identifiabilityCondition : Prop

structure CensoredDistributionEvidence (C : CensoredDistributionPackage) where
  likelihoodFunctionClosed : C.likelihoodFunction
  censoringMechanismClosed : C.censoringMechanism
  identifiabilityConditionClosed : C.identifiabilityCondition

def CensoredDistributionClosed (C : CensoredDistributionPackage) : Prop :=
  C.likelihoodFunction ∧ C.censoringMechanism ∧ C.identifiabilityCondition

theorem censored_distribution_closed_from_evidence
    (C : CensoredDistributionPackage) (E : CensoredDistributionEvidence C) :
    CensoredDistributionClosed C := by
  exact And.intro E.likelihoodFunctionClosed
    (And.intro E.censoringMechanismClosed E.identifiabilityConditionClosed)

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
