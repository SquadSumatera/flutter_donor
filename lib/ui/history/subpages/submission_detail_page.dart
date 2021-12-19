import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/history_detail_overlay_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../get_x/controller/submission_history_controller.dart';
import '../../../shared/theme.dart';
import '../subsection/submission_requirement_section.dart';
import '../subsection/detail_header.dart';
import '../subsection/donor_location.dart';

class SubmissionDetailPage extends StatelessWidget {
  SubmissionDetailPage({Key? key}) : super(key: key);

  final HistoryDetailOverlayController overlay =
      Get.put(HistoryDetailOverlayController());
  final SubmissionHistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColor.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/vector/ic_back.svg',
            width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "Detail Permohonan",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.semiBold,
          ),
        ),
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: Obx(
        () => ListView(
          clipBehavior: Clip.none,
          children: [
            DetailHeader(
              title: 'Detail Permohonan',
              status: controller.selected?.value.showStatus ?? '-',
            ),
            const SizedBox(height: 24),
            SubmissionRequirementSection(
              title: 'Kebutuhan',
              bloodType:
                  controller.selected?.value.bloodTypeDonorSubmissions ?? '-',
              rhesusType: controller.selected?.value.showRhesusText ?? '-',
              quantity:
                  controller.selected?.value.quantityDonorSubmissions ?? 0,
              dateScheduled: controller.selected?.value.showScheduledDate,
            ),
            const SizedBox(height: 38),
            DonorLocation(
              isLoading: controller.selectedStatus.value ==
                  SubmissionHistorySelectedStatus.loading,
              latLong: LatLng(
                  double.tryParse(controller.selectedInstitution?.value
                              .latitudeInstitutions ??
                          '0') ??
                      0,
                  double.tryParse(controller.selectedInstitution?.value
                              .longitudeInstitutions ??
                          '0') ??
                      0),
              locationAddress:
                  controller.selectedInstitution?.value.addressInstitutions ??
                      '-',
              locationName:
                  controller.selectedInstitution?.value.nameInstitutions ?? '-',
              title: 'Penyedia',
            ),
          ],
        ),
      ),
    );
  }
}
