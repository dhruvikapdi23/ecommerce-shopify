import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:multikart/models/discount.dart';
import 'package:multikart/shopify/mixin/cart_mixin.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/utilities/storage_utils.dart';
import 'package:multikart/views/pages/coupons/coupons.dart';
import '../../config.dart';
import '../../shopify/models/checkout_shopify.dart';
import '../../shopify/models/user.dart';

class CouponsController extends GetxController with ShopifyMixin, CartMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  CartModel? cartModelList;
  String totalAmount = "0";
  Address? address;
  List<CouponModel>? couponList = [];
  List discountCodeList = [];
  bool isLoading = false;

  @override
  void onReady() {
    // TODO: implement onReady.
    cartModelList = cartList;
    // couponList = couponsList;
    fetchCountryAndState();
    update();
    super.onReady();
  }

  //fetch country and state
  fetchCountryAndState() async {
    http.get(
        Uri.parse(
            "${environment["serverConfig"]["domain"]}admin/api/2023-07/price_rules.json"),
        headers: {
          "X-Shopify-Access-Token": environment["serverConfig"]
              ["adminAccessToken"]
        }).then((http.Response response) {
      final jsonResponse = json.decode(response.body);
      log("RESPONSE : ${jsonResponse}");
      List priceRuleList = jsonResponse["price_rules"];
      priceRuleList.asMap().entries.forEach((element) {
        log("PRICE : 1406978031912");
        http.get(
            Uri.parse(
                "${environment["serverConfig"]["domain"]}admin/api/2023-07/price_rules/${element.value["id"]}/discount_codes.json"),
            headers: {
              "X-Shopify-Access-Token": environment["serverConfig"]
                  ["adminAccessToken"]
            }).then((http.Response response) {
          final Map<String, dynamic> couponJsonResponse =
              json.decode(response.body);
          log("COU   : ${couponJsonResponse["discount_codes"]}");
          log("COU   : $couponJsonResponse");
          var data = {
            "title": element.value["title"],
            "code": couponJsonResponse["discount_codes"][0]["code"],
            "description": ""
          };
          couponList!.add(CouponModel.fromJson(data));

          update();
        });
      });
      update();
    });
    log("couponList : $couponList");
    update();
  }

  @override
  Future<void> applyCouponList(
    context, {
    CouponModel? coupons,
    String? code,
    Function? success,
    Function? error,
  }) async {
    isLoading = true;
    update();
    try {
      final cartCtrl = Get.isRegistered<CartController>()
          ? Get.find<CartController>()
          : Get.put(CartController());
      final paymentCtrl = Get.isRegistered<PaymentController>()
          ? Get.find<PaymentController>()
          : Get.put(PaymentController());

      var isExisted = false;

      if (cartCtrl.checkout != null && cartCtrl.checkout!.id != null) {
        isExisted = true;
      }

      print("CODE : ${isExisted}");

      final userCookie = getStorage(Session.authToken);

      var checkout = isExisted
          ? await shopifyService.updateItemsToCart(
              cartCtrl, userCookie, paymentCtrl.address)
          : await shopifyService.addItemsToCart(cartCtrl, paymentCtrl.address);

      cartCtrl.checkout = checkout;
      paymentCtrl.checkout = checkout;
      cartCtrl.update();
      paymentCtrl.update();

      print("checkout11 ${cartCtrl.checkout!.id}");

      if (checkout != null) {
        /// apply coupon code
        ///
        var checkoutCoupon =
            await shopifyService.applyCoupon(cartCtrl, code!.toUpperCase());

        print("checkout22 ${checkoutCoupon}");

        paymentCtrl.checkout = checkoutCoupon;
        cartCtrl.checkout = checkoutCoupon;
        cartCtrl.update();
        paymentCtrl.update();
        if (checkoutCoupon.coupon?.code == null) {
          final checkout =
              await shopifyService.removeCoupon(cartCtrl.checkout!.id);

          paymentCtrl.checkout = checkout;
          cartCtrl.checkout = checkout;
          log("CHECKOUR : ${cartCtrl.checkout}");
          cartCtrl.update();
          paymentCtrl.update();
          // error!(S.of(context).couponInvalid);
        }
        isLoading = false;
        update();

        success!(Discount(coupon: checkoutCoupon.coupon));
      }
    } catch (e) {
      isLoading = false;
      update();
      error!(e.toString());
    }
  }
}
