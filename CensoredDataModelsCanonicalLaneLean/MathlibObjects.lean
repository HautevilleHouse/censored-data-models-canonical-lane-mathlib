import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Topology.Basic

/-!
# Mathlib Objects for Censored Data Models
-/

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure CensoredSpace where
  sampleSpace : Type
  sigmaAlgebra : Set (Set sampleSpace)
  censoringMechanism : sampleSpace → Prop

structure CensoredAdmittedObject where
  space : CensoredSpace
  survivalFunction : sampleSpace → ℝ
  censoringIndicator : sampleSpace → ℝ
  conclusion : survivalFunction = censoringIndicator

structure CensoredEndgameState where
  object : CensoredAdmittedObject

def CensoredWitnessClosed (O : CensoredAdmittedObject) : Prop :=
  O.conclusion

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
