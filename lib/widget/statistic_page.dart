import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/categories.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/widget/bounce_point.dart';
import 'package:wallet_manager/widget/category_item.dart';
import 'package:wallet_manager/widget/empty_box.dart';

class StatisticPage extends StatelessWidget {
  final List<Categories> myList;
  const StatisticPage({Key key, this.myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (myList.isNotEmpty) {
      return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 215,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: whiteBackColor,
              boxShadow: [boxShadow],
              borderRadius: BorderRadius.circular(25),
            ),
            child: PieChart(
              PieChartData(
                sectionsSpace: 1,
                centerSpaceRadius: 1,
                borderData: FlBorderData(show: false),
                sections: List.generate(myList.length, (i) {
                  Categories category = myList[i];
                  return PieChartSectionData(
                    value: category.total,
                    color: Color(category.color),
                    radius: 100,
                    titlePositionPercentageOffset: .75,
                    title: "${category.total.toStringAsFixed(2)} ${appSettings.currency}",
                    titleStyle: const TextStyle(
                      color: blackTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                    ),
                  );
                }),
              ),
              swapAnimationDuration: duration,
              swapAnimationCurve: curve,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(5),
            itemCount: myList.length,
            itemBuilder: (context, i) {
              Categories category = myList[i];
              return CategoryItem(
                category: category,
                enable: true,
              );
            },
          ),
        ],
      );
    } else if (myList.isEmpty) {
      return const BouncePoint(size: 30);
    } else {
      return const EmptyBox();
    }
  }
}
