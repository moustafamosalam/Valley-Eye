import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const Color bottomNavBgColor = Color(0x80FFFFFF);

class DataCards extends StatelessWidget {
  final String title;
  final String image;
  final String value;

  const DataCards({super.key,
    required this.title,
    required this.image,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth  = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5,),
      height: ((340/867.43) * screenHeight), width: ((220/411.43) * screenWidth),
      decoration: BoxDecoration(
        color: bottomNavBgColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(color: bottomNavBgColor.withOpacity(0.1)),
        ],
      ),
      child: Stack(
        children: [
          SizedBox(height: ((285/867.11) * screenHeight), width: ((220/411.43) * screenWidth),
              child: Center(child: Image.asset(image, width: 140.w,))),
          Positioned( bottom: ((65/867.43) * screenHeight), child: Container(height: 2, width: ((230/411.43) * screenWidth), color: Colors.black ,)),
          Positioned(bottom: ((25/867.43) * screenHeight),
            child: SizedBox(
              width: ((220/411.43) * screenWidth),
              height: ((25/867.43) * screenHeight),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('$title: ',
                    style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold, color: Colors.black ),),
                  Text('$value ',
                    style: TextStyle(fontSize: 16.r, fontWeight: FontWeight.bold, color: Colors.black ),),
                ],
              ),
            ),),
        ],
      ),
    );
  }
}