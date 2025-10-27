import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SimpleComparisonBarChart extends StatelessWidget {
  const SimpleComparisonBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        // alignment: BarChartAlignment.spaceAround, // Distributes bars evenly
        maxY: 180, // Set max Y to be slightly above the highest bar value
        minY: 0,
        groupsSpace: 20, // Space between bar groups

        // Hide all grid lines and borders for a clean look
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        
        // Hide all axis titles and labels
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 20, // Space for the 'Stacco' label
              getTitlesWidget: getTopTitles,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 20, // Space for the '(80kg)' labels
              getTitlesWidget: getBottomTitles,
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        
        barTouchData: BarTouchData(
          enabled: false, // Disable touch interactions if not needed
        ),

        barGroups: [
          // Bar 1 (Red)
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: ch(160), // Height of the bar
                color: AppColor.red,
                width: cw(20),
                borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(cw(5)),
                  topRight: Radius.circular(cw(5)),
                ),
              ),
            ],
            showingTooltipIndicators: [], // No tooltips shown
          ),
          // Bar 2 (Orange)
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: ch(160), // Height of the bar
                color: Colors.orange,
                width: cw(20),
               borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(cw(5)),
                  topRight: Radius.circular(cw(5)),
                ),
              ),
            ],
            showingTooltipIndicators: [],
          ),
          // Bar 3 (Green)
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: ch(160), // Height of the bar
                color: Colors.green,
                width: cw(20),
               borderRadius:  BorderRadius.only(
                  topLeft: Radius.circular(cw(5)),
                  topRight: Radius.circular(cw(5)),
                ),
              ),
            ],
            showingTooltipIndicators: [],
          ),
        ],
      ),
    );
  }

  /// Provides the top titles for the bars (e.g., 'Stacco').
  Widget getTopTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    switch (value.toInt()) {
      case 0: // The index for the green bar
        text = 'Tozzo';
        break;
      
      case 1: // The index for the green bar
        text = 'Panca';
        break;
      
      case 2: // The index for the green bar
        text = 'Stacco';
        break;
      default:
        text = ''; // Hide for other bars
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0, // Adjust space if needed
      child: Text(text, style: style),
    );
  }

  /// Provides the bottom titles for the bars (e.g., '(80kg)').
  Widget getBottomTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color:AppColor.white,
      fontSize: AppFontSize.f15-4,
    );
    String text;
    switch (value.toInt()) {
      case 0: // The index for the orange bar
        text = '(120kg)';
        break;
      case 1: // The index for the orange bar
        text = '(80kg)';
        break;
      case 2: // The index for the green bar
        text = '(160kg)';
        break;
      default:
        text = ''; // Hide for other bars
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0, // Adjust space if needed
      child: Text(text, style: style),
    );
  }
}