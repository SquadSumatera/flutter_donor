import 'package:flutter/material.dart';
import 'package:flutter_donor/models/donor_history_model.dart';
import 'package:flutter_donor/ui/history/overlay/donor_detail_overlay_section.dart';
import 'package:flutter_donor/ui/history/subsection/confirm_cancel_donor_dialog.dart';
import 'package:flutter_donor/ui/history/subsection/confirm_change_dialog.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import '../../../shared/theme.dart';
import 'package:get/get.dart';

class ScheduleDetailSection extends StatelessWidget {
  ScheduleDetailSection({Key? key}) : super(key: key);
  final DonorHistoryController controller = Get.find();

  void _selectDate(BuildContext context) async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate:
          controller.selected?.value.scheduleDonorNotes ?? DateTime.now(),
      firstDate: DateTime(1945),
      lastDate: DateTime(2999),
    );
    if (newDate != null) {
      Overlay.of(context)!.insert(
        donorDetailOverlaySection(
          child: ConfirmChangeDialog(
            proposedDate: newDate,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Penjadwalan",
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
              boxShadow: AppShadow.medium,
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.selected?.value.scheduleDonorNotesString ??
                            "-",
                        style: AppText.textNormal.copyWith(
                          fontWeight: AppText.bold,
                          color: AppColor.cBlack,
                        ),
                      ),
                      const SizedBox(height: 2),
                      (controller.selected?.value.statusDonorNotes ==
                                  DonorHistoryStatus.waitingConfirmation ||
                              controller.selected?.value.statusDonorNotes ==
                                  DonorHistoryStatus.scheduleRejected)
                          ? TextButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              style: TextButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                primary: AppColor.cGrey,
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.edit,
                                    size: 18,
                                    color: AppColor.cBlue,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Ubah Jadwal",
                                    style: AppText.textSmall.copyWith(
                                      fontWeight: AppText.bold,
                                      color: AppColor.cBlue,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.selected?.value.nameInstitutions ?? "-",
                        style: AppText.textNormal.copyWith(
                          fontWeight: AppText.bold,
                          color: AppColor.imperialRed,
                        ),
                      ),
                      const SizedBox(height: 2),
                      (controller.selected?.value.statusDonorNotes ==
                                  DonorHistoryStatus.waitingConfirmation ||
                              controller.selected?.value.statusDonorNotes ==
                                  DonorHistoryStatus.scheduleRejected)
                          ? TextButton(
                              style: TextButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                primary: AppColor.cGrey,
                              ),
                              onPressed: () {
                                Overlay.of(context)!.insert(
                                  donorDetailOverlaySection(
                                    child: ConfirmCancelDonorDialog(),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.delete_forever,
                                    size: 18,
                                    color: AppColor.imperialRed,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "Batalkan Donor",
                                    style: AppText.textSmall.copyWith(
                                      fontWeight: AppText.bold,
                                      decoration: TextDecoration.underline,
                                      color: AppColor.imperialRed,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
