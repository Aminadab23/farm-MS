import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class IndividualBar {
  final int x;
  final double y;

  IndividualBar(this.x, this.y);
}

class BarData {
  final double farm1;
  final double farm2;
  final double farm3;
  final double farm4;
  final double farm5;

  BarData(this.farm1, this.farm2, this.farm3, this.farm4, this.farm5);

  List<IndividualBar> barData = [];
  void initiaizeData() {
    barData = [
      IndividualBar(0, farm1),
      IndividualBar(1, farm2),
      IndividualBar(2, farm3),
      IndividualBar(3, farm4),
      IndividualBar(4, farm5)
    ];
  }
}

//tha actual bar chart

class MyBarGraph extends StatelessWidget {
  final List farmsSummery;
  const MyBarGraph({super.key, required this.farmsSummery});

  @override
  Widget build(BuildContext context) {
    BarData mydata = BarData(farmsSummery[0], farmsSummery[1], farmsSummery[2],
        farmsSummery[3], farmsSummery[4]);
    mydata.initiaizeData();
    return BarChart(BarChartData(
        maxY: 100,
        minY: 0,
        barGroups: mydata.barData
            .map((e) =>
                BarChartGroupData(x: e.x, barRods: [BarChartRodData(toY: e.y)]))
            .toList()));
  }
}
