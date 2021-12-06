import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/shared/theme.dart';

Widget trend() {
  return Container(
    margin: const EdgeInsets.only(
      top: 16.0,
      left: 30.0,
      right: 30.0,
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
          height: 12.0,
        ),
        AspectRatio(
          aspectRatio: 1.60,
          child: LineChart(
            mainData(),
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
        getTextStyles: (context, value) => AppText.textSmall.copyWith(
          color: AppColor.cDarkBlue,
          fontWeight: AppText.bold,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 0:
              return 'JAN';
            case 1:
              return 'FEB';
            case 2:
              return 'MAR';
            case 3:
              return 'APR';
            case 4:
              return 'MEI';
            case 5:
              return 'JUN';
            case 6:
              return 'JUL';
            case 7:
              return 'AGU';
            case 8:
              return 'SEP';
            case 9:
              return 'OKT';
            case 10:
              return 'NOV';
            case 11:
              return 'DES';
          }
          return '';
        },
        margin: 1,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        interval: 1,
        getTextStyles: (context, value) => AppText.textSmall.copyWith(
          color: AppColor.cDarkBlue,
          fontWeight: AppText.bold,
        ),
        getTitles: (value) {
          switch (value.toInt()) {
            case 20:
              return '20';
            case 40:
              return '40';
            case 60:
              return '60';
            case 80:
              return '80';
            case 100:
              return '100';
          }
          return '';
        },
        reservedSize: 32,
        margin: 1,
      ),
    ),
    borderData: FlBorderData(
      show: true,
      border: Border.all(color: AppColor.cRed, width: 0),
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 100,
    lineBarsData: [
      LineChartBarData(
        spots: const [
          FlSpot(0, 5),
          FlSpot(1, 10),
          FlSpot(2, 55),
          FlSpot(3, 23),
          FlSpot(4, 25),
          FlSpot(5, 40),
          FlSpot(6, 10),
          FlSpot(7, 5),
          FlSpot(8, 15),
          FlSpot(9, 14),
          FlSpot(10, 20),
          FlSpot(11, 40),
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
