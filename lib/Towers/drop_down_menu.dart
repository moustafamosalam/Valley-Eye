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
          Text(
            stateTrueValleyFalse ? statesList[stateNumber] : valleyTypeList[valleyNumber],
            style: TextStyle(
                fontSize: 19.r,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic),
          ),
          Icon(
            Icons.arrow_drop_down_sharp,
            color: Colors.blueGrey,
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
          backgroundColor: Colors.blueGrey.shade900,
          gradientColors: const [
            Color(0xFF3f3f3f),
            Color(0xFF607D8B)
          ],
          pickerTextStyle: TextStyle(
            color: Colors.grey.shade400,
            fontSize: 20.r,
            fontWeight: FontWeight.bold,
          ),
          pickerTitle: Text(
            'Choose your valley:',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blueGrey.shade200),
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
