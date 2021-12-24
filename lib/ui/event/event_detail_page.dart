import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_register_controller.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import 'event_detail_widget.dart';
import 'package:get/get.dart';

class EventDetailPage extends StatelessWidget {
  EventDetailPage({
    Key? key,
  }) : super(key: key);

  final ProfileController profileController = Get.find<ProfileController>();
  final EventRegisterController eventRegisterController = Get.put(
    EventRegisterController(),
  );

  List<bool> search = Get.arguments;

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
              "${Get.parameters["idDonor"]}", search[0]),
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
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          "Daftar",
                          textAlign: TextAlign.center,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        titleTextStyle: AppText.textMedium.copyWith(
                          fontWeight: AppText.semiBold,
                          color: AppColor.richBlack,
                        ),
                        content: Text(
                          "Apakah anda yakin ingin mendaftar event ini? \n Event dilaksanakan pada ${Get.parameters['start']}.",
                          style: AppText.textSmall.copyWith(
                            fontWeight: AppText.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        contentPadding: const EdgeInsets.all(12.0),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.cRed,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () async {
                              await eventRegisterController
                                  .registerEvent(
                                "${Get.parameters["idDonorEvents"]}",
                                profileController
                                    .profile.value.bloodTypeDonators!,
                                profileController
                                    .profile.value.bloodRhesusDonators!,
                                "${Get.parameters["schedule"]}",
                              )
                                  .then(
                                (status) {
                                  if (status) {
                                    Get.back();
                                    Get.back();

                                    Get.defaultDialog(
                                      title: "SUKSES",
                                      titleStyle: AppText.textMedium.copyWith(
                                        color: AppColor.cBlack,
                                        fontWeight: AppText.bold,
                                      ),
                                      titlePadding:
                                          const EdgeInsets.only(top: 12.0),
                                      barrierDismissible: false,
                                      middleText:
                                          "Silahkan lihat jadwal anda di \n Beranda - Jadwal Donor",
                                      middleTextStyle:
                                          AppText.textSmall.copyWith(
                                        color: AppColor.cBlack,
                                        fontWeight: AppText.light,
                                      ),
                                      confirmTextColor: AppColor.white,
                                      confirm: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColor.cRed,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        child: Text(
                                          "OKE",
                                          style: AppText.textNormal.copyWith(
                                            color: AppColor.white,
                                            fontWeight: AppText.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      radius: 14.0,
                                    );
                                  } else {
                                    Get.back();
                                    Get.snackbar(
                                      "Failed",
                                      "Terjadi kesalahan",
                                      duration: const Duration(seconds: 5),
                                    );
                                  }
                                },
                              );
                            },
                            child: Obx(
                              () => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: eventRegisterController.status.value ==
                                        RegisterEventStatus.loading
                                    ? const Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 6.0,
                                          horizontal: 2.0,
                                        ),
                                        child: CircularProgressIndicator(
                                          color: AppColor.white,
                                          strokeWidth: 3.0,
                                          semanticsLabel: "Loading...",
                                        ),
                                      )
                                    : Text(
                                        "Iya",
                                        style: AppText.textNormal.copyWith(
                                          color: AppColor.white,
                                          fontWeight: AppText.bold,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: AppColor.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text(
                                "Tidak",
                                style: AppText.textNormal.copyWith(
                                  color: AppColor.cBlack,
                                  fontWeight: AppText.bold,
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  );

                  // Get.offNamed(
                  //   Routes.donor,
                  //   arguments: [
                  //     "${Get.parameters['idInstitution']}",
                  //     "${Get.parameters['published']}"
                  //   ],
                  // );
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
