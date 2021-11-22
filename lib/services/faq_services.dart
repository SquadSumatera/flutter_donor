import 'dart:convert';

import 'package:flutter_donor/models/faq_model.dart';
import 'package:flutter_donor/shared/constant.dart';

import 'package:http/http.dart';

class FaqServices {
  static Future<List<FaqModel>> getFaqList({
    required String token,
  }) async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/faqs"),
      headers: {
        "Authorization": "Bearer $token",
      },
    );
    if (_response.statusCode == 200) {
      List faqResp = json.decode(_response.body)["data"];
      final List<FaqModel> faqList = faqResp.map((faq) {
        return FaqModel.fromJson(faq);
      }).toList();
      return faqList;
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
