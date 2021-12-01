import 'package:flutter/material.dart';
import '../../models/dummy_event_model.dart';
import '../../shared/theme.dart';

Widget eventCardMedium(EventDetailModel eventDetail) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
    height: 69.0,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: AppColor.cBlack.withOpacity(0.2),
          blurRadius: 4.0,
          offset: const Offset(0, 2),
        )
      ],
      color: AppColor.cLightGrey,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, top: 5.0, bottom: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                eventDetail.name + " Judul",
                overflow: TextOverflow.clip,
                style: AppText.textSmall.copyWith(
                  fontWeight: AppText.medium,
                  color: AppColor.cBlack,
                ),
              ),
              Text(
                eventDetail.desc + "Sub Judul",
                style: AppText.textSmall.copyWith(
                  fontWeight: AppText.normal,
                  color: AppColor.cBlue,
                  fontSize: 9.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 69.0,
          width: 84.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
            ),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                eventDetail.image,
              ),
            ),
          ),
          child: null,
        ),
      ],
    ),
  );
}

Widget eventCardLarge() {
  return LayoutBuilder(
    builder: (context, constrain) => Container(
      margin: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
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
          Text(
            MediaQuery.of(context).size.width.toString(),
          ),
        ],
      ),
    ),
  );
}
