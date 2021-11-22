import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/faq_controller.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:get/get.dart';
import 'change_contact_section.dart';
import '../../overlay/profile_overlay_section.dart';
import 'change_password_section.dart';
import '../../../../shared/theme.dart';
import '../widgets/settings_item_tile.dart';

class ProfileSettingsSection extends StatelessWidget {
  ProfileSettingsSection({Key? key}) : super(key: key);

  final faqController = Get.lazyPut(
    () => FaqController(),
    fenix: true,
  );

  final LoginGetX token = Get.find<LoginGetX>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SettingsItemTile(
            label: 'Ubah Informasi Kontak',
            icon: Icons.perm_contact_calendar,
            callback: () {
              Overlay.of(context)!.insert(
                profileOverlaySection(
                  child: const ChangeContactSection(),
                ),
              );
            },
          ),
          SettingsItemTile(
            label: 'Ubah Password',
            icon: Icons.vpn_key,
            callback: () {
              Overlay.of(context)!.insert(
                profileOverlaySection(
                  child: const ChangePasswordSection(),
                ),
              );
            },
          ),
          SettingsItemTile(
            label: 'Frequently Asked Questions (FAQ)',
            icon: Icons.quiz,
            callback: () {
              Get.toNamed(Routes.faq);
            },
          ),
          SettingsItemTile(
            label: 'Log Out',
            icon: Icons.logout,
            callback: () {
              token.changeToken("");
              token.setDataToken("");
              Get.offAllNamed(Routes.login);
            },
            textColor: AppColor.white,
            backgroundColor: AppColor.imperialRed,
          ),
        ],
      ),
    );
  }
}
