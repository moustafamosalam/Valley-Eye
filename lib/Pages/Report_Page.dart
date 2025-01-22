import 'package:flutter/material.dart';
import 'package:weather_towers/NavBar/TowerTitle.dart';
import 'package:weather_towers/HeatMapTest/tileprovider.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportPage extends StatefulWidget {
  final String Title;

  const ReportPage({
    Key? key,
    required this.Title
  }) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

const List<String> parameters = <String> ['Temp', 'Humidity', 'Rain', 'Wind'];
const List<String> parameterCode = <String> ['TA2', 'HRD0', 'PA0', 'WND'];
const List<String> palettes = <String> [
  '-20:191970;-10:0909FF;0:7FFF7F;10:FFFF00;20:F6BE00;30:FF8C00;35:FF4500;39:FF0000;42:C11B17;45:800517;50:800080;60:000000',
  '0:db1200; 10:965700; 20:BB935A; 40:ede100; 60:8bd600; 80:00a808; 100:000099; 100.1:000099',
  '0:00000000; 0.1:C8969600; 0.2:9696AA00; 0.5:7878BE19; 1:6E6ECD33; 10:5050E1B2; 140:1414FFE5',
  '1:FFFFFF00; 5:EECECC66; 15:B364BCB3; 25:3F213BCC; 50:744CACE6; 100:4600AFFF; 200:0D1126FF'
];
int currentCode = 0;

class _ReportPageState extends State<ReportPage> {

  late GoogleMapController mapController;
  TileOverlay? _tileOverlay;
  DateTime _forecastDate = DateTime.now();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.417333, 56.277876),
    zoom: 10,
  );

  _initTiles(DateTime date) async {
    final String overlayId = date.millisecondsSinceEpoch.toString();

    final TileOverlay tileOverlay = TileOverlay(
      tileOverlayId: TileOverlayId(overlayId),
      tileProvider: ForecastTileProvider(
        dateTime: date,
        // mapType: 'PAR0',
        mapType: parameterCode[currentCode],
        opacity: 0.8,
        palette: palettes[currentCode],
      ),
    );
    setState(() {
      _tileOverlay = tileOverlay;
    });
  }

  void UpdateStateVisualizationMap(){
    setState(() {_initTiles(DateTime.now());});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
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
          ),
          TowerTitle(towerName: widget.Title, dropdownmenu: true, UpdateState: UpdateStateVisualizationMap,),
        ],
      ),
    );
  }
}


