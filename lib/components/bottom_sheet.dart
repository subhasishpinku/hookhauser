// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/product_controller.dart';
import 'package:hookah_user/controller/profile_page_controller.dart';

void showModalSheet(BuildContext context) {
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  final ProductController productController = Get.put(ProductController());

  showModalBottomSheet(
    context: context,
    builder: (builder) {
      return Container(
        height: 200.0,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () async {
                if (profilePageController.home.isEmpty) {
                  Fluttertoast.showToast(msg: "Home address not set");
                } else {
                  productController.deliverTo.value = "home";
                  productController
                      .setDeliveryAddress(profilePageController.home);
                  Get.back();
                }
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    Card(
                      shape: Border.all(
                        color: Colors.grey,
                      ),
                      elevation: 5,
                      child: Center(
                        child: Text(
                          "Home",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Obx(
                        () {
                          return productController.deliverTo.value == "home"
                              ? Icon(
                                  Icons.check_circle,
                                )
                              : Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                if (profilePageController.work.isEmpty) {
                  Fluttertoast.showToast(msg: "Work address not set");
                } else {
                  productController.deliverTo.value = "work";
                  productController
                      .setDeliveryAddress(profilePageController.work);
                  Get.back();
                }
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    Card(
                      shape: Border.all(
                        color: Colors.grey,
                      ),
                      elevation: 5,
                      child: Center(
                        child: Text(
                          "Work",
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Obx(
                        () {
                          return productController.deliverTo.value == "work"
                              ? Icon(
                                  Icons.check_circle,
                                )
                              : Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
