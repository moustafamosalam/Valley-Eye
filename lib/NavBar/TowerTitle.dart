import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:weather_towers/Pages/Report_Page.dart';
import 'package:bottom_picker/bottom_picker.dart';

class TowerTitle extends StatefulWidget {
  bool dropdownmenu;
  final String towerName;
  Function? UpdateState;

  TowerTitle({super.key,
    required this.towerName,
    this.dropdownmenu=false,
    this.UpdateState
  });

  @override
  State<TowerTitle> createState() => _TowerTitleState();
}

class _TowerTitleState extends State<TowerTitle> {
  int stateNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 20.0, right: 20.0, top: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () {Navigator.pop(context);},
                  child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.blueGrey, size: 27)
              ),
              const SizedBox(width: 7,),
              const Icon(Icons.cell_tower, color: Colors.blueGrey, size: 29),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10.0),
                child: Text(
                  widget.towerName,
                  style: TextStyle(
                      fontSize: 22.r,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Expanded(child: Container()),
              widget.dropdownmenu
                  ? GestureDetector(
                      child: Row(
                        children: [
                          Text(parameters[stateNumber], style: TextStyle(fontSize: 18.r, fontFamily: 'Poppins', fontWeight: FontWeight.w400, color: Colors.blueGrey, fontStyle: FontStyle.italic),),
                          Icon(Icons.arrow_drop_down_sharp, color: Colors.blueGrey, size: 25.r,),
                        ],
                      ),
                      onTap: () {
                        BottomPicker(
                          items: [Text(parameters[0]), Text(parameters[1]), Text(parameters[2]), Text(parameters[3])],
                          selectedItemIndex: stateNumber,
                          onSubmit: (dynamic number){
                              setState(() {currentCode = number; stateNumber = number; widget.UpdateState?.call();});
                            },
                          backgroundColor: Colors.blueGrey.shade900,
                          gradientColors: const [Color(0xFF3f3f3f), Color(0xFF607D8B)],
                          pickerTextStyle: TextStyle(color: Colors.grey.shade400, fontSize: 20.r, fontWeight: FontWeight.bold,),
                          pickerTitle: Text('Choose your state:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blueGrey.shade200),),
                        ).show(context);
                      },
                    )
                  : Container(),
            ],
          ),
          Container(
            height: 2.0,
            color: Colors.blueGrey,
            width: (MediaQuery.of(context).size.width - 42),
          ),
        ],
      ),
    );
  }
}
