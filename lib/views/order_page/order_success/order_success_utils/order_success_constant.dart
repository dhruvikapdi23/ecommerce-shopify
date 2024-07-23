import 'package:get/get.dart';

class OrderSuccessFont {
  String orderPlaced = "orderPlaced".tr;
  String orderSuccess = "orderSuccess".tr;
  String orderDesc = "orderDesc".tr;
  String orderDetail = "orderDetail".tr;

  String yourOrder(val) =>
      "yourOrder".trParams({'orderNumber': val});
  String orderInfo = "orderInfo".tr;
  String orderShipped = "orderShipped".tr;
  String orderShippedAddress = "orderShippedAddress".tr;
  String paymentMethod = "paymentMethod".tr;
  String googleApi = "googleApi".tr;
  String orderSummary = "orderSummary".tr;
  String trackOrder = "trackOrder".tr;
  String continueShopping = "continueShopping".tr;
}
