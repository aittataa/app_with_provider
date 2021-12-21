import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class BackIcon extends StatelessWidget {
  final int index;
  final Function onPressed;
  const BackIcon({Key key, this.index, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index != 0) {
      return IconButton(
        onPressed: onPressed,
        color: transparentColor,
        splashColor: transparentColor,
        highlightColor: transparentColor,
        icon: const Icon(
          CupertinoIcons.left_chevron,
          color: whiteIconColor,
          size: 26,
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
