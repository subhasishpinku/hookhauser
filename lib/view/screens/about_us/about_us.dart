import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/aboutus_controller.dart';
import 'package:hookah_user/view/screens/privacy_policy/privacy_policy.dart';
import 'package:hookah_user/view/screens/terms_and_conditions/terms_condition.dart';

class AboutUs extends StatelessWidget {
  final AboutusController aboutPageController =
      Get.put(AboutusController());
  AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('About Us')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text('About Us',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold)),
                    // Text(
                    //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n")
                   Text(aboutPageController.textAboutUs)
                  ],
                ),
                Column(
                  children: [
                    Divider(thickness: 3),
                    InkWell(
                      onTap: () {
                        Get.to(() => PrivacyPolicy());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Privacy Policy'),
                          Icon(Icons.forward)
                        ],
                      ),
                    ),
                    Divider(thickness: 3),
                    InkWell(
                      onTap: () {
                        Get.to(() => TermsConditions());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Terms & Conditions'),
                          Icon(Icons.forward)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
