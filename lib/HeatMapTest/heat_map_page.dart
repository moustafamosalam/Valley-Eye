
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';
import 'package:latlong2/latlong.dart';
import 'package:weather_towers/HeatMapTest/TempData.dart';


class HeatMapPage extends StatelessWidget {
  const HeatMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Temperature Heat Map')),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(25.249802, 56.184209),
          zoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
            tileDisplay: const TileDisplay.instantaneous(opacity: 0.7),
          ),
          HeatMapLayer(
            heatMapDataSource: InMemoryHeatMapDataSource(
                data: temperatureData.map((data) {
              return WeightedLatLng(
                LatLng(data.latitude, data.longitude),
                data.temperature,
              );
            }).toList()),
            heatMapOptions: HeatMapOptions(
              radius: 40.0,
              minOpacity: 1.0,
              layerOpacity: 1.0,
              blurFactor: 10.0,
              gradient: {
                0.0: Colors.blue,
                0.25: Colors.green,
                0.5: Colors.yellow,
                0.75: Colors.orange,
                1.0: Colors.red,
              },
            ),
          ),
        ],
      ),
    );
  }
}
