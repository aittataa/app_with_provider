import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/provider/categories_provider.dart';
import 'package:wallet_manager/provider/settings_provider.dart';
import 'package:wallet_manager/provider/transactions_provider.dart';
import 'package:wallet_manager/screens/categories_add.dart';
import 'package:wallet_manager/screens/categories_manager.dart';
import 'package:wallet_manager/screens/settings_manager.dart';
import 'package:wallet_manager/screens/statistic_manager.dart';
import 'package:wallet_manager/screens/transaction_add.dart';
import 'package:wallet_manager/screens/transaction_manager.dart';
import 'package:wallet_manager/widget/back_icon.dart';
import 'package:wallet_manager/widget/footer_bar.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key key}) : super(key: key);

  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  int initialScreen;
  PageController initialController;

  @override
  void initState() {
    super.initState();
    initialScreen = 0;
    initialController = PageController(initialPage: initialScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer3<SettingsProvider, CategoriesProvider, TransactionsProvider>(
      builder: (context, settingsProvider, categoryProvider, transactionProvider, child) {
        settingsProvider.loadData;
        categoryProvider.loadData;
        transactionProvider.loadData;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: backColor,
          appBar: AppBar(
            backgroundColor: mainColor,
            elevation: 1,
            centerTitle: true,
            leading: BackIcon(
              index: initialScreen,
              onPressed: () {
                setState(() {
                  initialScreen = 0;
                  initialController.jumpToPage(initialScreen);
                });
              },
            ),
            title: Text(
              pageTitle[initialScreen],
              style: const TextStyle(color: whiteTextColor, fontWeight: FontWeight.w900),
            ),
            actions: [
              if (initialScreen < 2)
                IconButton(
                  splashColor: transparentColor,
                  highlightColor: transparentColor,
                  tooltip: initialScreen == 0 ? Messages.addTransaction : Messages.addCategory,
                  icon: const Icon(CupertinoIcons.plus_app, color: whiteIconColor, size: 30),
                  onPressed: () => showCupertinoModalPopup(
                    barrierColor: blackBackColor.withOpacity(.5),
                    context: context,
                    builder: (context) {
                      if (initialScreen == 1) {
                        return CategoriesAdd(index: pageIndex);
                      } else {
                        return TransactionAdd();
                      }
                    },
                  ),
                ),
            ],
          ),
          body: PageView(
            controller: initialController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              TransactionManager(),
              CategoriesManager(),
              StatisticManager(),
              SettingsManager(),
            ],
          ),
          bottomNavigationBar: FooterBar(
            currentIndex: initialScreen,
            onTap: (index) {
              setState(() {
                initialScreen = index;
                initialController.jumpToPage(initialScreen);
              });
            },
          ),
        );
      },
    );
  }
}
