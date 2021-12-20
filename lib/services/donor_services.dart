import 'dart:convert';
import 'dart:io';

import 'package:flutter_donor/models/create_donor_model.dart';
import 'package:flutter_donor/models/docs_model.dart';
import 'package:flutter_donor/models/donor_request_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class DonorServices {
  static Future<CreateDonorModel> createDonorNotes({
    required String token,
    required String uuid,
    required String blood,
    required String rhesus,
    required String date,
  }) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/d/donor_notes/create"),
      headers: {
        "Authorization": "Bearer $token",
      },
      body: <String, String>{
        "id_institutions": uuid,
        "blood_type_donor_notes": blood,
        "blood_rhesus_donor_notes": rhesus,
        "blood_type_donor_notes": blood,
        "schedule_donor_notes": date
      },
    );

    return CreateDonorModel.fromJson(_response.body);
  }

  static Future<DonorRequestModel> createDonorRequest({
    required String token,
    required String id_institutions,
    required String recipient,
    required String applicant,
    required String blood_type,
    required String blood_rhesus,
    required String quantity,
    required File ktp,
    required List<DocsModel> docs,
  }) async {
    Uri uri = Uri.parse(AppUrl.baseUrl + "/d/donor_submissions/create");
    var request = MultipartRequest('POST', uri);
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };
    Map<String, String> body = ({
      "id_institutions": id_institutions,
      "recipient_donor_submissions": recipient,
      "applicant_donor_submissions": applicant,
      "blood_type_donor_submissions": blood_type,
      "blood_rhesus_donor_submissions": blood_rhesus,
      "quantity_donor_submissions": quantity,
      'quantity_doc_donor_submissions': (docs.length + 1).toString(),
      'type_document_donor_submissions_0': 'KTP',
    });

    request.files.add(
      MultipartFile('file_document_donor_submissions_0',
          ktp.readAsBytes().asStream(), ktp.lengthSync(),
          filename: ktp.path.split("/").last),
    );

    for (int i = 0; i < docs.length; i++) {
      request.fields['type_document_donor_submissions_${i + 1}'] = docs[i].type;
      request.files.add(
        MultipartFile('file_document_donor_submissions_${i + 1}',
            docs[i].doc.readAsBytes().asStream(), docs[i].doc.lengthSync(),
            filename: docs[i].doc.path.split("/").last),
      );
    }

    request.fields.addAll(body);
    request.headers.addAll(headers);

    var streamedResponse = await request.send();
    var response = await Response.fromStream(streamedResponse);
    print("request field: " + request.fields.toString());
    print("request files: " + request.files.map((e) => e.filename).toString());
    var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
    print(response.body);

    return DonorRequestModel.fromMap(responseBody);
  }
}
