import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/models/profile_model.dart';
import 'package:get/get.dart';
import '../widgets/base_text_field.dart';
import '../../../../get_x/controller/profile_overlay_controller.dart';
import '../../../../shared/theme.dart';

class ChangeContactSection extends StatefulWidget {
  const ChangeContactSection({Key? key}) : super(key: key);

  @override
  _ChangeContactSectionState createState() => _ChangeContactSectionState();
}

class _ChangeContactSectionState extends State<ChangeContactSection> {
  ProfileOverlayController c = Get.find();
  ProfileController profileController = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late ProfileModel tempProfile;

  @override
  void initState() {
    super.initState();
    tempProfile = profileController.profile.value.copyWith();
  }

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
                  "Ubah Informasi Kontak",
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
              label: "Email",
              initialValue: tempProfile.emailDonators,
              placeholderText: "Masukkan email...",
              callback: (val) {
                tempProfile.emailDonators = val;
              },
            ),
            const SizedBox(height: 12),
            BaseTextField(
              label: "No Handphone",
              initialValue: tempProfile.contactDonators,
              placeholderText: "Masukkan No HP...",
              numberOnly: true,
              callback: (val) {
                tempProfile.contactDonators = val;
              },
            ),
            const SizedBox(height: 12),
            BaseTextField(
              label: "Alamat",
              initialValue: tempProfile.addressDonators,
              placeholderText: "Masukkan Alamat Lengkap Sesuai KTP...",
              isTextarea: true,
              callback: (val) {
                tempProfile.addressDonators = val;
              },
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (profileController.status.value !=
                    ProfileLoadStatus.updateLoading) {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    profileController.updateProfile(
                      updatedProfile: tempProfile,
                    );
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
                                : "Terjadi Kesalahan, Coba Lagi",
                        style: AppText.textNormal.copyWith(
                          color: AppColor.white,
                          fontWeight: AppText.semiBold,
                        ),
                      );
              }),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
