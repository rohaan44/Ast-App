import 'package:ast_official/helpers/app_layout_helper.dart';
import 'package:ast_official/ui_molecules/app_text/app_text.dart';
import 'package:ast_official/utils/colors_utils.dart';
import 'package:ast_official/utils/font_size.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class WeightProgressCard extends StatefulWidget {
  const WeightProgressCard({super.key});

  @override
  State<WeightProgressCard> createState() => _WeightProgressCardState();
}

class _WeightProgressCardState extends State<WeightProgressCard> {
  // Sample data for the bar chart. Each double represents the height of a bar.
  final List<double> weeklyData = [3.5, 6.0, 9.5, 4.0, 5.0, 3.0, 7.5, 5.5, 8.0, 6.2];
  final int highlightedIndex = 2; // 'Wed' in our example data

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColor.c1E1E1E, // Dark grey background
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Make the card wrap its content
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ## 1. Header Texts ##
          const Text(
            'Peso',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ch(5)),
          AppText(
            txt:'progresso di peso entro un mese',
              color: AppColor.white.withOpacity(0.5),
              fontSize: AppFontSize.f15,
          ),
        SizedBox(height: ch(20)),
         SizedBox(
            height: ch(120),
            child: BarChart(
              BarChartData(
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    tooltipRoundedRadius: 8,
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${rod.toY.toStringAsFixed(1)} kg',
                        const TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  touchCallback: (event, response) {
                    // This can be used to handle touch events if needed
                  },
                ),
                
                // Define the titles (labels) for the axes
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getBottomTitles, // Function to get day labels
                      reservedSize: 38,
                    ),
                  ),
                ),
                
                // Define the actual bar data
                barGroups: List.generate(weeklyData.length, (index) {
                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: weeklyData[index],
                        // Highlight the selected bar with a different color
                        color: index == highlightedIndex
                            ? Colors.redAccent
                            : AppColor.c252525,
                        width: cw(15),
                        borderRadius:  BorderRadius.all(Radius.circular(cw(5))),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        SizedBox(height: ch(20)),
  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            AppText(
               txt: '82 kg',
                  color: Colors.white,
                  fontSize:AppFontSize.f20,
                  fontWeight: FontWeight.bold,
                
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: '80% ',
                      style: TextStyle(
                        color: Color(0xFFE5B839), // Gold color
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'Completato',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Helper function to generate the labels for the bottom axis (days of the week).
  Widget getBottomTitles(double value, TitleMeta meta) {
     final style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: AppFontSize.f15-2,
    );
    
    // The days to display below the chart
    final days = ['Mon', 'Tue', 'Wed', 'Thr', 'Fri', 'Sat', 'Sun', 'Mon', 'Tue', 'Wed'];
    Widget text = Text(days[value.toInt()], style: style);

    // Add the red dot below the highlighted bar's label
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: cw(10), // Space between the bar and the title
      child: Column(
        children: [
          text,
          if (value.toInt() == highlightedIndex) ...[
             const SizedBox(height: 4),
             Container(
                width: 5,
                height: 5,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
             )
          ]
        ],
      ),
    );
  }
}