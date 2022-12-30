import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categorie_controller.dart';

class CategorieView extends GetView<CategorieController> {
  const CategorieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CategorieView'),
        centerTitle: true,
      ),
      body: GridView.builder(
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: controller.lstCategorie.length,
          itemBuilder: (context,index){
            var item=controller.lstCategorie[index];
            return Card(
                color: Colors.cyan,
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        '${item["LFR"]}',
                         style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 11),
                      ),
                      Text(
                        '${item["LEN"]}',
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 11),
                      ),
                    ],
                  ),
                ),
            );
          }
      ),
    );
  }
}
