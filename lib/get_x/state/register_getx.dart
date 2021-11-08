import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxString name = "".obs;

  void changeName(String cName) {
    name.value = cName;
  }
}
