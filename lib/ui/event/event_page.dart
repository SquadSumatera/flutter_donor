import 'package:flutter/material.dart';
import 'package:flutter_donor/ui/event/event_card_large_widget.dart';
import '../../shared/theme.dart';

class EventPage extends StatelessWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Event",
          style: AppText.textSemiLarge
              .copyWith(color: AppColor.white, fontWeight: AppText.semiBold),
        ),
        backgroundColor: AppColor.cRed,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, top: 21.0),
            child: Text(
              "Terbaru",
              style: AppText.textSemiLarge
                  .copyWith(color: AppColor.ckBlue, fontWeight: AppText.bold),
            ),
          ),
          const EventCardWidgetLarge(),
        ],
      ),
    );
  }
}
