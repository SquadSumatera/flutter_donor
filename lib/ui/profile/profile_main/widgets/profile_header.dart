import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
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
          height: MediaQuery.of(context).size.height * 0.25,
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
              const CircleAvatar(
                radius: 53,
                backgroundImage: NetworkImage("https://picsum.photos/200"),
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
                  child: const Icon(
                    Icons.add_a_photo_outlined,
                    color: AppColor.imperialRed,
                    size: 20,
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
          Text(
            profileController.profile?.nameDonators ?? '',
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          Text(
            'Bergabung sejak ${profileController.profile?.createdAt}',
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.normal,
            ),
          ),
        ],
      ),
    );
  }
}
