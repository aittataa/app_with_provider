import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_online/app/config/themes/app_theme.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.circular(10),
        //boxShadow: [AppConstant.boxShadow],
      ),
      child: IconButton(
        onPressed: () {},
        color: AppTheme.secondaryIconColor,
        splashColor: AppTheme.transparentColor,
        highlightColor: AppTheme.transparentColor,
        icon: Icon(CupertinoIcons.heart_fill),
      ),
    );
  }
}
