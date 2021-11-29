import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/theme.dart';
import '../widgets/profile_identity_item.dart';

class ProfileIdentitySection extends StatelessWidget {
  ProfileIdentitySection({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColor.cultured,
        boxShadow: AppShadow.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Identitas Pribadi',
            style: AppText.textMedium.copyWith(
              color: AppColor.imperialRed,
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ProfileIdentityItem(
                title: "Jenis Kelamin",
                value: profileController.profile!.showGender ?? "-",
              ),
              ProfileIdentityItem(
                title: "Golongan Darah",
                value: profileController.profile!.bloodTypeDonators ?? "-",
              ),
              ProfileIdentityItem(
                title: "Rhesus",
                value: profileController.profile!.showRhesus ?? " ",
              ),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await Get.toNamed(
                  "${Routes.profile}/${Routes.profileEditIdentity}",
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  MediaQuery.of(context).size.width * 0.8,
                  45,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                primary: AppColor.cRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Ubah Identitas',
                style: AppText.textNormal.copyWith(
                  color: AppColor.white,
                  fontWeight: AppText.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
