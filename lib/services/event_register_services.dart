import 'package:flutter_donor/models/event_list_model.dart';
import 'package:flutter_donor/models/event_register_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class EventRegisterServices {
  static Future<EventRegisterModel> eventRegisterServices({
    required String token,
    required String idDonorEvents,
    required String bloodTypeDonorNotes,
    required String bloodRhesusDonorNotes,
    required String scheduleDonorNotes,
  }) async {
    Response _response = await post(
      Uri.parse(AppUrl.baseUrl + "/d/donor_notes/create"),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: <String, String>{
        "id_donor_events": idDonorEvents,
        "blood_type_donor_notes": bloodTypeDonorNotes,
        "blood_rhesus_donor_notes": bloodRhesusDonorNotes,
        "schedule_donor_notes": scheduleDonorNotes,
      },
    );

    return EventRegisterModel.fromJson(_response.body);
  }
}
