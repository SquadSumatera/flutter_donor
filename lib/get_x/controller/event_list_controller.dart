import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/event_list_model.dart';
import 'package:flutter_donor/services/event_list_services.dart';
import 'package:get/get.dart';

enum ListEventStatus {
  loading,
  loaded,
  failed,
}

class EventListController extends GetxController {
  final LoginGetX token = Get.find();
  Rx<ListEventStatus> status = ListEventStatus.loading.obs;

  late List<Rx<DataEvent>> listData = [];

  @override
  void onInit() {
    super.onInit();
    getListData(token.token.value);
  }

  void getListData(String tokenGet) async {
    status.value = ListEventStatus.loading;
    try {
      listData = await EventListServices.eventListServices(token: tokenGet)
          .then((value) => value.map((e) => e.obs).toList());
      status.value = ListEventStatus.loaded;
    } catch (e) {
      status.value = ListEventStatus.failed;
    }
  }
}
