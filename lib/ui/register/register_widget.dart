import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../get_x/state/register_getx.dart';
import '../../shared/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
// import 'package:flutter_donor/get_x/state/register_goldar_getx.dart';
// import 'package:flutter_donor/get_x/state/register_resus_getx.dart';

class RegisterWidget extends StatelessWidget {
  final String hintText;
  final String labelText;
  final int maxLength;
  final TextInputType inputType;
  final bool initial;
  final String initialText;
  final bool needObscure;
  final ValueChanged<String?> onSaved;
  final FormFieldValidator<String>? validator;

  RegisterWidget({
    Key? key,
    required this.hintText,
    required this.labelText,
    required this.maxLength,
    this.inputType = TextInputType.text,
    this.initial = false,
    this.initialText = "",
    required this.needObscure,
    required this.onSaved,
    this.validator,
  }) : super(key: key);

  List<TextInputFormatter> get _inputFormatters {
    List<TextInputFormatter> _formatters = <TextInputFormatter>[];
    switch (inputType.index) {
      case 3:
        _formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case 6:
        _formatters.add(FilteringTextInputFormatter.allow(RegExp(" ")));
        break;
      case 9:
        break;
    }
    return _formatters;
  }

  final RegisterController rControll = Get.find<RegisterController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        obscureText: rControll.dontChange.value
            ? true
            : needObscure
                ? rControll.obscure.value
                : false,
        initialValue: initial ? initialText : null,
        keyboardType: inputType,
        inputFormatters: _inputFormatters,
        decoration: InputDecoration(
          focusColor: AppColor.cRed,
          hoverColor: AppColor.cRed,
          fillColor: AppColor.cRed,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(color: AppColor.cRed),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: AppText.textMedium.copyWith(),
          floatingLabelStyle: AppText.textMedium.copyWith(color: AppColor.cRed),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          suffixIcon: needObscure
              ? GestureDetector(
                  onTap: () {
                    rControll.changeObscure();
                  },
                  child: Obx(
                    () => Icon(
                      rControll.obscure.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: AppColor.cRed,
                    ),
                  ),
                )
              : null,
        ),
        maxLength: maxLength,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}

Widget headerLogo() {
  return Container(
    margin: const EdgeInsets.only(top: 50, bottom: 8.0),
    child: SvgPicture.asset(
      "assets/vector/ic_title.svg",
      width: 101.0,
      height: 38.0,
      fit: BoxFit.cover,
    ),
  );
}

Widget namePage(String name) {
  return Text(
    name,
    style: AppText.textLarge.copyWith(
      fontWeight: AppText.semiBold,
      color: AppColor.cBlack,
    ),
  );
}

//Noted Not Used, unComment to User this feature

// class GolDarButton extends StatelessWidget {
//   GolDarButton({Key? key, required this.type, required this.i})
//       : super(key: key);
//   final String type;
//   final int i;
//   final RegisterGolDarGetX golDarGetX = Get.find<RegisterGolDarGetX>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => ElevatedButton(
//         onPressed: () {
//           golDarGetX.changeGoldar(i);
//           golDarGetX.changeTypeGoldar(type);
//         },
//         style: golDarGetX.golDar[i]
//             ? ElevatedButton.styleFrom(
//                 primary: AppColor.cDarkBlue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 minimumSize: const Size(137.0, 62),
//               )
//             : ElevatedButton.styleFrom(
//                 primary: AppColor.cLightGrey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 minimumSize: const Size(137.0, 62),
//               ),
//         child: Obx(
//           () => Text(
//             type,
//             textAlign: TextAlign.center,
//             style: golDarGetX.golDar[i]
//                 ? AppText.textLarge.copyWith(
//                     color: AppColor.white,
//                     fontWeight: AppText.semiBold,
//                   )
//                 : AppText.textLarge.copyWith(
//                     color: AppColor.cBlack,
//                     fontWeight: AppText.semiBold,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ResusButton extends StatelessWidget {
//   ResusButton({Key? key, required this.type, required this.i})
//       : super(key: key);
//   final String type;
//   final int i;

//   final RegisterResusGetX resusGetX = Get.find<RegisterResusGetX>();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => ElevatedButton(
//         onPressed: () {
//           resusGetX.changeResus(i);
//           resusGetX.changeTypeResus(type);
//         },
//         style: resusGetX.resus[i]
//             ? ElevatedButton.styleFrom(
//                 primary: AppColor.cDarkBlue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 minimumSize: const Size(62.0, 62),
//               )
//             : ElevatedButton.styleFrom(
//                 primary: AppColor.cLightGrey,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 minimumSize: const Size(62.0, 62),
//               ),
//         child: Obx(
//           () => Text(
//             type,
//             textAlign: TextAlign.center,
//             style: resusGetX.resus[i]
//                 ? AppText.textLarge.copyWith(
//                     color: AppColor.white,
//                     fontWeight: AppText.semiBold,
//                   )
//                 : AppText.textLarge.copyWith(
//                     color: AppColor.cBlack,
//                     fontWeight: AppText.semiBold,
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
