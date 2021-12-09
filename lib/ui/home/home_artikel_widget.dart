import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget article() {
  return Container(
    height: 90.0,
    margin: const EdgeInsets.only(
      left: 30.0,
      right: 30.0,
      bottom: 8.0,
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 12.0),
          height: 90.0,
          width: 80.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/bitmap/header_bg.png"),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Cari tahu kenapa hati anda kosong ?",
                softWrap: true,
                maxLines: 2,
                style: AppText.textMedium.copyWith(
                  fontWeight: AppText.semiBold,
                  color: AppColor.cBlack,
                ),
              ),
              Text(
                "Hal ini diungkapkan oleh ilmuwan terkenal Prof. Diky, bahwasannya hati kosong itu terjadi karena implikasi adanya perasaan dahulu yang belum move on dengan mantan yang sekarang sudah bahagia dengan yang lainnya",
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppText.textSmall.copyWith(
                  fontWeight: AppText.light,
                  color: AppColor.cBlack,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Rezki Jaka",
                    style: AppText.textSmall.copyWith(
                      color: AppColor.cRed,
                      fontWeight: AppText.semiBold,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const Icon(
                    Icons.circle,
                    color: AppColor.cGrey,
                    size: 5.0,
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    "Rezki Jaka",
                    style: AppText.textSmall.copyWith(
                      color: AppColor.cGrey,
                      fontWeight: AppText.normal,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    ),
  );
}
