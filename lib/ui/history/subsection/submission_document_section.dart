import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/history/widgets/add_submission_document_tile.dart';
import 'package:get/get.dart';
import '../../../get_x/controller/submission_history_controller.dart';
import '../../../models/submission_history_model.dart';
import '../../../shared/theme.dart';
import '../widgets/submission_document_tile.dart';

class SubmissionDocumentSection extends StatelessWidget {
  SubmissionDocumentSection({
    Key? key,
  }) : super(key: key);

  final SubmissionHistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Obx(() {
        List<DocumentDonorSubmission?>? documentDonorSubmissions =
            controller.selected?.value.documentDonorSubmissions;
        bool readOnly = controller.selected?.value.statusDonorSubmissions !=
                SubmissionHistoryStatus.conditionsRejected &&
            controller.selected?.value.statusDonorSubmissions !=
                SubmissionHistoryStatus.waitingConfirmation;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Dokumen Penyerta',
              style: AppText.textMedium.copyWith(
                fontWeight: AppText.bold,
              ),
            ),
            const SizedBox(height: 18),
            if (!readOnly)
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Text("Pastikan dokumen lengkap dan sesuai!",
                    style: AppText.textSmall.copyWith(
                      fontWeight: AppText.bold,
                      color: AppColor.imperialRed,
                    )),
              ),
            if (documentDonorSubmissions?.isNotEmpty ?? false)
              ...documentDonorSubmissions?.map((e) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SubmissionDocumentTile(
                        document: e ?? DocumentDonorSubmission(),
                        readOnly: readOnly,
                      ),
                    );
                  }).toList() ??
                  [],
            if (!(documentDonorSubmissions?.any((element) =>
                        element?.typeDocumentDonorSubmissions == 'KTP') ??
                    false) &&
                !readOnly)
              const Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: AddSubmissionDocumentTile(
                  type: 'KTP',
                ),
              ),
            if (!(documentDonorSubmissions?.any((element) =>
                        element?.typeDocumentDonorSubmissions == 'surat') ??
                    false) &&
                !readOnly)
              const Padding(
                padding: EdgeInsets.only(bottom: 18.0),
                child: AddSubmissionDocumentTile(
                  type: 'surat',
                ),
              ),
            if (controller.selected?.value.statusDonorSubmissions ==
                SubmissionHistoryStatus.conditionsRejected)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 18),
                  const Text(
                    'Pastikan dokumen sudah sesuai sebelum menekan tombol berikut!',
                    style: AppText.textSmall,
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.cRed,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {},
                    child: Center(
                      child: Text('Revisi Dokumen',
                          style: AppText.textMedium.copyWith(
                            color: AppColor.white,
                            fontWeight: AppText.semiBold,
                          )),
                    ),
                  ),
                ],
              ),
          ],
        );
      }),
    );
  }
}
