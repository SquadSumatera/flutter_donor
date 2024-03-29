import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({
    Key? key,
    required this.title,
    required this.status,
  }) : super(key: key);
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 40.0,
        left: 18.0,
        bottom: 27.0,
      ),
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/bitmap/header_bg.png'),
          fit: BoxFit.cover,
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
            title,
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
            child: Text(
              status,
              style: AppText.textNormal.copyWith(
                color: AppColor.bloodRed,
                fontWeight: AppText.bold,
              ),
            ),

            // child: Obx(
            //   () => Text(
            //     controller.selected?.value.showStatus ?? "-",
            //     style: AppText.textNormal.copyWith(
            //       color: AppColor.bloodRed,
            //       fontWeight: AppText.bold,
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}
