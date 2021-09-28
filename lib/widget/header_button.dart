import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';

class HeaderButton extends StatelessWidget {
  final int index;
  final String title;
  final IconData icon;
  final Function onPressed;
  const HeaderButton({Key key, this.index, this.title, this.icon, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.only(bottom: 5),
        color: transparentColor,
        highlightColor: transparentColor,
        splashColor: transparentColor,
        elevation: 0,
        highlightElevation: 0,
        animationDuration: animateDuration,
        shape: Border(
          bottom: BorderSide(
            width: 3,
            color: pageIndex == index ? mainColor : transparentColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: blackIconColor.withOpacity(.75),
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                color: blackTextColor.withOpacity(.75),
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
