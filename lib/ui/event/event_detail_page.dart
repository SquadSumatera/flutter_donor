import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/event/event_detail_widget.dart';
import 'package:get/get.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        title: Text(
          "Telah Dibuka...",
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
      body: ListView(
        children: [
          headerEventDetail(context),
          Container(
            margin: const EdgeInsets.only(right: 18, left: 18, top: 16),
            child: headingTextDetail(
              "${Get.parameters['nameHeading']}",
              "${Get.parameters['published']}",
              "${Get.parameters['time']}",
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 18, left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jadwal Donor",
                  style: AppText.textMedium.copyWith(
                    fontWeight: AppText.semiBold,
                    color: AppColor.cDarkBlue,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                elementOfJadwal(
                  "Tanggal Mulai",
                  "25/10/2021",
                  Icons.date_range_rounded,
                  AppColor.cGreen,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                elementOfJadwal(
                  "Tanggal Berakhir",
                  "28/10/2021",
                  Icons.date_range_rounded,
                  AppColor.cRed,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                elementOfJadwal(
                  "Waktu Pelaksanaan",
                  "09.00 - 15.00",
                  Icons.access_time_filled_rounded,
                  AppColor.cBlue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
