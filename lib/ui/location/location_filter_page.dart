import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/institutions_filter_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';
import 'location_list_widget.dart';

class LocationFilterPage extends StatelessWidget {
  LocationFilterPage({Key? key}) : super(key: key);

  final InstitutionsFilterController institutionsFilterController =
      Get.put(InstitutionsFilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        title: Text(
          "Filter",
          style: AppText.textMedium.copyWith(
            color: AppColor.white,
            fontWeight: AppText.bold,
          ),
        ),
      ),
      body: Obx(
        () => institutionsFilterController.status.value ==
                StatusFilterData.loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : institutionsFilterController.status.value ==
                    StatusFilterData.failed
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Data Tidak Ditemukan"),
                        TextButton(
                          onPressed: () {
                            institutionsFilterController.onInit();
                          },
                          child: const Text("Muat Ulang"),
                        )
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount:
                        institutionsFilterController.institutionsFilter.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LocationListWidget(
                        index: index,
                        data: institutionsFilterController
                            .institutionsFilter[index]!,
                      );
                    },
                  ),
      ),
    );
  }
}
