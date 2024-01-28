import 'dart:convert';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:http/http.dart' as http;

class AboutusController extends GetxController {
  var aboutUs;
  String textAboutUs = "";
  String textPrivacyPolicy = "";
  String termsCondition = "";
 Future aboutContent() async {
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          baseUrl + "content",
        ),
        //  body: data,
      );
      if (response.statusCode == 200) {
        aboutUs = await json.decode(response.body);
        print("ABOUTUS ${aboutUs}");
        EasyLoading.dismiss();
        textAboutUs = aboutUs['list'][0]['about_us'];
        textPrivacyPolicy = aboutUs['list'][0]['privacy'];
        termsCondition = aboutUs['list'][0]['terms_condition'];
        print("object" + textAboutUs);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
    }
  }
}
