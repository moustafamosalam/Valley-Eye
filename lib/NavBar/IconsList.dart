import 'package:flutter/material.dart';

import 'package:weather_towers/Pages/Data_Page.dart';
import 'package:weather_towers/ChartPage/Chart.dart';
import 'package:weather_towers/Maps/location.dart';

const Color bottonNavBgColor = Color(0x80FFFFFF);
int selctedNavIndex = 0;

List<Widget> bottomNavItems = [
  Image.asset('images/data.png', width: 10.0, height: 10.0,),
  Image.asset('images/charts_icon.png', width: 10.0, height: 10.0,),
  Image.asset('images/location.png', width: 10.0, height: 10.0, ),
  Image.asset('images/info.png', width: 10.0, height: 10.0,),
];

List<Widget> centerWidget = [
  DataPage(),
  const Chart1(),
  const LocationMap(),
  Container(),
];