import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:weather_towers/BackEnd/Data.dart';
import 'package:weather_towers/Pages/TowersPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_towers/Towers/StatesTowers.dart';
import 'package:weather_towers/shared/show_loading_overlay.dart';

Future<void> firebaseSignIn(String email, String password, BuildContext context) async{
  DataFetch dataFetch = Provider.of<DataFetch>(context, listen: false);
  NavigatorState navigator = Navigator.of(context);
  ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
  LoadingOverlay loadingOverlay = LoadingOverlay(context);
  try {
    loadingOverlay.show();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    await dataFetch.fetchStatesNames();
    await dataFetch.fetchAllValleys(stateNumber, valleyNumber);
    navigator.pushReplacement(PageTransition(child: const HomePage(), type: PageTransitionType.fade));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'invalid-credential') {
      scaffoldMessenger.showSnackBar( const SnackBar(content: Text('Wrong Email or Password'), duration: Duration(seconds: 5),));
    }
    else{
      scaffoldMessenger.showSnackBar( const SnackBar(content: Text('Check Connection'), duration: Duration(seconds: 5),));
    }
  }finally {
    loadingOverlay.hide(); // Hide the loading overlay
  }
}