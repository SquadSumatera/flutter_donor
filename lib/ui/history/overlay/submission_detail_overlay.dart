import 'package:flutter/material.dart';
import '../../../get_x/controller/submission_history_controller.dart';
import '../../../get_x/controller/history_detail_overlay_controller.dart';
import 'package:get/get.dart';

OverlayEntry submissionDetailOverlaySection({
  Widget? child,
}) {
  HistoryDetailOverlayController c = Get.find();
  SubmissionHistoryController h = Get.find();

  OverlayEntry? entry;
  entry = OverlayEntry(
    builder: (context) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (h.status.value != SubmissionHistoryLoadStatus.loading &&
                    h.selectedStatus.value !=
                        SubmissionHistorySelectedStatus.loading) {
                  c.entry!.remove();
                  h.status.value = SubmissionHistoryLoadStatus.loaded;
                  h.selectedStatus.value =
                      SubmissionHistorySelectedStatus.loaded;
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
