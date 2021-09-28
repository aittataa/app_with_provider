import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';
import 'package:wallet_manager/classes/settings.dart';
import 'package:wallet_manager/classes/transactions.dart';
import 'package:wallet_manager/constant/messages.dart';

const Color mainColor = Color(0xFFFF8500);

const Color backColor = Color(0xFFF0F0F0);
const Color whiteBackColor = Color(0xFFFFFFFF);
const Color blackBackColor = Color(0xFF000000);

const Color transparentColor = Color(0x00000000);
const Color shadowColor = Color(0xFF000000);

const Color incomeColor = Color(0xff08ff00);
const Color expenseColor = Color(0xfffd0000);

const Color blackTextColor = Color(0xFF000000);
const Color whiteTextColor = Color(0xFFFFFFFF);

const Color blackIconColor = Color(0xFF000000);
const Color whiteIconColor = Color(0xFFFFFFFF);

String dateShape(DateTime date) => DateFormat('MMM dd, yyyy').format(date);

int get getRandomColor => Color(Random().nextInt(0xFFFFFFFF)).withAlpha(0xFF).value;

messageBox(context, {String message}) {
  return Toast.show(
    message,
    context,
    duration: Toast.LENGTH_LONG,
    gravity: Toast.BOTTOM,
    backgroundColor: mainColor,
    textColor: whiteTextColor,
  );
}

const List<String> languageList = [
  Messages.LANGUAGE_EN,
  Messages.LANGUAGE_AR,
  Messages.LANGUAGE_FR,
];

const List<String> currencyList = [
  Messages.CURRENCY_MAD,
  Messages.CURRENCY_USD,
  Messages.CURRENCY_EUR,
];

const List<String> pageTitle = [
  Messages.APP_TITLE,
  Messages.LABEL_CATEGORIES,
  Messages.LABEL_STATISTIC,
  Messages.LABEL_SETTINGS,
];

/// TODO : Index For Categories
int pageIndex = 0;
const Duration duration = Duration(milliseconds: 1500);
const Duration animateDuration = Duration(milliseconds: 1000);
const Curve curve = Curves.linearToEaseOut;
PageController controller;
animateToPage(index) {
  pageIndex = index;
  controller.animateToPage(
    index,
    duration: animateDuration,
    curve: curve,
  );
}

final boxShadow = BoxShadow(
  color: shadowColor.withOpacity(.1),
  blurRadius: 10,
  spreadRadius: 0.1,
);

/// TODO : My Data
Settings appSettings;
List<Transactions> transactionList = [];
