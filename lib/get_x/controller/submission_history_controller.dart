import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/models/submission_history_model.dart';
import 'package:flutter_donor/services/institution_services.dart';
import 'package:flutter_donor/services/submission_history_services.dart';
import 'package:get/get.dart';

enum SubmissionHistoryLoadStatus {
  loading,
  loaded,
  failed,
}

enum SubmissionHistorySelectedStatus {
  loaded,
  updated,
  loading,
  failed,
}

class SubmissionHistoryController extends GetxController {
  final LoginGetX loginData = Get.find();
  late List<Rx<SubmissionHistoryModel>> submissiontHistoryList = [];
  Rx<SubmissionHistoryModel>? selected;
  Rx<SubmissionHistoryLoadStatus> status =
      SubmissionHistoryLoadStatus.loading.obs;
  Rx<SubmissionHistorySelectedStatus> selectedStatus =
      SubmissionHistorySelectedStatus.loaded.obs;
  Rx<Datum>? selectedInstitution;

  @override
  void onInit() {
    super.onInit();
    getSubmissionHistory(loginData.token.value);
  }

  void getSubmissionHistory(String token) async {
    status.value = SubmissionHistoryLoadStatus.loading;
    update();
    try {
      submissiontHistoryList =
          await SubmissionHistoryServices.getSubmissionHistoryList(
        token: token,
      ).then((value) => value.map((e) => e.obs).toList());
      status.value = SubmissionHistoryLoadStatus.loaded;
    } catch (e) {
      status.value = SubmissionHistoryLoadStatus.failed;
    }
    update();
  }

  void setSelected(SubmissionHistoryModel data) async {
    selectedStatus.value = SubmissionHistorySelectedStatus.loading;
    update();

    try {
      selected = data.obs;
      await InstitutionServices.getInstitutionDetail(
        token: loginData.token.value,
        id: data.idInstitutions!,
      ).then((value) => (selectedInstitution = value?.obs));

      selectedStatus.value = SubmissionHistorySelectedStatus.loaded;
      update();
    } catch (e) {
      selectedStatus.value = SubmissionHistorySelectedStatus.failed;
    }
  }
}
