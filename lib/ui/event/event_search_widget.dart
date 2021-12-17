import 'package:flutter/material.dart';
import 'package:flutter_donor/get_x/controller/event_search_controller.dart';
import 'package:get/get.dart';

final InputBorder _inputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20.0),
  borderSide: const BorderSide(
    color: Color(0xFF5B5770),
    width: 1.0,
  ),
);

Widget searchField() {
  final EventSearchController searchController =
      Get.find<EventSearchController>();
  return TextFormField(
    controller: searchController.searchController,
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
          searchController.getSearchData(
            searchController.searchController.text,
          );
        },
        icon: const Icon(Icons.search),
      ),
    ),
    onFieldSubmitted: (val) {
      searchController.getSearchData(val);
    },
  );
}
