import 'package:flutter_donor/models/donor_submission_model.dart';
import 'package:flutter_donor/services/donor_statistic_services.dart';
import 'package:get/get.dart';
import '../../models/donor_statistic_model.dart';

enum StatusStatisticDonor {
  loading,
  loaded,
  failed,
}

enum StatusSubmissionDonor {
  loading,
  loaded,
  failed,
}

class DonorStatisticController extends GetxController {
  Rx<DonorStatisticModel> donorModel = DonorStatisticModel().obs;
  Rx<DataSubmission> dataSubmission = DataSubmission().obs;

  Rx<StatusStatisticDonor> statusStatistic = StatusStatisticDonor.loading.obs;
  Rx<StatusSubmissionDonor> statusSubmission =
      StatusSubmissionDonor.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getDataStatistic();
    getDataSubmission();
  }

  void getDataStatistic() async {
    statusStatistic.value = StatusStatisticDonor.loading;
    try {
      donorModel.value = await DonorStatisticServices.donorStatistic();
      statusStatistic.value = StatusStatisticDonor.loaded;
    } catch (e) {
      print(e);
      statusStatistic.value = StatusStatisticDonor.failed;
    }
  }

  void getDataSubmission() async {
    statusSubmission.value = StatusSubmissionDonor.loading;
    try {
      dataSubmission.value = await DonorStatisticServices.donorSubmission();
      statusSubmission.value = StatusSubmissionDonor.loaded;
    } catch (e) {
      print(e);
      statusSubmission.value = StatusSubmissionDonor.failed;
    }
  }
}
