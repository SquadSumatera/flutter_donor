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

  Future<void> setDataToken(String token) async {
    final sPref = await SharedPreferences.getInstance();
    await sPref.setString("token", token);
  }

  void changeStatus() {
    isDone.value = !isDone.value;
  }

  // Future<String?> getDataToken() async {
  //   final sPref = await SharedPreferences.getInstance();
  //   return sPref.getString("token")!.toString();
  //   // return sPref.getInt("num")!.toInt();
  // }

  // void setDataToken() async {
  //   String? token = await getDataToken();
  //   tokenShr.value = token!;
  //   // int? data = await getData();
  //   // num.value = data!;
  // }

}
