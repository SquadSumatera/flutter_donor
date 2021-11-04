import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/profile/profile_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.profile;
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
      page: () => const ProfilePage(),
    ),
  ];
}
