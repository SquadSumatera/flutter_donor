import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/institutions_controller.dart';
import 'package:flutter_donor/get_x/controller/location_controller.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/get_x/state/check_connection_getx.dart';
import 'package:flutter_donor/get_x/state/home_getx.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/event/event_page.dart';
import 'package:flutter_donor/ui/home/home_page.dart';
import 'package:flutter_donor/ui/location/location_page.dart';
import 'package:flutter_donor/ui/profile/profile_main/profile_page.dart';
import 'package:get/get.dart';

import 'widgets/navigation_item.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final PageStorageBucket bucket = PageStorageBucket();

  final HomeGetX homeGetXPage = Get.put(HomeGetX());

  static LoginGetX loginGetX = Get.find();

  final ProfileController profileController = Get.put(ProfileController());

  final locationController = Get.lazyPut(
    () => LocationController(),
    fenix: true,
  );

  final institutionController = Get.lazyPut(
        () => InstitutionsController(loginGetX.token.value),
    fenix: true,
  );

  final checkConnection = Get.lazyPut(
    () => CheckConnectionGetX(),
    fenix: true,
  );

  final List<Widget> currentScrenList = [
    HomePage(),
    LocationPage(),
    const EventPage(),
    const ProfilePage(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => PageStorage(
          child: currentScrenList[homeGetXPage.currentIndex.value],
          bucket: bucket,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Obx(() => FloatingActionButton(
            backgroundColor: loginGetX.dontChange.value ? null : AppColor.cRed,
            onPressed: () {
              if (profileController.status.value == ProfileLoadStatus.loading) {
                Get.snackbar(
                  "Loading",
                  "",
                  duration: const Duration(seconds: 2),
                );
              } else if (profileController.status.value ==
                  ProfileLoadStatus.loaded) {
                var data = profileController.profile;
                if (data!.bloodTypeDonators.isBlank! ||
                    data.bloodTypeDonators == null ||
                    data.bloodRhesusDonators.isBlank! ||
                    data.bloodRhesusDonators == null) {
                  Get.snackbar(
                    "Lengkapi Data",
                    "Lengkapi data di menu profile",
                    duration: const Duration(seconds: 2),
                  );
                } else {
                  Get.toNamed(Routes.request);
                }
              }
            },
            tooltip: "Request plasma",
            child: Container(
              margin: const EdgeInsets.all(15.0),
              child: Image.asset('assets/bitmap/blood.png'),
            ),
            elevation: 4.0,
          )),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Obx(
                () => NavigationItem(
                  callback: () => homeGetXPage.changeIndex(0),
                  svgSource: 'assets/vector/ic_home.svg',
                  active: homeGetXPage.currentIndex.value == 0,
                  label: "Beranda",
                ),
              ),
              Obx(
                () => NavigationItem(
                  callback: () => homeGetXPage.changeIndex(1),
                  svgSource: 'assets/vector/ic_location.svg',
                  active: homeGetXPage.currentIndex.value == 1,
                  label: "Lokasi",
                ),
              ),
              const SizedBox(width: 50.0),
              Obx(
                () => NavigationItem(
                  callback: () => homeGetXPage.changeIndex(2),
                  svgSource: 'assets/vector/ic_dashboard.svg',
                  active: homeGetXPage.currentIndex.value == 2,
                  label: "Acara",
                ),
              ),
              Obx(
                () => NavigationItem(
                  callback: () => homeGetXPage.changeIndex(3),
                  svgSource: 'assets/vector/ic_profile.svg',
                  active: homeGetXPage.currentIndex.value == 3,
                  label: "Profil",
                ),
              ),
            ],
          ),
        ),
        //to add a space between the FAB and BottomAppBar
        shape: const CircularNotchedRectangle(),
        //color of the BottomAppBar
        color: Colors.white,
      ),
    );
  }
}
