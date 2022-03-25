import 'package:get/get.dart';
import 'package:user_listing/home/homecontroller/HomeController.dart';
import 'package:user_listing/home/repo/homerepo.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeRepo());
    Get.lazyPut(() => HomeController());
  }
}