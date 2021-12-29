import 'package:flutter/material.dart';
import 'package:flutter_donor/models/google_signin_model.dart';
import 'package:flutter_donor/services/login_google_service.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../get_x/state/login_getx.dart';
import '../../models/login_model.dart';
import '../../routes/app_pages.dart';
import '../../services/login_services.dart';
import '../../shared/theme.dart';
import 'login_widget.dart';
import '../register/register_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  final LoginGetX loginGetXPage = Get.put(LoginGetX());
// https://www.googleapis.com/auth/contacts.readonly
  @override
  Widget build(BuildContext context) {
    final GoogleSignIn _googleSignIn2 = GoogleSignIn(
      scopes: [
        'email',
        "https://www.googleapis.com/auth/userinfo.profile",
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              SingleChildScrollView(
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
                          const SizedBox(height: 2.0),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.forgotPassword);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 6.0),
                                child: Text(
                                  "Lupa Password ?",
                                  style: AppText.textMedium.copyWith(
                                    color: AppColor.cRed,
                                    fontWeight: AppText.semiBold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
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
                              ),
                              onPressed: () async {
                                if (!formKeyLogin.currentState!.validate()) {
                                  return;
                                }
                                formKeyLogin.currentState!.save();
                                loginGetXPage.changeStatus();
                                LoginModel loginCheck =
                                    await LoginServices.loginCheck(
                                        emailDonators:
                                            loginGetXPage.email.value,
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
                                      ? Text(
                                          "Masuk",
                                          style: AppText.textMedium.copyWith(
                                            fontSize: 15.0,
                                            color: AppColor.white,
                                            fontWeight: AppText.semiBold,
                                          ),
                                          textAlign: TextAlign.center,
                                        )
                                      : const CircularProgressIndicator(
                                          color: AppColor.white,
                                          strokeWidth: 3.0,
                                          semanticsLabel: "Loading...",
                                        ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: Text(
                              "or connect with",
                              style: AppText.textNormal.copyWith(
                                fontWeight: AppText.light,
                                color: AppColor.richBlack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                MediaQuery.of(context).size.width - 50,
                                38.0,
                              ),
                              primary: AppColor.white,
                              shadowColor: AppColor.cGrey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                var coba = await _googleSignIn2.signOut();
                                coba;
                                var result = await _googleSignIn2.signIn();
                                if (result != null) {
                                  loginGetXPage.cLoading();
                                  var auth = await result.authentication;
                                  if (auth.idToken != null) {
                                    print("Ini ID Token" + auth.idToken!);
                                    try {
                                      GoogleSignInModel googleSignInModel =
                                          await LoginGoogleServices
                                              .loginGoogleServices(
                                                  token: auth.idToken!);

                                      if (googleSignInModel.status == 201) {
                                        loginGetXPage.changeToken(
                                            googleSignInModel.token!);
                                        loginGetXPage.setDataToken(
                                            googleSignInModel.token!);
                                        loginGetXPage.cLoaded();
                                        Get.offAllNamed(Routes.main);
                                      } else {
                                        print(googleSignInModel.message);
                                        print(googleSignInModel.status);
                                        loginGetXPage.cLoaded();
                                        Get.snackbar(
                                          "Akun anda tidak terdaftar",
                                          "Silahkan melakukan registrasi terlebih dahulu",
                                          duration: const Duration(seconds: 4),
                                        );
                                      }
                                    } catch (e) {
                                      loginGetXPage.cLoaded();
                                      Get.snackbar(
                                        "Kesalahan",
                                        "$e",
                                        duration: const Duration(seconds: 4),
                                      );
                                      print("error");
                                      print(e);
                                    }
                                  }
                                }
                              } catch (e) {
                                print(e);
                                Get.snackbar(
                                  "Kesalahan",
                                  "Sistem Error - $e",
                                  duration: const Duration(seconds: 4),
                                );
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/bitmap/google.png",
                                  height: 15.0,
                                  width: 15.0,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Masuk dengan Google",
                                  style: AppText.textMedium.copyWith(
                                    fontSize: 15.0,
                                    color: AppColor.cBlack,
                                    fontWeight: AppText.semiBold,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
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
              loginGetXPage.statusOuth.value == StatusOauth.loading
                  ? Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: AppColor.cBlack.withOpacity(0.5),
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                      width: 0,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
