import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import '../../../shared/theme.dart';

class DonorLocation extends StatelessWidget {
  const DonorLocation({
    Key? key,
    this.isLoading = false,
    required this.latLong,
    required this.locationName,
    required this.locationAddress,
    required this.title,
  }) : super(key: key);

  final bool isLoading;
  final String title;
  final LatLng latLong;
  final String locationName;
  final String locationAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
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
                  child: (!isLoading)
                      ? FlutterMap(
                          options: MapOptions(
                            center: latLong,
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
                                  point: latLong,
                                  builder: (ctx) => Image.asset(
                                      'assets/bitmap/maps_placeholder.png'),
                                ),
                              ],
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.cBlack,
                            strokeWidth: 5,
                          ),
                        ),
                ),
                const SizedBox(height: 15),
                Text(
                  locationName,
                  style: AppText.textMedium.copyWith(
                    color: AppColor.imperialRed,
                    fontWeight: AppText.bold,
                  ),
                ),
                Text(
                  locationAddress,
                  style: AppText.textNormal.copyWith(
                    color: AppColor.eerieBlack,
                    fontWeight: AppText.normal,
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
