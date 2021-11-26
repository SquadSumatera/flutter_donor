import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/location_controller.dart';
import 'package:flutter_donor/ui/location/location_loading_page.dart';
import 'package:get/get.dart';

import 'location_maps_page.dart';


class LocationPage extends StatelessWidget {
  LocationPage({Key? key}) : super(key: key);

  final LocationController locationController = Get.find();

  final List<Widget> currentScreenList = [
    const LocationLoadingPage(),
    const LocationMapsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageStorage(
          child: (locationController.status == LocationStatus.loaded)
              ? currentScreenList[1]
              : currentScreenList[0],
          bucket: PageStorageBucket(),
        ),
      ),
    );
  }
}
