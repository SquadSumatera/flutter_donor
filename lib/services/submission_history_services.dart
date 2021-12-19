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

  static Future<SubmissionHistoryModel> cancelSubmission({
    required String token,
    required String id,
  }) async {
    final url = Uri.parse(AppUrl.baseUrl + "/d/donor_submissions/$id");
    Map<String, String> requestBody = <String, String>{
      "status_donor_submissions": SubmissionHistoryStatus.canceled,
    };

    var request = MultipartRequest("PUT", url);
    request.fields.addAll(requestBody);
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    StreamedResponse _response = await request.send();
    final respStr = await _response.stream.bytesToString();
    
    if (_response.statusCode == 200) {
      return SubmissionHistoryModel.fromJson(json.decode(respStr)["data"]);
    } else {
      throw Exception(_response.statusCode.toString());
    }

  }


}
