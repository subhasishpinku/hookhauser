// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/product_controller.dart';

Widget chip(BuildContext context, {String? category, int? index}) {
  RxBool isChipSelected = false.obs;
  Color color = Colors.black;

  ProductController productController = Get.put(ProductController());

  // RxInt? selectedIndex;
  return Obx(
    () => ChoiceChip(
      onSelected: (value) {
        isChipSelected.value = value;
        isChipSelected.value ? color = Colors.white : color = Colors.black;
        productController.filterList(
          productList: productController.productonsale['list'],
          label: category!,
          index: index,
        );
        print("FILTER11 ${productController.filteredList}");
      },
      selected: isChipSelected.value,
      label: Text(
        category!,
        style: TextStyle(color: color),
      ),
    ),
  );
}
