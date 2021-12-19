import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../get_x/controller/submission_history_controller.dart';
import '../../../shared/theme.dart';

class AddSubmissionDocumentTile extends StatelessWidget {
  AddSubmissionDocumentTile({
    Key? key,
    required this.type,
  }) : super(key: key);

  final SubmissionHistoryController controller = Get.find();

  final String type;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () async {
          if (controller.documentStatus.value !=
              SubmissionDocumentLoadStatus.loading) {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpeg', 'jpg', 'png', 'pdf'],
            );
            if (result != null) {
              File file = File(result.files.single.path!);
              controller.createSubmissionDocument(type, file);
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            boxShadow: AppShadow.medium,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: <Widget>[
              (controller.documentStatus.value !=
                      SubmissionDocumentLoadStatus.loading)
                  ? const Icon(
                      Icons.add_circle,
                      color: AppColor.cBlue,
                      size: 12,
                    )
                  : const SizedBox(
                      width: 12,
                      height: 12,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColor.eerieBlack,
                      ),
                    ),
              const SizedBox(width: 10),
              (controller.documentStatus.value !=
                      SubmissionDocumentLoadStatus.loading)
                  ? Text(
                      (type == 'KTP')
                          ? 'Lampirkan KTP'
                          : 'Lampirkan Surat Pendukung',
                      style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColor.cBlue,
                      ),
                    )
                  : Text(
                      "Sedang mengunggah dokumen...",
                      style: AppText.textSmall.copyWith(
                        fontWeight: AppText.semiBold,
                        color: AppColor.cBlue,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
