import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categorie_controller.dart';

class CategorieView extends GetView<CategorieController> {
  const CategorieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategorieView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          Get.arguments,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
