import canonicalLaneMathlib.AdmissibleClass
import CensoredDataModelsCanonicalLaneLean.BridgeLemmas
import CensoredDataModelsCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

def CensoredDataClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem censored_data_endgame (A : AdmissibleClass) :
    CensoredDataClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse