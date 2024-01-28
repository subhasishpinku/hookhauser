import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/aboutus_controller.dart';

class PrivacyPolicy extends StatelessWidget {
  final AboutusController aboutPageController = Get.put(AboutusController());
  PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Privacy Policy', style: TextStyle(fontSize: 30)),
            SizedBox(height: 10),
            Text('We are committed to protect your privacy',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            // Text(
            //   "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. ",
            // ),
            Text(aboutPageController.textPrivacyPolicy),
            SizedBox(height: 10),
            Text('We are committed to protect your privacy',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              aboutPageController.textPrivacyPolicy,
            ),
          ],
        ),
      ),
    );
  }
}
