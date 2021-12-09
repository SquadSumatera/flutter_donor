import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget onLoad() {
  return const Center(
    child: CircularProgressIndicator(
      color: AppColor.cBlack,
      strokeWidth: 5,
    ),
  );
}

Widget failed(VoidCallback onPressed) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Terjadi Kesalahan, coba beberapa saat kembali."),
        TextButton(
          onPressed: onPressed,
          child: const Text("Coba Lagi"),
        ),
      ],
    ),
  );
}
