import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_online/app/config/constants/app_constant.dart';
import 'package:wallet_online/app/config/messages/app_message.dart';
import 'package:wallet_online/app/config/themes/app_theme.dart';
import 'package:wallet_online/app/data/models/transactions.dart';
import 'package:wallet_online/app/modules/home/controllers/home_controller.dart';
import 'package:wallet_online/app/modules/home/widgets/transaction_shape.dart';
import 'package:wallet_online/app/shared/bounce_point.dart';
import 'package:wallet_online/app/shared/empty_box.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppMessage.appTitle),
        centerTitle: true,
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (state) {
          return BouncePoint(state: true);
        } else {
          final List<Transactions> myList = controller.transactions;
          final bool isEmpty = myList.isEmpty;
          if (isEmpty) {
            return EmptyBox();
          } else {
            final double incomes = myList.where((transaction) => transaction!.state == 0).toList().fold(0, (a, b) => a! + b!.amount!).toDouble();
            final double expenses = 0; // = controller.loadCount(1);
            final balance = incomes - expenses;
            final balanceState = balance >= 0;
            return ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(10),
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  height: 250,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBackColor,
                    boxShadow: [AppConstant.boxShadow],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: PieChart(
                          PieChartData(
                            sectionsSpace: 1,
                            borderData: FlBorderData(show: false),
                            pieTouchData: PieTouchData(
                              enabled: true,
                              // touchCallback: (value) {
                              //   messageBox(context, message: value.touchInput.buttons.toString());
                              // },
                            ),
                            sections: List.generate(2, (i) {
                              switch (i) {
                                case 0:
                                  final bool state = incomes != 0;
                                  return PieChartSectionData(
                                    value: state ? incomes : null,
                                    color: AppTheme.incomeColor,
                                    radius: 50,
                                    showTitle: state,
                                    title: "${incomes.toStringAsFixed(2)} MAD",
                                    titleStyle: const TextStyle(
                                      color: AppTheme.primaryTextColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  );
                                case 1:
                                  final bool state = expenses != 0;
                                  return PieChartSectionData(
                                    value: state ? expenses : null,
                                    color: AppTheme.expenseColor,
                                    radius: 50,
                                    showTitle: state,
                                    title: "${expenses.toStringAsFixed(2)} MAD",
                                    titleStyle: const TextStyle(
                                      color: AppTheme.primaryTextColor,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  );

                                default:
                                  throw "Oh no! Something Wrong";
                              }
                            }),
                          ),
                          swapAnimationDuration: AppConstant.durationSwap,
                          swapAnimationCurve: AppConstant.curve,
                        ),
                      ),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppMessage.balance,
                              style: TextStyle(
                                color: AppTheme.primaryTextColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${balance.toStringAsFixed(2)} MAD",
                              style: TextStyle(
                                color: balanceState ? AppTheme.incomeColor : AppTheme.expenseColor,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(5),
                  physics: const BouncingScrollPhysics(),
                  itemCount: myList.length,
                  itemBuilder: (context, i) {
                    Transactions transaction = myList[i];
                    //return SizedBox();

                    return TransactionShape(
                      transaction: transaction,
                      onPressed: () async {
                        // int id = transaction.id;
                        // var data = dataProvider.deleteTransaction(id);
                        // print(data);
                      },
                    );
                  },
                ),
              ],
            );
          }
        }
      }),
    );
  }
}
