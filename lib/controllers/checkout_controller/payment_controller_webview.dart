import 'dart:developer';

import 'package:multikart/shopify/mixin/cart_mixin.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/order/order.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../config.dart';

class WebViewPaymentController extends GetxController with ShopifyMixin, CartMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final cartCtrl = Get.isRegistered<CartController>()
      ? Get.find<CartController>()
      : Get.put(CartController());

  late final WebViewController controller;

  @override
  void onInit() {
    // TODO: implement onInit
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(Get.arguments['url']))
      ..setNavigationDelegate(
          NavigationDelegate(onNavigationRequest: (NavigationRequest request) {
        return NavigationDecision.navigate;
      }, onPageFinished: (url) {
        controller.goBack();

        if (url.contains("thank-you")) {
          controller.goBack();
          controller.goBack();
          controller.goBack();
          Get.back();
          Get.back();
          Get.back();
          handleUrlChanged(url);
        }
      }));
    update();
    super.onInit();
  }

  // on order success navigate to order success page
  successNavigation({number}) async {
    cartCtrl.clearCartLocal();
    cartCtrl.update();
productsInCart.clear();
    appCtrl.update();
    Get.forceAppUpdate();
    Order? order = await shopifyService.getLatestOrder();
    log("order : $order");
    await Future.delayed(DurationClass.s1);
    Get.offNamed(routeName.orderSuccess, arguments: order);

    update();
  }

  void handleUrlChanged(String url) {
    log("url : $url");
    if (url.contains('/order-received/')) {
      final items = url.split('/order-received/');
      if (items.length > 1) {
        final number = items[1].split('/').last;
        log("number : $number");
        successNavigation();
      }
    }

    if (url.contains('checkout/success')) {
      successNavigation();
    }

    // shopify url final checkout
    if (url.contains('thank-you')) {
      if (url.isNotEmpty) {
        final items = url.split('/thank-you');
        log("items : $items");
        final number = items[0].split('/').last;
        log("number1 : $number");
        successNavigation(number: number);
      }
    }

    if (url.contains('/member-login/')) {
      log("order-login/");
      Get.back();
    }

    /// BigCommerce.
    if (url.contains('/checkout/order-confirmation')) {
      log("order-confirmation/");
      Get.back();
    }
  }
}
