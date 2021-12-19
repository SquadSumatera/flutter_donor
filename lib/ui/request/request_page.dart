import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/request_controller.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/models/donor_request_model.dart';
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/services/donor_services.dart';
import 'package:flutter_donor/services/institution_services.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/request/request_letter_widget.dart';
import 'package:flutter_donor/ui/request/request_popup_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController applicantController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController ktpController = TextEditingController();
  TextEditingController letterController = TextEditingController();

  late File selectedKtp;

  final LoginGetX loginGetX = Get.find<LoginGetX>();
  final RequestController requestGetX = Get.put(RequestController());

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
          'Request Plasma',
          style: AppText.textMedium.copyWith(fontWeight: AppText.semiBold),
        ),
        titleSpacing: 0,
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(36, 30, 0, 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  "assets/vector/ic_title.svg",
                  width: 88.0,
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  'Form Permohonan Plasma',
                  style: AppText.textSemiLarge.copyWith(
                    color: AppColor.cDarkBlue,
                    fontWeight: AppText.semiBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Nama Lengkap Penerima',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  width: 300,
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Nama Penerima Donor",
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Nama Lengkap Pemohon',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  width: 300,
                  child: TextField(
                    controller: applicantController,
                    decoration: InputDecoration(
                      hintText: "Masukkan Nama Lengkap Pemohon",
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Tipe Darah',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  width: 300,
                  child: DropdownSearch<String>(
                    dropDownButton: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: AppColor.cRed,
                    ),
                    showAsSuffixIcons: true,
                    showSearchBox: false,
                    mode: Mode.DIALOG,
                    showSelectedItems: false,
                    items: ['A', 'B', 'AB', 'O'],
                    onChanged: (data) {
                      requestGetX.changeDataBlood(data);
                      print(data);
                    },
                    dropdownSearchBaseStyle:
                        const TextStyle(color: AppColor.rubyRed),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Pilih tipe darah penerima",
                      hintStyle: AppText.textMedium.copyWith(
                          color: AppColor.cGrey, fontWeight: AppText.normal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Tipe Rhesus',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  width: 300,
                  child: DropdownSearch<String>(
                    dropDownButton: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 24,
                      color: AppColor.cRed,
                    ),
                    showAsSuffixIcons: true,
                    showSearchBox: false,
                    mode: Mode.DIALOG,
                    showSelectedItems: false,
                    items: ['+', '-'],
                    onChanged: (data) {
                      if (data == '+') {
                        requestGetX.changeDataRhesus("positive");
                      } else if (data == '-') {
                        requestGetX.changeDataRhesus("negative");
                      }

                      print(data);
                    },
                    dropdownSearchBaseStyle:
                        const TextStyle(color: AppColor.rubyRed),
                    dropdownSearchDecoration: InputDecoration(
                      hintText: "Pilih tipe rhesus penerima",
                      hintStyle: AppText.textMedium.copyWith(
                          color: AppColor.cGrey, fontWeight: AppText.normal),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Jumlah',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  width: 300,
                  child: TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Masukkan kumorbid penerima, jika ada",
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 18.0),
                  child: Text(
                    'Lokasi Pendonor',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: SizedBox(
                      width: 300,
                      child: DropdownSearch<Datum?>(
                        dropDownButton: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 24,
                          color: AppColor.cRed,
                        ),
                        showSearchBox: true,
                        mode: Mode.BOTTOM_SHEET,
                        showSelectedItems: false,
                        onFind: (String? filter) async {
                          return await InstitutionServices.listInstitution(
                              token: loginGetX.token.value);
                        },
                        onChanged: (data) {
                          requestGetX
                              .changeDataInstituion(data!.idInstitutions);
                          print(data.idInstitutions);
                        },
                        itemAsString: (data) => data!.nameInstitutions!,
                        showAsSuffixIcons: true,
                        dropdownSearchBaseStyle:
                            TextStyle(color: AppColor.rubyRed),
                        dropdownSearchDecoration: InputDecoration(
                          hintText: "Pilih Lokasi PMI Terdekat",
                          hintStyle: AppText.textMedium.copyWith(
                              color: AppColor.cGrey,
                              fontWeight: AppText.normal),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 18.0),
                  child: Text(
                    'KTP',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  width: 300,
                  child: TextField(
                    controller: ktpController,
                    showCursor: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: "Lampirkan KTP",
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
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['jpeg', 'jpg', 'png', 'pdf'],
                      );

                      if (result != null) {
                        File file = File(result.files.single.path!);
                        setState(() {
                          selectedKtp = file;
                          ktpController.text = result.files.first.name;
                        });
                      } else {
                        // User canceled the picker
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 18.0),
                  child: Text(
                    'Surat Pendamping',
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    left: 18.0,
                  ),
                  child: Obx(
                    () => ListView.builder(
                      primary: requestGetX.dontChange.value,
                      shrinkWrap: true,
                      itemCount: requestGetX.listDocs.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RequestLetterWidget(
                          index: index,
                          type: requestGetX.listDocs[index].type,
                          fileName: requestGetX.listDocs[index].fileName,
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 18.0, top: 20),
                  width: 60,
                  height: 30,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.cGreen,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                      onPressed: () async {
                        // FilePickerResult? result =
                        //     await FilePicker.platform.pickFiles(
                        //   type: FileType.custom,
                        //   allowedExtensions: ['jpeg', 'jpg', 'png', 'pdf'],
                        // );
                        //
                        // if (result != null) {
                        //   File file = File(result.files.single.path!);
                        //   requestGetX.addListDocs("type", result.files.first.name, file);
                        // } else {
                        //   // User canceled the picker
                        // }
                        showDialog(
                            context: context,
                            builder: (context) => RequestPopupWidget());
                      },
                      child: const Icon(
                        Icons.add,
                        color: AppColor.white,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 15),
                  width: 300,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.cRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Text(
                      "Ajukan",
                      style: AppText.textMedium.copyWith(
                          color: AppColor.white, fontWeight: AppText.semiBold),
                    ),
                    onPressed: () async {
                      if (nameController.text.isEmpty ||
                          applicantController.text.isEmpty ||
                          requestGetX.blood.value.isEmpty ||
                          requestGetX.rhesus.value.isEmpty ||
                          quantityController.text.isEmpty ||
                          requestGetX.instituion.value.isEmpty ||
                          ktpController.text.isEmpty) {
                        Get.snackbar(
                          "Data belum diisi",
                          "Harap mengisi data yang tersedia",
                          duration: const Duration(seconds: 2),
                        );
                      } else {
                        DonorRequestModel response =
                            await DonorServices.createDonorRequest(
                                token: loginGetX.token.value,
                                id_institutions: requestGetX.instituion.value,
                                recipient: nameController.text,
                                applicant: applicantController.text,
                                blood_type: requestGetX.blood.value,
                                blood_rhesus: requestGetX.rhesus.value,
                                quantity: quantityController.text,
                                ktp: selectedKtp,
                                docs: requestGetX.listDocs);

                        // if (response.status == 200) {
                        //   Get.offAllNamed(Routes.main);
                        // }

                        Get.snackbar(
                          "${response.message}",
                          "${response.status}",
                          duration: const Duration(seconds: 2),
                        );
                      }
                    },
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
