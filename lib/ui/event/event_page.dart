import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_list_controller.dart';
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
                      Padding(
                        padding: const EdgeInsets.only(left: 24.0, top: 24.0),
                        child: Text(
                          "Terbaru",
                          style: AppText.textSemiLarge.copyWith(
                            color: AppColor.cDarkBlue,
                            fontWeight: AppText.bold,
                          ),
                        ),
                      ),
                      eventCardLarge(listEvent.image[0]),
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
                        itemCount: listEvent.listData.length,
                        itemBuilder: (context, i) => GestureDetector(
                          onTap: () => Get.toNamed(Routes.event +
                              "/$i?nameHeading=${listEvent.listData[i].value.titleDonorEvents}&published=${listEvent.listData[i].value.nameInstitutions}&time=${listEvent.listData[i].value.created}&start=${listEvent.listData[i].value.start}&end=${listEvent.listData[i].value.end}&desc=${listEvent.listData[i].value.descDonorEvents}&address=${listEvent.listData[i].value.addressDonorEvents}&image=${i.toString()}"),
                          child: eventCardMedium(
                            EventDetailModel(
                              title:
                                  listEvent.listData[i].value.titleDonorEvents!,
                              desc:
                                  listEvent.listData[i].value.descDonorEvents!,
                              image: listEvent.image[i],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
      ),
    );
  }
}
