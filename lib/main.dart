import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:weather_towers/Pages/Login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:weather_towers/BackEnd/Data.dart';

import 'package:provider/provider.dart';
import 'package:weather_towers/Pages/onBoarding_Page.dart';
import 'package:weather_towers/firebase_options.dart';

initPermission() async{
  var status = await Permission.location.request();
  if (status.isGranted) {
  } else if (status.isDenied) {
    initPermission();
  } else if (status.isPermanentlyDenied) {
    openAppSettings();
  }
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initPermission();
  runApp(
    DevicePreview(
        enabled: true,
        builder: (context) =>
            ChangeNotifierProvider<DataFetch>(
                create: (context) => DataFetch(),
                child: const MyApp()
            )
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Weather Towers',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white.withOpacity(1),
          primarySwatch: Colors.grey,
          primaryColor: Colors.white,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.grey[300], fontFamily: 'Poppins'),
          ),
        ),
        home: const OnboardingPage(),
      ),
    );
  }
}
