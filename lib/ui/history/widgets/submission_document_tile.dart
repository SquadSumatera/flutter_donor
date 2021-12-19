import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/submission_history_controller.dart';
import 'package:get/get.dart';
import '../../../models/submission_history_model.dart';
import 'package:flutter_donor/shared/theme.dart';

class SubmissionDocumentTile extends StatelessWidget {
  SubmissionDocumentTile({
    Key? key,
    required this.document,
    required this.readOnly,
  }) : super(key: key);

  final SubmissionHistoryController controller = Get.find();
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
          Obx(
            () => ((controller.documentStatus.value ==
                        SubmissionDocumentLoadStatus.loading) &&
                    (controller.currentProcessDocumentID.value ==
                        document.idDocumentDonorSubmissions))
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 18.0),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: AppColor.eerieBlack,
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        color: AppColor.white,
                        child: InkWell(
                          splashColor: AppColor.cBlue.withOpacity(0.2),
                          onTap: () {
                            if ((controller.documentStatus.value !=
                                SubmissionDocumentLoadStatus.loading)) {
                              controller.getSubmissionDocument(document);
                            }
                          },
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // _buildTextButtonWithIcon(
                            //   text: "Ganti Dokumen",
                            //   icon: Icons.edit,
                            //   onTap: () {},
                            //   color: AppColor.cGreen,
                            // ),
                            _buildTextButtonWithIcon(
                              text: "Hapus Dokumen",
                              icon: Icons.delete_forever,
                              onTap: () {
                                if (controller.documentStatus.value !=
                                    SubmissionDocumentLoadStatus.loading) {
                                  controller.deleteSubmissionDocument(document);
                                }
                              },
                              color: AppColor.cRed,
                            ),
                          ],
                        ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
