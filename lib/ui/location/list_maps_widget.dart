import 'package:flutter/material.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListMapsWidget extends StatelessWidget {
  final int index;
  const ListMapsWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            'assets/vector/ic_pin_fill.svg',
            width: 45,
            color: (index % 2 == 0) ? AppColor.cRed : AppColor.cOrange,
          ),
          title: Text(
            'Kantor PMI Kota Kediri',
            style: AppText.textMedium.copyWith(
                fontWeight: AppText.normal, color: AppColor.cDarkBlue),
          ),
          subtitle: Text(
            'Jl. Doang Jadian Kagak',
            style: AppText.textNormal.copyWith(
                fontWeight: AppText.normal, color: AppColor.cDarkBlue),
          ),
          trailing: Text(
            '100 km',
            style: AppText.textNormal.copyWith(
                fontWeight: AppText.normal, color: AppColor.cDarkBlue),
          ),
          onTap: () {
            Get.toNamed(Routes.locationDetail);
          },
        ),
        Container(
          width: double.maxFinite,
          height: 0.5,
          color: AppColor.cDarkBlue,
        )
      ],
    );
  }
}
