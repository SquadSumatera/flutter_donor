import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/request_controller.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

class RequestPopupWidget extends StatefulWidget {
  RequestPopupWidget({Key? key}) : super(key: key);

  @override
  State<RequestPopupWidget> createState() => _RequestPopupWidgetState();
}

class _RequestPopupWidgetState extends State<RequestPopupWidget> {
  final RequestController requestGetX = Get.find();

  TextEditingController typeControlller = TextEditingController();
  TextEditingController docCOntroller = TextEditingController();

  late File selectedDoc;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: renderDialog(context),
    );
  }

  renderDialog(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 32, 16, 16),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0.0, 10.0))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tambahkan dokument",
                    style: AppText.textMedium.copyWith(
                        color: AppColor.cDarkBlue,
                        fontWeight: AppText.semiBold),
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
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 250,
                child: TextField(
                  controller: typeControlller,
                  decoration: InputDecoration(
                    hintText: "Masukkan jenis dokumen",
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
              SizedBox(
                width: 250,
                child: TextField(
                  controller: docCOntroller,
                  showCursor: false,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Tambahkan dokument",
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
                        selectedDoc = file;
                        docCOntroller.text = result.files.first.name;
                      });
                    } else {
                      // User canceled the picker
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColor.cOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    if (typeControlller.text.isEmpty ||
                        docCOntroller.text.isEmpty) {
                      Get.snackbar(
                        "Data belum diisi",
                        "Harap mengisi data yang tersedia",
                        duration: const Duration(seconds: 2),
                      );
                    } else {
                      requestGetX.addListDocs(typeControlller.text,
                          docCOntroller.text, selectedDoc);
                      Get.back();
                    }
                  },
                  child: Text(
                    "Tambahkan",
                    style: AppText.textMedium.copyWith(
                        color: AppColor.white, fontWeight: AppText.semiBold),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
