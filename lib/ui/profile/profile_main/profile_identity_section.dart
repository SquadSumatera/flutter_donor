import 'package:flutter/material.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

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

class ProfileIdentityItem extends StatelessWidget {
  const ProfileIdentityItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: AppText.textNormal.copyWith(
            color: AppColor.imperialRed,
            fontWeight: AppText.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 33,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.imperialRed,
          ),
          child: Center(
            child: Text(
              value,
              style: AppText.textNormal.copyWith(
                color: AppColor.white,
                fontWeight: AppText.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
