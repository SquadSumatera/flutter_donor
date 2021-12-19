import 'dart:io';
import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/institution_model.dart';
import '../../models/submission_history_model.dart';
import '../../services/institution_services.dart';
import '../../services/submission_document_services.dart';
import '../../services/submission_history_services.dart';
import '../state/login_getx.dart';

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

  RxMap<String, File?> temporaryDocument = RxMap({
    'KTP': null,
    'surat': null,
  });

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
      temporaryDocument = RxMap({
        'KTP': null,
        'surat': null,
      });
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
      Get.snackbar(
        "Terjadi Kesalahan!",
        "Terjadi kesalahan saat mengunduh dokumen, silahkan coba lagi.",
      );
      documentStatus.value = SubmissionDocumentLoadStatus.failed;
    }
    currentProcessDocumentID.value = '';
    notifyChildrens();
  }

  Future<void> deleteSubmissionDocument(
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

  void createSubmissionDocument(String type, File documentFile,
      {bool passThroughMethod = false}) async {
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
      if (!passThroughMethod) {
        documentStatus.value = SubmissionDocumentLoadStatus.loaded;
      }
    } catch (e) {
      Get.snackbar(
        "Terjadi Kesalahan!",
        "Terjadi kesalahan saat mengunggah dokumen, silahkan coba lagi.",
      );
      documentStatus.value = SubmissionDocumentLoadStatus.failed;
    }
    notifyChildrens();
  }

  void addTemporaryDocument(String type, File documentFile) {
    temporaryDocument[type] = documentFile;
  }

  void removeTemporaryDocument(String type) {
    temporaryDocument[type] = null;
  }

  Future<void> uploadTemporaryDocument() async {
    documentStatus.value = SubmissionDocumentLoadStatus.loading;
    update();
    try {
      if (temporaryDocument['KTP'] == null ||
          temporaryDocument['surat'] == null) {
        Get.snackbar(
          "Terjadi Kesalahan!",
          "Pastikan semua formulir terisi lengkap!",
        );
        throw Exception();
      }
      createSubmissionDocument('KTP', temporaryDocument['KTP']!,
          passThroughMethod: true);
      createSubmissionDocument('surat', temporaryDocument['surat']!,
          passThroughMethod: true);
      SubmissionHistoryModel result =
          await SubmissionDocumentServices.conditionsRejectedHandler(
        token: loginData.token.value,
        submissionHistoryModel: selected!.value,
      );
      selected?.value = result;
      int idx = submissiontHistoryList.indexWhere((element) =>
          element.value.idDonorSubmissions ==
          selected?.value.idDonorSubmissions);
      submissiontHistoryList[idx].value = result;
      temporaryDocument = RxMap({
        'KTP': null,
        'surat': null,
      });
      documentStatus.value = SubmissionDocumentLoadStatus.loaded;
    } catch (e) {
      documentStatus.value = SubmissionDocumentLoadStatus.failed;
    }
    notifyChildrens();
  }
}
