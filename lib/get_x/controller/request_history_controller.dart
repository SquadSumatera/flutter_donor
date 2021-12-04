import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:get/get.dart';

enum RequestHistoryLoadStatus {
  loading,
  loaded,
  failed,
}

enum RequestHistorySelectedStatus {
  loaded,
  updated,
  loading,
  failed,
}

class DummyRequestModel {}

class RequestHistoryController extends GetxController {
  final LoginGetX loginData = Get.find();
  late List<Rx<DummyRequestModel>> requestHistoryList = [];
  Rx<DummyRequestModel>? selected;
  Rx<RequestHistoryLoadStatus> status = RequestHistoryLoadStatus.loading.obs;
  Rx<RequestHistorySelectedStatus> selectedStatus =
      RequestHistorySelectedStatus.loaded.obs;

  @override
  void onInit() {
    super.onInit();
    getRequestHistory(loginData.token.value);
  }

  void getRequestHistory(String token) async {
    status.value = RequestHistoryLoadStatus.loading;
    update();
    try {
      // TUNGGU BACKEND
      status.value = RequestHistoryLoadStatus.loaded;
    } catch (e) {
      status.value = RequestHistoryLoadStatus.failed;
    }
    update();
  }

  void setSelected(DummyRequestModel newSelected) {
    selectedStatus.value = RequestHistorySelectedStatus.loading;
    update();

    selected = newSelected.obs;

    selectedStatus.value = RequestHistorySelectedStatus.loaded;
    update();
  }
}
