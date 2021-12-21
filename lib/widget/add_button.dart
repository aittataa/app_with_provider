import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class AddButton extends StatelessWidget {
  final int index;
  final String title;
  final Color color;
  final Function onPressed;
  const AddButton({
    Key key,
    this.index,
    this.title,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: double.infinity,
      elevation: 3,
      highlightElevation: 3,
      color: color,
      splashColor: transparentColor,
      highlightColor: transparentColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(15),
      child: Text(
        "$title",
        style: TextStyle(color: whiteTextColor, fontWeight: FontWeight.w900),
      ),
    );
  }
}
