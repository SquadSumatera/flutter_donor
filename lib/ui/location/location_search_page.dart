import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'list_maps_widget.dart';

class LocationSearchPage extends StatelessWidget {
  const LocationSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text(
            'Cari Lokasi',
            style: AppText.textMedium.copyWith(fontWeight: AppText.semiBold),
          ),
          titleSpacing: 0,
          backgroundColor: AppColor.cRed,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: 25,
          itemBuilder: (BuildContext context, int index) {
            return ListMapsWidget(
              index: index,
            );
          },
        ));
  }
}
