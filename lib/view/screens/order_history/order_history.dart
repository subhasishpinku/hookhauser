import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hookah_user/controller/orderhistory_controller.dart';
import 'package:hookah_user/utils/constants/constants.dart';
import 'package:hookah_user/view/widgets/order_history_item.dart';

class OrderHistory extends StatelessWidget {
  final OrderHistoryController orderHistoryController =
      Get.find<OrderHistoryController>();
  OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order History'),
        ),
        body: ListView.separated(
            itemBuilder: (context, i) {
              print("shfdkjsf ${orderHistoryController.orderhistory.length}");
              return OrderHistoryItem(
                orderHistoryController.orderhistory['list'][i]['slug'],
                orderHistoryController.orderhistory['list'][i]['name'],
                orderHistoryController.orderhistory['list'][i]['price'],
                orderHistoryController.orderhistory['list'][i]
                    ['shortDescription'],
                productImageUrl +
                    orderHistoryController.orderhistory['list'][i]['image']
                        .split(",")
                        .first,
                orderHistoryController.orderhistory['list'][i]['status'],
                orderHistoryController.orderhistory['list'][i]['discount']
                    .toString(),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
            itemCount: orderHistoryController.orderhistory.length));
  }
}
