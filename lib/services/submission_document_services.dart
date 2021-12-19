import 'dart:convert';
import 'dart:io';

import 'package:flutter_donor/models/submission_history_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class SubmissionDocumentServices {
  static Future<DocumentDonorSubmission> createDocument({
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
          jsonDecode(await _response.stream.bytesToString())['data']
              ['document_donor_submissions'];
      return DocumentDonorSubmission.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<DocumentDonorSubmission> deleteDocument({
    required String token,
    required String submissionId,
    required String documentId,
  }) async {
    var request = MultipartRequest(
      "DELETE",
      Uri.parse(AppUrl.baseUrl +
          "/d/donor_submissions/$submissionId/doc/$documentId"),
    );
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    try {
      var _response = await request.send();
      Map<String, dynamic> data =
          jsonDecode(await _response.stream.bytesToString())['data']
              ['document_donor_submissions'];
      return DocumentDonorSubmission.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> getDocument({
    required String token,
    required String submissionId,
    required String documentId,
  }) async {
    var request = MultipartRequest(
      "GET",
      Uri.parse(AppUrl.baseUrl +
          "/d/donor_submissions/$submissionId/doc/$documentId"),
    );
    request.headers.addAll({
      "Authorization": "Bearer $token",
    });

    try {
      var _response = await request.send();
      // print(_response.stream.);
      // Map<String, dynamic> data =
      //     jsonDecode(await _response.stream.bytesToString())['data']
      //         ['document_donor_submissions'];
      // return DocumentDonorSubmission.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
