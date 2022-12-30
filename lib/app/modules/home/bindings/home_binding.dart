import 'dart:developer';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../providers/auth_provider.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<HomeController>(HomeController());
    /*Get.lazyPut(
      () => HomeController(),
    );*/
  }
}
