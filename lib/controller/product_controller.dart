// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/models/AddCart.dart';
import 'package:hookah_user/models/Cartshowlist.dart';
import 'package:hookah_user/models/ProductList.dart';
import 'package:hookah_user/models/ProductonsaleModels.dart';
import 'package:hookah_user/models/RemoveCart.dart';

import 'package:hookah_user/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends GetxController {
  // Future onInit() async {
  //   await productlist();
  //   // super.initState();
  // }
  @override
  Future onInit() async {
    await productlist();
    await productCategory();
    await productbanner();
    await productOnsale();
    await showcart();
    super.onInit();
  }

  Rx<ProductList> productListModel = ProductList().obs;
  Rx<Details> detailsModel = Details().obs;
  var productID;
  var userproduct;
  var productcategory;
  var banner;
  var productonsale;
  var productonsalelist;
  var addtocart;
  var removecartlist;
  var addcart;
  var addcartlist;
  var cartshow;
  var listCard;
  RxList listCards = [].obs;
  late int indexs;
  int pid = 0;
  RxBool isLoading = true.obs;

  RxInt quantity = 1.obs;

  dynamic totalPrice = 0.0.obs;

  RxString deliverTo = "".obs;
  List deliveryAddress = [];

  // Category List
  // RxList<String> category = ["1", "2", "3"].obs;
  RxList<String> category = ["1", "2", "3"].obs;

  RxInt selectedIndex = 0.obs;
  RxList filteredList = [].obs;
  List filterCategory = [];

  // Product List
  RxList products = [].obs;

  RxList product = [
    {
      'product_id': "P0001",
      'product_name': "a",
      'product_price': 200,
      'product_image_url':
          "https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg",
      'count': 0,
      'max_quantity': 2,
      'total_price': 200,
      'category': "1",
    },
    {
      'product_id': "2",
      'product_name': "b",
      'product_price': 200,
      'product_image_url':
          "https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg",
      'count': 0,
      'max_quantity': 10,
      'total_price': 200,
      'category': "2",
    },
    {
      'product_id': "3",
      'product_name': "c",
      'product_price': 100,
      'product_image_url':
          "https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg",
      'count': 0,
      'max_quantity': 1,
      'total_price': 100,
      'category': "3",
    },
    {
      'product_id': "4",
      'product_name': "d",
      'product_price': 400,
      'product_image_url':
          "https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg",
      'count': 0,
      'max_quantity': 5,
      'total_price': 400,
      'category': "1",
    },
    {
      'product_id': "5",
      'product_name': "e",
      'product_price': 1200,
      'product_image_url':
          "https://www.fumari.com/fumariwp/wp-content/uploads/2019/04/blog-hookah-beginners.jpg",
      'count': 0,
      'max_quantity': 8,
      'total_price': 1200,
      'category': "3",
    }
  ].obs;

//string array

  // Add items to cart
  // addToCart(
  //     var id, List productonsalelist, var price, int indexx, int pids) async {
  //   var selectedProduct = productonsalelist
  //       .where((element) => element['product_code'] == id)
  //       .toList();
  //   // indexs = indexx;
  //   // pid = pids;
  //   var contains = products.contains(selectedProduct[0]);
  //   // print(contains);
  //   if (!contains) {
  //     // selectedProduct[0]['count'] += 1;
  //     products.addAll(selectedProduct);
  //     await totalPriceCount(price);
  //     Get.toNamed("CHECKOUT_PAGE");
  //   } else {
  //     Fluttertoast.showToast(msg: "Item already added");
  //   }
  //   print(products);
  // }

  // newAddToCart

  List products1 = [];

  // RxInt priceCO = 0.obs;
  // RxString qtyCO = "".obs;

  newAddToCart(int pid) async {
    var selectedProduct = productonsale['list']
        .where((element) => element['pid'] == pid)
        .toList();

    // print("sjkfdhisjhfs $selectedProduct");

    var contains = products.contains(selectedProduct[0]);
    if (!contains) {
      products.addAll(selectedProduct);
      // print("sjkfdhisjhfs ${selectedProduct[0]['pid']}");
      products1.add({
        "pid": selectedProduct[0]['pid'],
        "name": selectedProduct[0]['name'],
        "quantity": 1,
        "price": selectedProduct[0]['price'],
      });
      // var p = double.parse(selectedProduct[0]['price']);
      totalPrice.value = 0.0;

      products1.forEach((element) {
        totalPrice.value += double.parse(element['price']);
      });

      // print("sjkfdhisjhfs $products");
      // print("sjkfdhisjhfs $products1");
      // await totalPriceCount(price);
      Get.toNamed("CHECKOUT_PAGE");
    } else {
      Fluttertoast.showToast(msg: "Item already added");
      // print("sjkfdhisjhfs $products");
      // print("sjkfdhisjhfs $products1");
      Get.toNamed("CHECKOUT_PAGE");
    }
  }

  // total bill
  totalPriceCount() {
    // print("GAF $products");
    totalPrice.value = 0.0;
    products1.forEach((element) {
      // totalPrice.value += double.parse(element['price']);
      totalPrice.value += double.parse(element['price']);
    });
  }

  // set delivery address
  setDeliveryAddress(List toSet) {
    deliveryAddress.clear();
    deliveryAddress.add(toSet[0]);
    print(deliveryAddress);
  }

  // filter products
  filterList({required List productList, required String label, int? index}) {
    if (!filterCategory.contains(category[index!])) {
      filterCategory.add(category[index]);
      List demo = [];
      demo.addAll(productList.where((element) => element['category'] == label));
      // print(demo);
      filteredList.addAll(demo);
      print(filteredList);
    } else {
      filteredList.removeWhere((element) => element['category'] == label);
      filterCategory.remove(category[index]);
      print(filteredList);
    }
  }

  productCatagorySearch() async {}

  Future productlist() async {
    try {
      var response = await http.post(
        Uri.parse(
          baseUrl + "product_list",
        ),
        // body: data,
      );
      if (response.statusCode == 200) {
        userproduct = await json.decode(response.body);
        isLoading.value = false;
        print("PRODUCT12: ${userproduct['list']}");
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
    } catch (e) {
      print(e);
    }
  }

  Future productCategory() async {
    try {
      var response = await http.post(
        Uri.parse(
          baseUrl + "product_category",
        ),
        // body: data,
      );
      if (response.statusCode == 200) {
        productcategory = await json.decode(response.body);
        // productCategoryFiltered = productcategory['list'];
        isLoading.value = false;
        print("PRODUCT13: ${productcategory['list']}");
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      print(e);
    }
  }

  Future productbanner() async {
    try {
      var response = await http.post(
        Uri.parse(
          baseUrl + "product_banner",
        ),
        // body: data,
      );
      if (response.statusCode == 200) {
        banner = await json.decode(response.body);
        //isLoading.value = false;
        print("BANNER1: ${banner['list']}");
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      print(e);
    }
  }

  Future productOnsale() async {
    try {
      var response = await http.post(
        Uri.parse(
          baseUrl + "product_onsale",
        ),
        // body: data,
      );
      if (response.statusCode == 200) {
        productonsale = await json.decode(response.body);
        //isLoading.value = false;
        productonsalelist = Productlist.fromJson(productonsale);

        print("productonsale: ${productonsale['list']}");
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      print(e);
    }
  }

  Future showcart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    try {
      var response = await http.post(
        Uri.parse(
          baseUrl + "cart_show",
        ),
        headers: {"Authorization": "Bearer $token!"},
      );
      print("response1" + response.body);
      if (response.statusCode == 200) {
        cartshow = await json.decode(response.body);
        print("response2: ${cartshow['cart_list']}");
        // listCard = Cartshowlist.fromJson(cartshow);
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      print("response1 $listCard");
    }
  }

  Future addtocard(int pid, int qty, String price) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print(token);
    Map<String, dynamic> data = {"qty": qty.toString(), "pid": pid.toString()};
    try {
      var response = await http.post(
        Uri.parse(
          // baseUrl + "work_update?wstreet=${street.text}&warea=${area.text}&wcity=${city.text}&wdistrict=${district.text}&wstate=${state.text}&wpin=${pinCode.text}",
          baseUrl + "add_cart",
        ),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          // 'Authorization': '$token!',
          "Authorization": "Bearer $token!"
          //TODO: TBC
        },
        body: data,
      );
      print("response" + response.body);
      Fluttertoast.showToast(msg: response.body);
      if (response.statusCode == 200) {
        addcart = await json.decode(response.body);
        addtocart = AddCart.fromJson(addcart);
        // print("addcart: ${addcart['list']}");
        print("add_carts $addcart");
        String sms = addcart['status'];
        print("sms $sms");
        Fluttertoast.showToast(msg: sms);
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("add_carts $addcart");
    }
  }

  Future removecart(int pid, int qty) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print(token);
    Map<String, dynamic> data = {"qty": qty.toString(), "pid": pid.toString()};
    try {
      var response = await http.post(
        Uri.parse(
          // baseUrl + "work_update?wstreet=${street.text}&warea=${area.text}&wcity=${city.text}&wdistrict=${district.text}&wstate=${state.text}&wpin=${pinCode.text}",
          baseUrl + "remove_cart",
        ),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          // 'Authorization': '$token!',
          "Authorization": "Bearer $token!"
          //TODO: TBC
        },
        body: data,
      );
      print("response" + response.body);
      Fluttertoast.showToast(msg: response.body);
      if (response.statusCode == 200) {
        addcart = await json.decode(response.body);
        removecartlist = RemoveCart.fromJson(addcart);
        // print("addcart: ${addcart['list']}");
        print("add_carts $addcart");
        String sms = addcart['status'];
        print("sms $sms");
        Fluttertoast.showToast(msg: sms);
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("add_carts $addcart");
    }
  }

  Future checkout() async {
    try {
       SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
      var response = await http.post(
        Uri.parse(
          baseUrl +
              "checkout?products=${products1}&total_price=${totalPrice.value}",
        ),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          // 'Authorization': '$token!',
          "Authorization": "Bearer $token!"
          //TODO: TBC
        },
        // body: data,
      );
      if (response.statusCode == 200) {
        var checkout = await json.decode(response.body);
        // productCategoryFiltered = productcategory['list'];
        // isLoading.value = false;
        // print("PRODUCT13: ${productcategory['list']}");
        if(checkout['status'] == "200") {

        Fluttertoast.showToast(msg: "Success");
        }
      } else {
        Fluttertoast.showToast(msg: "No record found");
      }
    } catch (e) {
      print(e);
    }
  }
}
