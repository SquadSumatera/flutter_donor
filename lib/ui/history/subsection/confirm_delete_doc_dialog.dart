import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';
import '../../../get_x/controller/submission_history_controller.dart';
import '../../../get_x/controller/history_detail_overlay_controller.dart';
import '../../../models/submission_history_model.dart';
import '../widgets/detail_dialog_button.dart';

class ConfirmDeleteDocDialog extends StatelessWidget {
  ConfirmDeleteDocDialog({
    Key? key,
    required this.document,
  }) : super(key: key);

  final HistoryDetailOverlayController overlay = Get.find();
  final SubmissionHistoryController submissionController = Get.find();
  final DocumentDonorSubmission document;

  String dialogTitle() {
    switch (submissionController.documentStatus.value) {
      case SubmissionDocumentLoadStatus.loaded:
        return "Apakah anda yakin ingin menghapus dokumen?";
      case SubmissionDocumentLoadStatus.deleteLoading:
        return "Sedang memproses, harap tunggu...";
      default:
        return "Terjadi Kesalahan, harap coba kembali.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColor.white,
        constraints: const BoxConstraints(
          maxHeight: 170,
        ),
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              dialogTitle(),
              style: AppText.textMedium.copyWith(
                fontWeight: AppText.semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            if (submissionController.documentStatus.value !=
                SubmissionDocumentLoadStatus.deleteLoading)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DetailDialogButton(
                    label: "Tidak",
                    active: false,
                    onPressed: () {
                      submissionController.documentStatus.value =
                          SubmissionDocumentLoadStatus.loaded;
                      overlay.removeOverlay();
                    },
                  ),
                  DetailDialogButton(
                    label: (submissionController.documentStatus.value ==
                            SubmissionDocumentLoadStatus.failed)
                        ? "Coba Lagi"
                        : "Ya",
                    active: true,
                    onPressed: () {
                      submissionController
                          .deleteSubmissionDocument(document)
                          .then((value) {
                        if (submissionController.documentStatus.value ==
                            SubmissionDocumentLoadStatus.loaded) {
                          overlay.removeOverlay();
                        }
                      });
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
