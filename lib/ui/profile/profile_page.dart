import 'package:flutter/material.dart';
import 'profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const <Widget>[
          ProfileHeader(),
        ],
      ),
    );
  }
}


