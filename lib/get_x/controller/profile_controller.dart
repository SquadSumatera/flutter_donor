import 'dart:io';

import 'package:flutter_donor/models/profile_model.dart';
import 'package:flutter_donor/services/profile_services.dart';
import 'package:get/get.dart';

enum ProfileLoadStatus {
  loading,
  loaded,
  failed,
}

class ProfileController extends GetxController {
  ProfileModel? profile;
  Rx<ProfileLoadStatus> status = ProfileLoadStatus.loading.obs;

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
    required String token,
    required File file,
  }) async {
    status.value = ProfileLoadStatus.loading;
    update();

    try {
      profile = await ProfileServices.updateProfileImage(
        token: token,
        file: file,
      );
      status.value = ProfileLoadStatus.loaded;
    } catch (e) {
      print(e);
      status.value = ProfileLoadStatus.failed;
    }
    update();
  }

  //TO-DO
  void updateProfile(ProfileModel? newProfile) {
    profile = newProfile;
    update();
  }
}
