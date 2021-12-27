import 'package:flutter_donor/get_x/controller/institutions_controller.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/services/institution_services.dart';
import 'package:get/get.dart';
import 'package:flutter_donor/models/institution_model.dart';

enum StatusFilterData {
  loading,
  loaded,
  failed,
}

class InstitutionsFilterController extends GetxController {
  final InstitutionsController _institutionsController =
      Get.find<InstitutionsController>();
  final LoginGetX token = Get.find<LoginGetX>();

  Rx<StatusFilterData> status = StatusFilterData.loading.obs;
  List<Datum?> institutionsFilter = <Datum?>[].obs;

  @override
  void onInit() {
    super.onInit();
    getFilterData();
  }

  void getFilterData() async {
    status.value = StatusFilterData.loading;
    try {
      institutionsFilter = await InstitutionServices.listInstitutionFilter(
        token: token.token.value,
        blood: _institutionsController.ddBlood.value,
        rhesus: _institutionsController.ddRhesus.value,
        stock: _institutionsController.ddStock.value,
      );

      status.value = StatusFilterData.loaded;
    } catch (e) {
      print("Error Filter Data $e");
      status.value = StatusFilterData.failed;
    }
  }
}
