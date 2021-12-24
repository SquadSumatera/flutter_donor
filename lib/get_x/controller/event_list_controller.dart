import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/event_list_model.dart';
import 'package:flutter_donor/services/event_image_services.dart';
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
  // var image = [].obs;

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
      // if (listData != List.empty()) {
      //   for (var i = 0; i < listData.length; i++) {
      //     var linkFor = listData[i].value.pictureDonorEvents;
      //     var j = await EventImageServices.eventImageServices(
      //             token: tokenGet, link: linkFor!)
      //         .then((value) => value.file);
      //     image.add(j);
      //     print(i);
      //     print(image[i]);
      //   }
      // }

      status.value = ListEventStatus.loaded;
    } catch (e) {
      print(e);
      status.value = ListEventStatus.failed;
    }
  }
}
