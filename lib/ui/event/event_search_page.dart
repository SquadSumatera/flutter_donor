import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_donor/shared/theme.dart';

class EventSearchPage extends StatelessWidget {
  EventSearchPage({Key? key}) : super(key: key);
  final InputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(
      color: Color(0xFF5B5770),
      width: 1.0,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.cRed,
        title: Text(
          "Event",
          style: AppText.textMedium.copyWith(
            fontWeight: AppText.bold,
            color: AppColor.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 15.0,
          ),
          onPressed: () {
            Get.back();
          },
          color: AppColor.white,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            // controller: controller,
            initialValue: "Cari",
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              enabledBorder: _inputBorder,
              errorBorder: _inputBorder,
              focusedErrorBorder: _inputBorder,
              focusedBorder: _inputBorder,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              labelText: "Masukkan ...",
              contentPadding: const EdgeInsets.all(18.0),
              suffixIcon: IconButton(
                onPressed: () {
                  // valueSetter(controller.text);
                },
                icon: const Icon(Icons.search),
              ),
            ),
            onFieldSubmitted: (val) {
              // valueSetter(val);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
