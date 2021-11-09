import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/svg.dart';

Widget headerLogo() {
  return Container(
    margin: const EdgeInsets.only(top: 50, bottom: 8.0),
    child: SvgPicture.asset(
      "assets/vector/ic_title.svg",
      width: 101.0,
      height: 38.0,
      fit: BoxFit.cover,
    ),
  );
}

Widget namePage(String name) {
  return Text(
    name,
    style: AppText.textLarge.copyWith(
      fontWeight: AppText.semiBold,
      color: AppColor.cBlack,
    ),
  );
}
