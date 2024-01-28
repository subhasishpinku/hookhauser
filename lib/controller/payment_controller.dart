
import 'package:get/get.dart';
import 'package:upi_india/upi_india.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PaymentController extends GetxController {
  // final UpiIndia upiIndia = UpiIndia();
  // Future<UpiResponse>? transaction;

  // List<UpiApp>? apps;

  // Future<UpiResponse> initiateTransaction(UpiApp app) async {
  //   // UpiResponse upiResponse;
  //   // try {
  //     return await upiIndia.startTransaction(
  //       app: app,
  //       receiverUpiId: "rishab@oksbi",
  //       // receiverUpiId: "iamabhi1990-3@okicici",
  //       receiverName: 'Abhishek Bhattacharjee',
  //       transactionRefId: 'TestingUpiIndiaPlugin',
  //       transactionNote: 'Not actual. Just an example.',
  //       amount: 1.00, //TODO: Change to dynamic
  //     );
  //   // } catch (e) {
  //   //   Fluttertoast.showToast(msg: "Failed to initiate transaction");
  //   // }
  // }

  // String upiErrorHandler(error) {
  //   switch (error) {
  //     case UpiIndiaAppNotInstalledException:
  //       return 'Requested app not installed on device';
  //     case UpiIndiaUserCancelledException:
  //       return 'You cancelled the transaction';
  //     case UpiIndiaNullResponseException:
  //       return 'Requested app didn\'t return any response';
  //     case UpiIndiaInvalidParametersException:
  //       return 'Requested app cannot handle the transaction';
  //     default:
  //       return 'An Unknown error has occurred';
  //   }
  // }

  // void checkTxnStatus(String status) {
  //   switch (status) {
  //     case UpiPaymentStatus.SUCCESS:
  //       print('Transaction Successful');
  //       break;
  //     case UpiPaymentStatus.SUBMITTED:
  //       print('Transaction Submitted');
  //       break;
  //     case UpiPaymentStatus.FAILURE:
  //       print('Transaction Failed');
  //       break;
  //     default:
  //       print('Received an Unknown transaction status');
  //   }
  // }

  // Future makePayment() async {
  //   try {
  //     final res = await EasyUpiPaymentPlatform.instance.startPayment(
  //       EasyUpiPaymentModel(
  //         payeeVpa: 'rishabdhar12@oksbi',
  //         payeeName: 'Rishab Dhar',
  //         amount: 1.00,
  //         description: 'Book my smoke',
  //       ),
  //     );
  //     // TODO: add your success logic here
  //     print(res);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future makePayment1() async {
    try {
      await http.post(Uri.parse(
          "https://ptprashanttripathi.github.io/linkpe/?pa=rishabdhar12@oksbi&pn=Rishab Dhar&amt=1.00"));
    } catch (e) {
      print(e);
    }
  }

   launchURL() async {
    var url = "https://ptprashanttripathi.github.io/linkpe/?pa=rishabdhar12@oksbi&pn=Rishab Dhar&amt=1.00";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  // "upi://pay?pa=xxxxx@upi&pn=payee&am=5.00&tn=Test_Transaction"
}
