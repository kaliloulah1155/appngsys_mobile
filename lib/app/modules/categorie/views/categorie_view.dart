import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/categorie_controller.dart';

class CategorieView extends GetView<CategorieController> {
  const CategorieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      body: Obx(
          ()=> GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: controller.lstCategorie.length,
            itemBuilder: (context,index){
              var item=controller.lstCategorie[index];
              return controller.isDataProcessing ==false ? Text('Données non disponible') : GestureDetector(
                child: Card(
                    color: Colors.cyan,
                    elevation: 3.0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${item["LFR"]}',
                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 11),
                          ),
                          Text(
                             item["LEN"] == null ? 'NEANT':'${item["LEN"]}',
                             style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 11),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  //Get.snackbar("hi", "i am a modern snackbar");
                                  Get.toNamed("/detail?id=${item['ID']}&lfr=${item['LFR']}&len=${item['LEN']}&cod=${item['COD']}");
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.remove_circle),
                                onPressed: () {
                                  Get.snackbar("hi", "i am a modern snackbar");
                                 },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                ),
                onTap: (){
                  print('gesture detector');
                },
              );
            }
        ),
      ),
    );
  }
}
