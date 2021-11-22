import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/get_x/state/check_connection_getx.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CheckConnectionGetX checkConnectionGetX = Get.find();
  final LoginGetX loginGetXState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Home",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.semiBold,
          ),
        ),
      ),
      body: Obx(
        () {
          return (checkConnectionGetX.status.value == StatusConnection.loading)
              ? const Center(
                  child: CircularProgressIndicator(
                    color: AppColor.cBlack,
                    strokeWidth: 5,
                  ),
                )
              : (checkConnectionGetX.status.value == StatusConnection.failed)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                              "Terjadi Kesalahan, coba beberapa saat kembali."),
                          TextButton(
                            onPressed: () {
                              checkConnectionGetX.getCheckConnect(
                                loginGetXState.token.value,
                              );
                            },
                            child: const Text("Coba Lagi"),
                          ),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text("Hallo"),
                    );
        },
      ),
    );
  }
}
