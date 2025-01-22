import 'package:flutter/material.dart';
import 'package:weather_towers/LoginLayers/config.dart';

class LayerTwo extends StatelessWidget {
  const LayerTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth  = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: ((390/411.43) * screenWidth),
      height: ((584/867.43) * screenHeight),
      decoration: const BoxDecoration(
        color: layerTwoBg,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            bottomLeft: Radius.circular(26.0),
        ),
      ),
    );
  }
}
