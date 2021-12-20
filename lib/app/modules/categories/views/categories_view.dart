import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_online/app/config/messages/app_message.dart';
import 'package:wallet_online/app/modules/categories/controllers/categories_controller.dart';

class CategoriesView extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.labelCategories)),
    );
  }
}
