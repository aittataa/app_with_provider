import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';

class FooterBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  const FooterBar({Key key, this.currentIndex, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      backgroundColor: whiteBackColor,
      selectedItemColor: mainColor,
      unselectedItemColor: blackIconColor.withOpacity(.5),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          label: Messages.labelHome,
          icon: Icon(CupertinoIcons.house_alt),
          activeIcon: Icon(CupertinoIcons.house_alt_fill),
        ),
        BottomNavigationBarItem(
          label: Messages.labelCategories,
          icon: Icon(CupertinoIcons.layers_alt),
          activeIcon: Icon(CupertinoIcons.layers_alt_fill),
        ),
        BottomNavigationBarItem(
          label: Messages.labelStatistic,
          icon: Icon(CupertinoIcons.chart_pie),
          activeIcon: Icon(CupertinoIcons.chart_pie_fill),
        ),
        BottomNavigationBarItem(
          label: Messages.labelSettings,
          icon: Icon(CupertinoIcons.gear),
          activeIcon: Icon(CupertinoIcons.gear_solid),
        ),
      ],
    );
  }
}
