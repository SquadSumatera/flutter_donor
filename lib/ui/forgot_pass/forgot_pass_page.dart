import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/forgot_pass/section/forgot_pass_email_section.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 50.0,
                  horizontal: 25.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SvgPicture.asset(
                      "assets/vector/ic_title.svg",
                      width: 101.0,
                      height: 38.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Lupa Password',
                      style: AppText.textLarge.copyWith(
                        fontWeight: AppText.semiBold,
                      ),
                    ),
                    const SizedBox(height: 34),
                    const ForgotPassEmailSection(),
                  ],
                ),
              ),
              const SizedBox(height: 48),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.cRed,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Lanjut',
                      style: AppText.textMedium.copyWith(
                        color: AppColor.white,
                        fontWeight: AppText.semiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
