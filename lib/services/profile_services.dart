import 'package:flutter_donor/models/profile_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class ProfileServices {
  static Future<ProfileModel> getProfile({
    required String token,
  }) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/d/profile"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (_response.statusCode == 201) {
      return ProfileModel.fromRawJson(_response.body);
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
