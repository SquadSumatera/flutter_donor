import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:flutter_donor/ui/location/location_maps_marker_widget.dart';

import 'location_list_widget.dart';

class LocationMapsPage extends StatelessWidget {
  const LocationMapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lokasi",
          style: AppText.textSemiLarge
              .copyWith(color: AppColor.white, fontWeight: AppText.semiBold),
        ),
        backgroundColor: AppColor.cRed,
      ),
      body: Stack(
        children: [
          LocationMapsMarkerWidget(),
          DraggableScrollableSheet(
            initialChildSize: 0.25,
            builder: (_, scrollController) {
              return Container(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: ListView(
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.location_on, size: 24,),
                            ),
                            fillColor: Color(0xFFE4E8F8),
                            hintText: "Search Lokasi",
                            contentPadding: EdgeInsets.only(bottom: 20, left: 20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColor.cGrey),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 25,
                        itemBuilder: (BuildContext context, int index) {
                          return LocationListWidget(
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
