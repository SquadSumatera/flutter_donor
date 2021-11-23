import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../shared/theme.dart';
import '../../../get_x/controller/donor_detail_overlay_controller.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import '../widgets/detail_dialog_button.dart';

class ConfirmChangeDialog extends StatelessWidget {
  ConfirmChangeDialog({
    Key? key,
    required this.proposedDate,
  }) : super(key: key);

  final DateTime proposedDate;
  final DonorDetailOverlayController overlay = Get.find();
  final DonorHistoryController donorController = Get.find();

  String dialogTitle() {
    switch (donorController.selectedStatus.value) {
      case DonorHistorySelectedStatus.loaded:
        String dateText = DateFormat('dd/MM/yyyy', 'id').format(proposedDate);
        return "Apakah anda yakin ingin mengubah jadwal menjadi tanggal $dateText?";
      case DonorHistorySelectedStatus.loading:
        return "Sedang memproses, harap tunggu...";
      case DonorHistorySelectedStatus.updated:
        return "Pengajuan jadwal donor berhasil dirubah!";
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
            if (donorController.selectedStatus.value !=
                    DonorHistorySelectedStatus.loading &&
                donorController.selectedStatus.value !=
                    DonorHistorySelectedStatus.updated)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  DetailDialogButton(
                    label: "Tidak",
                    active: false,
                    onPressed: () {
                      donorController.selectedStatus.value =
                          DonorHistorySelectedStatus.loaded;
                      overlay.removeOverlay();
                    },
                  ),
                  DetailDialogButton(
                    label: (donorController.selectedStatus.value ==
                            DonorHistorySelectedStatus.failed)
                        ? "Coba Lagi"
                        : "Ya",
                    active: true,
                    onPressed: () {
                      donorController.updateSchedule(proposedDate);
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
