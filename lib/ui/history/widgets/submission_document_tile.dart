import 'package:flutter/material.dart';
import '../../../models/submission_history_model.dart';
import 'package:flutter_donor/shared/theme.dart';

class SubmissionDocumentTile extends StatelessWidget {
  const SubmissionDocumentTile({
    Key? key,
    required this.document,
    required this.readOnly,
  }) : super(key: key);

  final DocumentDonorSubmission document;
  final bool readOnly;

  Widget _buildTextButtonWithIcon({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
  }) {
    return Material(
      color: AppColor.white,
      child: InkWell(
        splashColor: color.withOpacity(0.2),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(text,
                  style: AppText.textSmall.copyWith(
                    fontWeight: AppText.semiBold,
                    color: color,
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: AppShadow.medium,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
              "${document.typeDocumentDonorSubmissions![0].toUpperCase()}${document.typeDocumentDonorSubmissions!.substring(1)}",
              style: AppText.textSmall.copyWith(
                fontWeight: AppText.bold,
              )),
          const SizedBox(height: 10),
          Text(
            document.fileNameDocumentDonorSubmissions ?? '-',
            style: AppText.textSmall,
          ),
          const SizedBox(height: 2),
          Material(
            color: AppColor.white,
            child: InkWell(
              splashColor: AppColor.cBlue.withOpacity(0.2),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Lihat Dokumen',
                    style: AppText.textSmall.copyWith(
                      fontWeight: AppText.bold,
                      color: AppColor.cBlue,
                    )),
              ),
            ),
          ),
          const SizedBox(height: 2),
          if (!readOnly)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildTextButtonWithIcon(
                  text: "Ganti Dokumen",
                  icon: Icons.edit,
                  onTap: () {},
                  color: AppColor.cGreen,
                ),
                _buildTextButtonWithIcon(
                  text: "Hapus Dokumen",
                  icon: Icons.delete_forever,
                  onTap: () {},
                  color: AppColor.cRed,
                ),
              ],
            ),
        ],
      ),
    );
  }
}
