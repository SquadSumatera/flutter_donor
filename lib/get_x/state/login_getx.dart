import 'package:flutter_donor/models/google_signin_model.dart';
import 'package:flutter_donor/services/login_google_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginGetX extends GetxController {
  RxString email = "".obs;
  RxString pass = "".obs;
  RxBool dontChange = false.obs;
  RxBool obscure = true.obs;
  RxString finalPass = "".obs;
  RxString token = "".obs;
  RxBool isDone = true.obs;
  RxBool onBoard = true.obs;
  GoogleSignInModel? googleSignInModel;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  Future googleSignIn() async {
    try {
      var result = await _googleSignIn.signIn();
      if (result != null) {
        var auth = await result.authentication;
        if (auth.idToken != null) {
          print("Ini ID Token" + auth.idToken!);
          try {
            googleSignInModel = await LoginGoogleServices.loginGoogleServices(
                token: auth.idToken!);
          } catch (e) {
            print(e);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void googleSignInBackEnd(String token) async {
    try {
      googleSignInModel =
          await LoginGoogleServices.loginGoogleServices(token: token);
    } catch (e) {
      print(e);
    }
  }

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
