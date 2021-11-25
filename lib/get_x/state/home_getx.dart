import 'package:flutter_donor/models/point_user_model.dart';
import 'package:flutter_donor/services/point_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'login_getx.dart';

class HomeGetX extends GetxController {
  Widget? currentScreen;
  final LoginGetX token = Get.find();

  Rx<int> currentIndex = 0.obs;

  PointUser? pointUser;

  void changeIndex(int cIndex) {
    currentIndex.value = cIndex;
  }

  @override
  void onInit() {
    super.onInit();
    getPointUser(token.token.value);
  }

  void getPointUser(String token) async {
    try {
      pointUser = await PointServices.getPointUser(token: token);
    } catch (e) {
      null;
    }
    update();
  }
}
