import 'package:get/get.dart';

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  TextEditingController amount = TextEditingController();
  
  RxDouble rechargedAmount = 0.0.obs;

  bool isValidAmount(double value) {
    if (value >= 1) {
      return true;
    } else {
      return false;
    }
  }
}
