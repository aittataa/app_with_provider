import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_manager/classes/settings.dart';
import 'package:wallet_manager/constant/constant.dart';
import 'package:wallet_manager/constant/messages.dart';
import 'package:wallet_manager/provider/settings_provider.dart';
import 'package:wallet_manager/widget/add_button.dart';
import 'package:wallet_manager/widget/dropdown_list.dart';

class SettingsManager extends StatefulWidget {
  const SettingsManager({Key key}) : super(key: key);
  @override
  _SettingsManagerState createState() => _SettingsManagerState();
}

class _SettingsManagerState extends State<SettingsManager> {
  @override
  void initState() {
    super.initState();
    selectedCurrency = appSettings.currency;
    selectedLanguage = Messages.languageEN;
  }

  String selectedCurrency;
  String selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, dataProvider, child) {
        dataProvider.loadData;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 150,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [boxShadow],
                  image: const DecorationImage(image: AssetImage(Messages.appIconRound)),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                minVerticalPadding: 0,
                leading: const SizedBox(
                  width: 100,
                  child: Text(
                    "${Messages.languageLabel} :",
                    style: TextStyle(color: blackTextColor, fontWeight: FontWeight.w900),
                  ),
                ),
                title: DropdownList(
                  hint: Messages.languageLabel,
                  value: selectedLanguage,
                  onChanged: (language) async {
                    setState(() => selectedLanguage = language);
                  },
                  myList: List.generate(languageList.length, (index) {
                    String language = languageList[index];
                    return DropdownMenuItem(
                      value: language,
                      child: Text(
                        language,
                        style: const TextStyle(
                          color: blackTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                minVerticalPadding: 0,
                leading: const SizedBox(
                  width: 100,
                  child: Text(
                    "${Messages.currencyLabel} :",
                    style: TextStyle(color: blackTextColor, fontWeight: FontWeight.w900),
                  ),
                ),
                title: DropdownList(
                  hint: Messages.currencyLabel,
                  value: selectedCurrency,
                  onChanged: (currency) async {
                    setState(() => selectedCurrency = currency);
                  },
                  myList: List.generate(currencyList.length, (index) {
                    String currency = currencyList[index];
                    return DropdownMenuItem(
                      value: currency,
                      child: Text(
                        currency,
                        style: const TextStyle(
                          color: blackTextColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }),
                ),
              ),
              ListTile(
                title: AddButton(
                  title: Messages.labelSave,
                  color: mainColor,
                  onPressed: () async {
                    final data = dataProvider.updateSettings(
                      Settings(id: 1, currency: selectedCurrency),
                    );
                    if (data != null) messageBox(context, message: Messages.saveMessage);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
