import 'dart:io';
import 'dart:typed_data';
import 'package:async/async.dart';

import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/models/submission_history_model.dart';
import 'package:flutter_donor/services/institution_services.dart';
import 'package:flutter_donor/services/submission_document_services.dart';
import 'package:flutter_donor/services/submission_history_services.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

enum SubmissionHistoryLoadStatus {
  loading,
  loaded,
  failed,
}

enum SubmissionHistorySelectedStatus {
  loaded,
  updated,
  loading,
  failed,
}

enum SubmissionDocumentLoadStatus {
  loading,
  viewLoading,
  deleteLoading,
  loaded,
  failed,
}

class SubmissionHistoryController extends GetxController {
  final LoginGetX loginData = Get.find();
  late List<Rx<SubmissionHistoryModel>> submissiontHistoryList = [];
  Rx<SubmissionHistoryModel>? selected;
  Rx<SubmissionHistoryLoadStatus> status =
      SubmissionHistoryLoadStatus.loading.obs;
  Rx<SubmissionHistorySelectedStatus> selectedStatus =
      SubmissionHistorySelectedStatus.loaded.obs;
  Rx<SubmissionDocumentLoadStatus> documentStatus =
      SubmissionDocumentLoadStatus.loading.obs;
  Rx<String> currentProcessDocumentID = ''.obs;
  Rx<Datum>? selectedInstitution;

  CancelableCompleter completer = CancelableCompleter();

  @override
  void onInit() {
    super.onInit();
    getSubmissionHistory(loginData.token.value);
  }

  void getSubmissionHistory(String token) async {
    status.value = SubmissionHistoryLoadStatus.loading;
    update();
    try {
      submissiontHistoryList =
          await SubmissionHistoryServices.getSubmissionHistoryList(
        token: token,
      ).then((value) => value.map((e) => e.obs).toList());
      status.value = SubmissionHistoryLoadStatus.loaded;
    } catch (e) {
      status.value = SubmissionHistoryLoadStatus.failed;
    }
    update();
  }

  void setSelected(SubmissionHistoryModel data) async {
    selectedStatus.value = SubmissionHistorySelectedStatus.loading;
    update();

    try {
      selected = data.obs;
      await InstitutionServices.getInstitutionDetail(
        token: loginData.token.value,
        id: data.idInstitutions!,
      ).then((value) => (selectedInstitution = value?.obs));

      selectedStatus.value = SubmissionHistorySelectedStatus.loaded;
      documentStatus.value = SubmissionDocumentLoadStatus.loaded;
      update();
    } catch (e) {
      selectedStatus.value = SubmissionHistorySelectedStatus.failed;
    }
  }

  void cancelSubmission() async {
    selectedStatus.value = SubmissionHistorySelectedStatus.loading;
    update();
    try {
      selected?.value = await SubmissionHistoryServices.cancelSubmission(
        token: loginData.token.value,
        id: selected?.value.idDonorSubmissions ?? '',
      );
      int idx = submissiontHistoryList.indexWhere((element) =>
          element.value.idDonorSubmissions ==
          selected?.value.idDonorSubmissions);
      submissiontHistoryList[idx].value = selected!.value;
      selectedStatus.value = SubmissionHistorySelectedStatus.updated;
    } catch (e) {
      selectedStatus.value = SubmissionHistorySelectedStatus.failed;
    }
    notifyChildrens();
  }

  void getSubmissionDocument(
    DocumentDonorSubmission docs,
  ) async {
    documentStatus.value = SubmissionDocumentLoadStatus.viewLoading;
    currentProcessDocumentID.value = docs.idDocumentDonorSubmissions ?? '';
    update();

    try {
      Directory appDocumentsDirectory =
          await getApplicationDocumentsDirectory();
      String appDocumentsPath = appDocumentsDirectory.path;
      String filePath =
          "$appDocumentsPath/${docs.fileNameDocumentDonorSubmissions}";
      Uint8List result = await SubmissionDocumentServices.getDocument(
        token: loginData.token.value,
        submissionId: selected?.value.idDonorSubmissions ?? '-',
        documentId: docs.idDocumentDonorSubmissions ?? '-',
      );
      File(filePath).writeAsBytes(result);
      OpenFile.open(filePath);
      documentStatus.value = SubmissionDocumentLoadStatus.loaded;
    } catch (e) {
      documentStatus.value = SubmissionDocumentLoadStatus.failed;
    }
    currentProcessDocumentID.value = '';
    notifyChildrens();
  }

  void deleteSubmissionDocument(
    DocumentDonorSubmission docs,
  ) async {
    documentStatus.value = SubmissionDocumentLoadStatus.deleteLoading;
    currentProcessDocumentID.value = docs.idDocumentDonorSubmissions ?? '';
    update();

    try {
      SubmissionHistoryModel result =
          await SubmissionDocumentServices.deleteDocument(
        token: loginData.token.value,
        submissionId: selected?.value.idDonorSubmissions ?? '-',
        documentId: docs.idDocumentDonorSubmissions ?? '-',
      );
      selected?.value = result;
      int idx = submissiontHistoryList.indexWhere((element) =>
          element.value.idDonorSubmissions ==
          selected?.value.idDonorSubmissions);
      submissiontHistoryList[idx].value = result;
      documentStatus.value = SubmissionDocumentLoadStatus.loaded;
    } catch (e) {
      documentStatus.value = SubmissionDocumentLoadStatus.failed;
    }
    currentProcessDocumentID.value = '';
    notifyChildrens();
  }

  void createSubmissionDocument(
    String type,
    File documentFile,
  ) async {
    documentStatus.value = SubmissionDocumentLoadStatus.loading;
    update();
    try {
      SubmissionHistoryModel result =
          await SubmissionDocumentServices.createDocument(
        token: loginData.token.value,
        submissionId: selected?.value.idDonorSubmissions ?? '-',
        documentType: type,
        documentFile: documentFile,
      );
      selected?.value = result;
      int idx = submissiontHistoryList.indexWhere((element) =>
          element.value.idDonorSubmissions ==
          selected?.value.idDonorSubmissions);
      submissiontHistoryList[idx].value = result;
      documentStatus.value = SubmissionDocumentLoadStatus.loaded;
    } catch (e) {
      documentStatus.value = SubmissionDocumentLoadStatus.failed;
    }
    notifyChildrens();
  }
}
