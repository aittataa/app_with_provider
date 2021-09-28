import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/classes/transactions.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/provider/transactions_provider.dart';
import 'package:wallet_manager/widget/bounce_point.dart';
import 'package:wallet_manager/widget/empty_box.dart';
import 'package:wallet_manager/widget/transaction_item.dart';

class TransactionManager extends StatelessWidget {
  const TransactionManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionsProvider>(
      builder: (context, dataProvider, child) {
        dataProvider.loadData;
        if (transactionList.isNotEmpty) {
          final double incomes = dataProvider.loadCount(0);
          final double expenses = dataProvider.loadCount(1);
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
                  color: whiteBackColor,
                  boxShadow: [boxShadow],
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
                            touchCallback: (value) {
                              messageBox(context, message: value.touchInput.buttons.toString());
                            },
                          ),
                          sections: List.generate(2, (i) {
                            switch (i) {
                              case 0:
                                final bool state = incomes != 0;
                                return PieChartSectionData(
                                  value: state ? incomes : null,
                                  color: incomeColor,
                                  radius: 50,
                                  showTitle: state,
                                  title: "${incomes.toStringAsFixed(2)} ${appSettings.currency}",
                                  titleStyle: const TextStyle(
                                    color: blackTextColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );
                              case 1:
                                final bool state = expenses != 0;
                                return PieChartSectionData(
                                  value: state ? expenses : null,
                                  color: expenseColor,
                                  radius: 50,
                                  showTitle: state,
                                  title: "${expenses.toStringAsFixed(2)} ${appSettings.currency}",
                                  titleStyle: const TextStyle(
                                    color: blackTextColor,
                                    fontWeight: FontWeight.w900,
                                  ),
                                );

                              default:
                                throw "Oh no! Something Wrong";
                            }
                          }),
                        ),
                        swapAnimationDuration: duration,
                        swapAnimationCurve: curve,
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Balance",
                            style: TextStyle(
                              color: blackTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${balance.toStringAsFixed(2)} ${appSettings.currency}",
                            style: TextStyle(
                              color: balanceState ? incomeColor : expenseColor,
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
                itemCount: transactionList.length,
                itemBuilder: (context, i) {
                  Transactions transaction = transactionList[i];
                  return TransactionItem(
                    transaction: transaction,
                    onPressed: () async {
                      int id = transaction.id;
                      var data = dataProvider.deleteTransaction(id);
                      print(data);
                    },
                  );
                },
              ),
            ],
          );
        } else if (transactionList.isEmpty) {
          return const BouncePoint(size: 30);
        } else {
          return const EmptyBox();
        }
      },
    );
  }
}
