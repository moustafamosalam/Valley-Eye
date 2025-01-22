import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_towers/ChartPage/ChartData.dart';

class Chart2 extends StatelessWidget {
  const Chart2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(top:350, left: 10.0,
      child: Container(height: 200, width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.black.withOpacity(0.7)),
          child: SfCircularChart(
            // Enables the tooltip for all the series in chart
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <CircularSeries>[
                // Initialize line series
                PieSeries<ChartData, String>(
                  // Enables the tooltip for individual series
                    enableTooltip: true,
                    dataSource: [
                      // Bind data source
                      ChartData('Jan', 35),
                      ChartData('Feb', 28),
                      ChartData('Mar', 34),
                      ChartData('Apr', 32),
                      ChartData('May', 40)
                    ],
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y
                )
              ]
          )
      ),
    );
  }
}
