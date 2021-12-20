import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/services/forgot_pass_services.dart';
import 'package:get/get.dart';

enum ForgotPassStatus {
  loaded,
  loading,
  failed,
}

enum ForgotPassStep {
  emailCheck,
  resetPass,
}

class ForgotPassController extends GetxController {
  Rx<ForgotPassStatus> status = ForgotPassStatus.loaded.obs;
  Rx<ForgotPassStep> step = ForgotPassStep.emailCheck.obs;
  String email = '';
  String token = '';
  String newPass = '';
  String confirmPass = '';

  Future<void> checkEmail() async {
    status.value = ForgotPassStatus.loading;
    update();
    try {
      bool result = await ForgotPassServices.forgotPassDonator(
        email: email,
      );
      if (!result) {
        throw Exception();
      }
      step.value = ForgotPassStep.resetPass;
      status.value = ForgotPassStatus.loaded;
    } catch (e) {
      Get.snackbar(
        'Terjadi Kesalahan!',
        'Pastikan email telah terdaftar dan silahkan coba kembali.',
      );
      status.value = ForgotPassStatus.failed;
    }
    update();
  }

  Future<void> changePassword() async {
    status.value = ForgotPassStatus.loading;
    update();
    try {
      await ForgotPassServices.changePasswordDonator(
        email: email,
        tokenDonators: token,
        password: newPass,
        confirmPassword: confirmPass,
      );

      step.value = ForgotPassStep.emailCheck;
      status.value = ForgotPassStatus.loaded;
      Get.offAndToNamed(Routes.login);
      Get.snackbar(
        'Sukses!',
        'Password berhasil diubah dan silahkan login kembali.',
      );
    } catch (e) {
      if (newPass.length < 8) {
        Get.snackbar(
          'Terjadi Kesalahan!',
          'Pastikan password baru memiliki minimal 8 karakter dan silahkan coba kembali.',
        );
      } else if (newPass != confirmPass) {
        Get.snackbar(
          'Terjadi Kesalahan!',
          'Pastikan kolom konfirmasi password sesuai dengan password baru dan silahkan coba kembali.',
        );
      } else {
        Get.snackbar(
          'Terjadi Kesalahan!',
          'Pastikan token sesuai dan silahkan coba kembali.',
        );
      }
      status.value = ForgotPassStatus.failed;
    }
    update();
  }
}
