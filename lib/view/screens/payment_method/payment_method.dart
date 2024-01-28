// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/create_text_field.dart';
import 'package:hookah_user/components/upi_apps.dart';
import 'package:hookah_user/controller/payment_controller.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({Key? key}) : super(key: key);

  final PaymentController paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payment Method',
        ),
      ),
      // body: displayUpiApps(),
    );
  }
}
