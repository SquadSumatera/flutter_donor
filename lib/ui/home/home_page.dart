import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/check_connection_getx.dart';
import 'package:flutter_donor/get_x/state/home_getx.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/home/home_artikel_widget.dart';
import 'package:flutter_donor/ui/home/home_banner_widget.dart';
import 'package:flutter_donor/ui/home/home_divider_widget.dart';
import 'package:flutter_donor/ui/home/home_trend_widget.dart';
import 'package:get/get.dart';

import 'home_schedule_widget.dart';
import 'home_stok_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CheckConnectionGetX checkConnectionGetX =
      Get.find<CheckConnectionGetX>();
  final LoginGetX loginGetXState = Get.find<LoginGetX>();
  final HomeGetX index = Get.find<HomeGetX>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        elevation: 0,
        toolbarHeight: 12.0,
      ),
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
                      banner(checkConnectionGetX, index),
                      stokPlasma(),
                      homeDivier(),
                      trend(),
                      homeDivier(),
                      title("Jadwal Donor"),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return cardSchedule();
                        },
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      homeDivier(),
                      title("Artikel"),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, i) {
                          return atricle();
                        },
                      ),
                    ],
                  ),
      ),
    );
  }
}
