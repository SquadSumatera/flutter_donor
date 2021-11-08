import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_donor/shared/theme.dart';

class EventCardWidgetLarge extends StatelessWidget {
  const EventCardWidgetLarge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
      height: 205.0,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.cBlack.withOpacity(0.18),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          )
        ],
        color: AppColor.cLightGrey,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 134.0,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/bitmap/header_bg.png",
                ),
              ),
            ),
            child: null,
          ),
          Text(MediaQuery.of(context).size.width.toString()),
        ],
      ),
    );
  }
}
