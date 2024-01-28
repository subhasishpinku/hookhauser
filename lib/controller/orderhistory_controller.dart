import 'dart:convert';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class OrderHistoryController extends GetxController {
  var orderhistory;

  Future orderHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("${token}order_token");
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          "${baseUrl}order_history",
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
        orderhistory = await json.decode(response.body);
        print("ORDERHISTORY ${orderhistory}");
        EasyLoading.dismiss();
        Get.toNamed("ORDER_HISTORY");
        print("order_history" + orderhistory);
      } else {
        EasyLoading.dismiss();
        Fluttertoast.showToast(msg: "Please try again!");
      }
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
    }
  }
}
