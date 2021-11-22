import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donor/get_x/controller/donor_controller.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/create_donor_model.dart';
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_donor/services/donor_services.dart';
import 'package:flutter_donor/services/institution_services.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DonorPage extends StatefulWidget {
  const DonorPage({Key? key}) : super(key: key);

  @override
  State<DonorPage> createState() => _DonorPageState();
}

class _DonorPageState extends State<DonorPage> {
  TextEditingController dateController = TextEditingController();

  final LoginGetX loginGetX = Get.find<LoginGetX>();
  final DonorController donorGetX = Get.put(DonorController());

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
          'Pendonor',
          style: AppText.textMedium.copyWith(fontWeight: AppText.semiBold),
        ),
        titleSpacing: 0,
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jadwal Pendonor Darah',
                  style: AppText.textSemiLarge.copyWith(
                      color: AppColor.cDarkBlue, fontWeight: AppText.semiBold),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Text(
                    'Lokasi Pendonor',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: DropdownSearch<Datum?>(
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    showSelectedItems: false,
                    onFind: (String? filter) async {
                      var a = await InstitutionServices.listInstitution(
                          token: loginGetX.token.value);
                      return a;
                    },
                    itemAsString: (data) => data!.nameInstitutions,
                    onChanged: (data) {
                      donorGetX.changeDataInstituion(data!.idInstitutions);
                      print(data.idInstitutions);
                    },
                    dropdownSearchBaseStyle: TextStyle(color: AppColor.rubyRed),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Pilih Lokasi Pendonoran Terdekat",
                      hintStyle: AppText.textMedium.copyWith(
                          color: AppColor.cGrey, fontWeight: AppText.normal),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  padding: EdgeInsets.only(top: 12),
                  child: TextField(
                    controller: dateController,
                    showCursor: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Tanggal",
                      border: const UnderlineInputBorder(),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      hintStyle: AppText.textMedium.copyWith(
                          color: AppColor.cGrey, fontWeight: AppText.normal),
                    ),
                    onTap: () {
                      showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2025))
                          .then((date) {
                        setState(() {
                          dateController.text =
                              "${date!.year}-${date.weekday}-${date.day}";
                        });
                      });
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 300,
                    child: Obx(() => ElevatedButton(
                          child:
                              donorGetX.dontChange.value ? null : Text("Kirim"),
                          onPressed: () async {
                            if (dateController.text.isNotEmpty &&
                                donorGetX.dataInstitution.value.isNotEmpty) {
                              CreateDonorModel response =
                                  await DonorServices.createDonorNotes(
                                      token: loginGetX.token.value,
                                      uuid: donorGetX.dataInstitution.value,
                                      blood: "O",
                                      rhesus: "positive",
                                      date: dateController.text);

                              print(loginGetX.token.value);
                              print(donorGetX.dataInstitution.value);

                              if (response.status == 200) {
                                Get.offAllNamed(Routes.main);
                                Get.snackbar(
                                  "${response.message}",
                                  "${response.status}",
                                  duration: const Duration(seconds: 2),
                                );
                              } else {
                                Get.snackbar(
                                  "${response.message}",
                                  "${response.status}",
                                  duration: const Duration(seconds: 2),
                                );
                              }
                            } else {
                              Get.snackbar(
                                "Data belum diisi",
                                "Harap mengisi data yang tersedia",
                                duration: const Duration(seconds: 2),
                              );
                            }
                          },
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
