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
    final url = Uri.parse(AppUrl.baseUrl + "/d/donor_notes/$id");
    Map<String, String> requestBody = <String, String>{
      "status_donor_notes": DonorHistoryStatus.canceled,
    };

    var request = MultipartRequest("PUT", url);
    request.fields.addAll(requestBody);
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    StreamedResponse _response = await request.send();
    final respStr = await _response.stream.bytesToString();
    
    if (_response.statusCode == 200) {
      return DonorHistoryModel.fromJson(json.decode(respStr)["data"]);
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
