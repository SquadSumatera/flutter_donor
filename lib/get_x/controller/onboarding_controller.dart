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
    SharedPreferences getPref = await SharedPreferences.getInstance();
    getPref.setBool("onboard", false);
    Get.offAllNamed(Routes.login);
  }

  List<OnBoardingModel> onBoardingModelList = <OnBoardingModel>[
    OnBoardingModel(
      image: "assets/bitmap/onboard1.png",
      title: "Donor Plasma",
      desc:
          "Kamu dengan mudah melakukan Donor Plasma untuk yang membutuhkan. Kemudahannya antara lain donor plasma sesuai lokasi yang kamu inginkan, donor dengan mengikuti event yang diselenggarakan dan tentu juga Schedule yang terjadwal langsung di HP kamu.",
    ),
    OnBoardingModel(
      image: "assets/bitmap/onboard2.png",
      title: "Request Plasma",
      desc:
          "Sekarang cari Plasma jadi mudah. Kamu tinggal pencet request plasma, otomatis pesanan mu akan diproses. Tentunya akan mempertimbangkan beberapa aspek yang akan diseleksi oleh pihak berkempentingan langsung loh. Dan juga Notifikasi untuk Request kamu secara real time.",
    ),
    OnBoardingModel(
      image: "assets/bitmap/onboard3.png",
      title: "Penghargaan",
      desc:
          "Dengan membantu sesama kamu telah menyelamatkan satu nyawa setiap donornya. Kami juga memberika apresiasi kepada kamu lewat sertifikat dan juga point donor. Dimana point donor ini bisa kamu tukarkan dengan berbagai barang menarik.",
    ),
  ];
}
