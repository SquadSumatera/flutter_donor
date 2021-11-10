import 'package:get/get.dart';

class RegisterController extends GetxController {
  RxString name = "".obs;
  RxString email = "".obs;
  RxBool dontChange = false.obs;
  RxBool obscure = true.obs;
  RxString firstPass = "".obs;
  RxString finalPass = "".obs;

  void changeName(String cName) {
    name.value = cName;
  }

  void changeEmail(String cEmail) {
    email.value = cEmail;
  }

  void changeObscure() {
    obscure.value = !obscure.value;
  }

  void changeFirstPass(String pass) {
    firstPass.value = pass;
  }

  void changeFinalPass(String pass) {
    finalPass.value = pass;
  }
}
