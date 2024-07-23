import 'dart:convert';
import 'dart:developer';

import 'package:multikart/models/payment_method.dart';
import 'package:multikart/models/shipping_method.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;
import 'package:multikart/shopify/models/booking_model.dart';
import 'package:multikart/shopify/models/checkout_cart.dart';
import 'package:multikart/utilities/storage_utils.dart';
import 'package:multikart/views/checkout/payment/payment_webview_screen.dart';
import 'package:pay/pay.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../config.dart';
import 'package:http/http.dart' as http;

import '../../shopify/models/order/order.dart';

class PaymentController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final cartCtrl = Get.isRegistered<CartController>()
      ? Get.find<CartController>()
      : Get.put(CartController());
  late final Future<PaymentConfiguration> googlePayConfigFuture;

  String totalAmount = "0";
  bool seeAll = false;
  Address? address;
  int selectRadio = 0;
  int selectWallet = 0;
  String value = "";
  bool expand = false;
  int? tapped = 0;
  List<ShippingMethod> shippingMethod = [];
  TextEditingController txtCardName = TextEditingController();
  TextEditingController txtCardNo = TextEditingController();
  TextEditingController txtExpiryDate = TextEditingController();
  TextEditingController txtCVV = TextEditingController();
  final FocusNode cardNameFocus = FocusNode();
  final FocusNode cardNoFocus = FocusNode();
  final FocusNode expiryDateFocus = FocusNode();
  final FocusNode cVVFocus = FocusNode();
  String? orderNum;
  late final WebViewController controller;
  CheckoutCart? checkout;
  ShippingMethod? selectedShippingMethod;
  PaymentMethod? paymentMethod;

  String applePayConfig = '''{
  "provider": "apple_pay",
  "data": {
    "merchantIdentifier": "merchant.com.jainismcourse",
    "displayName": "Sam's Fish",
    "merchantCapabilities": ["3DS", "debit", "credit"],
    "supportedNetworks": ["amex", "visa", "discover", "masterCard"],
    "countryCode": "IN",
    "currencyCode": "INR",
    "requiredBillingContactFields": ["emailAddress", "name", "phoneNumber", "postalAddress"],
    "requiredShippingContactFields": [],
    "shippingMethods": []
  }
}''';

  //view payment detail tap
  callShippingMethod(address) async {
    if(shippingMethod.isEmpty) {
      if (cartCtrl.checkout == null) {
        CheckoutCart checkout =
        await shopifyService.addItemsToCart(cartCtrl, address);
        log("ADD ITEM RESPONSE : ${checkout.webUrl}");
        cartCtrl.checkout = checkout;
        cartCtrl.update();
        update();
        shippingMethod = await shopifyService.getShippingMethods(
            address: cartCtrl.address, checkoutId: cartCtrl.checkout!.id);
        Get.toNamed(routeName.shippingMethod);
      } else {
        shippingMethod = await shopifyService.getShippingMethods(
            address: cartCtrl.address, checkoutId: cartCtrl.checkout!.id);
        Get.toNamed(routeName.shippingMethod);
      }
    }else{
      Get.toNamed(routeName.shippingMethod);
    }

    // await Get.offAllNamed(routeName.checkoutwebview, arguments: {
    //   "url": checkout.webUrl,
    //   "token": getStorage(Session.authToken),
    //   "onFinish": (number) async {
    //     orderNum = number;
    //   },
    // });
  }

  @override
  void onReady() {
    // TODO: implement onReady


    googlePayConfigFuture =
        PaymentConfiguration.fromAsset('google_pay.json');
    update();
    super.onReady();
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;

    tapped = index;
    update();
  }

  //select address
  selectMethod( index) {
    selectRadio = index;

    update();
  }

  void onGooglePayResult(paymentResult) {
    debugPrint("GOOGLE PAY RESPONSE :: ${paymentResult.toString()}");
  }

  void onApplePayResult(paymentResult) {
    debugPrint("APPLE PAY RESPONSE :: ${paymentResult.toString()}");
    paymentMethod = PaymentMethod(
      id: "environment",
      title: 'Apple Pay',
      enabled: true,
    );
    update();
  }


  /// Get product detail with quantity in the current cart
  List getProductsInCart(CartController cartController) {
    var productList = [];
    for (var key in cartController.productsInCart.keys) {
      var productId = product_model.Product.cleanProductID(key);
      var product = cartController.getProductById(productId);

      if (product != null) {
        productList.add(
            {'id': key, 'product': product, 'quantity': cartController.productsInCart[key]});
      }
    }
    return productList;
  }



  placeOrder()async{
    final userCookie = getStorage(Session.authToken);
    await shopifyService.updateCheckout(
      checkoutId: cartCtrl.checkout!.id,
      note: "",
      deliveryDate: DateTime.now(),
    );


    Get.to(PaymentWebView(
      token: userCookie,
      onFinish: (number) async {
        // Success
        orderNum = number;
        log("orderNum : $orderNum");
        if (number == '0') {
          final order = await shopifyService.getLatestOrder();
          if (order != null) {
            for (var item in order.lineItems) {
              var product =
              cartCtrl.getProductById(item.productId!);
              log("product?.bookingInfo  : ${product?.bookingInfo }");
              if (product?.bookingInfo != null) {
                product!.bookingInfo!.idOrder = order.id;

              }
            }
          }
        }
      },
      onClose: () {
        // Check in case the payment is successful but the webview is still displayed, need to press the close button
        if (orderNum != '0') {
          debugPrint('Payment cancelled');
          return;
        }
      },
    ));
  }


}
