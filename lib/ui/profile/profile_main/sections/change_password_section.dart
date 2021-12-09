import 'package:flutter/material.dart';
import 'package:flutter_donor/models/update_password_model.dart';
import 'package:get/get.dart';
import '../widgets/base_text_field.dart';
import '../../../../get_x/controller/profile_controller.dart';
import '../../../../get_x/controller/profile_overlay_controller.dart';
import '../../../../shared/theme.dart';

class ChangePasswordSection extends StatefulWidget {
  const ChangePasswordSection({Key? key}) : super(key: key);

  @override
  _ChangePasswordSectionState createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  ProfileOverlayController c = Get.find();
  ProfileController profileController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UpdatePasswordModel tempChangePasswordData = UpdatePasswordModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 2,
      ),
      decoration: const BoxDecoration(
        color: AppColor.white,
      ),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Ubah Password",
                  style: AppText.textMedium.copyWith(
                    fontWeight: AppText.bold,
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    c.removeOverlay();
                    profileController.status.value = ProfileLoadStatus.loaded;
                  },
                ),
              ],
            ),
            const SizedBox(height: 18),
            BaseTextField(
              label: "Password Saat Ini",
              placeholderText: "Masukkan password saat ini...",
              obscureText: true,
              callback: (val) {
                tempChangePasswordData.lastPassword = val;
              },
            ),
            const SizedBox(height: 12),
            BaseTextField(
              label: "Password Baru",
              placeholderText: "Masukkan password baru...",
              obscureText: true,
              callback: (val) {
                tempChangePasswordData.newPassword = val;
              },
            ),
            const SizedBox(height: 12),
            BaseTextField(
              label: "Konfirmasi Password Baru",
              placeholderText: "Masukkan kembali password baru...",
              obscureText: true,
              callback: (val) {
                tempChangePasswordData.confirmPassword = val;
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (profileController.status.value !=
                    ProfileLoadStatus.updateLoading) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    profileController
                        .updatePassword(
                          updatedPassword: tempChangePasswordData,
                        )
                        .then((value) => {
                              if (profileController.status.value ==
                                  ProfileLoadStatus.updateFailed)
                                {
                                  Get.snackbar(
                                    'Terjadi Kesalahan!',
                                    'Pastikan password saat ini benar serta memiliki panjang minimal 8 karakter!',
                                    backgroundColor: AppColor.white,
                                  )
                                }
                            });
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  Get.width * 0.8,
                  45,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                primary: AppColor.imperialRed,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Obx(() {
                return (profileController.status.value ==
                        ProfileLoadStatus.updateLoading)
                    ? const CircularProgressIndicator(
                        color: AppColor.white,
                        strokeWidth: 2,
                      )
                    : Text(
                        (profileController.status.value ==
                                ProfileLoadStatus.loaded)
                            ? "Simpan"
                            : (profileController.status.value ==
                                    ProfileLoadStatus.updated)
                                ? "Berhasil Tersimpan"
                                : "Terjadi Kesalahan, Pastikan Isian Benar",
                        style: AppText.textNormal.copyWith(
                          color: AppColor.white,
                          fontWeight: AppText.semiBold,
                        ),
                      );
              }),
            ),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}
