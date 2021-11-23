import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class ScheduleDetailSection extends StatelessWidget {
  const ScheduleDetailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Penjadwalan",
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.white,
              boxShadow: AppShadow.medium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "03 November 2021",
                      style: AppText.textNormal.copyWith(
                        fontWeight: AppText.bold,
                        color: AppColor.cBlack,
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: AppColor.cGrey,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.edit,
                            size: 9,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Ubah Jadwal",
                            style: AppText.textSmall.copyWith(
                              fontWeight: AppText.bold,
                              color: AppColor.cBlack,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Rumah Sakit Nightingale",
                      style: AppText.textNormal.copyWith(
                        fontWeight: AppText.bold,
                        color: AppColor.imperialRed,
                      ),
                    ),
                    const SizedBox(height: 2),
                    TextButton(
                      style: TextButton.styleFrom(
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        primary: AppColor.cGrey,
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Icon(
                            Icons.delete_forever,
                            size: 12,
                            color: AppColor.imperialRed,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "Batalkan Donor",
                            style: AppText.textSmall.copyWith(
                              fontWeight: AppText.bold,
                              decoration: TextDecoration.underline,
                              color: AppColor.imperialRed,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
