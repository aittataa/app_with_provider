import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class TextBox extends StatelessWidget {
  final int index;
  final bool state;
  final String hintText;
  final int maxLines;
  final TextEditingController controller;
  const TextBox({
    Key key,
    this.index,
    this.state = false,
    this.hintText,
    this.maxLines = 1,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: state ? TextInputType.number : TextInputType.text,
      textInputAction: TextInputAction.done,
      cursorColor: blackIconColor,
      style: TextStyle(
        color: blackTextColor.withOpacity(.75),
        fontWeight: FontWeight.w900,
      ),
      maxLines: maxLines,
      decoration: InputDecoration(
        icon: state
            ? Icon(
                index == 0 ? CupertinoIcons.plus : CupertinoIcons.minus,
                color: index == 0 ? incomeColor : expenseColor,
              )
            : null,
        suffixText: state ? appSettings.currency : null,
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: blackTextColor.withOpacity(.5),
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: state
                ? index == 0
                    ? incomeColor
                    : expenseColor
                : mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2.5,
            color: state
                ? index == 0
                    ? incomeColor
                    : expenseColor
                : mainColor,
          ),
        ),
      ),
    );
  }
}
