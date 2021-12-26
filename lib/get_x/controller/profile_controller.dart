import 'dart:io';
import 'package:flutter_donor/services/point_services.dart';
import 'package:get/get.dart';

import '../state/login_getx.dart';
import '../../models/profile_model.dart';
import '../../models/update_password_model.dart';
import '../../services/profile_services.dart';

enum ProfileLoadStatus {
  loading,
  loaded,
  failed,
  updateFailed,
  updateLoading,
  updated,
}

class ProfileController extends GetxController {
  final LoginGetX loginData = Get.find();

  Rx<ProfileModel> profile = ProfileModel().obs;
  Rx<ProfileLoadStatus> status = ProfileLoadStatus.loading.obs;
  Rx<int> userPoint = 0.obs;
  Rx<bool> dontChange = true.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile(loginData.token.value);
  }

  void getProfile(String token) async {
    status.value = ProfileLoadStatus.loading;
    update();
    try {
      profile.value =
          await ProfileServices.getProfile(token: token).then((value) => value);
      userPoint.value = await PointServices.getPointUser(token: token)
          .then((value) => value.skor);
      status.value = ProfileLoadStatus.loaded;
    } catch (e) {
      status.value = ProfileLoadStatus.failed;
    }
    update();
  }

  void updateProfilePhoto({
    required File file,
  }) async {
    status.value = ProfileLoadStatus.loading;
    update();

    try {
      profile.value = await ProfileServices.updateProfileImage(
        token: loginData.token.value,
        file: file,
      ).then((value) => value);
      status.value = ProfileLoadStatus.loaded;
    } catch (e) {
      status.value = ProfileLoadStatus.failed;
    }
    update();
  }

  void updateProfile({
    required ProfileModel updatedProfile,
  }) async {
    status.value = ProfileLoadStatus.updateLoading;
    update();

    try {
      profile.value = await ProfileServices.updateProfile(
        token: loginData.token.value,
        updatedData: updatedProfile,
      ).then((value) => value);
      status.value = ProfileLoadStatus.updated;
    } catch (e) {
      status.value = ProfileLoadStatus.updateFailed;
    }
    update();
  }

  Future<void> updatePassword({
    required UpdatePasswordModel updatedPassword,
  }) async {
    status.value = ProfileLoadStatus.updateLoading;
    update();

    try {
      profile.value = await ProfileServices.updatePassword(
        token: loginData.token.value,
        updatedData: updatedPassword,
      ).then((value) => value);
      status.value = ProfileLoadStatus.updated;
    } catch (e) {
      status.value = ProfileLoadStatus.updateFailed;
    }
    update();
  }
}
