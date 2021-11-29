import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget schedule() {
  return Container(
    margin: const EdgeInsets.only(
      top: 16.0,
      right: 32.0,
      left: 32.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jadwal Donor",
          style: AppText.textMedium.copyWith(
            fontWeight: AppText.bold,
            color: AppColor.cDarkBlue,
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
      ],
    ),
  );
}

Widget cardSchedule() {
  return Container(
    height: 72.0,
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    margin: const EdgeInsets.only(
      right: 32.0,
      left: 32.0,
      bottom: 8.0,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
      color: AppColor.imperialRed.withOpacity(0.9),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: 55.0,
          width: 55.0,
          child: Stack(
            children: [
              const Image(
                height: 55.0,
                width: 65.0,
                fit: BoxFit.cover,
                image: AssetImage("assets/bitmap/rectangle.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  "17",
                  textAlign: TextAlign.center,
                  style: AppText.textLarge.copyWith(
                    color: AppColor.cDarkBlue,
                    fontWeight: AppText.semiBold,
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          width: 18.0,
        ),
        const VerticalDivider(
          indent: 8.0,
          endIndent: 8.0,
          thickness: 1.0,
          color: AppColor.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Sabtu, 17 Nov 2021",
              style: AppText.textMedium.copyWith(
                fontWeight: AppText.semiBold,
                color: AppColor.white,
              ),
            ),
            Text(
              "Lokasi PMI Lumbung No. 23",
              style: AppText.textSmall.copyWith(
                fontWeight: AppText.normal,
                color: AppColor.white,
              ),
            ),
            Text(
              "09.00 - 10.00 WIB",
              style: AppText.textSmall.copyWith(
                fontWeight: AppText.normal,
                color: AppColor.white,
              ),
            ),
          ],
        ),
        Expanded(
          child: IconButton(
            alignment: Alignment.centerRight,
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.white,
              size: 20.0,
            ),
          ),
        )
      ],
    ),
  );
}
