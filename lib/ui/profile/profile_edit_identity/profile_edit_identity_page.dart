import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile_main/widgets/profile_header.dart';
import '../../../shared/theme.dart';
import 'sections/identity_choice_section.dart';

// for dev purposes
enum DummyPeopleGender {
  male,
  female,
}

class DummyPeople {
  DummyPeopleGender gender = DummyPeopleGender.male;
  String bloodType = "A";
  String rhesusType = "+";
}

class ProfileEditIdentityPage extends StatefulWidget {
  const ProfileEditIdentityPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditIdentityPage> createState() =>
      _ProfileEditIdentityPageState();
}

class _ProfileEditIdentityPageState extends State<ProfileEditIdentityPage> {
  DummyPeople people = DummyPeople();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const ProfileHeader(),
          const SizedBox(height: 27),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.arrow_back,
                  size: 24,
                  color: AppColor.imperialRed,
                ),
                const SizedBox(width: 10),
                Text(
                  "Kembali",
                  style: AppText.textMedium.copyWith(
                    color: AppColor.imperialRed,
                    fontWeight: AppText.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 27),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFA4161A),
                  const Color(0xFFDC2626).withOpacity(0.65),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Identitas Pribadi",
                  style: AppText.textMedium.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.bold,
                  ),
                ),
                const SizedBox(height: 10),
                IdentityChoiceSection(
                  title: "Jenis Kelamin",
                  choices: const <String, dynamic>{
                    "Pria": DummyPeopleGender.male,
                    "Wanita": DummyPeopleGender.female,
                  },
                  groupValue: people.gender,
                  onChanged: (val) {
                    people.gender = val;
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
                        groupValue: people.bloodType,
                        onChanged: (val) {
                          people.bloodType = val;
                          setState(() {});
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IdentityChoiceSection(
                        title: "Rhesus",
                        choices: const <String, dynamic>{
                          "+": "+",
                          "-": "-",
                        },
                        groupValue: people.rhesusType,
                        onChanged: (val) {
                          people.rhesusType = val;
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.8,
                    45,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  primary: AppColor.imperialRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  'Simpan',
                  style: AppText.textNormal.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.semiBold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

