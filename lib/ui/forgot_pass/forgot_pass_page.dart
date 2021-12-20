import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/forgot_pass_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/forgot_pass/section/forgot_pass_email_section.dart';
import 'package:flutter_donor/ui/forgot_pass/section/forgot_pass_header_section.dart';
import 'package:flutter_donor/ui/forgot_pass/section/forgot_pass_reset_section.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgotPassPage extends StatefulWidget {
  const ForgotPassPage({Key? key}) : super(key: key);

  @override
  State<ForgotPassPage> createState() => _ForgotPassPageState();
}

class _ForgotPassPageState extends State<ForgotPassPage> {
  final _formKey = GlobalKey<FormState>();
  final ForgotPassController controller = Get.put(ForgotPassController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 50.0,
                        horizontal: 25.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const ForgotPassHeaderSection(),
                          const SizedBox(height: 34),
                          Obx(
                            () => Form(
                              key: _formKey,
                              child: (controller.step.value ==
                                      ForgotPassStep.emailCheck)
                                  ? ForgotPassEmailSection()
                                  : ForgotPassResetSection(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25.0,
                      vertical: 80.0,
                    ),
                    child: Obx(
                      () => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.cRed,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                        onPressed: () {
                          _formKey.currentState!.save();
                          if (controller.step.value ==
                              ForgotPassStep.emailCheck) {
                            controller.checkEmail();
                          } else {
                            controller.changePassword();
                          }
                        },
                        child: Center(
                          child: (controller.status.value !=
                                  ForgotPassStatus.loading)
                              ? Text(
                                  (controller.step.value ==
                                          ForgotPassStep.emailCheck)
                                      ? 'Lanjut'
                                      : 'Simpan',
                                  style: AppText.textMedium.copyWith(
                                    color: AppColor.white,
                                    fontWeight: AppText.semiBold,
                                  ),
                                )
                              : const SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator(
                                    color: AppColor.white,
                                    strokeWidth: 3,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
