import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

class HistoryTileItem extends StatelessWidget {
  const HistoryTileItem({
    Key? key,
    required this.title,
    required this.statusText,
    required this.dateText,
    required this.color,
    required this.callback,
  }) : super(key: key);

  final String title;
  final String statusText;
  final String dateText;
  final Color color;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              title,
              style: AppText.textSmall.copyWith(
                color: AppColor.white,
                fontWeight: AppText.bold,
              ),
            ),
            const SizedBox(height: 5),
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  dateText,
                  style: AppText.textExtraSmall.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.normal,
                  ),
                ),
                Text(
                  statusText,
                  style: AppText.textSmall.copyWith(
                    color: AppColor.white,
                    fontWeight: AppText.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
