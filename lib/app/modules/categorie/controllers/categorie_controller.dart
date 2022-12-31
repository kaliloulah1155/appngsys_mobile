import 'package:appngys/app/modules/categorie/providers/categorie_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieController extends GetxController {
  //TODO: Implement CategorieController

  final count = 0.obs;
  var lstCategorie = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = false.obs;
  var id_categorie=''.obs;

  late TextEditingController lfrEditingController,lenEditingController;
   var isProcessing=false.obs;
  @override
  void onInit() {
    super.onInit();
    //isDataProcessing(true);
    refreshList();
    lfrEditingController=TextEditingController();
    lenEditingController=TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  void refreshList() async{
    CategorieProvider().get_categories().then((response) async {
      var responseJson = response.body;
      print('responseJson =$responseJson');
      isDataProcessing(true);
      if(responseJson['reponses']=="Pas de categorie"){
        isDataProcessing(true);
      }else{
        isDataProcessing(false);
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
  }

  //Update Task
  void updateCategorie(Map data){
    try{
      isProcessing(true);
      CategorieProvider().updateCategorie(data).then((response){
        var responseJson = response.body;
        //print('response : ${response.body}');
        if(responseJson['message']=="Catégorie modifiée"){
          clearTextEditingController();
          isProcessing(false);
          Get.snackbar("Succès","Categorie modifiée", colorText: Colors.white,backgroundColor: Colors.green,snackPosition:SnackPosition.BOTTOM);
          lstCategorie.clear();
          refreshList();

        }else{
          Get.snackbar("Modifier catégorie","Echec de modification", colorText: Colors.white,backgroundColor: Colors.red,snackPosition:SnackPosition.BOTTOM);
        }
      },onError: (err){
        isProcessing(true);
        Get.snackbar("Error", err.toString(), colorText: Colors.red);
      });

    }catch(exception){
      isProcessing(true);
      Get.snackbar("Exception", exception.toString(),
          colorText: Colors.black,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //Delete Task
  void deleteCategorie(var id){
    try{
      isProcessing(true);
      CategorieProvider().deleteCategorie(id).then((response){
        var responseJson = response.body;
        //print('response : ${response.body}');
        if(responseJson['message']=="Catégorie supprimée"){
          clearTextEditingController();
          isProcessing(false);
          Get.snackbar("Succès","Catégorie supprimée", colorText: Colors.white,backgroundColor: Colors.green,snackPosition:SnackPosition.BOTTOM);
          lstCategorie.clear();
          refreshList();

        }else{
          Get.snackbar("Supprimer catégorie","Echec de suppression", colorText: Colors.white,backgroundColor: Colors.red,snackPosition:SnackPosition.BOTTOM);
        }
      },onError: (err){
        isProcessing(true);
        Get.snackbar("Error", err.toString(), colorText: Colors.red);
      });

    }catch(exception){
      isProcessing(true);
      Get.snackbar("Exception", exception.toString(),
          colorText: Colors.black,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
  void clearTextEditingController(){
    lfrEditingController.clear();
    lenEditingController.clear();
  }
  void increment() => count.value++;
}
