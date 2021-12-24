import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/event_list_model.dart';
import 'package:flutter_donor/models/event_register_model.dart';
import 'package:flutter_donor/services/event_image_services.dart';
import 'package:flutter_donor/services/event_list_services.dart';
import 'package:flutter_donor/services/event_register_services.dart';
import 'package:get/get.dart';

enum RegisterEventStatus {
  loading,
  loaded,
}

class EventRegisterController extends GetxController {
  final LoginGetX token = Get.find();
  Rx<RegisterEventStatus> status = RegisterEventStatus.loaded.obs;

  EventRegisterModel? eventRegisterModel;

  Future<bool> registerEvent(
    String idDonorEvents,
    String bloodTypeDonorNotes,
    String bloodRhesusDonorNotes,
    String scheduleDonorNotes,
  ) async {
    status.value = RegisterEventStatus.loading;
    try {
      eventRegisterModel = await EventRegisterServices.eventRegisterServices(
        token: token.token.value,
        idDonorEvents: idDonorEvents,
        bloodTypeDonorNotes: bloodTypeDonorNotes,
        bloodRhesusDonorNotes: bloodRhesusDonorNotes,
        scheduleDonorNotes: scheduleDonorNotes,
      );
      status.value = RegisterEventStatus.loaded;
      return true;
    } catch (e) {
      print("Error RegisterEvent $e");
      status.value = RegisterEventStatus.loaded;
      return false;
    }
  }
}
