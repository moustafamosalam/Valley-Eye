
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_towers/LoginLayers/config.dart';
import 'package:weather_towers/BackEnd/SignIn.dart';
import 'package:weather_towers/shared/custom_button.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class LayerThree extends StatelessWidget {
  const LayerThree({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth  = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    bool isChecked = false;

    return SingleChildScrollView(
      child: SizedBox(
        height: ((470/867.43) * screenHeight),
        width: screenWidth,
        child: Stack(
          children: <Widget>[
            Positioned(
              left: ((59/411.43) * screenWidth),
              top: ((80/867.43) * screenHeight),
              child: Text(
                'Email',
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    color: Colors.black,
                    fontSize: 20.r,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Positioned(
                left: ((59/411.43) * screenWidth),
                top: ((110/867.43) * screenHeight),
                child: SizedBox(
                  height: 40,
                  width: ((310/411.43) * screenWidth),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: 'Email@gmail.com',
                      hintStyle: TextStyle(color: hintText),
                      labelStyle: TextStyle(color: hintText),
                    ),
                  ),
                )),
            Positioned(
              left: ((59/411.43) * screenWidth),
              top: ((180/867.43) * screenHeight),
              child: Text(
                'Password',
                style: TextStyle(
                    fontFamily: 'Poppins-Medium',
                    fontSize: 20.r,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Positioned(
                left: ((59/411.43) * screenWidth),
                top: ((210/867.43) * screenHeight),
                child: SizedBox(
                  height: 40,
                  width: ((310/411.43) * screenWidth),
                  child: TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.black),
                    obscureText: true,
                    obscuringCharacter: "*",
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: '*******',
                      hintStyle: TextStyle(color: hintText),
                      labelStyle: TextStyle(color: hintText),
                    ),
                  ),
                )),
            Positioned(
                left: ((46/411.43) * screenWidth),
                top: ((275/867.43) * screenHeight),
                child: Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: checkbox,
                      value: isChecked,
                      onChanged: (bool? value) {
                        isChecked = value!;
                      },
                    ),
                    Text(
                      'Remember Me?',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.r,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
            Positioned(
                top: ((280/867.43) * screenHeight),
                right: ((60/411.43) * screenWidth),
                child: GestureDetector(
                  onTap: (){firebaseSignIn(emailController.text, passwordController.text, context);},
                  child: const CustomButton(buttonText: "Sign In", buttonWidth: 105, buttonHeight: 40,),
                )),
            Positioned(
                top: ((345/867.43) * screenHeight),
                left: ((59/411.43) * screenWidth),
                child: Container(
                  height: 0.5,
                  width: ((310/411.43) * screenWidth),
                  color: inputBorder,
                )),
            Positioned(
                right: ((57/411.43) * screenWidth),
                top: ((360/867.43) * screenHeight),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.r,
                      fontFamily: 'Poppins-Medium',
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
