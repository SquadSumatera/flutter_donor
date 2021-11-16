import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../shared/theme.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    Key? key,
    required this.label,
    required this.placeholderText,
    required this.callback,
    this.initialValue,
    this.obscureText = false,
    this.numberOnly = false,
    this.isEnabled = true,
    this.isTextarea = false,
  }) : super(key: key);

  final String label;
  final String placeholderText;
  final Function callback;
  final String? initialValue;
  final bool obscureText;
  final bool numberOnly;
  final bool isEnabled;
  final bool isTextarea;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppText.textMedium,
        ),
        const SizedBox(height: 8),
        TextFormField(
          maxLines: isTextarea ? 8 : 1,
          initialValue: initialValue,
          inputFormatters: numberOnly
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
          obscureText: obscureText,
          style: AppText.textMedium.copyWith(
            fontWeight: AppText.semiBold,
          ),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.eerieBlack,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.cultured,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColor.lightGrey,
            filled: initialValue != null,
            labelText: placeholderText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: AppText.textNormal.copyWith(
              color: AppColor.silverChalice,
            ),
            enabled: isEnabled,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
          ),
          onFieldSubmitted: (val) {
            callback(val);
          },
        ),
      ],
    );
  }
}
