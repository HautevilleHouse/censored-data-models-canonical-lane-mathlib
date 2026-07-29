import CensoredDataModelsCanonicalLaneLean.CensoredLikelihoodBridge

/-!
# Kaplan-Meier Bridge Package
-/

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure KaplanMeierBridgePackage {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    {L : CensoredLikelihoodPackage M} (K : SurvivalAnalysisFoundation L) where
  productLimitEstimatorDefined : Prop
  consistencyUnderIndependentCensoring : Prop
  asymptoticNormality : Prop
  confidenceBandsConstructible : Prop

structure KaplanMeierBridgeEvidence {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    {L : CensoredLikelihoodPackage M} {K : SurvivalAnalysisFoundation L}
    (B : KaplanMeierBridgePackage K) where
  productLimitEstimatorDefinedClosed : B.productLimitEstimatorDefined
  consistencyUnderIndependentCensoringClosed : B.consistencyUnderIndependentCensoring
  asymptoticNormalityClosed : B.asymptoticNormality
  confidenceBandsConstructibleClosed : B.confidenceBandsConstructible

def KaplanMeierBridgeClosed {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    {L : CensoredLikelihoodPackage M} {K : SurvivalAnalysisFoundation L}
    (B : KaplanMeierBridgePackage K) : Prop :=
  B.productLimitEstimatorDefined ∧ B.consistencyUnderIndependentCensoring ∧
  B.asymptoticNormality ∧ B.confidenceBandsConstructible

theorem kaplan_meier_bridge_closed_from_evidence
    {D : CensoredDataDistribution} {T : TruncationMechanism D}
    {M : CensoringModel T} {L : CensoredLikelihoodPackage M}
    {K : SurvivalAnalysisFoundation L} (B : KaplanMeierBridgePackage K)
    (E : KaplanMeierBridgeEvidence B) : KaplanMeierBridgeClosed B := by
  exact And.intro E.productLimitEstimatorDefinedClosed
    (And.intro E.consistencyUnderIndependentCensoringClosed
      (And.intro E.asymptoticNormalityClosed
        E.confidenceBandsConstructibleClosed))

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
