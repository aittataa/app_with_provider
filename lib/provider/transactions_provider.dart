import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/transactions.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/helper/data_helper.dart';

class TransactionsProvider extends ChangeNotifier {
  get loadData async {
    transactionList = await DataHelper.getAllTransactions;
    notifyListeners();
  }

  loadCount(int state) {
    return transactionList.where((transaction) => transaction.state == state).toList().fold(0, (a, b) => a + b.amount).toDouble();
  }

  addTransaction(Transactions transaction) async {
    var data = DataHelper.insertTransaction(transaction);
    notifyListeners();
    return data;
  }

  deleteTransaction(int id) async {
    var data = DataHelper.deleteTransaction(id);

    notifyListeners();
    return data;
  }
}
