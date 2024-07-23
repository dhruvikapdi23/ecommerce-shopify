import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:multikart/models/discount.dart';
import 'package:multikart/shopify/mixin/cart_mixin.dart';
import 'package:multikart/shopify/mixin/local_mixin.dart';
import 'package:multikart/shopify/mixin/shopify_mixin.dart';
import 'package:multikart/shopify/models/address.dart';
import 'package:multikart/shopify/models/coupon.dart';
import 'package:multikart/shopify/models/product_variation.dart';
import 'package:multikart/utilities/storage_utils.dart';
import '../../config.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

import '../../shopify/tools/price_tool.dart';

class CartController extends GetxController
    with ShopifyMixin, CartMixin, LocalMixin {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  Address? address;
  final storage = GetStorage();
  bool isWallet = false;
  List<product_model.Product> similarList = [];
  int totalCartLength = 0;
  Coupon? coupon;

  @override
  void onReady() {
    // TODO: implement onReady

    getItemFromLocal();
    update();
    super.onReady();
  }

  //is product have variation
  bool _hasProductVariation(String id) =>
      productVariationInCart[id] != null &&
      productVariationInCart[id]!.price != null &&
      productVariationInCart[id]!.price!.isNotEmpty;

  //get total price
  double getProductPrice(id) {
    if (_hasProductVariation(id)) {
      return double.parse(productVariationInCart[id]!.price!) *
          productsInCart[id]!;
    } else {
      var productId = product_model.Product.cleanProductID(id);

      var price =
          PriceTools.getPriceProductValue(item[productId], onSale: true);
      if ((price?.isNotEmpty ?? false) && productsInCart[id] != null) {
        return double.parse(price!) * productsInCart[id]!;
      }
      return 0.0;
    }
  }


  /// Get productID from mix String productID-ProductVariantID+productAddonOptions
  static String cleanProductID(productString) {
    // In case 1234+https://somelink.com/might-have-dash-character-here
    if (productString.contains('-') && !productString.contains('+')) {
      return productString.split('-')[0].toString();
    } else if (productString.contains('+')) {
      // In case 1234-6789+https://someaddonsoption
      return cleanProductID(productString.split('+')[0].toString());
    } else {
      return productString.toString();
    }
  }

  //get item from local
  Future<void> getItemFromLocal() async {

    try {
      List? items = await getStorage(Session.cart);
      log('::::::::: Get Cart ITEM: ${items!.length}');
      if (items.isNotEmpty) {
        for (final item in items) {
          addProductToCart(
            product: product_model.Product.fromLocalJson(item['product']),
            quantity: item['quantity'],
            variation: item['variation'] != 'null'
                ? ProductVariation.fromLocalJson(item['variation'])
                : null,
            options: item['options'] ?? <String, dynamic>{},
            isSaveLocal: false,
            notify: () {},
          );

        }
        getSubTotal();
        update();
      }
    } catch (err) {
      log('::::::::: Get Cart In Local Error: $err');
    }
  }

  //add to cart
  void addToCard({
    context,
    product_model.Product? product,
    int? quantity = 1,
    ProductVariation? variation,
    isSaveLocal = true,
    Map<String?, String?>? mapAttribute,
  }) {
    if(variation!.inStock!) {
      var defaultVariation = variation;

      var key = product!.id.toString();
      log("defaultVariation :$defaultVariation");
      log("mapAttribute :$mapAttribute");
      item[key] = product;

      if (defaultVariation.id == null) {
        log("::: variations : ${product.variations!.map((element) =>
            element.toJson())}");
        defaultVariation = product.variations!.first;
        //defaultVariation = product.variations?.firstWhere((element) => (element.inStock ?? false));
      }

      key += '-${defaultVariation.id}';
      productVariationInCart[key] = defaultVariation;
      log("key : $key");
      log("productVariationInCart : $productVariationInCart");
      if (isSaveLocal) {
        saveCartToLocal(
          product: product,
          variation: variation,
          quantity: quantity,
          options: mapAttribute,
        );
      }

      var quantityOfProductInCart = productsInCart[key] ?? 0;
      log("quantityOfProductInCart : $quantityOfProductInCart");


      if (!productsInCart.containsKey(key)) {
        final stockQuantity = defaultVariation.stockQuantity ?? 0;

        if (quantityOfProductInCart == stockQuantity) {
          snackBar(CartFont().bagSavings.tr,context: context);
          return;
        } else {
          productsInCart[key] = quantity;
          snackBar(CartFont().productAdded.tr,context: context);
        }
      } else {
        final stockQuantity = defaultVariation.stockQuantity ?? 0;
        log("stockQuantity : $stockQuantity");
        if (quantityOfProductInCart == stockQuantity) {
          snackBar(CartFont().bagSavings.tr,context: context);
          return;
        }

        quantityOfProductInCart += quantity!;
        if (quantityOfProductInCart > stockQuantity) {
          quantityOfProductInCart = stockQuantity;
        }
        productsInCart[key] = quantityOfProductInCart;
        snackBar(CartFont().productUpdate.tr,context: context);
      }
    }else{
      snackBar(CartFont().productOutOfStock.tr,context: context);
    }
  }

  //remove from cart
  void removeToCart(product_model.Product? product,{key}) async {
    List? items = await getStorage(Session.cart);
    final isExistingStorage = items!
            .indexWhere((element) => element['product']['id'] == product!.id) !=
        -1;
    if (isExistingStorage) {
      items =
          items.where((item) => item!['product']['id'] != product!.id).toList();
      saveCart(items);
      getItemFromLocal();
      update();
    }
    if (productsInCart.containsKey(key)) {
      removeProductLocal(key);
      productsInCart.remove(key);
      productVariationInCart.remove(key);
    }
  }

  //save cart data in local
  Future saveCart(products) async {
    try {
      writeStorage(Session.cart, products);
    } catch (_) {}
  }

  //get subtotal of product
  double? getSubTotal() {
    return productsInCart.keys.fold(0.0, (sum, key) {
      if (productVariationInCart[key] != null &&
          productVariationInCart[key]!.price != null &&
          productVariationInCart[key]!.price!.isNotEmpty) {
        return (sum ?? 0) +
            double.parse(productVariationInCart[key]!.price!) *
                productsInCart[key]!;
      } else {
        var price = getPriceProductValue(item[key], onSale: true)!;
        if (price.isNotEmpty) {
          return (sum ?? 0) + double.parse(price) * productsInCart[key]!;
        }
        return sum;
      }
    });
  }

  //get regular price total
  double? getSubPriceTotal() {
    return productsInCart.keys.fold(0.0, (sum, key) {
      if (productVariationInCart[key] != null &&
          productVariationInCart[key]!.regularPrice != null) {
        return (sum ?? 0) +
            double.parse(productVariationInCart[key]!.regularPrice!) *
                productsInCart[key]!;
      } else {
        var price = getPriceProductValue(item[key], onSale: true)!;
        if (price.isNotEmpty) {
          return (sum ?? 0) + double.parse(price) * productsInCart[key]!;
        }
        return sum;
      }
    });
  }

  //get discount total
  double? getSubSaleTotal() {
    return (getSubPriceTotal()! - getSubTotal()!);
  }

//get price base on product
  String? getPriceProductValue(product_model.Product? product, {bool? onSale}) {
    try {
      String? price;
      if (onSale == true) {
        price = (isNotBlank(product!.salePrice)
            ? product.salePrice ?? '0'
            : product.price);
      } else {
        price = (isNotBlank(product!.regularPrice)
            ? product.regularPrice ?? '0'
            : product.price);
      }
      return price;
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
      return '';
    }
  }

  //common bottom sheet
  bottomSheetLayout(text, index,product,{keyVal}) {
    log("index : $index");
    log("product : $keyVal");
    Get.bottomSheet(
      CommonBottomSheet(
        text: text,
        index: index,
        product: product,
        keyVal: keyVal
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  //update quantity
  String updateQuantity(product_model.Product product, String key, int quantity, {context}) {
    if (productsInCart.containsKey(key)) {
      final productVariation = productVariationInCart[key]!;
      final stockQuantity = productVariation.stockQuantity ??
          product.stockQuantity;
      if (quantity == 0) {
        removeItemFromCart(key);
      } else {
        if (stockQuantity != null && quantity > stockQuantity) {
          //return 'You can only purchase ${product.maxQuantity} for this product';
          return 'The maximum quantity has been exceeded';
        }
        productsInCart[key] = quantity;
        updateQuantityCartLocal(key: key, quantity: quantity);
        onProductInCartChange();
        update();
      }

    }

    return '';
  }

  //remove item from cart
  void removeItemFromCart(String key) {
    if (productsInCart.containsKey(key)) {
      removeProductLocal(key);
      productsInCart.remove(key);
      productVariationInCart.remove(key);
    }
    update();
  }

  double getTotalAmount() {
    double? subtotal = getSubTotal() ?? 1;
    log("GETSUBTOTAL : $subtotal");

    if (coupon != null) {
      subtotal = checkout!.subtotalPrice ?? getSubTotal();
      log("GETSUBTOTAL1 : $subtotal");
    } else {
      subtotal = getSubTotal();
    }
    return subtotal!;
  }

  Future<void> removeCoupon() async {
    final newCheckout = await shopifyService.removeCoupon(checkout!.id);

    checkout = newCheckout;
    coupon = null;

    update();
  }

  @override
  Future<void> applyCouponList(
    context, {
    Coupon? coupons,
    String? code,
    Function? success,
    Function? error,
  }) async {
    try {
      final cartCtrl = Get.isRegistered<CartController>()
          ? Get.find<CartController>()
          : Get.put(CartController());
      final paymentCtrl = Get.isRegistered<PaymentController>()
          ? Get.find<PaymentController>()
          : Get.put(PaymentController());
      /* paymentCtrl.checkout =
          await shopifyService.addItemsToCart(cartCtrl, address);
*/

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

        cartCtrl.setCheckout(checkoutCoupon);
        cartCtrl.update();
        if (checkoutCoupon.coupon?.code == null) {
          final checkout =
              await shopifyService.removeCoupon(cartCtrl.checkout!.id);

          paymentCtrl.checkout = checkout;
          // error!(S.of(context).couponInvalid);
        }
        log("CHEC : ${checkoutCoupon.coupon}");
        success!(Discount(coupon: checkoutCoupon.coupon));
      }
    } catch (e) {
      error!(e.toString());
    }
  }

  void onProductInCartChange() {
    // If app success a coupon before
    // Need to apply again when any change in cart
    if (productsInCart.isEmpty) {
      removeCoupon();
      return;
    }
    final newData = jsonEncode(productsInCart);
    log("newData : $newData");
    if(coupon != null) {
      applyCouponList(
        Get.context!,
        coupons: coupon,
        code: coupon!.code,
        success: (Discount discount) async {
          log("DISCOUNT : $discount");
          log("DISCOUNT : ${discount.coupon}");
          log("DISCOUNT : ${discount.discountValue}");
          update();
        },
      );
    }
  }

}
