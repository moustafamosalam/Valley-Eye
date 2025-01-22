import 'package:flutter/material.dart';
import 'package:weather_towers/LoginLayers/config.dart';

class LayerOne extends StatelessWidget {
  const LayerOne({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: ((654/867.43) * screenHeight),
      decoration: const BoxDecoration(
        color: layerOneBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60.0),
          bottomRight: Radius.circular(60.0)
        ),
      ),
    );
  }
}

