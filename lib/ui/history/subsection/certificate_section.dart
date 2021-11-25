import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class CertificateSection extends StatefulWidget {
  CertificateSection({Key? key}) : super(key: key);

  @override
  _CertificateSectionState createState() => _CertificateSectionState();
}

class _CertificateSectionState extends State<CertificateSection> {
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sertifikat",
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppShadow.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image with border radius
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1636866301836-a3d45224f671?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYzNzgyNTM2Ng&ixlib=rb-1.2.1&q=80&w=1080"),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: AppShadow.medium,
                  ),
                  height: 200,
                  width: double.infinity,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Unduh Sertifikat",
                      style: AppText.textSmall.copyWith(
                        color: AppColor.cBlack,
                        fontWeight: AppText.semiBold,
                      ),
                    ),
                    const Icon(
                      Icons.file_download,
                      color: AppColor.bloodRed,
                      size: 20,
                    ),
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
