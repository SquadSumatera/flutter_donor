import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/profile/profile_edit_identity/profile_edit_identity_page.dart';
import '../ui/profile/profile_main/profile_page.dart';
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
      children: [
        GetPage(
          name: Routes.profileEditIdentity,
          page: () => const ProfileEditIdentityPage(),
        ),
      ],
    ),
  ];
}
