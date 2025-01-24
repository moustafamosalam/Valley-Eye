import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_towers/shared/custom_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 130.h),
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Welcome to Valley-Eye!\n', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                  TextSpan(text: 'Stay up to date with the latest weather news and forecasts.', style: TextStyle(fontSize: 12, color: Colors.black))
                ]
              ),
            ),
            const SizedBox(height: 130),
            const Center(
              child: Column(
                children: [
                  CustomButton(buttonText: "About", buttonWidth: 200, buttonHeight: 45,),
                  CustomButton(buttonText: "Help", buttonWidth: 200, buttonHeight: 45,),
                  CustomButton(buttonText: "Support", buttonWidth: 200, buttonHeight: 45,),
                  CustomButton(buttonText: "Login", buttonWidth: 200, buttonHeight: 45,),
                  CustomButton(buttonText: "Language", buttonWidth: 200, buttonHeight: 45,),
                ],
              ),
            ),
            const SizedBox(height: 120,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Emergency Hotline: 1-800-555-5555", style: TextStyle(fontSize: 12.r, color: Colors.black),),
                Text("www.website.com", style: TextStyle(fontSize: 12.r, color: Colors.blue),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
