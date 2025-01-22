import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:weather_towers/ChartPage/ChartData.dart';

class Chart3 extends StatelessWidget {
  const Chart3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(top:350, right: 1.0,
      child: Container(height: 200, width: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.black.withOpacity(0.7)),
          child: SfCartesianChart(
            // Columns will be rendered back to back
              enableSideBySideSeriesPlacement: false,
              series: <CartesianSeries<ChartData2, int>>[
                ColumnSeries<ChartData2, int>(
                    dataSource: chartData,
                    xValueMapper: (ChartData2 data, _) => data.x,
                    yValueMapper: (ChartData2 data, _) => data.y
                ),
                ColumnSeries<ChartData2, int>(
                    opacity: 0.9,
                    width: 0.4,
                    dataSource: chartData,
                    xValueMapper: (ChartData2 data, _) => data.x,
                    yValueMapper: (ChartData2 data, _) => data.y1
                )
              ]
          )
      ),
    );
  }
}