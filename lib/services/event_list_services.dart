import 'package:flutter_donor/models/event_list_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';

class EventListServices {
  static Future<List<DataEvent>> eventListServices({
    required String token,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/donor_events"),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    return EventListModel.fromJson(_response.body).data!;
  }
}
