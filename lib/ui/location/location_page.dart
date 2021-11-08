import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  void initState() => startSplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/maps_location.json'),
            Center(
                child: Text(
              'Mencari lokasi PMI terdekat',
              style: AppText.textMedium
                  .copyWith(color: Colors.red, fontWeight: AppText.semiBold),
            )),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }

  startSplashScreen() {
    var duration = const Duration(seconds: 5);
    return Timer(duration, () {
      Get.offNamed(Routes.showMaps);
    });
  }
}
