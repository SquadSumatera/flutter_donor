import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';

class IdentityChoiceItem extends StatelessWidget {
  const IdentityChoiceItem({
    Key? key,
    required this.label,
    required this.active,
  }) : super(key: key);

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (active) ? AppColor.camelotRed : AppColor.white,
        boxShadow: AppShadow.medium,
      ),
      child: Text(
        label,
        style: AppText.textNormal.copyWith(
          color: (active) ? AppColor.white : AppColor.camelotRed,
          fontWeight: AppText.bold,
        ),
      ),
    );
  }
}
