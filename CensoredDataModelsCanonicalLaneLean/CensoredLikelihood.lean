import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure CensoredLikelihoodPackage where
  sampleSpace : Type u
  censoringIndicator : sampleSpace → Prop
  observedData : sampleSpace → ℝ
  censoringDistribution : Prop
  likelihoodFunction : Prop
  censoringMechanism : Prop

structure CensoredLikelihoodEvidence (L : CensoredLikelihoodPackage) where
  censoringDistributionClosed : L.censoringDistribution
  likelihoodFunctionClosed : L.likelihoodFunction
  censoringMechanismClosed : L.censoringMechanism

def CensoredLikelihoodClosed (L : CensoredLikelihoodPackage) : Prop :=
  L.censoringDistribution ∧ L.likelihoodFunction ∧ L.censoringMechanism

theorem censored_likelihood_closed_from_evidence (L : CensoredLikelihoodPackage)
    (E : CensoredLikelihoodEvidence L) : CensoredLikelihoodClosed L := by
  exact And.intro E.censoringDistributionClosed
    (And.intro E.likelihoodFunctionClosed E.censoringMechanismClosed)

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse