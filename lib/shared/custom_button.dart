import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final int buttonWidth;
  final int buttonHeight;
  const CustomButton({super.key, required this.buttonText, required this.buttonWidth, required this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: buttonWidth.w,
      height: buttonHeight.h,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15.r,
              fontFamily: 'Poppins-Medium',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
