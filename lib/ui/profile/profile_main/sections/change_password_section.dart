import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../get_x/controller/profile_overlay_controller.dart';
import '../widgets/base_text_field.dart';
import '../../../../shared/theme.dart';

class ChangePasswordSection extends StatefulWidget {
  const ChangePasswordSection({Key? key}) : super(key: key);

  @override
  _ChangePasswordSectionState createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  ProfileOverlayController c = Get.find();

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
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: const Icon(Icons.close),
              onPressed: () => c.removeOverlay(),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "Ubah Password",
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 18),
          BaseTextField(
            label: "Password Saat Ini",
            placeholderText: "Masukkan password saat ini...",
            obscureText: true,
            callback: (val) {},
          ),
          const SizedBox(height: 12),
          BaseTextField(
            label: "Password Baru",
            placeholderText: "Masukkan password baru...",
            obscureText: true,
            callback: (val) {},
          ),
          const SizedBox(height: 12),
          BaseTextField(
            label: "Konfirmasi Password Baru",
            placeholderText: "Masukkan kembali password baru...",
            obscureText: true,
            callback: (val) {},
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () async {},
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
            child: Text(
              'Simpan',
              style: AppText.textNormal.copyWith(
                color: AppColor.white,
                fontWeight: AppText.semiBold,
              ),
            ),
          ),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}
