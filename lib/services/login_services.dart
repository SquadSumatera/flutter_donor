import 'package:flutter_donor/models/login_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class LoginServices {
  static Future<LoginModel> loginCheck({
    required String emailDonators,
    required String passwordDonators,
  }) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/login/donator"),
      body: <String, String>{
        "email_donators": emailDonators,
        "password_donators": passwordDonators,
      },
    );

    return LoginModel.fromJson(_response.body);
  }
}
