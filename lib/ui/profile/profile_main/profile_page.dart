import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:get/get.dart';
import 'sections/history_section.dart';
import 'sections/profile_identity_section.dart';
import 'widgets/profile_header.dart';
import 'sections/profile_settings_section.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileController profileController = Get.find();
  LoginGetX loginGetXState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return (profileController.status.value == ProfileLoadStatus.loading)
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : (profileController.status.value == ProfileLoadStatus.failed)
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            "Terjadi Kesalahan, coba beberapa saat kembali."),
                        TextButton(
                          onPressed: () {
                            profileController.getProfile(
                              loginGetXState.token.value,
                            );
                          },
                          child: const Text("Coba Lagi"),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    children: <Widget>[
                      const ProfileHeader(),
                      const HistorySection(),
                      const SizedBox(height: 35),
                      ProfileIdentitySection(),
                      const SizedBox(height: 50),
                      const ProfileSettingsSection(),
                      const SizedBox(height: 50),
                    ],
                  );
      }),
    );
  }
}
