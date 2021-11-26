import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:lottie/lottie.dart';

class LocationLoadingPage extends StatelessWidget {
  const LocationLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/maps_location.json'),
            Center(
                child: Text(
              'Mencari lokasi PMI terdekat',
              style: AppText.textMedium
                  .copyWith(color: Colors.red, fontWeight: AppText.semiBold),
            )),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
