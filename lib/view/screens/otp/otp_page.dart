// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/otp_input.dart';
import 'package:hookah_user/components/primary_button.dart';
import 'package:hookah_user/controller/authentication_controller.dart';

class Otpscreen extends StatelessWidget {
  Otpscreen({Key? key}) : super(key: key);
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  RxString? otp = 'Please enter OTP'.obs;
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "OTP",
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Phone Number Verification'),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              otpInput(context, _fieldOne, true),
              otpInput(context, _fieldTwo, false),
              otpInput(context, _fieldThree, false),
              otpInput(context, _fieldFour, false),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          // ElevatedButton(
          //     onPressed: () {
          //       otp!.value = _fieldOne.text +
          //           _fieldTwo.text +
          //           _fieldThree.text +
          //           _fieldFour.text;
          //     },
          //     child: const Text('Submit')),
          primaryButton(
            context,
            label: "Submit",
            onPressed: () async {
              otp!.value = _fieldOne.text +
                  _fieldTwo.text +
                  _fieldThree.text +
                  _fieldFour.text;
              print("otp_value" + otp!.value);
              // String otpView = otp!.value;
              if (otp!.value == "") {
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
                await authenticationController.checkOtp(
                  otp!.value,
                );
              }
            },
          ),
          SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              Get.offNamed("OTPVERIFY");
            },
            child: Text("Resend Otp",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                )),
          )
        ],
      ),
    );
  }
}
