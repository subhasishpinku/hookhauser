import 'package:get/get.dart';
import 'package:hookah_user/controller/aboutus_controller.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/controller/orderhistory_controller.dart';
import 'package:hookah_user/controller/profile_page_controller.dart';
import 'package:hookah_user/controller/tab_bar_controller.dart';

class InstanceBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AuthenticationController>(AuthenticationController());
    Get.put<ProfilePageController>(ProfilePageController());
    Get.put<TabBarController>(TabBarController());
    Get.put<AboutusController>(AboutusController());
    Get.put<OrderHistoryController>(OrderHistoryController());
  }
}
