// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyAge extends StatelessWidget {
  const VerifyAge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      height: 400,
      width: 400,
      padding: EdgeInsets.only(
        top: 72,
        bottom: 70,
      ),
      child: AlertDialog(
        title: Text('You need to be above 18 years of age'),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Icon(Icons.do_not_disturb_outlined),
              subtitle: Text(
                  "don't buy tobacco products on behalf of underage person"),
            ),
            ListTile(
              leading: Icon(Icons.do_not_disturb_outlined),
              subtitle: Text(
                  "your location must not be in and around school or college premises"),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "we strongly advice you against purchasing tobacco products if you are a minor or intend to buy on behalf of a minor. We are bound to report your account in case of such transgressions.",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Get.toNamed("TERMS_AND_CONDITIONS_PAGE");
              },
              child: Text(
                "reas t&cs",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Color.fromARGB(255, 18, 56, 87),
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  exit(0);
                },
                child: Text(
                  "No, I'm not",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed("LOGIN");
                },
                child: Text(
                  "Yes, I'm above 18",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
