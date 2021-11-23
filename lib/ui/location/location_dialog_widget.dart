import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

class LocationDialogWidget extends StatelessWidget {
  const LocationDialogWidget(
      {Key? key,
      required this.name,
      required this.bloodA,
      required this.bloodB,
      required this.bloodAB,
      required this.bloodO})
      : super(key: key);

  final String name;
  final int bloodA;
  final int bloodB;
  final int bloodAB;
  final int bloodO;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: renderDialog(context),
    );
  }

  renderDialog(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Informasi Bank Darah"),
                      Text(name),
                    ],
                  ),
                  InkWell(
                    child: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 24.0,
                      semanticLabel: 'Close',
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 45),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 20,
                  children: [
                    boxBloodInformation(context, "A", bloodA),
                    boxBloodInformation(context, "A", bloodB),
                    boxBloodInformation(context, "A", bloodAB),
                    boxBloodInformation(context, "A", bloodO),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  boxBloodInformation(BuildContext context, String bloodType, int bloodStock) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5,
        height: 80,
        color: AppColor.cPurple,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 80,
              color: AppColor.cRed,
              child: Center(
                  child: Text(
                bloodType,
                style: TextStyle(color: Colors.white),
              )),
            ),
            Expanded(
              child: Center(
                child: Text(
                  bloodStock.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
