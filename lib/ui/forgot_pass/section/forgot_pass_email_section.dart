import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../get_x/controller/forgot_pass_controller.dart';
import '../widgets/forgot_pass_field.dart';

class ForgotPassEmailSection extends StatelessWidget {
  ForgotPassEmailSection({Key? key}) : super(key: key);

  final ForgotPassController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ForgotPassField(
          hintText: 'Masukkan email yang pernah didaftarkan.',
          labelText: 'Masukkan Email Terdaftar',
          isObscure: false,
          onSaved: (val) {
            controller.email = val ?? '';
          },
        ),
      ],
    );
  }
}
