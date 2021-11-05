import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/theme.dart';
import '../widgets/profile_identity_item.dart';

class ProfileIdentitySection extends StatelessWidget {
  const ProfileIdentitySection({Key? key}) : super(key: key);

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
            children: const <Widget>[
              ProfileIdentityItem(
                title: "Jenis Kelamin",
                value: "Pria",
              ),
              ProfileIdentityItem(
                title: "Golongan Darah",
                value: "B",
              ),
              ProfileIdentityItem(
                title: "Rhesus",
                value: "+",
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
                primary: AppColor.imperialRed,
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
