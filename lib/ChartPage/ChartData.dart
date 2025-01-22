
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}

class ChartData2 {
  ChartData2(this.x, this.y, this.y1);
  final int x;
  final double y;
  final double y1;
}

final List<ChartData2> chartData = [
  ChartData2(2010, 35, 23),
  ChartData2(2011, 38, 49),
  ChartData2(2012, 34, 12),
  ChartData2(2013, 52, 33),
  ChartData2(2014, 40, 30)
];