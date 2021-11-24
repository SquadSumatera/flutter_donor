import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import 'package:flutter_donor/shared/theme.dart';

class DetailHeader extends StatelessWidget {
  DetailHeader({Key? key}) : super(key: key);
  final DonorHistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 18.0,
        bottom: 27.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFFA4161A),
            const Color(0xFFDC2626).withOpacity(0.65),
          ],
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        boxShadow: AppShadow.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Detail Pendonoran",
            style: AppText.textMedium.copyWith(
              color: AppColor.white,
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 36.0),
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Obx(
              () => Text(
                controller.selected?.value.showStatus ?? "-",
                style: AppText.textNormal.copyWith(
                  color: AppColor.bloodRed,
                  fontWeight: AppText.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
