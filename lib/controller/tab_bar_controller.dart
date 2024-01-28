// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:hookah_user/view/screens/categories/categories_page.dart';
import 'package:hookah_user/view/screens/home/home.dart';
import 'package:hookah_user/view/screens/notification_page/notification_page.dart';
import 'package:hookah_user/view/screens/profile/profile_page.dart';

class TabBarController extends GetxController {
  RxInt currentIndex = 0.obs;

  List pages = [
    HomePage(),
    CategoriesPage(),
    NotificationPage(),
    ProfilePage(),
  ];
}