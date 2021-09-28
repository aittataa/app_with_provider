import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/categories.dart';
import 'package:wallet_manager/constant/constant.dart';

class CategoryItem extends StatelessWidget {
  final bool enable;
  final Categories category;
  const CategoryItem({this.category, this.enable = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: whiteBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [boxShadow],
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero.copyWith(right: 10),
        leading: Container(
          width: 25,
          decoration: BoxDecoration(
            color: Color(category.color),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
        ),
        title: Text(
          "${category.title}",
          style: TextStyle(color: blackTextColor, fontWeight: FontWeight.w900),
        ),
        trailing: enable
            ? Text(
                "${category.total.toStringAsFixed(2)} ${appSettings.currency}",
                style: TextStyle(color: blackTextColor, fontWeight: FontWeight.w900),
              )
            : const SizedBox(),
      ),
    );
  }
}
