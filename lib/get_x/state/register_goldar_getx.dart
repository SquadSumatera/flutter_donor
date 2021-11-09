import 'package:get/get.dart';

class RegisterGolDarGetX extends GetxController {
  var golDar = [false, false, false, false].obs;

  void changeNew(int pick) {
    for (var i = 0; i < golDar.length; i++) {
      golDar[i] = false;
    }
    golDar[pick] = true;
  }
}
