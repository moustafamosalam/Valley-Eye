class TemperatureData {
  final double latitude;
  final double longitude;
  final double temperature;

  TemperatureData({required this.latitude, required this.longitude, required this.temperature});
}

final List<TemperatureData> temperatureData = [
  TemperatureData(latitude: 25.249802, longitude: 56.184209, temperature: ((60.0+10.0)/(3.5))),
  TemperatureData(latitude: 25.44121453211882, longitude: 56.26993304816683, temperature: ((25.0+10.0)/(3.5))),
  TemperatureData(latitude: 40.7128, longitude: -74.0060, temperature: ((15.0+10.0)/(3.5))),
  TemperatureData(latitude: 51.5074, longitude: -0.1278, temperature: ((10.0+10.0)/(3.5))),
  TemperatureData(latitude: 35.6895, longitude: 139.6917, temperature: ((30.0+10.0)/(3.5))),
];