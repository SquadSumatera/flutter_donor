import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import '../../../get_x/controller/history_controller.dart';
import '../../../models/donor_history_model.dart';
import '../../../routes/app_pages.dart';
import 'history_tile_item.dart';

class HistoryListContainer extends StatelessWidget {
  HistoryListContainer({
    Key? key,
  }) : super(key: key);

  final HistoryController historyController = Get.find();
  final DonorHistoryController donorHistoryController = Get.find();

  List<Widget> _donorHistoryTile() {
    List<Widget> _result = [];
    if (donorHistoryController.status.value == DonorHistoryLoadStatus.loading) {
      _result.add(
        const Center(
          child: CircularProgressIndicator(
            color: AppColor.cBlack,
            strokeWidth: 5,
          ),
        ),
      );
    } else {
      for (Rx<DonorHistoryModel> data in donorHistoryController.donorHistoryList) {
        _result.add(
          Obx(
            () => HistoryTileItem(
              title: "Permintaan Mendonorkan Darah",
              statusText: data.value.showStatus,
              dateText: data.value.dateFormatterString(data.value.createdAt),
              color: data.value.designatedColor,
              callback: () {
                Get.toNamed(Routes.donorDetail);
                donorHistoryController.setSelected(data.value);
              },
            ),
          ),
        );
      }
    }
    return _result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadow.medium,
      ),
      child: Obx(
        () => ListView(
          children:
              (historyController.currentView.value == HistoryViewAs.donator)
                  ? _donorHistoryTile()
                  : [const SizedBox()],
        ),
      ),
    );
  }
}
