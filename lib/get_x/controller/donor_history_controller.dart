import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/donor_history_model.dart';
import 'package:flutter_donor/services/donor_history_services.dart';
import 'package:get/get.dart';

enum DonorHistoryLoadStatus {
  loading,
  loaded,
  failed,
}

class DonorHistoryController extends GetxController {
  final LoginGetX token = Get.find();
  late List<DonorHistoryModel> donorHistoryList = [];
  DonorHistoryModel? selected;

  Rx<DonorHistoryLoadStatus> status = DonorHistoryLoadStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getDonorHistory(token.token.value);
  }

  void getDonorHistory(String token) async {
    status.value = DonorHistoryLoadStatus.loading;
    update();
    try {
      donorHistoryList = await DonorHistoryServices.getDonorHistoryList(
        token: token,
      );
      status.value = DonorHistoryLoadStatus.loaded;
    } catch (e) {
      status.value = DonorHistoryLoadStatus.failed;
    }
    update();
  }

}
