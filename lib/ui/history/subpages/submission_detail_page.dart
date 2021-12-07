import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../../get_x/controller/submission_history_controller.dart';
import '../../../shared/theme.dart';
import '../subsection/detail_header.dart';
import '../subsection/donor_location.dart';

class SubmissionDetailPage extends StatelessWidget {
  SubmissionDetailPage({Key? key}) : super(key: key);

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
      body: ListView(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => DetailHeader(
              title: 'Detail Permohonan',
              status: controller.selected?.value.showStatus ?? '-',
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(height: 20),
          DonorLocation(
            latLong: LatLng(0, 0),
            locationAddress: "PMI Runeterra",
            title: 'Penyedia',
          ),
        ],
      ),
    );
  }
}
