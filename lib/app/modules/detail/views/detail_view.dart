import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail : ${Get.parameters['lfr']}"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Text(
                "Libellé en francais : ${ Get.parameters['lfr'] == 'null' ? 'NEANT':'${Get.parameters['lfr']}'}",
                style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text(
                "Libellé en anglais : ${ Get.parameters['len'] == 'null' ? 'NEANT':'${Get.parameters['len']}'}",
                style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10,),
            Text(
              "Code : ${ Get.parameters['cod'] == 'null' ? 'NEANT':'${Get.parameters['cod']}'}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
