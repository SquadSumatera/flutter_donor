import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/history/widgets/certificate_identity_section.dart';
import 'package:flutter_donor/ui/history/widgets/certificate_line_text.dart';
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
                const CertificateLineText(
                  titleText: 'Surat Keterangan Donor Darah',
                  titleTextSize: 8.94,
                  subTitleText: 'Certificate of Blood Donation',
                  subTitleTextSize: 6.09,
                  subTitleTextSpacing: 2,
                ),
                const SizedBox(height: 15),
                const CertificateLineText(
                  titleText: 'Sertifikat ini diberikan kepada',
                  titleTextSize: 5.59,
                  subTitleText: 'This is to certify that',
                  subTitleTextSize: 4.47,
                ),
                const SizedBox(height: 8),
                const CertificateIdentitySection(
                  donorName: "Awanama Wijaya",
                  donorId: "59caf1ec-59bd-45af-876e-149d5df797f6",
                  donorGender: "Pria",
                  donorBloodTypeAndRhesus: "AB+",
                ),
                const SizedBox(height: 10),
                const CertificateLineText(
                  titleText:
                      "telah melakukan pendonoran darah yang berlokasi di",
                  titleTextSize: 5.59,
                  subTitleText: "has made blood donation at",
                  subTitleTextSize: 4.47,
                ),
                const SizedBox(height: 7),
                Text(
                  "PMI Runeterra",
                  style: AppText.textCustom.copyWith(
                    fontSize: 8.94,
                    fontWeight: AppText.bold,
                    color: AppColor.carnelian,
                  ),
                ),
                Text(
                  "ID Institusi: 40e4f760-7098-4c3c-8750-b6b95e0396b7",
                  style: AppText.textCustom.copyWith(
                    fontSize: 2.79,
                    fontWeight: AppText.semiBold,
                    color: AppColor.carnelian,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "pada tanggal 30 Desember 2021",
                  style: AppText.textCustom.copyWith(
                    fontSize: 5.03,
                    fontWeight: AppText.semiBold,
                    color: AppColor.carnelian,
                  ),
                ),
                Text(
                  "on date December 30, 2021",
                  style: AppText.textCustom.copyWith(
                    fontSize: 3.91,
                    fontWeight: AppText.semiBold,
                    color: AppColor.carnelian,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "ID Pendonoran: ad08bcc6-8241-43cd-bf17-01b26875a48c",
                  style: AppText.textCustom.copyWith(
                    fontSize: 3.35,
                    color: AppColor.carnelian,
                  ),
                ),
                Text(
                  "ID Event: 00000000-0000-0000-0000-000000000000",
                  style: AppText.textCustom.copyWith(
                    fontSize: 3.35,
                    color: AppColor.carnelian,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 8,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/vector/ic_title.svg',
                  width: 35,
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'powered by ',
                      style: AppText.textCustom.copyWith(
                        color: AppColor.cBlack,
                        fontWeight: AppText.semiBold,
                        fontSize: 5.03,
                      ),
                    ),
                    Image.asset(
                      'assets/bitmap/logo.png',
                      width: 12,
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
