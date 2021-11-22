import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key? key}) : super(key: key);

  var blood = Get.parameters['blood'];
  var rhesus = Get.parameters['rhesus'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/vector/ic_back.svg',
            width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Dorplas',
          style: AppText.textMedium.copyWith(fontWeight: AppText.semiBold),
        ),
        titleSpacing: 0,
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Lanjutkan Sebagai?',
              style: AppText.textSemiLarge
                  .copyWith(color: AppColor.cRed, fontWeight: AppText.bold),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Container(
                  width: 98,
                  height: 87,
                  decoration: BoxDecoration(
                    color: AppColor.cRed,
                    border: Border.all(
                      color: AppColor.cRed,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/bitmap/blood_drop.png'),
                      Text(
                        'Pendonor',
                        style: AppText.textExtraSmall.copyWith(
                            color: Colors.white, fontWeight: AppText.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  var arg = {"blood": "$blood", "rhesus": "$rhesus"};
                  Get.toNamed(Routes.donor, parameters: arg);
                },
              ),
              GestureDetector(
                child: Container(
                  width: 98,
                  height: 87,
                  decoration: BoxDecoration(
                    color: AppColor.cRed,
                    border: Border.all(
                      color: AppColor.cRed,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset('assets/bitmap/blood_donation.png'),
                      Text(
                        'Request Plasma',
                        style: AppText.textExtraSmall.copyWith(
                            color: Colors.white, fontWeight: AppText.bold),
                      ),
                    ],
                  ),
                ),
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
