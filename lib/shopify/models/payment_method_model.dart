// import 'package:flutter/material.dart';
// import 'package:multikart/config.dart';
// import 'package:multikart/shopify/mixin/shopify_mixin.dart';

// class AddressListController extends GetxController with ShopifyMixin {
//   late List<PaymentMethod> paymentMethods;
//   bool isLoading = true;
//   String? message;

//   Future<void> getPaymentMethods(
//       {CartModel? cartModel,
//       ShippingMethod? shippingMethod,
//       String? token,
//       required String? langCode}) async {
//     try {
//       List data = await shopifyService.customerAddress();

//       paymentMethods = await _service.api.getPaymentMethods(
//           cartModel: cartModel,
//           shippingMethod: shippingMethod,
//           token: token,
//           langCode: langCode)!;
//       isLoading = false;
//       message = null;
//       update();
//     } catch (err) {
//       isLoading = false;
//       message =
//           'There is an issue with the app during request the data, please contact admin for fixing the issues $err';
//       update();
//     }
//   }
// }
