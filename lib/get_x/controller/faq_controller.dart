import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/faq_model.dart';
import 'package:flutter_donor/services/faq_services.dart';
import 'package:get/get.dart';

enum FaqLoadStatus {
  loading,
  loaded,
  failed,
}

class FaqController extends GetxController {
  final LoginGetX token = Get.find();
  late List<FaqModel> faqList = [];

  Rx<FaqLoadStatus> status = FaqLoadStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getFaq(token.token.value);
  }

  void getFaq(String token) async {
    status.value = FaqLoadStatus.loading;
    update();
    try {
      faqList = await FaqServices.getFaqList(token: token);
      status.value = FaqLoadStatus.loaded;
    } catch (e) {
      status.value = FaqLoadStatus.failed;
    }
    update();
  }
}
