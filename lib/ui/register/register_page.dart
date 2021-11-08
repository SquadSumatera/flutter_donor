import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/register/register_widget.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  //late final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 38.0,
              width: 101,
              margin: const EdgeInsets.only(top: 82, bottom: 8.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/bitmap/logo.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Daftar",
              style: AppText.textLarge.copyWith(
                fontWeight: AppText.semiBold,
                color: AppColor.cBlack,
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  RegisterWidget(
                    hintText: "Masukan Nama",
                    labelText: "Nama",
                    maxLength: 33,
                    inputType: TextInputType.name,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Nama is Required';
                      }
                      return null;
                    },
                    onSaved: (String? value) {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
