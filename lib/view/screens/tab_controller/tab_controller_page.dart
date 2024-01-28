// ignore_for_file: prefer_const_constructors, prefer_final_fields
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/tab_bar_controller.dart';
import 'package:hookah_user/view/screens/sharepreferance.dart';
import 'package:shared_preferences/shared_preferences.dart';
class TabControllerPage extends StatelessWidget {
  final TabBarController tabBarController = Get.find<TabBarController>();
  
  // Future<void> _getToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? value = prefs.getString("token");
  //   print("userToken" + value!);
  // }

  // @override
  // void initState() {
  //   _getToken();

  // }

  TabControllerPage({Key? key}) : super(key: key);

  final List<IconData> iconList = [
    Icons.home,
    Icons.category,
    Icons.notifications,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => AnimatedBottomNavigationBar(
          elevation: 10,
          backgroundColor: Colors.white,
          activeColor: const Color(0xff020D4D),
          inactiveColor: Colors.grey,
          icons: iconList,
          leftCornerRadius: 30,
          rightCornerRadius: 30,
          activeIndex: tabBarController.currentIndex.value,
          gapLocation: GapLocation.none,
          onTap: (value) {
            tabBarController.currentIndex.value = value;
          },
        ),
      ),
      body: Obx(
        () => tabBarController.pages[tabBarController.currentIndex.value],
      ),
    );
  }
}
