import 'package:flutter/cupertino.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/event_search_model.dart';
import 'package:flutter_donor/services/event_image_services.dart';
import 'package:flutter_donor/services/event_search_services.dart';
import 'package:get/get.dart';

enum StatusSearch {
  loading,
  loaded,
  failed,
}

class EventSearchController extends GetxController {
  final LoginGetX token = Get.find<LoginGetX>();
  final TextEditingController searchController = TextEditingController();
  Rx<EventSearchModel> eventSearchModel = EventSearchModel().obs;
  Rx<StatusSearch> statusSearchEvent = StatusSearch.failed.obs;
  Rx<String> key = "".obs;
  // var image = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void cKey(String cKey) {
    key.value = cKey;
  }

  void getSearchData(String cKey) async {
    statusSearchEvent.value = StatusSearch.loading;
    try {
      eventSearchModel.value = await EventSearchServices.eventSearchService(
          token: token.token.value, key: cKey);
      // if (eventSearchModel.value.data != null) {
      //   for (var i = 0; i < eventSearchModel.value.data!.length; i++) {
      //     var linkFor = eventSearchModel.value.data![i].pictureDonorEvents;
      //     var j = await EventImageServices.eventImageServices(
      //             token: token.token.value, link: linkFor!)
      //         .then((value) => value.file);
      //     image.add(j);
      //   }
      // }
      statusSearchEvent.value = StatusSearch.loaded;
    } catch (e) {
      print(e);
      statusSearchEvent.value = StatusSearch.failed;
    }
  }
}
