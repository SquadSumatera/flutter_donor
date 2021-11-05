import 'package:flutter/material.dart';
import '../../../../shared/theme.dart';
import 'history_tile_item.dart';

class HistoryListContainer extends StatelessWidget {
  const HistoryListContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 200),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadow.medium,
      ),
      child: ListView(
        shrinkWrap: true,
        children: const <Widget>[
          HistoryTileItem(
            title: "Memohon Golongan Darah Tipe A+",
            statusText: "Menunggu Persetujuan",
            dateText: "29/10/2021",
            color: AppColor.imperialRed,
          ),
          HistoryTileItem(
            title: "Memohon Golongan Darah Tipe A+",
            statusText: "Menunggu Persetujuan",
            dateText: "29/10/2021",
            color: AppColor.imperialRed,
          ),
          HistoryTileItem(
            title: "Memohon Golongan Darah Tipe A+",
            statusText: "Menunggu Persetujuan",
            dateText: "29/10/2021",
            color: AppColor.bloodRed,
          ),
          HistoryTileItem(
            title: "Memohon Golongan Darah Tipe A+",
            statusText: "Menunggu Persetujuan",
            dateText: "29/10/2021",
            color: AppColor.rubyRed,
          ),
        ],
      ),
    );
  }
}
