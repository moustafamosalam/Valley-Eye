import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationMap extends StatefulWidget {
  const LocationMap({Key? key}) : super(key: key);

  @override
  State<LocationMap> createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {

  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  CameraPosition mylocation = const CameraPosition(target: LatLng(25.1276, 56.356355), zoom: 13.5,);

  List<Marker> marker = [const Marker(markerId: MarkerId("1"),position: LatLng(25.1276, 56.356355))];

   initPermission() async{
    var status = await Permission.location.request();
    if (status.isGranted) {
      print('done');
    } else if (status.isDenied) {
      initPermission();
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  @override
  void initState() {
    initPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget>[ GoogleMap(
          markers: marker.toSet(),
          mapType: MapType.normal,
          initialCameraPosition: mylocation,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
    ]);
  }
}
