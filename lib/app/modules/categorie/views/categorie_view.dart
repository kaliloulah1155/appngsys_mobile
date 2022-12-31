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
      body: Obx(() {

        if(controller.isDataProcessing.value==true){
          return Center(
            child: Container(
              padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),)),
          );
        }else {
          return GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: controller.lstCategorie.length,
            itemBuilder: (context, index) {
              var item = controller.lstCategorie[index];
              return GestureDetector(
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
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        ),
                        Text(
                          item["LEN"] == null ? 'NEANT' : '${item["LEN"]}',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                //Get.snackbar("hi", "i am a modern snackbar");
                                Get.toNamed(
                                    "/detail?id=${item['ID']}&lfr=${item['LFR']}&len=${item['LEN']}&cod=${item['COD']}");
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
                onTap: () {
                  print('${item["ID"]}');
                  displayEditCategorieWindow(
                      controller.lstCategorie[index]['ID'],
                      controller.lfrEditingController.text =
                      controller.lstCategorie[index]['LFR'],
                      controller.lenEditingController.text =
                      controller.lstCategorie[index]['LEN']);
                },
              );
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Ajouter une catégorie'),
        icon: Icon(Icons.add),
        onPressed: (){
          print('ok add');
        },
        backgroundColor: Colors.lightBlue,
      ),
    );
  }

  void displayEditCategorieWindow(String id, String lfr, String len) {
    Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16), topLeft: Radius.circular(16)),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: ListView(
            children: [
              Column(
                children: [
                  Text(
                    'Modifier une catégorie',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Libellé en francais',
                        hintText: 'Libellé en francais',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    controller: controller.lfrEditingController,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Libellé en anglais',
                        hintText: 'Libellé en anglais',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    controller: controller.lenEditingController,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: Text('Valider'),
                        onPressed: () async {
                          controller.updateCategorie({
                            "id": id,
                            "lfr": controller.lfrEditingController.text,
                            "len": controller.lenEditingController.text
                          });
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
