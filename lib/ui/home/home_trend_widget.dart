import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_donor/models/donor_statistic_model.dart';
import 'package:flutter_donor/shared/theme.dart';
import 'package:get/get.dart';

Widget trend(
  List<Rx<ListData>> data,
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
            mainData(data),
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

LineChartData mainData(List<Rx<ListData>> data) {
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
              return data[0].value.months;
            case 1:
              return data[1].value.months;
            case 2:
              return data[2].value.months;
            case 3:
              return data[3].value.months;
            case 4:
              return data[4].value.months;
            case 5:
              return data[5].value.months;
            case 6:
              return data[6].value.months;
            case 7:
              return data[7].value.months;
            case 8:
              return data[8].value.months;
            case 9:
              return data[9].value.months;
            case 10:
              return data[10].value.months;
            case 11:
              return data[11].value.months;
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
        spots: [
          FlSpot(0, data[0].value.counts!.toDouble()),
          FlSpot(1, data[1].value.counts!.toDouble()),
          FlSpot(2, data[2].value.counts!.toDouble()),
          FlSpot(3, data[3].value.counts!.toDouble()),
          FlSpot(4, data[4].value.counts!.toDouble()),
          FlSpot(5, data[5].value.counts!.toDouble()),
          FlSpot(6, data[6].value.counts!.toDouble()),
          FlSpot(7, data[7].value.counts!.toDouble()),
          FlSpot(8, data[8].value.counts!.toDouble()),
          FlSpot(9, data[9].value.counts!.toDouble()),
          FlSpot(10, data[10].value.counts!.toDouble()),
          FlSpot(11, data[11].value.counts!.toDouble()),
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
