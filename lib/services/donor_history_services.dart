import 'dart:convert';

import 'package:flutter_donor/models/donor_history_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class DonorHistoryServices {
  static Future<List<DonorHistoryModel>> getDonorHistoryList({
    required String token,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/donor_notes"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (_response.statusCode == 200) {
      List donorHistoryResp = json.decode(_response.body)["data"];
      final List<DonorHistoryModel> donorHistoryList =
          donorHistoryResp.map((faq) {
        return DonorHistoryModel.fromJson(faq);
      }).toList();
      return donorHistoryList;
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
