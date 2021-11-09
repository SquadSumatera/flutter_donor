import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/state/register_goldar_getx.dart';
import 'package:flutter_donor/ui/register/register_widget.dart';
import 'package:get/get.dart';

import 'register_header.dart';

class RegisterPage2 extends StatelessWidget {
  RegisterPage2({Key? key}) : super(key: key);

  final RegisterGolDarGetX golDarGetXPage = Get.put(RegisterGolDarGetX());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerLogo(),
              namePage("Pilih Golongan Darah"),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GolDarButton(type: "A", i: 0),
                  GolDarButton(type: "B", i: 1),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GolDarButton(type: "C", i: 2),
                  GolDarButton(type: "D", i: 3),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
