// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
      Get.offAllNamed("VERIFY_AGE");
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF020D4D),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.rotate(
              angle: math.pi,
              child: Image.asset(
                "images/loginDesign.png",
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () async {
                // await printKeyHash();
                Get.toNamed("LOGIN");
              },
              child: Image.asset(
                "images/bmsLogo.png",
              ),
            ),
          )
        ],
      ),
    );
  }
}

// printKeyHash() async {
//   String? key = await FlutterFacebookKeyhash.getFaceBookKeyHash ??
//       'Unknown platform version';
//   print(key);
// }
