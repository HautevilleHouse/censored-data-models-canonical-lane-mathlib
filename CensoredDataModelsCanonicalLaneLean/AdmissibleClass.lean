import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

structure AdmissibleClass where
  object : CensoredAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  CensoredWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
