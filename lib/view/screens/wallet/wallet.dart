// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/components/primary_button.dart';
import 'package:hookah_user/controller/authentication_controller.dart';
import 'package:hookah_user/controller/walletcontroller.dart';

class Wallet extends StatelessWidget {
  final AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  final WalletController walletController = Get.put(WalletController());

  Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallet"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 150,
            //   width: double.infinity,
            //   child: Image.asset(
            //     'images/loginDesign.png',
            //     fit: BoxFit.fill,
            //   ),
            // ),
            // Image.asset('images/bmsLogo.png'),
            SizedBox(
              height: 60,
            ),

            Container(
              height: 80,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Amount in Wallet : ${walletController.rechargedAmount.value}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            createdTextField(
              preIcon: const Icon(Icons.money),
              isPassword: false,
              keyboardType: TextInputType.number,
              label: 'Amount',
              controller: walletController.amount,
            ),
            const SizedBox(
              height: 26,
            ),
            primaryButton(
              context,
              label: "Submit",
              onPressed: () async {
                if (!walletController.isValidAmount(
                    double.parse(walletController.amount.text))) {
                  Fluttertoast.showToast(msg: "Atleast Rs. 1");
                } else {
                  // Fluttertoast.showToast(msg: "Done");
                  Get.toNamed("PAYMENT_METHOD");
                }
                // await saveRegistration(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
// https://book-my-smoke-3a08a.firebaseapp.com/__/auth/handler