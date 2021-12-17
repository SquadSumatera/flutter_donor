import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_search_controller.dart';
import 'package:flutter_donor/ui/event/event_search_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_donor/shared/theme.dart';

class EventSearchPage extends StatelessWidget {
  final EventSearchController searchController = Get.put(
    EventSearchController(),
  );

  EventSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        title: Text(
          "Event",
          style: AppText.textMedium.copyWith(
            fontWeight: AppText.bold,
            color: AppColor.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15.0,
          ),
          onPressed: () {
            Get.back();
          },
          color: AppColor.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 14.0,
            ),
            child: searchField(searchController),
          ),
        ],
      ),
    );
  }
}
