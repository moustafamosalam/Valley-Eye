import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_towers/ChartPage/ChartData.dart';


class Chart1 extends StatelessWidget {
  const Chart1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(top:150, left: 10.0, right: 10.0,
      child: Container(height: 250, width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.black.withOpacity(0.7)),
        child: SfCartesianChart(
          // Enables the tooltip for all the series in chart
            tooltipBehavior: TooltipBehavior(enable: true),
            // Initialize category axis
            primaryXAxis: CategoryAxis(),
            series: <CartesianSeries>[
              // Initialize line series
              LineSeries<ChartData, String>(
                // Enables the tooltip for individual series
                  enableTooltip: true,
                  dataSource: [
                    // Bind data source
                    ChartData('Jan', 60),
                    ChartData('Feb', 28),
                    ChartData('Mar', 34),
                    ChartData('Apr', 32),
                    ChartData('May', 40),
                    ChartData('April', 42),
                    ChartData('June', 37),
                    ChartData('July', 46),
                    ChartData('Aug', 50),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y
              )
            ]
        ),
      ),
    );
  }
}