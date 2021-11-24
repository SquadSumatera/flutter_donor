import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/check_connection_getx.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/home/home_page_widget.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CheckConnectionGetX checkConnectionGetX = Get.find();
  final LoginGetX loginGetXState = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => checkConnectionGetX.status.value == StatusConnection.loading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColor.cBlack,
                  strokeWidth: 5,
                ),
              )
            : checkConnectionGetX.status.value == StatusConnection.failed
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                            "Terjadi Kesalahan, coba beberapa saat kembali."),
                        TextButton(
                          onPressed: () {
                            checkConnectionGetX.onInit();
                          },
                          child: const Text("Coba Lagi"),
                        ),
                      ],
                    ),
                  )
                : ListView(
                    children: [
                      banner(checkConnectionGetX),
                    ],
                  ),
      ),
    );
  }
}
