import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget trend() {
  return Container(
    margin: const EdgeInsets.only(
      top: 16.0,
      right: 32.0,
      left: 32.0,
      bottom: 24.0,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Trend Donor Plasma",
          style: AppText.textMedium.copyWith(
            fontWeight: AppText.bold,
            color: AppColor.cDarkBlue,
          ),
        ),
        const SizedBox(
          height: 8.0,
        ),
        AspectRatio(
          aspectRatio: 1.70,
          child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColor.cGrey,
                  blurRadius: 4.0,
                  offset: Offset(0, 4),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
              color: AppColor.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 18.0, left: 12.0, top: 24, bottom: 12),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

List<Color> gradientColors = [
  const Color(0xFFE84545),
  const Color(0xFFE84545),
];

LineChartData mainData() {
  return LineChartData(
    backgroundColor: AppColor.white,
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: AppColor.cGrey,
          strokeWidth: 1,
        );
      },
      getDrawingVerticalLine: (value) {
        return FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 0,
        );
      },
    ),
    titlesData: FlTitlesData(
      show: true,
      rightTitles: SideTitles(showTitles: false),
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        interval: 1,
        getTextStyles: (context, value) => AppText.textMedium.copyWith(
          color: AppColor.cGrey,
          fontWeight: AppText.bold,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 2:
              return 'MAR';
            case 5:
              return 'JUN';
            case 8:
              return 'SEP';
          }
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => AppText.textMedium.copyWith(
          color: AppColor.cGrey,
          fontWeight: AppText.bold,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 1:
              return '10k';
            case 3:
              return '30k';
            case 5:
              return '50k';
          }
          return '';
        },
        reservedSize: 32,
        margin: 12,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: AppColor.cRed, width: 0),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 5),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3),
          FlSpot(11, 4),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      ),
    ],
  );
}
