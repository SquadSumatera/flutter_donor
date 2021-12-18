import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryDetailOverlayController extends GetxController {
  OverlayEntry? entry;

  void addOverlay(OverlayEntry entry) {
    this.entry = entry;
    update();
  }

  void removeOverlay() {
    entry?.remove();
    update();
  }
}