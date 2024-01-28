// // ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hookah_user/controller/payment_controller.dart';
// import 'package:upi_india/upi_india.dart';

// Widget displayUpiApps() {
//   final PaymentController paymentController = Get.put(PaymentController());

//   if (paymentController.apps == null)
//     return 
//     // Center(
//     //   child: Text(
//     //     "No apps found to handle transaction.",
//     //     // style: header,
//     //   ),
//     // );
//   Center(child: CircularProgressIndicator());
//   else if (paymentController.apps!.isEmpty)
//     return Center(
//       child: Text(
//         "No apps found to handle transaction.",
//         // style: header,
//       ),
//     );
//   else
//     return Align(
//       alignment: Alignment.topCenter,
//       child: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Wrap(
//           children: paymentController.apps!.map<Widget>((UpiApp app) {
//             return GestureDetector(
//               onTap: () async {
//                 paymentController.transaction =
//                     paymentController.initiateTransaction(app);
//                 // transaction = initiateTransaction(app);
//                 // setState(() {});
//               },
//               child: SizedBox(
//                 height: 100,
//                 width: 100,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     Image.memory(
//                       app.icon,
//                       height: 60,
//                       width: 60,
//                     ),
//                     Text(app.name),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
// }
