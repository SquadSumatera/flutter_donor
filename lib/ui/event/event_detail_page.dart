import 'package:flutter/cupertino.dart';
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
          schedule("23/10/2021", "28/10/2021", "08.00 - 15.00"),
          descLong(
            "Deskripsi",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas dignissim nisl vitae placerat. Sed et finibus nunc. Curabitur tempus lobortis nisi, ac maximus neque iaculis vel. Praesent sed quam ac ipsum vulputate congue. Mauris eleifend fer mentum nibh, nec convallis leo pretium pharetra. Donec id mi quis massa viverra accumsan sed id purus. Nullam sodales malesuada enim, eu dapibus erat vulputate sit amet. Quisque commodo porta lectus vulputate maximus.",
          ),
          descLong(
            "Alamat",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce egestas dignissim nisl vitae",
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(
                left: 37.0, right: 37.0, top: 20.0, bottom: 18.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minimumSize: Size(
                  MediaQuery.of(context).size.width,
                  37,
                ),
                primary: AppColor.cRed,
              ),
              child: Text(
                "Daftar",
                style: AppText.textMedium.copyWith(
                  color: AppColor.white,
                  fontWeight: AppText.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
