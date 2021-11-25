import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../../get_x/controller/donor_detail_overlay_controller.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import 'package:get/get.dart';

OverlayEntry detailOverlaySection({
  Widget? child,
}) {
  DonorDetailOverlayController c = Get.find();
  DonorHistoryController h = Get.find();

  OverlayEntry? entry;
  entry = OverlayEntry(
    builder: (context) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (h.status.value != DonorHistoryLoadStatus.loading &&
                    h.selectedStatus.value !=
                        DonorHistorySelectedStatus.loading) {
                  c.entry!.remove();
                  h.status.value = DonorHistoryLoadStatus.loaded;
                  h.selectedStatus.value = DonorHistorySelectedStatus.loaded;
                }
              },
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.9,
              maxHeight: Get.height * 0.75,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior: Clip.hardEdge,
            child: Material(
              color: Colors.transparent,
              child: child,
            ),
          ),
        ],
      );
    },
  );
  c.addOverlay(entry);
  return entry;
}
