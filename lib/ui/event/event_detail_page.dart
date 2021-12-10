import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import 'event_detail_widget.dart';
import 'package:get/get.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({Key? key}) : super(key: key);

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        title: Text(
          "Telah Dibuka...",
          style: AppText.textMedium.copyWith(
            fontWeight: AppText.bold,
            color: AppColor.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15.0,
          ),
          onPressed: () {
            Get.back();
          },
          color: AppColor.white,
        ),
      ),
      body: ListView(
        children: [
          headerEventDetail(context, Get.parameters['image']!,
              "${Get.parameters["idDonor"]}"),
          Container(
            margin: const EdgeInsets.only(right: 18, left: 18, top: 16),
            child: headingTextDetail(
              "${Get.parameters['nameHeading']}",
              "${Get.parameters['published']}",
              "${Get.parameters['time']}",
            ),
          ),
          schedule(
            "${Get.parameters['start']}",
            "${Get.parameters['end']}",
            "09.00 - 15.00",
          ),
          descLong(
            "Deskripsi",
            "${Get.parameters['desc']}",
          ),
          descLong(
            "Alamat",
            "${Get.parameters['address']}",
          ),
          descLong(
            "Kontak",
            "${Get.parameters['contact']}",
          ),
          descLong(
            "Email",
            "${Get.parameters['email']}",
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(
                left: 37.0, right: 37.0, top: 20.0, bottom: 18.0),
            child: ElevatedButton(
              onPressed: () {
                if (profileController
                        .profile.value.bloodTypeDonators.isBlank! ||
                    profileController.profile.value.bloodTypeDonators == null ||
                    profileController
                        .profile.value.bloodRhesusDonators.isBlank! ||
                    profileController.profile.value.bloodRhesusDonators ==
                        null) {
                  Get.back();
                  Get.snackbar(
                    "Lengkapi Data",
                    "Lengkapi data di menu profile",
                    duration: const Duration(seconds: 3),
                  );
                } else {
                  Get.offNamed(Routes.donor, arguments: [
                    "${Get.parameters['idInstitution']}",
                    "${Get.parameters['published']}"
                  ]);
                }
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  37,
                ),
                primary: AppColor.cRed,
              ),
              child: Text(
                "Daftar",
                style: AppText.textMedium.copyWith(
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
