import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../get_x/state/login_getx.dart';
import '../../models/login_model.dart';
import '../../routes/app_pages.dart';
import '../../services/login_services.dart';
import '../../shared/theme.dart';
import 'login_widget.dart';
import '../register/register_header.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  final LoginGetX loginGetXPage = Get.put(LoginGetX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerLogo(),
              namePage("Masuk"),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                key: formKeyLogin,
                child: Column(
                  children: [
                    LoginWidget(
                      hintText: "Masukan Email",
                      labelText: "Email",
                      maxLength: 50,
                      inputType: TextInputType.emailAddress,
                      needObscure: false,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Email is Required';
                        }
                        if (!RegExp(
                                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                            .hasMatch(value)) {
                          return 'Tolong Masukan Email yang benar';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        loginGetXPage.changeEmail(value!);
                      },
                    ),
                    Obx(
                      () => LoginWidget(
                        hintText: "Masukan Password",
                        labelText: "Password",
                        maxLength: 18,
                        inputType: TextInputType.text,
                        needObscure: true,
                        validator: loginGetXPage.dontChange.value
                            ? (String? value) {}
                            : (String? value) {
                                if (value!.isEmpty) {
                                  return 'Password is Required';
                                }
                                loginGetXPage.changePass(value);
                                return null;
                              },
                        onSaved: (String? value) {
                          loginGetXPage.changeFinalPass(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width - 50,
                            38.0,
                          ),
                          primary: AppColor.cRed,
                          shadowColor: AppColor.cGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          textStyle: AppText.textMedium.copyWith(
                            fontSize: 14.0,
                            color: AppColor.white,
                            fontWeight: AppText.semiBold,
                          ),
                        ),
                        onPressed: () async {
                          if (!formKeyLogin.currentState!.validate()) {
                            return;
                          }
                          formKeyLogin.currentState!.save();
                          loginGetXPage.changeStatus();
                          LoginModel loginCheck =
                              await LoginServices.loginCheck(
                                  emailDonators: loginGetXPage.email.value,
                                  passwordDonators:
                                      loginGetXPage.finalPass.value);

                          if (loginCheck.status == 201) {
                            loginGetXPage.changeStatus();
                            loginGetXPage.changeToken(loginCheck.token!);
                            loginGetXPage.setDataToken(loginCheck.token!);
                            Get.offAllNamed(Routes.main);
                          } else {
                            loginGetXPage.changeStatus();
                            Get.snackbar(
                              "Login Gagal",
                              "Cek lagi koneksi/ Akun Anda",
                              duration: const Duration(seconds: 3),
                            );
                          }
                        },
                        child: loginGetXPage.dontChange.value
                            ? null
                            : loginGetXPage.isDone.value
                                ? const Text(
                                    "Masuk",
                                    textAlign: TextAlign.center,
                                  )
                                : const CircularProgressIndicator(
                                    color: AppColor.white,
                                    strokeWidth: 3.0,
                                    semanticsLabel: "Loading...",
                                  ),
                      ),
                    ),
                    const SizedBox(
                      height: 14.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Belum Punya Akun ? ",
                          style: AppText.textMedium.copyWith(
                            color: AppColor.cBlack,
                            fontWeight: AppText.semiBold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.register);
                          },
                          child: Text(
                            "Daftar",
                            style: AppText.textMedium.copyWith(
                                color: AppColor.cRed,
                                fontWeight: AppText.semiBold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
