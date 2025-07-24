import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Settingstab extends StatelessWidget {
  const Settingstab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('data'),
        SizedBox(
          height: 300,
          width: 300,
          child: LineChart(
            LineChartData(
              minX: 0, // Minimum x value
              maxX: 6, // Maximum x value
              minY: 0, // Minimum y value
              maxY: 6, // Maximum y value
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    const FlSpot(0, 0),
                    const FlSpot(1, 2),
                    const FlSpot(2, 5.2),
                    const FlSpot(3, 1),
                    const FlSpot(4, 6),
                  ],
                  isCurved: true,
                  color: Colors.blue,
                  barWidth: 4,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(itemBuilder: (context,index){
          return const Text('data');
        })
      ],
    );
  }
}
