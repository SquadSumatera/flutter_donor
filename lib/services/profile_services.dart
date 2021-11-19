import 'dart:io';

import 'package:flutter_donor/models/profile_model.dart';
import 'package:flutter_donor/models/update_password_model.dart';
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

  static Future<ProfileModel> updateProfileImage({
    required String token,
    required File file,
  }) async {
    var request = MultipartRequest(
      "PUT",
      Uri.parse(AppUrl.baseUrl + "/d/profile/image"),
    );
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });
    request.files.add(
      MultipartFile.fromBytes(
        "profile_image_donators",
        await file.readAsBytes(),
        filename: file.path.split("/").last,
      ),
    );
    return request.send().then((_response) async {
      if (_response.statusCode == 200) {
        return ProfileModel.fromRawJson(await _response.stream.bytesToString());
      } else {
        throw Exception(_response.stream.toString());
      }
    });
  }

  static Future<ProfileModel> updateProfile({
    required String token,
    required ProfileModel updatedData,
  }) async {
    Response _response = await put(
      Uri.parse(AppUrl.baseUrl + "/d/profile"),
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: updatedData.toRawJson(),
    );
    if (_response.statusCode == 200) {
      return ProfileModel.fromRawJson(_response.body);
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }

  static Future<ProfileModel> updatePassword({
    required String token,
    required UpdatePasswordModel updatedData,
  }) async {
    Response _response = await put(
      Uri.parse(AppUrl.baseUrl + "/d/profile/password"),
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: updatedData.toRawJson(),
    );
    if (_response.statusCode == 200) {
      return ProfileModel.fromRawJson(_response.body);
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
