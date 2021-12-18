import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/models/donor_statistic_model.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

Widget trend(
  List<DataStatistics> data,
  List<int> pointer,
) {
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
            mainData(data, pointer),
          ),
        ),
      ],
    ),
  );
}

List<Color> gradientColors = [
  AppColor.cRed,
  AppColor.cRed.withOpacity(0.8),
];

LineChartData mainData(List<DataStatistics> data, List<int> pointer) {
  return LineChartData(
    backgroundColor: AppColor.white.withOpacity(0.3),
    lineTouchData: LineTouchData(
      enabled: true,
      touchTooltipData: LineTouchTooltipData(
        tooltipBgColor: AppColor.cDarkBlue.withOpacity(0.8),
      ),
    ),
    gridData: FlGridData(
      show: true,
      drawVerticalLine: true,
      getDrawingHorizontalLine: (value) {
        return FlLine(
          color: AppColor.cGrey,
          strokeWidth: 0.8,
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
              return data[11].months;
            case 1:
              return data[10].months;
            case 2:
              return data[9].months;
            case 3:
              return data[8].months;
            case 4:
              return data[7].months;
            case 5:
              return data[6].months;
            case 6:
              return data[5].months;
            case 7:
              return data[4].months;
            case 8:
              return data[3].months;
            case 9:
              return data[2].months;
            case 10:
              return data[1].months;
            case 11:
              return data[0].months;
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
          if (value.toInt() == pointer[0]) {
            return pointer[0].toString();
          } else if (value.toInt() == pointer[1]) {
            return pointer[1].toString();
          } else if (value.toInt() == pointer[2]) {
            return pointer[2].toString();
          } else if (value.toInt() == pointer[3]) {
            return pointer[3].toString();
          } else if (value.toInt() == pointer[4]) {
            return pointer[4].toString();
          } else {
            return '';
          }
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
    maxY: pointer[4].toDouble(),
    lineBarsData: [
      LineChartBarData(
        spots: [
          FlSpot(0, data[11].counts!.toDouble()),
          FlSpot(1, data[10].counts!.toDouble()),
          FlSpot(2, data[9].counts!.toDouble()),
          FlSpot(3, data[8].counts!.toDouble()),
          FlSpot(4, data[7].counts!.toDouble()),
          FlSpot(5, data[6].counts!.toDouble()),
          FlSpot(6, data[5].counts!.toDouble()),
          FlSpot(7, data[4].counts!.toDouble()),
          FlSpot(8, data[3].counts!.toDouble()),
          FlSpot(9, data[2].counts!.toDouble()),
          FlSpot(10, data[1].counts!.toDouble()),
          FlSpot(11, data[0].counts!.toDouble()),
        ],
        curveSmoothness: 0.3,
        isCurved: true,
        colors: gradientColors,
        barWidth: 3.5,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: true,
          colors: [
            ColorTween(begin: gradientColors[0], end: gradientColors[1])
                .lerp(0.1)!
                .withOpacity(0.3),
          ],
        ),
      ),
    ],
  );
}
