import 'package:get/get.dart';

class RegisterKontakGetX extends GetxController {
  RxBool dontChange = false.obs;
  RxBool checkList = false.obs;
  RxBool isDone = true.obs;

  RxString address = "".obs;
  RxString phone = "".obs;

  void changeCheck() {
    checkList.value = !checkList.value;
  }

  void changeStatus() {
    isDone.value = !isDone.value;
  }

  void changeAddress(String cAddress) {
    address.value = cAddress;
  }

  void changePhone(String cPhone) {
    phone.value = cPhone;
  }
}
