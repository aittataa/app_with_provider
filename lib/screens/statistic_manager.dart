import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/provider/categories_provider.dart';
import 'package:wallet_manager/provider/transactions_provider.dart';
import 'package:wallet_manager/widget/header_button.dart';
import 'package:wallet_manager/widget/statistic_page.dart';

class StatisticManager extends StatefulWidget {
  const StatisticManager({Key key}) : super(key: key);
  @override
  _StatisticManagerState createState() => _StatisticManagerState();
}

class _StatisticManagerState extends State<StatisticManager> {
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoriesProvider, TransactionsProvider>(
      builder: (context, categoryProvider, transactionProvider, child) {
        categoryProvider.loadData;
        transactionProvider.loadData;
        return Column(
          children: [
            SizedBox(
              child: Row(
                children: [
                  HeaderButton(
                    index: 0,
                    title: Messages.income,
                    icon: CupertinoIcons.square_arrow_down_fill,
                    onPressed: () {
                      setState(() => animateToPage(0));
                    },
                  ),
                  HeaderButton(
                    index: 1,
                    title: Messages.expenses,
                    icon: CupertinoIcons.square_arrow_up_fill,
                    onPressed: () {
                      setState(() => animateToPage(1));
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (index) {
                  setState(() => animateToPage(index));
                },
                controller: controller,
                physics: const BouncingScrollPhysics(),
                children: [
                  StatisticPage(
                    myList: categoryProvider.loadCategories(0).where((category) {
                      return category.total > 0;
                    }).toList(),
                  ),
                  StatisticPage(
                    myList: categoryProvider.loadCategories(1).where((category) {
                      return category.total > 0;
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
