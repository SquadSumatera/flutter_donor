import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../../get_x/controller/donor_history_controller.dart';
import '../../../shared/theme.dart';

class DonorLocation extends StatelessWidget {
  DonorLocation({Key? key}) : super(key: key);

  final DonorHistoryController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lokasi",
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppShadow.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: const BoxConstraints(maxHeight: 210),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppShadow.small,
                  ),
                  child: FlutterMap(
                    options: MapOptions(
                      center: controller.selected?.value.locationLatLong,
                      zoom: 13.0,
                    ),
                    layers: [
                      TileLayerOptions(
                        urlTemplate: AppMaps.urlTemplate,
                        additionalOptions: {
                          'accessToken': AppMaps.accessToken,
                          'id': AppMaps.id
                        },
                      ),
                      MarkerLayerOptions(
                        markers: [
                          Marker(
                            width: 80.0,
                            height: 80.0,
                            point: controller.selected?.value.locationLatLong ??
                                LatLng(0, 0),
                            builder: (ctx) => Image.asset(
                                'assets/bitmap/maps_placeholder.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  controller.selected?.value.locationAddress ?? "-",
                  style: AppText.textMedium.copyWith(
                    color: AppColor.imperialRed,
                    fontWeight: AppText.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
