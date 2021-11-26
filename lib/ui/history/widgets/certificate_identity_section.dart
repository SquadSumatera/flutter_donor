import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class CertificateIdentitySection extends StatelessWidget {
  const CertificateIdentitySection({
    Key? key,
    required this.donorName,
    required this.donorId,
    required this.donorGender,
    required this.donorBloodTypeAndRhesus,
  }) : super(key: key);

  final String donorName;
  final String donorId;
  final String donorGender;
  final String donorBloodTypeAndRhesus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(2),
        boxShadow: AppShadow.medium,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 250,
              ),
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
                    donorName,
                    softWrap: true,
                    style: AppText.textCustom.copyWith(
                      color: AppColor.white,
                      fontSize: 5.59,
                      fontWeight: AppText.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "ID: $donorId",
                    style: AppText.textCustom.copyWith(
                      color: AppColor.white,
                      fontSize: 3.91,
                      fontWeight: AppText.semiBold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Jenis Kelamin / ",
                      style: AppText.textCustom.copyWith(
                        color: AppColor.white,
                        fontSize: 3.91,
                        fontWeight: AppText.semiBold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Gender',
                          style: AppText.textCustom.copyWith(
                            color: AppColor.white,
                            fontSize: 3.91,
                            fontWeight: AppText.semiBold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        TextSpan(
                          text: ': $donorGender',
                          style: AppText.textCustom.copyWith(
                            color: AppColor.white,
                            fontSize: 3.91,
                            fontWeight: AppText.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 2,
              horizontal: 7,
            ),
            decoration: const BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(2),
                bottomRight: Radius.circular(2),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Golongan Darah",
                  style: AppText.textCustom.copyWith(
                    color: AppColor.carnelian,
                    fontWeight: AppText.bold,
                    fontSize: 3.35,
                  ),
                ),
                Text(
                  donorBloodTypeAndRhesus,
                  style: AppText.textCustom.copyWith(
                    color: AppColor.carnelian,
                    fontWeight: AppText.bold,
                    fontSize: 13.41,
                  ),
                ),
                Text(
                  "Blood Type",
                  style: AppText.textCustom.copyWith(
                    color: AppColor.carnelian,
                    fontWeight: AppText.semiBold,
                    fontSize: 3.35,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
