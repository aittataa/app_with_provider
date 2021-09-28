import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wallet_manager/classes/transactions.dart';
import 'package:wallet_manager/constant/constant.dart';

class TransactionItem extends StatelessWidget {
  final Transactions transaction;
  final Function onPressed;
  final Function onTap;
  const TransactionItem({Key key, this.transaction, this.onTap, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: whiteBackColor,
        boxShadow: [boxShadow],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero.copyWith(left: 10),
        horizontalTitleGap: 0,
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * .25,
          child: Text(
            (transaction.state == 0 ? "+" : "-") + "${transaction.amount.toStringAsFixed(2)} ${appSettings.currency}",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: transaction.state == 0 ? incomeColor : expenseColor,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              transaction.categoryTitle,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: blackTextColor, //.withOpacity(.9),
                fontWeight: FontWeight.w900,
              ),
            ),
            if (transaction.description.isNotEmpty)
              Expanded(
                child: Text(
                  " - ${transaction.description}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: blackTextColor.withOpacity(.75),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        subtitle: Text(
          dateShape(transaction.date),
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: blackTextColor.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          onPressed: onPressed,
          color: mainColor,
          padding: EdgeInsets.zero,
          splashColor: transparentColor,
          highlightColor: transparentColor,
          icon: const Icon(CupertinoIcons.trash_fill),
        ),
      ),
    );
  }
}
