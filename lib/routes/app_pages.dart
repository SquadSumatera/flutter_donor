import 'package:flutter/material.dart';

import 'package:flutter_donor/ui/event/event_page.dart';
import 'package:flutter_donor/ui/location/location_detail_page.dart';
import 'package:flutter_donor/ui/location/location_maps_page.dart';
import 'package:flutter_donor/ui/location/location_page.dart';
import 'package:flutter_donor/ui/location/location_search_page.dart';
import 'package:flutter_donor/ui/login/login_page.dart';
import 'package:flutter_donor/ui/splashscreen/splash_screen_page.dart';

import 'package:flutter_donor/ui/register/register_page.dart';

import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreenPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const EventPage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
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
      page: () => const LocationMapsPage(),
    ),
    GetPage(
      name: Routes.locationSearch,
      page: () => const LocationSearchPage(),
    ),
    GetPage(
      name: Routes.locationDetail,
      page: () => const LocationDetailPage(),
    ),
    GetPage(
      name: Routes.event,
      page: () => const EventPage(),
    ),
    GetPage(
      name: Routes.event + "/:id?",
      page: () => const Scaffold(),
    )

      name: Routes.register,
      page: () => RegisterPage(),
    ),

  ];
}
