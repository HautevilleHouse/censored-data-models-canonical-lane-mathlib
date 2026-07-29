import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CensoredDataModelsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CensoredWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CensoredDataModelsCanonicalLaneLean
end HautevilleHouse
