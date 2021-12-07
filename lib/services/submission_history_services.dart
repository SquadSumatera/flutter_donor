import 'dart:convert';

import 'package:http/http.dart';
import '../models/submission_history_model.dart';
import '../shared/constant.dart';

class SubmissionHistoryServices {
  static Future<List<SubmissionHistoryModel>> getSubmissionHistoryList({
    required String token,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/donor_submissions"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (_response.statusCode == 200) {
      List submissionHistoryResp = json.decode(_response.body)["data"];
      final List<SubmissionHistoryModel> submissionHistoryList =
          submissionHistoryResp.map((value) {
        return SubmissionHistoryModel.fromJson(value);
      }).toList();
      return submissionHistoryList;
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
