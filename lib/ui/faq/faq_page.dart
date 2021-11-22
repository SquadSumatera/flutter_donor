import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/faq_controller.dart';
import 'package:flutter_donor/models/faq_model.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/faq/faq_tile_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FAQPage extends StatelessWidget {
  FAQPage({Key? key}) : super(key: key);
  final FaqController faqController = Get.find();

  Widget _buildFaqList() {
    int idx = 1;
    List<Widget> _result = [];
    for (FaqModel faq in faqController.faqList) {
      _result.add(FAQTile(
        index: idx.toString(),
        title: faq.titleFaqs ?? "",
        content: faq.contentFaqs ?? "",
      ));
      idx++;
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _result,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/vector/ic_back.svg',
            width: 12,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
        title: Text(
          "FAQ",
          style: AppText.textSemiLarge.copyWith(
            color: AppColor.white,
            fontWeight: AppText.semiBold,
          ),
        ),
        backgroundColor: AppColor.cRed,
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: AppColor.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Frequently Asked Questions (FAQ)",
                  style: AppText.textSemiLarge.copyWith(
                    fontWeight: AppText.semiBold,
                  ),
                ),
                const SizedBox(height: 5),
                const Text(
                  "Ragam pertanyaan yang sering ditanyakan.",
                  style: AppText.textNormal,
                ),
                const SizedBox(height: 50),
                Obx(
                  () => (faqController.status.value == FaqLoadStatus.loaded)
                      ? _buildFaqList()
                      : (faqController.status.value == FaqLoadStatus.loading)
                          ? const Center(child: CircularProgressIndicator())
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                      "Terjadi Kesalahan, coba beberapa saat kembali."),
                                  TextButton(
                                    onPressed: () {
                                      faqController.onInit();
                                    },
                                    child: const Text("Coba Lagi"),
                                  ),
                                ],
                              ),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
