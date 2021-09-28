import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        CupertinoIcons.creditcard_fill,
        color: mainColor,
        size: 64,
      ),
    );
  }
}
