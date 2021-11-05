import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';
import '../../../../get_x/controller/profile_overlay_controller.dart';
import '../widgets/identity_dialog_button.dart';

class ConfirmChangeIdentity extends StatelessWidget {
  ConfirmChangeIdentity({Key? key}) : super(key: key);
  final ProfileOverlayController c = Get.find();

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
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
