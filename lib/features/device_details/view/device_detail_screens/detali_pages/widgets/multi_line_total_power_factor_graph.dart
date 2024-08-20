import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../../utils/constant/colors.dart';

class MultiLineTotalPowerFactorGraph extends StatelessWidget {
  const MultiLineTotalPowerFactorGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      borderWidth: 0,
      plotAreaBorderWidth: 0,
      primaryXAxis: const CategoryAxis(
        labelStyle: TextStyle(color: Colors.white),
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0),
      ),
      primaryYAxis: const NumericAxis(
        isVisible: false, // Hide Y axis
      ),

      series: <SplineSeries<ChartData, String>>[

        /// First Line

        SplineSeries<ChartData, String>(
          dataSource: getChartData1(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: TColors.totalPowerFactorGraphLine1, // Line color for the first series
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: TColors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine1,
          ),
        ),

        /// Second Line

        SplineSeries<ChartData, String>(
          dataSource: getChartData2(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: TColors.totalPowerFactorGraphLine2, // Line color for the second series
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: Colors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine2,
          ),
        ),

        /// Third Line

        SplineSeries<ChartData, String>(
          dataSource: getChartData3(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: TColors.totalPowerFactorGraphLine3,// Line color for the third series
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: Colors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine3,
          ),
        ),

        /// Forth Line

        SplineSeries<ChartData, String>(
          dataSource: getChartData4(),
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          color: TColors.totalPowerFactorGraphLine4, // Line color for the third series
          width: 4,
          markerSettings: const MarkerSettings(
            isVisible: true,
            color: Colors.white,
            borderWidth: 2,
            borderColor: TColors.totalPowerFactorGraphLine4,
          ),
        ),
      ],





      tooltipBehavior: TooltipBehavior(
        enable: true,
        header: '',
        format: 'point.x : point.y hrs',
        textStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}






List<ChartData> getChartData1() {
  return [
    ChartData('Jan', 15),
    ChartData('Feb', 20),
    ChartData('Mar', 15),
    ChartData('April', 30),
    ChartData('May', 25),
  ];
}

List<ChartData> getChartData2() {
  return [
    ChartData('Jan', 10),
    ChartData('Feb', 15),
    ChartData('Mar', 15),
    ChartData('April', 20),
    ChartData('May', 15),
  ];
}

List<ChartData> getChartData3() {
  return [
    ChartData('Jan', 5),
    ChartData('Feb', 2),
    ChartData('Mar', 10),
    ChartData('April', 20),
    ChartData('May', 25),
  ];
}

List<ChartData> getChartData4() {
  return [
    ChartData('Jan', 5),
    ChartData('Feb', 10),
    ChartData('Mar', 15),
    ChartData('April', 20),
    ChartData('May', 25),
  ];
}

class ChartData {
  final String x;
  final double y;

  ChartData(this.x, this.y);
}