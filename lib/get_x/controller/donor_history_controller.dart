import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/donor_history_model.dart';
import 'package:flutter_donor/services/donor_history_services.dart';
import 'package:get/get.dart';

enum DonorHistoryLoadStatus {
  loading,
  loaded,
  failed,
}

enum DonorHistorySelectedStatus {
  loaded,
  updated,
  loading,
  failed,
}

class DonorHistoryController extends GetxController {
  final LoginGetX token = Get.find();
  late List<Rx<DonorHistoryModel>> donorHistoryList = [];
  Rx<DonorHistoryModel>? selected;

  Rx<DonorHistoryLoadStatus> status = DonorHistoryLoadStatus.loading.obs;
  Rx<DonorHistorySelectedStatus> selectedStatus =
      DonorHistorySelectedStatus.loaded.obs;

  @override
  void onInit() {
    super.onInit();
    getDonorHistory(token.token.value);
  }

  void setSelected(DonorHistoryModel data) {
    selected = data.obs;
    update();
  }

  void getDonorHistory(String token) async {
    status.value = DonorHistoryLoadStatus.loading;
    update();
    try {
      donorHistoryList = await DonorHistoryServices.getDonorHistoryList(
        token: token,
      ).then((value) => value.map((e) => e.obs).toList());

      status.value = DonorHistoryLoadStatus.loaded;
    } catch (e) {
      status.value = DonorHistoryLoadStatus.failed;
    }
    update();
  }

  void cancelingSchedule() async {
    selectedStatus.value = DonorHistorySelectedStatus.loading;
    update();
    try {
      selected?.value = await DonorHistoryServices.canceledDonor(
        token: token.token.value,
        id: selected?.value.idDonorNotes ?? '',
      );
      int idx = donorHistoryList.indexWhere((element) =>
          element.value.idDonorNotes == selected?.value.idDonorNotes);
      donorHistoryList[idx].value = selected!.value;
      selectedStatus.value = DonorHistorySelectedStatus.updated;
    } catch (e) {
      selectedStatus.value = DonorHistorySelectedStatus.failed;
    }
    notifyChildrens();
  }
}
