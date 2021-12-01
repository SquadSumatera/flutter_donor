import 'dart:convert';

import 'package:flutter_donor/models/donor_certificate_model.dart';
import 'package:flutter_donor/models/donor_history_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class DonorCertificateServices {
  static Future<DonorCertificateModel> getCertificateDetail({
    required String token,
    required String id,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/certificate/$id"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (_response.statusCode == 200) {
      return DonorCertificateModel.fromJson(
          json.decode(_response.body)["data"]);
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
