import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class SubmissionRequirementSection extends StatelessWidget {
  const SubmissionRequirementSection({
    Key? key,
    required this.title,
    required this.bloodType,
    required this.rhesusType,
    required this.quantity,
    this.dateScheduled,
  }) : super(key: key);

  final String title;
  final String bloodType;
  final String rhesusType;
  final int quantity;
  final String? dateScheduled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 12,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
              boxShadow: AppShadow.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Golongan Darah $bloodType',
                          style: AppText.textSmall.copyWith(
                            fontWeight: AppText.bold,
                            color: AppColor.eerieBlack,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Rhesus $rhesusType',
                          style: AppText.textExtraSmall.copyWith(
                            color: AppColor.eerieBlack,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$quantity Kantong',
                      style: AppText.textNormal.copyWith(
                        fontWeight: AppText.bold,
                        color: AppColor.imperialRed,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                if (dateScheduled != null && dateScheduled != '--/--/----')
                  Text(
                    'Penerimaan telah dijadwalkan pada tanggal $dateScheduled',
                    style: AppText.textSmall.copyWith(
                      color: AppColor.cGreen,
                      fontWeight: AppText.semiBold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
