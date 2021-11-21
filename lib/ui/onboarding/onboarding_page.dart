import 'package:flutter/cupertino.dart';
import 'onboarding_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../get_x/controller/onboarding_controller.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({Key? key}) : super(key: key);

  final OnBoardingController cOnBoarding = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            onBoardingSlide(cOnBoarding),
            circleSlide(cOnBoarding),
            skipOnboarding(cOnBoarding),
          ],
        ),
      ),
    );
  }
}
