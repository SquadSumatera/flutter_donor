import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/donor_history_controller.dart';
import 'package:flutter_donor/get_x/controller/donor_statistic_controller.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/get_x/state/check_connection_getx.dart';
import 'package:flutter_donor/get_x/state/home_getx.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/donor_statistic_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/home/home_artikel_widget.dart';
import 'package:flutter_donor/ui/home/home_banner_widget.dart';
import 'package:flutter_donor/ui/home/home_divider_widget.dart';
import 'package:flutter_donor/ui/home/home_handle_widget.dart';
import 'package:flutter_donor/ui/home/home_trend_widget.dart';
import 'package:flutter_donor/ui/home/section/home_article_section.dart';
import 'package:get/get.dart';

import 'home_schedule_widget.dart';
import 'home_stok_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CheckConnectionGetX checkConnectionGetX =
      Get.find<CheckConnectionGetX>();
  final LoginGetX loginGetXState = Get.find<LoginGetX>();
  final HomeGetX index = Get.find<HomeGetX>();
  final DonorHistoryController donorHistoryController = Get.find();
  final DonorStatisticController donorStatisticController =
      Get.find<DonorStatisticController>();
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        elevation: 0,
        toolbarHeight: 12.0,
      ),
      body: Obx(
        () => checkConnectionGetX.status.value == StatusConnection.loading
            ? onLoad()
            : checkConnectionGetX.status.value == StatusConnection.failed
                ? failed(
                    () {
                      checkConnectionGetX.onInit();
                    },
                  )
                : Stack(
                    children: [
                      ListView(
                        children: [
                          banner(profileController, index),
                          donorStatisticController.statusSubmission.value ==
                                  StatusSubmissionDonor.loading
                              ? onLoad()
                              : donorStatisticController
                                          .statusSubmission.value ==
                                      StatusSubmissionDonor.failed
                                  ? failed(() {
                                      donorStatisticController.onInit();
                                    })
                                  : stokPlasma(
                                      donorStatisticController
                                          .dataSubmission.value,
                                    ),
                          homeDivider(),
                          donorStatisticController.statusStatistic.value ==
                                  StatusStatisticDonor.loading
                              ? onLoad()
                              : donorStatisticController
                                          .statusStatistic.value ==
                                      StatusStatisticDonor.failed
                                  ? failed(() {
                                      donorStatisticController.onInit();
                                    })
                                  : trend(
                                      donorStatisticController
                                          .donorModel.value.dataStatistics!,
                                      donorStatisticController
                                          .donorModel.value.pointer!),
                          homeDivider(),
                          title("Jadwal Donor"),
                          Obx(
                            () => donorHistoryController.status.value ==
                                    DonorHistoryLoadStatus.loading
                                ? onLoad()
                                : donorHistoryController.status.value ==
                                        DonorHistoryLoadStatus.failed
                                    ? failed(
                                        () {
                                          donorHistoryController.onInit();
                                        },
                                      )
                                    : ListView.builder(
                                        primary: false,
                                        shrinkWrap: true,
                                        itemCount: donorHistoryController
                                            .donorSchedule.length,
                                        itemBuilder: (context, i) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.toNamed(Routes.donorDetail);
                                              donorHistoryController
                                                  .setSelected(
                                                      donorHistoryController
                                                          .donorSchedule[i]
                                                          .value);
                                            },
                                            child: cardSchedule(
                                              donorHistoryController
                                                  .donorSchedule[i]
                                                  .value
                                                  .scheduleDonorNotesDate,
                                              donorHistoryController
                                                  .donorSchedule[i]
                                                  .value
                                                  .scheduleDonorNotesCard,
                                              donorHistoryController
                                                  .donorSchedule[i]
                                                  .value
                                                  .nameInstitutions!,
                                            ),
                                          );
                                        },
                                      ),
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          homeDivider(),
                          HomeArticleSection(),
                        ],
                      ),
                      if (!checkConnectionGetX.verify.value)
                        Container(
                          height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: AppColor.richBlack.withOpacity(0.5),
                          ),
                        ),
                      if (!checkConnectionGetX.verify.value)
                        AlertDialog(
                          title: const Text(
                            "Verify Email",
                            textAlign: TextAlign.center,
                          ),
                          titleTextStyle: AppText.textMedium.copyWith(
                            fontWeight: AppText.semiBold,
                            color: AppColor.richBlack,
                          ),
                          content: Text(
                            "Tekan tombol Verifikasi dibawah, lalu buka email anda untuk melakukan verifkasi email.",
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
                              onPressed: () {
                                checkConnectionGetX.getVerify();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: checkConnectionGetX.statusVerify.value ==
                                        StatusVerify.loading
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
                                        "Verifikasi",
                                        style: AppText.textNormal.copyWith(
                                          color: AppColor.white,
                                          fontWeight: AppText.bold,
                                        ),
                                      ),
                              ),
                            )
                          ],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                    ],
                  ),
      ),
    );
  }
}
