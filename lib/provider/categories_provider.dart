import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/categories.dart';
import 'package:wallet_manager/helper/data_helper.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Categories> categoriesList = [];
  get loadData async {
    categoriesList = await DataHelper.getAllCategories;
    notifyListeners();
  }

  List<Categories> loadCategories(int state) {
    return categoriesList.where((category) => category.state == state).toList();
  }

  addCategory(Categories category) async {
    var data = DataHelper.insertCategory(category);

    notifyListeners();
    return data;
  }
}
