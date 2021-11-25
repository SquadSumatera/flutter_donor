import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/profile_model.dart';
import 'package:flutter_donor/services/profile_services.dart';
import 'package:get/get.dart';

enum StatusConnection {
  loading,
  loaded,
  failed,
}

class CheckConnectionGetX extends GetxController {
  final LoginGetX token = Get.find();
  final Rx<bool> dontChange = false.obs;

  ProfileModel? profile;
  Rx<StatusConnection> status = StatusConnection.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getCheckConnect(token.token.value);
  }

  void getCheckConnect(String token) async {
    update();
    try {
      profile = await ProfileServices.getProfile(token: token);
      status.value = StatusConnection.loaded;
    } catch (e) {
      status.value = StatusConnection.failed;
    }
    update();
  }
}
