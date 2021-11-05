import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';

class SettingsItemTile extends StatelessWidget {
  const SettingsItemTile({
    Key? key,
    required this.icon,
    required this.label,
    required this.callback,
    this.backgroundColor = AppColor.white,
    this.textColor = AppColor.richBlack,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback callback;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: AppColor.lightGrey,
          primary: backgroundColor,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: AppColor.cultured,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: textColor,
              size: 20.0,
            ),
            const SizedBox(width: 13.0),
            Expanded(
              child: Text(
                label,
                style: AppText.textNormal.copyWith(
                  fontWeight: AppText.semiBold,
                  color: textColor,
                ),
              ),
            ),
          ],
        ),
        onPressed: callback,
      ),
    );
  }
}