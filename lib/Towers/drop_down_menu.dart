import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../BackEnd/Data.dart';
import 'StatesTowers.dart';

class DropDownMenu extends StatelessWidget {
  final bool stateTrueValleyFalse;
  final void Function() refresh;
  const DropDownMenu({super.key, required this.stateTrueValleyFalse, required this.refresh});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: 160.w),
            child: Text(
              stateTrueValleyFalse ? statesList[stateNumber] : valleyTypeList[valleyNumber],
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18.r,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontStyle: FontStyle.italic
              ),
            ),
          ),
          Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.black,
            size: 25.r,
          ),
        ],
      ),
      onTap: () {
        BottomPicker(
          items: stateTrueValleyFalse
              ? [ Text(statesList[0]), Text(statesList[1]), Text(statesList[2])]
              : [ Text(valleyTypeList[0]), Text(valleyTypeList[1]), Text(valleyTypeList[2])],
          selectedItemIndex: stateTrueValleyFalse ? stateNumber : valleyNumber,
          backgroundColor: Colors.black87,
          closeIconColor: Colors.white,
          buttonSingleColor: Colors.white,
          buttonContent: const Text("Select", textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
          pickerTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.r,
            fontWeight: FontWeight.bold,
          ),
          pickerTitle: Text(
            'Choose your valley:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 19.r,
                height: 3,
                color: Colors.white),
          ),
          onSubmit: (dynamic number) async {
            stateTrueValleyFalse ? stateNumber = number : valleyNumber = number;
            await Provider.of<DataFetch>(context, listen: false).fetchAllValleys(stateNumber, valleyNumber);
            refresh();
          },
        ).show(context);
      },
    );
  }
}
