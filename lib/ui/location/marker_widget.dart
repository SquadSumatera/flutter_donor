import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/constant.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MarkerWidget extends StatelessWidget {
  const MarkerWidget({Key? key}) : super(key: key);

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
              builder: (ctx) => Container(
                child: Image.asset('assets/bitmap/maps_placeholder.png'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
