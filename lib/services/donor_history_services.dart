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
          donorHistoryResp.map((value) {
        return DonorHistoryModel.fromJson(value);
      }).toList();
      return donorHistoryList;
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }

  static Future<DonorHistoryModel> canceledDonor({
    required String token,
    required String id,
  }) async {
    Response _response = await put(
      Uri.parse(AppUrl.baseUrl + "/d/donor_notes/$id"),
      headers: {
        "Authorization": "Bearer $token",
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: json.encode(
        {
          "status_donor_notes": DonorHistoryStatus.canceled,
        },
      ),
    );
    print(_response.body);
    print(id);
    print(token);
    if (_response.statusCode == 200) {
      return DonorHistoryModel.fromJson(json.decode(_response.body)["data"]);
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
