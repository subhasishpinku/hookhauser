// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/product_controller.dart';
import 'package:hookah_user/models/ProductonsaleModels.dart';
import 'package:hookah_user/view/screens/checkout/checkout_page.dart';

@override
Widget createdProductContainer(
  BuildContext context, {
  required String url,
  required String productName,
  required dynamic price,
  String? productID,
  required int index,
  required int pid,
}) {
  final ProductController productController = Get.put(ProductController());
  return Container(
    margin: const EdgeInsets.only(right: 15, top: 10, bottom: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
    ),
    padding: const EdgeInsets.all(12),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140,
          width: 200,
          color: Colors.grey,
          child: Image.network(
            // 'https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg',
            url,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          // 'Lorem Ipsum',
          productName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              // ' ₹ 200',
              "₹ $price",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 40),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                ),
              ),
              onPressed: () {
                // productController.productID = productID!;
                //  print(index);
                // productController.addToCart(
                //     productID, productController.productonsale['list'], price,index,pid);

                productController.newAddToCart(pid);
              },
              child: const Text(
                'Add to cart',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
