import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/profile_model.dart';
import 'package:flutter_donor/services/profile_services.dart';
import 'package:flutter_donor/services/user_verify_services.dart';
import 'package:get/get.dart';

enum StatusConnection {
  loading,
  loaded,
  failed,
}

enum StatusVerify {
  loading,
  loaded,
}

class CheckConnectionGetX extends GetxController {
  final LoginGetX token = Get.find();

  Rx<bool> verify = false.obs;
  int? statusCodeVerify;

  ProfileModel? profile;
  Rx<StatusConnection> status = StatusConnection.loading.obs;
  Rx<StatusVerify> statusVerify = StatusVerify.loaded.obs;

  @override
  void onInit() {
    super.onInit();
    getCheckConnect(token.token.value);
  }

  void getCheckConnect(String token) async {
    status.value = StatusConnection.loading;
    update();
    try {
      profile = await ProfileServices.getProfile(token: token);
      if (profile?.verifyDonators == null) {
        verify.value = false;
      } else {
        verify.value = true;
      }
      status.value = StatusConnection.loaded;
    } catch (e) {
      print(e);
      status.value = StatusConnection.failed;
    }
    update();
  }

  void getVerify() async {
    statusVerify.value = StatusVerify.loading;
    update();
    try {
      statusCodeVerify = await UserVerify.userVerify(token: token.token.value);
      verify.value = !verify.value;
      statusVerify.value = StatusVerify.loaded;
    } catch (e) {
      print(e);
      statusVerify.value = StatusVerify.loaded;
    }
    update();
  }
}
