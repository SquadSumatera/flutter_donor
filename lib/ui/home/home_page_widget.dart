import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/check_connection_getx.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget banner(CheckConnectionGetX model) {
  return SizedBox(
    height: 222.0,
    child: Stack(
      children: [
        Container(
          height: 183.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/bitmap/header_bg.png"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 27.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.only(
                        right: 19.0,
                        top: 10,
                      ),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications,
                        color: AppColor.white,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Selamat Datang !",
                  style: AppText.textLarge.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.bold,
                  ),
                ),
                Text(
                  "Mulai bantu selamatkan nyawa sekarang",
                  style: AppText.textNormal.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.normal,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 6.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: AppColor.white,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.star_border,
                        color: AppColor.cRed,
                        size: 12.0,
                      ),
                      const SizedBox(width: 6.0),
                      Text(
                        "Nilai Aplikasi",
                        style: AppText.textNormal.copyWith(
                          color: AppColor.cRed,
                          fontWeight: AppText.normal,
                          letterSpacing: 1,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            height: 77.0,
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColor.white,
              boxShadow: const [
                BoxShadow(
                  blurRadius: 0.4,
                  offset: Offset(0, 4),
                  color: AppColor.cGrey,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: model.profile!.showProfilePhoto ??
                          const AssetImage("assets/bitmap/header_bg.png"),
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColor.lightGrey,
                      width: 0.5,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Diky Nugraa Difiera",
                      style: AppText.textMedium.copyWith(
                        color: AppColor.cRed,
                        fontWeight: AppText.semiBold,
                      ),
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Lihat Selengkapnya",
                        style: AppText.textSmall.copyWith(
                          color: AppColor.lightGrey,
                          fontWeight: AppText.normal,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: AppColor.cDarkBlue,
                          size: 26.0,
                        ),
                        Text(
                          "999 PTS",
                          style: AppText.textNormal.copyWith(
                              color: AppColor.cDarkBlue,
                              fontWeight: AppText.normal),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
