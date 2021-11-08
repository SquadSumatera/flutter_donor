import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/location/location_detail_page.dart';
import 'package:flutter_donor/ui/location/location_page.dart';
import 'package:flutter_donor/ui/location/location_search_page.dart';
import 'package:flutter_donor/ui/location/show_maps_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.location;
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.location,
      page: () => const LocationPage(),
    ),
    GetPage(
      name: Routes.showMaps,
      page: () => const ShowMapsPage(),
    ),
    GetPage(
      name: Routes.locationSearch,
      page: () => const LocationSearchPage(),
    ),
    GetPage(
      name: Routes.locationDetail,
      page: () => const LocationDetailPage(),
    ),
  ];
}
