import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget headerEventDetail(BuildContext context) {
  return Container(
    height: 180.0,
    width: MediaQuery.of(context).size.width,
    decoration: const BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage("assets/bitmap/header_bg.png"),
      ),
    ),
  );
}

Widget headingTextDetail(String heading, String institution, String time) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              "Telah Dibuka Donor Plasma Covid di Wilayah Simbabwe",
              style: AppText.textMedium.copyWith(
                color: AppColor.cBlack,
                fontWeight: AppText.semiBold,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 10.0,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            institution,
            style: AppText.textSmall.copyWith(
              fontWeight: AppText.normal,
              color: AppColor.cBlue,
            ),
          ),
          const SizedBox(
            width: 20.0,
          ),
          const Icon(
            Icons.circle_rounded,
            size: 8.0,
            color: AppColor.cGrey,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Text(
              "23-10-2021",
              style: AppText.textSmall.copyWith(
                color: AppColor.cGrey,
                fontWeight: AppText.normal,
              ),
            ),
          )
        ],
      )
    ],
  );
}

Widget elementOfJadwal(String name, String value, IconData icon, Color color) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const SizedBox(width: 4),
      Icon(
        icon,
        color: color,
        size: 14.0,
      ),
      const SizedBox(width: 10),
      SizedBox(
        width: 100.0,
        child: Text(
          "$name ",
          style: AppText.textSmall.copyWith(
            color: AppColor.cBlack,
            fontWeight: AppText.normal,
          ),
        ),
      ),
      Expanded(
        child: Text(
          ": $value",
          style: AppText.textSmall.copyWith(
            color: AppColor.cBlack,
            fontWeight: AppText.normal,
          ),
        ),
      ),
    ],
  );
}
