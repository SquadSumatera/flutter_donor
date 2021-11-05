import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../profile_main/profile_header.dart';
import '../../../shared/theme.dart';

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

class IdentityChoiceSection extends StatefulWidget {
  const IdentityChoiceSection({
    Key? key,
    required this.title,
    required this.onChanged,
    required this.groupValue,
    required this.choices,
  }) : super(key: key);

  final String title;
  final Function onChanged;
  final dynamic groupValue;
  final Map<String, dynamic> choices;

  @override
  State<IdentityChoiceSection> createState() => _IdentityChoiceSectionState();
}

class _IdentityChoiceSectionState extends State<IdentityChoiceSection> {
  List<Widget> _buildChoices() {
    return widget.choices.keys.map((String choice) {
      return GestureDetector(
        onTap: () => widget.onChanged(widget.choices[choice]),
        child: IdentityChoiceItem(
          label: choice,
          active: (widget.groupValue == widget.choices[choice]),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          widget.title,
          style: AppText.textNormal.copyWith(
            color: AppColor.white,
            fontWeight: AppText.bold,
          ),
        ),
        const SizedBox(height: 10),
        Wrap(
          runSpacing: 10,
          children: _buildChoices(),
        ),
      ],
    );
  }
}

class IdentityChoiceItem extends StatelessWidget {
  const IdentityChoiceItem({
    Key? key,
    required this.label,
    required this.active,
  }) : super(key: key);

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: (active) ? AppColor.imperialRed : AppColor.white,
        boxShadow: AppShadow.medium,
      ),
      child: Text(
        label,
        style: AppText.textNormal.copyWith(
          color: (active) ? AppColor.white : AppColor.imperialRed,
          fontWeight: AppText.bold,
        ),
      ),
    );
  }
}
