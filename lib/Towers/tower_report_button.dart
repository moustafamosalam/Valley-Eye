import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:page_transition/page_transition.dart';
import 'package:weather_towers/BackEnd/Data.dart';

import 'package:provider/provider.dart';

class TowerReportButton extends StatelessWidget {

  final String? ButtonText;
  final double Buttonwidth;
  final Widget NextWidget;
  final VoidCallback removeOverlay;
  bool? data;

  TowerReportButton({
    Key? key,
    required this.ButtonText,
    required this.Buttonwidth,
    required this.NextWidget,
    required this.removeOverlay,
    this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fetch = Provider.of<DataFetch>(context);
    return GestureDetector(
      onTap: (){
        if(data == true) {
          fetch.fetchLatestParameter(ButtonText);
        }
        removeOverlay();
        Navigator.push(context, PageTransition(child: NextWidget, type: PageTransitionType.fade));
        },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Buttonwidth,
        height: 50.h,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(color: Colors.white, fontSize: 14.r, fontFamily: 'Poppins-Medium', fontWeight: FontWeight.w400),
            child: Text(ButtonText!, textAlign: TextAlign.center,),
          ),
        ),
      ),
    );
  }
}
