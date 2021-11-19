import 'dart:io';

import 'package:flutter_donor/models/token_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class TokenServices {
  static Future<TokenModel> tokenCheck({required String token}) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/d/profile"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    return TokenModel.fromJson(_response.body);
  }
}
