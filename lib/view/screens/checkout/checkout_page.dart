// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:hookah_user/components/bottom_sheet.dart';
// import 'package:hookah_user/controller/product_controller.dart';
// import 'package:hookah_user/controller/profile_page_controller.dart';
// import 'package:hookah_user/utils/constants/constants.dart';

// class CheckOutPage extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());
//   final ProfilePageController profilePageController =
//       Get.put(ProfilePageController());

//   var price;

//   CheckOutPage({Key? key}) : super(key: key);

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
//                       Obx(() {
//                         return Container(
//                           // height: 400,
//                           color: Colors.white,
//                           padding: const EdgeInsets.all(5),
//                           // child: ListView.builder(
//                           //   shrinkWrap: true,
//                           //   itemCount: productController.products.length,
//                           //   itemBuilder: (context, index) {
//                           //     productController.productID = productController
//                           //         .productonsale['list'][index]['product_code'];
//                           //     // productController.productID;
//                           //     print("product" + productController.productID);
//                           //     return Column(
//                           //       children: [
//                           //         SizedBox(
//                           //           height: 10,
//                           //         ),
//                           //         Row(
//                           //           mainAxisAlignment:
//                           //               MainAxisAlignment.spaceAround,
//                           //           children: [
//                           //             Container(
//                           //               decoration: BoxDecoration(
//                           //                 image: DecorationImage(
//                           //                   image: NetworkImage(
//                           //                     // 'https://m.media-amazon.com/images/I/615EWX23M7L._SL1349_.jpg',
//                           //                     productImageUrl +
//                           //                         productController
//                           //                             .productonsale['list']
//                           //                                 [index]
//                           //                                 ['product_image']
//                           //                             .split(",")
//                           //                             .first,
//                           //                   ),
//                           //                   fit: BoxFit.cover,
//                           //                 ),
//                           //                 borderRadius:
//                           //                     BorderRadius.circular(10),
//                           //               ),
//                           //               height: 65,
//                           //               width: 65,
//                           //             ),
//                           //             Text(
//                           //               productController.productonsale['list']
//                           //                   [index]['name'],
//                           //               overflow: TextOverflow.ellipsis,
//                           //             ),
//                           //             Container(
//                           //               decoration: BoxDecoration(
//                           //                 border: Border.all(
//                           //                     color: Colors.grey, width: 1),
//                           //                 borderRadius:
//                           //                     BorderRadius.circular(10),
//                           //               ),
//                           //               margin: const EdgeInsets.all(10),
//                           //               height: 35,
//                           //               child: Row(
//                           //                 mainAxisAlignment:
//                           //                     MainAxisAlignment.start,
//                           //                 crossAxisAlignment:
//                           //                     CrossAxisAlignment.center,
//                           //                 children: [
//                           //                   IconButton(
//                           //                     padding: EdgeInsets.only(
//                           //                         left: 2, right: 2),
//                           //                     onPressed: () async {
//                           //                       await EasyLoading.show(
//                           //                           status: "Loading");

//                           //                       // if (productController
//                           //                       //             .products[index]
//                           //                       //         ['count'] >
//                           //                       //     1) {
//                           //                       //   productController
//                           //                       //           .products[index]
//                           //                       //       ['count'] -= 1;
//                           //                       //   productController
//                           //                       //               .products[index]
//                           //                       //           ['total_price'] -=
//                           //                       //       productController
//                           //                       //               .products[index]
//                           //                       //           ['product_price'];

//                           //                       //   // await Future.delayed(
//                           //                       //   //     Duration(seconds: 1),
//                           //                       //   //     () async {
//                           //                       //   // Get.back();
//                           //                       //   // Get.toNamed(
//                           //                       //   //     "CHECKOUT_PAGE");
//                           //                       //   await productController
//                           //                       //       .totalPriceCount();

//                           //                       //   EasyLoading.dismiss();
//                           //                       //   // });
//                           //                       // }
//                           //                       double price = double.parse(
//                           //                           productController
//                           //                                       .productonsale[
//                           //                                   'list'][index]
//                           //                               ['price']);
//                           //                       int count = 0;
//                           //                       if (productController
//                           //                               .products.length >
//                           //                           1) {
//                           //                         productController
//                           //                             .products.length -= 1;
//                           //                         price -= price;

//                           //                         // await Future.delayed(
//                           //                         //     Duration(seconds: 1),
//                           //                         //     () async {
//                           //                         // Get.back();
//                           //                         // Get.toNamed(
//                           //                         //     "CHECKOUT_PAGE");
//                           //                         await productController
//                           //                             .totalPriceCount(
//                           //                                 productController
//                           //                                             .productonsale[
//                           //                                         'list'][index]
//                           //                                     ['price']);
//                           //                         EasyLoading.dismiss();
//                           //                         // });
//                           //                       } else {
//                           //                         productController.products
//                           //                             .remove(productController
//                           //                                 .products[index]);
//                           //                         EasyLoading.dismiss();
//                           //                       }
//                           //                       print(
//                           //                           productController.products);
//                           //                     },
//                           //                     icon: const Icon(
//                           //                       Icons.remove,
//                           //                       color: Colors.indigo,
//                           //                       size: 15,
//                           //                     ),
//                           //                   ),
//                           //                   Text(
//                           //                     // '${productController.products[index]['count']}',
//                           //                     '${productController.products.length}',
//                           //                     style: const TextStyle(
//                           //                         fontSize: 12,
//                           //                         fontWeight: FontWeight.bold),
//                           //                   ),
//                           //                   IconButton(
//                           //                     padding: EdgeInsets.all(0),
//                           //                     onPressed: () async {
//                           //                       await EasyLoading.show(
//                           //                           status: "Loading");

//                           //                       // if (productController
//                           //                       //             .products[index]
//                           //                       //         ['count'] <
//                           //                       //     productController
//                           //                       //             .products[index]
//                           //                       //         ['max_quantity']) {
//                           //                       //   productController
//                           //                       //           .products[index]
//                           //                       //       ['count'] += 1;

//                           //                       //   productController
//                           //                       //               .products[index]
//                           //                       //           ['total_price'] +=
//                           //                       //       productController
//                           //                       //               .products[index]
//                           //                       //           ['product_price'];

//                           //                       //   await productController
//                           //                       //       .totalPriceCount();
//                           //                       //   // await Future.delayed(
//                           //                       //   //     Duration(seconds: 1),
//                           //                       //   //     () async {
//                           //                       //   //   Get.back();
//                           //                       //   //   Get.toNamed(
//                           //                       //   //       "CHECKOUT_PAGE");

//                           //                       //   EasyLoading.dismiss();
//                           //                       //   // });
//                           //                       // }
//                           //                       double price = double.parse(
//                           //                           productController
//                           //                                       .productonsale[
//                           //                                   'list'][index]
//                           //                               ['price']);
//                           //                       int count = 0;
//                           //                       if (productController
//                           //                               .products.length <
//                           //                           productController
//                           //                                       .productonsale[
//                           //                                   'list'][index]
//                           //                               ['stock']) {
//                           //                         productController
//                           //                             .products.length += 1;

//                           //                         price += price;

//                           //                         await productController
//                           //                             .totalPriceCount(
//                           //                                 productController
//                           //                                             .productonsale[
//                           //                                         'list'][index]
//                           //                                     ['price']);
//                           //                         // await Future.delayed(
//                           //                         //     Duration(seconds: 1),
//                           //                         //     () async {
//                           //                         //   Get.back();
//                           //                         //   Get.toNamed(
//                           //                         //       "CHECKOUT_PAGE");

//                           //                         EasyLoading.dismiss();
//                           //                         // });
//                           //                       } else {
//                           //                         Fluttertoast.showToast(
//                           //                             msg:
//                           //                                 "No more items in stock");
//                           //                         EasyLoading.dismiss();
//                           //                       }

//                           //                       print(
//                           //                           productController.products);
//                           //                     },
//                           //                     icon: const Icon(
//                           //                       Icons.add,
//                           //                       color: Colors.indigo,
//                           //                       size: 15,
//                           //                     ),
//                           //                   ),
//                           //                 ],
//                           //               ),
//                           //             ),
//                           //             // Text(
//                           //             //     '₹ ${productController.products[index]['total_price']}'),

//                           //             //      ),
//                           //             Text(
//                           //                 '₹ ${productController.productonsale['list'][index]['price']}'),
//                           //             SizedBox(
//                           //               height: 10,
//                           //             ),
//                           //           ],
//                           //         ),
//                           //       ],
//                           //     );
//                           //   },
//                           // ),
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(
//                                         image: NetworkImage(
//                                           // 'https://m.media-amazon.com/images/I/615EWX23M7L._SL1349_.jpg',
//                                           productImageUrl +
//                                               productController
//                                                   .productonsale['list']
//                                                       [productController.indexs]
//                                                       ['product_image']
//                                                   .split(",")
//                                                   .first,
//                                         ),
//                                         fit: BoxFit.cover,
//                                       ),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     height: 65,
//                                     width: 65,
//                                   ),
//                                   Text(
//                                     productController.productonsale['list']
//                                         [productController.indexs]['name'],
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.grey, width: 1),
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     margin: const EdgeInsets.all(10),
//                                     height: 35,
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         IconButton(
//                                           padding: EdgeInsets.only(
//                                               left: 2, right: 2),
//                                           onPressed: () async {
//                                             await EasyLoading.show(
//                                                 status: "Loading");

//                                             // if (productController
//                                             //             .products[index]
//                                             //         ['count'] >
//                                             //     1) {
//                                             //   productController
//                                             //           .products[index]
//                                             //       ['count'] -= 1;
//                                             //   productController
//                                             //               .products[index]
//                                             //           ['total_price'] -=
//                                             //       productController
//                                             //               .products[index]
//                                             //           ['product_price'];

//                                             //   // await Future.delayed(
//                                             //   //     Duration(seconds: 1),
//                                             //   //     () async {
//                                             //   // Get.back();
//                                             //   // Get.toNamed(
//                                             //   //     "CHECKOUT_PAGE");
//                                             //   await productController
//                                             //       .totalPriceCount();

//                                             //   EasyLoading.dismiss();
//                                             //   // });
//                                             // }
//                                             double price = double.parse(
//                                                 productController
//                                                         .productonsale['list'][
//                                                     productController
//                                                         .indexs]['price']);
//                                             int count = 0;
//                                             if (productController
//                                                     .products.length >
//                                                 1) {
//                                               productController
//                                                   .products.length -= 1;
//                                               price -= price;

//                                               // await Future.delayed(
//                                               //     Duration(seconds: 1),
//                                               //     () async {
//                                               // Get.back();
//                                               // Get.toNamed(
//                                               //     "CHECKOUT_PAGE");
//                                               await productController
//                                                   .totalPriceCount(
//                                                       productController
//                                                                   .productonsale[
//                                                               'list'][
//                                                           productController
//                                                               .indexs]['price']);

//                                               EasyLoading.dismiss();
//                                               productController.addtocard(
//                                                   productController.pid,
//                                                   productController
//                                                       .products.length,productController
//                                                                   .productonsale[
//                                                               'list'][
//                                                           productController
//                                                               .indexs]['price']);
//                                               // });
//                                             } else {
//                                               productController.products.remove(
//                                                   productController.products[
//                                                       productController
//                                                           .indexs]);
//                                               EasyLoading.dismiss();
//                                             }
//                                             print(productController.products);
//                                           },
//                                           icon: const Icon(
//                                             Icons.remove,
//                                             color: Colors.indigo,
//                                             size: 15,
//                                           ),
//                                         ),
//                                         Text(
//                                           // '${productController.products[index]['count']}',
//                                           '${productController.products.length}',
//                                           style: const TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                         IconButton(
//                                           padding: EdgeInsets.all(0),
//                                           onPressed: () async {
//                                             await EasyLoading.show(
//                                                 status: "Loading");

//                                             // if (productController
//                                             //             .products[index]
//                                             //         ['count'] <
//                                             //     productController
//                                             //             .products[index]
//                                             //         ['max_quantity']) {
//                                             //   productController
//                                             //           .products[index]
//                                             //       ['count'] += 1;

//                                             //   productController
//                                             //               .products[index]
//                                             //           ['total_price'] +=
//                                             //       productController
//                                             //               .products[index]
//                                             //           ['product_price'];

//                                             //   await productController
//                                             //       .totalPriceCount();
//                                             //   // await Future.delayed(
//                                             //   //     Duration(seconds: 1),
//                                             //   //     () async {
//                                             //   //   Get.back();
//                                             //   //   Get.toNamed(
//                                             //   //       "CHECKOUT_PAGE");

//                                             //   EasyLoading.dismiss();
//                                             //   // });
//                                             // }
//                                             double price = double.parse(
//                                                 productController
//                                                         .productonsale['list'][
//                                                     productController
//                                                         .indexs]['price']);
//                                             int count = 0;
//                                             if (productController
//                                                     .products.length <
//                                                 productController
//                                                         .productonsale['list'][
//                                                     productController
//                                                         .indexs]['stock']) {
//                                               productController
//                                                   .products.length += 1;

//                                               price += price;

//                                               await productController
//                                                   .totalPriceCount(
//                                                       productController
//                                                                   .productonsale[
//                                                               'list'][
//                                                           productController
//                                                               .indexs]['price']);
//                                               // await Future.delayed(
//                                               //     Duration(seconds: 1),
//                                               //     () async {
//                                               //   Get.back();
//                                               //   Get.toNamed(
//                                               //       "CHECKOUT_PAGE");

//                                               EasyLoading.dismiss();
//                                               productController.addtocard(
//                                                   productController.pid,
//                                                   productController
//                                                       .products.length,productController
//                                                                   .productonsale[
//                                                               'list'][
//                                                           productController
//                                                               .indexs]['price']);
//                                               // });
//                                             } else {
//                                               Fluttertoast.showToast(
//                                                   msg:
//                                                       "No more items in stock");
//                                               EasyLoading.dismiss();
//                                             }

//                                             print(productController.products);
//                                           },
//                                           icon: const Icon(
//                                             Icons.add,
//                                             color: Colors.indigo,
//                                             size: 15,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   // Text(
//                                   //     '₹ ${productController.products[index]['total_price']}'),

//                                   //      ),
//                                   Text(
//                                       '₹ ${productController.productonsale['list'][productController.indexs]['price']}'),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }),
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

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/bottom_sheet.dart';
import 'package:hookah_user/controller/payment_controller.dart';
import 'package:hookah_user/controller/product_controller.dart';
import 'package:hookah_user/controller/profile_page_controller.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:quantupi/quantupi.dart';
import 'package:http/http.dart' as http;

class CheckOutPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());
  final PaymentController paymentController = Get.put(PaymentController());

  CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check out')),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Obx(() {
            return productController.products.isEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("cart is empty!"),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return Container(
                          // height: 400,
                          color: Colors.white,
                          padding: const EdgeInsets.all(5),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: productController.products.length,
                            itemBuilder: (context, index) {
                              // productController.productID =
                              //     productController.products[index]['pid'];

                              // print(
                              //     "sjkfdhisjhfs ${productController.productID}");

                              return Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          productController.productID =
                                              productController.products[index]
                                                  ['pid'];

                                          print(
                                              "sjkfdhisjhfs ${productController.productID}");
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  // 'https://m.media-amazon.com/images/I/615EWX23M7L._SL1349_.jpg',
                                                  // productController.products[index]
                                                  //     ['product_image_url'],
                                                  productImageUrl +
                                                      productController
                                                          .productonsale['list']
                                                              [index]
                                                              ['product_image']
                                                          .split(",")
                                                          .first),
                                              fit: BoxFit.cover,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          height: 65,
                                          width: 65,
                                        ),
                                      ),
                                      Text(
                                        productController.products[index]
                                            ['name'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 1),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        margin: const EdgeInsets.all(10),
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            IconButton(
                                              padding: EdgeInsets.only(
                                                  left: 2, right: 2),
                                              onPressed: () async {
                                                EasyLoading.show(
                                                    status: "Loading");
                                                productController.productID =
                                                    productController
                                                        .products[index]['pid'];

                                                // print(
                                                //     "sjkfdhisjhfs ${productController.productID}");

                                                var selectedProduct =
                                                    productController.products1
                                                        .where((element) =>
                                                            element['pid'] ==
                                                            productController
                                                                .productID)
                                                        .toList();

                                                print(
                                                    "sjkfdhisjhfs ${selectedProduct}");

                                                var selectedProduct1 =
                                                    productController.products
                                                        .where((element) =>
                                                            element['pid'] ==
                                                            productController
                                                                .productID)
                                                        .toList();

                                                if (selectedProduct[0]
                                                        ['quantity'] ==
                                                    0) {
                                                  productController.products
                                                      .removeWhere((element) =>
                                                          element['pid'] ==
                                                          productController
                                                              .productID);

                                                  productController.products1
                                                      .removeWhere((element) =>
                                                          element['pid'] ==
                                                          productController
                                                              .productID);

                                                  Get.back();
                                                  Get.to(() => CheckOutPage());
                                                } else {
                                                  selectedProduct[0]
                                                      ['quantity'] -= 1;

                                                  var price = double.parse(
                                                      selectedProduct[0]
                                                          ['price']);
                                                  var price1 = double.parse(
                                                      selectedProduct1[0]
                                                          ['price']);

                                                  price -= price1;

                                                  productController.totalPrice
                                                      .value -= price1;

                                                  selectedProduct[0]['price'] =
                                                      price.toString();
                                                  selectedProduct1[0]['price'];

                                                  // productController.products1
                                                  //     .removeWhere((element) =>
                                                  //         element['pid'] ==
                                                  //         productController
                                                  //             .productID);

                                                  // productController.products1
                                                  //     .add(selectedProduct[0]);

                                                  var c = productController
                                                      .products1
                                                      .indexWhere((element) =>
                                                          element['pid'] ==
                                                          productController
                                                              .productID);

                                                  productController.products1
                                                      .removeWhere((element) =>
                                                          element['pid'] ==
                                                          productController
                                                              .productID);

                                                  productController.products1
                                                      .insert(c,
                                                          selectedProduct[0]);

                                                  print(
                                                      "sjkfdhisjhfs ${productController.products1}");
                                                }
                                                // productController.productID =
                                                //     productController
                                                //         .products[index]['pid'];

                                                // print(
                                                //     "sjkfdhisjhfs ${productController.productID}");
                                                // await EasyLoading.show(
                                                //     status: "Loading");

                                                // if (productController
                                                //             .products[index]
                                                //         ['count'] >
                                                //     1) {
                                                //   productController
                                                //           .products[index]
                                                //       ['count'] -= 1;
                                                //   productController
                                                //               .products[index]
                                                //           ['total_price'] -=
                                                //       productController
                                                //               .products[index]
                                                //           ['product_price'];

                                                // await Future.delayed(
                                                //     Duration(seconds: 1),
                                                //     () async {
                                                // Get.back();
                                                // Get.toNamed(
                                                //     "CHECKOUT_PAGE");
                                                // await productController
                                                //     .totalPriceCount();

                                                // EasyLoading.dismiss();
                                                // });
                                                // } else {
                                                //   productController.products
                                                //       .remove(productController
                                                //           .products[index]);
                                                EasyLoading.dismiss();
                                                Get.back();
                                                Get.to(() => CheckOutPage());
                                                // }
                                                // print(
                                                //     productController.products);
                                              },
                                              icon: const Icon(
                                                Icons.remove,
                                                color: Colors.indigo,
                                                size: 15,
                                              ),
                                            ),
                                            Text(
                                              '${productController.products1[index]['quantity']}',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            IconButton(
                                              padding: EdgeInsets.all(0),
                                              onPressed: () async {
                                                EasyLoading.show(
                                                    status: "Loading");
                                                productController.productID =
                                                    productController
                                                        .products[index]['pid'];

                                                // print(
                                                //     "sjkfdhisjhfs ${productController.productID}");

                                                var selectedProduct =
                                                    productController.products1
                                                        .where((element) =>
                                                            element['pid'] ==
                                                            productController
                                                                .productID)
                                                        .toList();

                                                print(
                                                    "sjkfdhisjhfs ${selectedProduct}");

                                                var selectedProduct1 =
                                                    productController.products
                                                        .where((element) =>
                                                            element['pid'] ==
                                                            productController
                                                                .productID)
                                                        .toList();

                                                selectedProduct[0]
                                                    ['quantity'] += 1;

                                                var price = double.parse(
                                                    selectedProduct[0]
                                                        ['price']);

                                                var price1 = double.parse(
                                                    selectedProduct1[0]
                                                        ['price']);

                                                price += price1;

                                                productController
                                                    .totalPrice.value += price1;

                                                selectedProduct[0]['price'] =
                                                    price.toString();
                                                selectedProduct1[0]['price'];

                                                var c = productController
                                                    .products1
                                                    .indexWhere((element) =>
                                                        element['pid'] ==
                                                        productController
                                                            .productID);

                                                productController.products1
                                                    .removeWhere((element) =>
                                                        element['pid'] ==
                                                        productController
                                                            .productID);

                                                productController.products1
                                                    .insert(
                                                        c, selectedProduct[0]);

                                                // productController.products1
                                                //     .add(selectedProduct[0]);

                                                print(
                                                    "sjkfdhisjhfs ${productController.products1}");

                                                // var contains = products.contains(selectedProduct[0]);
                                                // await EasyLoading.show(
                                                //     status: "Loading");

                                                // if (productController
                                                //             .products[index]
                                                //         ['count'] <
                                                //     productController
                                                //             .products[index]
                                                //         ['max_quantity']) {
                                                //   productController
                                                //           .products[index]
                                                //       ['count'] += 1;

                                                //   productController
                                                //               .products[index]
                                                //           ['total_price'] +=
                                                //       productController
                                                //               .products[index]
                                                //           ['product_price'];

                                                // await productController
                                                //     .totalPriceCount();
                                                // await Future.delayed(
                                                //     Duration(seconds: 1),
                                                //     () async {
                                                //   Get.back();
                                                //   Get.toNamed(
                                                //       "CHECKOUT_PAGE");

                                                // EasyLoading.dismiss();
                                                // });
                                                // } else {
                                                //   Fluttertoast.showToast(
                                                //       msg:
                                                //           "No more items in stock");
                                                //   EasyLoading.dismiss();
                                                // }

                                                // print(
                                                //     productController.products);
                                                EasyLoading.dismiss();
                                                Get.back();
                                                Get.to(() => CheckOutPage());
                                              },
                                              icon: const Icon(
                                                Icons.add,
                                                color: Colors.indigo,
                                                size: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                          '₹ ${productController.products1[index]['price']}'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      }),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(15),
                        width: double.infinity,
                        color: Colors.white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bill Details',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Item Total'),
                                  Obx(
                                    () => Text(
                                      '₹ ${productController.totalPrice.value}',
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Delivery Fee | 4.0 kms',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  Text('₹ 29')
                                ],
                              ),
                              const Text(
                                  'It is a long established fact that a reader'),
                              SizedBox(height: 15),
                              const Divider(color: Colors.black),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Delivery tip'),
                                  Text('Add Tip',
                                      style: TextStyle(color: Colors.indigo))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('Taxes and charges',
                                      style: TextStyle(color: Colors.blue)),
                                  Text('₹ 44.7')
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('To Pay',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  Text(
                                      '₹ ${productController.totalPrice.value}',
                                      style: TextStyle(
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ]),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        color: Colors.white,
                        child: Column(children: [
                          Obx(
                            () => ListTile(
                              leading:
                                  Image.asset('images/deliver_to_work.png'),
                              title: productController.deliverTo.value == "work"
                                  ? Text('Deliver to Work',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                  : Text('Deliver to Home',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                              subtitle: Text('Lorem Ipsum'),
                              trailing: TextButton(
                                child: Text('Change',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                onPressed: () {
                                  showModalSheet(context);
                                },
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(
                                '₹ ${productController.totalPrice.value}',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            trailing: ElevatedButton(
                              child: const Text(
                                'MAKE PAYMENT',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () async {
                                if (productController.deliveryAddress.isEmpty) {
                                  Fluttertoast.showToast(msg: "No address set");
                                } else {
                                  // Get.toNamed("PAYMENT_METHOD");
                                  // await paymentController.launchURL();
                                  await initiateTransaction();
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ]),
                      ),
                    ],
                  );
          }),
        ),
      ),
    );
  }
}

Future initiateTransaction() async {
  try {
    var response =
        await http.post(Uri.parse("https://apisetu.gov.in/api/npci"), headers: {
      'nfinite-auth': 'a792ab5cbeccad3045bd9c229be9a7a60655e00c',
    });
    if (response.statusCode == 200) {
      print("SUCCESS");
      print("SUCCESS1 : ${response}");
    } else {
      print("DECLINE");
    }
  } catch (e) {
    print(e);
  }
}
