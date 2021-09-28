import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/provider/categories_provider.dart';
import 'package:wallet_manager/widget/categories_page.dart';
import 'package:wallet_manager/widget/header_button.dart';

class CategoriesManager extends StatefulWidget {
  const CategoriesManager({Key key}) : super(key: key);

  @override
  _CategoriesManagerState createState() => _CategoriesManagerState();
}

class _CategoriesManagerState extends State<CategoriesManager> {
  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, dataProvider, child) {
        dataProvider.loadData;
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
                      setState(() {
                        animateToPage(0);
                      });
                    },
                  ),
                  HeaderButton(
                    index: 1,
                    title: Messages.expenses,
                    icon: CupertinoIcons.square_arrow_up_fill,
                    onPressed: () {
                      setState(() {
                        animateToPage(1);
                      });
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
                  CategoriesPage(
                    myList: dataProvider.loadCategories(0)..sort((a, b) => b.id.compareTo(a.id)),
                  ),
                  CategoriesPage(
                    myList: dataProvider.loadCategories(1)..sort((a, b) => b.id.compareTo(a.id)),
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
