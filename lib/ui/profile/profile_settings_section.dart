import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

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
            callback: () {},
          ),
          SettingsItemTile(
            label: 'Ubah Password',
            icon: Icons.vpn_key,
            callback: () {},
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

class SettingsItemTile extends StatelessWidget {
  const SettingsItemTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.callback,
    this.backgroundColor = AppColor.white,
    this.textColor = AppColor.richBlack,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: AppColor.lightGrey,
          primary: backgroundColor,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColor.cultured,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: textColor,
              size: 20.0,
            ),
            const SizedBox(width: 13.0),
            Expanded(
              child: Text(
                label,
                style: AppText.textNormal.copyWith(
                  fontWeight: AppText.semiBold,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }
}
