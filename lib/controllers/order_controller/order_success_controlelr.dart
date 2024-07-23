import 'package:multikart/shopify/models/order/order.dart';

import '../../config.dart';

class OrderSuccessController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  Order? order;

  String totalAmount = "0";

  @override
  void onReady() {
    // TODO: implement onReady
    order = Get.arguments;
    update();
    super.onReady();
  }
}
