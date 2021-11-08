import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_donor/models/dummy_event_model.dart';
import 'package:flutter_donor/shared/theme.dart';

class EventCardMedium extends StatelessWidget {
  const EventCardMedium({Key? key, required this.eventDetail})
      : super(key: key);

  final EventDetail eventDetail;

  @override
  Widget build(BuildContext context) {
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
}
