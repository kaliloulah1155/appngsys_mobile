import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DetailController>(DetailController());
   /* Get.lazyPut<DetailController>(
      () => DetailController(),
    );*/
  }
}
