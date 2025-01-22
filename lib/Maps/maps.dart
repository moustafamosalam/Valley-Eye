
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:weather_towers/HeatMapTest/tileprovider.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

const List<String> parameters = <String> ['Temp', 'Humidity', 'Rain'];
const List<String> parameterCode = <String> ['TA2', 'HRD0', 'PAR0'];
const List<String> palettes = <String> [
  '-20:191970;-10:0909FF;0:7FFF7F;10:FFFF00;20:F6BE00;30:FF8C00;35:FF4500;39:FF0000;42:C11B17;45:800517;50:800080;60:000000',
  '0:db1200; 20:965700; 40:ede100; 60:8bd600; 80:00a808; 100:000099; 100.1:000099',
  '0:E1C86400; 0.1:C8963200; 0.2:9696AA00; 0.5:7878BE00; 1:6E6ECD4C; 10:5050E1B2; 140:1414FFE5'
];
int currentCode = 0;

class MapSampleState extends State<MapSample> {
  // final Completer<GoogleMapController> _controller =
  // Completer<GoogleMapController>();

  late GoogleMapController mapController;

  TileOverlay? _tileOverlay;

  final DateTime _forecastDate = DateTime.now();

  _initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();

    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        // mapType: 'PAR0',
        mapType: parameterCode[0],
        opacity: 0.6,
        palette: palettes[currentCode],
      ),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.249802, 56.184209),
    zoom: 15,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (controller) {
        setState(() {
          mapController = controller;
        });
        _initTiles(_forecastDate);
      },
      tileOverlays:
      _tileOverlay == null ? {} : <TileOverlay>{_tileOverlay!},
    );
  }
}