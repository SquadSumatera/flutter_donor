import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/profile_controller.dart';
import 'package:get/get.dart';
import '../widgets/history_as_button.dart';
import '../widgets/history_list_container.dart';
import '../../../../shared/theme.dart';

class HistorySection extends StatefulWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  _HistorySectionState createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cultured,
              borderRadius: BorderRadius.circular(10),
              boxShadow: AppShadow.medium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Sampai saat ini, telah mendapatkan 0 poin donor.',
                style: AppText.textSmall.copyWith(
                  color: AppColor.imperialRed,
                  fontWeight: AppText.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      HistoryAsButton(
                        label: 'Sebagai pemohon',
                        icon: Icons.find_replace,
                        active: true,
                      ),
                      SizedBox(height: 25),
                      HistoryAsButton(
                        label: 'Sebagai Pendonor',
                        icon: Icons.volunteer_activism_outlined,
                        active: false,
                      ),
                    ],
                  ),
                  const SizedBox(width: 13),
                  const Expanded(
                    child: HistoryListContainer(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: -5,
          right: 5,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColor.imperialRed,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                '${profileController.profile!.bloodTypeDonators}${profileController.profile!.showRhesus}',
                style: AppText.textMedium.copyWith(
                  color: AppColor.white,
                  fontWeight: AppText.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


