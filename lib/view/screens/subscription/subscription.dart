// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/components/subscription_card.dart';

class Subscription extends StatelessWidget {
  Subscription({Key? key}) : super(key: key);
  final _form = GlobalKey<FormState>();
  saveWalletAmount(BuildContext context) async {
    final valid = _form.currentState!.validate();
    if (!valid) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subscription',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  left: 10.0, right: 10.0, top: 30.0, bottom: 10.0),
              child: Card(
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '₹ 10000',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                subscriptionCard(),
                subscriptionCard(),
                subscriptionCard(),
                subscriptionCard(),
                subscriptionCard(),
                subscriptionCard(),
                subscriptionCard(),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 20,
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
                bottom: 10.0,
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 16, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.network(
                            'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                            width: 80,
                            height: 80,
                          ),
                          Column(
                            children: [
                              Text("Title"),
                              Text("Title"),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text("Title"),
                          Text("Title"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
