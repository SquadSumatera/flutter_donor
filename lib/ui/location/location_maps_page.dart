import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/institutions_controller.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/location/location_maps_marker_widget.dart';
import 'package:get/get.dart';

import 'location_list_widget.dart';

class LocationMapsPage extends StatefulWidget {
  const LocationMapsPage({Key? key}) : super(key: key);

  @override
  State<LocationMapsPage> createState() => _LocationMapsPageState();
}

class _LocationMapsPageState extends State<LocationMapsPage> {
  InstitutionsController institutionsController = Get.find();

  @override
  void initState() {
    institutionsController.getInitInstitution();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lokasi",
          style: AppText.textSemiLarge
              .copyWith(color: AppColor.white, fontWeight: AppText.semiBold),
        ),
        backgroundColor: AppColor.cRed,
      ),
      body: Stack(
        children: [
          LocationMapsMarkerWidget(
            data: institutionsController.filterInstitutions,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            builder: (_, scrollController) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Obx(
                    () => ListView(
                      controller: scrollController,
                      reverse: institutionsController.dontChange.value,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              prefixIcon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.location_on,
                                  size: 24,
                                  color: Colors.grey,
                                ),
                              ),
                              fillColor: const Color(0xFFE4E8F8),
                              hintText: "Search Lokasi",
                              contentPadding:
                                  const EdgeInsets.only(bottom: 20, left: 20),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: AppColor.cGrey),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onChanged: (text) {
                              institutionsController.query.value = text;
                              institutionsController.searchInstitution();
                              setState(() {});
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount:
                              institutionsController.filterInstitutions.length,
                          itemBuilder: (BuildContext context, int index) {
                            return LocationListWidget(
                                index: index,
                                data: institutionsController
                                    .filterInstitutions[index]!);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                alignment: Alignment.topCenter,
                primary: AppColor.white,
                shadowColor: AppColor.cGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text(
                      "Filter",
                      textAlign: TextAlign.center,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    titleTextStyle: AppText.textMedium.copyWith(
                      fontWeight: AppText.bold,
                      color: AppColor.richBlack,
                    ),
                    content: Obx(
                      () => SizedBox(
                        width: institutionsController.dontChange.value
                            ? null
                            : MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Tipe Darah",
                                  style: AppText.textNormal.copyWith(
                                    color: AppColor.richBlack,
                                    fontWeight: AppText.normal,
                                  ),
                                ),
                                DropdownButton(
                                  value: institutionsController.ddBlood.value,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  elevation: 16,
                                  style: AppText.textNormal.copyWith(
                                    color: AppColor.cRed,
                                    fontWeight: AppText.semiBold,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: AppColor.cRed,
                                  ),
                                  items: <String>['A', 'B', 'AB', 'O']
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String? value) {
                                    institutionsController.cDdBlood(value);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Tipe Resus",
                                  style: AppText.textNormal.copyWith(
                                    color: AppColor.richBlack,
                                    fontWeight: AppText.normal,
                                  ),
                                ),
                                DropdownButton(
                                  value: institutionsController.ddRhesus.value,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  elevation: 16,
                                  style: AppText.textNormal.copyWith(
                                    color: AppColor.cRed,
                                    fontWeight: AppText.semiBold,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: AppColor.cRed,
                                  ),
                                  items: <String>['positive', 'negative']
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String? value) {
                                    institutionsController.cDdRhesus(value);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Stok Darah",
                                  style: AppText.textNormal.copyWith(
                                    color: AppColor.richBlack,
                                    fontWeight: AppText.normal,
                                  ),
                                ),
                                DropdownButton(
                                  value: institutionsController.ddStock.value,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  elevation: 16,
                                  style: AppText.textNormal.copyWith(
                                    color: AppColor.cRed,
                                    fontWeight: AppText.semiBold,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: AppColor.cRed,
                                  ),
                                  items: <String>["1", "2", "3", "4", "5"]
                                      .map<DropdownMenuItem<String>>(
                                    (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    },
                                  ).toList(),
                                  onChanged: (String? value) {
                                    institutionsController.cDdStock(value);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(6.0),
                    actionsAlignment: MainAxisAlignment.center,
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Get.back();
                          Get.toNamed(Routes.filterInstitutions);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.cRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Text(
                          "Cari",
                          style: AppText.textNormal.copyWith(
                            color: AppColor.white,
                            fontWeight: AppText.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              child: Text(
                "Filter",
                style: AppText.textMedium.copyWith(
                  color: AppColor.cBlack,
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
