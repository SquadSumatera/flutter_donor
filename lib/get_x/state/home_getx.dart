import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeGetX extends GetxController {
  Widget? currentScreen;

  Rx<int> currentIndex = 0.obs;

  void changeIndex(int cIndex) {
    currentIndex.value = cIndex;
  }
}
