import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/register_getx.dart';
import 'package:flutter_donor/get_x/state/register_kontak_getx.dart';
import 'package:flutter_donor/models/register_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/services/register_services.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/register/register_header.dart';
import 'package:flutter_donor/ui/register/register_widget.dart';
import 'package:get/get.dart';

class RegisterPage3 extends StatelessWidget {
  RegisterPage3({Key? key}) : super(key: key);

  final RegisterKontakGetX registerKontakGetXPage =
      Get.find<RegisterKontakGetX>();

  final RegisterController registerControllerGetXPage =
      Get.find<RegisterController>();

  final GlobalKey<FormState> formKeyRegsiterKontak = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKeyRegsiterKontak,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerLogo(),
                namePage("Kontak"),
                const SizedBox(
                  height: 72.0,
                ),
                RegisterWidget(
                  hintText: "Masukan Nomor",
                  labelText: "Nomor HP",
                  inputType: TextInputType.phone,
                  maxLength: 14,
                  needObscure: false,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Phone is Required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registerKontakGetXPage.changePhone(value!);
                  },
                ),
                RegisterWidget(
                  hintText: "Masukan Alamat",
                  labelText: "Alamat",
                  inputType: TextInputType.text,
                  maxLength: 50,
                  needObscure: false,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Address is Required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    registerKontakGetXPage.changeAddress(value!);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: registerKontakGetXPage.dontChange.value
                            ? true
                            : registerKontakGetXPage.checkList.value,
                        onChanged: (bool? value) {
                          registerKontakGetXPage.changeCheck();
                        },
                        checkColor: AppColor.white,
                        activeColor: AppColor.cRed,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "Saya menyetujui ",
                            style: AppText.textMedium.copyWith(
                              color: AppColor.cBlack,
                              fontWeight: AppText.semiBold,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              "Ketentuan & Kebijakan Privasi",
                              style: AppText.textMedium.copyWith(
                                color: AppColor.cRed,
                                fontWeight: AppText.semiBold,
                              ),
                              softWrap: false,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Obx(
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
                      onPressed: registerKontakGetXPage.dontChange.value
                          ? () {}
                          : registerKontakGetXPage.checkList.value
                              ? () async {
                                  if (!formKeyRegsiterKontak.currentState!
                                      .validate()) {
                                    return;
                                  }
                                  formKeyRegsiterKontak.currentState!.save();
                                  registerKontakGetXPage.changeStatus();
                                  RegisterModel
                                      rRegister = await RegisterServices
                                          .registerCheck(
                                              nameDonators:
                                                  registerControllerGetXPage
                                                      .name.value,
                                              emailDonators:
                                                  registerControllerGetXPage
                                                      .email.value,
                                              passwordDonators:
                                                  registerControllerGetXPage
                                                      .finalPass.value,
                                              addressDonators:
                                                  registerKontakGetXPage
                                                      .address.value,
                                              contactDonators:
                                                  registerKontakGetXPage
                                                      .phone.value);
                                  print("Status nihh" +
                                      rRegister.status.toString());
                                  if (rRegister.status == 201) {
                                    registerKontakGetXPage.changeStatus();
                                    Get.snackbar(
                                      "Pendaftaran Sukses",
                                      "Lanjoetkan Kawan",
                                      duration:
                                          const Duration(milliseconds: 500),
                                    );

                                    Get.offAllNamed(Routes.login);
                                  } else {
                                    registerKontakGetXPage.changeStatus();
                                    Get.snackbar(
                                      "Pendaftaran Gagal",
                                      "Cek lagi koneksi",
                                      duration:
                                          const Duration(milliseconds: 500),
                                    );
                                  }
                                  //         LoginApiModel _loginClient =
                                  //     await LoginClient.loginCheck(
                                  //   email: email,
                                  //   password: password,
                                  // );
                                }
                              : null,
                      child: registerKontakGetXPage.dontChange.value
                          ? const Text("True")
                          : registerKontakGetXPage.isDone.value
                              ? const Text(
                                  "Selesai",
                                  textAlign: TextAlign.center,
                                )
                              : const CircularProgressIndicator(
                                  color: AppColor.white,
                                  strokeWidth: 3.0,
                                  semanticsLabel: "Loading...",
                                ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
