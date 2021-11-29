import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';

class ProfileIdentityItem extends StatelessWidget {
  const ProfileIdentityItem({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          title,
          style: AppText.textNormal.copyWith(
            color: AppColor.camelotRed,
            fontWeight: AppText.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 33,
            vertical: 7,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.camelotRed,
          ),
          child: Center(
            child: Text(
              value,
              style: AppText.textNormal.copyWith(
                color: AppColor.white,
                fontWeight: AppText.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}