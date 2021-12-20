import 'dart:convert';

import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class ForgotPassServices {
  static Future<bool> forgotPassDonator({
    required String email,
  }) async {
    try {
      final url = Uri.parse(AppUrl.baseUrl + "/forgot/donator");
      Map<String, String> requestBody = <String, String>{
        'email_donators': email,
      };

      var request = MultipartRequest("POST", url);
      request.fields.addAll(requestBody);

      StreamedResponse _response = await request.send();
      final respStr = await _response.stream.bytesToString();
      Map<String, dynamic> data = json.decode(respStr)["data"];
      return data['status_token'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<bool> tokenCheckDonator({
    required String email,
    required String tokenDonators,
  }) async {
    try {
      final url = Uri.parse(AppUrl.baseUrl + "/token/donator");
      Map<String, String> requestBody = <String, String>{
        'email_donators': email,
        'token_donators': tokenDonators,
      };

      var request = MultipartRequest("POST", url);
      request.fields.addAll(requestBody);

      StreamedResponse _response = await request.send();
      final respStr = await _response.stream.bytesToString();
      Map<String, dynamic> data = json.decode(respStr)["data"];
      return data['token_valid_status'];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> changePasswordDonator({
    required String email,
    required String tokenDonators,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final url = Uri.parse(AppUrl.baseUrl + "/forgot/donator");
      Map<String, String> requestBody = <String, String>{
        'email_donators': email,
        'token_donators': tokenDonators,
        'new_password': password,
        'confirm_password': confirmPassword,
      };

      var request = MultipartRequest("PUT", url);
      request.fields.addAll(requestBody);

      await request.send().then((response) {
        if (response.statusCode != 200) {
          throw Exception();
        }
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
