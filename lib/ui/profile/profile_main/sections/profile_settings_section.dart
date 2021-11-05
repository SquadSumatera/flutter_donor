import 'package:flutter/material.dart';
import 'change_contact_section.dart';
import 'profile_overlay_section.dart';
import 'change_password_section.dart';
import '../../../../shared/theme.dart';
import '../widgets/settings_item_tile.dart';

class ProfileSettingsSection extends StatelessWidget {
  const ProfileSettingsSection({Key? key}) : super(key: key);

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
            callback: () {},
          ),
          SettingsItemTile(
            label: 'Log Out',
            icon: Icons.logout,
            callback: () {},
            textColor: AppColor.white,
            backgroundColor: AppColor.imperialRed,
          ),
        ],
      ),
    );
  }
}
