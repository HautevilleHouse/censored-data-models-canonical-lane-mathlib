import CensoredDataModelsCanonicalLaneLean.KaplanMeierBridge

/-!
# Cox Proportional Hazards Bridge Package
-/

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure CoxPHBridgePackage {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    {L : CensoredLikelihoodPackage M} {K : SurvivalAnalysisFoundation L}
    {B : KaplanMeierBridgePackage K} (C : CovariateModel B) where
  hazardRatioDefined : Prop
  partialLikelihoodDerived : Prop
  breslowEstimatorConstructed : Prop
  phAssumptionAssessable : Prop

structure CoxPHBridgeEvidence {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    {L : CensoredLikelihoodPackage M} {K : SurvivalAnalysisFoundation L}
    {B : KaplanMeierBridgePackage K} {C : CovariateModel B}
    (P : CoxPHBridgePackage C) where
  hazardRatioDefinedClosed : P.hazardRatioDefined
  partialLikelihoodDerivedClosed : P.partialLikelihoodDerived
  breslowEstimatorConstructedClosed : P.breslowEstimatorConstructed
  phAssumptionAssessableClosed : P.phAssumptionAssessable

def CoxPHBridgeClosed {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    {L : CensoredLikelihoodPackage M} {K : SurvivalAnalysisFoundation L}
    {B : KaplanMeierBridgePackage K} {C : CovariateModel B}
    (P : CoxPHBridgePackage C) : Prop :=
  P.hazardRatioDefined ∧ P.partialLikelihoodDerived ∧
  P.breslowEstimatorConstructed ∧ P.phAssumptionAssessable

theorem cox_ph_bridge_closed_from_evidence
    {D : CensoredDataDistribution} {T : TruncationMechanism D}
    {M : CensoringModel T} {L : CensoredLikelihoodPackage M}
    {K : SurvivalAnalysisFoundation L} {B : KaplanMeierBridgePackage K}
    {C : CovariateModel B} (P : CoxPHBridgePackage C)
    (E : CoxPHBridgeEvidence P) : CoxPHBridgeClosed P := by
  exact And.intro E.hazardRatioDefinedClosed
    (And.intro E.partialLikelihoodDerivedClosed
      (And.intro E.breslowEstimatorConstructedClosed
        E.phAssumptionAssessableClosed))

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
