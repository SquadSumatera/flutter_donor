import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/location/marker_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'list_maps_widget.dart';

class ShowMapsPage extends StatelessWidget {
  const ShowMapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //     const SystemUiOverlayStyle(statusBarColor: AppColor.cRed,
    //       statusBarIconBrightness: Brightness.dark ));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/vector/ic_back.svg',
            width: 12,
          ),
          onPressed: () {},
        ),
        title: Text(
          'Lokasi',
          style: AppText.textMedium.copyWith(fontWeight: AppText.semiBold),
        ),
        titleSpacing: 0,
        backgroundColor: AppColor.cRed,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColor.cRed,
            statusBarIconBrightness: Brightness.light),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                Get.toNamed(Routes.locationSearch);
              },
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          const MarkerWidget(),
          DraggableScrollableSheet(
              initialChildSize: 0.25,
              builder: (_, scrollController) {
                return Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          )
                        ]),
                    child: ListView.builder(
                      controller: scrollController,
                      itemCount: 25,
                      itemBuilder: (BuildContext context, int index) {
                        return ListMapsWidget(
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
