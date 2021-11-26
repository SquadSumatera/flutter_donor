import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class CertificateLineText extends StatelessWidget {
  const CertificateLineText({
    Key? key,
    this.titleText = '',
    this.subTitleText = '',
    this.titleTextSize = 0,
    this.subTitleTextSize = 0,
    this.subTitleTextSpacing = 0,
  }) : super(key: key);

  final String titleText;
  final String subTitleText;
  final double titleTextSize;
  final double subTitleTextSize;
  final double subTitleTextSpacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 5.0,
            right: 5.0,
            bottom: 1.5,
          ),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColor.imperialRed,
                width: 0.5,
              ),
            ),
          ),
          child: Text(
            titleText,
            style: AppText.textCustom.copyWith(
              fontSize: titleTextSize,
              color: AppColor.bloodRed,
              fontWeight: AppText.semiBold,
            ),
          ),
        ),
        Text(
          subTitleText,
          style: AppText.textCustom.copyWith(
            letterSpacing: subTitleTextSpacing,
            color: AppColor.bloodRed,
            fontSize: subTitleTextSize,
            fontWeight: AppText.semiBold,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
