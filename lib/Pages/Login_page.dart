import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_towers/LoginLayers/layer_one.dart';
import 'package:weather_towers/LoginLayers/layer_three.dart';
import 'package:weather_towers/LoginLayers/layer_two.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth  = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/dark.png'),
              fit: BoxFit.cover,
            )),
        child: Stack(
          children: <Widget>[
             Positioned(
                top:  ( (50/867.43)  * screenHeight  ),
                left: ( (98/411.483) * screenWidth ),
                child: Text(
                  'Valley-I',
                  style: TextStyle(fontSize: 48.r, fontFamily: 'Marker', fontWeight: FontWeight.normal, color: Colors.white60),
                )),
            Positioned(
                top:  ( (205/867.43) * screenHeight  ),
                left: ( (45/411.483) * screenWidth ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 40.h, fontFamily: 'Pacific', fontWeight: FontWeight.w500, color: Colors.white60),
                )),
            Positioned(top: ((290/867.43) * screenHeight), right: 0, bottom: 0, child: LayerOne()),
            Positioned(top: ((318/867.43) * screenHeight), right: 0, bottom: 0, child: LayerTwo()),
            Positioned(top: ((320/867.43) * screenHeight), right: 0, bottom: ((48/867.43) * screenHeight), child: LayerThree()),
          ],
        ),
      ),
    );
  }
}