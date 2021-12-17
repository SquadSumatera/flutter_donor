import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_search_controller.dart';

final InputBorder _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  borderSide: const BorderSide(
    color: Color(0xFF5B5770),
    width: 1.0,
  ),
);

Widget searchField(EventSearchController searchController) {
  return TextFormField(
    controller: searchController.searchController,
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
  );
}
