import 'package:flutter/material.dart';
import 'package:weather_towers/DataPage/DataCard.dart';
import 'package:weather_towers/BackEnd/UsedParam.dart';
import 'package:weather_towers/BackEnd/Data.dart';

import 'package:provider/provider.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});


  @override
  Widget build(BuildContext context) {

    final double screenWidth  = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    temperature2 = Provider.of<DataFetch>(context, listen: true).temperature;
    humidity2 = Provider.of<DataFetch>(context, listen: true).humidity;
    precipitation2 = Provider.of<DataFetch>(context, listen: true).precipitation;
    dust2 = Provider.of<DataFetch>(context, listen: true).dust;
    wind2 = Provider.of<DataFetch>(context, listen: true).wind;
    uv2 = Provider.of<DataFetch>(context, listen: true).uv;
    current2 = Provider.of<DataFetch>(context, listen: true).current;

    return Stack(children: <Widget>[
      Positioned(left: 0.0, top: ((220/867.43) * screenHeight),
          child: SizedBox(height: ((350/867.43) * screenHeight), width: screenWidth,
              child: SingleChildScrollView( scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DataCards(image: 'images/thermo.png', title: 'Temperature', value: '$temperature2°C',),
                      DataCards(image: 'images/humidity.png', title: 'Humidity', value: '$humidity2%',),
                      DataCards(image: 'images/rain.png', title: 'Rain Fall', value: '$precipitation2 mm/h',),
                      DataCards(image: 'images/wind.png', title: 'Wind Speed', value: '$wind2 km/h',),
                      DataCards(image: 'images/UV.png', title: 'UV Index', value: '$uv2',),
                      DataCards(image: 'images/Dust.png', title: 'Dust Level', value: '$dust2 μg/m³',),
                      DataCards(image: 'images/water.png', title: 'Water Lvl', value: '$current2 mA',),
                      DataCards(image: 'images/battery.png', title: 'Battery', value: '$humidity2 %',),
                      DataCards(image: 'images/current.png', title: 'Current', value: '$current2 mA',),
                    ],
                  ),
              ),
          ),
      ),
    ]);
  }
}
