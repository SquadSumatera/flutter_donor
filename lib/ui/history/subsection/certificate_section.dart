import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/history/subsection/donor_certificate_view.dart';
import 'package:screenshot/screenshot.dart';

class CertificateSection extends StatefulWidget {
  CertificateSection({Key? key}) : super(key: key);

  @override
  _CertificateSectionState createState() => _CertificateSectionState();
}

class _CertificateSectionState extends State<CertificateSection> {

  Future<MemoryImage> _showCertificate() async {
    ScreenshotController screenshotController = ScreenshotController();
    return screenshotController
        .captureFromWidget(const DonorCertificateView())
        .then((value) {
      return MemoryImage(value);
    });
  }

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
                FutureBuilder<MemoryImage>(
                    future: _showCertificate(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: snapshot.data as ImageProvider,
                              fit: BoxFit.cover,
                            ),
                            boxShadow: AppShadow.medium,
                          ),
                          height: 200,
                          width: double.infinity,
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.cBlack,
                            strokeWidth: 2,
                          ),
                        );
                      }
                    }),
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
                      onPressed: () => _showCertificate(),
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
