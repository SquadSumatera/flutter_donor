import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/register/register_page.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = Routes.register;
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
      name: Routes.register,
      page: () => RegisterPage(),
    ),
  ];
}
