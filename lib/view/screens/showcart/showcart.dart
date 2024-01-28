// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:hookah_user/components/bottom_sheet.dart';
// import 'package:hookah_user/controller/product_controller.dart';
// import 'package:hookah_user/controller/profile_page_controller.dart';
// import 'package:hookah_user/utils/constants/constants.dart';

// class ShowcartPage extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());
//   final ProfilePageController profilePageController =
//       Get.put(ProfilePageController());

//   var price;

//   ShowcartPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Add To Cart')),
//       body: Container(
//         padding: const EdgeInsets.all(8),
//         child: SingleChildScrollView(
//           child: Obx(() {
//             return productController.products.isEmpty
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(
//                         child: Text("Add To cart"),
//                       ),
//                     ],
//                   )
//                 : Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Obx(() {
//                       //   return
//                       Container(
//                         // height: 400,
//                         color: Colors.white,
//                         padding: const EdgeInsets.all(5),
//                         child: ListView.builder(
//                           shrinkWrap: true,
//                           itemCount:
//                               productController.cartshow['cart_list'].length,
//                           itemBuilder: (context, index) {
//                             // productController.productID = productController
//                             //         .productonsale['list']
//                             //     [productController.indexs]['product_code'];

//                             // productController.productID;
//                             // print("product" + productController.productID);

//                             return Column(
//                               children: [
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                           image: NetworkImage(
//                                             // 'https://m.media-amazon.com/images/I/615EWX23M7L._SL1349_.jpg',
//                                             productImageUrl +
//                                                 productController
//                                                     .cartshow['cart_list']
//                                                         [index]['image']
//                                                     .split(",")
//                                                     .first,
//                                           ),
//                                           fit: BoxFit.cover,
//                                         ),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       height: 65,
//                                       width: 65,
//                                     ),
//                                     Text(
//                                       productController.cartshow['cart_list']
//                                           [index]['name'],
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     Container(
//                                       decoration: BoxDecoration(
//                                         border: Border.all(
//                                             color: Colors.grey, width: 1),
//                                         borderRadius: BorderRadius.circular(10),
//                                       ),
//                                       margin: const EdgeInsets.all(10),
//                                       height: 35,
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           IconButton(
//                                             padding: EdgeInsets.only(
//                                                 left: 2, right: 2),
//                                             onPressed: () async {
//                                               await EasyLoading.show(
//                                                   status: "Loading");

//                                               double price = double.parse(
//                                                   productController
//                                                           .cartshow['cart_list']
//                                                       [index]['price']);
//                                               int count = 0;
//                                               if (productController
//                                                       .cartshow['cart_list']
//                                                       .length >
//                                                   1) {
//                                                 productController
//                                                     .cartshow['cart_list']
//                                                     .length -= 1;
//                                                 price -= price;

//                                                 // await Future.delayed(
//                                                 //     Duration(seconds: 1),
//                                                 //     () async {
//                                                 // Get.back();
//                                                 // Get.toNamed(
//                                                 //     "CHECKOUT_PAGE");
//                                                 await productController
//                                                     .totalPriceCount(
//                                                         productController
//                                                                     .cartshow[
//                                                                 'cart_list']
//                                                             [index]['price']);
//                                                 EasyLoading.dismiss();
//                                                 // });
//                                               } else {
//                                                 productController.products
//                                                     .remove(productController
//                                                             .cartshow[
//                                                         'cart_list'][index]);
//                                                 EasyLoading.dismiss();
//                                               }
//                                             },
//                                             icon: const Icon(
//                                               Icons.remove,
//                                               color: Colors.indigo,
//                                               size: 15,
//                                             ),
//                                           ),
//                                           Text(
//                                             // '${productController.products[index]['count']}',
//                                             '${productController
//                                                   .products.length}',

//                                             style: const TextStyle(
//                                                 fontSize: 12,
//                                                 fontWeight: FontWeight.bold),
//                                           ),
//                                           IconButton(
//                                             padding: EdgeInsets.all(0),
//                                             onPressed: () async {
//                                               await EasyLoading.show(
//                                                   status: "Loading");

//                                               double price = double.parse(
//                                                   productController
//                                                           .cartshow['cart_list']
//                                                       [index]['price']);
//                                               if (productController
//                                                   .products.length <
//                                                   productController
//                                                           .cartshow['cart_list']
//                                                       [index]['stock']) {
//                                                 productController
//                                                   .products.length += 1;

//                                                 price += price;

//                                                 await productController
//                                                     .totalPriceCount(
//                                                         productController
//                                                                     .cartshow[
//                                                                 'cart_list']
//                                                             [index]['price']);
//                                                 // await Future.delayed(
//                                                 //     Duration(seconds: 1),
//                                                 //     () async {
//                                                 //   Get.back();
//                                                 //   Get.toNamed(
//                                                 //       "CHECKOUT_PAGE");

//                                                 EasyLoading.dismiss();
//                                                 // });
//                                               } else {
//                                                 Fluttertoast.showToast(
//                                                     msg:
//                                                         "No more items in stock");
//                                                 EasyLoading.dismiss();
//                                               }
//                                             },
//                                             icon: const Icon(
//                                               Icons.add,
//                                               color: Colors.indigo,
//                                               size: 15,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Text(
//                                         '₹ ${productController.cartshow['cart_list'][index]['price']}'),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                       // }),
//                       Container(
//                         margin: const EdgeInsets.only(top: 20),
//                         padding: EdgeInsets.all(15),
//                         width: double.infinity,
//                         color: Colors.white,
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Text(
//                                 'Bill Details',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 20,
//                                 ),
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Item Total'),
//                                   Obx(
//                                     () => Text(
//                                       '₹ ${productController.totalPrice.value}',
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text(
//                                     'Delivery Fee | 4.0 kms',
//                                     style: TextStyle(color: Colors.blue),
//                                   ),
//                                   Text('₹ 29')
//                                 ],
//                               ),
//                               const Text(
//                                   'It is a long established fact that a reader'),
//                               SizedBox(height: 15),
//                               const Divider(color: Colors.black),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text('Delivery tip'),
//                                   Text('Add Tip',
//                                       style: TextStyle(color: Colors.indigo))
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: const [
//                                   Text('Taxes and charges',
//                                       style: TextStyle(color: Colors.blue)),
//                                   Text('₹ 44.7')
//                                 ],
//                               ),
//                               const SizedBox(height: 15),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('To Pay',
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.bold)),
//                                   Text(
//                                       '₹ ${productController.totalPrice.value}',
//                                       style: TextStyle(
//                                           color: Colors.indigo,
//                                           fontWeight: FontWeight.bold))
//                                 ],
//                               ),
//                             ]),
//                       ),
//                       Container(
//                         margin: const EdgeInsets.only(top: 25),
//                         color: Colors.white,
//                         child: Column(children: [
//                           Obx(
//                             () => ListTile(
//                               leading:
//                                   Image.asset('images/deliver_to_work.png'),
//                               title: productController.deliverTo.value == "work"
//                                   ? Text('Deliver to Work',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold))
//                                   : Text('Deliver to Home',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold)),
//                               subtitle: Text('Lorem Ipsum'),
//                               trailing: TextButton(
//                                 child: Text('Change',
//                                     style:
//                                         TextStyle(fontWeight: FontWeight.bold)),
//                                 onPressed: () {
//                                   showModalSheet(context);
//                                 },
//                               ),
//                             ),
//                           ),
//                           ListTile(
//                             title: Text(
//                                 '₹ ${productController.totalPrice.value}',
//                                 style: TextStyle(fontWeight: FontWeight.bold)),
//                             trailing: ElevatedButton(
//                               child: const Text(
//                                 'MAKE PAYMENT',
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               onPressed: () async {
//                                 if (productController.deliveryAddress.isEmpty) {
//                                   Fluttertoast.showToast(msg: "No address set");
//                                 } else {
//                                   Get.toNamed("PAYMENT_METHOD");
//                                 }
//                               },
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                         ]),
//                       ),
//                     ],
//                   );
//           }),
//         ),
//       ),
//     );
//   }
// }
