import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class ForgotPassField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final bool isObscure;
  final ValueChanged<String?> onSaved;

  const ForgotPassField({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.isObscure,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppText.textMedium,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            focusColor: AppColor.cRed,
            hoverColor: AppColor.cRed,
            fillColor: AppColor.cRed,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: const BorderSide(color: AppColor.cRed),
            ),
            hintText: hintText,
            labelStyle: AppText.textMedium.copyWith(),
            floatingLabelStyle: AppText.textMedium.copyWith(
              color: AppColor.cRed,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onSaved: onSaved,
        ),
      ],
    );
  }
}
