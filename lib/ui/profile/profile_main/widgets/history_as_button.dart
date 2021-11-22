import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';

class HistoryAsButton extends StatelessWidget {
  const HistoryAsButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.active,
    required this.callback,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(17),
        decoration: BoxDecoration(
          color: (active) ? AppColor.imperialRed : AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AppShadow.medium,
        ),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: (active) ? AppColor.white : AppColor.imperialRed,
              size: 40,
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: AppText.textExtraSmall.copyWith(
                color: (active) ? AppColor.white : AppColor.imperialRed,
                fontWeight: AppText.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
