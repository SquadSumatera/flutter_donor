import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int maxLength;
  final TextInputType inputType;
  final bool initial;
  final String initialText;

  final ValueChanged<String?> onSaved;
  final FormFieldValidator<String>? validator;

  const RegisterWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.maxLength,
    this.inputType = TextInputType.text,
    this.initial = false,
    this.initialText = "",
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

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initial ? initialText : null,
      keyboardType: inputType,
      inputFormatters: _inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      maxLength: maxLength,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
