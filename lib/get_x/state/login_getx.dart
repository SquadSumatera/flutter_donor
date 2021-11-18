import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginGetX extends GetxController {
  RxString email = "".obs;
  RxString pass = "".obs;
  RxBool dontChange = false.obs;
  RxBool obscure = true.obs;
  RxString finalPass = "".obs;
  RxString token = "".obs;
  RxBool isDone = true.obs;
  RxBool onBoard = true.obs;

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

  void changeToken(String cToken) {
    token.value = cToken;
  }

  void changeOnBoard(bool cOnBoard) {
    onBoard.value = cOnBoard;
  }

  Future<void> setDataToken(String token) async {
    final sPref = await SharedPreferences.getInstance();
    await sPref.setString("token", token);
    print("Ini token ${sPref.getString("token")}");
  }

  void changeStatus() {
    isDone.value = !isDone.value;
  }
}
