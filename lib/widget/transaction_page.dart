import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/categories.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/widget/add_button.dart';
import 'package:wallet_manager/widget/datetime_picker.dart';
import 'package:wallet_manager/widget/dropdown_list.dart';
import 'package:wallet_manager/widget/text_box.dart';

class TransactionPage extends StatelessWidget {
  final TextEditingController amountController;
  final TextEditingController descriptionController;
  final List<Categories> myList;
  final dynamic value;
  final int index;
  final Function onChanged;
  final Function onDateTimeChanged;
  final Function onPressed;
  const TransactionPage({
    Key key,
    this.amountController,
    this.descriptionController,
    this.myList,
    this.value,
    this.index,
    this.onChanged,
    this.onDateTimeChanged,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: TextBox(
                  index: index,
                  controller: amountController,
                  state: true,
                  hintText: Messages.AMOUNT,
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: DropdownList(
                  hint: Messages.CATEGORY,
                  value: value,
                  onChanged: onChanged,
                  myList: List.generate(myList.length, (index) {
                    Categories category = myList[index];
                    return DropdownMenuItem(
                      value: category.title,
                      child: Text(
                        category.title,
                        style: const TextStyle(
                          color: blackTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
          DateTimePicker(
            onDateTimeChanged: onDateTimeChanged,
          ),
          TextBox(
            controller: descriptionController,
            hintText: Messages.TYPE_MESSAGE,
            maxLines: 3,
          ),
          AddButton(
            index: index,
            title: Messages.ADD,
            color: index == 0 ? incomeColor : expenseColor,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
