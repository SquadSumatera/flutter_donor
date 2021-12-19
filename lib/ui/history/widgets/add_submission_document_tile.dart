import 'package:flutter/material.dart';
import '../../../shared/theme.dart';

class AddSubmissionDocumentTile extends StatelessWidget {
  const AddSubmissionDocumentTile({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: AppShadow.medium,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.add_circle,
              color: AppColor.cBlue,
              size: 12,
            ),
            const SizedBox(width: 10),
            Text(
              (type == 'KTP') ? 'Lampirkan KTP' : 'Lampirkan Surat Pendukung',
              style: AppText.textSmall.copyWith(
                fontWeight: AppText.semiBold,
                color: AppColor.cBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
