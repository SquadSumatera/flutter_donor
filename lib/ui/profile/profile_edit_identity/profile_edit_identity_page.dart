import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/login_getx.dart';
import 'package:flutter_donor/routes/app_pages.dart';
import 'package:flutter_svg/svg.dart';
import '../../../get_x/controller/profile_controller.dart';
import '../../../get_x/controller/profile_overlay_controller.dart';
import '../../../models/profile_model.dart';
import '../overlay/profile_overlay_section.dart';
import 'sections/confirm_change_identity.dart';
import 'package:get/get.dart';
import '../profile_main/widgets/profile_header.dart';
import '../../../shared/theme.dart';
import 'sections/identity_choice_section.dart';

class ProfileEditIdentityPage extends StatefulWidget {
  const ProfileEditIdentityPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditIdentityPage> createState() =>
      _ProfileEditIdentityPageState();
}

class _ProfileEditIdentityPageState extends State<ProfileEditIdentityPage> {
  ProfileController profileController = Get.find();
  LoginGetX loginGetXState = Get.find();
  ProfileOverlayController c = Get.put(ProfileOverlayController());
  late ProfileModel tempProfile;

  @override
  void initState() {
    super.initState();
    tempProfile = profileController.profile.value.copyWith();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/vector/ic_back.svg',
            width: 12,
          ),
          onPressed: () {
            profileController.status.value = ProfileLoadStatus.loaded;
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "Ubah Identitas",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.semiBold,
          ),
        ),
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: ListView(
        children: <Widget>[
          const ProfileHeader(),
          const SizedBox(height: 30),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 36,
            ),
            decoration: const BoxDecoration(
              color: AppColor.cultured,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Identitas Pribadi",
                  style: AppText.textMedium.copyWith(
                    color: AppColor.imperialRed,
                    fontWeight: AppText.bold,
                  ),
                ),
                const SizedBox(height: 10),
                IdentityChoiceSection(
                  title: "Jenis Kelamin",
                  choices: const <String, dynamic>{
                    "Pria": ProfileGenderType.male,
                    "Wanita": ProfileGenderType.female,
                  },
                  groupValue: tempProfile.genderDonators,
                  onChanged: (val) {
                    tempProfile.genderDonators = val;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: IdentityChoiceSection(
                        title: "Golongan Darah",
                        choices: const <String, dynamic>{
                          "A": "A",
                          "B": "B",
                          "O": "O",
                          "AB": "AB",
                        },
                        groupValue: tempProfile.bloodTypeDonators,
                        onChanged: (val) {
                          tempProfile.bloodTypeDonators = val;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: IdentityChoiceSection(
                        title: "Rhesus",
                        choices: const <String, dynamic>{
                          "+": ProfileRhesusType.positive,
                          "-": ProfileRhesusType.negative,
                        },
                        groupValue: tempProfile.bloodRhesusDonators,
                        onChanged: (val) {
                          tempProfile.bloodRhesusDonators = val;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (profileController.status.value !=
                      ProfileLoadStatus.updateLoading) {
                    Overlay.of(context)!.insert(
                      profileOverlaySection(
                        child: ConfirmChangeIdentity(
                          data: tempProfile,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    45,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  primary: AppColor.cRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Obx(() {
                  return (profileController.status.value ==
                          ProfileLoadStatus.updateLoading)
                      ? const CircularProgressIndicator(
                          color: AppColor.white,
                          strokeWidth: 2,
                        )
                      : Text(
                          (profileController.status.value ==
                                  ProfileLoadStatus.loaded)
                              ? "Simpan"
                              : (profileController.status.value ==
                                      ProfileLoadStatus.updated)
                                  ? "Berhasil Tersimpan"
                                  : "Terjadi Kesalahan, Coba Lagi",
                          style: AppText.textNormal.copyWith(
                            color: AppColor.white,
                            fontWeight: AppText.semiBold,
                          ),
                        );
                }),
              ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}
