import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/profile/overlay/profile_overlay_section.dart';
import 'package:flutter_donor/ui/profile/profile_main/sections/change_name_section.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ProfilePhotoHeader(),
        ProfileNameHeader(),
      ],
    );
  }
}

class ProfilePhotoHeader extends StatelessWidget {
  ProfilePhotoHeader({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.20,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bitmap/header_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Obx(
                () => CircleAvatar(
                  radius: 53,
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  backgroundImage:
                      profileController.profile.value.showProfilePhoto,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: AppColor.imperialRed,
                      width: 1,
                    ),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'png', 'jpeg'],
                      );
                      if (result != null) {
                        profileController.updateProfilePhoto(
                          file: File(result.files.single.path!),
                        );
                      }
                    },
                    icon: const Icon(
                      Icons.add_a_photo_outlined,
                      color: AppColor.imperialRed,
                      size: 20,
                    ),
                    padding: const EdgeInsets.all(0),
                    splashRadius: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ProfileNameHeader extends StatelessWidget {
  ProfileNameHeader({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  profileController.profile.value.nameDonators ?? '',
                  style: AppText.textMedium.copyWith(
                    fontWeight: AppText.bold,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                color: AppColor.cBlack,
                padding: EdgeInsets.zero,
                splashRadius: 10,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Overlay.of(context)!.insert(
                    profileOverlaySection(
                      child: const ChangeNameSection(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit,
                  color: AppColor.imperialRed,
                  size: 16,
                ),
              ),
            ],
          ),
          Text(
            'Bergabung sejak ${profileController.profile.value.showJoined}',
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.normal,
            ),
          ),
        ],
      ),
    );
  }
}
