import 'package:flutter_donor/models/google_signin_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class LoginGoogleServices {
  static Future<GoogleSignInModel> loginGoogleServices(
      {required String token}) async {
    Response _response = await post(
      Uri.parse(
        AppUrl.baseUrl + "/login/donator/google",
      ),
      body: <String, String>{
        "access_token": token,
      },
    );
    return GoogleSignInModel.fromJson(_response.body);
  }
}
