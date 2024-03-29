import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/theme.dart';
import '../../get_x/controller/onboarding_controller.dart';

Widget onBoardingSlide(OnBoardingController cOnBoarding) {
  return PageView.builder(
    controller: cOnBoarding.pageController,
    onPageChanged: (index) => cOnBoarding.changeCurrentScreen(index),
    itemCount: cOnBoarding.onBoardingModelList.length,
    itemBuilder: (context, index) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            cOnBoarding.onBoardingModelList[index].image,
            height: 212.0,
            width: 305.0,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              cOnBoarding.onBoardingModelList[index].title,
              style: AppText.textSemiLarge.copyWith(
                fontWeight: AppText.bold,
                color: AppColor.cBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              cOnBoarding.onBoardingModelList[index].desc,
              style: AppText.textMedium.copyWith(
                fontSize: 14.0,
                fontWeight: AppText.semiBold,
                color: AppColor.cBlack,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    },
  );
}

Widget circleSlide(OnBoardingController cOnBoarding) {
  return Container(
    alignment: Alignment.bottomCenter,
    margin: const EdgeInsets.only(bottom: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        cOnBoarding.onBoardingModelList.length,
        (index) {
          return Obx(
            () => Container(
              margin: const EdgeInsets.all(8.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: cOnBoarding.currentScreen.value == index
                    ? AppColor.cRed
                    : AppColor.cGrey,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget skipOnboarding(OnBoardingController cOnBoarding) {
  return Positioned(
    top: 40.0,
    right: 30.0,
    child: GestureDetector(
      onTap: cOnBoarding.lastPage,
      child: Obx(
        () => Text(
          cOnBoarding.currentScreen.value ==
                  cOnBoarding.onBoardingModelList.length - 1
              ? "Selesai"
              : "Lewati",
          style: AppText.textMedium.copyWith(
            color: AppColor.cBlack,
            fontSize: 14.0,
            fontWeight: AppText.semiBold,
          ),
        ),
      ),
    ),
  );
}
