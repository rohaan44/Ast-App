import 'package:ast_official/utils/gradients/app_gradients.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressChartWidget extends StatelessWidget {
  const ProgressChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5, // Adjust aspect ratio to control height/width ratio
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
        child: LineChart(
          _mainData(),
        ),
      ),
    );
  }

  LineChartData _mainData() {
    return LineChartData(
      // 1. Grid and Title (Hide to match the design)
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(
        show: true,
        leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      // 2. Border (Hide to match the design)
      borderData: FlBorderData(show: false),
      minX: 0,
      maxX: 10,
      minY: 0,
      maxY: 4,

      // 4. Line Configuration
      lineBarsData: [
        LineChartBarData(
          spots: const [
            // These points are chosen to visually resemble the curve in your image
            FlSpot(0, 0.5),
            FlSpot(2, 2.5),
            FlSpot(5, 3.8),
            FlSpot(7.5, 3.0),
            FlSpot(10, 3.5),
          ],
          isCurved: true, // Use a curved line for the smooth look
          gradient: AppGradients.redGradient, // Use a gradient or solid red
          
          barWidth: 3, // Thicker line
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false), // Hide data points
          belowBarData: BarAreaData(show: false), // Hide area below the line
        ),
      ],
    );
  }
}