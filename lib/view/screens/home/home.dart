// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/controller/product_controller.dart';
import 'package:hookah_user/components/drawer_page.dart';
import 'package:hookah_user/components/created_chip.dart';
import 'package:hookah_user/components/created_product_container.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:hookah_user/view/screens/checkout/checkout_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final AuthenticationController authenticationController =
      Get.find<AuthenticationController>();

  final ProductController productController = Get.put(ProductController());

  // final data = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140), // Set this height
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xff020D4D),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBar(
                elevation: 0,
                title: const Text('Grab your Favorite'),
                actions: [
                  IconButton(
                    onPressed: () {
                      // print(authenticationController.userModel.value.email);
                      productController.showcart();
                      Get.to(() => CheckOutPage());
                    },
                    icon: const Icon(Icons.shopping_cart),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text('search your product...'),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    focusColor: Colors.amber,
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 9,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(50),
                      gapPadding: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 60,
                child: Wrap(
                  spacing: 10,
                  children: [
                    for (var i = 0;
                        i < productController.productcategory['list'].length;
                        i++)
                      chip(context,
                          category: productController.productcategory['list'][i]
                              ['name'],
                          index: i),
                  ],
                ),

                // ListView.builder(
                //   scrollDirection: Axis.horizontal,
                //   itemCount: productController.category.length,
                //   itemBuilder: (context, index) {
                //     // productController.selectedIndex.value = index;
                //     // print(productController.selectedIndex.value);
                //     return Row(
                //       children: [
                //         chip(context,
                //             category: productController.product[index]
                //                 ['category']),
                //         SizedBox(width: 10),
                //       ],
                //     );
                //   },
                // ),
              ),
              Stack(
                children: [
                  // for (int i = 0; i <= productController.banner.length; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://t4.ftcdn.net/jpg/03/31/96/15/360_F_331961563_x2z2ZWWHwemXgdVYZqaSYRTU9ZMyDBB1.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                    height: 190,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Text('On Sale All Over\n Kolkata',
                          Text(
                              productController.banner['list'][0]['title'] +
                                  " / " +
                                  productController.banner['list'][0]['place'],
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xffffffff))),
                            onPressed: () {},
                            child: const Text(
                              'View more',
                              style: TextStyle(
                                color: Color(0xFF020D4D),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Text('Featured Products For Sale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Obx(
              //   () {
              //     return
              SizedBox(
                  height: 270,
                  child: productController.productonsale.isEmpty
                      ? Container()
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productController.productonsale.length,
                          itemBuilder: (context, index) {
                            return createdProductContainer(context,
                                url: productImageUrl +
                                    productController.productonsale['list']
                                            [index]['product_image']
                                        .split(",")
                                        .first,
                                productName: productController
                                    .productonsale['list'][index]['name'],
                                price: productController.productonsale['list']
                                    [index]['price'],
                                productID:
                                    productController.productonsale['list']
                                        [index]['product_code'],
                                index: index,
                                pid: productController.productonsale['list']
                                    [index]['pid']);
                          },
                        )
                  // : ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: productController.filteredList.length,
                  //     itemBuilder: (context, index) {
                  //       return createdProductContainer(context,
                  //           url:
                  //               "${categoriesImageUrl}${productController.filteredList[index]['category_image']}",
                  //           productName: productController
                  //               .filteredList[index]['name'],
                  //           price: productController.filteredList[index]
                  //               ['price'],
                  //           index: index,
                  //           pid: productController.filteredList[index]
                  //               [index]['pid']
                  //           // productID: productController.filteredList[index]
                  //           //     ['product_id'],
                  //           );
                  //   },
                  // ),
                  ),
              //   },
              // ),
              Stack(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://t4.ftcdn.net/jpg/03/31/96/15/360_F_331961563_x2z2ZWWHwemXgdVYZqaSYRTU9ZMyDBB1.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                  height: 190,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // const Text('On Rent All Over\n Kolkata',
                        Text(
                            productController.banner['list'][0]['title'] +
                                " / " +
                                productController.banner['list'][0]['place'],
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffffffff))),
                            onPressed: () {
                              Get.toNamed("CHECKOUT_PAGE");
                            },
                            child: Text(
                              'View more',
                              style: TextStyle(
                                  color: Color(0xFF020D4D),
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
