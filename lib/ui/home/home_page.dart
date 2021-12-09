import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/donor_history_controller.dart';
import 'package:flutter_donor/get_x/controller/donor_statistic_controller.dart';
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
                : ListView(
                    children: [
                      banner(checkConnectionGetX, index),
                      donorStatisticController.statusSubmission.value ==
                              StatusSubmissionDonor.loading
                          ? onLoad()
                          : donorStatisticController.statusSubmission.value ==
                                  StatusSubmissionDonor.failed
                              ? failed(() {
                                  donorStatisticController.onInit();
                                })
                              : stokPlasma(
                                  donorStatisticController.dataSubmission.value,
                                ),
                      homeDivider(),
                      donorStatisticController.statusStatistic.value ==
                              StatusStatisticDonor.loading
                          ? onLoad()
                          : donorStatisticController.statusStatistic.value ==
                                  StatusStatisticDonor.failed
                              ? failed(() {
                                  donorStatisticController.onInit();
                                })
                              : trend(donorStatisticController.dataList),
                      homeDivider(),
                      title("Jadwal Donor"),
                      Obx(
                        () => donorHistoryController.status.value ==
                                DonorHistoryLoadStatus.loading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColor.cBlack,
                                  strokeWidth: 5,
                                ),
                              )
                            : ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount:
                                    donorHistoryController.donorSchedule.length,
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.donorDetail);
                                      donorHistoryController.setSelected(
                                          donorHistoryController
                                              .donorSchedule[i].value);
                                    },
                                    child: cardSchedule(
                                      donorHistoryController.donorSchedule[i]
                                          .value.scheduleDonorNotesDate,
                                      donorHistoryController.donorSchedule[i]
                                          .value.scheduleDonorNotesCard,
                                      donorHistoryController.donorSchedule[i]
                                          .value.nameInstitutions!,
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
                      // title("Artikel"),
                      // ListView.builder(
                      //   primary: false,
                      //   shrinkWrap: true,
                      //   itemCount: 5,
                      //   itemBuilder: (context, i) {
                      //     return article();
                      //   },
                      // )
                    ],
                  ),
      ),
    );
  }
}
