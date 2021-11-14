import 'package:flutter/material.dart';
import 'package:flutter_donor/models/dummy_event_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/ui/event/event_card_large_widget.dart';
import 'package:flutter_donor/ui/event/event_card_medium_widget.dart';
import '../../shared/theme.dart';
import 'package:get/get.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Event",
          style: AppText.textSemiLarge
              .copyWith(color: AppColor.white, fontWeight: AppText.semiBold),
        ),
        backgroundColor: AppColor.cRed,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 21.0),
            child: Text(
              "Terbaru",
              style: AppText.textSemiLarge.copyWith(
                color: AppColor.cDarkBlue,
                fontWeight: AppText.bold,
              ),
            ),
          ),
          const EventCardWidgetLarge(),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 6.0),
            child: Text(
              "Event lain",
              style: AppText.textSemiLarge.copyWith(
                color: AppColor.cDarkBlue,
                fontWeight: AppText.bold,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: 10,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => Get.toNamed(Routes.event +
                  "/$i?nameHeading=Telah Dibuka Donor Plasma Covid di Wilayah Simbabwe&published=PMI&time=23-10-2021"),
              child: EventCardMedium(
                eventDetail: EventDetailModel(name: "Diky", desc: "Contoh"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
