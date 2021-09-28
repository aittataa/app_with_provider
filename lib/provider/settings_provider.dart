import 'package:flutter/material.dart';
import 'package:wallet_manager/classes/settings.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/helper/data_helper.dart';

class SettingsProvider extends ChangeNotifier {
  get loadData async {
    appSettings = await DataHelper.getSettings;
    notifyListeners();
  }

  updateSettings(Settings settings) async {
    var data = DataHelper.updateSettings(settings);
    notifyListeners();
    return data;
  }
}
