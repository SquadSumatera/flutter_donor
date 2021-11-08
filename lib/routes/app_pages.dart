import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/splashscreen/splash_screen_page.dart';
import 'package:flutter_donor/ui/event/event_page.dart';
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
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.event,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.event + "/:id?",
      page: () => const Scaffold(),
    )
  ];
}
