import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_towers/ChartPage/Chart.dart';
import 'package:weather_towers/BackEnd/UsedParam.dart';
import 'package:weather_towers/BackEnd/Data.dart';

import 'package:provider/provider.dart';

class DataPage extends StatelessWidget {
  const DataPage({super.key});


  @override
  Widget build(BuildContext context) {

    temperature2 = Provider.of<DataFetch>(context, listen: true).temperature;
    humidity2 = Provider.of<DataFetch>(context, listen: true).humidity;
    precipitation2 = Provider.of<DataFetch>(context, listen: true).precipitation;
    dust2 = Provider.of<DataFetch>(context, listen: true).dust;
    wind2 = Provider.of<DataFetch>(context, listen: true).wind;
    uv2 = Provider.of<DataFetch>(context, listen: true).uv;
    current2 = Provider.of<DataFetch>(context, listen: true).current;

    return Container(
      margin: EdgeInsets.only(top: 100.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(" Parameters", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 5),
            height: 200.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Temperature: $temperature2°C", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("Humidity: $humidity2%", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("Rain Fall: $precipitation2 mm/h", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("Wind Speed: $dust2 km/h", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("UV Index: $uv2", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("Dust Level: $dust2 μg/m³", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                    Text("Current: $current2 mA", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(CupertinoIcons.location_solid, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Map", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Icon(CupertinoIcons.info_circle_fill, color: Colors.black,),
                        SizedBox(width: 5,),
                        Text("Info", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Text(" Charts", style: GoogleFonts.notoSans(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Chart1()
          ),
        ],
      ),
    );
  }
}
