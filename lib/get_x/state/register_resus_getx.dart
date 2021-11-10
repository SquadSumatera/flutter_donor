import 'package:get/get.dart';

class RegisterResusGetX extends GetxController {
  var resus = [true, false].obs;
  var tResus = "+".obs;

  void changeResus(int pick) {
    for (var i = 0; i < resus.length; i++) {
      resus[i] = false;
    }
    resus[pick] = true;
  }

  void changeTypeResus(String cType) {
    tResus.value = cType;
  }
}
