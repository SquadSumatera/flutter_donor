import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../get_x/controller/forgot_pass_controller.dart';
import '../../../shared/theme.dart';
import '../widgets/forgot_pass_field.dart';

class ForgotPassResetSection extends StatelessWidget {
  ForgotPassResetSection({Key? key}) : super(key: key);

  final ForgotPassController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColor.solitudeBlue,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            "Pesan berisi token lupa kata sandi telah dikirimkan ke email terdaftar!",
            style: AppText.textMedium.copyWith(
              color: AppColor.cRed,
              fontWeight: AppText.semiBold,
            ),
          ),
        ),
        const SizedBox(height: 18),
        ForgotPassField(
          hintText: "Masukkan token yang telah dikirimkan ke email",
          labelText: "Masukkan Token",
          isObscure: false,
          onSaved: (val) {
            controller.token = val ?? '';
          },
        ),
        const SizedBox(height: 32),
        ForgotPassField(
          hintText: "Masukkan password baru dengan minimal 8 karakter",
          labelText: "Masukkan Password Baru",
          isObscure: true,
          onSaved: (val) {
            controller.newPass = val ?? '';
          },
        ),
        const SizedBox(height: 32),
        ForgotPassField(
          hintText: "Masukkan kembali password baru",
          labelText: "Konfirmasi Password Baru",
          isObscure: true,
          onSaved: (val) {
            controller.confirmPass = val ?? '';
          },
        ),
      ],
    );
  }
}
