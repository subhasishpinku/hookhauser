// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/components/bottom_sheet.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/controller/profile_page_controller.dart';

class AddAddress extends StatelessWidget {
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  AddAddress({Key? key}) : super(key: key);
  // final _form = GlobalKey<FormState>();
  // saveAddress() async {
  //   final valid = _form.currentState!.validate();
  //   if (!valid) {
  //     Get.snackbar(
  //       "Error",
  //       "Invalid credentials",
  //       borderRadius: 0,
  //       maxWidth: double.infinity,
  //       margin: EdgeInsets.zero,
  //       padding: EdgeInsets.all(12),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   } else {
  //     await profilePageController.addAddress(
  //       profilePageController.street.text,
  //       profilePageController.area.text,
  //       profilePageController.city.text,
  //       profilePageController.district.text,
  //       profilePageController.state.text,
  //       profilePageController.pinCode.text,
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            createdTextField(
              // preIcon: Icon(Icons.streetview),
              isPassword: false,
              keyboardType: TextInputType.streetAddress,
              label: 'Street',
              controller: profilePageController.street,
            ),
            SizedBox(
              height: 10,
            ),
            createdTextField(
              // preIcon: Icon(Icons.area),
              isPassword: false,
              keyboardType: TextInputType.streetAddress,
              label: 'Area',
              controller: profilePageController.area,
            ),
            SizedBox(
              height: 10,
            ),
            createdTextField(
              // preIcon: Icon(Icons.area),
              isPassword: false,
              keyboardType: TextInputType.streetAddress,
              label: 'City',
              controller: profilePageController.city,
            ),
            SizedBox(
              height: 10,
            ),
            createdTextField(
              // preIcon: Icon(Icons.area),
              isPassword: false,
              keyboardType: TextInputType.streetAddress,
              label: 'District',
              controller: profilePageController.district,
            ),
            SizedBox(
              height: 10,
            ),
            createdTextField(
              // preIcon: Icon(Icons.area),
              isPassword: false,
              keyboardType: TextInputType.streetAddress,
              label: 'State',
              controller: profilePageController.state,
            ),
            SizedBox(
              height: 10,
            ),
            createdTextField(
              // preIcon: Icon(Icons.area),
              isPassword: false,
              keyboardType: TextInputType.number,
              label: 'PIN',
              controller: profilePageController.pinCode,
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: 60,
              child: ElevatedButton(
                onPressed: () async {
                  if (profilePageController.index.value == 0) {
                    String vstreet = profilePageController.street.text;
                    String varea = profilePageController.area.text;
                    String vcity = profilePageController.city.text;
                    String vdistrict = profilePageController.district.text;
                    String vstate = profilePageController.state.text;
                    String vpinCode = profilePageController.pinCode.text;
                    print("object_address" +
                        vstreet +
                        " " +
                        varea +
                        " " +
                        vcity +
                        " " +
                        vdistrict +
                        " " +
                        vstate +
                        " " +
                        vpinCode);
                    if (vstreet == "") {
                      Fluttertoast.showToast(msg: "Enter your Street");
                      return;
                    } else if (varea == "") {
                      Fluttertoast.showToast(msg: "Enter your Area");
                      return;
                    } else if (vcity == "") {
                      Fluttertoast.showToast(msg: "Enter your city");
                      return;
                    } else if (vdistrict == "") {
                      Fluttertoast.showToast(msg: "Enter your District");
                      return;
                    } else if (vstate == "") {
                      Fluttertoast.showToast(msg: "Enter your State");
                      return;
                    } else if (vpinCode == "") {
                      Fluttertoast.showToast(msg: "Enter your Pincode");
                      return;
                    }
                    await profilePageController.addDataToWork();
                    print("WORK: ${profilePageController.work}");
                  } else if (profilePageController.index.value == 1) {
                    String vstreet = profilePageController.street.text;
                    String varea = profilePageController.area.text;
                    String vcity = profilePageController.city.text;
                    String vdistrict = profilePageController.district.text;
                    String vstate = profilePageController.state.text;
                    String vpinCode = profilePageController.pinCode.text;
                    print("object_address" +
                        vstreet +
                        " " +
                        varea +
                        " " +
                        vcity +
                        " " +
                        vdistrict +
                        " " +
                        vstate +
                        " " +
                        vpinCode);
                    if (vstreet == "") {
                      Fluttertoast.showToast(msg: "Enter your Street");
                      return;
                    } else if (varea == "") {
                      Fluttertoast.showToast(msg: "Enter your Area");
                      return;
                    } else if (vcity == "") {
                      Fluttertoast.showToast(msg: "Enter your city");
                      return;
                    } else if (vdistrict == "") {
                      Fluttertoast.showToast(msg: "Enter your District");
                      return;
                    } else if (vstate == "") {
                      Fluttertoast.showToast(msg: "Enter your State");
                      return;
                    } else if (vpinCode == "") {
                      Fluttertoast.showToast(msg: "Enter your Pincode");
                      return;
                    }
                    await profilePageController.addDataToHome();
                    print("HOME: ${profilePageController.home}");
                  }
                  Get.back();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Add Address',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
