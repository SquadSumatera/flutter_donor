import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/event/event_page.dart';
import 'package:flutter_donor/ui/login/login_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;
  static final routes = [
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
      name: Routes.event,
      page: () => const Scaffold(),
    ),
    GetPage(
      name: Routes.event + "/:id?",
      page: () => const Scaffold(),
    )
  ];
}
