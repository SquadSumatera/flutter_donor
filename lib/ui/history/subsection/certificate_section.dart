import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/history/subsection/donor_certificate_view.dart';
import 'package:flutter_donor/ui/history/subsection/donor_location.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class CertificateSection extends StatefulWidget {
  const CertificateSection({Key? key}) : super(key: key);

  @override
  _CertificateSectionState createState() => _CertificateSectionState();
}

class _CertificateSectionState extends State<CertificateSection> {
  ScreenshotController screenshotController = ScreenshotController();
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
                Container(
                  height: 214.5,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: AppShadow.small,
                  ),
                  child: Screenshot(
                    controller: screenshotController,
                    child: const DonorCertificateView(),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Unduh Sertifikat",
                        style: AppText.textSmall.copyWith(
                          color: AppColor.cBlack,
                          fontWeight: AppText.semiBold,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        screenshotController
                            .capture(
                          pixelRatio: 3.5,
                        )
                            .then((image) {
                          ImageGallerySaver.saveImage(
                            image!,
                            quality: 100,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Sertifikat berhasil disimpan!"),
                            ),
                          );
                        });
                      },
                      icon: const Icon(
                        Icons.file_download,
                        size: 20,
                      ),
                      color: AppColor.bloodRed,
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
