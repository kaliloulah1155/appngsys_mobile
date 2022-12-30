import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
                'Bienvenue sur la page de test api',
                style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
              ),
                child: Text('Cliquez ici'),
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  var token = prefs.getString('token');
                  Get.toNamed("/categorie", arguments: token);
                },
                )
          ],
        ),
      ),
    );
  }
}
