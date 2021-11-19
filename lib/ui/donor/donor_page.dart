import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
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
                  child: DropdownSearch<String>(
                    showSearchBox: true,
                    mode: Mode.BOTTOM_SHEET,
                    showSelectedItems: true,
                    items: ["Brazil", "Italia", "Tunisia", 'Canada'],
                    onChanged: print,
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
                              firstDate: DateTime(1945),
                              lastDate: DateTime.now())
                          .then((date) {
                        setState(() {
                          dateController.text =
                              "${date!.day}-${date.weekday}-${date.year}";
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
                    child:
                        ElevatedButton(child: Text('Kirim'), onPressed: () {}),
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
