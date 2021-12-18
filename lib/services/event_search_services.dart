import 'package:flutter_donor/shared/constant.dart';

import '../models/event_search_model.dart';
import 'package:http/http.dart';

class EventSearchServices {
  static Future<EventSearchModel> eventSearchService({
    required String token,
    required String key,
  }) async {
    Response _response = await get(
        Uri.parse(AppUrl.baseUrl + "/d/donor_events?key=" + key),
        headers: {
          'Authorization': 'Bearer $token',
        });
    return EventSearchModel.fromJson(_response.body);
  }
}
