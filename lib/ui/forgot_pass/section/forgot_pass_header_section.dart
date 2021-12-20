import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/theme.dart';

class ForgotPassHeaderSection extends StatelessWidget {
  const ForgotPassHeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}
