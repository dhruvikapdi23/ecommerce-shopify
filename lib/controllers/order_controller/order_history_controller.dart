import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/order/order.dart';

import '../../config.dart';

class OrderHistoryController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  List<Order> orderHistoryList = [];
  List orderType = [];
  List timeFilterType = [];
  int orderTypeValue = 0;
  int timeFilterTypeValue = 0;

  @override
  void onReady() {
    // TODO: implement onReady

    appCtrl.isShimmer = true;
    getOrderHistory();
    // orderHistoryList = orderHistory;
    orderType = AppArray().orderType;
    timeFilterType = AppArray().timeFilterType;
    update();
    super.onReady();
  }

  getOrderHistory() async {
    List<Order> data = await shopifyService.getMyOrders();
    orderHistoryList = data;
    appCtrl.isShimmer = false;
    update();
  }

  //common bottom sheet
  bottomSheetLayout() {
    Get.bottomSheet(
      const RatingReview(),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  //order history filter bottom sheet
  historyFilterBottomSheet() {
    Get.bottomSheet(
      const OrderHistoryFilter(),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }
}
