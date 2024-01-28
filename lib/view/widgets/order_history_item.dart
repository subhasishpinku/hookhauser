// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/orderhistory_controller.dart';
import 'package:html/parser.dart';

class OrderHistoryItem extends StatelessWidget {
  final OrderHistoryController orderHistoryController =
      Get.put(OrderHistoryController());

  final String slug;
  final String name;
  final String price;
  String shortDescription;
  final String image;
  final String status;
  final String discount;
  OrderHistoryItem(this.slug, this.name, this.price, this.shortDescription,
      this.image, this.status, this.discount,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var doc = parse(shortDescription);
    if (doc.documentElement != null) {
      shortDescription = doc.documentElement!.text;
      print("shortDescription" + shortDescription);
      //output without space: HelloThis is fluttercampus.com,Bye!
    }
    return Container(
      height: 350,
      margin: const EdgeInsets.all(10),
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover))),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(slug,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  // Text(orderHistoryController.orderhistory['list'][i]['name'],
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text(name, style: TextStyle(fontSize: 15)),
                  Text("Price: " + '₹' + price),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Discount: " + '₹' + discount),
                ],
              ),
              Row(children: [
                if (status == "inprogress") ...[
                  Text(status),
                  SizedBox(width: 4),
                  CircleAvatar(
                      radius: 8, child: Icon(Icons.autorenew, size: 12)),
                ] else ...[
                  Text(status),
                  SizedBox(width: 4),
                  CircleAvatar(radius: 8, child: Icon(Icons.check, size: 12))
                ]
              ]),
            ],
          ),
          const Divider(color: Colors.black, thickness: .5, indent: 10),
          Text(shortDescription),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Rating'),
                  SizedBox(width: 10),
                  RatingBar.builder(
                    itemSize: 24,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('REORDER'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
