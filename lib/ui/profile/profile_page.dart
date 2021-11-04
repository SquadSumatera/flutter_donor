import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/profile/profile_settings_section.dart';
import 'history_section.dart';
import 'profile_identity_section.dart';
import 'profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ProfileHeader(),
          HistorySection(),
          SizedBox(height: 35),
          ProfileIdentitySection(),
          SizedBox(height: 50),
          ProfileSettingsSection(),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
