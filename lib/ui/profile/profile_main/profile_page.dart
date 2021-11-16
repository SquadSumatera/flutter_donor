import 'package:flutter/material.dart';
import 'sections/history_section.dart';
import 'sections/profile_identity_section.dart';
import 'widgets/profile_header.dart';
import 'sections/profile_settings_section.dart';

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
