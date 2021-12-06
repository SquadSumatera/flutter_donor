import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_donor/get_x/controller/donor_controller.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
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
  final ProfileController profileController = Get.find();
  List<String>? institutionData;
  String? uuid;
  String? institutionName;
  TextEditingController dateController = TextEditingController();

  final LoginGetX loginGetX = Get.find<LoginGetX>();
  final DonorController donorGetX = Get.put(DonorController());

  @override
  void initState() {
    institutionData = Get.arguments;
    uuid = institutionData?[0];
    institutionName = institutionData?[1];
    print("uuid : $uuid");
    print("institutionName : $institutionName");
    super.initState();
  }

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
                  'Form Pengajuan Donor',
                  style: AppText.textSemiLarge.copyWith(
                    color: AppColor.cDarkBlue,
                    fontWeight: AppText.semiBold,
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
                    child: (uuid == null)
                        ? DropdownSearch<Datum?>(
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
                            itemAsString: (data) => data!.nameInstitutions!,
                            onChanged: (data) {
                              donorGetX
                                  .changeDataInstituion(data!.idInstitutions);
                              print(data.idInstitutions);
                            },
                            showAsSuffixIcons: true,
                            dropdownSearchBaseStyle:
                                TextStyle(color: AppColor.rubyRed),
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Pilih Lokasi Pendonoran Terdekat",
                              hintStyle: AppText.textMedium.copyWith(
                                  color: AppColor.cGrey,
                                  fontWeight: AppText.normal),
                            ),
                          )
                        : DropdownSearch<String>(
                            enabled: false,
                            showSearchBox: false,
                            mode: Mode.BOTTOM_SHEET,
                            showSelectedItems: false,
                            selectedItem: institutionName,
                            items: ["${institutionName}"],
                            dropdownSearchBaseStyle:
                                TextStyle(color: AppColor.rubyRed),
                            dropdownSearchDecoration: InputDecoration(
                              hintText: "Pilih Lokasi Pendonoran Terdekat",
                              hintStyle: AppText.textMedium.copyWith(
                                  color: AppColor.cGrey,
                                  fontWeight: AppText.normal),
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, left: 18.0),
                  child: Text(
                    'Jadwal Donor Plasma',
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
                        suffixIcon: const Icon(
                          Icons.date_range_outlined,
                          size: 24.0,
                          color: AppColor.cRed,
                        )),
                    onTap: () {
                      showDatePicker(
                              builder: (context, child) {
                                return Theme(
                                  data: Theme.of(context).copyWith(
                                    colorScheme: const ColorScheme.light(
                                      primary: AppColor
                                          .cRed, // header background color
                                      onPrimary:
                                          AppColor.white, // header text color
                                      onSurface:
                                          AppColor.cRed, // body text color
                                    ),
                                    textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                        primary:
                                            Colors.red, // button text color
                                      ),
                                    ),
                                  ),
                                  child: child!,
                                );
                              },
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  child: Obx(
                    () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.cRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: donorGetX.dontChange.value
                          ? null
                          : Text(
                              "Daftar",
                              style: AppText.textMedium.copyWith(
                                  color: AppColor.white,
                                  fontWeight: AppText.semiBold),
                            ),
                      onPressed: () async {
                        if (dateController.text.isNotEmpty &&
                            donorGetX.dataInstitution.value.isNotEmpty) {
                          CreateDonorModel response =
                              await DonorServices.createDonorNotes(
                                  token: loginGetX.token.value,
                                  uuid: (donorGetX.dataInstitution.value),
                                  blood:
                                      "${profileController.profile!.bloodTypeDonators}",
                                  rhesus:
                                      "${profileController.profile!.bloodRhesusDonators}",
                                  date: dateController.text);

                          if (response.status == 200) {
                            Get.offAllNamed(Routes.main);
                          }

                          Get.snackbar(
                            "${response.message}",
                            "${response.status}",
                            duration: const Duration(seconds: 2),
                          );
                        } else if (dateController.text.isNotEmpty &&
                            uuid!.isNotEmpty) {
                          CreateDonorModel response =
                              await DonorServices.createDonorNotes(
                                  token: loginGetX.token.value,
                                  uuid: uuid!,
                                  blood:
                                      "${profileController.profile!.bloodTypeDonators}",
                                  rhesus:
                                      "${profileController.profile!.bloodRhesusDonators}",
                                  date: dateController.text);

                          if (response.status == 200) {
                            Get.offAllNamed(Routes.main);
                          }

                          Get.snackbar(
                            "${response.message}",
                            "${response.status}",
                            duration: const Duration(seconds: 2),
                          );
                        } else {
                          Get.snackbar(
                            "Data belum diisi",
                            "Harap mengisi data yang tersedia",
                            duration: const Duration(seconds: 2),
                          );
                        }
                      },
                    ),
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
