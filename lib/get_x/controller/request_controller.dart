import 'package:get/get.dart';

class RequestController extends GetxController{
  Rx<String> blood = "".obs;
  Rx<String> rhesus = "".obs;
  Rx<String> instituion = "".obs;
  RxBool dontChange = false.obs;

  void changeDataInstituion(String? uuid) {
    instituion.value = uuid!;
  }

  void changeDataBlood(String? status) {
    blood.value = status!;
  }

  void changeDataRhesus(String? status) {
    rhesus.value = status!;
  }

}