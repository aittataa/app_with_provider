import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/categories.dart';
import 'package:wallet_manager/widget/bounce_point.dart';
import 'package:wallet_manager/widget/category_item.dart';
import 'package:wallet_manager/widget/empty_box.dart';

class CategoriesPage extends StatelessWidget {
  final List<Categories> myList;
  const CategoriesPage({Key key, this.myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (myList.isNotEmpty) {
      return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        itemCount: myList.length,
        itemBuilder: (context, i) {
          Categories category = myList[i];
          return CategoryItem(category: category);
        },
      );
    } else if (myList.isEmpty) {
      return const BouncePoint(size: 30);
    } else {
      return EmptyBox();
    }
  }
}
