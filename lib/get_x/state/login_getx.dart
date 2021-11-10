import 'package:get/get.dart';

class LoginGetX extends GetxController {
  RxString email = "".obs;
  RxString pass = "".obs;
  RxBool dontChange = false.obs;
  RxBool obscure = true.obs;
  RxString finalPass = "".obs;

  void changeEmail(String cEmail) {
    email.value = cEmail;
  }

  void changePass(String cPass) {
    pass.value = cPass;
  }

  void changeObscure() {
    obscure.value = !obscure.value;
  }

  void changeFinalPass(String cPass) {
    finalPass.value = cPass;
  }
}
