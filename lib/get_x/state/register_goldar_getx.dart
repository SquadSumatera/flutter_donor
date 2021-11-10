import 'package:get/get.dart';

class RegisterGolDarGetX extends GetxController {
  var golDar = [true, false, false, false].obs;
  var type = "A".obs;

  void changeGoldar(int pick) {
    for (var i = 0; i < golDar.length; i++) {
      golDar[i] = false;
    }
    golDar[pick] = true;
  }

  void changeTypeGoldar(String cType) {
    type.value = cType;
  }
}
