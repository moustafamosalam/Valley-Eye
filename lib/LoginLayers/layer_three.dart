
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_towers/LoginLayers/config.dart';
import 'package:weather_towers/BackEnd/SignIn.dart';

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
                    color: const Color(0xFF024335),
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
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
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
                    color: const Color(0xFF024335),
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
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      hintText: '*******',
                      hintStyle: TextStyle(color: hintText),
                      labelStyle: TextStyle(color: hintText),
                    ),
                  ),
                )),
            Positioned(
                left: ((46/411.43) * screenWidth),
                top: ((342/867.43) * screenHeight),
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
                          color: forgotPasswordText,
                          fontSize: 13.r,
                          fontFamily: 'Poppins-Medium',
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )),
            Positioned(
                top: ((346/867.43) * screenHeight),
                right: ((60/411.43) * screenWidth),
                child: GestureDetector(
                  onTap: (){firebaseSignIn(emailController.text, passwordController.text, context);},
                  child: Container(
                    width: ((99/411.43) * screenWidth),
                    height: 35,
                    decoration: const BoxDecoration(
                      color: signInButton,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.r,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                )),
            Positioned(
                top: ((413/867.43) * screenHeight),
                left: ((59/411.43) * screenWidth),
                child: Container(
                  height: 0.5,
                  width: ((310/411.43) * screenWidth),
                  color: inputBorder,
                )),
          ],
        ),
      ),
    );
  }
}
