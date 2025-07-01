import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



class LineChartScreen extends StatelessWidget {
  const LineChartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FL Line Chart Example')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LineChartWidget(),
        ),
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 6,
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40),
          ),
        ),
        borderData: FlBorderData(show: true),
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 3),
              FlSpot(1, 1),
              FlSpot(2, 4),
              FlSpot(3, 2),
              FlSpot(4, 5),
              FlSpot(5, 3),
              FlSpot(6, 4),
            ],
            isCurved: true,
            barWidth: 3,
            color: Colors.blue,
            belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
