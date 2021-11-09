import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_donor/get_x/state/register_getx.dart';
import 'package:get/get.dart';

class RegisterWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int maxLength;
  final TextInputType inputType;
  final bool initial;
  final String initialText;
  final bool needObscure;
  final ValueChanged<String?> onSaved;
  final FormFieldValidator<String>? validator;

  RegisterWidget({
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

  final RegisterController rControll = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        obscureText: rControll.dontChange.value
            ? true
            : needObscure
                ? rControll.obscure.value
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
                    rControll.changeObscure();
                  },
                  child: Obx(
                    () => Icon(rControll.obscure.value
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
