import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/register_getx.dart';
import 'package:flutter_donor/get_x/state/register_goldar_getx.dart';
import 'package:flutter_donor/get_x/state/register_kontak_getx.dart';
import 'package:flutter_donor/get_x/state/register_resus_getx.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/register/register_header.dart';
import 'package:flutter_donor/ui/register/register_widget.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  //late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RegisterController rController = Get.put(RegisterController());
  final RegisterGolDarGetX golDarGetXPage = Get.put(RegisterGolDarGetX());
  final RegisterResusGetX resusGetXPage = Get.put(RegisterResusGetX());
  final RegisterKontakGetX rKontakGetXPage = Get.put(RegisterKontakGetX());

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
              namePage("Daftar"),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    RegisterWidget(
                      hintText: "Masukan Nama",
                      labelText: "Nama",
                      maxLength: 33,
                      inputType: TextInputType.name,
                      needObscure: false,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Nama is Required';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        rController.changeName(value!);
                      },
                    ),
                    RegisterWidget(
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
                        rController.changeEmail(value!);
                      },
                    ),
                    Obx(
                      () => RegisterWidget(
                        hintText: "Masukan Password",
                        labelText: "Password",
                        maxLength: 18,
                        inputType: TextInputType.name,
                        needObscure: true,
                        validator: rController.dontChange.value
                            ? (String? value) {}
                            : (String? value) {
                                rController.changeFirstPass(value!);
                                if (value.isEmpty) {
                                  return 'Password is Required';
                                }
                                return null;
                              },
                        onSaved: (String? value) {
                          rController.changeFinalPass(value!);
                        },
                      ),
                    ),
                    Obx(
                      () => RegisterWidget(
                        hintText: "Masukan Ulang Password",
                        labelText: "Password Ulang",
                        maxLength: 18,
                        inputType: TextInputType.name,
                        needObscure: true,
                        validator: rController.dontChange.value
                            ? (String? value) {}
                            : (String? value) {
                                if (value!.isEmpty) {
                                  return 'Password is Required';
                                } else if (value !=
                                    rController.firstPass.value) {
                                  return "Password not match";
                                }
                                return null;
                              },
                        onSaved: (String? value) {
                          rController.changeFinalPass(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
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
                      onPressed: () {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        formKey.currentState!.save();
                        Get.toNamed(Routes.register2);
                      },
                      child: const Text(
                        "Daftar",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sudah Punya Akun ?",
                          style: AppText.textMedium.copyWith(
                            color: AppColor.cBlack,
                            fontSize: 14.0,
                            fontWeight: AppText.semiBold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            " Login",
                            style: AppText.textMedium.copyWith(
                              color: AppColor.cRed,
                              fontSize: 14.0,
                              fontWeight: AppText.semiBold,
                            ),
                          ),
                        )
                      ],
                    )
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
