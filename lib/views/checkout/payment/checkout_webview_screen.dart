import 'package:multikart/config.dart';
import 'package:multikart/controllers/checkout_controller/payment_controller_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CheckoutWebView extends StatefulWidget {
  const CheckoutWebView({Key? key}) : super(key: key);

  @override
  State<CheckoutWebView> createState() => CheckoutWebViewState();
}

Map<dynamic, dynamic>? getPaymentUrl(context) => null;

class CheckoutWebViewState extends State<CheckoutWebView> {
  final paymentCtrl = Get.put(WebViewPaymentController());
  String? url;
  Function? onFinish;
  Function? onClose;
  String? token;
  int selectedIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return true;
        },
        child:
            Scaffold(body: WebViewWidget(controller: paymentCtrl.controller)));
  }
}
