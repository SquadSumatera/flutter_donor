import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/forgot_pass/widgets/forgot_pass_field.dart';

class ForgotPassEmailSection extends StatelessWidget {
  const ForgotPassEmailSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ForgotPassField(
          hintText: 'Masukkan email yang pernah didaftarkan.',
          labelText: 'Masukkan Email Terdaftar',
          isObscure: false,
          onSaved: (val) {},
        ),
      ],
    );
  }
}
