import 'dart:convert';

import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class InstitutionServices {
  static Future<List<Datum?>> listInstitution({
    required String token,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/institutions"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    return InstitutionsModel.fromJson(_response.body).data!;
  }

  static Future<Datum?> getInstitutionDetail({
    required String token,
    required String id,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/institutions/$id"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    try {
      return Datum.fromMap(jsonDecode(_response.body)["data"]);
    } catch (e) {
      throw Exception(_response.statusCode.toString());
    }
  }
}
