import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_list_controller.dart';
import 'package:flutter_donor/get_x/controller/event_search_controller.dart';
import '../../models/dummy_event_model.dart';
import '../../routes/app_pages.dart';
import 'event_page_widget.dart';
import '../../shared/theme.dart';
import 'package:get/get.dart';

class EventPage extends StatelessWidget {
  EventPage({Key? key}) : super(key: key);
  final EventListController listEvent = Get.find<EventListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Event",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.bold,
          ),
        ),
        backgroundColor: AppColor.cRed,
      ),
      body: Obx(
        () => listEvent.status.value == ListEventStatus.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.cBlack,
                  strokeWidth: 5,
                ),
              )
            : listEvent.status.value == ListEventStatus.failed
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            "Terjadi Kesalahan, coba beberapa saat kembali."),
                        TextButton(
                          onPressed: () {
                            listEvent.onInit();
                          },
                          child: const Text("Coba Lagi"),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                            Routes.eventSearch,
                          );
                        },
                        child: search(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 14.0),
                        child: Text(
                          "Terbaru",
                          style: AppText.textSemiLarge.copyWith(
                            color: AppColor.cDarkBlue,
                            fontWeight: AppText.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(
                              Routes.event +
                                  "/0?nameHeading=${listEvent.listData[0].value.titleDonorEvents}&published=${listEvent.listData[0].value.nameInstitutions}&time=${listEvent.listData[0].value.created}&start=${listEvent.listData[0].value.start}&end=${listEvent.listData[0].value.end}&desc=${listEvent.listData[0].value.descDonorEvents}&address=${listEvent.listData[0].value.addressDonorEvents}&image=${0.toString()}&contact=${listEvent.listData[0].value.contactConstitutions}&email=${listEvent.listData[0].value.emailConstitutions}&idDonor=${listEvent.listData[0].value.idDonorEvents}&idInstitution=${listEvent.listData[0].value.idInstitutions}&idDonorEvents=${listEvent.listData[0].value.idDonorEvents}&schedule=${listEvent.listData[0].value.schedule}",
                              arguments: [false]);
                        },
                        child: eventCardLarge(
                          listEvent.listData[0].value.imageDecode!,
                          listEvent.listData[0].value.titleDonorEvents!,
                          listEvent.listData[0].value.nameInstitutions!,
                          listEvent.listData[0].value.created,
                          listEvent.listData[0].value.idDonorEvents!,
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 24.0, bottom: 18.0),
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
                        itemCount: listEvent.listData.length - 1,
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () => Get.toNamed(
                              Routes.event +
                                  "/${i + 1}?nameHeading=${listEvent.listData[i + 1].value.titleDonorEvents}&published=${listEvent.listData[i + 1].value.nameInstitutions}&time=${listEvent.listData[i + 1].value.created}&start=${listEvent.listData[i + 1].value.start}&end=${listEvent.listData[i + 1].value.end}&desc=${listEvent.listData[i + 1].value.descDonorEvents}&address=${listEvent.listData[i + 1].value.addressDonorEvents}&image=${(i + 1).toString()}&contact=${listEvent.listData[i + 1].value.contactConstitutions}&email=${listEvent.listData[i + 1].value.emailConstitutions}&idDonor=${listEvent.listData[i + 1].value.idDonorEvents}&idInstitution=${listEvent.listData[i + 1].value.idInstitutions}&idDonorEvents=${listEvent.listData[i + 1].value.idDonorEvents}&schedule=${listEvent.listData[i + 1].value.schedule}",
                              arguments: [false]),
                          child: eventCardMedium(
                            listEvent.listData[i + 1].value.imageDecode!,
                            listEvent.listData[i + 1].value.titleDonorEvents!,
                            listEvent.listData[i + 1].value.nameInstitutions!,
                            listEvent.listData[i + 1].value.created,
                            listEvent.listData[i + 1].value.idDonorEvents!,
                          ),
                        ),
                      )
                    ],
                  ),
      ),
    );
  }
}
