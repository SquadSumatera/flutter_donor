import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/donor_detail_overlay_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/history/subsection/detail_header.dart';
import 'package:flutter_donor/ui/history/subsection/schedule_detail_section.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DonorDetailPage extends StatelessWidget {
  DonorDetailPage({Key? key}) : super(key: key);
  final DonorDetailOverlayController c =
      Get.put(DonorDetailOverlayController());
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
            ],
          ),
        ],
      ),
    );
  }
}
