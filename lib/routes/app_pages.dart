import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/dummy_event_model.dart';
import 'package:flutter_donor/ui/event/event_detail_page.dart';
import 'package:flutter_donor/ui/event/event_page.dart';
import 'package:flutter_donor/ui/home/home_page.dart';
import 'package:flutter_donor/ui/location/location_detail_page.dart';
import 'package:flutter_donor/ui/location/location_maps_page.dart';
import 'package:flutter_donor/ui/location/location_page.dart';
import 'package:flutter_donor/ui/location/location_search_page.dart';
import 'package:flutter_donor/ui/login/login_page.dart';
import 'package:flutter_donor/ui/main/main_page.dart';
import 'package:flutter_donor/ui/register/register_2_page.dart';
import 'package:flutter_donor/ui/register/register_3_page.dart';
import 'package:flutter_donor/ui/register/register_page.dart';
import 'package:flutter_donor/ui/request/request_page.dart';
import 'package:flutter_donor/ui/splashscreen/splash_screen_page.dart';
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
      name: Routes.main,
      page: () => MainPage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
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
      page: () => const EventDetailPage(),
    ),
    GetPage(
      name: Routes.register,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: Routes.register2,
      page: () => const RegisterPage2(),
    ),
    GetPage(
      name: Routes.register3,
      page: () => RegisterPage3(),
    ),
    GetPage(
      name: Routes.request,
      page: () => RequestPage(),
    )
  ];
}
