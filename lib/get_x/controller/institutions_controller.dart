
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/services/institution_services.dart';
import 'package:get/get.dart';

enum InstitutionsStatus {
  loading,
  loaded,
  failed,
}

class InstitutionsController extends GetxController {
  String _token;
  late List<Datum?> institutionsModel;
  List<Datum?> filterInstitutions = <Datum?>[].obs;
  RxBool dontChange = false.obs;
  RxString query = "".obs;

  Rx<InstitutionsStatus> status = InstitutionsStatus.loading.obs;

  InstitutionsController(this._token);

  @override
  void onInit() {
    super.onInit();
    getInstitution(_token);
  }

  void getInstitution(String token) async {
    status.value = InstitutionsStatus.loading;
    update();
    try {
      institutionsModel = await InstitutionServices.listInstitution(token: token);
      status.value = InstitutionsStatus.loaded;
    } catch (e) {
      status.value = InstitutionsStatus.failed;
    }
    update();
  }

  void searchInstitution() async {
    status.value = InstitutionsStatus.loading;
    update();
    try {
      filterInstitutions = institutionsModel.where((datum) => datum!.nameInstitutions.toLowerCase().contains(query.toLowerCase())).toList();
      print(filterInstitutions);
      status.value = InstitutionsStatus.loaded;
    } catch (e) {
      status.value = InstitutionsStatus.failed;
    }
    update();
  }

}
