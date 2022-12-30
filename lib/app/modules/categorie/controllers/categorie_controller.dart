import 'package:appngys/app/modules/categorie/providers/categorie_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieController extends GetxController {
  //TODO: Implement CategorieController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    CategorieProvider().get_categories().then((response) async {
      var responseJson = response.body;
      print(responseJson);
      // print(responseJson['token'].toString());
      //final prefs = await SharedPreferences.getInstance();
      //await prefs.setString('token', responseJson['token'].toString());


    }, onError: (err) {
      //change(null,status: RxStatus.error(err.toString()));
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
