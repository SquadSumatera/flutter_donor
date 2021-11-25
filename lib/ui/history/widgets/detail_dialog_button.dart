import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class DetailDialogButton extends StatelessWidget {
  const DetailDialogButton({
    Key? key,
    required this.label,
    required this.active,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final bool active;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: active ? AppColor.imperialRed : AppColor.white,
        // border radius style
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: AppText.textNormal.copyWith(
            color: active ? AppColor.white : AppColor.imperialRed,
            fontWeight: AppText.bold,
          ),
        ),
      ),
    );
  }
}
