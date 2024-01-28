import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/aboutus_controller.dart';

class TermsConditions extends StatelessWidget {
  final AboutusController aboutPageController = Get.put(AboutusController());

  TermsConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Terms & Conditions', style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text(aboutPageController.termsCondition),
          ],
        ),
      ),
    );
  }
}
