import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/profile_model.dart';
import 'package:flutter_donor/models/update_password_model.dart';
import 'package:flutter_donor/services/profile_services.dart';
import 'package:get/get.dart';

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

  ProfileModel? profile;
  Rx<ProfileLoadStatus> status = ProfileLoadStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile(loginData.token.value);
  }

  void getProfile(String token) async {
    status.value = ProfileLoadStatus.loading;
    update();
    try {
      profile = await ProfileServices.getProfile(token: token);
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
      profile = await ProfileServices.updateProfileImage(
        token: loginData.token.value,
        file: file,
      );
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
      profile = await ProfileServices.updateProfile(
        token: loginData.token.value,
        updatedData: updatedProfile,
      );
      status.value = ProfileLoadStatus.updated;
    } catch (e) {
      status.value = ProfileLoadStatus.updateFailed;
    }
    update();
  }

  void updatePassword({
    required UpdatePasswordModel updatedPassword,
  }) async {
    status.value = ProfileLoadStatus.updateLoading;
    update();

    try {
      profile = await ProfileServices.updatePassword(
        token: loginData.token.value,
        updatedData: updatedPassword,
      );
      status.value = ProfileLoadStatus.updated;
    } catch (e) {
      status.value = ProfileLoadStatus.updateFailed;
    }
    update();
  }
}
