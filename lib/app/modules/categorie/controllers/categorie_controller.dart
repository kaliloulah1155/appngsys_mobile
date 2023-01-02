import 'package:appngys/app/modules/categorie/providers/categorie_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategorieController extends GetxController {
  //TODO: Implement CategorieController

  final count = 0.obs;
  var lstCategorie = List<dynamic>.empty(growable: true).obs;
  var isDataProcessing = true.obs;
  var id_categorie=''.obs;

  late TextEditingController lfrEditingController,lenEditingController,codEditingController;
   var isProcessing=false.obs;
  @override
  void onInit() {
    super.onInit();
     isDataProcessing(true);
    refreshList();
    lfrEditingController=TextEditingController();
    lenEditingController=TextEditingController();
    codEditingController=TextEditingController();
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
  void addCategorie(Map data){
    try{
      isProcessing(true);
      CategorieProvider().addCategorie(data).then((response){
        var responseJson = response.body;
        //print('response : ${response.body}');
        if(responseJson['message']=="Catégorie créée"){
          clearTextEditingController();
          isProcessing(false);
          Get.snackbar("Succès","Catégorie créée", colorText: Colors.white,backgroundColor: Colors.green,snackPosition:SnackPosition.BOTTOM);
          lstCategorie.clear();
          refreshList();

        }else{
          Get.snackbar("Créer catégorie","Echec de creation", colorText: Colors.white,backgroundColor: Colors.red,snackPosition:SnackPosition.BOTTOM);
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

  //Update Categorie
  void updateCategorie(Map data){
    try{
      isDataProcessing(true);
      CategorieProvider().updateCategorie(data).then((response){
        var responseJson = response.body;
        //print('response : ${response.body}');
        if(responseJson['message']=="Catégorie modifiée"){
          clearTextEditingController();
          isDataProcessing(false);
          Get.snackbar("Succès","Categorie modifiée", colorText: Colors.white,backgroundColor: Colors.green,snackPosition:SnackPosition.BOTTOM);
          lstCategorie.clear();
          refreshList();

        }else{
          Get.snackbar("Modifier catégorie","Echec de modification", colorText: Colors.white,backgroundColor: Colors.red,snackPosition:SnackPosition.BOTTOM);
        }
      },onError: (err){
        isDataProcessing(true);
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

  //Delete Categorie
  void deleteCategorie(var id){
    try{
      isDataProcessing(true);
      CategorieProvider().deleteCategorie(id).then((response){
        var responseJson = response.body;
        //print('response : ${response.body}');
        if(responseJson['message']=="Catégorie supprimée"){
          clearTextEditingController();
          isDataProcessing(false);
          Get.snackbar("Succès","Catégorie supprimée", colorText: Colors.white,backgroundColor: Colors.green,snackPosition:SnackPosition.BOTTOM);
          lstCategorie.clear();
          refreshList();

        }else{
          Get.snackbar("Supprimer catégorie","Echec de suppression", colorText: Colors.white,backgroundColor: Colors.red,snackPosition:SnackPosition.BOTTOM);
        }
      },onError: (err){
        isDataProcessing(true);
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
    codEditingController.clear();
  }
  void increment() => count.value++;
}
