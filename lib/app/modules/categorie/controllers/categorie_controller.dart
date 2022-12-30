import 'package:appngys/app/modules/categorie/providers/categorie_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieController extends GetxController {
  //TODO: Implement CategorieController

  final count = 0.obs;
  var lstCategorie = List<dynamic>.empty(growable: true).obs;
  @override
  void onInit() {
    super.onInit();
    CategorieProvider().get_categories().then((response) async {
      var responseJson = response.body;
      lstCategorie.addAll(responseJson['reponses']);
      print(lstCategorie.length);
    }, onError: (err) {
      print(err.toString());
      Get.snackbar("Error", err.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
