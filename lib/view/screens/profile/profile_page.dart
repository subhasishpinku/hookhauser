// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hookah_user/components/drawer_page.dart';
import 'package:hookah_user/components/profile_textfield.dart';
import 'package:hookah_user/controller/profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  final ProfilePageController profilePageController =
      Get.put(ProfilePageController());

  ProfilePage({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();

  saveProfileUpdate() async {
    final valid = _form.currentState!.validate();
    if (!valid) {
      Get.snackbar(
        "Error",
        "Invalid credentials",
        borderRadius: 0,
        maxWidth: double.infinity,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.all(12),
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      await profilePageController.profileUpdate(
        profilePageController.name.text,
        profilePageController.email.text,
        profilePageController.phone.text,
        profilePageController.imageFile.value,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Obx(() {
          return Container(
            padding: EdgeInsets.only(
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Stack(children: [
                  CircleAvatar(
                    radius: 54,
                    backgroundColor: Color(0xffffffff),
                    child: Obx(
                      () => Image.asset(profilePageController.altImage!.value),
                      //     CircleAvatar(
                      //       foregroundImage: Image.file(profilePageController.imageFile!),
                      //     ),
                    ),
                  ),
                  //           AssetImage(profilePageController.imageFile!.value),
                  //       // NetworkImage(
                  //       //     'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                  //       radius: 50,
                  //       backgroundColor: Colors.white,
                  // ),
                  // ),
                  // )
                  // ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        await profilePageController.pickImage();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 19,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Color(0xFF020D4D),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                const SizedBox(height: 30),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      info(
                        type: 'Name',
                        icon: Icons.person,
                        data: 'Name',
                        controller: profilePageController.name,
                        validator: ((String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 10),
                      info(
                        type: 'Email',
                        icon: Icons.email,
                        data: 'Email',
                        controller: profilePageController.email,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please enter an email";
                          }
                          if (!profilePageController.isValidEmail(value)) {
                            return "Please enter a valid email";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 10),
                      info(
                        type: 'Phone',
                        icon: Icons.phone,
                        data: 'Phone',
                        controller: profilePageController.phone,
                        validator: ((String? value) {
                          if (value!.isEmpty) {
                            return "Please enter your mobile number";
                          }
                          if (!profilePageController.isValidMobile(value)) {
                            return "Please enter a valid phone Number";
                          }
                          return null;
                        }),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.work,
                            color: const Color(
                              0xFF020D4D,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Address",
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      profilePageController.work.isNotEmpty
                          ? FittedBox(
                              fit: BoxFit.fill,
                              // height: 200,
                              // width: MediaQuery.of(context).size.width - 20,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Work",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Street : ${profilePageController.work[0]['street']}",
                                        overflow: TextOverflow.ellipsis,
                                        // style: TextStyle(
                                        //   fontSize: 16,
                                        // ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Area : ${profilePageController.work[0]['area']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "City : ${profilePageController.work[0]['city']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "District : ${profilePageController.work[0]['district']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "State : ${profilePageController.work[0]['state']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "PIN : ${profilePageController.work[0]['pinCode']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () async {
                                            await profilePageController
                                                .assignToWork();

                                            Get.toNamed("ADD_ADDRESS");
                                          },
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: Get.width - 10,
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                  bottom: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Work",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await profilePageController
                                            .assignToWork();

                                        Get.toNamed("ADD_ADDRESS");
                                      },
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 10,
                      ),
                      profilePageController.home.isNotEmpty
                          ? FittedBox(
                              fit: BoxFit.fill,
                              // height: 200,
                              // width: MediaQuery.of(context).size.width - 20,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 20,
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    top: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Home",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Street : ${profilePageController.home[0]['street']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Area : ${profilePageController.home[0]['area']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "City : ${profilePageController.home[0]['city']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "District : ${profilePageController.home[0]['district']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "State : ${profilePageController.home[0]['state']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "PIN : ${profilePageController.home[0]['pinCode']}",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                          onTap: () async {
                                            await profilePageController
                                                .assignToHome();

                                            Get.toNamed("ADD_ADDRESS");
                                          },
                                          child: Text(
                                            "Edit",
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: Get.width - 10,
                                padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 20,
                                  bottom: 20,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await profilePageController
                                            .assignToHome();
                                        Get.toNamed("ADD_ADDRESS");
                                      },
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.only(
                                  right: 30, left: 30, top: 4, bottom: 4)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          String vname = profilePageController.name.text;
                          String vemail = profilePageController.email.text;
                          String vphone = profilePageController.phone.text;
                          File vimage = profilePageController.imageFile.value;
                          print("Validator" + "0" + vimage.path);
                          if (vname == "") {
                            Fluttertoast.showToast(msg: "Enter your name");
                            return;
                          } else if (vemail == "") {
                            Fluttertoast.showToast(msg: "Enter your email");
                            return;
                          } else if (vphone == "") {
                            Fluttertoast.showToast(
                                msg: "Enter your Phone Number");
                            return;
                          }
                          else if (vimage.path == "images/bmsLogo.png") {
                            Fluttertoast.showToast(
                                msg: "Upload profile Image");
                            return;
                          }
                          await saveProfileUpdate();
                        },
                        child: Text(
                          'Save',
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
