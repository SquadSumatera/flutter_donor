import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/donor_certificate_model.dart';
import 'package:flutter_donor/models/donor_history_model.dart';
import 'package:flutter_donor/services/donor_certificate_services.dart';
import 'package:flutter_donor/services/donor_history_services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  final LoginGetX loginData = Get.find();
  late List<Rx<DonorHistoryModel>> donorHistoryList = [];
  late List<Rx<DonorHistoryModel>> donorSchedule = [];

  Rx<DonorHistoryModel>? selected;
  Rx<DonorCertificateModel> selectedCertificate = DonorCertificateModel().obs;

  Rx<DonorHistoryLoadStatus> status = DonorHistoryLoadStatus.loading.obs;
  Rx<DonorHistorySelectedStatus> selectedStatus =
      DonorHistorySelectedStatus.loaded.obs;

  @override
  void onInit() {
    super.onInit();
    getDonorHistory(loginData.token.value);
  }

  void setSelected(DonorHistoryModel data) async {
    selectedStatus.value = DonorHistorySelectedStatus.loading;
    selected = data.obs;
    update();

    try {
      if (selected!.value.statusDonorNotes == DonorHistoryStatus.finished) {
        selectedCertificate.value =
            await DonorCertificateServices.getCertificateDetail(
          token: loginData.token.value,
          id: data.idDonorNotes!,
        );
      }
      selectedStatus.value = DonorHistorySelectedStatus.loaded;
    } catch (e) {
      selectedStatus.value = DonorHistorySelectedStatus.failed;
    }
    update();
  }

  void getDonorHistory(String token) async {
    status.value = DonorHistoryLoadStatus.loading;
    update();
    try {
      donorHistoryList = await DonorHistoryServices.getDonorHistoryList(
        token: token,
      ).then((value) => value.map((e) => e.obs).toList());

      donorSchedule = donorHistoryList
          .where((element) =>
              element.value.statusDonorNotes == DonorHistoryStatus.registered)
          .toList();

      status.value = DonorHistoryLoadStatus.loaded;
    } catch (e) {
      status.value = DonorHistoryLoadStatus.failed;
    }
    update();
  }

  void cancelSchedule() async {
    selectedStatus.value = DonorHistorySelectedStatus.loading;
    update();
    try {
      selected?.value = await DonorHistoryServices.canceledDonor(
        token: loginData.token.value,
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

  void updateSchedule(
    DateTime proposedDate,
  ) async {
    selectedStatus.value = DonorHistorySelectedStatus.loading;
    update();
    try {
      selected?.value = await DonorHistoryServices.updateScheduleDonor(
        token: loginData.token.value,
        data: selected!.value,
        proposedDate: DateFormat('yyyy-MM-dd', 'id').format(proposedDate),
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
