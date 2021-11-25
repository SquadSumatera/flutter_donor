import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class DonorCertificateView extends StatelessWidget {
  const DonorCertificateView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.carnelian,
      child: const Center(
        child: Text('P'),
      ),
    );
  }
}