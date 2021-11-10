import 'package:get/get.dart';

class RegisterKontakGetX extends GetxController {
  RxBool dontChange = false.obs;
  RxBool checkList = false.obs;

  void changeCheck() {
    checkList.value = !checkList.value;
  }
}
