import 'dart:io';

import 'package:flutter_donor/models/docs_model.dart';
import 'package:get/get.dart';

enum ListDocsStatus {
  loading,
  loaded,
  failed,
}

class RequestController extends GetxController {
  Rx<String> blood = "".obs;
  Rx<String> rhesus = "".obs;
  Rx<String> instituion = "".obs;
  RxBool dontChange = false.obs;
  List<DocsModel> listDocs = <DocsModel>[].obs;
  Rx<ListDocsStatus> status = ListDocsStatus.loading.obs;

  void addListDocs(String type, String fileName, File file) {
    listDocs.add(DocsModel(type: type, fileName: fileName, doc: file));
    update();
  }

  void removeListDocs(int index) {
    listDocs.removeAt(index);
    update();
  }

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
