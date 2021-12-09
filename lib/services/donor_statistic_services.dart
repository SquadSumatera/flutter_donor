import 'package:flutter_donor/models/donor_statistic_model.dart';
import 'package:flutter_donor/shared/constant.dart';
import '../models/donor_submission_model.dart';
import 'package:http/http.dart';

class DonorStatisticServices {
  static Future<List<ListData>> donorStatistic() async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/statistics/donor_notes"),
    );

    return DonorStatisticModel.fromJson(_response.body).data!;
  }

  static Future<DataSubmission> donorSubmission() async {
    Response _response = await get(
      Uri.parse(AppUrl.baseUrl + "/statistics/donor_submission"),
    );
    return DonorSubmissionModel.fromJson(_response.body).data!;
  }
}
