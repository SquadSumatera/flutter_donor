import 'package:get/get.dart';

enum HistoryViewAs {
  donator,
  requester,
}

class HistoryController extends GetxController {
  Rx<HistoryViewAs> currentView = HistoryViewAs.donator.obs;

  void change(HistoryViewAs view) {
    currentView.value = view;
    update();
  }
}