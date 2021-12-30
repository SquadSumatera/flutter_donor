import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../get_x/controller/profile_overlay_controller.dart';
import '../../../../get_x/controller/donor_history_controller.dart';
import '../../../../get_x/controller/profile_controller.dart';
import '../../../../get_x/controller/submission_history_controller.dart';
import '../../../../get_x/state/login_getx.dart';
import '../../../../routes/app_pages.dart';
import '../../../../shared/theme.dart';
import '../../../history/widgets/detail_dialog_button.dart';

class LogoutConfirmDialog extends StatefulWidget {
  const LogoutConfirmDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutConfirmDialog> createState() => _LogoutConfirmDialogState();
}

class _LogoutConfirmDialogState extends State<LogoutConfirmDialog> {
  ProfileOverlayController overlay = Get.find();

  final LoginGetX token = Get.find<LoginGetX>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        overlay.removeOverlay();
        return true;
      },
      child: Container(
        color: AppColor.white,
        constraints: const BoxConstraints(
          maxHeight: 170,
        ),
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Apakah anda ingin log out?",
              style: AppText.textMedium.copyWith(
                fontWeight: AppText.semiBold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DetailDialogButton(
                  label: "Tidak",
                  active: false,
                  onPressed: () {
                    overlay.removeOverlay();
                  },
                ),
                DetailDialogButton(
                  label: "Ya",
                  active: true,
                  onPressed: () {
                    token.changeToken("");
                    token.setDataToken("");
                    Get.delete<DonorHistoryController>();
                    Get.delete<SubmissionHistoryController>();
                    Get.delete<ProfileController>();
                    overlay.removeOverlay();
                    Get.offAllNamed(Routes.login);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
