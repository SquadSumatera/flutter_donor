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
      height: MediaQuery.of(context).size.height / 1.25,
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
                    Text(
                      "Informasi Bank Darah",
                      style: AppText.textMedium.copyWith(
                          color: AppColor.cBlack, fontWeight: AppText.bold),
                    ),
                    Text(
                      name,
                      style: AppText.textMedium.copyWith(
                          color: AppColor.cBlack, fontWeight: AppText.normal),
                    ),
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
            const SizedBox(height: 30.0),
            Text(
              'Bank Darah',
              style: AppText.textMedium.copyWith(
                  color: AppColor.cBlack, fontWeight: AppText.semiBold),
            ),
            const SizedBox(height: 15.0),
            Wrap(
              spacing: 30,
              runSpacing: 10,
              children: [
                boxBloodInformation(context, "A", bloodA),
                boxBloodInformation(context, "A", bloodB),
                boxBloodInformation(context, "A", bloodAB),
                boxBloodInformation(context, "A", bloodO),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              'Alamat',
              style: AppText.textMedium.copyWith(
                  color: AppColor.cBlack, fontWeight: AppText.semiBold),
            ),
            const SizedBox(height: 15.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ultrices laoreet senectus vitae vitae. Id aliquam diam, metus at tempus, fringilla tincidunt pellentesque purus. Massa quam metus.',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: AppText.textMedium
                  .copyWith(color: AppColor.cBlack, fontWeight: AppText.normal),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Expanded(child: Container()),
                InkWell(
                  child: Text(
                    'Buka di Maps',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cRed, fontWeight: AppText.semiBold),
                  ),
                  onTap: (){
                    Get.snackbar("title", "message");
                  },
                ),
              ],
            ),
          ],
        ),
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
                style: AppText.textLarge.copyWith(
                    color: AppColor.white, fontWeight: AppText.normal),
              )),
            ),
            Expanded(
              child: Center(
                child: Text(
                  bloodStock.toString(),
                  style: AppText.textLarge.copyWith(
                      color: AppColor.white, fontWeight: AppText.semiBold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
