import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/donor_history_controller.dart';
import 'package:flutter_donor/get_x/controller/history_controller.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/get_x/controller/submission_history_controller.dart';
import 'package:get/get.dart';

import '../../shared/theme.dart';
import 'widgets/history_as_button.dart';
import 'subsection/history_list_container.dart';

class HistorySection extends StatefulWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  _HistorySectionState createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  ProfileController profileController = Get.find();
  HistoryController historyController = Get.put(HistoryController());
  DonorHistoryController donorHistoryController = Get.put(
    DonorHistoryController(),
  );
  SubmissionHistoryController submissionHistoryController = Get.put(
    SubmissionHistoryController(),
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cultured,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppShadow.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Obx(
                () =>  Text(
                  'Sampai saat ini, telah mendapatkan ${profileController.userPoint.value} poin donor.',
                  style: AppText.textSmall.copyWith(
                    color: AppColor.imperialRed,
                    fontWeight: AppText.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        HistoryAsButton(
                          label: 'Sebagai pemohon',
                          icon: Icons.find_replace,
                          active: historyController.currentView.value ==
                              HistoryViewAs.requester,
                          callback: () {
                            historyController.change(HistoryViewAs.requester);
                            submissionHistoryController.onInit();
                          },
                        ),
                        const SizedBox(height: 25),
                        HistoryAsButton(
                          label: 'Sebagai Pendonor',
                          icon: Icons.volunteer_activism_outlined,
                          active: historyController.currentView.value ==
                              HistoryViewAs.donator,
                          callback: () {
                            historyController.change(HistoryViewAs.donator);
                            donorHistoryController.onInit();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 13),
                  Expanded(
                    child: HistoryListContainer(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -5,
          right: 5,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.imperialRed,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Obx(
                () => Text(
                  '${profileController.profile.value.bloodTypeDonators}${profileController.profile.value.showRhesus}',
                  style: AppText.textMedium.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
