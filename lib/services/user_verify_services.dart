import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class UserVerify {
  static Future userVerify({required String token}) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/d/profile/verif"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return _response.statusCode;
  }
}
