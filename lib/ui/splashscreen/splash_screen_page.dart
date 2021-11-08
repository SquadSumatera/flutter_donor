
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() => startSplashScreen();

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
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Get.offNamed(Routes.login);
    });
  }
}
