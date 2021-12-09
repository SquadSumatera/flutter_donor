import 'dart:convert';

import 'package:flutter_donor/shared/constant.dart';
import 'package:http/http.dart';
import '../models/news_model.dart';

class NewsServices {
  static Future<List<NewsModel>> getNews() async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/d/donor_notes"),
    );
    if (_response.statusCode == 200) {
      List newsResp =
          json.decode(_response.body)["data"]['rss']['channel']['item'];
      final List<NewsModel> newsList = newsResp.map((value) {
        return NewsModel.fromJson(value);
      }).toList();
      return newsList;
    } else {
      throw Exception(_response.statusCode.toString());
    }
  }
}
