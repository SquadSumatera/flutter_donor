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
      body: ListView(
        children: [
          SizedBox(
            height: 222.0,
            child: Stack(
              children: [
                Container(
                  height: 183.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/bitmap/header_bg.png"),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 27.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              padding: const EdgeInsets.only(
                                right: 19.0,
                                top: 10,
                              ),
                              onPressed: () {},
                              icon: const Icon(
                                Icons.notifications,
                                color: AppColor.white,
                                size: 24.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Selamat Datang !",
                          style: AppText.textLarge.copyWith(
                            color: AppColor.white,
                            fontWeight: AppText.bold,
                          ),
                        ),
                        Text(
                          "Mulai bantu selamatkan nyawa sekarang",
                          style: AppText.textNormal.copyWith(
                            color: AppColor.white,
                            fontWeight: AppText.normal,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 6.0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: AppColor.white,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star_border,
                                color: AppColor.cRed,
                                size: 12.0,
                              ),
                              const SizedBox(width: 6.0),
                              Text(
                                "Nilai Aplikasi",
                                style: AppText.textNormal.copyWith(
                                  color: AppColor.cRed,
                                  fontWeight: AppText.normal,
                                  letterSpacing: 1,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 77.0,
                    margin: const EdgeInsets.symmetric(horizontal: 32.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppColor.white,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 0.4,
                          offset: Offset(0, 4),
                          color: AppColor.cGrey,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text("Hallo EveryBody"),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
