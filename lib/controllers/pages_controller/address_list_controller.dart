

import 'dart:developer';

import 'package:multikart/config.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:http/http.dart' as http;
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/shopify/models/checkout_cart.dart';
import 'package:multikart/utilities/storage_utils.dart';

class AddressListController extends GetxController with ShopifyMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final cartCtrl = Get.isRegistered<CartController>()
      ? Get.find<CartController>()
      : Get.put(CartController());

  int selectRadio = 0;
  List<Address>? deliveryDetail;
  String? userId;
  String totalAmount = "0";
  String? orderNum;

  //get customer address
  void customerAddress() async {
    appCtrl.isShimmer = true;
    deliveryDetail = [];
    List<Address>? data = await shopifyService.customerAddress();
    deliveryDetail = data;
    userId = getStorage(Session.userInfo)['id'];
    appCtrl.isShimmer = false;
    update();
  }

  //select address tap
  selectAddress(val, index) {
    selectRadio = index;
    update();
  }

  //delete address api function
  deleteAddressApi(value) {
    http.delete(
        Uri.parse(
            "${environment["serverConfig"]["domain"]}admin/api/2023-01/customers/$userId/addresses/${deliveryDetail![value].id}.json"),
        headers: {
          "X-Shopify-Access-Token": environment["serverConfig"]["adminAccessToken"]
        }).then((http.Response response) {
      // snackBar(DeliveryDetailFont().addressDelete.tr);
      update();
      customerAddress();
    });
  }

  //add item to cart and go to checkout
  callShippingMethod() async {
  /*  CheckoutCart checkout = await shopifyService.addItemsToCart(
        cartCtrl, deliveryDetail![selectRadio]);

    await Get.offNamed(routeName.checkoutwebview, arguments: {
      "url": checkout.webUrl,
      "token": getStorage(Session.authToken),
      "onFinish": (number) async {
        orderNum = number;
      },
    });*/
  }

  @override
  void onReady() {
    // TODO: implement onReady
    customerAddress();
    update();
    super.onReady();
  }
}
