import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/profile_textfield.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:hookah_user/view/screens/add_address/add_address.dart';
import 'package:hookah_user/view/screens/home/home.dart';
import 'package:hookah_user/view/screens/tab_controller/tab_controller_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  // Address
  TextEditingController street = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController pinCode = TextEditingController();

  RxList home = [].obs;
  RxList work = [].obs;

  RxInt index = 0.obs;

  // Image Picker
  Rx<File> imageFile = File("images/bmsLogo.png").obs;
  RxString? altImage = "images/bmsLogo.png".obs;
  final ImagePicker picker = ImagePicker();
  CroppedFile? croppedFile;

  pickImage() async {
    XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      // maxWidth: 1800,
      // maxHeight: 1800,
    );
    if (pickedFile != null) {
      // print("PICKED FILE PATH : ${pickedFile.path}");
      imageFile.value = File(pickedFile.path);
      await imageCropper(imageFile.value);
    }
  }

  imageCropper(File? originalImageFile) async {
    croppedFile = await ImageCropper().cropImage(
      sourcePath: originalImageFile!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false,
        ),
      ],
    );
    if (croppedFile != null) {
      // print("CROPPED FILE PATH : ${croppedFile!.path}");
      imageFile.value = File(croppedFile!.path);
      // altImage!.value = croppedFile!.path;
      print("Image_value");
      altImage!.value = croppedFile!.path;
    }
  }

  assignToHome() {
    street.clear();
    area.clear();
    city.clear();
    district.clear();
    state.clear();
    pinCode.clear();

    if (home.isNotEmpty) {
      street.text = home[0]['street'] ?? "";
      area.text = home[0]['area'] ?? "";
      city.text = home[0]['city'] ?? "";
      district.text = home[0]['district'] ?? "";
      state.text = home[0]['state'] ?? "";
      pinCode.text = home[0]['pinCode'] ?? "";
    } else {
      street.text = "";
      area.text = "";
      city.text = "";
      district.text = "";
      state.text = "";
      pinCode.text = "";
    }

    index.value = 1;
  }

  assignToWork() {
    street.clear();
    area.clear();
    city.clear();
    district.clear();
    state.clear();
    pinCode.clear();

    if (work.isNotEmpty) {
      street.text = work[0]['street'];
      area.text = work[0]['area'];
      city.text = work[0]['city'];
      district.text = work[0]['district'];
      state.text = work[0]['state'];
      pinCode.text = work[0]['pinCode'];
    } else {
      street.text = "";
      area.text = "";
      city.text = "";
      district.text = "";
      state.text = "";
      pinCode.text = "";
    }
    index.value = 0;
  }

 Future addDataToHome() async {
    home.clear();
    home.add({
      "street": street.text,
      "area": area.text,
      "city": city.text,
      "district": district.text,
      "state": state.text,
      "pinCode": pinCode.text,
    });
    var userhome;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("homeData" +
        street.text +
        " " +
        area.text +
        " " +
        city.text +
        " " +
        district.text +
        " " +
        state.text +
        " " +
        pinCode.text);
    Map<String, dynamic> data = {
      "wstreet": street.text,
      "warea": area.text,
      "wcity": city.text,
      "wdistrict": district.text,
      "wstate": state.text,
      "wpin": pinCode.text,
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          // baseUrl + "work_update?wstreet=${street.text}&warea=${area.text}&wcity=${city.text}&wdistrict=${district.text}&wstate=${state.text}&wpin=${pinCode.text}",
          baseUrl + "address_update",
        ),
        headers: {
          // 'Content-Type': 'application/json',
          // 'Accept': 'application/json',
          // 'Authorization': '$token!',
          "Authorization": "Bearer $token!"
        },
        body: data,
      );
      print("responseAddress" + response.body);
      if (response.statusCode == 200) {
        userhome = await json.decode(response.body);
        print(userhome);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      if (userhome['status'] == "200") {
        String sms = userhome['message'];
        Fluttertoast.showToast(msg: sms);
        EasyLoading.dismiss();
      } else if (userhome['status'] == "203") {
        Fluttertoast.showToast(msg: "Error Logging in");
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("WORK $e");
    }
  }
 Future addDataToWork() async {
    work.clear();
    work.add({
      "street": street.text,
      "area": area.text,
      "city": city.text,
      "district": district.text,
      "state": state.text,
      "pinCode": pinCode.text,
    });
    var userwork;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    print("workData" +
        street.text +
        " " +
        area.text +
        " " +
        city.text +
        " " +
        district.text +
        " " +
        state.text +
        " " +
        pinCode.text);
    Map<String, dynamic> data = {
      "wstreet": street.text,
      "warea": area.text,
      "wcity": city.text,
      "wdistrict": district.text,
      "wstate": state.text,
      "wpin": pinCode.text,
    };
    try {
      EasyLoading.show(status: "Please wait...");
      var response = await http.post(
        Uri.parse(
          // baseUrl + "work_update?wstreet=${street.text}&warea=${area.text}&wcity=${city.text}&wdistrict=${district.text}&wstate=${state.text}&wpin=${pinCode.text}",
          baseUrl + "work_update",
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
      print("responseWork" + response.body);
      if (response.statusCode == 200) {
        userwork = await json.decode(response.body);
        print(userwork);
      } else {
        Fluttertoast.showToast(
            msg: "There was some problem signing you up. Please try again!");
      }
      if (userwork['status'] == "200") {
        String sms = userwork['message'];
        Fluttertoast.showToast(msg: sms);
        EasyLoading.dismiss();
      } else if (userwork['status'] == "203") {
        Fluttertoast.showToast(msg: "Error Logging in");
        EasyLoading.dismiss();
      }
    } catch (e) {
      EasyLoading.dismiss();
      print("WORK $e");
    }
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  // is valid mobile number
  bool isValidMobile(String phone) {
    String code = "91";
    return RegExp(r'^(?:(?:\+|0{0,2})91(\s*[\-]\s*)?|[0]?)?[789]\d{9}$')
        .hasMatch(code + phone);
  }

//   profileUpdate(
//     String name,
//     String email,
//     String phone,
//     File value,
//   ) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("token");
//     //     "https://sapcotechnologies.com/book_my_smoke/public/images/products/1646024466_3513.jpg";
//     print('Token : ${token}');
//     var userprofile;
//     Map<String, dynamic> data = {
//       "name": name,
//       "email": email,
//       "mobile": phone,
//       "image ": value,
//     };
//     print('Token : ${data}');
//     try {
//       EasyLoading.show(status: "Please wait...");
//       var response = await http.post(
//         Uri.parse(
//           baseUrl + "profile_update",
//         ),
//         headers: {
//           // 'Content-Type': 'application/json',
//           // 'Accept': 'application/json',
//           'Authorization': '$token!',
//         },
//         body: data,
//       );
//       print("responseProfileUpade" + response.body);

//       EasyLoading.dismiss();
//     } catch (e) {
//       EasyLoading.dismiss();
//       print("PROFILE UPDATE $e");
//     }
//   }
// }
  addAddress(
    String street,
    String area,
    String city,
    String district,
    String state,
    String pinCode,
  ) async {}

 Future profileUpdate(
    String name,
    String email,
    String phone,
    File value,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    var request = await http.MultipartRequest(
      'POST',
      Uri.parse(
          "https://bms.sapcotechnologies.com/api/profile_update?name=${name}&email=${email}&mobile=${phone}"),
    );
    request.files.add(await http.MultipartFile.fromPath(
      'image',
      croppedFile!.path,
    ));
    request.headers.addAll({"Authorization": "Bearer $token!"});
    var response = await request.send();
    if (response.statusCode == 200) {
      final res = await http.Response.fromStream(response);
      var info = await json.decode(res.body);
      if (info['status'] == "200") {
        Fluttertoast.showToast(msg: "Lead sent!");
        Get.to(() => TabControllerPage());
      } else {
        Fluttertoast.showToast(msg: "Error proceeding");
      }
      print("INFORes : $info");
      print("load");
    } else {
      print("Error");
    }
  }
}
