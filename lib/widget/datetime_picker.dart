import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class DateTimePicker extends StatelessWidget {
  final Function onDateTimeChanged;
  const DateTimePicker({Key key, this.onDateTimeChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: mainColor),
      ),
      child: CupertinoDatePicker(
        onDateTimeChanged: onDateTimeChanged,
        initialDateTime: DateTime.now(),
        mode: CupertinoDatePickerMode.date,
        minimumYear: DateTime.now().year - 5,
        maximumYear: DateTime.now().year + 5,
      ),
    );
  }
}
