// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hookah_user/components/transaction_data.dart';
// import 'package:hookah_user/controller/payment_controller.dart';
// import 'package:upi_india/upi_india.dart';

// class PaymentStatus extends StatelessWidget {

//   final PaymentController paymentController = Get.put(PaymentController());

//   PaymentStatus({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Payment Status',
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 8, right: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           // mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 60,
//             ),
//             Center(
//               child: SizedBox(
//                 height: 300,
//                 width: 300,
//                 child: Card(
//                   elevation: 10,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Image.asset(
//                     'images/payment_successful.png',
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               "Thank You For Choosing Us",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w800,
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             const Text(
//               "Your order is confirmed",
//               style: TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//             Expanded(
//               child: FutureBuilder(
//                 future: paymentController.transaction,
//                 builder: (BuildContext context,
//                     AsyncSnapshot<UpiResponse> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     if (snapshot.hasError) {
//                       return Center(
//                         child: Text(
//                           paymentController.upiErrorHandler(snapshot.error.runtimeType),
//                         ), 
//                       );
//                     }

//                     UpiResponse _upiResponse = snapshot.data!;

//                     String txnId = _upiResponse.transactionId ?? 'N/A';
//                     String resCode = _upiResponse.responseCode ?? 'N/A';
//                     String txnRef = _upiResponse.transactionRefId ?? 'N/A';
//                     String status = _upiResponse.status ?? 'N/A';
//                     String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
//                     // paymentController.checkTxnStatus(status);

//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           displayTransactionData('Transaction Id', txnId),
//                           displayTransactionData('Response Code', resCode),
//                           displayTransactionData('Reference Id', txnRef),
//                           displayTransactionData(
//                               'Status', status.toUpperCase()),
//                           displayTransactionData('Approval No', approvalRef),
//                         ],
//                       ),
//                     );
//                   } else {
//                     return Center(
//                       child: Text(''),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
