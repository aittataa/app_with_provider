import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/statistic_controller.dart';

class StatisticView extends GetView<StatisticController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StatisticView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'StatisticView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
