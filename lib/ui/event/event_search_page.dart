import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_search_controller.dart';
import 'package:flutter_donor/models/dummy_event_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/ui/event/event_search_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_donor/shared/theme.dart';

import 'event_page_widget.dart';

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
      body: LayoutBuilder(
        builder: (context, constraint) => Obx(
          () => ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 14.0,
                ),
                child: searchField(),
              ),
              searchController.statusSearchEvent.value == StatusSearch.failed
                  ? SizedBox(
                      height: constraint.maxHeight,
                      child: const Center(
                        child: Text("Data Tidak Ditemukan"),
                      ),
                    )
                  : searchController.statusSearchEvent.value ==
                          StatusSearch.loading
                      ? SizedBox(
                          height: constraint.maxHeight,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : searchController.eventSearchModel.value.data == null
                          ? SizedBox(
                              height: constraint.maxHeight,
                              child: const Center(
                                child: Text("Data Tidak Ditemukann"),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: searchController
                                  .eventSearchModel.value.data!.length,
                              itemBuilder: (context, i) => GestureDetector(
                                onTap: () => Get.toNamed(
                                    Routes.event +
                                        "/${i + 1}?nameHeading=${searchController.eventSearchModel.value.data![i].titleDonorEvents}&published=${searchController.eventSearchModel.value.data![i].nameInstitutions}&time=${searchController.eventSearchModel.value.data![i].created}&start=${searchController.eventSearchModel.value.data![i].start}&end=${searchController.eventSearchModel.value.data![i].end}&desc=${searchController.eventSearchModel.value.data![i].descDonorEvents}&address=${searchController.eventSearchModel.value.data![i].addressDonorEvents}&image=${(i).toString()}&contact=${searchController.eventSearchModel.value.data![i].contactInstitutions}&email=${searchController.eventSearchModel.value.data![i].emailInstitutions}&idDonor=${searchController.eventSearchModel.value.data![i].idDonorEvents}&idInstitution=${searchController.eventSearchModel.value.data![i].idInstitutions}",
                                    arguments: [true]),
                                child: eventCardMedium(
                                  EventDetailModel(
                                    idDonor: searchController.eventSearchModel
                                        .value.data![i].idDonorEvents!,
                                    title: searchController.eventSearchModel
                                        .value.data![i].titleDonorEvents!,
                                    institutions: searchController
                                        .eventSearchModel
                                        .value
                                        .data![i]
                                        .nameInstitutions!,
                                    time: searchController.eventSearchModel
                                        .value.data![i].created,
                                    image: searchController.image[i],
                                  ),
                                ),
                              ),
                            )
            ],
          ),
        ),
      ),
    );
  }
}
