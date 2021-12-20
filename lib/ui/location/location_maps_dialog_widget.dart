import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

class LocationMapsDialogWidget extends StatelessWidget {
  LocationMapsDialogWidget({Key? key, required this.data}) : super(key: key);

  final Datum data;
  final ProfileController profileController = Get.find();

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
                      data.nameInstitutions!,
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
                boxBloodInformation(
                    context,
                    "A",
                    data.bloodStockInstitutions![0].stock!.toString(),
                    data.bloodStockInstitutions![1].stock!.toString()),
                boxBloodInformation(
                    context,
                    "B",
                    data.bloodStockInstitutions![2].stock!.toString(),
                    data.bloodStockInstitutions![3].stock!.toString()),
                boxBloodInformation(
                    context,
                    "AB",
                    data.bloodStockInstitutions![4].stock!.toString(),
                    data.bloodStockInstitutions![5].stock!.toString()),
                boxBloodInformation(
                    context,
                    "O",
                    data.bloodStockInstitutions![6].stock!.toString(),
                    data.bloodStockInstitutions![7].stock!.toString()),
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
              data.addressInstitutions!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: AppText.textMedium
                  .copyWith(color: AppColor.cBlack, fontWeight: AppText.normal),
            ),
            const SizedBox(height: 30.0),
            Text(
              'Kontak',
              style: AppText.textMedium.copyWith(
                  color: AppColor.cBlack, fontWeight: AppText.semiBold),
            ),
            const SizedBox(height: 15.0),
            Text(
              data.contactInstitutions!,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: AppText.textMedium
                  .copyWith(color: AppColor.cBlack, fontWeight: AppText.normal),
            ),
            Row(
              children: [
                Expanded(child: Container()),
                InkWell(
                  child: Text(
                    'Donor di sini',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cRed, fontWeight: AppText.semiBold),
                  ),
                  onTap: () {
                    if (profileController
                            .profile.value.bloodTypeDonators.isBlank! ||
                        profileController.profile.value.bloodTypeDonators ==
                            null ||
                        profileController
                            .profile.value.bloodRhesusDonators.isBlank! ||
                        profileController.profile.value.bloodRhesusDonators ==
                            null) {
                      Get.back();
                      Get.snackbar(
                        "Lengkapi Data",
                        "Lengkapi data di menu profile",
                        duration: const Duration(seconds: 2),
                      );
                    } else {
                      Get.offNamed(Routes.donor, arguments: [
                        "${data.idInstitutions}",
                        "${data.nameInstitutions}"
                      ]);
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  boxBloodInformation(BuildContext context, String bloodType,
      String rhesusPositive, String rhesusNegative) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 3.7,
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
              child: Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reshusInformation(Icons.add, rhesusPositive),
                    reshusInformation(Icons.remove, rhesusNegative),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  reshusInformation(IconData icon, String stock) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Icon(
            icon,
            size: 15,
            color: AppColor.cRed,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            stock,
            style: AppText.textSemiLarge
                .copyWith(color: AppColor.white, fontWeight: AppText.semiBold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
