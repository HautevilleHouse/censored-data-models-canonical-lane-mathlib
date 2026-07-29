import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure NonparametricMLEPackage where
  distributionFunction : Type u
  censoringIndicatorFunction : Type v
  empiricalDistributions : Prop
  mleCharacterization : Prop
  consistency : Prop
  mleCharacterizationClosed : mleCharacterization
  consistencyClosed : consistency

structure NonparametricMLEEvidence (N : NonparametricMLEPackage) where
  mleCharacterizationClosed : N.mleCharacterization
  consistencyClosed : N.consistency

def NonparametricMLEClosed (N : NonparametricMLEPackage) : Prop :=
  N.mleCharacterization ∧ N.consistency

theorem nonparametric_mle_closed_from_evidence (N : NonparametricMLEPackage)
    (E : NonparametricMLEEvidence N) : NonparametricMLEClosed N := by
  exact And.intro E.mleCharacterizationClosed E.consistencyClosed

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse