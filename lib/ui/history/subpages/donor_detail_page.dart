import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/donor_history_controller.dart';
import 'package:flutter_donor/ui/history/subsection/certificate_section.dart';
import 'package:flutter_donor/ui/history/subsection/donor_certificate_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

import '../../../get_x/controller/donor_detail_overlay_controller.dart';
import '../../../shared/theme.dart';
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
      body: Stack(
        children: [
          ListView(
            clipBehavior: Clip.none,
            children: [
              DetailHeader(),
              const SizedBox(height: 33),
              ScheduleDetailSection(),
              const SizedBox(height: 30),
              DonorLocation(),
              const SizedBox(height: 23),
              CertificateSection(),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
