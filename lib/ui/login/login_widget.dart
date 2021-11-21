import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../get_x/state/login_getx.dart';

class LoginWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int maxLength;
  final TextInputType inputType;
  final bool initial;
  final String initialText;
  final bool needObscure;
  final ValueChanged<String?> onSaved;
  final FormFieldValidator<String>? validator;

  LoginWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.maxLength,
    this.inputType = TextInputType.text,
    this.initial = false,
    this.initialText = "",
    required this.needObscure,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  List<TextInputFormatter> get _inputFormatters {
    List<TextInputFormatter> _formatters = <TextInputFormatter>[];
    switch (inputType.index) {
      case 3:
        _formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 6:
        _formatters.add(FilteringTextInputFormatter.allow(RegExp(" ")));
        break;
      case 9:
        break;
    }
    return _formatters;
  }

  final LoginGetX lControll = Get.find<LoginGetX>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        obscureText: lControll.dontChange.value
            ? true
            : needObscure
                ? lControll.obscure.value
                : false,
        initialValue: initial ? initialText : null,
        keyboardType: inputType,
        inputFormatters: _inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          suffixIcon: needObscure
              ? GestureDetector(
                  onTap: () {
                    lControll.changeObscure();
                  },
                  child: Obx(
                    () => Icon(lControll.obscure.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                  ),
                )
              : null,
        ),
        maxLength: maxLength,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
