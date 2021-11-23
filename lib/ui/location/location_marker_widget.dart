import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'location_dialog_widget.dart';

class LocationMarkerWidget extends StatelessWidget {
  const LocationMarkerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(51.5, -0.09),
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
              point: LatLng(51.5, -0.09),
              builder: (ctx) => GestureDetector(
                child: Image.asset(
                  'assets/bitmap/maps_placeholder.png',
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const LocationDialogWidget(
                        name: "Kantor PMI Kota Kediri",
                        bloodA: 1,
                        bloodB: 2,
                        bloodAB: 2,
                        bloodO: 5),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
