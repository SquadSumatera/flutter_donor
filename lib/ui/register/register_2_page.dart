// import 'package:flutter/material.dart';
// import 'package:flutter_donor/get_x/state/register_goldar_getx.dart';
// import 'package:flutter_donor/get_x/state/register_resus_getx.dart';
// import 'package:flutter_donor/routes/app_pages.dart';
// import 'package:flutter_donor/shared/theme.dart';
// import 'package:flutter_donor/ui/register/register_widget.dart';
// import 'package:get/get.dart';

//Noted Not Used, unComment to User this feature

// class RegisterPage2 extends StatelessWidget {
//   const RegisterPage2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.symmetric(horizontal: 25),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               headerLogo(),
//               namePage("Pilih Golongan Darah"),
//               const SizedBox(height: 50),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GolDarButton(type: "A", i: 0),
//                   GolDarButton(type: "B", i: 1),
//                 ],
//               ),
//               const SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   GolDarButton(type: "C", i: 2),
//                   GolDarButton(type: "D", i: 3),
//                 ],
//               ),
//               const SizedBox(
//                 height: 30.0,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ResusButton(type: "+", i: 0),
//                   ResusButton(type: "-", i: 1),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50.0,
//               ),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   fixedSize: Size(
//                     MediaQuery.of(context).size.width - 50,
//                     38.0,
//                   ),
//                   primary: AppColor.cRed,
//                   shadowColor: AppColor.cGrey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                   textStyle: AppText.textMedium.copyWith(
//                     fontSize: 14.0,
//                     color: AppColor.white,
//                     fontWeight: AppText.semiBold,
//                   ),
//                 ),
//                 onPressed: () {
//                   Get.toNamed(Routes.register3);
//                 },
//                 child: const Text(
//                   "Lanjut",
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
