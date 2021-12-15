import 'dart:io';

import 'package:flutter_donor/models/create_donor_model.dart';
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

  static Future<int> createDonorRequest({
    required String token,
    required String id_institutions,
    required String recipient,
    required String applicant,
    required String blood_type,
    required String blood_rhesus,
    required String quantity,
    required String document_type,
    required File document_uri,
    required String letter,
    required File letter_uri,
  }) async {
    Uri uri = Uri.parse(AppUrl.baseUrl + "/d/donor_submissions/create");
    var request = MultipartRequest('POST', uri);
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Content-type": "multipart/form-data"
    };
    Map<String, String> body = ({
      "id_institutions": id_institutions,
      "recipient_donor_submissions": recipient,
      "applicant_donor_submissions": applicant,
      "blood_type_donor_submissions": blood_type,
      "blood_rhesus_donor_submissions": blood_rhesus,
      "quantity_donor_submissions": quantity,
      "file_document_donor_submissions": document_type,
      "file_document_donor_submissions": letter,
    });
    request.files.add(
      MultipartFile(
        'file_document_donor_submissions',
        document_uri.readAsBytes().asStream(),
        document_uri.lengthSync(),
        filename: document_uri.path,
      ),
    );
    request.files.add(
      MultipartFile(
        'file_document_donor_submissions',
        letter_uri.readAsBytes().asStream(),
        letter_uri.lengthSync(),
        filename: letter_uri.path,
      ),
    );
    request.fields
        .addAll(body);
    request.headers.addAll(headers);

    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.toString());
    return res.statusCode;
  }
}
