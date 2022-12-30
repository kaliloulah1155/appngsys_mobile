import 'package:appngys/app/modules/categorie/providers/categorie_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieController extends GetxController {
  //TODO: Implement CategorieController

  final count = 0.obs;
  var lstCategorie = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;

  @override
  void onInit() {
    super.onInit();
    //isDataProcessing(true);
    CategorieProvider().get_categories().then((response) async {
      var responseJson = response.body;
      print('responseJson =$responseJson');

     if(responseJson['reponses']=="Pas de categorie"){
       isDataProcessing(false);
     }else{
       isDataProcessing(true);
       lstCategorie.addAll(responseJson['reponses']);
     }

      //print(responseJson['reponses']);
    }, onError: (err) {
      isDataProcessing(false);
      print(err.toString());
      Get.snackbar("Error", err.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    });
   // print('isDataProcessing = $isDataProcessing');
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
