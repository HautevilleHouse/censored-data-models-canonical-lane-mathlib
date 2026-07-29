import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure KaplanMeierEstimatorPackage {C : CensoredDistributionPackage}
    (D : CensoredDistributionPackage) where
  survivalFunction : D.observedData → Prop
  productLimitFormula : Prop
  asymptoticProperties : Prop
  consistencyUnderCensoring : Prop

structure KaplanMeierEstimatorEvidence {C : CensoredDistributionPackage}
    {D : CensoredDistributionPackage} (K : KaplanMeierEstimatorPackage D) where
  survivalFunctionClosed : K.survivalFunction
  productLimitFormulaClosed : K.productLimitFormula
  asymptoticPropertiesClosed : K.asymptoticProperties
  consistencyUnderCensoringClosed : K.consistencyUnderCensoring

def KaplanMeierEstimatorClosed {C : CensoredDistributionPackage}
    {D : CensoredDistributionPackage} (K : KaplanMeierEstimatorPackage D) : Prop :=
  K.survivalFunction ∧ K.productLimitFormula ∧
  K.asymptoticProperties ∧ K.consistencyUnderCensoring

theorem kaplan_meier_estimator_closed_from_evidence
    {C : CensoredDistributionPackage} {D : CensoredDistributionPackage}
    (K : KaplanMeierEstimatorPackage D) (E : KaplanMeierEstimatorEvidence K) :
    KaplanMeierEstimatorClosed K := by
  exact And.intro E.survivalFunctionClosed
    (And.intro E.productLimitFormulaClosed
      (And.intro E.asymptoticPropertiesClosed E.consistencyUnderCensoringClosed))

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
