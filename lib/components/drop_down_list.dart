// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hookah_user/controller/product_controller.dart';

// Widget dropdownList() {
//   final ProductController productController = Get.put(ProductController());
//   return DropdownButton(
//     hint: Text(
//       'Book Type',
//     ),
//     onChanged: (newValue) {
//       productController.setSelected(newValue);
//     },
//     value: productController.selected.value,
//     items: [
//       for (var i = 1; i < productController.product.length; i++)
//         DropdownMenuItem(
//           child: Text(
//             i.toString(),
//           ),
//           value: i.toString(),
//         )
//     ],
//   );
// }
