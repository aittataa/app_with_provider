import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/classes/transactions.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/provider/categories_provider.dart';
import 'package:wallet_manager/provider/transactions_provider.dart';
import 'package:wallet_manager/widget/header_button.dart';
import 'package:wallet_manager/widget/transaction_page.dart';

class TransactionAdd extends StatefulWidget {
  const TransactionAdd({Key key}) : super(key: key);

  @override
  _TransactionAddState createState() => _TransactionAddState();
}

class _TransactionAddState extends State<TransactionAdd> {
  getCategoryID(String value, List myList) {
    return myList.where((category) => category.title == value).toList()[0].id;
  }

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: pageIndex);
  }

  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String selectedCategory = "";
  int idCategory = 0;
  DateTime dateTimeValue = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Consumer2<CategoriesProvider, TransactionsProvider>(
      builder: (context, categoryProvider, transactionProvider, child) {
        transactionProvider.loadData;
        final incomes = categoryProvider.loadCategories(0);
        final expenses = categoryProvider.loadCategories(1);
        selectedCategory = categoryProvider.loadCategories(pageIndex)[0].title;

        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Row(
            children: [
              HeaderButton(
                index: 0,
                title: Messages.INCOME,
                icon: CupertinoIcons.square_arrow_down_fill,
                onPressed: () {
                  pageIndex = 0;
                  controller.jumpToPage(pageIndex);
                  if (incomes.isNotEmpty) {
                    selectedCategory = incomes[0].title;
                  }
                },
              ),
              HeaderButton(
                index: 1,
                title: Messages.EXPENSIVE,
                icon: CupertinoIcons.square_arrow_up_fill,
                onPressed: () {
                  pageIndex = 1;
                  controller.jumpToPage(pageIndex);
                  if (expenses.isNotEmpty) {
                    selectedCategory = expenses[0].title;
                  }
                },
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.95,
            height: 300,
            child: Expanded(
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TransactionPage(
                    amountController: amountController,
                    descriptionController: descriptionController,
                    index: pageIndex,
                    myList: incomes..sort((a, b) => b.id.compareTo(a.id)),
                    value: selectedCategory,
                    onChanged: (category) {
                      FocusScope.of(context).unfocus();
                      setState(() => selectedCategory = category);
                      // idCategory = getCategoryID(selectedCategory, incomes);
                    },
                    onDateTimeChanged: (date) {
                      setState(() => dateTimeValue = date);
                    },
                    onPressed: () async {
                      try {
                        idCategory = getCategoryID(selectedCategory, incomes);
                        var data = transactionProvider.addTransaction(
                          Transactions(
                            description: descriptionController.text.trim(),
                            date: dateTimeValue ?? DateTime.now(),
                            amount: double.parse(amountController.text),
                            categoryID: idCategory,
                            state: pageIndex,
                          ),
                        );
                        print(data);
                      } catch (e) {
                        print("Something Wrong");
                      }
                      Navigator.pop(context);
                    },
                  ),
                  TransactionPage(
                    amountController: amountController,
                    descriptionController: descriptionController,
                    index: pageIndex,
                    myList: expenses..sort((a, b) => b.id.compareTo(a.id)),
                    value: selectedCategory,
                    onChanged: (category) {
                      FocusScope.of(context).unfocus();
                      setState(() => selectedCategory = category);
                      idCategory = getCategoryID(selectedCategory, expenses);
                    },
                    onDateTimeChanged: (date) {
                      setState(() => dateTimeValue = date ?? DateTime.now());
                    },
                    onPressed: () async {
                      try {
                        idCategory = getCategoryID(selectedCategory, expenses);
                        var data = transactionProvider.addTransaction(
                          Transactions(
                            description: descriptionController.text.trim(),
                            date: dateTimeValue ?? DateTime.now(),
                            amount: double.parse(amountController.text),
                            categoryID: idCategory,
                            state: pageIndex,
                          ),
                        );
                        print(data);
                      } catch (e) {
                        print("Something Wrong");
                      }
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
