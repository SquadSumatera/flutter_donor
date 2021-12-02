import 'package:flutter/material.dart';
import 'package:flutter_donor/models/institution_model.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/location/location_maps_dialog_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LocationListWidget extends StatelessWidget {
  final int index;
  final Datum data;
  const LocationListWidget({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: SvgPicture.asset(
            'assets/vector/ic_pin_fill.svg',
            width: 45,
            color: (index % 2 == 0) ? AppColor.cRed : AppColor.cOrange,
          ),
          title: Text(
            data.nameInstitutions!,
            style: AppText.textMedium.copyWith(
                fontWeight: AppText.normal, color: AppColor.cDarkBlue),
          ),
          subtitle: Text(
            data.addressInstitutions!,
            style: AppText.textNormal.copyWith(
                fontWeight: AppText.normal, color: AppColor.cDarkBlue),
          ),
          trailing: Text(
            '- Km',
            style: AppText.textNormal.copyWith(
                fontWeight: AppText.normal, color: AppColor.cDarkBlue),
          ),
          onTap: () {
            // Get.toNamed(Routes.locationDetail);
            showDialog(
              context: context,
              builder: (context) => LocationMapsDialogWidget(data: data),
            );
          },
        ),
        Container(
          width: double.maxFinite,
          height: 0.5,
          color: AppColor.cDarkBlue,
        )
      ],
    );
  }
}
