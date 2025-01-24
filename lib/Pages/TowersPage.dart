import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_towers/Towers/StatesTowers.dart';
import 'package:weather_towers/Towers/drop_down_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height,),
            child: Container(
              padding: const EdgeInsets.only(left: 10.0, bottom: 0.0, right: 10.0, top: 38.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.cell_tower, color: Colors.black, size: 25.r),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                          child: Text(
                            'Available Towers',
                            style: TextStyle(
                                fontSize: 25.r,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Container(height: 1.0, color: Colors.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10.0, 10, 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        DropDownMenu(
                          stateTrueValleyFalse: true,
                          refresh: () { setState(() {}); },
                        ),
                        DropDownMenu(
                            stateTrueValleyFalse: false,
                            refresh: () {setState(() {});}
                        ),
                      ],
                    ),
                  ),
                  ...currentAvailableTowers,
                ],
              ),
            ),
          ),
    ));
  }
}
