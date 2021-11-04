import 'package:flutter/material.dart';
import 'history_section.dart';
import 'profile_identity_section.dart';
import 'profile_header.dart';
import 'profile_settings_section.dart';

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
