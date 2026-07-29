import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure SurvivalModelPackage where
  timeVariable : Type u
  censoringIndicator : Type v
  eventTimeDistribution : Prop
  censoringDistribution : Prop
  independentCensoring : Prop
  survivalFunction : Prop
  hazardFunction : Prop

structure SurvivalModelEvidence (S : SurvivalModelPackage) where
  independentCensoringClosed : S.independentCensoring
  survivalFunctionClosed : S.survivalFunction
  hazardFunctionClosed : S.hazardFunction

def SurvivalModelClosed (S : SurvivalModelPackage) : Prop :=
  S.independentCensoring ∧ S.survivalFunction ∧ S.hazardFunction

theorem survival_model_closed_from_evidence (S : SurvivalModelPackage)
    (E : SurvivalModelEvidence S) : SurvivalModelClosed S := by
  exact And.intro E.independentCensoringClosed
    (And.intro E.survivalFunctionClosed E.hazardFunctionClosed)

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse