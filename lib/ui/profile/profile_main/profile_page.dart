import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/routes/app_pages.dart';
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
  ProfileController profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getProfile(
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJSb2xlcyI6IkRvbmF0b3JzIiwiZXhwIjoxNjM3MzI5OTYzLCJpZF9kb25hdG9ycyI6IjU5Y2FmMWVjLTU5YmQtNDVhZi04NzZlLTE0OWQ1ZGY3OTdmNiJ9.r7fT4W84XMNnNsLrxXLHXItNDcgcdXnbRXMHliIu4iE",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return (profileController.status.value == ProfileLoadStatus.loaded)
            ? ListView(
                children: const <Widget>[
                  ProfileHeader(),
                  HistorySection(),
                  SizedBox(height: 35),
                  ProfileIdentitySection(),
                  SizedBox(height: 50),
                  ProfileSettingsSection(),
                  SizedBox(height: 50),
                ],
              )
            : (profileController.status.value == ProfileLoadStatus.loading)
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            "Terjadi Kesalahan, coba beberapa saat kembali."),
                        TextButton(
                          onPressed: () {
                            profileController.getProfile(
                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJSb2xlcyI6IkRvbmF0b3JzIiwiZXhwIjoxNjM3MzI5OTYzLCJpZF9kb25hdG9ycyI6IjU5Y2FmMWVjLTU5YmQtNDVhZi04NzZlLTE0OWQ1ZGY3OTdmNiJ9.r7fT4W84XMNnNsLrxXLHXItNDcgcdXnbRXMHliIu4iE",
                            );
                          },
                          child: const Text("Coba Lagi"),
                        ),
                      ],
                    ),
                  );
      }),
    );
  }
}
