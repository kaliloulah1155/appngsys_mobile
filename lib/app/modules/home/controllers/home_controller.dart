
import 'package:appngys/app/modules/home/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController  {
  //TODO: Implement HomeController

  var lstAuth = List<dynamic>.empty(growable: true).obs;
  var token=null.obs;

  @override
  void onInit() {

    super.onInit();
      AuthProvider().get_auth().then((response) async {
        var responseJson = response.body;
       // print(responseJson['token'].toString());
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', responseJson['token'].toString());


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
  Future<void> onReady() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print('token = $token');
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


}
