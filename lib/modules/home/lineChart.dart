import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_spending/modules/home/pricePoints.dart';

class LineChartWidget extends StatelessWidget {
  final List<PricePoints> points;

  const LineChartWidget(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: true,
                dotData: const FlDotData(show: false),
                barWidth: 6,
                belowBarData: BarAreaData(
                    show: true,
                    gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(139, 80, 255, 0.24),
                          Color.fromRGBO(139, 80, 255, 0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
                color: Colors.purple),
          ],
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
        ),
      ),
    );
  }
}
