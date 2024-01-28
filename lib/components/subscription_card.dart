import 'package:flutter/material.dart';

Widget subscriptionCard() {
  return Container(
    // color: Colors.black,
    height: 220,
    width: 180,
    // padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
    child: Card(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            leading: Image.network(
                'https://images.pexels.com/photos/1047319/pexels-photo-1047319.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            title: Text(
              "₹ 40000",
              style: TextStyle(fontSize: 14),
            ),
            subtitle: Text("Monthly", style: TextStyle(fontSize: 10)),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              "Title Title Title Title TitleTitleTitleTitle",
              style: TextStyle(
                fontSize: 12,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            leading: Text("20"),
            title: Text(
              "Days",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            subtitle: Text(
              "Remain",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
