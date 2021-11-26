import 'package:flutter_donor/services/location_service.dart';
import 'package:get/get.dart';
import 'package:latlng/latlng.dart';

enum LocationStatus {
  loading,
  loaded,
  failed,
}

class LocationController extends GetxController {
  late final LatLng latLng;
  late final String? address;

  Rx<LocationStatus> status = LocationStatus.loading.obs;

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }

  void getLocation() async {
    status.value = LocationStatus.loading;
    update();
    try {
      latLng = await LocationService.getCurrentLocation();
      status.value = LocationStatus.loaded;
    } catch (e) {
      status.value = LocationStatus.failed;
    }
    update();
  }

  void getAddress() async {
    status.value = LocationStatus.loading;
    update();
    try {
      address = await LocationService.getAddressFromLatLng();
      status.value = LocationStatus.loaded;
    } catch (e) {
      status.value = LocationStatus.failed;
    }
    update();
  }
}
