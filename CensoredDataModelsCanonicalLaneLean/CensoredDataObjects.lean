import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataCanonicalLaneLean

structure CensoredDataSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure CensoredDataAdmittedObject where
  space : CensoredDataSpace
  survivalFunctionDefined : Prop
  censoringMechanismModeled : Prop
  likelihoodFunctionDefined : Prop
  conclusion : likelihoodFunctionDefined

structure CensoredDataEndgameState where
  object : CensoredDataAdmittedObject

def CensoredDataWitnessClosed (O : CensoredDataAdmittedObject) : Prop :=
  O.likelihoodFunctionDefined

end CensoredDataCanonicalLaneLean
end HautevilleHouse