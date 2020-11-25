import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartWidget extends StatefulWidget {
  Map<String, double> dataMap;
  final String label;
  List<Color> colorList;
  PieChartWidget({this.dataMap, this.colorList, this.label});
  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            widget.label,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 40),
          PieChart(
            dataMap: widget.dataMap,
            animationDuration: Duration(milliseconds: 4000),
            chartLegendSpacing: 32,
            chartRadius: MediaQuery.of(context).size.width / 2,
            colorList: widget.colorList,
            initialAngleInDegree: 0,
            chartType: ChartType.ring,
            ringStrokeWidth: 32,
            centerText: "Pandemic Status",
            legendOptions: LegendOptions(
              showLegendsInRow: false,
              legendPosition: LegendPosition.right,
              showLegends: true,
              //legendShape: _BoxShape.circle,
              legendTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            chartValuesOptions: ChartValuesOptions(
              showChartValueBackground: true,
              showChartValues: true,
              showChartValuesInPercentage: false,
              showChartValuesOutside: false,
            ),
          ),
        ],
      ),
    );
  }
}
