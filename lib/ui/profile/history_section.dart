import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class HistorySection extends StatefulWidget {
  const HistorySection({Key? key}) : super(key: key);

  @override
  _HistorySectionState createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColor.cultured,
          borderRadius: BorderRadius.circular(10),
          boxShadow: AppShadow.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Sampai saat ini, telah mendapatkan 0 poin donor.',
            style: AppText.textSmall.copyWith(
              color: AppColor.imperialRed,
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  HistoryAsButton(
                    label: 'Sebagai pemohon',
                    icon: Icons.find_replace,
                    active: true,
                  ),
                  SizedBox(height: 25),
                  HistoryAsButton(
                    label: 'Sebagai Pendonor',
                    icon: Icons.volunteer_activism_outlined,
                    active: false,
                  ),
                ],
              ),
              const SizedBox(width: 13),
              Expanded(
                child: HistoryListContainer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
            color: AppColor.imperialRed,
          ),
        ],
      ),
    );
  }
}

class HistoryTileItem extends StatelessWidget {
  const HistoryTileItem({
    Key? key,
    required this.title,
    required this.statusText,
    required this.dateText,
    required this.color,
  }) : super(key: key);

  final String title;
  final String statusText;
  final String dateText;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: AppText.textSmall.copyWith(
              color: AppColor.white,
              fontWeight: AppText.bold,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                dateText,
                style: AppText.textExtraSmall.copyWith(
                  color: AppColor.white,
                  fontWeight: AppText.normal,
                ),
              ),
              Text(
                statusText,
                style: AppText.textSmall.copyWith(
                  color: AppColor.white,
                  fontWeight: AppText.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}

class HistoryAsButton extends StatelessWidget {
  const HistoryAsButton({
    Key? key,
    required this.icon,
    required this.label,
    required this.active,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: (active) ? AppColor.imperialRed : AppColor.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadow.medium,
      ),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            color: (active) ? AppColor.white : AppColor.imperialRed,
            size: 40,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: AppText.textExtraSmall.copyWith(
              color: (active) ? AppColor.white : AppColor.imperialRed,
              fontWeight: AppText.bold,
            ),
          ),
        ],
      ),
    );
  }
}
