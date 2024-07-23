import 'dart:developer';

import 'package:multikart/models/product_shopify_model.dart';

import '../../utilities/general_utils.dart';

import '../models/product_addons.dart';

class PriceTools {
  static String? getVariantPriceProductValue(
    product, {
    bool? onSale,
    List<AddonsOption>? selectedOptions,
  }) {
    var price = double.tryParse('${onSale == true ? (isNotBlank(product.salePrice) ? product.salePrice : product.price) : product.price}') ?? 0.0;
    if (selectedOptions != null && selectedOptions.isNotEmpty) {
      price += selectedOptions.map((e) => double.tryParse(e.price ?? '0.0') ?? 0.0).reduce((a, b) => a + b);
    }
    return price.toString();
  }

  static String? getPriceProduct(product, {bool? onSale}) {
    var price = getPriceProductValue(product, onSale: onSale);

    if (price == null || price == '') {
      return '';
    }
    return price.toString();
  }

  static String? getPriceProductValue(Product? product, {bool? onSale}) {
    try {
      var price = onSale == true ? (isNotBlank(product!.salePrice) ? product.salePrice ?? '0' : product.price) : (isNotBlank(product!.regularPrice) ? product.regularPrice ?? '0' : product.price);
      return price;
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
      return '';
    }
  }
}
