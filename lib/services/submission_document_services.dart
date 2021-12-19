import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_donor/models/submission_history_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class SubmissionDocumentServices {
  static Future<SubmissionHistoryModel> createDocument({
    required String token,
    required String submissionId,
    required File documentFile,
    required String documentType,
  }) async {
    var request = MultipartRequest(
      "POST",
      Uri.parse(AppUrl.baseUrl + "/d/donor_submissions/$submissionId/doc"),
    );
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });
    request.files.add(
      MultipartFile.fromBytes(
        "file_document_donor_submissions",
        await documentFile.readAsBytes(),
        filename: documentFile.path.split("/").last,
      ),
    );
    request.fields.addAll({
      "type_document_donor_submissions": documentType,
    });

    try {
      var _response = await request.send();
      Map<String, dynamic> data =
          jsonDecode(await _response.stream.bytesToString())['data'];
      return SubmissionHistoryModel.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<SubmissionHistoryModel> deleteDocument({
    required String token,
    required String submissionId,
    required String documentId,
  }) async {
    try {
      Response _response = await delete(
        Uri.parse(AppUrl.baseUrl +
            "/d/donor_submissions/$submissionId/doc/$documentId"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      Map<String, dynamic> data = jsonDecode(_response.body)['data'];
      return SubmissionHistoryModel.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Uint8List> getDocument({
    required String token,
    required String submissionId,
    required String documentId,
  }) async {
    try {
      Response _response = await get(
        Uri.parse(AppUrl.baseUrl +
            "/d/donor_submissions/$submissionId/doc/$documentId"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      return _response.bodyBytes;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
