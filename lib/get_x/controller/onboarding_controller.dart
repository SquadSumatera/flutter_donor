import 'package:flutter/cupertino.dart';
import 'package:flutter_donor/models/onboarding_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController {
  Rx<int> currentScreen = 0.obs;

  PageController pageController = PageController();

  void changeCurrentScreen(int cCurrent) {
    currentScreen.value = cCurrent;
  }

  lastPage() async {
    if (currentScreen.value == onBoardingModelList.length - 1) {
      SharedPreferences getPref = await SharedPreferences.getInstance();
      getPref.setBool("onboard", false);
      Get.offAllNamed(Routes.login);
    } else {
      pageController.jumpToPage(onBoardingModelList.length - 1);
    }
  }

  List<OnBoardingModel> onBoardingModelList = <OnBoardingModel>[
    OnBoardingModel(
      image: "assets/bitmap/onboard1.png",
      title: "Lorem ipsum dolor sit amet",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat facilisis sollicitudin adipiscing commodo. Imperdiet leo, nisl, id nulla ultrices viverra euismod arcu lectus.",
    ),
    OnBoardingModel(
      image: "assets/bitmap/onboard2.png",
      title: "Lorem ipsum dolor sit amet",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat facilisis sollicitudin adipiscing commodo. Imperdiet leo, nisl, id nulla ultrices viverra euismod arcu lectus.",
    ),
    OnBoardingModel(
      image: "assets/bitmap/onboard3.png",
      title: "Lorem ipsum dolor sit amet",
      desc:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Volutpat facilisis sollicitudin adipiscing commodo. Imperdiet leo, nisl, id nulla ultrices viverra euismod arcu lectus.",
    ),
  ];
}
