import 'package:flutter_donor/models/institution_model.dart';
import 'package:get/get.dart';

class DonorController extends GetxController {
  Rx<String> dataInstitution = "".obs;
  RxBool dontChange = false.obs;

  void changeDataInstituion(String? uuid) {
    dataInstitution.value = uuid!;
  }
}
