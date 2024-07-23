import 'dart:developer';

import 'package:multikart/shopify/models/checkout_cart.dart';
import 'package:multikart/shopify/models/product_variation.dart';
import 'package:multikart/shopify/models/user.dart';
import 'package:multikart/models/product_shopify_model.dart' as product_model;

import '../models/product_addons.dart';
import '../tools/price_tool.dart';

mixin CartMixin {
  User? user;
  CheckoutCart? checkout;

  final Map<String?, product_model.Product?> item = {};
  final Map<String, ProductVariation?> productVariationInCart = {};
  final Map<String, int?> productsInCart = {};
  final Map<String, dynamic> productsMetaDataInCart = {};

  int get totalCartQuantity => productsInCart.values.fold(0, (v, e) => v + e!);

  void setUser(data) {
    log("::: setUser : ${data.toString()}");
    user = data;
  }

  void setCheckout(value) {
    checkout = value;
  }

  product_model.Product? getProductById(String id) {
    return item[id];
  }

  ProductVariation? getProductVariationById(String key) {
    return productVariationInCart[key];
  }

  String? getPriceItemInCart(
      product_model.Product product, ProductVariation? variation,
      {List<AddonsOption>? selectedOptions}) {
    return variation != null && variation.id != null
        ? PriceTools.getVariantPriceProductValue(
            variation,
            onSale: true,
            selectedOptions: selectedOptions,
          )
        : PriceTools.getPriceProduct(product, onSale: true);
  }
}
