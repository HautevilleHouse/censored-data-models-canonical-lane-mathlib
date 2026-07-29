import CensoredDataModelsCanonicalLaneLean.AdmissibleClass

/-!
# Censored Likelihood Bridge Package
-/

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure CensoredLikelihoodPackage {D : CensoredDataDistribution}
    {T : TruncationMechanism D} (M : CensoringModel T) where
  likelihoodFunction : Type u
  censoringAdjusted : Prop
  identifiabilityCondition : Prop
  invarianceUnderTransform : Prop

structure CensoredLikelihoodEvidence {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    (L : CensoredLikelihoodPackage M) where
  likelihoodFunctionClosed : L.likelihoodFunction
  censoringAdjustedClosed : L.censoringAdjusted
  identifiabilityConditionClosed : L.identifiabilityCondition
  invarianceUnderTransformClosed : L.invarianceUnderTransform

def CensoredLikelihoodClosed {D : CensoredDataDistribution}
    {T : TruncationMechanism D} {M : CensoringModel T}
    (L : CensoredLikelihoodPackage M) : Prop :=
  L.likelihoodFunction ∧ L.censoringAdjusted ∧
  L.identifiabilityCondition ∧ L.invarianceUnderTransform

theorem censored_likelihood_closed_from_evidence
    {D : CensoredDataDistribution} {T : TruncationMechanism D}
    {M : CensoringModel T} (L : CensoredLikelihoodPackage M)
    (E : CensoredLikelihoodEvidence L) : CensoredLikelihoodClosed L := by
  exact And.intro E.likelihoodFunctionClosed
    (And.intro E.censoringAdjustedClosed
      (And.intro E.identifiabilityConditionClosed
        E.invarianceUnderTransformClosed))

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
