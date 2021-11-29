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
    this.customValidator,
  }) : super(key: key);

  final String label;
  final String placeholderText;
  final Function callback;
  final String? initialValue;
  final bool obscureText;
  final bool numberOnly;
  final bool isEnabled;
  final bool isTextarea;
  final String? Function(String?)? customValidator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppText.textMedium.copyWith(
            color: AppColor.richBlack,
          ),
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
          style: AppText.textNormal.copyWith(
            color: AppColor.luckyPointBlack,
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
                color: AppColor.rockBlue,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: AppColor.cultured,
            filled: initialValue != null,
            labelText: placeholderText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelStyle: AppText.textNormal.copyWith(
              color: AppColor.richBlack,
            ),
            enabled: isEnabled,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
          ),
          onSaved: (val) {
            callback(val);
          },
          validator: customValidator ?? (value) {
            if (value == null || value.isEmpty) {
              return 'Kolom ini wajib diisi!';
            }
            return null;
          },
        ),
      ],
    );
  }
}
