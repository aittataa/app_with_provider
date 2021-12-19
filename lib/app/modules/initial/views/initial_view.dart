import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/initial_controller.dart';

class InitialView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InitialView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'InitialView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
