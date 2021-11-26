import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/location/location_marker_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'location_list_widget.dart';

class LocationMapsPage extends StatelessWidget {
  const LocationMapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Petunjuk",
          style: AppText.textSemiLarge
              .copyWith(color: AppColor.white, fontWeight: AppText.semiBold),
        ),
        backgroundColor: AppColor.cRed,
      ),
      body: Stack(
        children: [
          LocationMarkerWidget(),
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
                        return LocationListWidget(
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
