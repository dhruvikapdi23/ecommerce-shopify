import 'package:multikart/shopify/models/order/order.dart';

import '../../config.dart';

class OrderDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();

  Order? orderHistoryList;

  @override
  void onReady() {
    // TODO: implement onReady
    orderHistoryList = Get.arguments;
    update();
    super.onReady();
  }
}
