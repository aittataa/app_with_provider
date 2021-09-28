import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/classes/categories.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/provider/categories_provider.dart';
import 'package:wallet_manager/widget/add_button.dart';
import 'package:wallet_manager/widget/text_box.dart';

class CategoriesAdd extends StatelessWidget {
  final int index;
  CategoriesAdd({Key key, this.index}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(
      builder: (context, dataProvider, child) {
        dataProvider.loadData;
        return AlertDialog(
          contentPadding: EdgeInsets.all(10),
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          backgroundColor: backColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: mainColor, width: 2),
              ),
            ),
            child: Text(
              index == 0 ? Messages.NEW_INCOME : Messages.NEW_EXPENSIVE,
              style: const TextStyle(
                color: mainColor,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextBox(
                  index: index,
                  controller: controller,
                  hintText: index == 0 ? Messages.TYPE_NEW_INCOME : Messages.TYPE_NEW_EXPENSIVE,
                ),
                AddButton(
                  index: index,
                  title: Messages.ADD,
                  color: index == 0 ? incomeColor : expenseColor,
                  onPressed: () async {
                    if (controller.text.isNotEmpty) {
                      String title = controller.text.trim();
                      int color = getRandomColor;
                      Categories category = Categories(title: title, color: color, state: index);
                      var data = dataProvider.addCategory(category);
                      dataProvider.loadData;
                      print(data);
                    }
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
