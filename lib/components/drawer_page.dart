// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/drawer_item.dart';
import 'package:hookah_user/controller/aboutus_controller.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/controller/orderhistory_controller.dart';
import 'package:hookah_user/controller/profile_page_controller.dart';
import 'package:hookah_user/controller/tab_bar_controller.dart';
import 'package:share_plus/share_plus.dart';

Widget drawer(BuildContext context) {
  final TabBarController tabController = Get.find<TabBarController>();
  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();
  final AboutusController aboutPageController = Get.put(AboutusController());
  final OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());
  getAboutPage() async {
    await aboutPageController.aboutContent();
  }

  getOrderHistoryPage() async {
    await orderHistoryController.orderHistory();
  }

  return Scaffold(
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: FloatingActionButton(
      backgroundColor: const Color(0xff020D4D),
      child: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.clear_outlined,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        Scaffold.of(context).openEndDrawer();
      },
    ),
    body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xffC34072),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(350),
            ),
          ),
          height: MediaQuery.of(context).size.height * .88,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff020D4D),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(350),
            ),
          ),
          height: MediaQuery.of(context).size.height * .84,
        ),
        ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                // Get.back();
                if (tabController.currentIndex.value == 0) {
                  Get.back();
                } else {
                  Get.back();
                  Get.offAllNamed("TAB_CONTROLLER_PAGE");
                }
              },
              child: menuContainer(
                icon: Icons.home,
                title: 'Home',
              ),
            ),
            // TODO: fix the page
            InkWell(
              onTap: () {
                // Get.toNamed("ORDER_HISTORY");
                getOrderHistoryPage();
              },
              child: menuContainer(
                icon: Icons.history,
                title: 'Order History',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed("CHECKOUT_PAGE");
              },
              child: menuContainer(
                icon: Icons.shopping_cart,
                title: 'My Cart',
              ),
            ),
            menuContainer(
              icon: Icons.offline_pin_rounded,
              title: 'Order Status',
            ),
            InkWell(
              onTap: () {
                Get.toNamed("PAYMENT_METHOD");
              },
              child: menuContainer(
                icon: Icons.account_balance_wallet,
                title: 'Payment Method',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed("WALLET");
              },
              child: menuContainer(
                icon: Icons.wallet,
                title: 'Wallet',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed("SUBSCRIPTION");
              },
              child: menuContainer(
                icon: Icons.subscriptions,
                title: 'Subscription',
              ),
            ),

            InkWell(
              onTap: () async {
                Share.share('check out my website https://example.com',
                    subject: 'Look what I made!');
              },
              child: menuContainer(
                icon: Icons.share,
                title: 'Share the app',
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed("ABOUT_US_PAGE");
                getAboutPage();
              },
              child: menuContainer(
                icon: Icons.info_outline,
                title: 'About us',
              ),
            ),
            menuContainer(
              icon: Icons.help,
              title: 'Support',
            ),
            const SizedBox(
              height: 20,
            ),

            InkWell(
              onTap: () async {
                // await authenticationController.signOut();
                Get.offAllNamed('LOGIN');
              },
              child: menuContainer(
                icon: Icons.logout,
                title: 'Logout',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
