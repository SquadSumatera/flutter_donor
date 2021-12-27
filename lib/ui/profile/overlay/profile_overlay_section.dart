import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import '../../../get_x/controller/profile_overlay_controller.dart';
import 'package:get/get.dart';

OverlayEntry profileOverlaySection({
  Widget? child,
}) {
  ProfileOverlayController c = Get.put(ProfileOverlayController());
  ProfileController p = Get.find();

  OverlayEntry? entry;
  entry = OverlayEntry(
    builder: (context) {
      return Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                if (p.status.value != ProfileLoadStatus.loading &&
                    p.status.value != ProfileLoadStatus.updateLoading) {
                  c.entry!.remove();
                  p.status.value = ProfileLoadStatus.loaded;
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
