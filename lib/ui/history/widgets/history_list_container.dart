import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/request_history_controller.dart';
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
  final RequestHistoryController requestHistoryController = Get.find();

  List<Widget> _requestHistoryTiles() {
    List<Widget> _result = [];
    if (requestHistoryController.status.value !=
        RequestHistoryLoadStatus.loaded) {
      _result.add(
        const Center(
          child: CircularProgressIndicator(
            color: AppColor.cBlack,
            strokeWidth: 5,
          ),
        ),
      );
    } else {
      for (Rx<DummyRequestModel> data
          in requestHistoryController.requestHistoryList) {
        _result.add(
          Obx(
            () => HistoryTileItem(
              title: "Permohonan darah",
              statusText: '', //TUNGGU BACKEND
              dateText: '', //TUNGGU BACKEND
              color: AppColor.cRed, //TUNGGU BACKEND
              callback: () {
                Get.toNamed(Routes.donorDetail);
                requestHistoryController.setSelected(data.value);
              },
            ),
          ),
        );
      }
    }

    return _result;
  }

  List<Widget> _donorHistoryTiles() {
    List<Widget> _result = [];
    if (donorHistoryController.status.value != DonorHistoryLoadStatus.loaded) {
      _result.add(
        const Center(
          child: CircularProgressIndicator(
            color: AppColor.cBlack,
            strokeWidth: 5,
          ),
        ),
      );
    } else {
      for (Rx<DonorHistoryModel> data
          in donorHistoryController.donorHistoryList) {
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
                  ? _donorHistoryTiles()
                  : _requestHistoryTiles(),
        ),
      ),
    );
  }
}
