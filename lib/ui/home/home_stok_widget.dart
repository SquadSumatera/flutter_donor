import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget stokPlasma() {
  return Container(
    height: 110.0,
    margin: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 30.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Image(
          image: AssetImage("assets/bitmap/bloods_level.png"),
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Stok Plasma",
              style: AppText.textMedium.copyWith(
                color: AppColor.cRed,
                fontWeight: AppText.bold,
                letterSpacing: 0.4,
              ),
            ),
            Text(
              "Diperbarui 28/10/2045",
              style: AppText.textExtraSmall.copyWith(
                color: AppColor.cDarkBlue,
                letterSpacing: 0.4,
                fontWeight: AppText.light,
              ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "59",
                  style: AppText.textSemiLarge.copyWith(
                    color: AppColor.cDarkBlue,
                    fontWeight: AppText.semiBold,
                  ),
                ),
                Text(
                  "Kantung",
                  style: AppText.textExtraSmall.copyWith(
                    color: AppColor.cDarkBlue,
                    fontWeight: AppText.semiBold,
                  ),
                ),
              ],
            ),
          ],
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Permintaan",
                  style: AppText.textSmall.copyWith(
                    color: AppColor.cRed,
                    fontWeight: AppText.semiBold,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.search,
                      size: 19.0,
                      color: AppColor.cDarkBlue,
                    ),
                    Text(
                      "210",
                      style: AppText.textSemiLarge.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.bold,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
