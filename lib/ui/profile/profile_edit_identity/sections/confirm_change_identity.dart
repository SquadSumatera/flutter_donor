import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import '../../../../models/profile_model.dart';
import '../../../../shared/theme.dart';
import 'package:get/get.dart';
import '../../../../get_x/controller/profile_overlay_controller.dart';
import '../widgets/identity_dialog_button.dart';

class ConfirmChangeIdentity extends StatelessWidget {
  ConfirmChangeIdentity({
    Key? key,
    required this.data,
  }) : super(key: key);
  final ProfileModel data;
  final ProfileOverlayController c = Get.find();
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.white,
      height: 170,
      padding: const EdgeInsets.all(28),
      child: Column(
        children: <Widget>[
          Text(
            "Apakah anda yakin ingin mengubah identitas pribadi anda?",
            style: AppText.textMedium.copyWith(
              fontWeight: AppText.semiBold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IdentityDialogButton(
                label: "Tidak",
                active: false,
                onPressed: () {
                  c.removeOverlay();
                },
              ),
              IdentityDialogButton(
                label: "Ya",
                active: true,
                onPressed: () {
                  c.removeOverlay();
                  profileController.updateProfile(
                    updatedProfile: data,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
