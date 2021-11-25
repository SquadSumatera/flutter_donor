import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DonorCertificateView extends StatelessWidget {
  const DonorCertificateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(
        child: Text("a"),
      ),
    );
    // return Material(
    //   child: Stack(
    //     children: [
    //       Positioned.fill(
    //         child: SvgPicture.asset(
    //           'assets/vector/sertif-bg.svg',
    //           semanticsLabel: 'Certificate',
    //           fit: BoxFit.fill,
    //           color: AppColor.cultured,
    //         ),
    //       ),
    //       Positioned.fill(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             const SizedBox(height: 23),
    //             Container(
    //               padding: const EdgeInsets.all(7.0),
    //               decoration: const BoxDecoration(
    //                 border: Border(
    //                   bottom: BorderSide(
    //                     color: AppColor.imperialRed,
    //                     width: 0.5,
    //                   ),
    //                 ),
    //               ),
    //               child: Text(
    //                 "Surat Keterangan Donor Darah",
    //                 style: AppText.textCustom.copyWith(
    //                   fontSize: 8.94,
    //                   color: AppColor.bloodRed,
    //                   fontWeight: AppText.semiBold,
    //                 ),
    //               ),
    //             ),
    //             Text(
    //               "Certificate of Blood Donation",
    //               style: AppText.textCustom.copyWith(
    //                 letterSpacing: 0.45,
    //                 color: AppColor.bloodRed,
    //                 fontSize: 4.47,
    //                 fontWeight: AppText.semiBold,
    //                 fontStyle: FontStyle.italic,
    //               ),
    //             ),
    //             const SizedBox(height: 170),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
