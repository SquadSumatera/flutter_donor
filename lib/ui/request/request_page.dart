import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  State<RequestPage> createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();
  TextEditingController rhesusTypeController = TextEditingController();
  TextEditingController kumorbidController = TextEditingController();
  TextEditingController notesController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    'NIK Penerima',
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
                    controller: nikController,
                    decoration: InputDecoration(
                      hintText: "Masukkan NIK Penerima donor",
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
                  child: TextField(
                    controller: bloodTypeController,
                    decoration: InputDecoration(
                      hintText: "Pilih tipe darah penerima",
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
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Pilih tipe rhesus penerima",
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
                    'Kumorbid',
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
                    controller: kumorbidController,
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
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Catatan',
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
                    controller: notesController,
                    decoration: InputDecoration(
                      hintText: "Masukkan catatan, jika ada",
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
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.cRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Text(
                        "Daftar",
                        style: AppText.textMedium.copyWith(
                            color: AppColor.white,
                            fontWeight: AppText.semiBold),
                      ),
                      onPressed: () async {
                      },
                    ),
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }
}
