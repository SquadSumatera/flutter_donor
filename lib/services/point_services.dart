import 'package:flutter_donor/models/point_user_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class PointServices {
  static Future<PointUser> getPointUser({required String token}) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/d/profile/skor"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return PointUser.fromJson(_response.body);
  }
}
