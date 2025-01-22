import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_towers/NavBar/NavBar.dart';
import 'package:weather_towers/Towers/onlineStatus.dart';
import 'package:weather_towers/Towers/StatesTowers.dart';
import 'package:weather_towers/Pages/Report_Page.dart';
import 'package:weather_towers/Towers/tower_report_button.dart';
import 'package:weather_towers/BackEnd/UsedParam.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class TowerCard extends StatefulWidget {
  final String title;
  final bool onlineStatus;
  final String thumbnailUrl;
  final LatLng location;
  final int numberOfTowers;
  const TowerCard({
    super.key,
    required this.title,
    required this.onlineStatus,
    required this.thumbnailUrl,
    required this.location,
    required this.numberOfTowers
  });

  @override
  State<TowerCard> createState() => _TowerCardState();
}

class _TowerCardState extends State<TowerCard> {

  // final GlobalKey _overlayKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  late GoogleMapController mapController;
  final Set<Marker> marker = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (_overlayEntry == null) {
          marker.add(Marker(markerId: const MarkerId("1"),position: LatLng(widget.location.latitude, widget.location.longitude), infoWindow: InfoWindow(title: '${widget.title} Valley', snippet: 'Custom Description')));
          valley = widget.title;
          _showOverlay(context);
        } else {
          _removeOverlay();
        }
        //Navigator.push(context, PageTransition(child: BottonNavWithAnimatedIcons(towerName: towerTitle), type: PageTransitionType.fade));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        height: (195.h),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.6),
              offset: const Offset(13.0, 13.0,),
              blurRadius: 13.0,
              spreadRadius: -5.0,
            ),
          ],
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.35),
              BlendMode.multiply,
            ),
            image: CachedNetworkImageProvider(widget.thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                '${widget.title} Tower',
                style:  TextStyle(fontSize: 23.r,),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          color: Colors.grey[400],
                          size: 18,
                        ),
                        const SizedBox(width: 7),
                        Text('Location', style: TextStyle(fontSize: 12.r),),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        OnlineIndicator(isOnline: widget.onlineStatus),
                        const SizedBox(width: 7),
                        Text('Status', style: TextStyle(fontSize: 12.r),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOverlay(BuildContext context) {
    OverlayState? overlayState = Overlay.of(context);
    final double screenWidth  = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(
                color: Colors.black.withOpacity(0.2), // Adjust the opacity to your liking
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(alignment: Alignment.centerRight,child: GestureDetector(onTap: _removeOverlay,child: Icon(Icons.close, color: Colors.grey[300],),)),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                  height: ((250/867.43) * screenHeight),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GoogleMap(
                      markers: marker,
                      onMapCreated: (controller) {
                        setState(() {
                          mapController = controller;
                        });
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(target: widget.location, zoom: 11.7),
                    ),
                  ),
                ),
                const SizedBox(height: 7.0,),
                TowerReportButton(ButtonText: 'REPORT PER STATE', Buttonwidth: ((390/411.43) * screenWidth), NextWidget: ReportPage(Title: statesList[stateNumber],), removeOverlay: _removeOverlay,),
                const SizedBox(height: 7.0,),
                TowerReportButton(ButtonText: 'REPORT PER VALLEY', Buttonwidth: ((390/411.43) * screenWidth), NextWidget: ReportPage(Title: ("${widget.title} Valley")), removeOverlay: _removeOverlay,),
                const SizedBox(height: 7.0,),
                SizedBox(
                  height: 50.h,
                  width: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.numberOfTowers,
                    itemBuilder: (context, index) =>
                        TowerReportButton(
                          ButtonText: ("${widget.title}_${index+1}"),
                          Buttonwidth: (screenWidth/(widget.numberOfTowers+1)),
                          NextWidget: BottonNavWithAnimatedIcons(towerName: ('${widget.title}_${index+1}'),),
                          removeOverlay: _removeOverlay,
                          data: true,
                        )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
    overlayState.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

// Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// TowerReportButton(ButtonText: ("${widget.title}_1"), Buttonwidth: (screenWidth/5), NextWidget: BottonNavWithAnimatedIcons(towerName: ('${widget.title}_1'),), removeOverlay: _removeOverlay, data: true,),
// const SizedBox(width: 7.0,),
// TowerReportButton(ButtonText: ('${widget.title}_2'), Buttonwidth: (screenWidth/5), NextWidget: BottonNavWithAnimatedIcons(towerName: ('${widget.title}_2'),), removeOverlay: _removeOverlay, data: true,),
// const SizedBox(width: 7.0,),
// TowerReportButton(ButtonText: ('${widget.title}_3'), Buttonwidth: (screenWidth/5), NextWidget: BottonNavWithAnimatedIcons(towerName: ('${widget.title}_3'),), removeOverlay: _removeOverlay, data: true,),
// const SizedBox(width: 7.0,),
// TowerReportButton(ButtonText: ('${widget.title}_4'), Buttonwidth: (screenWidth/5), NextWidget: BottonNavWithAnimatedIcons(towerName: ('${widget.title}_4')), removeOverlay: _removeOverlay, data: true,),
// ],
// ),