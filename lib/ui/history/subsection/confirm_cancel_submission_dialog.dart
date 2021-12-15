import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';
import '../../../get_x/controller/submission_history_controller.dart';
import '../../../get_x/controller/history_detail_overlay_controller.dart';
import '../widgets/detail_dialog_button.dart';

class ConfirmCancelSubmissionDialog extends StatelessWidget {
  ConfirmCancelSubmissionDialog({
    Key? key,
  }) : super(key: key);

  final HistoryDetailOverlayController overlay = Get.find();
  final SubmissionHistoryController submissionController = Get.find();

  String dialogTitle() {
    switch (submissionController.selectedStatus.value) {
      case SubmissionHistorySelectedStatus.loaded:
        return "Apakah anda yakin ingin membatalkan permohonan?";
      case SubmissionHistorySelectedStatus.loading:
        return "Sedang memproses, harap tunggu...";
      case SubmissionHistorySelectedStatus.updated:
        return "Permohonan berhasil dibatalkan!";
      default:
        return "Terjadi Kesalahan, harap coba kembali.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: AppColor.white,
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.20,
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
            if (submissionController.selectedStatus.value !=
                    SubmissionHistorySelectedStatus.loading &&
                submissionController.selectedStatus.value !=
                    SubmissionHistorySelectedStatus.updated)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DetailDialogButton(
                    label: "Tidak",
                    active: false,
                    onPressed: () {
                      submissionController.selectedStatus.value =
                          SubmissionHistorySelectedStatus.loaded;
                      overlay.removeOverlay();
                    },
                  ),
                  DetailDialogButton(
                    label: (submissionController.selectedStatus.value ==
                            SubmissionHistorySelectedStatus.failed)
                        ? "Coba Lagi"
                        : "Ya",
                    active: true,
                    onPressed: () {
                      submissionController.cancelSubmission();
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
