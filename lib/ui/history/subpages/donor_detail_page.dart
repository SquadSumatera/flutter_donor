import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../get_x/controller/donor_detail_overlay_controller.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import '../../../models/donor_history_model.dart';
import '../../../shared/theme.dart';
import '../subsection/certificate_section.dart';
import '../subsection/detail_header.dart';
import '../subsection/donor_location.dart';
import '../subsection/schedule_detail_section.dart';

class DonorDetailPage extends StatelessWidget {
  DonorDetailPage({Key? key}) : super(key: key);
  final DonorDetailOverlayController overlay =
      Get.put(DonorDetailOverlayController());
  final DonorHistoryController donorController = Get.find();
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
          "Detail Pendonoran",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.semiBold,
          ),
        ),
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: ListView(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => DetailHeader(
              title: 'Detail Pendonoran',
              status: donorController.selected?.value.showStatus ?? "-",
            ),
          ),
          const SizedBox(height: 24),
          ScheduleDetailSection(),
          const SizedBox(height: 30),
          Obx(
            () => DonorLocation(
                isLoading: donorController.selectedStatus.value ==
                    DonorHistorySelectedStatus.loading,
                latLong: donorController.selected?.value.locationLatLong ??
                    LatLng(0, 0),
                locationAddress:
                    donorController.selected?.value.locationAddress ?? "",
                title: 'Lokasi'),
          ),
          const SizedBox(height: 23),
          if (donorController.selected?.value.statusDonorNotes ==
              DonorHistoryStatus.finished)
            const CertificateSection(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
