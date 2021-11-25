import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonorCertificateView extends StatelessWidget {
  const DonorCertificateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cultured,
      child: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/vector/sertif-bg.svg',
              semanticsLabel: 'Certificate',
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 23),
                _buildCertificateText(
                  titleText: 'Surat Keterangan Donor Darah',
                  titleTextSize: 8.94,
                  subTitleText: 'Certificate of Blood Donation',
                  subTitleTextSize: 6.09,
                  subTitleTextSpacing: 2,
                ),
                const SizedBox(height: 15),
                _buildCertificateText(
                  titleText: 'Sertifikat ini diberikan kepada',
                  titleTextSize: 5.59,
                  subTitleText: 'This is to certify that',
                  subTitleTextSize: 4.47,
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(2),
                            bottomLeft: Radius.circular(2),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFA4161A),
                              const Color(0xFFDC2626).withOpacity(0.65),
                            ],
                          ),
                        ),
                        padding: const EdgeInsets.all(6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Awanama Anonkusuma",
                              style: AppText.textCustom.copyWith(
                                color: AppColor.white,
                                fontSize: 5.59,
                                fontWeight: AppText.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildCertificateText(
      {String titleText = '',
      String subTitleText = '',
      double titleTextSize = 0,
      double subTitleTextSize = 0,
      double subTitleTextSpacing = 0}) {
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
