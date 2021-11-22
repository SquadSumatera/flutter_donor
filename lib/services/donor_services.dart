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
}
