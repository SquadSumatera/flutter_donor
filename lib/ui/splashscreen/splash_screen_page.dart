import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  
  @override
  void initState() {
    checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SvgPicture.asset(
              'assets/vector/ic_title.svg',
              width: 150,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'powered by',
                style: AppText.textMedium.copyWith(color: AppColor.cBlack),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 7),
                child: Image.asset(
                  'assets/bitmap/logo.png',
                  width: 30,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  startSplashScreen() {
    final LoginGetX tokenCheck = Get.put(LoginGetX());
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      tokenCheck.onBoard.value
          ? Get.offAllNamed(Routes.onBoarding)
          : tokenCheck.token.value.isEmpty
              ? Get.offNamed(Routes.login)
              : Get.offNamed(Routes.main);
    });
  }

  checkPermission() async {
    var locationStatus = await Permission.location.status.isGranted;
    var locationAlwaysStatus = await Permission.locationAlways.status.isGranted;
    var locationWhenInUseStatus =
        await Permission.locationWhenInUse.status.isGranted;
    if (!locationStatus) await Permission.location.request();
    if (!locationAlwaysStatus) await Permission.locationAlways.request();
    if (!locationWhenInUseStatus) await Permission.locationWhenInUse.request();

    if (locationStatus && locationAlwaysStatus && locationWhenInUseStatus) {
      startSplashScreen();
    } else {
      checkPermission();
    }
  }
}
